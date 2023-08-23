library KenyaEMRTXCURR version '0.1.0'

// Test cases are located in /input/tests/<Library Name>/<Patient.id>/<bundle source>

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include KenyaEMRConcepts called Cx
include KenyaEMRStratifiers called Stratifiers


// Provide a default interval or period-based tests will fail when evaluating CQL against test cases
// Need DateTime eg @2014-01-25T not Date, eg not this: @2014-01-25
// The $evaluate-measure operation's parameters 'periodStart' and 'periodEnd' override this in any case
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T, @2023-12-31T]


// Start with the patient and traverse their clinical resources
context Patient


define "End Measurement Period": end of "Measurement Period"

/*
On ART is any patient with a regimen history as below:

Patients started on ART drugs (participating in program)
who made a clinic visit during the reporting period

PLUS

Patient who made a clinic visit in the past and were given medicine to last the reporting 
period and beyond

PLUS

Patients who missed their appointment AND 30 days (one month) have not passed since the last missed appointment.
[30 days since last missed appointment]

Exclude those who interrupted treatment for any reason, etc, etc. "Measure Population Exclusion"
*/


// Data elements

/*
PLHIV are enrolled in an HIV program.
On Observation resource: $CIEL#160540 "Method of enrollment"
On Observation.value.coding: $CIEL#160542 "Outpatient department"
Observation.status is not in example bundle, can't do 'Obs.status in {'final', 'amended', 'corrected'}'
Note that the CQL is using the CIEL codes only, even if others are provided.
From the CQL docs: we use the equivalent operator (~) rather than equality (=). 
For codes, equivalence tests only that the code system and code are the same, but does not check the code system version.
*/


// Todo: This requires a valueset
define "PLHIV Observation":
  ["Observation": Cx."Method of enrollment"] Obs
    where (Obs.value ~ Cx."Outpatient department")
    // or Obs.value ~ Cx."Institutional entry point HIV treatment"
    and (Obs.effective before end of "Measurement Period")


// 'exists' keyword evaluates result as boolean or null (unknown)
define "PLHIV Boolean": exists "PLHIV Observation"


// Initial Population: Patients who are not deceased and have started on ART drugs (participating in program).

define "Initial Population": 
  "PLHIV Boolean"
    // and ("Deceased DateTime Only" is null or "Deceased DateTime Only" is false)



// Patients started on ART drugs (participating in program)
// who made a clinic visit during the reporting period (Q: Any type?)
// Todo: just clinic visits associated with HIV, need a new VS/code for this


// "RETURN VISIT DATE"

// return visit during period
// uses effectivedatetime
// the other datetime fields are not used
define "Return Visits During Period":
  ["Observation": Cx."RETURN VISIT DATE"] Obs
  // where (Obs.effective.value during "Measurement Period" or Obs.effective.value after "Measurement Period")
  where (Obs.effective.value during "Measurement Period")


define "Any Return Visit During Period": 
  exists "Return Visits During Period"


define "Last Return Visit During Period": 
  Last("Return Visits During Period")



// "CURRENT DRUGS USED" are prescriptions
// effectivedatetime captures when those drugs started
// the other datetime fields are not used


define "Drugs Visit During Period":
  ["Observation": Cx."CURRENT DRUGS USED"] Obs
    where (Obs.effective during "Measurement Period")
    // Todo:
    // this is needed but will not evaluate if system is missing
    // and singleton from {Obs.value.coding in Cx."CIELHIVMedications"}


define "Drugs Visit During Period Boolean": exists "Drugs Visit During Period"


// Observations for drugs where issuedDateTime is during measurement period
define "Drugs During Period":
  ["Observation": Cx."CURRENT DRUGS USED"] Obs
    where (Obs.effective during "Measurement Period")
    // this is needed but will not evaluate if system is missing
    // and singleton from {Obs.value.coding in Cx."CIELHIVMedications"}


// Sort and take get the last one
define "Drugs Effective":
  Last("Drugs During Period" Obs
    sort by effective.value
  )

    

/*
Additional notes:
The assumption is that a patient is considered to be on a particular regimen until there is a change, substitution, or stop events.
Drugs are prescribed and noted in an Observation.
The actual drugs are coded concepts in Observation.value.coding but are missing a system identifier.
The return dates are appointment dates for when the prescription ends and the patient is expected to return.
The EMR does not use a pharmacy module, and is reliant on appointment dates (return dates) which are based on the amount of drugs given.
The drugs observation tells when a patient was first started on drugs. 
'current drugs' concept captures regimen changes
more of a history of regimen of original and most current - there may be original and current regimen
bundle includes original regimen

Fix coming: The code in KenyaEMR doesn't include a system identifier. CQL requires this. 
*/

// Patient who made a clinic visit in the past and were given medicine to last the reporting period and beyond

/*
Expressions give that drug start and stop, then use to create an interval
last to get max or if multiple use aggregate clause of a query to sort them and turn into intervals by taking the next
define DrugStart: [Observation: ATRDrug].single().value as DateTime
define DrugStop: [Observation: ATRDrugStop].single().value as DateTime
define DrugInterval: Interval[DrugStart, DrugStop]
*/


// Revisit this. This may work for other systems.
// Indicate whether patient started on drugs or not.
// enroll in HIV, but not started on drugs yet
// current drugs used: this captures that they are on art, switches drugs, substitutions
// current drugs used does not capture dispense
// appointment captures when drugs scrip ends

define "DrugStart":
  Last(["Observation": Cx."CURRENT DRUGS USED"] Obs
    where (Obs.effective during "Measurement Period" or Obs.effective before "Measurement Period")
    // todo:
    // this is needed but will not evaluate if system is missing
    // and singleton from Obs.value.coding in Cx."CIELHIVMedications" 
    return Obs.effective.value
    )


define "DrugStop":
  Last(["Observation": Cx."RETURN VISIT DATE"] Obs
    return Obs.effective.value
    )


define "DrugInterval": Interval[DrugStart, DrugStop]


// Patient who made a clinic visit in the past and were given medicine to last the reporting period and beyond
// keyword is 'and beyond'. 
// Todo: How long after measurement period does the return date count?


define "Interval Hack": Interval["End Measurement Period", "End Measurement Period"]


// Interval must overlap with END of the period
define "Last Return": "DrugInterval" overlaps ("Interval Hack")


define "Measure Population": 
  "Last Return" is true
  or "Drugs Visit During Period Boolean" is true
  or "Any Return Visit During Period" is true



// Todo:
// 30 days (one month) have not passed since the last missed appointment. (Q: How is this coded?)


// Measure Population Exclusion
// Deceased
// Exclude those who interrupted treatment for any reason, etc, etc.
// Exclude those who interrupted treatment for any reason, etc, etc. "Measure Population Exclusion"


/*
Deceased patients are not in numerator.
In FHIR, deceased[x] is a choice type, of either boolean or datetime.
It also has a cardinality of 0..1. meaning that deceasedBoolean and deceasedDateTime cannot coexist.
There can only be one deceased[x] element.
If true is used, there's no way to know from that field when the patient died. DateTime is better for accuracy.
*/


// This expression allows deceasedBoolean which has no datetime.
define "Deceased Boolean":
  Patient.deceased is not null 
  and (Patient.deceased is true or Patient.deceased on or before "End Measurement Period")


// This expression requires patients to have datetime on Patient.deceased (more accurate).
define "Deceased DateTime Only":
  Patient.deceased is not null 
  and Patient.deceased on or before end of "Measurement Period"



// Todo: double check
// "effectiveDateTime": "2023-05-31T11:30:14+03:00",
define "Discontinuation":
  ["Observation": Cx."Reason for discontinuation of program"] Obs
  where (Obs.effective during "Measurement Period" or Obs.effective before "Measurement Period")


define "Discontinuation Boolean": exists "Discontinuation"


// Todo
define "Measure Population Exclusion": 
  "Discontinuation Boolean"
  or ("Deceased Boolean" is true or "Deceased DateTime Only" is true)




// Stratifiers


// should work without #location
// how to clean it up with identifier[].extension[]
define "OpenMRS Location":
  [Patient] P
    // this url is in the ig, but is not correct: 'http://fhir.openmrs.org/core/StructureDefinition/omrs-patient-identifier-location'}
    where singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier'}
    or singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier#location'}
    or singleton from {P.identifier.extension[1].url ~ 'http://fhir.openmrs.org/ext/patient/identifier'}
    or singleton from {P.identifier.extension[1].url ~ 'http://fhir.openmrs.org/ext/patient/identifier#location'}
    return singleton from {P.identifier.extension[0].value.reference.value}


// todo: debugging needed on location

define "Stratification": 
  Stratifiers."Age Group/Sex/Location TXCURR"


define "Stratifier": "Stratification"

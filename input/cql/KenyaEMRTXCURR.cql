library KenyaEMRTXCURR version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include MERConcepts called Cx
include MERStratifiers called MERStratifiers


// For testing. Provide a default interval or period-based tests will fail when evaluating CQL against test cases
// need DateTime eg @2014-01-25T not Date, eg not this: @2014-01-25
// The $evaluate-measure operation's parameters 'periodStart' and 'periodEnd' override this in any case
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T, @2023-12-31T]


// start with the patient and traverse to their clinical resources
context Patient


// Initial Population

/*
Approach by the source system:
PLHIV are enrolled in an HIV program.
On Observation resource: $CIEL#160540 "Method of enrollment"
On Observation.value.coding: $CIEL#160542 "Outpatient department"
Observation.status is not in example bundle, e.g. Obs.status in {'final', 'amended', 'corrected'}
*/

/*
Devs:
'exists' keyword evaluates result as boolean or null (unknown)
From the CQL docs: we use the equivalent operator (~) rather than equality (=). 
For codes, equivalence tests only that the code system and code are the same, but does not check the code system version.
todo: singleton doesn't work with Obs.value.coding
*/

define "PLHIV Observation":
  ["Observation": Cx."Method of enrollment"] Obs
    where Obs.value.coding[0] ~ Cx."Outpatient department"
    or Obs.value.coding[1] ~ Cx."Outpatient department"
    and (Obs.effective.value during "Measurement Period" or Obs.effective before "Measurement Period")


define "PLHIV Boolean": exists "PLHIV Observation"


define "Initial Population": "PLHIV Boolean"


// Measure Population Exclusion

/*
Deceased patients are not in numerator.
Deceased is unknown when not indicated on Patient.deceased.
If Patient.deceased has a value, then check whether deceased before end of period.
Null (unknown) is returned if the field doesn't exist (patient assumed to be alive in source.)
*/

define "Deceased":
  Patient.deceased is not null 
  and (Patient.deceased is true or Patient.deceased before end of "Measurement Period")


define "Measure Population Exclusion": "Deceased"


// Measure Population

/*
Approach by the source system:
The assumption is that a patient is considered to be on a particular regimen until there is a change, substitution, or stop events.
Drugs are prescribed and noted in an Observation.
The actual drugs are coded concepts in Observation.value.coding but are missing a system identifier.
The return dates are appointment dates for when the prescription ends and the patient is expected to return.
The EMR does not use a pharmacy module, and is reliant on appointment dates (return dates) which are based on the amount of drugs given.
The drugs observation tells when a patient was first started on drugs. 
*/


/*
Devs:
On return visits: use effectiveDateTime or valueDateTime?
if there's an appointment date after when??
Fix coming: The code in KenyaEMR doesn't include a system identifier. CQL requires this. 
obs mean start, stop, you can write expressions give that drug start and stop, then use to create an interval
last to get max or if multiple use aggregate clause of a query to sort them and turn into intervals by taking the next
define DrugStart: [Observation: ATRDrug].single().value as DateTime
define DrugStop: [Observation: ATRDrugStop].single().value as DateTime
define DrugInterval: Interval[DrugStart, DrugStop]
*/


define "DrugStart":
  Last(["Observation": Cx."CURRENT DRUGS USED"] Obs
    where singleton from Obs.value.coding in Cx."CIELHIVMedications" 
    and (Obs.effective.value during "Measurement Period" or Obs.effective before "Measurement Period")    
    return Obs.effective.value
    )


define "DrugStop":
  Last(["Observation": Cx."RETURN VISIT DATE"] Obs
    where (Obs.effective.value during "Measurement Period" or Obs.effective before "Measurement Period")    
    return Obs.effective.value // or valueDateTime?
    )


define "DrugInterval": Interval[DrugStart, DrugStop]


define "Overlaps Measurement Period":
  "DrugInterval" overlaps "Measurement Period"


define "Last Return": "Overlaps Measurement Period"


define "On ART": "Last Return"


define "Measure Population": "On ART"


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
  MERStratifiers."Age Group/Sex/Location TXCURR"


define "Stratifiers": "Stratification"

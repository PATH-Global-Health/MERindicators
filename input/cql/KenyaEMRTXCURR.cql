library KenyaEMRTXCURR version '0.1.0'

// Test cases are located in /input/tests/<Library Name>/<Patient.id>/<bundle source>

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include KenyaEMRConcepts called Cx
include KenyaEMRStratifiers called Stratifiers


// Provide a default interval or period-based tests will fail when evaluating CQL against test cases
// The $evaluate-measure operation's parameters 'periodStart' and 'periodEnd' override this in any case
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T, @2023-06-30T]


context Patient


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


// Initial Population
// Patients who have started an ART drugs program

/*
PLHIV are enrolled in an HIV program.
On Observation resource: $CIEL#160540 "Method of enrollment"
Observation.status is not in example bundle, can't do 'Obs.status in {'final', 'amended', 'corrected'}'
Using the CIEL codes only, even if others are provided.
Use the equivalent operator (~) rather than equality (=) which checks the code system version.
*/



define "PLHIV Observation":
  ["Observation": Cx."Method of enrollment"] Obs
    where (Obs.effective before end of "Measurement Period")


define "PLHIV Boolean": exists "PLHIV Observation"


define "Initial Population": 
  "PLHIV Boolean"


/*
Someone visits 1 July. 
Given appt in 1 month - 1 August.
Check that patient had visit by 24th August/by 30 days.
+ add 30 days.
*/


// "RETURN VISIT DATE"
// Patients started on ART drugs (participating in program)
// who made a clinic visit during the reporting period (Q: Any type? A: yes)

define "Return Visit Observations":
  ["Observation": Cx."RETURN VISIT DATE"]

// return visit during period
define "Return Visits During Period":
  ("Return Visit Observations") Obs
  where (Obs.effective before end of "Measurement Period")
  sort by date from (effective as FHIR.dateTime) desc

define "Any Return Visit During Period": 
  exists "Return Visits During Period"

define "Most Recent Return Visit During Period":
  First("Return Visits During Period")

define "Return Visit Date":
  "Most Recent Return Visit During Period".value.value

// Get last visit during measure period, "return visit date" + 30 days > end of the period
// Does the most recent "return visit date" need to be within the period as long as the value is after it?
define "Return Visit within 30 days of Period":
  ("Most Recent Return Visit During Period".value as FHIR.dateTime) + 30 days after end of "Measurement Period"


// "CURRENT DRUGS USED" are prescriptions
// effectivedatetime captures when those drugs started
// the other datetime fields are not used
// checks on being started on ART, this is not 'picking up drugs'

define "Current Drugs Used Observations":
  ["Observation": Cx."CURRENT DRUGS USED"]

define "Has started ART":
  exists("Current Drugs Used Observations")


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
*/

// Patient who made a clinic visit in the past and were given medicine to last the reporting period and beyond


define "Measure Population": 
  "Return Visit within 30 days of Period" and "Has started ART"


// Measure Population Exclusion
// Deceased and those who interrupted treatment for any reason, etc, etc.


/*
Deceased patients are not in numerator.
In FHIR, deceased[x] is a choice type, of either boolean or datetime.
It also has a cardinality of 0..1. so deceasedBoolean and deceasedDateTime cannot coexist.
There can only be one deceased[x] element.
If true is used, there's no way to know from that field when the patient died. DateTime is better for accuracy.
*/


// This expression allows deceasedBoolean which has no datetime.
define "Deceased Boolean":
  Patient.deceased is not null 
  and ((Patient.deceased as FHIR.boolean) is true or (Patient.deceased as FHIR.dateTime) on or before end of "Measurement Period")


// This expression requires patients to have datetime on Patient.deceased (more accurate).
define "Deceased DateTime Only":
  Patient.deceased is not null 
  and Patient.deceased on or before end of "Measurement Period"



// Todo: double check: "effectiveDateTime": "2023-05-31T11:30:14+03:00",
define "Discontinuation":
  ["Observation": Cx."Reason for discontinuation of program"] Obs
  where Obs.effective before end of "Measurement Period" and Obs.effective after "Most Recent Return Visit During Period".effective


// valueDateTime
define "Transfer Out":
  ["Observation": Cx."Treatment end date"] Obs
  where Obs.value before end of "Measurement Period" and Obs.value after "Most Recent Return Visit During Period".effective


define "Discontinuation Boolean": exists "Discontinuation"


define "Transfer Out Boolean": exists "Transfer Out"


define "Measure Population Exclusion": 
  "Discontinuation Boolean"
  or "Transfer Out Boolean"
  or "Deceased Boolean"
  //or ("Deceased Boolean" is true or "Deceased DateTime Only" is true)



// Stratifiers


// should work without #location
// how to clean it up with identifier[].extension[]
// todo: debugging needed on location
define "OpenMRS Location":
  [Patient] P
    // this url is in the ig, but is not correct: 'http://fhir.openmrs.org/core/StructureDefinition/omrs-patient-identifier-location'}
    where singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier'}
    or singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier#location'}
    or singleton from {P.identifier.extension[1].url ~ 'http://fhir.openmrs.org/ext/patient/identifier'}
    or singleton from {P.identifier.extension[1].url ~ 'http://fhir.openmrs.org/ext/patient/identifier#location'}
    return singleton from {P.identifier.extension[0].value.reference.value}


define "Stratification": 
  Stratifiers."Age Group/Sex"


// define "Stratifier": "Stratification"

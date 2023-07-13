library Debug version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include MERConcepts called Cx

// parameter "Measurement Period" Interval<DateTime>
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T, @2022-12-31T]

context Patient


define "Exists Patient": 
  exists ["Patient"] P


// deceased in period, returns null, ideally returns boolean
define "Deceased":
  Patient.deceased is not null 
  and (Patient.deceased is true or Patient.deceased before end of "Measurement Period")
  // is false


// deceased but after period, thus censored, returns null, ideally returns boolean
define "Right-Censored":
  Patient.deceased is not null
  and (Patient.deceased is true and Patient.deceased after end of "Measurement Period")
  // is true


// assume living because either the boolean value is not reported or datetime after period
// returns null, ideally returns true
define "Living Patient":
  Patient.deceased is null
  or (Patient.deceased is false or Patient.deceased after end of "Measurement Period")
  // is true


define "HIV Condition":
  exists ["Condition": Cx."HIV Condition Positive"]
  or exists [Observation: Cx."Acquired immune deficiency syndrome (disorder)"]
  or exists [Encounter] E
    // where E.reasonCode in Cx."Acquired immune deficiency syndrome (disorder)"
    where (Last(E.reasonCode) ~ Cx."Acquired immune deficiency syndrome (disorder)")


define "Is HIV Positive":
  "HIV Condition"


define "Is HIV Negative":
  not "HIV Condition"


define "HIV Test Results":
  case
    when "Is HIV Positive" then "HIV Positive Observation"
    when "Is HIV Negative" then "HIV Negative Observation"
    else null
  end


define "Pregnant":
  exists ["Condition": Cx."Pregnancy (finding)"]


define "HIV Test Exists":
  exists ([Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"])


define "HIV Positive Observation":
  [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "Is HIV Positive"


define "HIV Negative Observation":
  [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "Is HIV Negative"

define "Contact date":
  [Encounter] E
    return E.period.start


define "on ART PLIR":
  ["Observation": Cx."Currently taking ARV"] o
      where o.value.coding[0]= Cx."Coded Answer"
      or o.value.coding[1]= Cx."Coded Answer"
      or o.value.coding[2]= Cx."Coded Answer"
      // and o.status in {'final', 'amended', 'corrected'}
      // and o.effective in day of "Measurement Period"


define "on ART PLIR debug one":
  ["Observation": Cx."Currently taking ARV"] o
    with ["Encounter"] E
    such that E.period during "Measurement Period"
      // and o.status in {'final', 'amended', 'corrected'}


define "on ART PLIR debug two":
  ["Observation": Cx."Currently taking ARV"] o
    with [Encounter] E 
    such that E.period during "Measurement Period"


define "on ART PLIR debug three":
    ( ["Observation": Cx."Currently taking ARV"] ) o
        where o.value.coding[0]= Cx."Coded Answer"
        or o.value.coding[1]= Cx."Coded Answer"
        or o.value.coding[2]= Cx."Coded Answer"


define "ART Therapy Observation":
  ["Observation": Cx."History of antiretroviral therapy (situation)"] O
    where O.status = 'final'

// to review
// ART Therapy Observation=[]
// ART Therapy Condition=[]

define "ART Therapy Condition":
  ["Condition": Cx."History of antiretroviral therapy (situation)"] C
    where C.verificationStatus ~ FC."confirmed"
      and C.clinicalStatus ~ FC."active"


// synthea
define "ART Therapy Medication":
  ["MedicationRequest": Cx."ART Medications"] M
    // where M.status = 'active'
    where M.authoredOn during "Measurement Period"



define "ART Dates":
  ("ART Therapy Observation" O return O.effective as dateTime)
    union ("ART Therapy Condition" C return C.onset as dateTime)
    union ("ART Therapy Medication" M return M.authoredOn)
    // union ("ART Therapy Medication" M return M)


define "Date of First Evidence of ART":
  Min("ART Dates")


define "On ART":
  exists ("ART Dates" D where D during "Measurement Period")
    or exists (
      "ART Therapy Condition" C
        where Interval[C.onset, C.abatement] overlaps "Measurement Period"
    )


define "HIV Test Observation":
  [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] O
    // where O.status = 'final'
    //   and O.value is not null


define "Date of First Evidence of HIV Status":
  Min("HIV Test Observation" O return O.effective)


define "Date of First Evidence of HIV Positive":
  Min("HIV Positive Observation" O return O.effective)


define "Date of First Evidence of HIV Negative":
  Min("HIV Negative Observation" O return O.effective)


define "Newly enrolled on antiretroviral therapy (ART) during measurement period":
  "Date of First Evidence of ART" during "Measurement Period"


define "Is Pregnant":
  exists ([Condition: Cx."Pregnancy status - Reported"] C
    where C.verificationStatus ~ FC."confirmed"
      and C.clinicalStatus ~ FC."active"
      and C.onset during "Measurement Period"
  )


// define "Is Breastfeeding":
//   exists ([Observation: Cx."Postpartum state (finding)"] O
//     where O.status = 'final'
//       and O.effective during "Measurement Period"
//   )


define "Newly enrolled on antiretroviral therapy (ART) during measurement period (pregnant and breastfeeding)":
  // "Is Pregnant" and "Is Breastfeeding" and "Date of First Evidence of ART" during "Measurement Period"
  "Is Pregnant" and "Date of First Evidence of ART" during "Measurement Period"


define "Receiving antiretroviral therapy (ART) during measurement period":
  exists ("ART Dates" D where D during "Measurement Period")
    or exists (
      "ART Therapy Condition" C
        where Interval[C.onset, C.abatement] overlaps "Measurement Period"
    )


define "Year Preceding the Measurement Period":
  Interval[start of "Measurement Period" - 1 year, start of "Measurement Period")


define "Month Before the Year Preceding the Measurement Period":
  Interval[start of "Year Preceding the Measurement Period" - 1 month, start of "Year Preceding the Measurement Period")


define "Receiving antiretroviral therapy (ART) at 12 months after initiating":
  "Date of First Evidence of ART" during "Month Before the Year Preceding the Measurement Period"
    and "Receiving antiretroviral therapy (ART) during measurement period"


define "Receiving antiretroviral therapy (ART) at 12 months after initiating (pregnant and breastfeeding)":
  "Receiving antiretroviral therapy (ART) at 12 months after initiating"
    and "Is Pregnant"
    // and "Is Breastfeeding"


define "Initiated antiretroviral therapy (ART) in the 12 months prior to measurement period":
  "Date of First Evidence of ART" during "Year Preceding the Measurement Period"


define "Pregnant and receiving antiretroviral therapy (ART) to reduce the risk of mother-to-child-transmission during pregnancy":
    "Is Pregnant"
      and "Receiving antiretroviral therapy (ART) during measurement period"


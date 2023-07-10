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


define "Deceased":
  Patient.deceased is not null 
  and (Patient.deceased is true or Patient.deceased before end of "Measurement Period")
  // and Patient.deceased.value.not()
  // and Patient.deceased.not()
  // // alternatively
  // where P.deceased is false
  //   or P.deceased before Today()


define "Living Patient":
  Deceased is null


// synthea
// define "HIV Condition":
//   exists ["Condition": Cx."HIV Condition Positive"]
//   // synthea
//   or exists [Observation: Cx."Acquired immune deficiency syndrome (disorder)"]
//   or exists [Encounter] E
//     // where E.reasonCode in Cx."Acquired immune deficiency syndrome (disorder)"
//     where (Last(E.reasonCode) ~ Cx."Acquired immune deficiency syndrome (disorder)")


// define "Is HIV Positive":
//   "HIV Condition"


// define "Is HIV Negative":
//   not "HIV Condition"


// define "HIV Test Results":
//   case
//     when "Is HIV Positive" then "HIV Positive Observation"
//     when "Is HIV Negative" then "HIV Negative Observation"
//     else null
//   end


define "Pregnant":
  exists ["Condition": Cx."Pregnancy (finding)"]


// define "HIV Test Exists":
//   exists ([Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"])


// define "HIV Positive Observation":
//   [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] Observation
//     where Observation.value = "Is HIV Positive"


// define "HIV Negative Observation":
//   [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] Observation
//     where Observation.value = "Is HIV Negative"

// this union is a placeholder for implementer or dak valuesets
// define "Viral Load Test Result":
//   ["Observation": Cx."HIV 1 RNA NAA+probe (Specimen)"] Obs
//   union ["Observation": Cx."HIV 1 RNA [#/volume] (viral load) in Serum or Plasma by NAA with probe detection"] Obs
//     // where Obs.status = 'final'
//     // and Obs.value is not null
//   // synthea
//     // when Obs.effective during "Measurement Period"


// define "Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)":
//   "Viral Load Test Result" Observation
//     where Observation.value < 1000 '{copies}/mL'


// define "Living with HIV and on ART with unsuppressed viral load results (>1000 copies/mL)":
//   "Viral Load Test Result" Observation
//     where Observation.value >= 1000 '{copies}/mL'


// define "Suppressed":
//   "Viral Load Test Result" Observation
//     where Observation.value < 1000 '{copies}/mL'


// define "Unsuppressed":
//   "Viral Load Test Result" Observation
//     where Observation.value >= 1000 '{copies}/mL'


define "Contact date":
  [Encounter] E
    return E.period.start


// define "HIV Positive but no VL test":
//   "Is HIV Positive" = true



// Rest of HIVIndicators

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


// define "ART Therapy Medication":
//   ["MedicationDispense": Cx."ART Medications"] M
//     where M.status = 'completed'

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


// define "PMTCT ART Status":
//   case
//     when "Date of First Evidence of ART" before start of "Measurement Period" then Cx."Currently taking ARV"
//     when "Date of First Evidence of ART" during "Measurement Period" then Cx."New on ART"
//     else null
//   end


define "On ART":
  exists ("ART Dates" D where D during "Measurement Period")
    or exists (
      "ART Therapy Condition" C
        where Interval[C.onset, C.abatement] overlaps "Measurement Period"
    )


// define "HIV Test Observation":
//   [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] O
//     // where O.status = 'final'
//     //   and O.value is not null


// define "Date of First Evidence of HIV Status":
//   Min("HIV Test Observation" O return O.effective)


// define "Date of First Evidence of HIV Positive":
//   Min("HIV Positive Observation" O return O.effective)


// define "Date of First Evidence of HIV Negative":
//   Min("HIV Negative Observation" O return O.effective)


// define "PMTCT HIV Status":
//   case
//     when "Date of First Evidence of HIV Positive" before start of "Measurement Period" then 'Known Positive'
//     when "Date of First Evidence of HIV Positive" during "Measurement Period" then 'Newly Identified Positive'
//     when "Date of First Evidence of HIV Negative" during "Measurement Period" then 'Newly Identified Negative'
//     else null
//   end


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


// define "Antenatal Care Visit":
//   // [Encounter: Cx."Prenatal initial visit (regime/therapy)"] E
//   [Encounter: Cx."Prenatal initial visit (regime/therapy)"] E
//     where E.status = 'finished'
//       and E.period during Interval[start of "Year Preceding the Measurement Period", end of "Measurement Period"]


// define "Live Birth Procedure":
//   [Procedure: Cx."Livebirth (finding)"] P
//     where P.status = 'completed'


// define "Antenatal Care Visit or Live Birth during the Measurement Period":
//   ("Is Pregnant" and exists ("Antenatal Care Visit" V where V.period during "Measurement Period"))
//     or exists ("Live Birth Procedure" P where P.performed during "Measurement Period")


// define "Antenatal Care Visit or Live Birth during Measurement Period (HIV Positive)":
//   "Is HIV Positive"
//     and "Antenatal Care Visit or Live Birth during the Measurement Period"


// define "HIV-positive, pregnant, and receiving antiretroviral therapy (ART) to reduce the risk of mother-to-child-transmission during pregnancy":
//   "Is HIV Positive"
//     and "Is Pregnant"
//     and "Receiving antiretroviral therapy (ART) during measurement period"


define "Pregnant and receiving antiretroviral therapy (ART) to reduce the risk of mother-to-child-transmission during pregnancy":
    "Is Pregnant"
      and "Receiving antiretroviral therapy (ART) during measurement period"

// define "Viral Load Test Result":
//   ["Observation": Cx."Viral Load Test"] O
//     where O.status = 'final'
//       and O.value is not null


// define "Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)":
//   "Is HIV Positive"
//     and Cx."Receiving antiretroviral therapy (ART) during measurement period"
//     and exists (
//       Cx."Viral Load Test Result" R
//         where R.effective during "Measurement Period"
//           and R.value < 1000 '{copies}/mL'
//       )


// define "Received HIV Testing Services (HTS) and Received Test Results":
//   ["Observation": Cx."HIV Testing Services"] O
//     where O.status = 'final'
//       and O.value is not null


// define "First antenatal care visit":
//   First("Antenatal Care Visit" V sort by start of period)


// define "Date of First Evidence of HIV Status":
//   Min("HIV Test Observation" O return O.effective)


// define "HIV Status Known at First Antenatal Care Visit":
//   "Date of First Evidence of HIV Status" on or before start of "First antenatal care visit".period


// define "Receiving antiretroviral therapty (ART) and Viral Load Measurement in the past 12 months":
//   "Receiving antiretroviral therapy (ART) during measurement period"
//     and exists (
//       "Viral Load Test Result" R
//         where R.effective during "Year Preceding the Measurement Period"
//     )
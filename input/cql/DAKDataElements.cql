library DAKDataElements version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include DAKConcepts called Cx
// include DAKStratifiers called Strat

// parameter "Measurement Period" Interval<DateTime>
parameter "Measurement Period" Interval<DateTime> default Interval[@2022-01-01T, @2022-12-31T]

context Patient


define "Deceased":
  Patient.deceased is not null 
  and (Patient.deceased is true or Patient.deceased before end of "Measurement Period")
  // and Patient.deceased.value.not()
  // and Patient.deceased.not()
  // // alternatively
  // where P.deceased is false
  //   or P.deceased before Today()


define "HIV Condition":
  [Condition] C
    where C.code in Cx."DAK PLHIV"
    and C.clinicalStatus in FC."Active Condition"
    and C.verificationStatus ~ FC."confirmed"


define "Is HIV Positive":
  exists( "HIV Condition" )


define "Is HIV Negative":
  not exists( "HIV Condition" )

define "PLHIV":
  "Is HIV Positive" or "On ART"


define "Pregnant":
  exists ["Condition": Cx."Pregnancy (finding)"]

// Rest of HIVIndicators

// to review
// ART Therapy Observation=[]
// ART Therapy Condition=[]

define "ART Therapy Observation":
  [Observation] O
    where O.code in Cx."DAK On ART"
      and O.status = 'final'

define "ART Therapy Condition":
  [Condition] C
    where C.code in Cx."DAK On ART"
      and C.clinicalStatus in FC."Active Condition"
      and C.verificationStatus ~ FC."confirmed"


define "ART Therapy Medication":
  ["MedicationRequest"] M
    // where M.status = 'active'
    where M.medication in Cx."DAK ART Medications"
      and M.authoredOn during "Measurement Period"



define "ART Dates":
  ("ART Therapy Observation" O return O.effective as dateTime)
    union ("ART Therapy Condition" C return C.onset as dateTime)
    union ("ART Therapy Medication" M return M.authoredOn)
    // union ("ART Therapy Medication" M return M)

define "Date of Last Evidence of ART":
  Max("ART Dates")

define "Date of First Evidence of ART":
  Min("ART Dates")


define "On ART":
  ( 
    ( exists ("ART Dates" D where D during "Measurement Period")
      or exists (
        "ART Therapy Condition" C
          where Interval[FHIRHelpers.ToDateTime(C.onset as FHIR.dateTime), FHIRHelpers.ToDateTime(C.abatement as FHIR.dateTime)] overlaps "Measurement Period"
      )
    )
    and if exists( "Stopped ART Observation" ) then "Date of Last Stopped ART" before "Date of Last Evidence of ART" else true
  )
  or 
  ( "Date of Last HIV Transfer" during "Measurement Period"
    and if exists ( "Stopped ART Observation" ) then "Date of Last Stopped ART" before "Date of Last HIV Transfer" else true
  )
  or
  (
    "Most Recent Dispensed Observation Finish Date" after "Measurement Period"
  )

define "Dispensed Observations":
  [Observation] O
    where O.code in Cx."DAK MMD"
      and O.status = 'final' 
    sort by date from (effective as FHIR.dateTime) desc

define "Most Recent Dispensed Observation":
  First( "Dispensed Observations")

define "Most Recent Dispensed Observation Days":
  ("Most Recent Dispensed Observation".value as integer)

define "Dispensed in Days":
  ToQuantity(ToString("Most Recent Dispensed Observation Days") + ' days')

define "Most Recent Dispensed Observation Date":
  ("Most Recent Dispensed Observation".effective as dateTime)

define "Most Recent Dispensed Observation Finish Date":
  "Most Recent Dispensed Observation Date" + "Dispensed in Days"

define "Stopped ART Observation":
  [Observation] O
    where O.code in Cx."DAK ART Stopped"
      and O.status = 'final'

define "HIV Transfer Observation":
  [Observation] O
    where O.code in Cx."DAK HIV Transferred"
      and O.status = 'final'

define "Date of Last Stopped ART":
  Max("Stopped ART Observation" O return O.effective as dateTime)

define "Date of Last HIV Transfer":
  Max("HIV Transfer Observation" O return O.effective as dateTime)

define "Newly enrolled on antiretroviral therapy (ART) during measurement period":
  "Date of First Evidence of ART" during "Measurement Period"

define "Requested ARTs":
  [MedicationRequest] M
    where M.medication in Cx."DAK ART Medications"
      and M.status = 'active'
    sort by date from (authoredOn as FHIR.dateTime) desc

define "Most Recent Requested ART":
  First( "Requested ARTs" )

define "Most Recent Requested ART Date":
  "Most Recent Requested ART".authoredOn as dateTime


define "Patient with IIT":
  "Most Recent Requested ART Date" after now() + 28 days



/*
define "Is Pregnant":
  exists ([Condition: Cx."Pregnancy status - Reported"] C
    where C.verificationStatus ~ FC."confirmed"
      and C.clinicalStatus ~ FC."active"
      and C.onset during "Measurement Period"
  )


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
*/
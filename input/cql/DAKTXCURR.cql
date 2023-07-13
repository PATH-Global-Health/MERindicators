// TX_CURR, WHO HIV.IND.AV.1
// numerator only
// Number of adults and children currently receiving antiretroviral therapy (ART)
// Sum of age/sex disaggregates


library DAKTXCURR version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DAKConcepts called Cx
include DAKDataElements called PatientData
include DAKStratifiers called DAKStratifiers

context Patient

define "Initial Population": 
  PatientData."PLHIV"


define "Denominator":
  PatientData."PLHIV"

define "Denominator-Exclusion":
  PatientData."Deceased"

define "Numerator-Exclusion": 
  PatientData."Deceased"


// todo: this is not showing up as true

define "Numerator":
  PatientData."On ART"


define "Stratification": 
  DAKStratifiers."Age Group/Sex/Location TXCURR"

define "DispenseStratification":
  DAKStratifiers."Dispensing Quantity/Coarse Age/Sex/Location"

// define "Initial population":
//     exists "Anti Retroviral Therapy Adults And Children"
  
// define "Anti Retroviral Therapy Adults And Children":
//     ( [Observation: "Anti Retroviral Therapy"] ) o
//         where o.value.coding[1]= "Coded Answer"
//         or o.value.coding[2]= "Coded Answer"
//         and o.status in {'final', 'amended', 'corrected'}
//         and o.effective in day of "Measurement Period"

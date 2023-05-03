// TX_CURR, WHO HIV.IND.AV.1
// numerator only
// Number of adults and children currently receiving antiretroviral therapy (ART)
// Sum of age/sex disaggregates


library TXCURR version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called DASHStrat

context Patient

define "Initial Population": true

define "Numerator-Exclusion": 
  PatientData."Deceased"


// todo: this is not showing up as true
define "Numerator":
  PatientData."On ART"


define "Stratifier": 
  DASHStrat."Age Group/Sex/Location TXCURR"



// define "Initial population":
//     exists "Anti Retroviral Therapy Adults And Children"
  
// define "Anti Retroviral Therapy Adults And Children":
//     ( [Observation: "Anti Retroviral Therapy"] ) o
//         where o.value.coding[1]= "Coded Answer"
//         or o.value.coding[2]= "Coded Answer"
//         and o.status in {'final', 'amended', 'corrected'}
//         and o.effective in day of "Measurement Period"

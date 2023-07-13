library DAKConcepts version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

// codesystems
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "RxNorm": 'http://www.nlm.nih.gov/research/umls/rxnorm'
codesystem "ICD-11": 'http://hl7.org/fhir/sid/icd-11'

// local codesystems
codesystem "CIEL": 'https://openconceptlab.org/orgs/CIEL/sources/CIEL'
codesystem "OpenHIE": 'https://openhie.org'
codesystem "DAK Dispensing Quantity CS": 'https://path-global-health.github.io/MERindicators/CodeSystem/DAKDispensingQuantityCS'
codesystem "DAK Coarse Age Range CS": 'https://path-global-health.github.io/MERindicators/CodeSystem/DAKCoarseAgeRangeCS'

// FHIR CS and VS
valueset "HL7 Administrative Gender": 'http://hl7.org/fhir/ValueSet/administrative-gender'

// codes
// The display "Pregnancy (finding)" is not a valid display for the code {http://snomed.info/sct}77386006
code "Pregnancy (finding)": '77386006' from "SNOMED-CT" display 'Pregnancy (finding)'
code "Pregnant": '146789000' from "SNOMED-CT" display 'Pregnant'
// code "Breastfeeding": '169750002' from "SNOMED-CT" display 'Breastfeeding'
code "Prenatal initial visit (regime/therapy)": '424441002' from "SNOMED-CT" display 'Prenatal initial visit (regime/therapy)'
code "Pregnancy status - Reported": '11449-6' from "LOINC" display 'Pregnancy status - Reported'
// code "Livebirth (finding)": '281050002' from "SNOMED-CT" display 'Livebirth (finding)'
// code "Postpartum state (finding)": '86569001' from "SNOMED-CT" display 'Postpartum state (finding)'
// code "Normal breast feeding (finding)": '69840006' from "SNOMED-CT" display 'Normal breast feeding (finding)'
code "Currently taking ARV": '160119' from "CIEL" display 'Currently taking ARV'
code "Coded Answer": '1065' from "CIEL" display 'Yes'
code "History of antiretroviral therapy (situation)": '432101000124108' from "OpenHIE" display 'History of antiretroviral therapy (situation)'

// code "New on ART": 'new-on-art' from "PMTCT ART Status Codes" display 'New on ART'

// valuesets
valueset AgeRangesTXCURR: 'https://path-global-health.github.io/MERindicators/ValueSet/AgeRangesTXCURR'
// valueset "HIV Testing Services": 'https://path-global-health.github.io/MERindicators/ValueSet/HIVTestingServices' // Should use HIV tests
// viral load tests, results
// commenting out for now and the union
// valueset "Human Immunodeficiency Virus (HIV) Laboratory Test Codes (Ab and Ag)": 'urn:oid:2.16.840.1.113762.1.4.1056.50' // Used by CMS349
valueset "Viral Load Test": 'https://path-global-health.github.io/MERindicators/ValueSet/ViralLoadTest'
valueset "DAK PLHIV": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKPLHIV'
valueset "DAK MMD": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKMMD'
valueset "DAK On ART": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKONART'
valueset "DAK HIV Transfer In": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKHIVTransfer'
valueset "DAK ARV Drug Pickup": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKARVDrugPickup'
valueset "DAK ART Medications": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKARTMeds'
valueset "DAK Dispensing Quantity": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKDispensingQuantity'
valueset "DAK Coarse Age Range": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKCoarseAgeRange'
valueset "DAK ART Stopped": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKARTStop'
valueset "DAK HIV Transferred": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKHIVTransfer'




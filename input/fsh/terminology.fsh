// Code systems

CodeSystem: AgeRanges
Id: AgeRanges
Title: "AgeRanges"
Description: "AgeRanges"
* ^experimental = true
* ^caseSensitive = false
* ^url = $AgeRanges
* #P0Y--P1Y "< 1 year"
* #P1Y--P5Y "1-4 years"
* #P5Y--P10Y "5-9 year"
* #P10Y--P15Y "10-15 year"
* #P15Y--P20Y "15-19 year"
* #P20Y--P25Y "20-24 year"
* #P25Y--P30Y "25-29 year"
* #P30Y--P35Y "30-34 year"
* #P35Y--P40Y "35-39 year"
* #P40Y--P45Y "40-45 year"
* #P45Y--P50Y "45-50 year"
// end at 50+
* #P50Y--P9999Y "50+ years"
// and also include 50+ breakdown for TXCURR
* #P50Y--P55Y "50-55 year"
* #P55Y--P60Y "55-60 year"
* #P60Y--P65Y "60-65 year"
* #P65Y--P9999Y "65+ years"


// TODO: It is unclear if external IDs are also used in implementations, and if they are attached to a system (URL).
// One examples shows codes without a system.
CodeSystem: CIEL
Id: CIEL
Title: "CIEL"
Description: "Columbia International eHealth Laboratory (CIEL)"
* ^experimental = true
* ^caseSensitive = false
* ^url = $CIEL
* #1065 "YES"
* #1066 "NO"
* #1067 "Unknown"
* #1434 "Currently pregnant" // boolean
* #138405 "Human immunodeficiency virus (HIV) disease" // coded
* #160119 "CURRENTLY TAKING ARV" // q&a
* #116128 "Malaria" // For tests from OMRS IG
* #160540 "Method of enrollment"
* #160542 "Outpatient department"
* #1193 "CURRENT DRUGS USED"
* #5096 "RETURN VISIT DATE"
// wip
* #160104 "Efavirenz / Lamivudine / Stavudine"
* #160105 "Efavirenz / Stavudine / Zidovudine"
* #160124 "Efavirenz / Lamivudine / Zidovudine"
* #161361 "efavirenz / lamivudine / tenofovir disoproxil"
* #161363 "lamivudine / stavudine"
* #161364 "Lamivudine / tenofovir disoproxil"
* #1652 "Lamivudine / nevirapine / zidovudine"
* #5424 "Other antiretroviral drug"
* #5811 "Unknown antiretroviral drug"
* #630 "Lamivudine / zidovudine"
* #103166 "Abacavir / lamivudine"
* #70056 "Abacavir"
* #71647 "Atazanavir"
* #74807 "Didanosine"
* #75523 "Efavirenz"
* #75628 "Efavirenz"
* #77995 "Indinavir"
* #78643 "Lamivudine"
* #79040 "Lopinavir"
* #792 "Lamivudine / nevirapine / stavudine"
* #794 "Lopinavir / ritonavir"
* #80487 "Nelfinavir"
* #80586 "Nevirapine"
* #83412 "Ritonavir"
* #84309 "Stavudine"
* #84795 "Tenofovir"
* #86663 "Zidovudine"
//wip: this exact case sensitive entry doesn't exist in ciel
* #01234 "Tenofovir / Lamivudine / Dolutegravir"


// https://fhir.staging.openconceptlab.org/orgs/Kenya_SMART_Guidelines/CodeSystem/enrollment_methods/

Alias: $0203 = http://hl7.org/fhir/v2/0203

CodeSystem: EnrollmentMethods
Id: EnrollmentMethods
Title: "Enrollment Methods for HIV program"
Description: "1"
* ^name = "EnrollmentMethods"
* ^status = #draft
* ^language = #en
// * ^count = 10
// * ^property[0].code = #conceptclass
// * ^property[=].uri = "https://api.staging.openconceptlab.org/orgs/OCL/sources/Classes/concepts"
// * ^property[=].description = "Standard list of concept classes."
// * ^property[=].type = #string
// * ^property[+].code = #datatype
// * ^property[=].uri = "https://api.staging.openconceptlab.org/orgs/OCL/sources/Datatypes/concepts"
// * ^property[=].description = "Standard list of concept datatypes."
// * ^property[=].type = #string
// * ^property[+].code = #inactive
// * ^property[=].uri = "http://hl7.org/fhir/concept-properties"
// * ^property[=].description = "True if the concept is not considered active."
// * ^property[=].type = #coding
* ^meta.lastUpdated = "2023-07-20T15:56:38.013277Z"
* ^version = "1"
* ^identifier.system = "https://api.staging.openconceptlab.org"
* ^identifier.value = "/orgs/Kenya_SMART_Guidelines/CodeSystem/enrollment_methods/"
* ^identifier.type.text = "Accession ID"
* ^identifier.type = $0203#ACSN "Accession ID"
* #159938AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "HBTC"
* #160539AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "VCT Site" // Voluntary counseling and testing program
* #159937AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "MCH"
* #160536AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "IPD-Adult"
* #160537AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "IPD-Child"
* #160541AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "TB Clinic"
* #160542AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "OPD"
* #162050AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "CCC"
* #160551AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "Self Test"
* #5622AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA "Other(eg STI)"



// placeholder, can be different in implementations
CodeSystem: FocusPopCS
Id: FocusPopCS
Title: "FocusPopCS"
Description: "FocusPopCS"
* ^experimental = true
* ^caseSensitive = false
* ^url = $FocusPopCS


CodeSystem: KeyPopCS
Id: KeyPopCS
Title: "KeyPop"
Description: "KeyPop"
* ^experimental = true
* ^caseSensitive = false
* ^url = $KeyPopCS
* #PWID "People who inject drugs (PWID)"
* #MSM "Men who have sex with men (MSM)"
* #TG "Transgender people (TG)"
* #FSW "Female sex workers (FSW)"
* #PRISON "People in prison and other closed settings"


CodeSystem: MMDIntervalCS
Id: MMDIntervalCS
Title: "MMDIntervalCS"
Description: "MMDIntervalCS"
* ^experimental = true
* ^caseSensitive = false
* ^url = $MMDIntervalCS
* #3to5MMD
* #6MMD


CodeSystem: OpenHIE
Id: OpenHIE
Title: "OpenHIE CodeSystem"
Description: "OpenHIE CodeSystem"
* ^experimental = true
* ^caseSensitive = false
* ^url = $OpenHIE
* #cohort "cohort"
// add this because it doesn't show up on snomed term servers
* #432101000124108 "History of antiretroviral therapy (situation)"


// Value sets

ValueSet: AgeRangesTXCURR
Id: AgeRangesTXCURR
Title: "AgeRangesTXCURR"
Description: "AgeRangesTXCURR"
* ^experimental = true
* ^url = $AgeRangesTXCURR
* $AgeRanges#P0Y--P1Y "< 1 year"
* $AgeRanges#P1Y--P5Y "1-4 years"
* $AgeRanges#P5Y--P10Y "5-9 year"
* $AgeRanges#P10Y--P15Y "10-15 year"
* $AgeRanges#P15Y--P20Y "15-19 year"
* $AgeRanges#P20Y--P25Y "20-24 year"
* $AgeRanges#P25Y--P30Y "25-29 year"
* $AgeRanges#P30Y--P35Y "30-34 year"
* $AgeRanges#P35Y--P40Y "35-39 year"
* $AgeRanges#P40Y--P45Y "40-45 year"
* $AgeRanges#P45Y--P50Y "45-50 year"
// * $AgeRanges#P50Y--P9999Y "50+ years"
// detailed for TXCURR
* $AgeRanges#P50Y--P55Y "50-55 year"
* $AgeRanges#P55Y--P60Y "55-60 year"
* $AgeRanges#P60Y--P65Y "60-65 year"
* $AgeRanges#P65Y--P9999Y "65+ years"


ValueSet: FocusPop
Id: FocusPop
Title: "FocusPop"
Description: "FocusPop"
* ^experimental = true
* ^url = $FocusPop
* include codes from system $FocusPopCS


ValueSet: KeyPop
Id: KeyPop
Title: "KeyPop"
Description: "KeyPop"
* ^experimental = true
* ^url = $KeyPop
* include codes from system $KeyPopCS


ValueSet: MMDInterval
Id: MMDInterval
Title: "MMDInterval"
Description: "Multi-month dispensing interval"
* ^experimental = true
* ^url = $MMDInterval
* include codes from system $MMDIntervalCS


ValueSet: OnARV
Id: OnARV
Title: "History of antiretroviral therapy (situation)"
Description: "History of antiretroviral therapy (situation)"
* ^experimental = true
* ^url = $OnARV
* $SCT#432101000124108 "History of antiretroviral therapy (situation)" // This code wasn't found previously on tx.fhir.org. todo: check again.
* $OpenHIE#432101000124108 "History of antiretroviral therapy (situation)"
* $CIEL#160119 "CURRENTLY TAKING ARV" // q&a, uses interface terminology


ValueSet: Pregnant
Id: Pregnant
Title: "Pregnant"
Description: "Currently pregnant"
* ^experimental = true
* ^url = $Pregnant
* $SCT#77386006 "Pregnancy (finding)"
* $CIEL#1434 "Currently pregnant" // q&a, uses interface terminology


// These are the only codes used in Synthea, and may not be all HIV medications in RxNorm.
ValueSet: SyntheaHIVMedications
Id: SyntheaHIVMedications
Title: "Synthea HIV MedicationsVS"
Description: "Synthea HIV MedicationsVS"
* ^experimental = true
* ^url = $SyntheaHIVMedications
// ART_MonoEra: art_sequence_1987_1994.json
* $RxNorm#199663 "zidovudine 300 MG Oral Tablet"
* $RxNorm#284988 "didanosine 400 MG Delayed Release Oral Capsule"
* $RxNorm#313760 "zalcitabine 0.75 MG Oral Tablet"
* $RxNorm#313110 "stavudine 40 MG Oral Capsule"
// ART_DualERA: art_sequence_1995_1996
* $RxNorm#349491 "lamivudine 300 MG Oral Tablet"
// ART_EarlyPI: art_sequence_1997_2002
* $RxNorm#200082 "lamivudine 150 MG / zidovudine 300 MG Oral Tablet"
* $RxNorm#310988 "indinavir 400 MG Oral Capsule"
* $RxNorm#859863 "saquinavir mesylate 500 MG Oral Tablet"
* $RxNorm#317150 "ritonavir 100 MG Oral Capsule"
* $RxNorm#403978 "nelfinavir 625 MG Oral Tablet"
* $RxNorm#349477 "efavirenz 600 MG Oral Tablet"
* $RxNorm#597730 "lopinavir 200 MG / ritonavir 50 MG Oral Tablet"
// ART_3TCZDV_Era: art_sequence_2003_2005
* $RxNorm#349251 "tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#403875 "emtricitabine 200 MG Oral Capsule"
* $RxNorm#476556 "emtricitabine 200 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet" //can be PrEP, PEP
// ART_EarlyINSTI: art_sequence_2006_2014
* $RxNorm#1147334 "emtricitabine 200 MG / rilpivirine 25 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#643066 "efavirenz 600 MG / emtricitabine 200 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#1306292 "cobicistat 150 MG / elvitegravir 150 MG / emtricitabine 200 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#744842 "raltegravir 400 MG Oral Tablet"
* $RxNorm#1433873 "dolutegravir 50 MG Oral Tablet"
* $RxNorm#402109 "fosamprenavir 700 MG Oral Tablet"
* $RxNorm#664741 "atazanavir 300 MG Oral Capsule"
* $RxNorm#1359269 "darunavir 800 MG Oral Tablet"
// ART_LateINSTI: art_sequence_2015.json
* $RxNorm#2003249 "lamivudine 300 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet" //can be PrEP, PEP
* $RxNorm#1747691 "emtricitabine 200 MG / tenofovir alafenamide 25 MG Oral Table"
* $RxNorm#1999667 "bictegravir 50 MG / emtricitabine 200 MG / tenofovir alafenamide 25 MG Oral Tablet"
* $RxNorm#1721613 "cobicistat 150 MG / elvitegravir 150 MG / emtricitabine 200 MG / tenofovir alafenamide 10 MG Oral Tablet"
* $RxNorm#2122519 "dolutegravir 50 MG / lamivudine 300 MG Oral Tablet"


// WIP

// source of codes: https://pastebin.com/nqufFVvz
ValueSet: CIELHIVMedications
Id: CIELHIVMedications
Title: "CIELHIVMedications"
Description: "CIELHIVMedications"
* ^status = #draft
* ^experimental = true
* ^url = $CIELHIVMedications
* $CIEL#160104 "Efavirenz / Lamivudine / Stavudine"
* $CIEL#160105 "Efavirenz / Stavudine / Zidovudine"
* $CIEL#160124 "Efavirenz / Lamivudine / Zidovudine"
* $CIEL#161361 "efavirenz / lamivudine / tenofovir disoproxil"
* $CIEL#161363 "lamivudine / stavudine"
* $CIEL#161364 "Lamivudine / tenofovir disoproxil"
* $CIEL#1652 "Lamivudine / nevirapine / zidovudine"
* $CIEL#5424 "Other antiretroviral drug"
* $CIEL#5811 "Unknown antiretroviral drug"
* $CIEL#630 "Lamivudine / zidovudine"
* $CIEL#103166 "Abacavir / lamivudine"
* $CIEL#70056 "Abacavir"
* $CIEL#71647 "Atazanavir"
* $CIEL#74807 "Didanosine"
* $CIEL#75523 "Efavirenz"
* $CIEL#75628 "Efavirenz"
* $CIEL#77995 "Indinavir"
* $CIEL#78643 "Lamivudine"
* $CIEL#79040 "Lopinavir"
* $CIEL#792 "Lamivudine / nevirapine / stavudine"
* $CIEL#794 "Lopinavir / ritonavir"
* $CIEL#80487 "Nelfinavir"
* $CIEL#80586 "Nevirapine"
* $CIEL#83412 "Ritonavir"
* $CIEL#84309 "Stavudine"
* $CIEL#84795 "Tenofovir"
* $CIEL#86663 "Zidovudine"
// temp: this exact case sensitive entry doesn't exist in ciel
* $CIEL#01234 "Tenofovir / Lamivudine / Dolutegravir"

// Tenofovir / Lamivudine / Dolutegravir


// https://fhir.staging.openconceptlab.org/orgs/Kenya_SMART_Guidelines/ValueSet/enrollment_methods/
// Alias: $enrollment_methods = https://kenyaemr.ke/MERindicators/CodeSystem/enrollment_methods
Alias: $0203 = http://hl7.org/fhir/v2/0203

ValueSet: EnrollmentMethodsforHIVProgram
Id: EnrollmentMethodsforHIVProgram
Title: "Enrollment Methods in KenyaEMR HIV Program"
Description: "1"
* ^name = "Enrollment Methods for HIV Program"
* ^version = "1"
* ^url = $EnrollmentMethodsforHIVProgram
* ^status = #draft
* ^meta.lastUpdated = "2023-07-20T15:51:47.328070Z"
* ^identifier.system = "https://api.staging.openconceptlab.org"
* ^identifier.value = "/orgs/Kenya_SMART_Guidelines/ValueSet/enrollment_methods/"
* ^identifier.type.text = "Accession ID"
* ^identifier.type = $0203#ACSN "Accession ID"
* include codes from system $EnrollmentMethods
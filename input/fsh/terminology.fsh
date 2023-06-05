// Code systems

CodeSystem: AgeRangesCS
Id: AgeRangesCS
Title: "AgeRangesCS"
Description: "AgeRangesCS"
* ^experimental = true
* ^caseSensitive = false
* ^url = $AgeRangesCS
* #P0Y--P1Y "< 1 year"
* #P1Y--P5Y "1-4 years"
* #P5Y--P10Y "5-9 year"
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


CodeSystem: KeyPopCS
Id: KeyPopCS
Title: "KeyPopCS"
Description: "KeyPopCS"
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


CodeSystem: OpenHIECS
Id: OpenHIECS
Title: "OpenHIE CodeSystem"
Description: "OpenHIE CodeSystem"
* ^experimental = true
* ^caseSensitive = false
* ^url = $OpenHIECS
// * #cohort "cohort"
// add this because it doesn't show up on snomed term servers
* #432101000124108 "History of antiretroviral therapy (situation)"


// Value sets

ValueSet: AgeRangesTXCURRVS
Id: AgeRangesTXCURRVS
Title: "AgeRangesTXCURRVS"
Description: "AgeRangesTXCURRVS"
* ^experimental = true
* ^url = $AgeRangesTXCURRVS
* $AgeRangesCS#P0Y--P1Y "< 1 year"
* $AgeRangesCS#P1Y--P5Y "1-4 years"
* $AgeRangesCS#P5Y--P10Y "5-9 year"
* $AgeRangesCS#P15Y--P20Y "15-19 year"
* $AgeRangesCS#P20Y--P25Y "20-24 year"
* $AgeRangesCS#P25Y--P30Y "25-29 year"
* $AgeRangesCS#P30Y--P35Y "30-34 year"
* $AgeRangesCS#P35Y--P40Y "35-39 year"
* $AgeRangesCS#P40Y--P45Y "40-45 year"
* $AgeRangesCS#P45Y--P50Y "45-50 year"
// * $AgeRangesCS#P50Y--P9999Y "50+ years"
// detailed for TXCURR
* $AgeRangesCS#P50Y--P55Y "50-55 year"
* $AgeRangesCS#P55Y--P60Y "55-60 year"
* $AgeRangesCS#P60Y--P65Y "60-65 year"
* $AgeRangesCS#P65Y--P9999Y "65+ years"


ValueSet: FocusPopVS
Id: FocusPopVS
Title: "FocusPopVS"
Description: "FocusPopVS"
* ^experimental = true
* ^url = $FocusPopVS


ValueSet: KeyPopVS
Id: KeyPopVS
Title: "KeyPopVS"
Description: "KeyPopVS"
* ^experimental = true
* ^url = $KeyPopVS
* include codes from system $KeyPopCS


ValueSet: MMDIntervalVS
Id: MMDIntervalVS
Title: "MMDIntervalVS"
Description: "Multi-month dispensing interval"
* ^experimental = true
* ^url = $MMDIntervalVS



ValueSet: OnARVVS
Id: OnARVVS
Title: "History of antiretroviral therapy (situation)"
Description: "History of antiretroviral therapy (situation)"
* ^experimental = true
* ^url = $OnARVVS
* $SCT#432101000124108 "History of antiretroviral therapy (situation)" // This code wasn't found previously on tx.fhir.org. todo: check again.
* $OpenHIECS#432101000124108 "History of antiretroviral therapy (situation)"
* $CIEL#160119 "CURRENTLY TAKING ARV" // q&a, uses interface terminology


ValueSet: PregnantVS
Id: PregnantVS
Title: "Pregnant"
Description: "Currently pregnant"
* ^experimental = true
* ^url = $PregnantVS
* $SCT#77386006 "Pregnancy (finding)"
* $CIEL#1434 "Currently pregnant" // q&a, uses interface terminology


ValueSet: SyntheaHIVMedicationsVS
Id: SyntheaHIVMedicationsVS
Title: "Synthea HIV MedicationsVS"
Description: "Synthea HIV MedicationsVS"
* ^experimental = true
* ^url = $SyntheaHIVMedicationsVS
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



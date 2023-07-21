CodeSystem: DAKICD11
Id: DAKICD11
Title: "ICD-11 codes from the HIV DAK"
Description: "ICD-11 codes from the HIV DAK"
* ^experimental = false
* ^caseSensitive = false
* ^url = $ICD11

* #1C62.0 "HIV disease clinical stage 1 without mention of tuberculosis or malaria"
* #1C62.1 "HIV disease clinical stage 2 without mention of tuberculosis or malaria"
* #1C62.2 "HIV disease clinical stage 3 without mention of tuberculosis or malaria"
* #1C62.3 "HIV disease clinical stage 4 without mention of tuberculosis or malaria"
* #XM63K0 "Anti-infective antiviral"
* #XM35P4 "Abacavir"
* #XM2L06 "Emtricitabine"
* #XM5471 "Lamivudine"
* #XM9C07 "Zidovudine"
* #XM8Z78 "Didanosine"
* #XM7RM1 "Stavudine"
* #XM67N3 "Tenofovir disoproxil" 
* #XM1DX2 "Efavirenz"
* #XM7N44 "Etravirine"
* #XM10T5 "Nevirapine"
* #XM1KD4 "Rilpivirine"
* #XM4TF3 "Atazanavir and Ritonavir"
* #XM3EH7 "Lopinavir and Ritonavir"
* #XM8ZN1 "Darunavir and Ritonavir"
* #XM56L1 "Ritonavir"
* #XM6K45 "Dolutegravir"
* #XM82D3 "Raltegravir"
* #XM8QY9 "Lamivudine, Tenofovir disoproxil and Dolutegravir"
* #XM3U67 "Antivirals for treatment of human immunodeficiency virus infections, combinations  best fit"
* #XM9NL2 "Lamivudine, Tenofovir disoproxil and Efavirenz"
* #XM2UU9 "Lamivudine, Abacavir and Dolutegravir"

CodeSystem: DAKDispensingQuantityCS
Id: DAKDispensingQuantityCS
Title: "DAKDispensingQuantityCS"
Description: "DAKDispensingQuantityCS"
* ^experimental = false
* ^caseSensitive = false
* #notMMD "<3 months of ARVs"
* #3to5MMD "3-5 months of ARVs"
* #6MMD "6 or more months of ARVs"
* #NoData "No Data"

CodeSystem: DAKCoarseAgeRangeCS
Id: DAKCoarseAgeRangeCS
Title: "DAKCoarseAgeRangeCS"
Description: "DAKCoarseAgeRangeCS"
* ^experimental = true
* ^caseSensitive = false
* #lt15 "<15"
* #gt15 "15+"

ValueSet: DAKCoarseAgeRange
Id: DAKCoarseAgeRange
Title: "DAKCoarseAgeRange"
Description: "DAKCoarseAgeRange"
* ^experimental = false
* include codes from system DAKCoarseAgeRangeCS

ValueSet: DAKDispensingQuantity
Id: DAKDispensingQuantity
Title: "DAKDispensingQuantity"
Description: "DAKDispensingQuantity"
* ^experimental = false
* include codes from system DAKDispensingQuantityCS

ValueSet: DAKPLHIV
Id: DAKPLHIV
Title: "WHO HIV Clinical Stages"
Description: "WHO HIV Clinical Stages"
* ^experimental = false
* $ICD11#1C62.0 "HIV disease clinical stage 1 without mention of tuberculosis or malaria"
* $ICD11#1C62.1 "HIV disease clinical stage 2 without mention of tuberculosis or malaria"
* $ICD11#1C62.2 "HIV disease clinical stage 3 without mention of tuberculosis or malaria"
* $ICD11#1C62.3 "HIV disease clinical stage 4 without mention of tuberculosis or malaria"
* $SCT#737378009 "World Health Organization 2007 Human immunodeficiency virus infection clinical stage 1 (finding)"
* $SCT#737379001 "World Health Organization 2007 Human immunodeficiency virus infection clinical stage 2 (finding)"
* $SCT#737380003 "World Health Organization 2007 Human immunodeficiency virus infection clinical stage 3 (finding)"
* $SCT#737381004 "World Health Organization 2007 Human immunodeficiency virus infection clinical stage 4 (finding)"

ValueSet: DAKARVDrugPickup
Id: DAKARVDrugPickup
Title: "DAK Drug Pickup Appointment codes"
Description: "DAK Drug Pickup Appointment codes"
* ^experimental = false
* $ICD11#XM63K0 "Code title:  Anti-infective antiviral"
* $SCT#788081006 "Medicinal product acting as antiviral (product)"
* $LNC#45260-7 "HIV ART medication"

ValueSet: DAKMMD
Id: DAKMMD
Title: "DAK Multi-Month Dispense codes"
Description: "DAK Multi-Month Dispense codes for number of days dispensed"
* ^experimental = false
* $SCT#258703001 "Day (qualifier value)"

ValueSet: DAKONART
Id: DAKONART
Title: "DAK Codes for On ART"
Description: "HIV DAK codes for on ART"
* ^experimental = false
* CIEL#160119 "Currently taking ARV"
* $ICD11#XM63K0 "Anti-infective antiviral"
* $SCT#182929008 "Drug prophylaxis (procedure)"

ValueSet: DAKARTStop
Id: DAKARTStop
Title: "DAK Codes for ART Stopped"
Description: "HIV DAK codes for ART Stopped"
* ^experimental = false
* $SCT#413947000 "Date treatment stopped (observable entity)"

ValueSet: DAKHIVTransfer
Id: DAKHIVTransfer
Title: "DAK Codes for Transfer in for HIV Care"
Description: "HIV DAK codes for Transfer in for HIV Care"
* ^experimental = false
* $SCT#413946009 "Date treatment started (observable entity)"

ValueSet: DAKARTMeds
Id: DAKARTMeds
Title: "ART medications"
Description: "ART medications from the HIV DAK"
* ^experimental = false
* $ICD11#XM35P4 "Abacavir"
* $ICD11#XM2L06 "Emtricitabine"
* $ICD11#XM5471 "Lamivudine"
* $ICD11#XM9C07 "Zidovudine"
* $ICD11#XM8Z78 "Didanosine"
* $ICD11#XM7RM1 "Stavudine"
* $ICD11#XM67N3 "Tenofovir disoproxil" 
* $ICD11#XM1DX2 "Efavirenz"
* $ICD11#XM7N44 "Etravirine"
* $ICD11#XM10T5 "Nevirapine"
* $ICD11#XM1KD4 "Rilpivirine"
* $ICD11#XM4TF3 "Atazanavir and Ritonavir"
* $ICD11#XM3EH7 "Lopinavir and Ritonavir"
* $ICD11#XM8ZN1 "Darunavir and Ritonavir"
* $ICD11#XM56L1 "Ritonavir"
* $ICD11#XM6K45 "Dolutegravir"
* $ICD11#XM82D3 "Raltegravir"
* $ICD11#XM8QY9 "Lamivudine, Tenofovir disoproxil and Dolutegravir"
* $ICD11#XM3U67 "Antivirals for treatment of human immunodeficiency virus infections, combinations  best fit"
* $ICD11#XM9NL2 "Lamivudine, Tenofovir disoproxil and Efavirenz"
* $ICD11#XM2UU9 "Lamivudine, Abacavir and Dolutegravir"
* $SCT#387005008 "Abacavir (substance)"
* $SCT#404856006 "Emtricitabine (substance)"
* $SCT#386897000 "Lamivudine (substance)"
* $SCT#387151007 "Zidovudine (substance)"
* $SCT#387105006 "Didanosine (substance)"
* $SCT#386895008 "Stavudine (substance)"
* $SCT#422091007 "Tenofovir (substance)"
* $SCT#387001004 "Efavirenz (substance)"
* $SCT#432121008 "Etravirine (substance)"
* $SCT#386898005 "Nevirapine (substance)"
* $SCT#703123005 "Rilpivirine (substance)"
* $SCT#427314002 "Antiviral therapy (procedure)"
* $SCT#776569000 "Product containing only lopinavir and ritonavir (medicinal product)"
* $SCT#386896009 "Ritonavir (substance)"
* $SCT#713464000 "Dolutegravir (substance)"
* $SCT#429707008 "Raltegravir (substance)"
* $SCT#708255002 "First-line treatment (procedure)"
* $SCT#708256001 "Second-line treatment (procedure)"

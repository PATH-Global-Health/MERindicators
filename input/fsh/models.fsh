Logical: TXCURRelements
// Parent: Base
Id: TXCURRelements
Title: "TXCURRelements"
Description: "Base elements required for TXCURR"
* deceased[x] 0..1 boolean or dateTime "Indication if the human is deceased"
* birthDate 0..1 dateTime "The date of birth, if known"
* age_end_reporting_period 1..1 integer "Age at end of reporting period"
* age_group 1..1 Coding "Age group TXCURR VS"
* age_group from AgeRangesTXCURRVS
* gender 1..1 Coding "Gender of the patient"
* gender from http://hl7.org/fhir/ValueSet/administrative-gender
* facility 1..1 Reference "Last known facility where the patient received care"
* keypop 1..* Coding "Member of key populations"
* keypop from KeyPopVS
* focuspop 0..* Coding "Member of focus populations"
* focuspop from FocusPopVS
* pregnant 1..1 Coding "If patient is pregnant during reporting period"
* pregnant from PregnantVS // or from PregnantVSCIEL
* on_arv 1..1 Coding "Currently on ARV"
* on_arv from OnARVVS
* pep_prep 1..1 boolean "If ARV was prescribed for PEP or PrEP"
* dispening_quantity 0..1 boolean "Multi-month dispensing (MMD), least 3 months of ARVs"
* mmd_interval 0..1 Coding "disaggregates MMD data by dispensing interval (3–5MMD and 6MMD)"
* mmd_interval from MMDIntervalVS

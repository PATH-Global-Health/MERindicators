Logical: TXCURRelements
// Parent: Base
Id: TXCURRelements
Title: "TXCURRelements"
Description: "Base elements required for TXCURR"
* deceased[x] 0..1 boolean or dateTime "Indication if the human is deceased"
* birthDate 0..1 dateTime "The date of birth, if known"
* age_end_reporting_period 1..1 integer "Age at end of reporting period"
* age_group 1..1 Coding "Age group TXCURR VS"
* age_group from AgeRangesTXCURR
* gender 1..1 Coding "Gender of the patient"
* gender from http://hl7.org/fhir/ValueSet/administrative-gender
// this is set as a Reference(Location) in the OpenMRS FHIR IG
* facility 1..1 Reference "Last known facility where the patient received care"
* keypop 1..* Coding "Member of key populations"
* keypop from KeyPop
* focuspop 0..* Coding "Member of focus populations"
* focuspop from FocusPop
* pregnant 1..1 Coding "If patient is pregnant during reporting period"
* pregnant from Pregnant // or from PregnantCIEL
* on_arv 1..1 Coding "Currently on ARV"
* on_arv from OnARV
* pep_prep 1..1 boolean "If ARV was prescribed for PEP or PrEP"
* dispening_quantity 0..1 boolean "Multi-month dispensing (MMD), least 3 months of ARVs"
* mmd_interval 0..1 Coding "disaggregates MMD data by dispensing interval (3–5MMD and 6MMD)"
* mmd_interval from MMDInterval

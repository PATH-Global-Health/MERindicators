Instance:     PatientCIEL
InstanceOf:   Patient
Title: "PatientCIEL"
Description: "PatientCIEL"
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"
* identifier.use = #official
* identifier.extension[OMRSPatientIdentifierLocationExtension].valueReference = Reference(LocationCIEL)
  * type = "Location"
  * display = "Inpatient Ward"
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier.type.text = "OpenMRS ID"
* identifier.value = "1234567"



Instance: Condition-PregnancyCIEL
InstanceOf: Condition
Title: "Condition-PregnancyCIEL"
Description: "Condition-PregnancyCIEL"
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(PatientCIEL)
* code = $SCT#77386006 "Pregnancy (finding)"
* onsetDateTime = "2020-01-01"
* abatementDateTime = "2020-09-30"

// currently on ARV

Instance: EncounterCIEL
InstanceOf: Encounter
Title: "EncounterCIEL"
Description: "EncounterCIEL"
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(PatientCIEL)
* location[+].location = Reference(LocationCIEL)
* period.start = "2011-01-01"
* period.end = "2011-01-01"


// Instance: DiagnosticReportCIEL
// InstanceOf: DiagnosticReport
// Title: "DiagnosticReportCIEL"
// Description: "DiagnosticReportCIEL"
// * status = #final
// * encounter = Reference(EncounterCIEL)
// * subject = Reference(PatientCIEL)
// * result = Reference(ObservationCIEL)
// * code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"


Instance: ObservationCIEL
InstanceOf: Observation
Title: "ObservationCIEL"
Description: "ObservationCIEL"
* status = #final
// * encounter = Reference(EncounterCIEL)
* subject = Reference(PatientCIEL)
* code = $CIEL#160119 "CURRENTLY TAKING ARV"
* valueCodeableConcept = $CIEL#1065 "YES"



// bundle it all up

Instance: ExampleCIEL
InstanceOf: Bundle
Title: "ExampleCIEL"
Description: "ExampleCIEL"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/PatientCIEL"
* entry[=].request.url = "Patient/PatientCIEL"
* entry[=].resource = PatientCIEL
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/OrganizationCIEL"
* entry[=].request.url = "Organization/OrganizationCIEL"
* entry[=].resource = OrganizationCIEL
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/LocationCIEL"
* entry[=].request.url = "Location/LocationCIEL"
* entry[=].resource = LocationCIEL
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Condition/Condition-PregnancyCIEL"
* entry[=].request.url = "Condition/Condition-PregnancyCIEL"
* entry[=].resource = Condition-PregnancyCIEL
* insert patient-bundle

// 

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Encounter/EncounterCIEL"
* entry[=].request.url = "Encounter/EncounterCIEL"
* entry[=].resource = EncounterCIEL
* insert patient-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/DiagnosticReport/DiagnosticReportCIEL"
// * entry[=].request.url = "DiagnosticReport"
// * entry[=].resource = DiagnosticReportCIEL
// * insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Observation/ObservationCIEL"
* entry[=].request.url = "Observation/ObservationCIEL"
* entry[=].resource = ObservationCIEL
* insert patient-bundle

Instance: PatientOMRS0
InstanceOf: OMRSPatient
Usage: #example
Title: "OpenMRS Patient Example"
Description: "Example OpenMRS Patient resource"
* identifier.use = #official
* identifier.extension[OMRSPatientIdentifierLocationExtension].valueReference = Reference(LocationExample)
  * type = "Location"
  * display = "Inpatient Ward"
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier.type.text = "OpenMRS ID"
* identifier.value = "4343534"
* name.family = "Jeannette"
* name.given = "Ricky"
* gender = #male
* birthDate = "1996-12-12"
* deceasedBoolean = false


Instance: EncounterOMRS0
InstanceOf: OMRSEncounter 
Usage: #example
Title: "OpenMRS Encounter Resource Example"
Description: "Example OpenMRS Encounter resource"
// * subject 1..1
// * subject only Reference(OMRSPatient)
// * period 1..1
// * location.location 1..1
// * location.location only Reference(OMRSLocation)
// * id = "5b829d01-34bb-47d1-b1bb-9303c3a9ebcb"
* status = #unknown
//* class.code = 
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* subject = Reference(PatientOMRS0)
* subject.type = "Patient"
// todo
* type.coding.code = #67a71486-1a54-468f-ac3e-7091a9a79584
* type.coding.display = "Vitals"
* type.coding.system = "http://fhir.openmrs.org/code-system/encounter-type"
* period[0].start = 2022-06-22
* period[0].end = 2022-06-22
* location.location = Reference(LocationExample)


Instance: ObservationOMRS0
InstanceOf: OpenMRSObservation
Usage: #example
Title: "OpenMRS Observation Example"
Description: "Example OpenMRS Observation resource"
* category.coding[+].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding[=].code = #exam
* code.coding[+] = $CIEL#160119 "Currently taking ARV"
* code.text = "Currently taking ARV"
// * code.coding[+].code = #160119
// * code.coding[=].system = $CIEL
// * code.coding[=].display = "Currently taking ARV"
* status = #final
// cant use this in openmrs fhir ig, only on encounter
// * effectiveDateTime = "2022-04-01"
* subject = Reference(PatientOMRS0)
// fsh complains without encounter
* encounter = Reference(EncounterExample)
* valueCodeableConcept = $CIEL#1065 "Yes"


// bundle it all up

Instance: ExampleOMRS0
InstanceOf: Bundle
Title: "Example0"
Description: "Example0"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/PatientOMRS0"
* entry[=].request.url = "Patient/PatientOMRS0"
* entry[=].resource = PatientOMRS0
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/LocationExample"
* entry[=].request.url = "Location/LocationExample"
* entry[=].resource = LocationExample
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Encounter/EncounterOMRS0"
* entry[=].request.url = "Encounter/EncounterOMRS0"
* entry[=].resource = EncounterOMRS0
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Observation/ObservationOMRS0"
* entry[=].request.url = "Observation/ObservationOMRS0"
* entry[=].resource = ObservationOMRS0
* insert patient-bundle
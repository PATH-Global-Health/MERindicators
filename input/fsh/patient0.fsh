// This is a copy from the openmrs-fhir2-ig example

Instance: example-openmrs-Patient
InstanceOf: OMRSPatient
Usage: #example
Title: "OpenMRS Patient Example"
Description: "Example OpenMRS Patient resource"
// * id 1..1
// * identifier 1..*
// * identifier ^slicing.discriminator.type = #value
// * identifier ^slicing.discriminator.path = "system"
// * identifier ^slicing.rules = #open
// * identifier only OMRSPatientIdentifier
// * active 1..1
// * active = true
// * name 1..1
// * gender 1..1
// * birthDate 1..1
// * deceased[x] 0..1
// * address 0..*
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
* telecom[0].value = "+256788232241"
* telecom[0].system = #phone
* address.use = #home
* address.country = "Washington"
* address.city = "Washington"
* address.district = "Washington"
* active = true 
* deceasedBoolean = false


Instance: LocationExample
InstanceOf: OMRSLocation
Usage: #example
Title: "Location Example"
Description: "Example OpenMRS Location resource"
// * id 1..1
// * status 0..1 
// //* status from LocationStatusVS
// * name 1..1 
// * description 1..1
// * type 0..*
// * position 0..1 
// * position.longitude 1..1
// * position.latitude 1..1 
// * telecom 0..*
// * telecom only OMRSLocationContactPoint 
// * address only OMRSAddress
// * partOf 0..1
* id = "a3b793f0-eb53-4cda-92ce-fe0a77106252"
* status = #active
* name = "Outpatient Clinic"
* description = "Outpatient Clinic"
* type.coding[0].code = #SLEEP
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type.coding[0].display = "Sleep disorders unit"
* telecom[+].system = #phone
* telecom[=].value = "(+1) 734-677-7777"
* telecom[+].system = #fax
* telecom[=].value = "(+1) 734-677-6622"
* telecom[+].system = #email
* telecom[=].value =  "hq@HL7.org"
* address.use = #home
* address.line[0] = "3300 Washtenaw Avenue, Suite 227"
* address[0].city = "Ann Arbor"
* address[0].district = "Mukono"
* address[0].state = "MI"
* address[0].postalCode = "48104"
* address[0].country = "USA"
* position[0].latitude = 42.256500
* position[0].longitude = -83.694710


Instance: ConditionExample
InstanceOf: OMRSCondition 
Usage: #example
Title: "OpenMRS Condition Resource Example"
Description: "Example OMRS Condition resource"
// * id 1..1 
// * code 0..1
// * subject 1..1
// * subject only Reference(OMRSPatient)
// * onsetDateTime 0..1
// * recorder 0..1 
// * recordedDate 0..1
// * clinicalStatus 0..0
// * verificationStatus 0..0
// * category 0..0
// * severity 0..0
// * bodySite 0..0
// * encounter 0..0
// * asserter 0..0
// * stage 0..0
// * evidence 0..0
* id = "a6867095-e2b1-4a68-9aaa-0d161a37ce9c"
//* code.coding = #116128AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
* code.coding.system = "https://openconceptlab.org/orgs/CIEL/sources/CIEL"
* code.coding.code = #116128
* subject = Reference(example-openmrs-Patient)
* subject.type = "Patient"
* subject.identifier.use = #official
* subject.identifier.value = #101-6
* subject.display =  "Horatio Hornblower (OpenMRS ID:101-6)"
* recordedDate = "2019-06-18T06:37:26+03:00"


Instance: EncounterExample
InstanceOf: OMRSEncounter 
Usage: #example
Title: "OpenMRS Encounter Resource Example"
Description: "Example OpenMRS Encounter resource"
// * id 1..1 
// * meta 0..1 
// * meta.tag 0..* 
// * meta.tag ^slicing.discriminator.type = #value
// * meta.tag ^slicing.discriminator.path = "system"
// * meta.tag ^slicing.rules = #closed
// * status 1..1 
// * class 1..1 
// * class.code
// * class.system 
// * type 1..*
// * subject 1..1
// * subject only Reference(OMRSPatient)
// * participant 0..*
// * period 1..1
// * diagnosis 0..*
// * location.location 1..1
// * location.location only Reference(OMRSLocation)
// * partOf only Reference(OMRSEncounter)
* id = "5b829d01-34bb-47d1-b1bb-9303c3a9ebcb"
* status = #unknown
//* class.code = 
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* subject = Reference(example-openmrs-Patient)
* subject.type = "Patient"
* type.coding.code = #67a71486-1a54-468f-ac3e-7091a9a79584
* type.coding.display = "Vitals"
* type.coding.system = "http://fhir.openmrs.org/code-system/encounter-type"
* period[0].start = 2022-06-22
* period[0].end = 2022-06-22
* location.location = Reference(LocationExample)


Instance: example-Openmrs-DiagnosticReport
InstanceOf: OpenMRSDiagnosticReport
Usage: #example
Title: "Openmrs DiagnosticReport"
Description: "Example OMRS DiagnosticReport Resource"
// * id 1..1
// * code 1..1
// * code.coding from OpenMRSOrderCodeVS
// * result  0..*
// * result only Reference(OpenMRSObservation)
// * status 1..1
// * category 0..*
// * encounter 0..1
// * subject 0..1
// * issued  0..1
* id = "8a849d5e-6011-4279-a124-40ada5a687de"
//* code.coding[+].system = "http://loinc.org"
* code.coding[+] = LOINC#8480-6
* code.coding[=].display = "Systolic blood pressure"
* subject = Reference(example-openmrs-Patient)
* encounter = Reference(EncounterExample)
* result = Reference(example-openmrs-Observation)
* issued = "2011-03-04T11:45:33+11:00"
* status = #final


Instance: example-openmrs-Observation
InstanceOf: OpenMRSObservation
Usage: #example
Title: "OpenMRS Observation Example"
Description: "Example OpenMRS Observation resource"
// * code 1..1
// * subject 0..1
// * category 1..*
// * status 1..1
// * interpretation 0..1
// * basedOn 0..*
// * basedOn only Reference(OpenMRSServiceRequest)
// * encounter 1..1
// * value[x] 0..1
// * referenceRange 0..*
// * referenceRange.high 1..1
// * referenceRange.low 1..1
// * referenceRange.type 1..1
// * referenceRange.modifierExtension 0..0
// * referenceRange.appliesTo 0..0
// * referenceRange.text 0..0
// * referenceRange.age 0..0
// * component 0..0
// * issued 0..0
// * effective[x] 0..0
// * performer 0..0
// * dataAbsentReason 0..0
// * bodySite 0..0
// * method 0..0
// * specimen 0..0
// * device 0..0
// * component 0..0
* category.coding[+].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding[=].code = #exam
* code.coding[+].code = #431314004
* code.coding[=].system = "http://snomed.info/sct"
* code.coding[=].display = "SpO2 - saturation of peripheral oxygen"
* code.text = "Arterial blood oxygen saturation (pulse oximeter)"
* status = #final
* subject = Reference(example-openmrs-Patient)
* encounter = Reference(EncounterExample)
* valueQuantity.value = 25.0
* valueQuantity.unit = "DEG C"
* interpretation.coding[0].code = #H
* interpretation.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* interpretation.coding[0].display = "High"
* referenceRange.low[0].value = 10.0
* referenceRange.high[0].value = 272.0
* referenceRange.type.coding[0].system = "http://fhir.openmrs.org/ext/obs/reference-range"
* referenceRange.type.coding[0].code = #absolute


// bundle it all up

Instance: Example0
InstanceOf: Bundle
Title: "Example0"
Description: "Example0"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/example-openmrs-Patient"
* entry[=].request.url = "Patient"
* entry[=].resource = example-openmrs-Patient
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/LocationExample"
* entry[=].request.url = "Location"
* entry[=].resource = LocationExample
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Condition/ConditionExample"
* entry[=].request.url = "Condition"
* entry[=].resource = ConditionExample
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Encounter/EncounterExample"
* entry[=].request.url = "Encounter"
* entry[=].resource = EncounterExample
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/DiagnosticReport/example-Openmrs-DiagnosticReport"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = example-Openmrs-DiagnosticReport
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Observation/example-openmrs-Observation"
* entry[=].request.url = "Observation"
* entry[=].resource = example-openmrs-Observation
* insert patient-bundle
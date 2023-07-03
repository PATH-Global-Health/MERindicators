Instance:     Patient-HIVSimple
InstanceOf:   Patient
Title: "Patient-HIVSimple"
Description: "Patient-HIVSimple"
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"

// conditions

Instance: Condition-HIVSimple
InstanceOf: Condition
Title: "Condition-HIVSimple"
Description: "Condition-HIVSimple"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple)
// todo: review this for consistency
* code = $SCT#86406008 "HIV - Human immunodeficiency virus infection"
* onsetDateTime = "2010-01-01"


Instance: Condition-Pregnancy
InstanceOf: Condition
Title: "Condition-Pregnancy"
Description: "Condition-Pregnancy"
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple)
* code = $SCT#77386006 "Pregnancy (finding)"
* onsetDateTime = "2020-01-01"
* abatementDateTime = "2020-09-30"

// hiv positive test

Instance: Encounter-HIVSimple
InstanceOf: Encounter
Title: "Encounter-HIVSimple"
Description: "Encounter-HIVSimple"
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-HIVSimple)
// * serviceProvider = Reference(Organization-HIVSimple1)
* serviceProvider.identifier.system = $synthea
* serviceProvider.identifier.value = "Organization-HIVSimple1"
* location[+].location = Reference(Location-HIVSimple1)
// * location[+].location.identifier.system = $synthea
// * location[=].location.identifier.value = "Location-HIVSimple1"
* period.start = "2011-01-01"
* period.end = "2011-01-01"


Instance: DiagnosticReport-HIVSimple
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-HIVSimple"
Description: "DiagnosticReport-HIVSimple"
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
* result = Reference(Observation-HIVSimple)
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"


Instance: Observation-HIVSimple
InstanceOf: Observation
Title: "Observation-HIVSimple"
Description: "Observation-HIVSimple"
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"
* valueCodeableConcept = $SCT#165816005 "HIV Positive"

// hiv viral load

Instance: Encounter-ViralLoad
InstanceOf: Encounter
Title: "Encounter-ViralLoad"
Description: "Encounter-ViralLoad"
Usage: #example
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-HIVSimple)
// * serviceProvider = Reference(Organization-HIVSimple1)
* serviceProvider.identifier.system = $synthea
* serviceProvider.identifier.value = "Organization-HIVSimple1"
* location[+].location = Reference(Location-HIVSimple1)
// * location[+].location.identifier.system = $synthea
// * location[=].location.identifier.value = "Location-HIVSimple1"
* period.start = "2020-06-01"
* period.end = "2020-06-01"


Instance: DiagnosticReport-ViralLoad
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-ViralLoad"
Description: "DiagnosticReport-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple)
* encounter = Reference(Encounter-ViralLoad)
* result = Reference(Observation-ViralLoad)
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"


Instance: Observation-ViralLoad
InstanceOf: Observation
Title: "Observation-ViralLoad"
Description: "Observation-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple)
* encounter = Reference(Encounter-ViralLoad) 
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"
* valueQuantity.value = 741660
* valueQuantity.unit = "copies/mL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{copies}/mL
// add to bulk
* issued = "2020-06-01T13:28:17.239+02:00"


// hiv viral load2

Instance: Encounter2-ViralLoad
InstanceOf: Encounter
Title: "Encounter2-ViralLoad"
Description: "Encounter2-ViralLoad"
Usage: #example
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-HIVSimple)
* serviceProvider.identifier.system = $synthea
* serviceProvider.identifier.value = "Organization-HIVSimple1"
* location[+].location = Reference(Location-HIVSimple1)
// * location[+].location.identifier.system = $synthea
// * location[=].location.identifier.value = "Location-HIVSimple1"
* period.start = "2020-06-01"
* period.end = "2020-06-01"


Instance: DiagnosticReport2-ViralLoad
InstanceOf: DiagnosticReport
Title: "DiagnosticReport2-ViralLoad"
Description: "DiagnosticReport2-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple)
* encounter = Reference(Encounter2-ViralLoad)
* result = Reference(Observation2-ViralLoad)
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"


Instance: Observation2-ViralLoad
InstanceOf: Observation
Title: "Observation2-ViralLoad"
Description: "Observation2-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple)
* encounter = Reference(Encounter2-ViralLoad) 
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"
* valueQuantity.value = 800
* valueQuantity.unit = "copies/mL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{copies}/mL
* issued = "2020-09-01T13:28:17.239+02:00"


// bundle it all up

Instance: Example-HIVSimple
InstanceOf: Bundle
Title: "Example-HIVSimple"
Description: "Example-HIVSimple"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Patient-HIVSimple"
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/Organization-HIVSimple1"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple1
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/Location-HIVSimple1"
* entry[=].request.url = "Location"
* entry[=].resource = Location-HIVSimple1
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Condition/Condition-HIVSimple"
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Condition/Condition-Pregnancy"
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-Pregnancy
* insert patient-bundle

// encounter for hiv test

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Encounter/Encounter-HIVSimple"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/DiagnosticReport/DiagnosticReport-HIVSimple"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Observation/Observation-HIVSimple"
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-HIVSimple
* insert patient-bundle

// encounter for viral load

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Encounter/Encounter-ViralLoad"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-ViralLoad
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/DiagnosticReport/DiagnosticReport-ViralLoad"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-ViralLoad
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Observation/Observation-ViralLoad"
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-ViralLoad
* insert patient-bundle

// encounter for viral load2

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Encounter/Encounter2-ViralLoad"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter2-ViralLoad
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/DiagnosticReport/DiagnosticReport2-ViralLoad"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport2-ViralLoad
* insert patient-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Observation/Observation2-ViralLoad"
* entry[=].request.url = "Observation"
* entry[=].resource = Observation2-ViralLoad
* insert patient-bundle

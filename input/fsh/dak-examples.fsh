Instance: Organization-DAK
InstanceOf: Organization
Title: "DAK Organization"
Description: "DAK Organization"
* name = "DAK Organization"

Instance: Location-DAK
InstanceOf: Location
Title: "DAK Location"
Description: "DAK Location"
* name = "DAK Location"

Instance:     Patient-DAK-onart
InstanceOf:   Patient
Title: "Patient-DAK-onart"
Description: "Patient-DAK-onart"
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"

Instance: Condition-DAK-onart-hiv
InstanceOf: Condition
Title: "Condition-DAK-onart-hiv"
Description: "Condition-DAK-onart-hiv"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-DAK-onart)
* code = $SCT#737378009 "World Health Organization 2007 Human immunodeficiency virus infection clinical stage 1 (finding)"
* onsetDateTime = "2020-01-01"

Instance: Condition-DAK-onart-art
InstanceOf: Condition
Title: "Condition-DAK-onart-art"
Description: "Condition-DAK-onart-art"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-DAK-onart)
* code = $SCT#182929008 "Drug prophylaxis (procedure)"
* onsetDateTime = "2020-01-01"

Instance: Encounter-DAK-onart
InstanceOf: Encounter
Title: "Encounter-DAK-onart"
Description: "Encounter-DAK-onart"
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-DAK-onart)
* serviceProvider = Reference(Organization-DAK)
* location[+].location = Reference(Location-DAK)
* period.start = "2023-07-03"
* period.end = "2023-07-03"

Instance: Observation-DAK-onart
InstanceOf: Observation
Title: "Observation-DAK-onart"
Description: "Observation-DAK-onart"
* status = #final
* encounter = Reference(Encounter-DAK-onart)
* subject = Reference(Patient-DAK-onart)
* code = $SCT#182929008 "Drug prophylaxis (procedure)"
* valueBoolean = true
* effectiveDateTime = "2023-07-03"

Instance: Observation-DAK-onart-dispense
InstanceOf: Observation
Title: "Observation-DAK-onart-dispense"
Description: "Observation-DAK-onart-dispense"
* status = #final
* encounter = Reference(Encounter-DAK-onart)
* subject = Reference(Patient-DAK-onart)
* code = $SCT#258703001 "Day (qualifier value)"
* valueInteger = 90
* effectiveDateTime = "2023-07-03"

Instance: MedicationRequest-DAK-onart
InstanceOf: MedicationRequest
Title: "MedicationRequest-DAK-onart"
Description: "MedicationRequest-DAK-onart"
* status = #active
* intent = #order
* subject = Reference(Patient-DAK-onart)
* authoredOn = "2023-07-03"
* medicationCodeableConcept = $ICD11#XM35P4 "Abacavir"

Instance: Example-DAK-onart
InstanceOf: Bundle
Title: "Example-DAK-onart"
Description: "Example-DAK-onart"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Patient-DAK-onart"
* entry[=].request.url = "Patient/Patient-DAK-onart"
* entry[=].request.method = #PUT
* entry[=].resource = Patient-DAK-onart

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Condition-DAK-onart-hiv"
* entry[=].request.url = "Condition/Condition-DAK-onart-hiv"
* entry[=].request.method = #PUT
* entry[=].resource = Condition-DAK-onart-hiv

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Condition-DAK-onart-art"
* entry[=].request.url = "Condition/Condition-DAK-onart-art"
* entry[=].request.method = #PUT
* entry[=].resource = Condition-DAK-onart-art

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Encounter-DAK-onart"
* entry[=].request.url = "Encounter/Encounter-DAK-onartonart"
* entry[=].request.method = #PUT
* entry[=].resource = Encounter-DAK-onart

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Observation-DAK-onart"
* entry[=].request.url = "Observation/Observation-DAK-onart"
* entry[=].request.method = #PUT
* entry[=].resource = Observation-DAK-onart

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Observation-DAK-onart"
* entry[=].request.url = "Observation/Observation-DAK-onart"
* entry[=].request.method = #PUT
* entry[=].resource = Observation-DAK-onart

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/Observation-DAK-onart-dispense"
* entry[=].request.url = "Observation/Observation-DAK-onart-dispense"
* entry[=].request.method = #PUT
* entry[=].resource = Observation-DAK-onart-dispense

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/MedicationRequest-DAK-onart"
* entry[=].request.url = "MedicationRequest/MedicationRequest-DAK-onart"
* entry[=].request.method = #PUT
* entry[=].resource = MedicationRequest-DAK-onart

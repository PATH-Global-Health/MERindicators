Instance: DeceasedBoolean
InstanceOf: Patient
Usage: #example
* active = true
* name.use = #official
* name.family = "Notsowell"
* name.given = "Sandy"
* gender = #female
* birthDate = "1982-08-02"
* deceasedBoolean = true

Instance: ExampleDeceasedBoolean
InstanceOf: Bundle
Title: "ExampleDeceasedBoolean"
Description: "ExampleDeceasedBoolean"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/DeceasedBoolean"
* entry[=].request.url = "Patient/DeceasedBoolean"
* entry[=].resource = DeceasedBoolean
* insert patient-bundle

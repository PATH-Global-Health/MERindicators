Instance: DeceasedDateTime
InstanceOf: Patient
Usage: #example
* active = true
* name.use = #official
* name.family = "Notsowell"
* name.given = "Simon"
* gender = #male
* birthDate = "1982-01-23"
* deceasedDateTime = "2015-02-14T13:42:00+10:00"

Instance: ExampleDeceasedDateTime
InstanceOf: Bundle
Title: "ExampleDeceasedDateTime"
Description: "ExampleDeceasedDateTime"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Patient/DeceasedDateTime"
* entry[=].request.url = "Patient/DeceasedDateTime"
* entry[=].resource = DeceasedDateTime
* insert patient-bundle

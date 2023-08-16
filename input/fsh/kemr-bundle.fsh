Instance: KEMRBundle
InstanceOf: Bundle
Title: "KEMRBundle"
Description: "KEMRBundle"
* type = #transaction

// code systems

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/CodeSystem/CIEL"
* entry[=].request.url = "CodeSystem/CIEL"
* entry[=].resource = CIEL
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/CodeSystem/EnrollmentMethods"
* entry[=].request.url = "CodeSystem/EnrollmentMethods"
* entry[=].resource = EnrollmentMethods
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/CodeSystem/OpenHIE"
* entry[=].request.url = "CodeSystem/OpenHIE"
* entry[=].resource = OpenHIE
* insert conformance-bundle

// value sets

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/ValueSet/OnARV"
* entry[=].request.url = "ValueSet/OnARV"
* entry[=].resource = OnARV
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/ValueSet/Pregnant"
* entry[=].request.url = "ValueSet/Pregnant"
* entry[=].resource = Pregnant
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/ValueSet/SyntheaHIVMedications"
* entry[=].request.url = "ValueSet/SyntheaHIVMedications"
* entry[=].resource = SyntheaHIVMedications
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/ValueSet/CIELHIVMedications"
* entry[=].request.url = "ValueSet/CIELHIVMedications"
* entry[=].resource = CIELHIVMedications
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/ValueSet/EnrollmentMethodsforHIVProgram"
* entry[=].request.url = "ValueSet/EnrollmentMethodsforHIVProgram"
* entry[=].resource = EnrollmentMethodsforHIVProgram
* insert conformance-bundle


// libraries


* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Library/FHIRCommon"
* entry[=].request.url = "Library/FHIRCommon"
* entry[=].resource = FHIRCommon
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Library/FHIRHelpers"
* entry[=].request.url = "Library/FHIRHelpers"
* entry[=].resource = FHIRHelpers
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Library/Debug"
* entry[=].request.url = "Library/Debug"
* entry[=].resource = Debug
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Library/KenyaEMRConcepts"
* entry[=].request.url = "Library/KenyaEMRConcepts"
* entry[=].resource = KenyaEMRConcepts
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Library/KenyaEMRStratifiers"
* entry[=].request.url = "Library/KenyaEMRStratifiers"
* entry[=].resource = KenyaEMRStratifiers
* insert conformance-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Library/KenyaEMRTXCURR"
* entry[=].request.url = "Library/KenyaEMRTXCURR"
* entry[=].resource = KenyaEMRTXCURR
* insert conformance-bundle


// measures


* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Measure/KEMRTXCURR"
* entry[=].request.url = "Measure/KEMRTXCURR"
* entry[=].resource = KEMRTXCURR
* insert conformance-bundle

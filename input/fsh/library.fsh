// https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/Resource.20names.20not.20populating

RuleSet: lib-common
* status = #draft
* experimental = true
* type = $library-type#logic-library
// * identifier.system = "https://path-global-health.github.io/MERindicators/Library"


Instance: FHIRCommon
InstanceOf: Library
Title: "FHIRCommon"
Description: "FHIRCommon"
* insert lib-common
* name = "FHIRCommon"
* title = "FHIRCommon"
* description = "FHIRCommon"
* version = "4.0.1"
// change to proper url
* url = "https://path-global-health.github.io/MERindicators/Library/FHIRCommon"
// * identifier.value = "FHIRCommon"
* content.id = "ig-loader-FHIRCommon.cql"


Instance: FHIRHelpers
InstanceOf: Library
Title: "FHIRHelpers"
Description: "FHIRHelpers"
* insert lib-common
* name = "FHIRHelpers"
* title = "FHIRHelpers"
* description = "FHIRHelpers"
* version = "4.0.1"
// change to proper url
* url = "https://path-global-health.github.io/MERindicators/Library/FHIRHelpers"
// * identifier.value = "FHIRHelpers"
* content.id = "ig-loader-FHIRHelpers.cql"


// -----------------------------


Instance: Debug
InstanceOf: Library
Title: "Debug"
Description: "Debug"
* insert lib-common
* name = "Debug"
* title = "Debug"
* description = "Debug"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/Debug"
// * identifier.value = "Debug"
* content.id = "ig-loader-Debug.cql"


Instance: KenyaEMRConcepts
InstanceOf: Library
Title: "KenyaEMRConcepts"
Description: "KenyaEMRConcepts"
* insert lib-common
* name = "KenyaEMRConcepts"
* title = "KenyaEMRConcepts"
* description = "KenyaEMRConcepts"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/KenyaEMRConcepts"
// * identifier.value = "KenyaEMRConcepts"
* content.id = "ig-loader-KenyaEMRConcepts.cql"


// Instance: MERDataElements
// InstanceOf: Library
// Title: "MERDataElements"
// Description: "MERDataElements"
// * insert lib-common
// * name = "MERDataElements"
// * title = "MERDataElements"
// * description = "MERDataElements"
// * version = "0.1.0"
// * url = "https://path-global-health.github.io/MERindicators/Library/MERDataElements"
// // * identifier.value = "MERDataElements"
// * content.id = "ig-loader-MERDataElements.cql"


Instance: KenyaEMRStratifiers
InstanceOf: Library
Title: "KenyaEMRStratifiers"
Description: "KenyaEMRStratifiers"
* insert lib-common
* name = "KenyaEMRStratifiers"
* title = "KenyaEMRStratifiers"
* description = "KenyaEMRStratifiers"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/KenyaEMRStratifiers"
// * identifier.value = "KenyaEMRStratifiers"
* content.id = "ig-loader-KenyaEMRStratifiers.cql"


Instance: KenyaEMRTXCURR
InstanceOf: Library
Title: "KenyaEMRTXCURR"
Description: "KenyaEMRTXCURR"
* insert lib-common
* name = "KenyaEMRTXCURR"
* title = "KenyaEMRTXCURR"
* description = "KenyaEMRTXCURR"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/KenyaEMRTXCURR"
// * identifier.value = "KenyaEMRTXCURR"
* content.id = "ig-loader-KenyaEMRTXCURR.cql"


// Instance: KenyaEMRTXCURR
// InstanceOf: Library
// Title: "KenyaEMRTXCURR"
// Description: "KenyaEMRTXCURR"
// * insert lib-common
// * name = "KenyaEMRTXCURR"
// * title = "KenyaEMRTXCURR"
// * description = "KenyaEMRTXCURR"
// * version = "0.1.0"
// * url = "https://path-global-health.github.io/MERindicators/Library/KenyaEMRTXCURR"
// // * identifier.value = "KenyaEMRTXCURR"
// * content.id = "ig-loader-KenyaEMRTXCURR.cql"

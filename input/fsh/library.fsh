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


Instance: MERConcepts
InstanceOf: Library
Title: "MERConcepts"
Description: "MERConcepts"
* insert lib-common
* name = "MERConcepts"
* title = "MERConcepts"
* description = "MERConcepts"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/MERConcepts"
// * identifier.value = "MERConcepts"
* content.id = "ig-loader-MERConcepts.cql"


Instance: MERDataElements
InstanceOf: Library
Title: "MERDataElements"
Description: "MERDataElements"
* insert lib-common
* name = "MERDataElements"
* title = "MERDataElements"
* description = "MERDataElements"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/MERDataElements"
// * identifier.value = "MERDataElements"
* content.id = "ig-loader-MERDataElements.cql"


Instance: MERStratifiers
InstanceOf: Library
Title: "MERStratifiers"
Description: "MERStratifiers"
* insert lib-common
* name = "MERStratifiers"
* title = "MERStratifiers"
* description = "MERStratifiers"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/MERStratifiers"
// * identifier.value = "MERStratifiers"
* content.id = "ig-loader-MERStratifiers.cql"


Instance: MERTXCURR
InstanceOf: Library
Title: "MERTXCURR"
Description: "MERTXCURR"
* insert lib-common
* name = "MERTXCURR"
* title = "MERTXCURR"
* description = "MERTXCURR"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/MERTXCURR"
// * identifier.value = "MERTXCURR"
* content.id = "ig-loader-MERTXCURR.cql"


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

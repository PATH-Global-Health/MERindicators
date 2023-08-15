Instance: DAKConcepts
InstanceOf: Library
Title: "DAKConcepts"
Description: "DAKConcepts"
* status = #draft
* experimental = true
* type = $library-type#logic-library
* name = "DAKConcepts"
* title = "DAKConcepts"
* description = "DAKConcepts"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/DAKConcepts"
// * identifier.value = "DAKConcepts"
* content.id = "ig-loader-DAKConcepts.cql"


Instance: DAKDataElements
InstanceOf: Library
Title: "DAKDataElements"
Description: "DAKDataElements"
* status = #draft
* experimental = true
* type = $library-type#logic-library
* name = "DAKDataElements"
* title = "DAKDataElements"
* description = "DAKDataElements"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/DAKDataElements"
// * identifier.value = "DAKDataElements"
* content.id = "ig-loader-DAKDataElements.cql"


Instance: DAKStratifiers
InstanceOf: Library
Title: "DAKStratifiers"
Description: "DAKStratifiers"
* status = #draft
* experimental = true
* type = $library-type#logic-library
* name = "DAKStratifiers"
* title = "DAKStratifiers"
* description = "DAKStratifiers"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/DAKStratifiers"
// * identifier.value = "DAKStratifiers"
* content.id = "ig-loader-DAKStratifiers.cql"


Instance: DAKTXCURRLibrary
InstanceOf: Library
Title: "DAKTXCURR"
Description: "DAKTXCURR"
* status = #draft
* experimental = true
* type = $library-type#logic-library
* name = "DAKTXCURR"
* title = "DAKTXCURR"
* description = "DAKTXCURR"
* version = "0.1.0"
* url = "https://path-global-health.github.io/MERindicators/Library/DAKTXCURR"
// * identifier.value = "DAKTXCURR"
* content.id = "ig-loader-DAKTXCURR.cql"

Instance: DAKTXCURR
InstanceOf: Measure
Title: "DAKTXCURR"
Description: "DAKTXCURR"
* id = "DAKTXCURR"
* version = "0.1.0"
* status = #draft
* experimental = false
* date = "2023-07-01"
* publisher = "PATH"
* name = "DAKTXCURR"
* title = "DAKTXCURR"
* description = "DAKTXCURR"
* url = "https://path-global-health.github.io/MERindicators/Measure/DAKTXCURR"
* identifier[0].value = "MERTXCURR"

// cohort scoring version
/*
* scoring = $measure-scoring#cohort
* library[+] = Canonical(DAKTXCURRLibrary)
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Stratification"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Dispense Stratification"
*/
// continuous variable version
* scoring = $measure-scoring#continuous-variable
* library[+] = Canonical(DAKTXCURRLibrary)
* group[+]
  * population[+]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
    * id = "measure-population"
    * description = "Measure Population"
    * code = $measure-population#measure-population
    * criteria.language = #text/cql
    * criteria.expression = "Measure Population"
  * population[+]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
    * description = "Measure Population Exclusion"
    * code = $measure-population#measure-population-exclusion
    * criteria.language = #text/cql
    * criteria.expression = "Measure Population Exclusion"
  * population[+]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-criteriaReference].valueString = "measure-population"
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-aggregateMethod].valueCode = #count
    * description = "Measure Observation"
    * code = $measure-population#measure-observation
    * criteria.language = #text/cql
    * criteria.expression = "Measure Observation"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Stratification"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Dispense Stratification"

// proportion scoring version
/*
* scoring = $measure-scoring#proportion
* library[+] = Canonical(DAKTXCURRLibrary)
* group[+]
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Numerator-Exclusion"
    * code = $measure-population#numerator-exclusion
    * criteria.language = #text/cql
    * criteria.expression = "Numerator-Exclusion"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
  * population[+]
    * description = "Denominator-Exclusion"
    * code = $measure-population#denominator-exclusion
    * criteria.language = #text/cql
    * criteria.expression = "Denominator-Exclusion"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Stratification"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Dispense Stratification"
*/

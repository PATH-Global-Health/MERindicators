// Instance: KenyaEMRTXCURR
// InstanceOf: Measure
// Title: "KenyaEMRTXCURR"
// Description: "KenyaEMRTXCURR"
// * id = "KenyaEMRTXCURR"
// * identifier[0].system = "https://path-global-health.github.io/MERindicators/Measure/"
// * identifier[1].system = "https://datim.org/factsinfo/mechanism"
// // * identifier[1].value = "12345"
// * version = "0.1.0"
// * status = #draft
// * experimental = true
// * date = "2023-07-01"
// * publisher = "PATH"
// * name = "KenyaEMRTXCURR"
// * title = "KenyaEMRTXCURR"
// * description = "KenyaEMRTXCURR"
// * url = "https://path-global-health.github.io/MERindicators/Measure/KenyaEMRTXCURR"
// * identifier[0].value = "KenyaEMRTXCURR"
// * scoring = $measure-scoring#continuous-variable // not cohort
// * library[+] = Canonical(KenyaEMRTXCURR)
// * group[+]
//   * population[+]
//     * description = "Initial Population"
//     * code = $measure-population#initial-population
//     * criteria.language = #text/cql
//     * criteria.expression = "Initial Population"
//   * population[+]
//     * description = "Measure Population"
//     * code = $measure-population#measure-population
//     * criteria.language = #text/cql
//     * criteria.expression = "Measure Population"
//   * population[+]
//     * description = "Measure Population Exclusion"
//     * code = $measure-population#measure-population-exclusion
//     * criteria.language = #text/cql
//     * criteria.expression = "Measure Population Exclusion"
//   * population[+]
//     * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-criteriaReference].valueString = "measure-observation"
//     * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-aggregateMethod].valueCode = #count
//     * description = "Measure Observation"
//     * code = $measure-population#measure-observation
//     * criteria.language = #text/cql
//     * criteria.expression = "Measure Observation"
//   * stratifier[+]
//     * criteria.language = #text/cql
//     * criteria.expression = "Stratification"


Instance: KEMRTXCURR
InstanceOf: Measure
Title: "KEMRTXCURR"
Description: "KEMRTXCURR"
* id = "KEMRTXCURR"
* identifier[0].system = "https://path-global-health.github.io/MERindicators/Measure/"
* identifier[1].system = "https://datim.org/factsinfo/mechanism"
// * identifier[1].value = "12345"
* version = "0.1.0"
* status = #draft
* experimental = true
* date = "2023-07-01"
* publisher = "PATH"
* name = "KEMRTXCURR"
* title = "KEMRTXCURR"
* description = "KEMRTXCURR"
* url = "https://path-global-health.github.io/MERindicators/Measure/KEMRTXCURR"
* identifier[0].value = "KEMRTXCURR"
* scoring = $measure-scoring#continuous-variable // not cohort
* library[+] = Canonical(KenyaEMRTXCURR)
* group[+]
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Measure Population"
    * code = $measure-population#measure-population
    * criteria.language = #text/cql
    * criteria.expression = "Measure Population"
  * population[+]
    * description = "Measure Population Exclusion"
    * code = $measure-population#measure-population-exclusion
    * criteria.language = #text/cql
    * criteria.expression = "Measure Population Exclusion"
  // * population[+]
  //   * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-criteriaReference].valueString = "measure-observation"
  //   * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-aggregateMethod].valueCode = #count
  //   * description = "Measure Observation"
  //   * code = $measure-population#measure-observation
  //   * criteria.language = #text/cql
  //   * criteria.expression = "Measure Observation"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Stratification"



// Not using for now, will try evaluate library:
// https://build.fhir.org/ig/HL7/cqf-recommendations/OperationDefinition-cpg-library-evaluate.html



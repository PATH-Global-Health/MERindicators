// Common fields in RuleSets

RuleSet: meas-common
* identifier[0].system = "https://path-global-health.github.io/MERindicators/Measure/"
* identifier[1].system = "https://datim.org/factsinfo/mechanism"
// * identifier[1].value = "12345"
* version = "0.1.0"
* status = #draft
* experimental = true
* date = "2023-07-01"
* publisher = "PATH"


RuleSet: common-numonly
* group[+]
  * code = $OpenHIE#cohort "cohort"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Stratifier"



RuleSet: common-numdenom
* group[+]
  * code = $OpenHIE#cohort "cohort"
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
    * criteria.expression = "Stratifier"


// DASH measures
// * insert meas-common
// * insert common-numonly
// or
// * insert common-numdenom
// then
// * insert dash-common-strat

Instance: MERTXCURR
InstanceOf: Measure
Title: "MERTXCURR"
Description: "MERTXCURR"
* id = "MERTXCURR"
* insert meas-common
* name = "MERTXCURR"
* title = "MERTXCURR"
* description = "MERTXCURR"
* url = "https://path-global-health.github.io/MERindicators/Measure/MERTXCURR"
* identifier[0].value = "MERTXCURR"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXCURR)
* insert common-numonly



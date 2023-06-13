// Common fields in RuleSets

// todo: measurereport doesn't include this - or doing it wrong
// todo: parameterized ruleset
// e.g. accept vars

// name can have underscore not dash; ID can have dash but not underscore
// don't mix or you'll experience fhir stupidity

RuleSet: meas-common
* identifier[0].system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* identifier[1].system = "https://datim.org/factsinfo/mechanism"
* identifier[1].value = "12345"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"


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
* id = "DASHTXCURR"
* insert meas-common
* name = "MERTXCURR"
* title = "MERTXCURR"
* description = "MERTXCURR"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/MERTXCURR"
* identifier[0].value = "MERTXCURR"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXCURR)
* insert common-numonly



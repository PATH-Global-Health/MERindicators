library MERStratifiers version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include MERConcepts called Cx


// ISO-8601-Derived Periods
// PEPFAR programs are required to report on the following standard age groups: 
// <1, 1-4, 5-9, 10-14, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, and 50+. 
codesystem "ISO-8601-Derived Periods": 'http://ohie.org/CodeSystem/iso-8601-derived-periods' // { 'P0Y--P1Y', 'P1Y--P5Y', ... }
code "P0Y--P1Y": 'P0Y--P1Y' from "ISO-8601-Derived Periods" display '< 1 year'
code "P1Y--P5Y": 'P1Y--P5Y' from "ISO-8601-Derived Periods" display '1-4 years'
code "P5Y--P10Y": 'P5Y--P10Y' from "ISO-8601-Derived Periods" display '5-9 year'
code "P10Y--P15Y": 'P10Y--P15Y' from "ISO-8601-Derived Periods" display '10-14 year'
code "P15Y--P20Y": 'P15Y--P20Y' from "ISO-8601-Derived Periods" display '15-19 year'
code "P20Y--P25Y": 'P20Y--P25Y' from "ISO-8601-Derived Periods" display '20-24 year'
code "P25Y--P30Y": 'P25Y--P30Y' from "ISO-8601-Derived Periods" display '25-29 year'
code "P30Y--P35Y": 'P30Y--P35Y' from "ISO-8601-Derived Periods" display '30-34 year'
code "P35Y--P40Y": 'P35Y--P40Y' from "ISO-8601-Derived Periods" display '35-39 year'
code "P40Y--P45Y": 'P40Y--P45Y' from "ISO-8601-Derived Periods" display '40-45 year'
code "P45Y--P50Y": 'P45Y--P50Y' from "ISO-8601-Derived Periods" display '45-50 year'
code "P50Y--P9999Y": 'P50Y--P9999Y' from "ISO-8601-Derived Periods" display '50+ years'
// Starting in FY22, the age bands for TX_CURR will be expanded to 50-54, 55-59, 60-64, and 65+
code "P50Y--P55Y": 'P50Y--P55Y' from "ISO-8601-Derived Periods" display '50-55 year'
code "P55Y--P60Y": 'P50Y--P60Y' from "ISO-8601-Derived Periods" display '55-60 year'
code "P60Y--P65Y": 'P50Y--P60Y' from "ISO-8601-Derived Periods" display '60-65 year'
code "P65Y--P9999Y": 'P50Y--P9999Y' from "ISO-8601-Derived Periods" display '65+ years'


// need DateTime eg @2014-01-25T not Date, eg not this: @2014-01-25
// parameter "Measurement Period" Interval<DateTime>
// comment out for testing, will be overridden by $evaluate-measure operation in any case
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T00:00:00.0, @2022-08-30T00:00:00.0]

// Not included yet: Key Population Type [Required]
// People who inject drugs (PWID)
// Men who have sex with men (MSM)
// Transgender people (TG)
// Female sex workers (FSW)
// People in prison and other closed settings

// this is done in vn case reporting as a separate codesystem:
// https://github.com/openhie/case-reporting-hiv-vn/blob/6019ae4d2a4bb824c6b00a7c5492332f24718149/input/fsh/vn-hiv-vocabulary.fsh#L207

// How to review for data quality: Requires larger, realistic dataset
// How to calculate annual total:
// Disaggregations:
// Confirm that TX_CURR ≥ TX_NEW.
// Confirm that TX_CURR ≥ TX_RTT.


context Patient


// unknown and other is included in fhir core patient
// mer guidance requires m, f, unknown
define "Sex":
  Patient.gender.value


// Age Group
define "Age Group":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[0, 1) then "P0Y--P1Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[1, 5) then "P1Y--P5Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[5, 10) then "P5Y--P10Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[10, 15) then "P10Y--P15Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, 20) then "P15Y--P20Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[20, 25) then "P20Y--P25Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[25, 30) then "P25Y--P30Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[30, 35) then "P30Y--P35Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[35, 40) then "P35Y--P40Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[40, 45) then "P40Y--P45Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[45, 50) then "P45Y--P50Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[50, null] then "P50Y--P9999Y"
    else null
  end


define "Age Group TXCURR":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[0, 1) then "P0Y--P1Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[1, 5) then "P1Y--P5Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[5, 10) then "P5Y--P10Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[10, 15) then "P10Y--P15Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, 20) then "P15Y--P20Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[20, 25) then "P20Y--P25Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[25, 30) then "P25Y--P30Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[30, 35) then "P30Y--P35Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[35, 40) then "P35Y--P40Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[40, 45) then "P40Y--P45Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[45, 50) then "P45Y--P50Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[50, 55) then "P50Y--P55Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[55, 60) then "P55Y--P60Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[60, 65) then "P60Y--P65Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[65, null] then "P65Y--P9999Y"
    else null
  end


define "Age Group/Sex":
  "Age Group".code + ':' + "Sex"


define "Last Location":
  Last([Encounter] E
    return singleton from (E.location L
    // return First(E.location L
      return L.location.reference
    ).value
  )


// define function OpenMRS(identifiers List<Identifier>):
//   // singleton from (identifiers I where I.extension[0].url = 'http://fhir.openmrs.org/ext/patient/identifier#location')
//   singleton from (identifiers I where I.extension[0].url = 'http://fhir.openmrs.org/ext/patient/identifier#location')


// define "OpenMRS Location Func":
//   OpenMRS(Patient.identifier)


// identifier[].extension[].valueReference.reference
// // another example...
// "identifier": [
//   {
//     "id": "7124038b-bc12-42d9-a0f8-0778f6861628",
//     "extension": [
//       {
//         "url": "http://fhir.openmrs.org/ext/patient/identifier#location",
//         "valueReference": {
//           "reference": "Location/8d6c993e-c2cc-11de-8d13-0010c6dffd0f",
//           "type": "Location",
//           "display": "Unknown Location"
//         }
//       }
//     ],
//     "use": "official",
//     "type": {
//       "coding": [
//         {
//           "code": "05a29f94-c0ed-11e2-94be-8c13b969e334"
//         }
//       ],
//       "text": "OpenMRS ID"
//     },
//     "value": "10009A"
//   }
// ],

define "OpenMRS Location":
  [Patient] P
    where P.identifier[0].extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier#location'
  // return P.identifier.extension[0].valueReference.reference.value
  // return P.identifier


// WIP
// define "Moar OpenMRS": 
//   FC.Extension(Patient.identifier.extension Ex return Ex.url)



define "Last serviceProvider":
  // Some of the Synthea encounters do not have a serviceProvider, so this can return nothing
  // Last([Encounter]).serviceProvider.reference.value
  // Filter out those that are null, then take the last
  [Encounter] E
    where E.serviceProvider is not null
  return Last([Encounter]).serviceProvider.reference.value


// if..then..else
define "Location":
  if "Last Location" is not null then ("Last Location")
  // the singleton has to be here but errors above?
  else singleton from ("Last serviceProvider")


define "Age Group/Sex/Location":
  "Age Group".code + ':' + "Sex" + ':' + "Location"


define "Age Group/Sex/Location TXCURR":
  "Age Group TXCURR".code + ':' + "Sex" + ':' + "Location"


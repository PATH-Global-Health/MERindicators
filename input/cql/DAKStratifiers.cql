library DAKStratifiers version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DAKConcepts called Cx
include DAKDataElements called PatientData



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


codesystem "DAK Dispensing Quantity CS": 'https://path-global-health.github.io/MERindicators/ValueSet/DAKDispensingQuantity'
code "notMMD": 'notMMD' from "DAK Dispensing Quantity CS" display '<3 months of ARVs'
code "3to5MMD": '3to5MMD' from "DAK Dispensing Quantity CS" display '3-5 months of ARVs'
code "6MMD": '6MMD' from "DAK Dispensing Quantity CS" display '6 or more months of ARVs'
code "NoData": 'NoData' from "DAK Dispensing Quantity CS" display 'No Data'

codesystem "DAK Coarse Age Range CS": 'https://path-global-health.github.io/MERindicators/CodeSystem/DAKCoarseAgeRangeCS'
code "lt15": 'lt15' from "DAK Coarse Age Range CS" display '<15'
code "gt15": 'gt15' from "DAK Coarse Age Range CS" display '15+'

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


context Patient


// unknown and other is included in fhir core patient
// mer guidance requires m, f, unknown, kenya emr uses only mf
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

define "Coarse Age Group":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[0, 15) then "lt15"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, null] then "gt15"
    else null
  end


define "Age Group/Sex":
  "Age Group".code + ':' + "Sex"


define "Last Location":
  Last([Encounter] E
    return singleton from (E.location L
      return L.location.reference
    ).value
  )

define "Dispensing Quantity":
  case 
    when PatientData."Most Recent Dispensed Observation Days" in Interval[0, 90] then "notMMD"
    when PatientData."Most Recent Dispensed Observation Days" in Interval[91, 180] then "3to5MMD"
    when PatientData."Most Recent Dispensed Observation Days" in Interval[181, null] then "6MMD"
    else "NoData"
  end

define "Dispensing Quantity/Coarse Age/Sex/Location":
  "Dispensing Quantity".code + ':' + "Coarse Age Group".code + ':' + "Sex" + ':' + "Location"

define "OpenMRS Location":
  [Patient] P
    // remove #location at end of url for cql engine
    where singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier'}
    // this url is in the ig, but is not correct
    // or singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/core/StructureDefinition/omrs-patient-identifier-location'}
  return singleton from {P.identifier.extension[0].value.reference}


define "Last serviceProvider":
  // Some of the Synthea encounters do not have a serviceProvider, so this can return nothing
  // Filter out those that are null, then take the last
  [Encounter] E
    where E.serviceProvider is not null
  return Last([Encounter]).serviceProvider.reference.value


// if..then..else
define "Location":
  case
    when "Last Location" is not null then ("Last Location")
  // the singleton has to be here but errors above?
    when singleton from ("Last serviceProvider") is not null then singleton from ("Last serviceProvider")
    else 'Unknown Location'
  end


define "Location Deux":
  case
    // then location of last encounter
    when "Last Location" is null then ("Last Location")
    // location identifier on patient
    when "OpenMRS Location" is not null then ("OpenMRS Location")
    // then organization of last encounter
    else singleton from ("Last serviceProvider")
  end


// define "Location Troi":
//   Coalesce("OpenMRS Location", "Last Location", "Last serviceProvider")


define "Age Group/Sex/Location":
  "Age Group".code + ':' + "Sex" + ':' + "Location"


define "Age Group/Sex/Location TXCURR":
  "Age Group TXCURR".code + ':' + "Sex" + ':' + "Location"


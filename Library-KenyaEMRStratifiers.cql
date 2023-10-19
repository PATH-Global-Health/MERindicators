library KenyaEMRStratifiers version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include KenyaEMRConcepts called Cx


codesystem "KEMR Periods": 'http://ohie.org/CodeSystem/kemr-periods'
code "<1": '<1' from "KEMR Periods" display '<1'
code "1-9": '1-9' from "KEMR Periods" display '1-9'
code "10-14": '10-14' from "KEMR Periods" display '10-14'
code "15-19": '15-19' from "KEMR Periods" display '15-19'
code "20-24": '20-24' from "KEMR Periods" display '20-24'
code "25+": '25+' from "KEMR Periods" display '25+'


parameter "Measurement Period" Interval<DateTime> default Interval[@2023-04-01T00:00:00.0, @2023-06-30T00:00:00.0]


context Patient


define "Sex":
  Patient.gender.value


define "Age Group":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[0, 1) then "<1"
    when AgeInYearsAt(start of "Measurement Period") in Interval[1, 9) then "1-9"
    when AgeInYearsAt(start of "Measurement Period") in Interval[10, 14) then "10-14"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, 19) then "15-19"
    when AgeInYearsAt(start of "Measurement Period") in Interval[20, 24) then "20-24"
    when AgeInYearsAt(start of "Measurement Period") in Interval[25, null] then "25+"
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


// http://fhir.openmrs.org/ext/patient/identifier#location

define "OpenMRS Location":
  [Patient] P
    // this url is in the ig, but is not correct: 'http://fhir.openmrs.org/core/StructureDefinition/omrs-patient-identifier-location'}
    where singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier'}
    or singleton from {P.identifier.extension[0].url ~ 'http://fhir.openmrs.org/ext/patient/identifier#location'}
    // or singleton from {P.identifier.extension[1].url ~ 'http://fhir.openmrs.org/ext/patient/identifier'}
    // or singleton from {P.identifier.extension[1].url ~ 'http://fhir.openmrs.org/ext/patient/identifier#location'}
    return singleton from {P.identifier.extension[0].value.reference.value}


define "Last serviceProvider":
  // Some of the Synthea encounters do not have a serviceProvider, so this can return nothing
  // Filter out those that are null, then take the last
  [Encounter] E
    where E.serviceProvider is not null
  return Last([Encounter]).serviceProvider.reference.value


// if..then..else
define "Location Deux":
  if "Last Location" is not null then ("Last Location")
  else if "Last serviceProvider" is not null then ("Last serviceProvider")
  else if "OpenMRS Location" is not null then ("OpenMRS Location")
  else null


define "Location":
  case
    // location identifier on patient
    when "OpenMRS Location" is not null then ("OpenMRS Location")
    // then location of last encounter
    when "Last Location" is not null then ("Last Location")
    // then organization of last encounter
    when "Last serviceProvider" is not null then ("Last serviceProvider")
    else null
  end


define "Debug location": 
  Combine({ "Location", "Sex"}, ':')


define "Age Group/Sex/Location":
  "Age Group".code & ':' & "Sex" & ':' & "Location"


define "Age Group/Sex/Location TXCURR":
  "Age Group".code + ':' + "Sex" + ':' + "Location"


define "Age Group/Sex/Location Case Switch":
  "Age Group".code + ':' + "Sex" + ':' + "Location"

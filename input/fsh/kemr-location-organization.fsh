Instance: LocationExample
InstanceOf: OMRSLocation
Usage: #example
Title: "Location Example"
Description: "Example OpenMRS Location resource"
// * id 1..1
// * status 0..1 
// //* status from LocationStatusVS
// * name 1..1 
// * description 1..1
// * type 0..*
// * position 0..1 
// * position.longitude 1..1
// * position.latitude 1..1 
// * telecom 0..*
// * telecom only OMRSLocationContactPoint 
// * address only OMRSAddress
// * partOf 0..1
* id = "a3b793f0-eb53-4cda-92ce-fe0a77106252"
* status = #active
* name = "Outpatient Clinic"
* description = "Outpatient Clinic"
* type.coding[0].code = #SLEEP
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type.coding[0].display = "Sleep disorders unit"
* telecom[+].system = #phone
* telecom[=].value = "(+1) 734-677-7777"
* telecom[+].system = #fax
* telecom[=].value = "(+1) 734-677-6622"
* telecom[+].system = #email
* telecom[=].value =  "hq@HL7.org"
* address.use = #home
* address.line[0] = "3300 Washtenaw Avenue, Suite 227"
* address[0].city = "Ann Arbor"
* address[0].district = "Mukono"
* address[0].state = "MI"
* address[0].postalCode = "48104"
* address[0].country = "USA"
* position[0].latitude = 42.256500
* position[0].longitude = -83.694710


Instance: Location-HIVSimple1
InstanceOf: Location
Title: "Location-HIVSimple1"
Description: "Location-HIVSimple1"
* identifier[+].system = $synthea
* identifier[=].value = "Location-HIVSimple1"
// * managingOrganization = Reference(Location-HIVSimple1)
* managingOrganization.identifier.system = $synthea
* managingOrganization.identifier.value = "Organization-HIVSimple1"


Instance: Location-HIVSimple2
InstanceOf: Location
Title: "Location-HIVSimple2"
Description: "Location-HIVSimple2"
* identifier[+].system = $synthea
* identifier[=].value = "Location-HIVSimple2"
// * managingOrganization = Reference(Organization-HIVSimple2)
* managingOrganization.identifier.system = $synthea
* managingOrganization.identifier.value = "Organization-HIVSimple2"


Instance: LocationCIEL
InstanceOf: Location
Title: "LocationCIEL"
Description: "LocationCIEL"
// * managingOrganization.identifier.system = $synthea
// * managingOrganization.identifier.value = "Organization-HIVSimple2"


Instance: Organization-HIVSimple1
InstanceOf: Organization
Title: "Organization-HIVSimple1"
Description: "Organization-HIVSimple1"
* name = "Organization-HIVSimple Government Hospital"
* identifier[+].system = $synthea
* identifier[=].value = "Organization-HIVSimple1"


Instance: Organization-HIVSimple2
InstanceOf: Organization
Title: "Organization-HIVSimple2"
Description: "Organization-HIVSimple2"
* name = "Organization-HIVSimple2 Government Hospital"
* identifier[+].system = $synthea
* identifier[=].value = "Organization-HIVSimple2"


Instance: OrganizationCIEL
InstanceOf: Organization
Title: "OrganizationCIEL"
Description: "OrganizationCIEL"
* name = "OrganizationCIEL Government Hospital"
// * identifier[+].system = $synthea
// * identifier[=].value = "OrganizationCIEL"




Instance: Example-Locations-Organizations
InstanceOf: Bundle
Title: "Example-Locations-Organizations"
Description: "Example-Locations-Organizations"
* type = #transaction

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/Organization-HIVSimple1"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple1
* insert organization-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/Organization-HIVSimple2"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple2
* insert organization-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/Organization-100"
// * entry[=].request.url = "Organization"
// * entry[=].resource = Organization-100
// * insert organization-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/Organization-101"
// * entry[=].request.url = "Organization"
// * entry[=].resource = Organization-101
// * insert organization-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/Organization-102"
// * entry[=].request.url = "Organization"
// * entry[=].resource = Organization-102
// * insert organization-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Organization/IntraHealth"
// * entry[=].request.url = "Organization"
// * entry[=].resource = IntraHealth
// * insert organization-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/Location-HIVSimple1"
* entry[=].resource = Location-HIVSimple1
* entry[=].request.url = "Location"
* insert location-bundle

* entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/Location-HIVSimple2"
* entry[=].resource = Location-HIVSimple2
* entry[=].request.url = "Location"
* insert location-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/Location-100"
// * entry[=].resource = Location-100
// * entry[=].request.url = "Location"
// * insert location-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/Location-101"
// * entry[=].resource = Location-101
// * entry[=].request.url = "Location"
// * insert location-bundle

// * entry[+].fullUrl = "https://path-global-health.github.io/MERindicators/Location/Location-102"
// * entry[=].resource = Location-102
// * entry[=].request.url = "Location"
// * insert location-bundle

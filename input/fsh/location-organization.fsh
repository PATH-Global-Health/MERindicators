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
// * identifier[+].system = $synthea
// * identifier[=].value = "Location-HIVSimple2"
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

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-HIVSimple1"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple1
* insert organization-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-HIVSimple2"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple2
* insert organization-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-100"
// * entry[=].request.url = "Organization"
// * entry[=].resource = Organization-100
// * insert organization-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-101"
// * entry[=].request.url = "Organization"
// * entry[=].resource = Organization-101
// * insert organization-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-102"
// * entry[=].request.url = "Organization"
// * entry[=].resource = Organization-102
// * insert organization-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/IntraHealth"
// * entry[=].request.url = "Organization"
// * entry[=].resource = IntraHealth
// * insert organization-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-HIVSimple1"
* entry[=].resource = Location-HIVSimple1
* entry[=].request.url = "Location"
* insert location-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-HIVSimple2"
* entry[=].resource = Location-HIVSimple2
* entry[=].request.url = "Location"
* insert location-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-100"
// * entry[=].resource = Location-100
// * entry[=].request.url = "Location"
// * insert location-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-101"
// * entry[=].resource = Location-101
// * entry[=].request.url = "Location"
// * insert location-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-102"
// * entry[=].resource = Location-102
// * entry[=].request.url = "Location"
// * insert location-bundle

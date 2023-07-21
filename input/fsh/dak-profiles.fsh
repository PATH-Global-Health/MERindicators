Profile:      DAKPatient
Parent:       Patient
Id:           DAKPatient
Title:        "DAK TXCURR Patient"
Description:  "DAK Patient for TXCURR"

* birthDate 1..1
* gender    1..1

Profile:      DAKHIVCondition
Parent:       Condition
Id:           DAKHIVCondition
Title:        "DAK TXCURR Condition for PLHIV"
Description:  "DAK Condition for TXCURR for PLHIV"

* clinicalStatus 1..1 
* clinicalStatus from http://fhir.org/guides/cqf/common/ValueSet/active-condition
* verificationStatus 1..1
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code 1..1
* code from DAKPLHIV (required)

Profile:      DAKARTCondition
Parent:       Condition
Id:           DAKARTCondition
Title:        "DAK TXCURR Condition for On ART"
Description:  "DAK Condition for TXCURR for On ART"

* clinicalStatus 1..1 
* clinicalStatus from http://fhir.org/guides/cqf/common/ValueSet/active-condition
* verificationStatus 1..1
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code 1..1
* code from DAKONART (required)

Profile:      DAKARTObservation
Parent:       Observation
Id:           DAKARTObservation
Title:        "DAK TXCURR Observation for On ART"
Description:  "DAK Observation for TXCURR for On ART"

* status = #final
* encounter 1..1
* encounter only Reference (DAKARTVisitEncounter or DAKDrugPickupEncounter)
* code 1..1
* code from DAKONART (required)

Profile:      DAKMedicationRequest
Parent:       MedicationRequest
Id:           DAKMedicationRequest
Title:        "DAK TXCURR MedicationRequest"
Description:  "DAK MedicationRequest for TXCURR for On ART"

* status = #active
* medication[x] 1..1
* medication[x] only CodeableConcept
* medicationCodeableConcept from DAKARTMeds (required)

Profile:      DAKStoppedObservation
Parent:       Observation
Id:           DAKStoppedObservation
Title:        "DAK TXCURR Observation for Stopped ART"
Description:  "DAK Observation for TXCURR for Stopped ART"

* status = #final
* code 1..1
* code from DAKARTStop (required)

Profile:      DAKTransferOutObservation
Parent:       Observation
Id:           DAKTransferOutObservation
Title:        "DAK TXCURR Observation for Transfer Out"
Description:  "DAK Observation for TXCURR for Transfer Out"

* status = #final
* code 1..1
* code from DAKHIVTransfer (required)

Profile:      DAKARTVisitEncounter
Parent:       Encounter
Id:           DAKARTVisitEncounter
Title:        "DAK TXCURR Encounter for ART Visit"
Description:  "DAK Encounter for TXCURR for ART Visit"

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* serviceType 1..1
* serviceType from DAKARTVisit (required)
* subject 1..1
* subject only Reference(DAKPatient)
* location 1..1
* serviceProvider 1..1

Profile:      DAKDrugPickupEncounter
Parent:       Encounter
Id:           DAKDrugPickupEncounter
Title:        "DAK TXCURR Encounter for Drug Pickup"
Description:  "DAK Encounter for TXCURR for Drug Pickup"

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* serviceType 1..1
* serviceType from DAKARVDrugPickup (required)
* subject 1..1
* subject only Reference(DAKPatient)
* location 1..1
* serviceProvider 1..1
          

Profile:      DAKDispenseDaysObservation
Parent:       Observation
Id:           DAKDispenseDaysObservation
Title:        "DAK TXCURR Observation for Dispensed Days"
Description:  "DAK Observation for TXCURR for Dispensed Days of ART Medication"

* status = #final
* encounter 1..1
* encounter only Reference(DAKDrugPickupEncounter)
* code 1..1
* code from DAKMMD
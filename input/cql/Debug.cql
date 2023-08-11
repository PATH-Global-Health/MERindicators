library Debug version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include KenyaEMRConcepts called Cx
include KenyaEMRStratifiers called Stratifiers


// Provide a default interval or period-based tests will fail when evaluating CQL against test cases
// Need DateTime eg @2014-01-25T not Date, eg not this: @2014-01-25
// The $evaluate-measure operation's parameters 'periodStart' and 'periodEnd' override this in any case
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T, @2023-12-31T]


// Start with the patient and traverse their clinical resources
context Patient



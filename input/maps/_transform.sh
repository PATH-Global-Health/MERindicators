#!/usr/bin/env bash

export HEADER1="content-type:application/fhir+json"
export ACCEPT="accept:application/fhir+json"

export FHIR="https://test.ahdis.ch/matchbox/fhir"
export TRANSFORM="${FHIR}/StructureMap/${1}/$transform"

function transform {
    curl -s -X POST -H ${ACCEPT} -H ${HEADER1} --data-binary @${2} --url ${TRANSFORM} | \
    jq .
}

transform HIVObservationHIVCondition test-data1.json
transform HIVObservationHIVCondition test-data2.json


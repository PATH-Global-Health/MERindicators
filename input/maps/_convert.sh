#!/usr/bin/env bash

export HEADER1="content-type:application/fhir+json"
export HEADER2="content-type:text/fhir-mapping"
export ACCEPT="accept:application/fhir+json"

export FHIR="https://test.ahdis.ch/matchbox/fhir"
export CONVERT="${FHIR}/StructureMap/$convert"
export MAP="${FHIR}/StructureMap"

# curl --request POST --H 'accept: application/fhir+json' --H 'content-type: text/fhir-mapping' --data-binary @HIVObservation-HIVCondition.map --url 'https://test.ahdis.ch/matchbox/fhir/StructureMap/$convert' 

function convertput {
    curl -s -X POST -H ${ACCEPT} -H ${HEADER2} --data-binary @${1}.map --url ${CONVERT} | \
    curl -s -X PUT -H ${HEADER1} --data-binary @- --url "${MAP}/${1}" | \
    curl -s -X GET -H ${ACCEPT} --url "${MAP}/${1}" | \
    jq .
}

convertput HIVObservationHIVCondition


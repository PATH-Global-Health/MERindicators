#!/usr/bin/env bash

export HEADER1="content-type:application/fhir+json"
export HEADER2="content-type:text/fhir-mapping"
export ACCEPT="accept:application/fhir+json"

export FHIR="https://test.ahdis.ch/matchbox/fhir"
export CONVERT="${FHIR}/StructureMap/$convert"
export MAP="${FHIR}/StructureMap"

# curl --request POST -H 'accept: application/fhir+json' -H 'content-type: text/fhir-mapping' --data-binary @HIVObservationHIVCondition.map --url 'https://test.ahdis.ch/matchbox/fhir/StructureMap/$convert'

function convertput {
    # curl -s -X POST -H ${ACCEPT} -H ${HEADER2} --data-binary @${1}.map --url ${CONVERT} | \
    # curl -s -X PUT -H ${HEADER1} --data-binary @- --url "${MAP}/${1}" | \
    # curl -s -X GET -H ${ACCEPT} --url "${MAP}/${1}" | \
    # jq .

    curl -s -X POST -H ${ACCEPT} -H ${HEADER2} --data-binary @${1}.map --url ${CONVERT} | jq . > StructureMap-${1}.json
    printf "StructureMap created\n"

    curl -s -X PUT -H ${HEADER1} --data-binary @StructureMap-${1}.json --url "${MAP}/${1}" | jq .
    printf "StructureMap loaded on server\n"

    curl -s -X GET -H ${ACCEPT} --url "${MAP}/${1}" | jq .
    printf "Confirm StructureMap loaded on server\n"
}

convertput HIVObservationHIVCondition


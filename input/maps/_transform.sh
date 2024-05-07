#!/usr/bin/env bash

export HEADER1="content-type:application/fhir+json"
export ACCEPT="accept:application/fhir+json"

export FHIR="https://test.ahdis.ch/matchbox/fhir"
export TRANSFORM="${FHIR}/StructureMap/${1}/$transform"



curl --request POST "https://test.ahdis.ch/matchbox/fhir/StructureMap/\$transform?source=https://path-global-health.github.io/MERindicators/StructureMap/HIVObservationHIVCondition" \
     --data-binary @test-data1.json  \
      -H "Accept: application/fhir+json"  -H "Content-Type: application/fhir+json"



# curl --request POST -H 'accept: application/fhir+json' -H 'content-type: text/fhir+json' --data-binary @test-data1.json --url 'https://test.ahdis.ch/matchbox/fhir/StructureMap/HIVObservationHIVCondition/$transform'

function transform {
    curl -s -X POST -H ${ACCEPT} -H ${HEADER1} --data-binary @${2} --url ${TRANSFORM} | jq .
}

transform HIVObservationHIVCondition test-data1.json
# transform HIVObservationHIVCondition test-data2.json


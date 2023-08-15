#!/usr/bin/env bash

RED='\033[0;31m'
YEL='\033[1;33m'
NC='\033[0m' # No Color

# do this first, wait 2-3 min before running
# docker run -d -p 8080:8080 alphora/cqf-ruler:latest

## fyi: hapi fhir hosted demo doesn't support measure eval
# export FHIR="https://blaze.life.uni-leipzig.de/fhir"
# export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir"
export FHIR="http://localhost:8080/fhir"
# export FHIR="http://ryzen.local:8080/fhir"

export HEADER="Content-Type: application/fhir+json"
export output="../../output"
export OUTPUT="@../../output"
export SCRIPTS="../test/scripts"

# function confirmation {
#     printf '\nDo you wish to continue (y/n)? '
#     read answer

#     if [ "$answer" != "${answer#[Yy]}" ] ;then 
#         echo ""
#     else
#         echo ""
#         exit
#     fi
# }

function Loader() {
    cd ${output}
    for FILE in $1*.json
    do 
        printf "${FILE}"
        local EYED=$(cat ${FILE}| jq -r .id)
        curl -s -X PUT -H "$HEADER" --data @${FILE} $FHIR/$1/${EYED} | jq .

    done
    cd ${SCRIPTS}
}

# on some servers this isn't needed, but it is included here
curl -X PUT -H "$HEADER" --data @Library-FHIR-ModelInfo.json $FHIR/Library/FHIR-ModelInfo | jq .

Loader Device
Loader CodeSystem
Loader ValueSet
Loader Library
Loader Measure
Loader Organization
Loader Location

# patient bundles: must POST a transaction bundle of POST methods on each resource
for FILE in ${output}/Bundle-Example*.json ; do echo ${FILE} ; done
for FILE in ${output}/Bundle-Example*.json ; do curl -XPOST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done


curl $FHIR'/Measure/KEMRTXCURR/$evaluate-measure?periodStart=2000-01-01&periodEnd=2023-12-31' | jq . 

curl $FHIR'/Measure/KEMRTXCURR/$evaluate-measure?periodStart=2000-01-01&periodEnd=2023-12-31' | jq '.group[] | .stratifier[] | .stratum | (. | map(leaf_paths) | unique) as $cols | map (. as $row | ($cols | map(. as $col | $row | getpath($col)))) as $rows | ([($cols | map(. | tostring))] + $rows) | map(@csv) | .[]' > measurereports/KEMRTXCURR.csv
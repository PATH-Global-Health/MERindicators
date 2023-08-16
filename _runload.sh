#!/usr/bin/env bash

export HEADER="Content-Type: application/fhir+json"
export FHIR="http://localhost:8080/fhir"


curl -s -X PUT -H "$HEADER" --data @Library-FHIR-ModelInfo.json $FHIR/Library/FHIR-ModelInfo | jq .


# post transaction bundle of PUT entries for conformance and cql/libary, measure
curl -s -X POST -H "$HEADER" --data @output/Bundle-KEMRBundle.json $FHIR | jq .


# these are needed for locations and organizations for patients. 
# locations and organizations can be included in patient transaction bundles instead

for FILE in output/Organization*.json ; do theid=$(cat ${FILE} | jq -r .id) ; \
curl -X PUT -H "$HEADER" --data @${FILE} $FHIR/Organization/${theid} | jq . ; done


for FILE in output/Location*.json ; \
do theid=$(cat ${FILE} | jq -r .id) ; printf "${FILE}" ; printf "${theid}"
curl -X PUT -H "$HEADER" --data @${FILE} $FHIR/Location/${theid} | jq . ; done


# add patient examples
for FILE in output/Bundle-Example*.json ; do curl -X POST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done


# ready to go
curl $FHIR'/Measure/KEMRTXCURR/$evaluate-measure?periodStart=2000-01-01&periodEnd=2023-12-31' | jq .


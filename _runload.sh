#!/bin/bash

# load data script
# fyi: hapi fhir hosted demo doesn't support measure eval
# export FHIR="https://blaze.life.uni-leipzig.de/fhir"
# export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir"
# cqf-ruler-r4
export FHIR="http://localhost:8080/fhir"
# export FHIR="http://ryzen.local:8080/fhir"

export HEADER="Content-Type: application/fhir+json"

curl -X PUT -H "$HEADER" --data @Library-FHIR-ModelInfo.json $FHIR/Library/FHIR-ModelInfo | jq .
curl -X PUT -H "$HEADER" --data @output/Device-cqf-tooling.json $FHIR/Device/cqf-tooling | jq .

# modified to use input/vocab
for FILE in OpenCR OpenHIE PEPFAR ; do curl -X PUT -H "$HEADER" \
--data @input/vocabulary/codesystem/manual/CodeSystem-${FILE}.json $FHIR/CodeSystem/${FILE} | jq . ; done
# modified to use input/vocab
for FILE in HIVTestingServices ViralLoadTest SyntheaHIVMedications; do curl -X PUT -H "$HEADER" \
--data @input/vocabulary/valueset/manual/ValueSet-${FILE}.json $FHIR/ValueSet/${FILE} | jq . ; done

# libaries
for FILE in FHIRHelpers FHIRCommon DASHConcepts DASHDataElements DASHStratifiers TXCURR TXNEW TXPVLS TXML HTSTST \
; do curl -X PUT -H "$HEADER" --data @output/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done

for FILE in DASHTXCURR DASHTXML DASHTXNEW DASHTXPVLS DASHHTSTST \
; do curl -X PUT -H "$HEADER" --data @output/Measure-${FILE}.json $FHIR/Measure/${FILE} | jq . ; done

# locations, organizations

# export HEADER-IFNONE="Content-Type: application/fhir+json, If-None-Exist: identifier=http://my-lab-system|123"
# curl -XPOST -H "$HEADER-IFNONE" --data @Bundle-Example-Locations-Organizations.json $FHIR | jq .

for FILE in Organization-HIVSimple1 Organization-HIVSimple2 \
Organization-100 Organization-101 Organization-102 IntraHealth \
; do curl -X PUT -H "Content-Type: application/fhir+json, If-None-Exist: \
identifier=https://github.com/synthetichealth/synthea|${FILE}" \
--data @output/Organization-${FILE}.json $FHIR/Organization/${FILE} | jq . ; done

for FILE in Location-HIVSimple1 Location-HIVSimple2 Location-100 Location-101 Location-102 \
; do curl -X PUT -H "Content-Type: application/fhir+json, If-None-Exist: \
identifier=https://github.com/synthetichealth/synthea|${FILE}" \
--data @output/Location-${FILE}.json $FHIR/Location/${FILE} | jq . ; done

# must POST a transaction bundle of POST methods on each resource
for FILE in output/Bundle-Example-HIV*.json ; do echo ${FILE} ; done
for FILE in output/Bundle-Example-HIV*.json ; do curl -XPOST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done

curl $FHIR'/Measure/DASHTXCURR/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHTXML/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHTXNEW/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHTXPVLS/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHHTSTST/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 

cat measurereports/DASHTXCURR.json | jq '.group[] | .stratifier[] | .stratum'

cat measurereports/DASHTXCURR.json | jq -r '.group[] | .stratifier[] | .stratum | (. | map(leaf_paths) | unique) as $cols | map (. as $row | ($cols | map(. as $col | $row | getpath($col)))) as $rows | ([($cols | map(. | tostring))] + $rows) | map(@csv) | .[]' > measurereports/DASHTXCURR.csv

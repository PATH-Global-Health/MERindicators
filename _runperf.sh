#!/usr/bin/env bash

export HEADER="Content-Type: application/fhir+json"

printf "\nrun pings to see latency of overall r/t links\n"
for i in {0..4}
do
    ping -c 1 http://smarthapi.intellisoftkenya.com | grep "round-trip"
done

printf "\nrun existing version of measure\n"
printf "\'real' is wall time including link latency\n"
for i in {0..9}
do
    time curl -s -X GET 'http://smarthapi.intellisoftkenya.com:8080/fhir/Measure/KEMRTXCURR/$evaluate-measure?periodStart=2023-01-01&periodEnd=2023-07-31' > /dev/null
done

# printf "\npost new cql/library resources to server\n"
# post transaction bundle of PUT entries for conformance and cql/libary, measure
time curl -s -X POST -H "$HEADER" --data @output/Bundle-KEMRBundle.json http://smarthapi.intellisoftkenya.com:8080/fhir > /dev/null


printf "\nrun new version of measure\n"
printf "\'real' is wall time including link latency\n"
for i in {0..9}
do
    time curl -s -X GET 'http://smarthapi.intellisoftkenya.com:8080/fhir/Measure/KEMRTXCURR/$evaluate-measure?periodStart=2023-01-01&periodEnd=2023-07-31' > /dev/null
done

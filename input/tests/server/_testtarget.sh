#!/usr/bin/env bash

# export FHIR="https://blaze.life.uni-leipzig.de/fhir" # blaze
# export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir" # alphora
# export FHIR="http://localhost:8080/fhir" # cqf-ruler-r4 in docker
# export FHIR="http://ryzen.local:8080/fhir" # workstation
# export FHIR="http://hapi.fhir.org/baseR4" # hapi fhir public
export FHIR="https://demo.openmrs.org/openmrs/ws/fhir2/R4"

export HEADER="Content-Type: application/fhir+json"

# hapi fhir public server won't always return totals, get those from cap statement:
# "http://hl7api.sourceforge.net/hapi-fhir/res/extdefs.html#resourceCount"

RED='\033[0;31m'
YEL='\033[1;33m'
NC='\033[0m' # No Color


function confirmation {
    printf '\nDo you wish to continue (y/n)? '
    read answer

    if [ "$answer" != "${answer#[Yy]}" ] ;then 
        echo ""
    else
        echo ""
        exit
    fi
}

# build errors
OUTPUT=$(cat output/qa.json | jq .errs)
printf "${YEL} Build errors: ${RED} ${OUTPUT} ${NC}"

confirmation
OUTPUT=$(curl -s "$FHIR/metadata" | jq .fhirVersion)
printf "${YEL} FHIR version: ${OUTPUT} ${NC}"


# troubleshooting

# Let's get some Patient identifiers with extensions
confirmation
curl -s --user "admin:Admin123" "$FHIR/Patient?" | jq -r '.entry[].resource.identifier[].extension[].url'
# curl -s --user "admin:Admin123" "$FHIR/Patient?identifier.extension.url=http://fhir.openmrs.org/ext/patient/identifier#location|" | jq -r .entry[].resource

confirmation
printf "${YEL} Check that we can check for Encounter with Observation ${NC}"
# Observation?_has:Encounter
curl -s --user "admin:Admin123" "$FHIR/metadata?:parameters" | jq '.rest[].resource[] | select( .type == "Patient" or .type == "Observation" or .type == "Encounter" ) | del(.searchParam) | del(.interaction) | del(.operation) | del(.searchRevInclude)'

confirmation
printf "${YEL} Observation with Encounter ${NC}\n"
curl -s --user "admin:Admin123" "$FHIR/Observation?_has:Encounter&_count=1" | jq -r .entry[].resource

confirmation
# This demos that its not easy to audit the OpenMRS server because FHIR search isn't fully implemented in the module
# But Location can be pulled out of the Patient resource
printf "${YEL} Observation with missing Encounter ${NC}\n"
curl -s --user "admin:Admin123" "$FHIR/Observation?encounter:missing=true&_count=1" | jq -r .entry[].resource

confirmation
printf "${YEL} Observation with an Encounter ${NC}\n"
curl -s --user "admin:Admin123" "$FHIR/Observation?encounter:missing=false&_count=1" | jq -r .entry[].resource

confirmation
printf "${YEL} Observation with code 160119 ${NC}\n"
curl -s --user "admin:Admin123" "$FHIR/Observation?code=160119&_count=1" | jq -r .entry[].resource

confirmation
printf "${YEL} Condition with code 160119 ${NC}\n"
curl -s --user "admin:Admin123" "$FHIR/Condition?code=160119&_count=1" | jq -r .entry[].resource

confirmation
printf "${YEL} Observation with hiv in text ${NC}\n"
curl -s --user "admin:Admin123" "$FHIR/Observation?code:text=hiv&_count=1" | jq -r .entry[].resource

confirmation
printf "${YEL} Condition with hiv in text ${NC}\n"
curl -s --user "admin:Admin123" "$FHIR/Condition?code:text=hiv&_count=1" | jq -r .entry[].resource


# curl -s --user "admin:Admin123" "$FHIR/Observation?encounter:missing=true&_total=estimate" | jq .
# GET [base]/Condition?code:text=headache
# GET [base]/Condition?code=160119

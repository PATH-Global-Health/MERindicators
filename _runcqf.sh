#!/usr/bin/env bash

# run sep cleanup script
./_runcleanup.sh

# run sushi
sushi

# move vocabulary, libraries to the right place
mkdir -p input/vocabulary/codesystem
mkdir -p input/vocabulary/valueset
mkdir -p input/resources/library
cp fsh-generated/resources/CodeSystem-* input/vocabulary/codesystem/
cp fsh-generated/resources/ValueSet-* input/vocabulary/valueset/
cp fsh-generated/resources/Library-* input/resources/library/

# run cql tooling
bash _refresh.sh

# run publisher without sushi
# bash _genonce.sh -no-sushi 
java -Xmx4g -jar ./input-cache/publisher.jar publisher -ig . -no-sushi

# put CQL test cases in place
# this has to be updated by hand

# CASE=('KenyaEMRConcepts' 'KenyaEMRDataElements' 'KenyaEMRStratifiers' 'KenyaEMRTXCURR')
# for case in "${CASE[@]}"
# do
#     # make dir if it doesn't exist
#     mkdir -p input/tests/${case}/Patient-HIVSimple
#     cp output/Bundle-Example-HIVSimple.json input/tests/${case}/Patient-HIVSimple

#     mkdir -p input/tests/${case}/Patient-HIVSimple2
#     cp output/Bundle-Example-HIVSimple2.json input/tests/${case}/Patient-HIVSimple2

#     mkdir -p input/tests/${case}/example-openmrs-Patient
#     cp output/Bundle-Example0.json input/tests/${case}/example-openmrs-Patient

#     mkdir -p input/tests/${case}/PatientCIEL
#     cp output/Bundle-ExampleCIEL.json input/tests/${case}/PatientCIEL

#     mkdir -p input/tests/${case}/DeceasedBoolean
#     cp output/Bundle-ExampleDeceasedBoolean.json input/tests/${case}/DeceasedBoolean

#     mkdir -p input/tests/${case}/DeceasedDateTime
#     cp output/Bundle-ExampleDeceasedDateTime.json input/tests/${case}/DeceasedDateTime

#     mkdir -p input/tests/${case}/PatientOMRS0
#     cp output/Bundle-ExampleOMRS0.json input/tests/${case}/PatientOMRS0
# done


echo "Exit code: ${?}"
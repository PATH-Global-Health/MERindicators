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
bash _genonce.sh -no-sushi 

echo "Exit code: ${?}"
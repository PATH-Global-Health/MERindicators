#!/bin/bash

# cleanup
rm -rf fsh-generated/resources/*
rm -rf input/examples-src/output/*
rm -rf input/fsh/bulk/*
rm -rf output/
rm -rf input/resources/Library-* input/resources/library-* input/resources/library/*
rm -rf input/vocabulary/codesystem/CodeSystem-*
rm -rf input/vocabulary/valueset/ValueSet-*
echo "Exit code: ${?}"
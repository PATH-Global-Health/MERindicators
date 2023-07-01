# MER Indicators

This IG is designed to produce the PEPFAR Monitoring, Evaluation, and Reporting (MER) indicator for the number of persons on ART (TX_CURR) for a particular time period. The definition may be consulted in the [MER Guidance 2022](https://www.state.gov/wp-content/uploads/2021/09/FY22-MER-2.6-Indicator-Reference-Guide.pdf). It is an adaptation of other IGs designed for HIV/AIDS program monitoring but focuses on using patient data from an OpenMRS instance.

### How to Build

This IG is a Clinical Quality Measure IG and it also uses FHIR Shorthand (FSH). This means that it has a unique build process. The cqf [sample-content-ig](https://github.com/cqframework/sample-content-ig) explains the build process except that additional steps are required because FSH is also used. Note that as with any builds based on HL7 IG Publisher that Node, Sushi, Java, Ruby, Jekyll, wget, and other dependencies are required.

Update tooling
```bash
# Update publisher as usual
bash _updatePublisher.sh
# Update the CQL tooling
bash _updateCQFTooling.sh
```

Build
```bash
# run sushi to generate FHIR artifacts
sushi
# move vocabulary, libraries so the CQL tooling can see them
mkdir -p input/vocabulary/codesystem
mkdir -p input/vocabulary/valueset
mkdir -p input/resources/library
cp fsh-generated/resources/CodeSystem-* input/vocabulary/codesystem/
cp fsh-generated/resources/ValueSet-* input/vocabulary/valueset/
cp fsh-generated/resources/Library-* input/resources/library/
# run the CQL tooling to generate the libraries, etc
bash _refresh.sh 
# run IG publisher without sushi as it will complain about duplicate vocabularies
bash _genonce.sh -no-sushi 
```

The `_runcqf.sh` script contains these commands and can be invoked directly. There is also a cleanup script which is helpful before commiting changes to this repository and it is invoked at the start of the `_runcqf.sh` script. There is no Windows (batch) file version of `_runcqf.sh` yet. Contributions are welcome.


### Publication
This ImplementationGuide is published in the following locations:

Continuous Build: __http://PATH-Global-Health.github.io/MERindicators/branches/main/index.html__  
Canonical / permanent URL: 
<br> </br>

### Issues
Issues and change requests are managed here:  

Issues:  __https://github.com/openhie/MERIndicators/issues__  
Kanban board:  __https://github.com/orgs/openhie/projects/7/views/1__  

---



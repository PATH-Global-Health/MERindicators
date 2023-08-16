# MER Indicators

This IG is designed to produce the PEPFAR Monitoring, Evaluation, and Reporting (MER) indicator for the number of persons living with HIV on ART (TX_CURR) for a particular time period. The definition may be consulted in the [MER Guidance 2022](https://www.state.gov/wp-content/uploads/2021/09/FY22-MER-2.6-Indicator-Reference-Guide.pdf). It is an adaptation of other IGs designed for HIV/AIDS program monitoring but focuses on using patient data from an OpenMRS instance.

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

### How to Build

This IG is a Clinical Quality Measure IG and it also uses FHIR Shorthand (FSH). This means that it has a unique build process. The cqf [sample-content-ig](https://github.com/cqframework/sample-content-ig) explains the build process except that additional steps are required because FSH is also used. 

> **_NOTE:_** As with any builds based on HL7 IG Publisher that Node, Sushi, Java, Ruby, Jekyll, and other dependencies may be required. The instructions should work for Mac and Linux. Windows tooling is being tested and feedback is encouraged.

* Ensure that the prerequisites are installed. See the [Publisher docs](https://confluence.hl7.org/pages/viewpage.action?pageId=35718627#IGPublisherDocumentation-QuickStart).

```bash
java --version
jekyll --version
git --version
npm --version
# ensure that the latest version of Sushi is installed
npm install -g fsh-sushi
```

* Clone the repository.
```
# for ssh with git
git clone git@github.com:PATH-Global-Health/MERindicators.git
# else, with https
git clone https://github.com/PATH-Global-Health/MERindicators.git
# change directory
cd MERindicators
```

* Update Publisher and CQF tooling.
```bash
# Update publisher as usual
bash _updatePublisher.sh
# Update the CQL tooling
bash _updateCQFTooling.sh
```

* Run the build script. This ensures that artifacts build. There will be build errors not the least because of fixes needed in the publisher tooling. (To view the build errors, open output/qa.html in a browser). The build should complete.
```
bash _runcqf.sh
```

The build script will create an implementation guide and a static site for its narrative and artifacts, located in `output`. Open output/index.html to see the static site and especially output/qa.html for build errors. The output folder and input-cache folders are git-ignored. (input-cache is where the tooling puts Jar files it downloads.)


### How to Develop CQL using VSCode

* Run the build script. This is necessary to create artifacts the CQF tooling needs to evaluate CQL.

* Install the Clinical Quality Language (CQL) for [VSCode plugin](https://marketplace.visualstudio.com/items?itemName=cqframework.cql). 

* Open a CQL file input/cql.

* The CQL plugin will download a Java file to support evaluations.

* Right-click while viewing the CQL file and choose `Execute CQL`. The evaluation will produce a results output in a separate file in input/tests/results. (This file is git-ignored, so you can choose to save or not save the results.)

The execute CQL command invokes tooling that evaluates the CQL for every test case in input/tests/<Library Name>/<Patient.id>/<bundle source>. Carefully follow the folder structure if adding test cases.


### How to Run $evaluate-measure

* Complete the steps above to build and confirm CQL is being evaluated.

* Start the evaluation engine. It runs in docker and can run locally or on a server where ports are open. This runs the cqf-ruler, an instance of HAPI FHIR server than includes the $evaluate-measure operation. It requires port 8080 (change as necessary) is open on the server if not local.
```bash
# start docker, then:
docker run -d -p 8080:8080 alphora/cqf-ruler:latest
# wait 1-2 min before using it
```

The next steps are to load FHIR conformance resources and the CQL/Library and Measure resources; then load the locations, organizations, and other prerequisites for Patient test cases; then patient clinical records. Next, run the $evaluate-measure operation with parameters for the period start and end.

This is captured in a bash script in the root of the repository called `_runload.sh`.

* Ensure [jq](https://jqlang.github.io/jq/download/) is installed. 
```bash
jq --version
```

> **_NOTE:_** On creating patient resources for testing, batch-type bundles may create duplicate resources on each POST, while transaction-type bundles with PUT will update or create if resources do not exist. Conformance resources should use PUT to update them or create if they don't exist. Users should upload their own patients for testing.

Run the _runload.sh script. 
```bash
bash _runload.sh
```

### About the Build Script

The `_runcqf.sh` script contains the following commands and can be invoked directly. There is also a cleanup script which is helpful before commiting changes to this repository and it is invoked at the start of the `_runcqf.sh` script.

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



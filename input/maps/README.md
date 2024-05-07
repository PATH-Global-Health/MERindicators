# How to use this folder

This folder is standalone and dependent on the IG it is in.

Follow the directions below then open `input/maps/HIVObservationHIVCondition.http` in VS Code. Click on:
* Convert FML to StructureMap and Put it or...
* PUT FML to StructureMap which combines the two operations. This converts FML (.map) files to FHIR StructureMaps and PUTs it on the server.
* Verify StructureMap is created
* Transform

The $transform operation will transform the bundle in the payload to an output bundle. In production, the returned bundle would be put on a FHIR server.

## Setup

* The operations use a publicly available server. Please setup a private server with the usual protections before transforming patient data. The open source server used here is the publicly available hosted [Matchbox](https://github.com/ahdis/matchbox) server which is a version of HAPI FHIR Server with additional operations. Standard HAPI FHIR JPA Server does not have the operations needed for this demo.

* Do not post real data. Please use the de-identified examples.

* Install REST Client if using VS Code. Otherwise, use an extension in other editors that can execute .http files.
[VS Marketplace](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)

* It's recommended to install the FHIR Mapping Language extension if using VS Code [VS Marketplace](https://marketplace.visualstudio.com/items?itemName=HealexSystems.fhir-mapping-language-support)


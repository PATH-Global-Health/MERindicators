# How to use this folder

This folder is standalone and not dependent on the IG it is in.

Follow the directions below then open `input/maps/HIVObservationHIVCondition.http` in VS Code. Click on:
* Convert FML to StructureMap and and PUT on server
* Transform 1 and Transform 2.

The $transform operation will transform the bundle in the payload to an output bundle. In production, the returned bundle would be put on a FHIR server.

## Setup

* The operations use a publicly available server. Please setup a private server with the usual protections before transforming patient data. The open source server used here is the publicly available hosted [Matchbox](https://github.com/ahdis/matchbox) server which is a version of HAPI FHIR Server with additional operations. Standard HAPI FHIR JPA Server does not have the operations needed for this demo.

* Do not post real data. Please use the de-identified examples.

* Install REST Client if using VS Code. Otherwise, use an extension in other editors that can execute .http files.
[VS Marketplace](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)

* It's recommended to install the FHIR Mapping Language extension if using VS Code [VS Marketplace](https://marketplace.visualstudio.com/items?itemName=HealexSystems.fhir-mapping-language-support)


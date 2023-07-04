## Simple Iteration

This iteration is the simplest version where the KenyaEMR data is loaded into a FHIR Server with CQL support.  This will work from multiple source data systems to get combined MeasureReports across all imported data.  

This iteration will also be specific to the KenyaEMR data model without needing mapping to unused data elements.  Future iterations will be created to use a more standard model that is mapped to the KenyaEMR model.

<figure>
  {% include simple-workflow.svg %}
</figure>

## Simple Standard Iteration

This iteration is exactly the same as the Simple Iteration, but the CQL logic will be system agnostic and require mapping of concepts and possibly custom CQL expressions to align with the system specific data model.

## Multiple Source Iteration

This iteration adds some further complexity in importing data from multiple EMRs.  This doesn't include any deduplication, but shows how any number of systems can send data to the CQL server.

<div>
{% include multiple-workflow.svg %}
</div>
<div style="clear: left;"></div>

## Multiple Sources with Deduplication

This iteration adds in a deduplication service to ensure data from multiple sources aren't counted multiple times.  The CQL logic will use the unique identifier from the MPI to avoid counting records mulitple times.

<div>
{% include dedup-workflow.svg %}
</div>
<div style="clear: left;"></div>

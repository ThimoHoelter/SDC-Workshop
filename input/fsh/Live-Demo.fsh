Instance: DBELiveDemo
InstanceOf: Questionnaire
Usage: #definition
* meta.lastUpdated = "2024-05-05T12:48:40Z"
* url = "http://example.org/fhir/QuestionnairesSDC/Questionnaire/DBELiveDemo"
* name = "Live_Demo"
* title = "Live Demo for definition-based extraction"
* status = #draft

* item[+] // Update der Probe
  * insert addExtractionContextGrouperUpdate("Specimen_Update", "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen", [["Specimen.identifier.where(value='ABC_123')"]])
  * item[+]
    * insert addExtractionHiddenItem("Proben_status", #choice, "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.status")
    * initial.valueCoding = #unavailable

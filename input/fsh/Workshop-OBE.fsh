Alias: $unitsofmeasure = http://unitsofmeasure.org
Instance: WorkshopOBE
InstanceOf: Questionnaire
Usage: #definition
* meta.lastUpdated = "2024-05-05T12:48:40Z"
* url = "http://example.org/fhir/QuestionnairesSDC/Questionnaire/WorkshopOBE"
* name = "Extraction_example"
* title = "Example for observation-based extraction"
* status = #draft

// Ohne RuleSets
* item[+]
* item[=].linkId = "PSA-Serologie"
* item[=].type = #decimal
* item[=].text =  "Angaben zur PSA-Serologie"
* item[=].code = $loinc#2857-1 "Prostate specific Ag [Mass/volume] in Serum or Plasma"
* item[=].enableBehavior = #all
* item[=].extension[+] // Dezimalstellen auf maximal 2 gesetzt
  * url = "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces"
  * valueInteger = 2
* item[=].extension[+] // UCUM-Maßeinheit für die Antwort festgelegt (ng/ml)
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
  * valueCoding = $unitsofmeasure#ng/mL
* item[=].extension[+] // Extraktions-Mechanismus eingefügt
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
  * valueBoolean = true
* item[=].extension[+] // Extraktion zur Observation.category eingefügt und Konzept übergeben
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
  * valueCodeableConcept = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* item[=].extension[+] // ...
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
  * valueCodeableConcept = http://terminology.hl7.org/CodeSystem/observation-category#22637-3 "Pathology report diagnosis"


// Mit RuleSets
* item[+]
  * insert addItem("2.16.840.1.113883.3.1937.777.18.2.4.10130", #decimal, "Angaben zur PSA-Serologie")
  * code = $loinc#2857-1 "Prostate specific Ag [Mass/volume] in Serum or Plasma"      
  * insert maxDecimalPlaces(2)
  * insert uunit(ng/mL)       
  * insert observationExtract 
  * insert observationExtract_laboratory_InCategory // zu übertragenes Konzept ist im RuleSet (weiter unten) festgelegt
  * insert observationExtractSectionInCategory(22637-3 "Pathology report diagnosis")



//------------------------------------------
// Definitionen der RuleSets

RuleSet: addItem(linkId, type, text)
* linkId = {linkId}
* type = {type}
* text = {text}

RuleSet: maxDecimalPlaces(maxPlaces)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces"
  * valueInteger = {maxPlaces}

RuleSet: uunit(code)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
  * valueCoding = $unitsofmeasure#{code}

RuleSet: observationExtract
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
  * valueBoolean = true

RuleSet: observationExtract_laboratory_InCategory
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
  * valueCodeableConcept = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

RuleSet: observationExtractSectionInCategory(code)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
  * valueCodeableConcept = $patho-sections#{code}
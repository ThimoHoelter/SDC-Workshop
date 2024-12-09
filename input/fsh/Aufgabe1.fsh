Instance: Aufgabe1
InstanceOf: Questionnaire
Usage: #definition
* url = "http://example.org/fhir/QuestionnairesSDC/Questionnaire/Aufgabe1"
* title = "SDC Workshop - Aufgabe 1: Anfertigen eines Fragebogens für klinische Vorbefunde"
* status = #draft


* item[+] // Letzter PSA-Wert

* item[+] // Datum der letzten PSA-Bestimmung

* item[+] // Art der Probenentnahme

// $sct#40013009 "Core needle biopsy of prostate (procedure)"
// $sct#90199006 "Transurethral prostatectomy (procedure)"
// $sct#26294005 "Radical prostatectomy (procedure)"

* item[+] // ProbenID der übersandten Bioprobe(n)




/*
RuleSets zur Verwendung:

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
*/
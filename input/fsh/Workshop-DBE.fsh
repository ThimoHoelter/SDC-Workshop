Instance: WorkshopDBE
InstanceOf: Questionnaire
Usage: #definition
* meta.lastUpdated = "2024-05-05T12:48:40Z"
* url = "http://example.org/fhir/QuestionnairesSDC/Questionnaire/WorkshopDBE"
* name = "Extraction_example"
* title = "Example for definition-based extraction"
* status = #draft

* item[+] // Erstellung der Observation
  * insert addExtractionContextGrouperNew("Observation_PSA", "http://hl7.org/fhir/StructureDefinition/Observation#Observation", #Observation)
  * item[+]
    * initial.valueCoding = $loinc#77599-9 "Additional documentation"
    * insert addExtractionHiddenItem("Observation_PSA_Category_SectionType", #choice, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.category.coding")
  * item[+]
    * insert addExtractionHiddenItem("Observation_PSA_Code", #choice, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code.coding")
    * initial.valueCoding = $loinc#2857-1 "Prostate specific Ag [Mass/volume] in Serum or Plasma"
  * item[+] //Einziges Item welches im Formular angezeigt wird
    * insert addExtractionItem("Observation_PSA_Value", #decimal, "Angaben zur PSA-Serologie", "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity.value") 
    * code = $loinc#2857-1 "Prostate specific Ag [Mass/volume] in Serum or Plasma" 
    * initial.valueDecimal = 1.234
    * insert uunit(ng/mL)
    * insert maxDecimalPlaces(3)
    //maxdecimal
  * item[+] // Maßeinheit (Displayname, System und Code werden ins Finding übertragen)
    * insert addExtractionHiddenItem("Observation_PSA_Unit_Display", #text, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity.unit")
    * initial.valueString = "ng/mL"
  * item[+]
    * insert addExtractionHiddenItem("Observation_PSA_Unit_Code", #text, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity.code")
    * initial.valueString = "ng/mL"
// Auskommentiert, da die Extrahierung der valueUri zu einem Fehler im Fhirlab führt.
//  * item[+]
//    * insert addExtractionHiddenItem("Observation_PSA_Unit_System", #url, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity.system")
//    * initial.valueUri = $unitsofmeasure 

// Primäres Gleason Muster (Epstein 2005)
* item[+]
  * insert addExtractionContextGrouperNew("Observation_PrimaerGleason", "http://hl7.org/fhir/StructureDefinition/Observation#Observation", #Observation)  
  * item[+] 
    * insert addExtractionItem("2.16.840.1.113883.3.1937.777.18.2.4.10290", #choice, "Primäres Gleason Muster - Epstein 2005", "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept.coding")
    * code = $loinc#44641-9 "Gleason pattern.primary in Prostate tumor"
    * answerOption[+].valueCoding = $sct#369770006 "Gleason Pattern 1 (finding)"
    * answerOption[+].valueCoding = $sct#369771005 "Gleason Pattern 2 (finding)"
    * answerOption[+].valueCoding = $sct#369772003 "Gleason Pattern 3 (finding)"
    * answerOption[+].valueCoding = $sct#369773008 "Gleason Pattern 4 (finding)"
    * answerOption[+].valueCoding = $sct#369774002 "Gleason Pattern 5 (finding)"
    * answerOption[+].valueCoding = $sct#43771008 "Morphology not applicable (finding)"
  * item[+]
    * insert addExtractionHiddenItem("Observation_PrimaerGleason_code", #choice, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code.coding")
    * initial.valueCoding = $loinc#44641-9 "Gleason pattern.primary in Prostate tumor"
  * item[+]
    * insert addObservationStatus("Observation_PrimaerGleason_status", final)
  * item[+]
    * insert addObservationEffectiveDate_Today("Observation_GleasonGrading_effective")

// Sekundäres Gleason Muster (Epstein 2005)
* item[+]
  * insert addExtractionContextGrouperNew("Observation_SekundaerGleason", "http://hl7.org/fhir/StructureDefinition/Observation#Observation", #Observation)  
  * item[+]
    * insert addExtractionItem("2.16.840.1.113883.3.1937.777.18.2.4.11246", #choice, "Sekundäres Gleason Muster - Epstein 2005", "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept.coding")
    * code = $loinc#44642-7 "Gleason pattern.secondary in Prostate tumor"
    * answerOption[+].valueCoding = $sct#369770006 "Gleason Pattern 1 (finding)"
    * answerOption[+].valueCoding = $sct#369771005 "Gleason Pattern 2 (finding)"
    * answerOption[+].valueCoding = $sct#369772003 "Gleason Pattern 3 (finding)"
    * answerOption[+].valueCoding = $sct#369773008 "Gleason Pattern 4 (finding)"
    * answerOption[+].valueCoding = $sct#369774002 "Gleason Pattern 5 (finding)"
    * answerOption[+].valueCoding = $sct#43771008 "Morphology not applicable (finding)"
  * item[+]
    * insert addExtractionHiddenItem("Observation_SekundaerGleason_code", #choice, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code.coding")
    * initial.valueCoding = $loinc#44642-7 "Gleason pattern.secondary in Prostate tumor"
  * item[+]
    * insert addObservationStatus("Observation_SekundaerGleason_status", final)
  * item[+]
    * insert addObservationEffectiveDate_Today("Observation_GleasonGrading_effective")

// Gleason Score ISUP 2014 - WHO 2016
* item[+]
  * insert addExtractionContextGrouperNew("Observation_GleasonGrading", "http://hl7.org/fhir/StructureDefinition/Observation#Observation", #Observation)  
  * item[+]
    * insert addExtractionItem("2.16.840.1.113883.3.1937.777.18.2.2.11200", #choice, "Gradinggruppe nach ISUP 2014/WHO 2016", "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept.coding")
    * code = $loinc#94734-1 "Prostate cancer grade group [Score] in Prostate tumor Qualitative"
    * answerOption[+].valueCoding = $sct#860742008 "Gleason grade group 1 (finding)"
    * answerOption[+].valueCoding = $sct#860743003 "Gleason grade group 2 (finding)"
    * answerOption[+].valueCoding = $sct#860744009 "Gleason grade group 3 (finding)"
    * answerOption[+].valueCoding = $sct#860745005 "Gleason grade group 4 (finding)"
    * answerOption[+].valueCoding = $sct#860746006 "Gleason grade group 5 (finding)"
  * item[+]
    * insert addExtractionHiddenItem("Observation_GleasonGrading_code", #choice, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code.coding")
    * initial.valueCoding = $loinc#94734-1 "Prostate cancer grade group [Score] in Prostate tumor Qualitative"
  * item[+]
    * insert addObservationStatus("Observation_GleasonGrading_status", final)
  * item[+]
    * insert addObservationEffectiveDate_Today("Observation_GleasonGrading_effective")

// Perineurale Infiltration
* item[+]
  * insert addExtractionContextGrouperNew("Observation_PerineuraleInfiltration", "http://hl7.org/fhir/StructureDefinition/Observation#Observation", #Observation)
  * item[+]
    * insert addExtractionItem("2.16.840.1.113883.3.1937.777.18.2.4.10380", #open-choice, "Perineurale Infiltration", "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept.coding")
    * code = $loinc#92837-4 "Perineural invasion [Presence] in Cancer specimen"
    * answerOption[+].valueCoding = $sct#52101004 "Present (qualifier value)"
    * answerOption[+].valueCoding = $sct#47492008 "Not seen (qualifier value)"
    * answerOption[+].valueCoding = $sct#1156316003 "Cannot be determined (qualifier value)"
  * item[+]
    * insert addExtractionHiddenItem("Observation_PerineuraleInfiltration_code", #choice, "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code.coding")
    * initial.valueCoding = $loinc#92837-4 "Perineural invasion [Presence] in Cancer specimen"
  * item[+]
    * insert addObservationStatus("Observation_PerineuraleInfiltration_status", final)
  * item[+]
    * insert addObservationEffectiveDate_Today("Observation_PerineuraleInfiltration_effective")

* item[+] // Erstellung des DiagReport
  * insert addExtractionContextGrouperNew("DiagnosticReport_Schlussfolgerung", "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport", #DiagnosticReport)
  * item[+]
  * item[=].linkId = "DiagnostischeSchlussfolgerung_Code"
  * item[=].type = #choice
  * item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.code.coding"
  * item[=].initial.valueCoding = $loinc#60568-3 "Pathology Synoptic report"
  * item[=].extension[+]
  * item[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
  * item[=].extension[=].valueBoolean = true
  * item[+]
  * item[=].linkId = "DiagnostischeSchlussfolgerung_Conclusion"
  * item[=].type = #string
  * item[=].text =  "Diagnostische Schlussfolgerung"
  * item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.conclusion"
  * item[+]
  * item[=].linkId = "DiagnostischeSchlussfolgerung_ConclusionCode"
  * item[=].type = #choice
  * item[=].text =  "Diagnostische Schlussfolgerung Kodierung"
  * item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.conclusionCode.coding"
  * item[=].answerOption[+].valueCoding = $sct#822970008 "Acinar cell cystadenocarcinoma of prostate (disorder)"
  * item[=].answerOption[+].valueCoding = $sct#399490008 "Adenocarcinoma of prostate (disorder)"
  * item[=].answerOption[+].valueCoding = $sct#278060005 "Endometrioid carcinoma of prostate (disorder)"
  * item[=].answerOption[+].valueCoding = $sct#715412008 "Familial malignant neoplasm of prostate (disorder)"
  * item[=].answerOption[+].valueCoding = $sct#94503003 "Metastatic malignant neoplasm to prostate (disorder)"
  * item[+]
  * item[=].linkId = "DiagnostischeSchlussfolgerung_EffectiveDateTime"
  * item[=].type = #date
  * item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectiveDateTime"
  * item[=].extension[+]
  * item[=].extension[=].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
  * item[=].extension[=].valueExpression.language = #text/fhirpath
  * item[=].extension[=].valueExpression.expression = "today()"
  * item[=].extension[+]
  * item[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
  * item[=].extension[=].valueBoolean = true

//------------------------------------------------
// Definitionen der RuleSets

// Grouper-Item für den Extraktions-Mechanismus. Mit .valueCode wird eine neue Instanze generiert
RuleSet: addExtractionContextGrouperNew(linkId, definition, code)
* linkId = {linkId}
* type = #group
* definition = {definition} // am Beispiel einer Observation: http://hl7.org/fhir/StructureDefinition/Observation#Observation
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
  * valueCode = {code} // Ressource angeben

  // Update-Grouper für bestehende Instanzen
RuleSet: addExtractionContextGrouperUpdate(linkId, definition, expression)
* linkId = {linkId}
* type = #group
* definition = {definition}
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
  * valueExpression
    * language = #text/fhirpath
    * expression = {expression} // fhirpath zur bestehenden Instanz

// Normale Frage
RuleSet: addExtractionItem(linkId, type, text, definition) 
* linkId = {linkId}
* text = {text}
* type = {type}
* definition = {definition}

// Item zur Übertragung "versteckter" Daten
RuleSet: addExtractionHiddenItem(linkId, type, definition)
* insert hiddenItem
* linkId = {linkId}
* type = {type}
* definition = {definition}

// Item um Observation.status zu setzen
RuleSet: addObservationStatus(linkId, code)
* insert hiddenItem
* linkId = {linkId}
* type = #choice
* definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.status"
* initial.valueCoding = $Observation-Status#{code}

// Belegt das Feld Observation.effectiveDateTime mit dem Datum des heutigen Tages
RuleSet: addObservationEffectiveDate_Today(linkId)
* insert hiddenItem
* linkId = {linkId}
* type = #date
* definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectiveDateTime"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
  * valueExpression
    * language = #text/fhirpath
    * expression = "today()"

// Versteckt das Item vor dem Renderer
RuleSet: hiddenItem
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
  * valueBoolean = true

// Maximale Anzahl der Dezimalstellen festlegen
RuleSet: maxDecimalPlaces(maxPlaces)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces"
  * valueInteger = {maxPlaces}
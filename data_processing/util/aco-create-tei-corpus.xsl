<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns="http://www.tei-c.org/ns/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization"
  xmlns:dsl="https://dsl.unibe.ch"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="output dsl map array tei xs xd"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  expand-text="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Oct 17, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:param name="files-map" as="map(*)" static="true"/>
  <xsl:param name="meta-map" as="map(*)" static="true"/>
  <xsl:param name="use-step" as="xs:string" static="true"/>
  
  <!-- incoming: a map containing file names as keys and a map with the outcomes of the steps -->
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="/">
    <teiCorpus xmlns="http://www.tei-c.org/ns/1.0">
      <teiHeader>
        <fileDesc>
          <titleStmt>
            <title level="s" type="web">Die Akten des Konzils von Ephesus 431. Übersetzung, Einleitung, Kommentar und Register</title>
            <title level="s" type="main">
              Acta Conciliorum Oecumenicorum. Translationes
            </title>
            <title level="s" type="sub">
              Kommentierte Übersetzung / Annotated Translation (Digital Corpus Edition)
            </title>
            <editor>
              <persName>
                <forename>Wolfram</forename>
                <surname>Kinzig</surname>
              </persName>
            </editor>
            <editor>
              <persName>
                <forename>Thomas</forename>
                <surname>Brüggemann</surname>
              </persName>
            </editor>
          </titleStmt>
          
          <editionStmt>
            <edition n="1.0">
              Digital corpus edition combining all volumes of the printed edition.
            </edition>
          </editionStmt>
          
          <extent>
            <measure unit="volumes" quantity="3">
              Planned corpus size: 3 volumes (print); currently contains Volume I only.
            </measure>
          </extent>
          
          <publicationStmt>
            <publisher>Digital Humanities, Universität Bern</publisher>
            <pubPlace>Bern</pubPlace>
            <date when="2024">2024–</date>
            <availability>
              <licence target="https://creativecommons.org/licenses/by-nc-nd/4.0/">
                Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
              </licence>
            </availability>
          </publicationStmt>
          
          <seriesStmt>
            <title level="s">Acta Conciliorum Oecumenicorum. Translationes</title>
            <respStmt>
              <resp>General editors</resp>
              <name>Wolfram Kinzig</name>
              <name>Thomas Brüggemann</name>
            </respStmt>
          </seriesStmt>
          
          <sourceDesc>
            <p>
              This digital corpus is based on a three-volume printed scholarly edition.
              The corpus is intended to integrate all volumes into a unified digital resource.
              At present, only the first volume has been prepared.
            </p>
            <p>
              <listBibl>
                <biblStruct type="digitalEdition">
                  <monogr>
                    <title level="m">
                      Concilium Universale Ephesenum
                    </title>
                    <title level="m" type="sub">
                      Von den Anfängen der nestorianischen Streitigkeiten bis zur Einberufung des Konzils
                    </title>
                    <editor>
                      <persName>
                        <forename>Wolfram</forename>
                        <surname>Kinzig</surname>
                      </persName>
                    </editor>
                    <editor>
                      <persName>
                        <forename>Thomas</forename>
                        <surname>Brüggemann</surname>
                      </persName>
                    </editor>
                    <respStmt>
                      <resp>Bearbeitet von</resp>
                      <name>Thomas Brüggemann</name>
                      <name>Sabine Lütkemeyer</name>
                    </respStmt>
                    <respStmt>
                      <resp>Unter Mitarbeit von</resp>
                      <name>Julia Beier</name>
                    </respStmt>
                    <imprint>
                      <biblScope/>
                    </imprint>
                  </monogr>
                  
                  <relatedItem ana="print">
                    <biblStruct>
                      <monogr>
                        <imprint>
                          <publisher>Walter de Gruyter GmbH</publisher>
                          <pubPlace>Berlin/Boston</pubPlace>
                          <date when="2024">2024</date>
                        </imprint>
                        
                        <biblScope unit="volume">
                          <title>Band I</title>
                          <idno type="ISBN">978-3-11-133993-1</idno>
                          <idno type="eISBN">978-3-11-134040-1</idno>
                        </biblScope>
                        <!--<biblScope unit="part">Teilband 1</biblScope>-->
                      </monogr>
                    </biblStruct>
                  </relatedItem>
                </biblStruct>
              </listBibl>
            </p>
          </sourceDesc>
        </fileDesc>
        
        <encodingDesc>
          <projectDesc>
            <p>
              The project “Die Akten des Konzils von Ephesus 431. Übersetzung, Einleitung,
              Kommentierung und Register” aims to provide a complete scholarly edition
              and translation of the acts of the Council of Ephesus (431).
            </p>
            <p>
              The digital corpus aggregates all volumes of the printed edition into a
              single TEI corpus (<gi>teiCorpus</gi>), enabling unified access,
              cross-referencing, and computational analysis.
            </p>
            <p>
              The present version contains only the material of Volume I; further volumes
              will be incrementally added.
            </p>
          </projectDesc>
          
          <editorialDecl>
            <p>
              The TEI encoding is derived from source data created with Classical Text Editor (CTE).
              The CTE data primarily reflects layout and typographic distinctions rather than
              explicit semantic or structural markup.
            </p>
            <p>
              During the conversion to TEI, layout-oriented paragraph and character styles were
              systematically interpreted and, where possible, mapped to structural and semantic
              elements. This process involved heuristic decisions, especially in cases where
              CTE styles did not correspond unambiguously to distinct textual structures.
            </p>
            <p>
              The encoding therefore represents an interpretation of the underlying document
              structure based on typographic cues in the source data. While the aim was to remain
              as close as possible to the source at the data level, the resulting TEI markup may
              differ from the original presentation in order to provide a more explicit structural
              representation.
            </p>
            <p>
              The transformation from layout-oriented CTE markup to ACO TEI was carried out
              using a reproducible processing pipeline. The scripts and workflows used for the conversion
              are publicly available at
              <ref target="https://github.com/DHBern/ACO/tree/main/data_processing">
                https://github.com/DHBern/ACO/tree/main/data_processing
              </ref>.
            </p>
          </editorialDecl>
        </encodingDesc>
        
        <profileDesc>
          <langUsage>
            <language ident="de">German</language>
            <language ident="en">English</language>
            <language ident="la">Latin</language>
            <language ident="grc">Ancient Greek</language>
          </langUsage>
          
          <textClass>
            <keywords>
              <term>Church history</term>
              <term>Council of Ephesus (431)</term>
              <term>Patristics</term>
              <term>Conciliar documents</term>
            </keywords>
          </textClass>
        </profileDesc>
        
        <revisionDesc>
          <change when="2026">
            Initial creation of TEI corpus; includes Volume I only.
          </change>
          <change status="work-in-progress">
            Planned integration of Volume II.
          </change>
          <change status="work-in-progress">
            Planned integration of Volume III and completion of corpus.
          </change>
        </revisionDesc>
      </teiHeader>
      <!-- inserting TEI files -->
      <xsl:sequence select="(map:keys($files-map) => sort()) ! map:get($files-map,.)?($use-step)"/>
      <!-- inserting meta files (foreword, register) -->
      <xsl:sequence select="(map:keys($meta-map) => sort()) ! map:get($meta-map,.)"/>
    </teiCorpus>
  </xsl:template>
  
</xsl:transform>
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
            <title>title of corpus</title>
            <author>author</author>
          </titleStmt>
          <publicationStmt>
            <p>Publication Information</p>
          </publicationStmt>
          <sourceDesc>
            <p>Information about the source</p>
          </sourceDesc>
        </fileDesc>
      </teiHeader>      
      <!-- inserting TEI files -->
      <xsl:sequence select="(map:keys($files-map) => sort()) ! map:get($files-map,.)?($use-step)"/>
      <!-- inserting meta files (foreword, register) -->
      <xsl:sequence select="(map:keys($meta-map) => sort()) ! map:get($meta-map,.)"/>
    </teiCorpus>
  </xsl:template>
  
</xsl:transform>
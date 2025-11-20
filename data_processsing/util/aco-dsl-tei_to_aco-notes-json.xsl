<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/2005/xpath-functions"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization"
  xmlns:dsl="https://dsl.unibe.ch"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:util="aco-utils.xsl"
  exclude-result-prefixes="array dsl map output tei xs xd"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  expand-text="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Oct 20, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:import href="aco-utils.xsl"/>
  <!-- using 'build-text' mode from: -->
  <xsl:import href="aco-dsl-tei_to_aco-text-json.xsl"/>
  
  <xsl:output indent="true"/>
  
  <!--<xsl:character-map name="unescape-solidus">
    <xsl:output-character character="/" string="/"/>
    <xsl:output-character character='"' string="'"/>
  </xsl:character-map>-->
  
  <xsl:param name="verbose" static="true" select="true()"/>
  <xsl:param name="basepath" select="'.'"/>
  <xsl:param name="task" select="'textData'"/>
  
  <xsl:variable name="serialization-parameters" as="element()">
    <output:serialization-parameters>
      <output:method value="html"/>
      <output:html-version value="5.0"/>
    </output:serialization-parameters>
  </xsl:variable>
  
  <xsl:template match="/">    
    <xsl:variable name="payload">
      <xsl:call-template name="build-json"/>
    </xsl:variable>
    <xsl:sequence select="$payload => xml-to-json(map { 'indent' : true() }) => replace('\sxmlns=\p{P}.*?([\s>])','$1') => normalize-space() => replace('\s–','&#160;–') => parse-json()"/>
    
    <xsl:message>Task `{$task}` done.</xsl:message>
  </xsl:template>
  
  <xsl:template name="build-json">
    <map>
      <map key="meta">
        <string key="task"></string>
        <string key="generated-by"></string>
        <string key="generated-on">{current-dateTime()}</string>
        <string key="description"></string>
      </map>
      <map key="notesData">
        <xsl:apply-templates select="//tei:TEI[@ana='aco-doc']"/>
      </map>
    </map>
  </xsl:template>
  
  <xsl:template match="tei:TEI">
    <xsl:variable name="tei-id" select="@xml:id => tokenize('_') => reverse() => head() => replace(',','-')"/>
    <map key="{$tei-id}">
      <xsl:for-each select="tei:text/tei:body/tei:div">
        <xsl:variable name="divId" select="@n => replace(',','-')"/>
        <map key="{($divId => substring-after($tei-id||'-'), 'text')[matches(.,'\S')][1] => replace('\.','')}">
          <xsl:for-each select=".//tei:note">
            <xsl:call-template name="note">
              <xsl:with-param name="teiId" select="$tei-id"/>
              <xsl:with-param name="divId" select="$divId"/>
              <xsl:with-param name="note" select="."/>
            </xsl:call-template>
          </xsl:for-each>
        </map>
      </xsl:for-each>
    </map>
  </xsl:template>
  
  <xsl:template name="note">
    <xsl:param name="teiId"/>
    <xsl:param name="divId"/>
    <xsl:param name="note"/>
    <map key="{util:noteKey($divId,$note)}">
      <string key="document">{$teiId}</string>
      <string key="doc_unit">{$divId}</string>
      <string key="line_start">{if ($note/mentioned/@n) 
        then $note/mentioned/@n => tokenize('–') => head() => util:trimSpace()
        else $note/preceding::lb[1]/@n}</string>
      <string key="line_end">{if ($note/mentioned/@n) 
        then $note/mentioned/@n => tokenize('–') => reverse() => head() => util:trimSpace()
        else $note/preceding::lb[1]/@n}</string>
      <!--<string key="line_start">{$note/preceding::lb[1]/@n}</string>
      <string key="line_end">{//seg[@xml:id=$note/@targetEnd => substring-after('#')]/preceding::lb[1]/@n}</string>-->
      <string key="refstring_lines">{if ($note/mentioned/@n) 
        then $note/mentioned/@n
        else $note/preceding::lb[1]/@n}</string>
      <xsl:choose>
        <xsl:when test="$note/tei:mentioned[contains(.,'…')]">
          <string key="text_start">{$note/tei:mentioned => replace('^(.*)….*','$1') => util:trimSpecialSpace()}</string>
        </xsl:when>
        <xsl:otherwise>
          <string key="text_start">{$note/tei:mentioned => substring-before(']') => util:trimSpecialSpace()}</string>
        </xsl:otherwise>
      </xsl:choose>
      <string key="text_end">{$note/tei:mentioned => replace('^.*…(.*)','$1') => substring-before(']') => util:trimSpecialSpace()}</string>
      <string key="refstring_text">
        <xsl:variable name="build-text">
          <!-- logic in aco-dsl-tei_to_aco-text.xsl -->
          <xsl:apply-templates select="$note/tei:mentioned/node()" mode="build-text"/>
        </xsl:variable>
        <xsl:sequence select="serialize($build-text,$util:serialization-parameters) => normalize-space()"/>
      </string>
      <string key="note_content">
        <xsl:variable name="build-text">
          <!-- logic in aco-dsl-tei_to_aco-text.xsl -->
          <xsl:apply-templates select="$note/node()" mode="build-text">
            <xsl:with-param name="accumulated-pointer-targets" tunnel="true" select="$accumulated-pointer-targets"/>
          </xsl:apply-templates>
        </xsl:variable>
        <xsl:sequence select="serialize($build-text,$util:serialization-parameters) => substring-after(']') => normalize-space()"/>
        <!--  => substring-after(']') -->
      </string>
    </map>    
  </xsl:template>
  
</xsl:stylesheet>
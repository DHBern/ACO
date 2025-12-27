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
  exclude-result-prefixes="array dsl map output tei util xs xd"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  expand-text="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Jun 13, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:output indent="true"/>
  
  <xsl:import href="aco-utils.xsl"/>
  
  <!--<xsl:character-map name="unescape-solidus">
    <xsl:output-character character="/" string="/"/>
    <xsl:output-character character='"' string="'"/>
  </xsl:character-map>-->
  
  <xsl:param name="verbose" static="true" select="true()"/>
  <xsl:param name="basepath" select="'.'"/>
  <xsl:param name="task" select="'textData'"/>
  
  <xsl:param name="accumulated-pointer-targets" as="map(*)"/>

  
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
    <xsl:sequence select="$payload => xml-to-json(map { 'indent' : true() }) => replace('\sxmlns=\p{P}.*?([\s>])','$1') => normalize-space() => replace('\s–','&#160;–') => dsl:massageString() => parse-json()"/>
    
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
      <map key="textData">
        <xsl:apply-templates select="//tei:TEI[@ana='aco-doc']"/>
      </map>
    </map>
  </xsl:template>
  
  <xsl:template match="tei:TEI">
    <xsl:variable name="textId" select="@xml:id => tokenize('_') => reverse() => head() => replace(',','-')"/>
    <map key="{$textId => util:sanitizeForJS() => util:sanitizeBrackets()}">
      <xsl:for-each select="tei:text/tei:body/tei:div">
        <string key="{if (contains(@n,',')) then @n => replace(',','-') => substring-after($textId||'-') => util:sanitizeForJS() => util:sanitizeBrackets() else 'text'}">
          <xsl:variable name="build-text">
            <xsl:apply-templates select="." mode="build-text"/>
          </xsl:variable>
          <xsl:sequence select="serialize($build-text,$serialization-parameters) => normalize-space()"/>
<!--          <xsl:text>{$build-text => normalize-space()}</xsl:text>-->
        </string>
      </xsl:for-each>
    </map>
  </xsl:template>
  
  <xsl:template match="tei:div" mode="build-text">
    <xsl:variable name="textId" select="ancestor::tei:TEI[1]/@xml:id => tokenize('_') => reverse() => head() => replace(',','-')"/>
    <section>
      <xsl:attribute name="data-unit">
        <xsl:choose>
          <xsl:when test="@n/data() and contains(@n,',')">{@n => replace(',','-') => substring-after($textId||'-') => util:sanitizeForJS()}</xsl:when>
<!--          <xsl:when test="@n/data()">{@n => replace(',','-') => util:sanitizeForJS()}</xsl:when>-->
          <!-- workaround; this shouldn't happen and should be flagged -->
          <xsl:when test="@n=''">{ancestor::tei:div/@n[data()][1] => replace(',','-') => substring-after($textId||'-') => util:sanitizeForJS()}</xsl:when>
          <xsl:when test="not(contains(@n,','))">text</xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      
      <xsl:apply-templates mode="build-text"/>
    </section>
  </xsl:template>
  
  
  <xsl:template match="tei:ab" mode="build-text">
    <p>
      <span data-type="title">
        <xsl:apply-templates mode="build-text"/>
      </span>
    </p>
  </xsl:template>
  
  <xsl:template match="tei:p" mode="build-text">
    <p>
      <xsl:apply-templates mode="build-text"/>
    </p>
  </xsl:template>
  
  <xsl:template match="tei:metamark" mode="build-text"/>
  
  <xsl:template match="tei:lb" mode="build-text" xml:space="preserve">
    <xsl:if test="preceding-sibling::node()[matches(.,'\S')] and not(@n='1')"><xsl:if test="@type='hyphen'"><span data-hyphen="">‐</span></xsl:if><br/></xsl:if><a data-line="{@n}">&#8203;</a><xsl:apply-templates mode="build-text"/>
  </xsl:template>
  
  <xsl:template match="tei:pb[@n/data()]" mode="build-text" xml:space="preserve">
    <a data-page="{@n}">&#8203;</a>
  </xsl:template>
  
  <xsl:template match="tei:note" mode="build-text">
    <span data-type="note-start" data-id="{util:noteKey(ancestor::tei:div[@n][1]/@n/data(),.) => util:sanitizeBrackets()}"></span>
  </xsl:template>
  
  <xsl:variable name="docNotes" select="//tei:note"/>
  
  <!-- some seg elements don't seem to be linked to notes; might need a separate template to process them at some point -->
  <xsl:template match="tei:seg['#'||@xml:id=$docNotes/@targetEnd]" mode="build-text">
    <xsl:variable name="seg-id" select="@xml:id"/>
    <xsl:apply-templates mode="build-text"/>
    <!-- iterate to catch recycled note-ends (with more than one note pointing to) -->
    <xsl:for-each select="$docNotes[@targetEnd='#'||$seg-id]">
      <xsl:variable name="pos" select="position()"/>
      <span data-type="note-end" data-id="{util:noteKey(ancestor::tei:div[@n][1]/@n/data(),$docNotes[@targetEnd='#'||$seg-id][$pos]) => util:sanitizeBrackets()}"></span>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="tei:hi[@rendition='#i']" mode="build-text">
    <em><xsl:apply-templates mode="build-text"/></em>
  </xsl:template>
  
  <xsl:template match="tei:hi[@rendition='#greek']" mode="build-text">
    <span data-lang="greek"><xsl:apply-templates mode="build-text"/></span>
  </xsl:template>
  
  <xsl:template match="tei:ref[@target]" mode="build-text">
<!--    <span data-ref="{@target}"><xsl:apply-templates mode="build-text"/></span>-->
    <a>
      <xsl:apply-templates select="@target" mode="build-text"/>
      <xsl:apply-templates mode="build-text"/>
    </a>
  </xsl:template>
  
  <!-- not sure this is needed; if so, then conflict with above template needs to be avoided -->
  <!--<xsl:template match="tei:ref[@xml:id]" mode="build-text">
    <span data-ref-id="{@xml:id}"><xsl:apply-templates mode="build-text"/></span>
  </xsl:template>-->
  
  <xsl:template match="@target" mode="build-text">
    <xsl:call-template name="util:process-targets">
      <xsl:with-param name="target" select="."/>
      <xsl:with-param name="accumulated-pointer-targets" tunnel="yes" select="$accumulated-pointer-targets"/>
    </xsl:call-template>
  </xsl:template>
  
  <!-- TODO: reglink -->
  
  
  <!-- helper function to operate on the resulting string (strip specific spaces, etc) -->
  <xsl:function name="dsl:massageString">
    <xsl:param name="input"/>
    <xsl:sequence select="$input
      (: purge whitespace after linebreak :)
      => replace('(data-line=.{7,10}/a>)\s+','$1')
      (: purge whitespace before hyphen :)
      => replace('\s(.span data-hyphen=)','$1')
      (: non-breaking space between note spans :)
      => replace('(data-id=.*?/>)\s+(&lt;.*?data-id=.*?/>)','$1&#xA0;$2')
      "/>
  </xsl:function>
  
</xsl:stylesheet>
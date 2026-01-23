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
      <xd:p><xd:b>Created on:</xd:b> Jan 19, 2026</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:variable name="prefix" select="base-uri() => tokenize('/') => reverse() => head() => replace('08[a-c]','08') => replace('\.xml','')"/>
  
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="teiHeader">
    <xsl:copy-of select="."/>
  </xsl:template>

  <!-- add div wrapper to chapter -->
  <xsl:template match="body">
    <xsl:copy>
      <xsl:sequence select="@*"/>
      <div n="{.//milestone[@unit='chapter']/@n}">
        <xsl:apply-templates/>
      </div>
    </xsl:copy>
  </xsl:template>
  
  <!-- prefix IDs to make them corpus-wide unique -->
  <xsl:template match="@xml:id">
    <xsl:attribute name="{name()}" select="($prefix => replace('^\d*[a-z]?_',''),.) => string-join('_') 
      => concat(if (parent::anchor) then '_anchor' else '')
      (: w182 also occurs in 08a_CV22.xml, thus making it unique :)
      => replace('w182','w182x')"/>
  </xsl:template>
  <xsl:template match="@target[contains(.,'#')]|@targetEnd">
    <xsl:variable name="anchor" select="if (parent::anchor) then '_anchor' else ''"/>
    <xsl:attribute name="{name()}" select="(. => tokenize('\s')) ! 
      ('#'||($prefix => replace('^\d*[a-c]?_',''),. => substring-after('#')) => string-join('_') => concat($anchor))
      (: w182 also occurs in 08a_CV22.xml, thus making it unique :)
      ! replace(.,'w182','w182x')"/>
  </xsl:template>
  
  <!-- CPal28 uses line milestones instead of chapterline (containing roman numerals) -->
  <xsl:template match="milestone[@unit='line']">
    <xsl:copy-of select="."/>
    <xsl:if test="$prefix[contains(.,'CPal28')]">
      <milestone unit="chapterline">
        <xsl:sequence select="@* except @unit"/>
      </milestone>
    </xsl:if>
  </xsl:template>
  <xsl:template match="milestone[@unit='chapterline']/@unit">
    <xsl:attribute name="unit" select="if ($prefix[contains(.,'CPal28')]) then 'chapterline-orig' else data()"/>
  </xsl:template>
    
</xsl:transform>
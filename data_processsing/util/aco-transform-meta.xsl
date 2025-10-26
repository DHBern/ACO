<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.tei-c.org/ns/1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:dsl="https://dsl.unibe.ch"
  exclude-result-prefixes="dsl xs xd"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  expand-text="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Oct 21, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <!-- 
    meta files such as introduction, abbreviations, literature
    so far only very preliminary treatment
  -->
  
  <xsl:output indent="true"/>
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:variable name="prefix" select="'_'||/TEI/teiHeader/fileDesc/titleStmt/title"/>
  
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="@xml:id|@target[starts-with(.,'#')]|@targetEnd">
    <xsl:attribute name="{name()}" select="($prefix,.,if (parent::anchor) then 'anchor' else '') => string-join('_')"/>
  </xsl:template>
  
  <xsl:template match="TEI">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="xml:id" select="$prefix"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="sourceDesc[not(*)]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <p/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="tagsDecl"/>
 
</xsl:stylesheet>
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
      <xd:p><xd:b>Created on:</xd:b> Oct 20, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:variable name="util:serialization-parameters" as="element()">
    <output:serialization-parameters>
      <output:method value="html"/>
      <output:html-version value="5.0"/>
    </output:serialization-parameters>
  </xsl:variable>
  
  <!-- generate unique key for notes based on the ID of the containing div and the note element -->
  <xsl:function name="util:noteKey">
    <xsl:param name="divId"/>
    <xsl:param name="note"/>
    <xsl:variable name="noteKey">
      <!-- divId -->
      <xsl:sequence select="$divId => replace(',','-')"/>
      <!-- start line -->
      <xsl:sequence select="'-'"/>
      <xsl:sequence select="if ($note/tei:mentioned/@n) then ($note/tei:mentioned/@n/data() => tokenize('–') => head()) ! replace(.,'.*?(\d+).*?','$1') else $note/preceding::tei:lb[1]/@n/data() ! replace(.,'.*?(\d+).*?','$1')"/>
      <!-- end line -->
      <xsl:sequence select="'-'"/>  
      <xsl:sequence select="$note/tei:mentioned/@n/data() => tokenize('–') => tail() => normalize-space() => replace(',','_') => replace('.*?(\d+).*?','$1')"/>
      <!-- start word -->
      <xsl:sequence select="'-'"/>
      <xsl:sequence select="$note/tei:mentioned/text() => string-join('') => tokenize('…') => head() => replace('\]','') => normalize-space() => util:undoSuperscript()"/>
      <!-- end word -->
      <xsl:sequence select="'-'"/>
      <xsl:sequence select="$note/tei:mentioned/text() => string-join('') => tokenize('…') => tail()=> string-join('') => substring-before(']') => normalize-space() => util:undoSuperscript()"/>
    </xsl:variable>
    <xsl:sequence select="$noteKey => util:trimSpace()"/>   
  </xsl:function>
  
  <xsl:function name="util:trimSpecialSpace">
    <xsl:param name="input"/>
    <xsl:sequence select="$input 
      => replace(' ','') (: U+002D :) 
      => replace(' ','') (: U+200A :)
      => replace(' ','') (: U+00A0 :)"/> 
  </xsl:function>
  
  <xsl:function name="util:trimSpace">
    <xsl:param name="input"/>
    <xsl:sequence select="$input 
      => replace('\s','')
      => util:trimSpecialSpace()"/> 
  </xsl:function>
  
  <xsl:function name="util:undoSuperscript">
    <xsl:param name="input"/>
    <xsl:sequence select="$input
      => translate('¹²³⁴⁵','12345')"/>
  </xsl:function>
  
</xsl:stylesheet>
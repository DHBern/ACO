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
  
  <xsl:param name="verbose" static="true" as="xs:boolean" select="true()"/>
  
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
    <xsl:sequence select="$noteKey => util:trimSpace() => util:trimShy() => util:sanitizeForJS()"/>   
  </xsl:function>
  
  <xsl:function name="util:trimShy">
    <xsl:param name="input"/>
    <xsl:sequence select="$input 
      => replace('­','') (: U+00AD :)"/> 
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
  
  <xsl:function name="util:sanitizeForJS">
    <xsl:param name="input"/>
    <xsl:sequence select="$input 
      => replace('\.','')"/> 
  </xsl:function>
  
  <xsl:function name="util:canonizeFilename">
    <xsl:param name="input"/>
    <xsl:sequence select="$input 
      => replace('^(aco_)?(\d+_(CVe?r?|CPal|CU)\d+).*','$2')"/> 
  </xsl:function>
  
  <!-- turning targets into working pointers (via accumulated-pointer-targets) -->
  <xsl:template name="util:process-targets">
    <xsl:param name="target"/>
    <xsl:param name="accumulated-pointer-targets" as="map(*)" tunnel="yes"/>
    <xsl:variable name="context" select="."/>
    
    <xsl:variable name="context" as="node()" select="$target"/>
    
    <xsl:variable name="target-sequence" as="item()*">
      
      <xsl:choose>
        <xsl:when test="matches($target/data(),'^(.+_dg\.xml#r-.+)')">
          <xsl:sequence select="($target => tokenize('\s')) ! replace(.,'_dg\.xml','')"/>
        </xsl:when>
        <xsl:when test="matches($target/data(),'^(#w\d+s?\s?){1,2}')">
          <xsl:sequence select="$target => tokenize('\s')"/>
        </xsl:when>
      </xsl:choose>
      
<!--      <xsl:message select="'$taget/data() from aco-utils.xsl: '|| $target/data()"/>-->
      
    </xsl:variable>
    
    
    <xsl:for-each select="$target-sequence">
      <!-- <a href='../CV166/II-praef?line=68' data-type='internal_ref' document='CV166' 
        doc_unit='II-praef' line_start='68' line_end='69'>CV166,II,Praef.,68–69</a> -->
      <!-- <ref target="#w133s #w159" rend="forceShow lines">CV19,1,3 – 5</ref> -->
      <xsl:choose>
        <xsl:when test="matches(.,'^#')">
          <xsl:variable name="input" select="."/>
          <xsl:variable name="doc" select="$context/ancestor::TEI[1]/@xml:id => util:canonizeFilename()"/>
          <xsl:variable name="document" select="$context/ancestor::TEI[1]/@xml:id => util:canonizeFilename() => substring-after('_')"/>
          <xsl:variable name="doc_unit" select="$context/ancestor::div[@n][1]/@n/data()"/>
          <xsl:variable name="key" select="$doc||'#'||$document||'_'||$input => replace('#','')"/>
          <xsl:variable name="key_end" select="$doc||'#'||$document||'_'||(($context => tokenize('\s'))[2] => replace('#',''))"/>
          <xsl:variable name="position" select="position()"/>
          <xsl:sequence select="util:applySequence($input,$doc,$key,$key_end,$position,$context,$accumulated-pointer-targets)"/>
        </xsl:when>
        <xsl:when test="matches(.,'^\d+_[CU|CV|CVer|CPal]')">
          <xsl:variable name="input" select="replace(.,'.*#','#')"/>
          <xsl:variable name="doc" select="replace(.,'^(.*)#','$1') => util:canonizeFilename()"/>
          <xsl:variable name="key" select="$doc||$input"/>
          <xsl:variable name="key_end" select="$doc||($context => tokenize('\s'))[2] => replace('.+(#)','$1')"/>
<!--          <xsl:message use-when="$verbose" select="'key_end: '||$key_end"/>-->
          <xsl:variable name="position" select="position()"/>
          <xsl:sequence select="util:applySequence($input,$doc,$key,$key_end,$position,$context,$accumulated-pointer-targets)"/>
<!--          <xsl:message use-when="$verbose">input: {$input} / doc: {$doc} / key: {$key} / key_end: {$key_end}</xsl:message>-->
        </xsl:when>
        <xsl:otherwise>
          <xsl:message>NB target creation failed; case not covered: {$context}</xsl:message>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:for-each>
  </xsl:template>
  
  <xsl:function name="util:applySequence">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="doc" as="xs:string"/>
    <xsl:param name="key" as="xs:string"/>
    <xsl:param name="key_end" as="xs:string"/>
    <xsl:param name="position"/>
    <xsl:param name="context" as="node()"/>
    <xsl:param name="accumulated-pointer-targets"/>
    <xsl:choose>
      <xsl:when test="starts-with($input,'#') and $position = 1">
        <xsl:attribute name="href">{$accumulated-pointer-targets?($key)?('target')}</xsl:attribute>
        <xsl:attribute name="data-type" select="'internal_ref'"/>
        <xsl:attribute name="document" select="$accumulated-pointer-targets?($key)?('doc') => substring-after('_')"/>
        <xsl:attribute name="doc_unit" select="$accumulated-pointer-targets?($key)?('chapter')"/>
        <xsl:attribute name="document_end" select="$accumulated-pointer-targets?($key_end)?('doc') => substring-after('_')"/>
        <xsl:attribute name="doc_unit_end" select="$accumulated-pointer-targets?($key_end)?('chapter')"/>
        <xsl:attribute name="line_start" select="$accumulated-pointer-targets?($key)?('line')"/>
        <xsl:attribute name="line_end" select="$accumulated-pointer-targets?($key_end)?('line')"/>
        <xsl:attribute name="debug_cte" select="$context"/>
      </xsl:when>
      <xsl:when test="starts-with($input,'#') and $position gt 1"/>
      <xsl:otherwise>input: {$input} / doc: {$doc}</xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
</xsl:stylesheet>
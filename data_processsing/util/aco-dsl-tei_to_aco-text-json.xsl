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
    <map key="{$textId => util:sanitizeForJS()}">
      <xsl:for-each select="tei:text/tei:body/tei:div">
        <string key="{if (contains(@n,',')) then @n => replace(',','-') => substring-after($textId||'-') => util:sanitizeForJS() else 'text'}">
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
  
  <xsl:template match="tei:p|tei:ab" mode="build-text">
    <p>
      <xsl:apply-templates mode="build-text"/>
    </p>
  </xsl:template>
  
  <xsl:template match="tei:lb" mode="build-text" xml:space="preserve">
    <xsl:if test="preceding-sibling::node()[matches(.,'\S')]"><xsl:if test="@type='hyphen'"><span data-hyphen="">‐</span></xsl:if><br/></xsl:if><a data-line="{@n}">&#8203;</a><xsl:apply-templates mode="build-text"/>
  </xsl:template>
  
  <xsl:template match="tei:pb[@n/data()]" mode="build-text" xml:space="preserve">
    <a data-page="{@n}">&#8203;</a>
  </xsl:template>
  
  <xsl:template match="tei:note" mode="build-text">
    <span data-type="note-start" data-id="{util:noteKey(ancestor::tei:div[@n][1]/@n/data(),.)}"></span>
  </xsl:template>
  
  <xsl:variable name="docNotes" select="//tei:note"/>
  
  <!-- some seg elements don't seem to be linked to notes; might need a separate template to process them at some point -->
  <xsl:template match="tei:seg['#'||@xml:id=$docNotes/@targetEnd]" mode="build-text">
    <xsl:variable name="seg-id" select="@xml:id"/>
    <xsl:apply-templates mode="build-text"/><span data-type="note-end" data-id="{util:noteKey(ancestor::tei:div[@n][1]/@n/data(),$docNotes[@targetEnd='#'||$seg-id][1])}"></span>
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
    <xsl:param name="accumulated-pointer-targets" as="map(*)" tunnel="yes"/>
    <xsl:variable name="context" select="."/>
    
    <xsl:variable name="context" as="node()" select="."/>
    
    <xsl:variable name="target-sequence" as="item()*">
      
      <xsl:choose>
        <xsl:when test="matches(data(),'^(.+_dg\.xml#r-.+)')">
          <xsl:sequence select="(. => tokenize('\s')) ! replace(.,'_dg\.xml','')"/>
        </xsl:when>
        <xsl:when test="matches(data(),'^(#w\d+s?\s?){1,2}')">
          <xsl:sequence select=". => tokenize('\s')"/>
        </xsl:when>
      </xsl:choose>
      
      <xsl:message select="data()"></xsl:message>
      
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
          <xsl:sequence select="dsl:applySequence($context,$input,$doc,$document,$doc_unit,$key,$key_end,$position)"/>
        </xsl:when>
        <xsl:when test="matches(.,'^\d+_[CV(er)?|CPal]')">
          <xsl:variable name="input" select="replace(.,'.*#','#')"/>
          <xsl:variable name="doc" select="replace(.,'^(.*)#','$1') => util:canonizeFilename()"/>
          <xsl:variable name="document" select="$context/ancestor::TEI[1]/@xml:id => util:canonizeFilename() => substring-after('_')"/>
          <xsl:variable name="doc_unit" select="$context/ancestor::div[@n][1]/@n/data()"/>
          <xsl:variable name="key" select="$doc||$input"/>
          <xsl:variable name="key_end" select="$doc||'#'||$document||'_'||(($context => tokenize('\s'))[2] => replace('#',''))"/>
          <xsl:variable name="position" select="position()"/>
          <xsl:sequence select="dsl:applySequence($context,$input,$doc,$document,$doc_unit,$key,$key_end,$position)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message>NB target creation failed; case not covered: {$context}</xsl:message>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:for-each>
  </xsl:template>
  
  <xsl:function name="dsl:applySequence">
    <xsl:param name="context" as="node()"/>
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="doc" as="xs:string"/>
    <xsl:param name="document" as="xs:string"/>
    <xsl:param name="doc_unit" as="xs:string"/>
    <xsl:param name="key" as="xs:string"/>
    <xsl:param name="key_end" as="xs:string"/>
    <xsl:param name="position"/>
    <xsl:choose>
      <xsl:when test="starts-with($input,'#') and $position = 1">
        <xsl:message>input: {$input} / doc: {$doc} / document: {$document} / doc_unit: {$doc_unit} / key: {$key} / key_end: {$key_end}</xsl:message>
        <xsl:attribute name="href">{$accumulated-pointer-targets?($key)?('target')}</xsl:attribute>
        <xsl:attribute name="data-type" select="'internal_ref'"/>
        <xsl:attribute name="document" select="$document"/>
        <xsl:attribute name="doc_unit" select="$doc_unit => substring-after($document) => replace(',','')"/>
        <xsl:attribute name="line_start" select="$accumulated-pointer-targets?($key)?('line')"/>
        <xsl:attribute name="line_end" select="$accumulated-pointer-targets?($key_end)?('line')"/>
        <xsl:attribute name="debug_cte" select="$context"/>
      </xsl:when>
      <xsl:when test="starts-with($input,'#') and $position gt 1"/>
      <xsl:otherwise>input: {$input} / doc: {$doc} / document: {$document} / doc_unit: {$doc_unit}</xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
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
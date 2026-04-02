<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:util="aco-utils.xsl"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs math xd"
  expand-text="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Nov 20, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <!-- 
  
  <add>
    <doc>
      <field name="id">03_CV19#CV19_w2058</field>
      <field name="type">reference</field>
      <field name="chapter">CV19,8</field>
      <field name="content">...</field>
    </doc>
    <doc>
      <field name="id">03_CV19#CV19_w1992</field>
      <field name="type">reference</field>
      <field name="chapter">CV19,8</field>
      <field name="content">...</field>
    </doc>
    <!-/- ... more docs ... -/->
  </add>

  
  -->
  
  <xsl:output indent="true"/>
  
  <xsl:mode on-no-match="shallow-skip"/>
  
  <xsl:import href="aco-utils.xsl"/>
  <!-- using 'build-text' mode from: -->
<!--  <xsl:import href="aco-dsl-tei_to_aco-text-json.xsl"/>-->
  
  
  <xsl:template match="/">
    <add>
      <xsl:apply-templates select="//body//div"/>  
      <xsl:apply-templates select="//body//note"/>
      <xsl:apply-templates select="//body//list"/>
      <xsl:apply-templates select="//body//listBibl"/>
    </add>
  </xsl:template>
  
  <xsl:template match="body//div[@n]">
    <doc>
      <xsl:variable name="unit" select="util:divId(@n,util:teiId(ancestor::TEI/@xml:id))"/>
      <!--<field name="acoNumLabel">Dok. {(ancestor::TEI/@xml:id => tokenize('_'))[2] => number() => format-number('0')}-deprecated</field>-->
      <!--<field name="acoNumX">{(ancestor::TEI/@xml:id => tokenize('_'))[2] => number() => format-number('0')}</field>-->
      <!--<field name="chapter">deprecated</field>-->
      <!--<field name="liber">deprecated</field>-->
      <!--<field name="schwartzSlug">{(ancestor::TEI/@xml:id => tokenize('_'))[3]}-deprecated</field>-->
      <!--<field name="schwartzSlugNum">{(ancestor::TEI/@xml:id => tokenize('_'))[3] => replace('^[aA-zZ]+','')}</field>-->
      <!--<field name="slug">{(ancestor::TEI/@xml:id => tokenize('_'))[3] => replace(',','-')}-deprecated</field>-->
      <!--<field name="title">{parent::body/head/hi[1]/following-sibling::node() => string-join(' ') => normalize-space()}-deprecated</field>-->
      <!--<field name="type">aco-unit-deprecated</field>-->
      <!--<field name="aco-type">{(ancestor::TEI/@xml:id => tokenize('_'))[3] => replace('[0-9]+$','')}-deprecated</field>-->
      <!--<field name="content">{.//text() => string-join(' ') => normalize-space() => util:trimShy()}</field>-->
      <field name="id">{@n}</field>
      <field name="aco_id">{@n}</field>
      <field name="aco_docUnit">{@n}</field>
      <field name="aco_numLabel">Dok. {(ancestor::TEI/@xml:id => tokenize('_'))[2] => number() => format-number('0')}</field>
      <field name="aco_numX">{(ancestor::TEI/@xml:id => tokenize('_'))[2] => number() => format-number('0')}</field>
      <field name="aco_unit">{$unit}</field>
      <xsl:if test="contains($unit,'-')">
        <field name="aco_liber">{$unit => substring-before('-')}</field>
      </xsl:if>
      <field name="aco_schwartzSlug">{(ancestor::TEI/@xml:id => tokenize('_'))[3]}</field>
      <field name="aco_slug">{(ancestor::TEI/@xml:id => tokenize('_'))[3] => replace(',','-')}</field>
      <field name="aco_docTitle">{parent::body/head/hi[1]/following-sibling::node() => string-join(' ') => replace('Dokument\s\d+,\s','') => normalize-space()}</field>
      <field name="aco_type">aco-unit</field>
      <field name="aco_collection">{(ancestor::TEI/@xml:id => tokenize('_'))[3] => replace('[0-9]+$','')}</field>
      <field name="aco_text_all">
        <xsl:variable name="string">
          <xsl:apply-templates select=".//text()" mode="clean-text"/>
        </xsl:variable>
        <xsl:text>{$string => string-join(' ') => normalize-space() => util:trimShy()}</xsl:text>
      </field>
      <field name="aco_text_bare">
        <xsl:variable name="string">
          <xsl:apply-templates select=".//text()[not(ancestor::note)]" mode="clean-text"/>
        </xsl:variable>
        <xsl:text>{$string => string-join(' ') => normalize-space()  => util:trimShy()}</xsl:text>
      </field>
      <field name="aco_text_notes">
        <xsl:variable name="string">
          <xsl:apply-templates select=".//note//text()" mode="clean-text"/>
        </xsl:variable>
        <xsl:text>{$string => string-join(' ') => normalize-space() => util:trimShy()}</xsl:text>
      </field>
      <field name="aco_last_generated">{current-dateTime()}</field>
    </doc>
  </xsl:template>
  
  <xsl:template match="body[ancestor::TEI[@ana='aco-doc']]//note">
    <xsl:variable name="unit" select="util:divId(ancestor::div[@n][1]/@n,util:teiId(ancestor::TEI/@xml:id))"/>
    <doc>
      <xsl:variable name="id" select="
        (ancestor::div[@n][1]/@n, preceding::head[1]/@n)[1]
        ||'-'||
        preceding::pb[1]/@n
        ||'-'||
        .//mentioned => substring-before(']') => util:trimSpace()"/>
      <field name="id">{$id}</field>
      <field name="aco_id">{$id}</field>
      <field name="aco_type">aco-note</field>
      <field name="aco_numLabel">Dok. {(ancestor::TEI/@xml:id => tokenize('_'))[2] => number() => format-number('0')}</field>
      <field name="aco_numX">{(ancestor::TEI/@xml:id => tokenize('_'))[2] => number() => format-number('0')}</field>
      <field name="aco_schwartzSlug">{(ancestor::TEI/@xml:id => tokenize('_'))[3]}</field>
      <field name="aco_slug">{(ancestor::TEI/@xml:id => tokenize('_'))[3] => replace(',','-')}</field>
      <field name="aco_docTitle">{ancestor::body/head/hi[1]/following-sibling::node() => string-join(' ') => replace('Dokument\s\d+,\s','') => normalize-space()}</field>
      <field name="aco_unit">{$unit}</field>
      <field name="aco_collection">{(ancestor::TEI/@xml:id => tokenize('_'))[3] => replace('[0-9]+$','')}</field>
      <!-- creation of the following field is similar to the note template in aco-dsl-tei_to_aco-notes-json.xsl -->
      <field name="aco_noteStart">
        <xsl:choose>
          <xsl:when test="mentioned[contains(.,'…')]">{mentioned => replace('^(.*)….*','$1') => util:trimSpecialSpace() => util:trimSpace()}</xsl:when>
          <xsl:otherwise>{mentioned => substring-before(']') => util:trimSpecialSpace()}</xsl:otherwise>
        </xsl:choose>
      </field>
      <field name="aco_noteEnd">{mentioned => replace('^.*…(.*)','$1') => substring-before(']') => util:trimSpecialSpace()}</field>
      <field name="aco_noteLineStart">{if (mentioned/@n) 
        then mentioned/@n => tokenize('–') => head() => util:trimSpace()
        else preceding::lb[1]/@n}</field>
      <field name="aco_noteLineEnd">{if (mentioned/@n) 
        then mentioned/@n => tokenize('–') => reverse() => head() => util:trimSpace()
        else preceding::lb[1]/@n}</field>
      <field name="aco_noteNumber"></field>
      <field name="aco_text_bare">
        <xsl:variable name="string">
          <xsl:apply-templates select=".//text()" mode="clean-text"/>
        </xsl:variable>
        <xsl:text>{$string => string-join(' ') => normalize-space() => util:trimShy()}</xsl:text>
      </field>
      <field name="aco_last_generated">{current-dateTime()}</field>
    </doc>
  </xsl:template>
  
  <xsl:template match="TEI[not(@ana='aco-doc')]//p[@rendition='#rp-p_index']">
    <doc>
      <field name="id">aco_reg_{.//text() => string-join() => substring-before(' ') => lower-case() => replace('\s','') => normalize-space()}</field>
      <field name="aco_id">aco_reg_{.//text() => string-join() => substring-before(' ') => lower-case() => replace('\s','') => normalize-space()}</field>
      <field name="aco_type">aco-regEntry</field>
      <field name="aco_regType">
        <xsl:choose>
          <xsl:when test="matches(parent::div/head//text() => string-join(),'Personen')">person</xsl:when>
          <xsl:when test="matches(parent::div/head//text() => string-join(),'Personen')">place</xsl:when>
        </xsl:choose>
      </field>
      <field name="aco_regLemma">{.//text() => string-join() => substring-before(' ') => normalize-space()}</field>
      <xsl:for-each select=".//text() => string-join() => substring-after(' ') => tokenize(';')">
        <field name="aco_regTarget">{. => normalize-space()}</field>
      </xsl:for-each>
      <field name="aco_last_generated">{current-dateTime()}</field>
    </doc>
  </xsl:template>
  
  <xsl:template match="TEI[not(@ana='aco-doc')]//list[@type='abbreviations']//item">
    <doc>
      <field name="id">aco_abbreviation_{abbr//text() => string-join() => lower-case() => replace('\s','') => normalize-space()}</field>
      <field name="aco_id">aco_abbreviation_{abbr//text() => string-join() => lower-case() => replace('\s','') => normalize-space()}</field>
      <field name="aco_type">aco-abbreviation</field>
      <field name="aco_abbr">{abbr => normalize-space()}</field>
      <field name="aco_expan">{expan => normalize-space()}</field>
      <field name="aco_directlink"></field>
      <field name="aco_last_generated">{current-dateTime()}</field>
    </doc>
  </xsl:template>
  
  <xsl:template match="TEI[not(@ana='aco-doc')]//listBibl//bibl">
    <xsl:variable name="aco_vol" select="'1'"/><!-- for now hardcoded -->
    <doc>
      <field name="id">aco_bibliography_{.//text() => string-join() => lower-case() => replace('\s','') => normalize-space()}</field>
      <field name="aco_id">aco_bibliography_{.//text() => string-join() => lower-case() => replace('\s','') => normalize-space()}</field>
      <field name="aco_type">aco-bibliography</field>
      <field name="aco_vol">{$aco_vol}</field>
      <xsl:variable name="start" select=".//text() => string-join() => tokenize(',') => head() => normalize-space() => encode-for-uri()"/>
      <xsl:variable name="end" select=".//text() => string-join() => tokenize(',') => reverse() => head() => normalize-space() => encode-for-uri()"/>
      <field name="aco_directlink">/ACO/dokumente/{$aco_vol}/literatur#:~:text={$start},{$end}</field>
      <field name="aco_bibl">{.//text() => string-join() => normalize-space()}</field>
      <field name="aco_last_generated">{current-dateTime()}</field>
    </doc>
  </xsl:template>
  
  <!-- handle hyphenation -->
  <xsl:template mode="clean-text" match="text()[following-sibling::*[1][self::lb[@type='hyphen']]]">{. => substring-before('­')}</xsl:template>
  
  
  <!-- TODO
  
  - meta docs (intro etc) (type aco-meta)
  - document metadata (type aco-doc)
  
  -->
  
</xsl:transform>
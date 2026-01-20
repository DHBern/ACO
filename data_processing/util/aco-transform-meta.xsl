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
  <xsl:mode name="preprocess-abbr" on-no-match="shallow-copy"/>
  
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
  
  <xsl:template match="text">
    <xsl:copy>
      <xsl:copy-of select="@* except @xml:space"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="milestone[@unit='line']">
    <lb n="{@n}">
      <xsl:if test="preceding-sibling::text()[1][ends-with(.,'­')]">
        <xsl:attribute name="type" select="'hyphen'"/>
      </xsl:if>
    </lb>
  </xsl:template>
  
  <xsl:template match="milestone[@unit='page']">
    <pb n="{@n}">
      <xsl:if test="preceding-sibling::text()[1][ends-with(.,'­')]">
        <xsl:attribute name="type" select="'hyphen'"/>
      </xsl:if>
    </pb>
  </xsl:template>
  
  <xsl:template match="head[contains(.//text(),'Eine vorläufige Einleitung')]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <!-- add missing page information -->
      <pb n="XI"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="p[@rendition=('#rp-p','#rp-p_lz','#rd-Text')]">
    <p>
      <xsl:if test="@rendition='#rp-p_lz'">
        <xsl:attribute name="rend">#reglet</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="note[@place='foot']">
    <xsl:copy>
      <xsl:sequence select="@n"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!-- needed to retain in order to derive "footnotereference" targets -->
  <xsl:template match="anchor|seg">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="hi[@rendition='#rf-Emphasis']">
    <emph>
      <xsl:apply-templates/>
    </emph>
  </xsl:template>
  
  <xsl:template match="hi[matches(@rend,'^letter-spacing:-0.\dpt;$')]">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:variable name="classes" as="map(*)" select="map{
    '#rf-griechisch' : '#greek',
    '#rf-unterstrichen' : '#underlined',
    '#rf-griechisch_unterstrichen' : '#greek #underlined',
    '#rf-kursiv' : '#italic',
    '#rf-unterstrichen_kursiv' : '#underlined #italic',
    '#rf-hochgestellt' : '#sup',
    '#rf-superscript' : '#sup'
    }"/>
  
  <xsl:template match="hi">
    <xsl:copy>
      <xsl:if test="@rendition">
        <xsl:attribute name="rendition" select="(@rendition => tokenize('\s+')) ! $classes?(.)"/>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="div[p[@rendition='#rp-p_bibl']]">
    <listBibl>
      <xsl:apply-templates/>
    </listBibl>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-p_bibl']">
    <bibl>
      <xsl:apply-templates/>
    </bibl>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-p_bibl']//text()">
    <xsl:analyze-string select="." regex="(https?://\S+)">
      <xsl:matching-substring>
        <ref target="{regex-group(1)}">{regex-group(1)}</ref>
      </xsl:matching-substring>
      <xsl:non-matching-substring>{.}</xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
  <xsl:template match="div[p[@rendition='#rp-p_abbr']]">
    <list type="abbreviations">
      <xsl:apply-templates/>
    </list>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-p_abbr']">
    <!-- insert SEPARATOR to split at tab character -->
    <xsl:variable name="preprocess">
      <xsl:apply-templates mode="preprocess-abbr"/>
    </xsl:variable>
    <item>
      <abbr>
        <xsl:sequence select="$preprocess/node()[following::SEPARATOR]"></xsl:sequence>
      </abbr>
      <expan>
        <xsl:sequence select="$preprocess/node()[preceding::SEPARATOR]"></xsl:sequence>
      </expan>
    </item>
  </xsl:template>
  
  <xsl:template match="text()[contains(.,'&#9;')]" mode="preprocess-abbr">
    <xsl:analyze-string select="." regex="&#9;">
      <xsl:matching-substring><SEPARATOR/></xsl:matching-substring>
      <xsl:non-matching-substring>{.}</xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
  <xsl:template match="ref">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <!--<xsl:attribute name="target">
        <xsl:apply-templates select="@target" mode="build-text">
          <xsl:with-param name="accumulated-pointer-targets" tunnel="true" select="$accumulated-pointer-targets"/>
        </xsl:apply-templates>-->
      <!--</xsl:attribute>-->
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
 
 
  <!--<xsl:template match="hi[matches(@rendition,'#rf-griechisch')]">
    <xsl:copy>
      <xsl:attribute name="rend">
        <xsl:text>#greek</xsl:text>
        <xsl:if test="matches(@rendition,'_unterstrichen')">
          <xsl:text> #underlined</xsl:text>
        </xsl:if>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="hi[matches(@rendition,'#rf-unterstrichen_kursiv')]">
    <xsl:copy>
      <xsl:attribute name="rend" select="'#italic #underlined'"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="hi[@rendition='#rf-hochgestellt']">
    <xsl:copy>
      <xsl:attribute name="rend" select="'#sup'"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>-->
  
 
 
</xsl:stylesheet>
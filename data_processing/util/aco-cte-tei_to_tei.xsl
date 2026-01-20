<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.tei-c.org/ns/1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:dsl="https://dsl.unibe.ch"
  exclude-result-prefixes="dsl xs xd"
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
  
  <xsl:param name="inclusions-map" as="map(*)" static="true" select="map{}"/>
  
  <xsl:mode name="text" on-no-match="shallow-skip"/>
  <xsl:mode name="heading" on-no-match="shallow-skip"/>
  <xsl:mode name="infer-chapters" on-no-match="shallow-copy"/>
  <xsl:mode name="chapter-divs" on-no-match="shallow-copy"/>
  <xsl:mode name="snip-tail" on-no-match="shallow-copy"/>
  
  <!-- preprocessing -->
  <!-- The TEI export from CTE inserts chapters as milestones at positions that make processing unnecessarily complicated.
       To counter this we wrap the content of the chapters in divs (using an intermediary chapter assignment; upwards-projection would also work).-->
  
  <!--<xsl:variable name="infer-chapters-base">
    <xsl:apply-templates select="/" mode="infer-chapters"/>
  </xsl:variable>
  <xsl:variable name="tei-with-chapter-divs">
    <xsl:apply-templates select="$infer-chapters-base" mode="chapter-divs"/>
  </xsl:variable>
  
  <xsl:template match="div/p" mode="infer-chapters">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:choose>
        <xsl:when test="descendant::milestone[@unit='chapter']">
          <xsl:attribute name="tmp-chapter" select=".//milestone[@unit='chapter'][1]/@n"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="tmp-chapter" select="preceding::milestone[@unit='chapter'][1]/@n"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="infer-chapters"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="body/div[not(div)]" mode="chapter-divs">
    <xsl:sequence select="node()[not(@tmp-chapter)]"/>
    <xsl:call-template name="chapter-divs"/>
  </xsl:template>
  
  <!-/- special treatment for documents with liber -/->
  <xsl:template match="body/div[div]" mode="chapter-divs">
    <xsl:sequence select="node()[not(@tmp-chapter)]"/>
    <xsl:for-each select="div">
      <xsl:call-template name="chapter-divs"/>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="chapter-divs">
    <xsl:for-each-group select="p" group-by="@tmp-chapter">
      <div n="{current-grouping-key()}">
        <xsl:apply-templates select="current-group()" mode="chapter-divs"/>
      </div>
    </xsl:for-each-group>
  </xsl:template>
  -->
  
  <!-- preprocessing, reloaded -->
  <!-- The naive approach above didn't work becuase a paragraph may be part of two chapters (who would have guessed..).
       Instead upward-projection to the rescue.
  -->
  
  <xsl:mode name="tei-data-fixup" on-no-match="shallow-copy"/>
  <xsl:mode name="uwp" on-no-match="shallow-copy"/>
  <xsl:mode name="uwp-split" on-no-match="shallow-copy"/>
  
  <xsl:mode name="move-acoTitle" on-no-match="shallow-copy"/>
    
  <!-- fixing some unexpected data structures to keep downstream processing sane;
       this is highly case-specific and not meant to be extended beyond things 
       that really need fixing on input level -->
  <xsl:variable name="tei-data-fixup">
    <xsl:apply-templates select="/" mode="tei-data-fixup"/>
  </xsl:variable>
  
  <xsl:variable name="tei-with-chapter-divs">
    <xsl:apply-templates select="$tei-data-fixup" mode="uwp"/>
  </xsl:variable>
  
  <xsl:template match="body/div" mode="uwp">
    
    <xsl:for-each-group select="descendant::node()[empty(node())]"
      group-starting-with="milestone[@unit='chapter']">
      <!-- apply upward projection for the current group -->
      <xsl:apply-templates select="/TEI/text/body/div" mode="uwp-split">
        <xsl:with-param name="restricted-to" tunnel="yes"
          select="current-group()/ancestor-or-self::node()"/>
      </xsl:apply-templates>
    </xsl:for-each-group>
    
  </xsl:template>
  
  <!--<xsl:template match="teiHeader" mode="split" priority="1.5">
    <xsl:copy-of select="."/>
  </xsl:template>-->
  
  <xd:doc>
    <xd:desc>
      <xd:b>Helper template for the upward projection.</xd:b>
      <xd:p>The upward projection is applied both to page and line beginnings (pb and lb
        elements). This template checks if an incoming node is in the scope of the
        projection action and if so, initiates the default rules (shallow copy).</xd:p>
    </xd:desc>
    <xd:param name="restricted-to">Tunnel parameter that helps to determine if a node is in or
      out of scope for the projection action.</xd:param>
  </xd:doc>
  <xsl:template match="node()" mode="uwp-split" priority="1">
    <xsl:param name="restricted-to" as="node()*" tunnel="yes"/>
    <xsl:if test="exists(. intersect $restricted-to)">
      <xsl:next-match/>
    </xsl:if>
  </xsl:template>
  
  <!-- tei-data-fixup -->
  <!-- fixup case 0 -->
  <!-- page milestones are placed before chapter milestones in the input; this needs to be reversed so page information is not
       lost in subsequent chapter-based upward-projection -->
  <xsl:template match="milestone[@unit='chapter']" mode="tei-data-fixup">
    <xsl:copy-of select="."/>
<!--    <xsl:if test="preceding-sibling::*[position() le 3]/self::milestone[@unit='page']">-->
      <xsl:copy-of select="preceding-sibling::*[position() le 3]/self::milestone[@unit='page']"/>
      <xsl:copy-of select="preceding-sibling::*[position() le 4]/self::milestone[@unit='chapterline'][@n='1']"/>
      <xsl:copy-of select="preceding-sibling::*[position() le 3]/self::note[@place='left']"/>
    
    <!-- in some documents the milestones are wrapped in hi -->
    <xsl:copy-of select="preceding-sibling::*[position() le 3]/self::hi/milestone[@unit='page']"/>
    <xsl:copy-of select="preceding-sibling::*[position() le 3]/self::hi/milestone[@unit='chapterline'][@n='1']"/>
    
    <!--</xsl:if>-->
  </xsl:template>
  
  <!-- fixup case 1 -->
  <xsl:template match="div[p/milestone[@n='CV150,168']]/head" mode="tei-data-fixup">
    <xsl:comment>chapter milestone added by tei-data-fixup template</xsl:comment>
    <head rendition="#rp-heading_3"><milestone n="-" unit="chapterline"/><milestone n="-" unit="line"/><milestone n="CV150,168" unit="chapter"/><emph n="CV150,168"><hi rend="display:none;"
          >CV150,168</hi></emph>Aus dem zweiten [Brief] an die Korinther</head>
  </xsl:template>
  <xsl:template match="div[p/milestone[@n='CV150,168']]/p[@rendition='#rp-p'][1]/milestone[@unit='chapter']" mode="tei-data-fixup"/>
  <xsl:template match="div[p/milestone[@n='CV150,168']]/p[@rendition='#rp-p'][1]/emph[@n='CV150,168']" mode="tei-data-fixup"/>
  
  <!-- fixup case 2 -->
  <xsl:template match="div[p/milestone[@n='CV150,224']]/head" mode="tei-data-fixup">
    <head rendition="#rp-heading_3"><milestone n="-" unit="chapterline"/><milestone n="-" unit="line"/><milestone n="CV150,224" unit="chapter"/><emph n="CV150,224"><hi rend="display:none;"
          >CV150,224</hi></emph>Aus dem Evangelium nach Lukas</head>
  </xsl:template>
  <xsl:template match="div[p/milestone[@n='CV150,224']]/p[@rendition='#rp-p'][1]/milestone[@unit='chapter']" mode="tei-data-fixup"/>
  <xsl:template match="div[p/milestone[@n='CV150,224']]/p[@rendition='#rp-p'][1]/emph[@n='CV150,168']" mode="tei-data-fixup"/>
  
  
  <!-- processing -->
  
  <xsl:variable name="prefix" select="if (matches(base-uri(),'08a_')) then '08_CV22' else base-uri() => tokenize('/') => reverse() => head() => replace('\.xml','')"/>
  
  <xsl:variable name="generated">
    <xsl:processing-instruction name="xml-model">href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
    <xsl:processing-instruction name="xml-model">href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"</xsl:processing-instruction>
    <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="aco_{$prefix}" ana="aco-doc">
      <teiHeader>
        <fileDesc>
          <titleStmt>
            <title/>
          </titleStmt>
          <publicationStmt>
            <p/>
          </publicationStmt>
          <sourceDesc>
            <p>Derived from CTE exported TEI.</p>
          </sourceDesc>
        </fileDesc>
      </teiHeader>
      <text>
        <body>
          <xsl:call-template name="heading"/>
          <xsl:call-template name="metadata"/>
          <!-- debug: make context after tei-data-fixup visible -->
<!--          <xsl:copy-of select="$tei-data-fixup/TEI/text"></xsl:copy-of>-->
          <!-- debug: make context after uwp visible -->
<!--          <xsl:copy-of select="$tei-with-chapter-divs/TEI/text"></xsl:copy-of>-->
          <xsl:apply-templates select="$tei-with-chapter-divs/TEI/text" mode="text"/>
        </body>
      </text>
    </TEI>
  </xsl:variable>
  
  
  <xsl:variable name="newline"><xsl:text>&#xA;</xsl:text></xsl:variable>
  
  <xsl:template match="/">

    <!-- move acoTitle out of chapter div -->
    <!-- TODO: still needed? -->
    <!--<xsl:variable name="generated">
      <xsl:apply-templates select="$generated" mode="move-acoTitle"/>
    </xsl:variable>-->

    <!--<xsl:result-document href="output/generated.xml">
      <xsl:sequence select="$generated"/>
    </xsl:result-document>-->
    <xsl:sequence select="$generated"/>
    
    <!-- debug -->
    <!-- infer chapter base -->
    <!-- <xsl:sequence select="$infer-chapters-base"/> -->
    
    <!-- chapter divs
    <xsl:sequence select="$tei-with-chapter-divs"/>
    <xsl:result-document href="tmp.xml">
      <xsl:sequence select="$tei-with-chapter-divs"/>
    </xsl:result-document> -->
  </xsl:template>
  
  
  <!--<xsl:template match="div[ab[@type='acoTitle']]" mode="move-acoTitle">
    <div n="{/TEI/@xml:id => tokenize('_') => reverse() => head()}-acoTitle">
      <xsl:copy-of select="ab[@type='acoTitle']"/>
    </div>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="node() except ab[@type='acoTitle']" mode="move-acoTitle"/>
    </xsl:copy>
  </xsl:template>-->
  
  
  <!-- mode: heading -->
  
  <xsl:template name="heading">
    <xsl:apply-templates select="//head[@rendition='#rp-heading_1']" mode="heading"/>
  </xsl:template>
  
  <xsl:template match="head[@rendition='#rp-heading_1']" mode="heading">
    <pb n="{following::milestone[@unit='page'][1]/@n => number() -1}"/>
    <head n="{note[@type='doc' or @place='right']/p//text()}">
      <xsl:apply-templates mode="heading"/>
    </head>
  </xsl:template>
  
  <xsl:template match="text()" mode="heading">{.}</xsl:template>

  <xsl:template match="hi[not(matches(@rend,'display:none;'))]" mode="heading">
    <xsl:copy>
      <xsl:if test="@rendition='#rf-kursiv'">
        <xsl:attribute name="rendition" select="'#i'"/>
      </xsl:if>
      <xsl:apply-templates mode="heading"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="hi[@rendition='#rf-griechisch']" mode="heading">
    <hi rendition="#greek">
      <xsl:apply-templates mode="heading"/>
    </hi>
  </xsl:template>
  
  <xsl:template match="hi[matches(@rend,'display:none;')]" mode="heading"/>

  <!-- mode: metadata -->

  <xsl:template name="metadata">
    <list>
      <xsl:apply-templates select="//p[@rendition='#rp-kopf']" mode="metadata"/>
    </list>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-kopf']" mode="metadata">
    <item>
      <title>
        <xsl:apply-templates select="hi[@rendition='#rf-kursiv_fett' or matches(@rend,'font-style:italic;font-weight:bold;')]" mode="metadata"/>
      </title>
      <p>
        <xsl:apply-templates select="hi[@rendition=('#rf-kursiv','#rf-griechisch') or matches(@rend,'font-style:italic;$')]" mode="metadata"/>
      </p>
    </item>
  </xsl:template>
  
  <xsl:template match="note" mode="metadata">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="metadata"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="note//hi[@rendition='#rf-kursiv']" mode="metadata">
    <hi rendition="#i">
      <xsl:apply-templates mode="metadata"/>
    </hi>
  </xsl:template>
  
  <xsl:template match="note//hi[@rendition='#rf-griechisch']|p//hi[@rendition='#rf-griechisch']" mode="metadata">
    <hi rendition="#greek">
      <xsl:apply-templates mode="metadata"/>
    </hi>
  </xsl:template>
  
  <xsl:template match="ref" mode="metadata">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <!-- mode: text -->
  
  <!--<xsl:template match="text" mode="text">
    <div n="{//p[not(@rendition='#rp-kopf')]/milestone[@unit='chapter']/@n}">
      <pb n="{.//milestone[@unit='page']/@n -1}"/>
      <xsl:apply-templates mode="text"/>
    </div>
  </xsl:template>-->
  
  <!-- prefix IDs to make them corpus-wide unique -->
  <xsl:template match="@xml:id" mode="text">
    <xsl:choose>
      <!-- special treatment for included files -->
      <xsl:when test="matches(.,'(CV22)|(CPal28)')">
        <xsl:copy-of select="."/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="{name()}" select="($prefix => replace('^\d*[a-z]?_',''),.) => string-join('_') => concat(if (parent::anchor) then '_anchor' else '')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="@target[starts-with(.,'#')]|@targetEnd[not(matches(.,'(CV22)|(CPal28)'))]" mode="text">
    <xsl:attribute name="{name()}" select="'#'||($prefix => replace('^\d*_',''),. => replace('#','')) => string-join('_') => concat(if (parent::anchor) then '_anchor' else '')"/>
  </xsl:template>
  
  <xsl:template match="div[ab|p[not(@rendition='#rp-kopf')]]" mode="text">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="n" select="(.//milestone[@unit='chapter']/@n |
        (: cover cases in CV150 :)
        preceding-sibling::div[1][head][not(p|ab)]//milestone[@unit='chapter']/@n |
        (: cover CV150,159 :)
        preceding-sibling::div[2][head][not(p|ab)]//milestone[@unit='chapter']/@n
        )[1]"/>
      <xsl:sequence select=".//milestone[@unit='chapter']"/>
      <!-- handling some titles of CV150 (CV150,159 requires two preceding titles) -->
      <xsl:for-each select="preceding-sibling::div[position() le 2][head][not(p|ab)]">
        <xsl:sequence select=".//milestone[@unit='chapter']"/>
        <xsl:apply-templates mode="text"/>
      </xsl:for-each>
      <xsl:choose>
        <!-- case: CV166, CV149 -->
        <xsl:when test="div">
          <xsl:for-each-group select="." group-starting-with="div">
            <xsl:choose>
              <xsl:when test="current-group()[position()=1]">
                <!-- for the first nested div handle anything except the div itself (but its contents); that is: avoid creating a nested div -->
                <xsl:apply-templates select="current-group()/node()[following-sibling::div]" mode="text"/>
                <xsl:apply-templates select="current-group()/div/node()" mode="text"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="current-group()/node()" mode="text"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each-group>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates mode="text"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
    <!-- two column layout in CV22,8 -->
    <xsl:if test=".//milestone[@unit='chapter'][@n='CV22,7']">
<!--      <xsl:apply-templates mode="text"/>-->
      <xsl:variable name="col1" as="node()" select="map:get($inclusions-map,'08b_CV22.xml')?('step2')"/>
      <div type="columned" n="{$col1//body//milestone[@unit='chapter']/@n}">
        <div type="col1">
          <xsl:sequence select="$col1//body//div[matches(@n,'\S')]"/>
        </div>
        <cb/>
        <div type="col2">
          <xsl:sequence select="map:get($inclusions-map,'08c_CPal28-8.xml')?('step2')//body//div[matches(@n,'\S')]"/>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="div[head][not(p|ab)]" mode="text"/>
  
  <xsl:template match="div[p[@rendition='#rp-kopf']]" mode="text"/>
  
  <xsl:template match="p[@rendition='#rp-Einleitungstext'][not(preceding-sibling::p)]" mode="text">
    <ab type="acoTitle">
      <xsl:if test="not(.//milestone[@unit='chapterline' and @n='1'])">
        <xsl:apply-templates select="preceding::milestone[@unit='chapterline'][1]" mode="text"/>
      </xsl:if>
      <xsl:apply-templates mode="text"/>
    </ab>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-Einleitungstext'][preceding-sibling::p]" mode="text">
    <ab type="acoInnerTitle">
      <xsl:apply-templates mode="text"/>
    </ab>
  </xsl:template>
  
  <xsl:template match="head[@rendition='#rp-heading_3'][matches(.,'\S')]" mode="text">
    <ab type="acoInnerTitle">
      <xsl:apply-templates mode="text"/>
    </ab>
  </xsl:template>
   
  <!--<xsl:template match="p[@rendition='#rp-Einleitungstext'][preceding-sibling::p[1][@rendition='#rp-kopf']]" mode="text">
    <ab type="acoTitle">
      <xsl:apply-templates mode="text"/>
    </ab>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-Einleitungstext'][matches(.,'\S')][not(preceding-sibling::p[1][@rendition='#rp-kopf'])]" mode="text">
    <ab type="acoInnerTitle">
      <xsl:apply-templates mode="text"/>
    </ab>
  </xsl:template>-->
  
  
  <xsl:template match="head[@rendition='#rp-heading_2'][matches(.,'\S')]" mode="text">
    <p>
      <xsl:apply-templates mode="text"/>
    </p>
  </xsl:template>
  
  
  <!-- 
  ## `p/@rendition`

* `#rp-p`
* `#rp-p1`
* `#rp-p_abbr`
* `#rp-p_bibl`
* `#rp-p_index`
* `#rp-p_list`
* `#rp-p_leerzeile_darüber`
* `#rp-p_lz`
* `#rp-p_zweispaltig_links`
* `#rp-p_zweispaltig_rechts`
* `#rp-toc1`
* `#rp-toc2`
* `#rp-doc`
* `#rd-Text`
* `#rp-Einleitungstext`
* `#rp-kopf`

  -->
  
  <xsl:template match="p[@rendition=('#rp-p','#rp-p_leerzeile_darüber','#rp-Blockzitat','#rp-p_2spaltig_links','#rp-p_2spaltig_rechts')][matches(.,'\S')]" mode="text">
    <p>
      <xsl:if test="@rendition='#rp-Blockzitat'">
        <xsl:attribute name="rend">#blockquote</xsl:attribute>
      </xsl:if>
      <xsl:if test="@rendition='#rp-p_leerzeile_darüber'">
        <xsl:attribute name="rend">#reglet</xsl:attribute>
      </xsl:if>
      <!--<xsl:if test=".//milestone[@unit='chapterline'][1][@n=2]">-->
      <xsl:if test="(.//milestone[@unit='chapterline'])[1][@n='2' or @n='ii'] and 
        not(./preceding-sibling::p[1][matches(@rendition,'#rp-[p|Einleitungstext]')]//milestone[@unit='chapterline'])">
        <lb n="{if ((.//milestone[@unit='chapterline'])[1][@n='ii']) then 'i' else '1'}"/><xsl:comment>synthesised!</xsl:comment>
      </xsl:if>
      <xsl:apply-templates mode="text"/>
    </p>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-p' or @rendition='#rp-p_leerzeile_darüber'][not(matches(.,'\S'))]" mode="text"/>
  
  <xsl:template match="milestone[@unit='chapterline']" mode="text">
    <xsl:sequence select="$newline"/>
    <lb n="{@n}">
      <xsl:if test="matches(preceding-sibling::node()[1],'&#173;$')">
        <xsl:attribute name="type" select="'hyphen'"/>
      </xsl:if>
    </lb>
  </xsl:template>
  
  <xsl:template match="milestone[@unit='page']" mode="text">
    <pb n="{@n}"/>
  </xsl:template>
  
  <xsl:template match="anchor" mode="text">
    <xsl:copy>
      <xsl:copy-of select="@* except @xml:id"/>
      <xsl:apply-templates select="@xml:id" mode="text"/>
      <xsl:apply-templates mode="text"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="seg" mode="text">
    <xsl:copy>
      <xsl:copy-of select="@* except @xml:id"/>
      <xsl:apply-templates select="@xml:id" mode="text"/>
      <xsl:apply-templates mode="text"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="note[@type='n1']" mode="text">
    <!--<note>
      <xsl:sequence select="@place,@targetEnd"/>
    </note>-->
    <xsl:copy>
      <xsl:sequence select="@* except @rend, @targetEnd"/>
      <xsl:apply-templates select="@targetEnd" mode="text"/>
      <xsl:apply-templates mode="text"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="note[@place=('left','right')]" mode="text">
    <metamark place="{@place/data()}">
        <xsl:apply-templates mode="text"/>
    </metamark>
  </xsl:template>
  
  <xsl:template match="note/p" mode="text">
    <xsl:choose>
      <!--<xsl:when test="mentioned[.//text()]">
        <xsl:apply-templates mode="text"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="mentioned-new">
          <xsl:call-template name="synthesize-mentioned">
            <xsl:with-param name="mentioned" select="mentioned"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="id-of-first-with-closing-bracket" select=".//node()[contains(.,']')][1]/generate-id()"/>
        <!-\-<xsl:variable name="note-content">
        </xsl:variable>-\->
        <xsl:sequence select="$mentioned-new"/>
        <xsl:for-each select=".//node()[generate-id()=$id-of-first-with-closing-bracket]">
          <xsl:choose>
            <xsl:when test="self::text()">
              <xsl:sequence select=". => substring-after(']')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:sequence select=". => substring-after(']')"/>
              </xsl:copy>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        <xsl:sequence select=".//node()[generate-id()=$id-of-first-with-closing-bracket]/following-sibling::node()"/>
      </xsl:otherwise>-->
      <xsl:when test="mentioned[not(.//text()) or .//text()='#']">
        <xsl:variable name="mentioned-new">
          <xsl:call-template name="synthesize-mentioned">
            <xsl:with-param name="mentioned" select="mentioned"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="id-of-first-with-closing-bracket" select=".//node()[contains(.,']')][1]/generate-id()"/>
        <xsl:sequence select="$mentioned-new"/>
        <xsl:for-each select=".//node()[generate-id()=$id-of-first-with-closing-bracket]">
          <xsl:choose>
            <xsl:when test="self::text()">
              <xsl:sequence select=". => substring-after(']')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:sequence select=". => substring-after(']')"/>
              </xsl:copy>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        <xsl:sequence select=".//node()[generate-id()=$id-of-first-with-closing-bracket]/following-sibling::node()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
  <xsl:template match="mentioned[.//text()]" mode="text">
    <xsl:copy>
      <xsl:sequence select="@* except @rend"/>
      <xsl:apply-templates mode="text"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- synthesizing contents for mentioned where missing (12 cases) -->
  <xsl:template name="synthesize-mentioned">
    <xsl:param name="mentioned"/>
    <xsl:for-each select="$mentioned">
      <xsl:copy>
        <xsl:sequence select="@* except @rend"/>
        <xsl:variable name="id-of-next-with-closing-bracket" select="following-sibling::node()[contains(.,']')][1]/generate-id()"/>
        <xsl:variable name="mentioned-new">
            <xsl:apply-templates select="following-sibling::node()[1][generate-id()=$id-of-next-with-closing-bracket] | 
              following-sibling::node()[following-sibling::node()[generate-id()=$id-of-next-with-closing-bracket]] |
              following-sibling::node()[self::node()[generate-id()=$id-of-next-with-closing-bracket]]" mode="text"/>
        </xsl:variable>
        <xsl:apply-templates mode="snip-tail" select="$mentioned-new"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="text()" mode="snip-tail">
    <xsl:sequence select=". => replace('\].*',']')"/>
  </xsl:template>
  
  <xsl:template match="hi[@rendition='#rf-kursiv']" mode="text">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="rendition">#i</xsl:attribute>
      <xsl:apply-templates mode="text"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="p/hi[@rendition='#rf-griechisch']|note//hi[@rendition='#rf-griechisch']" mode="text">
    <hi rendition="#greek">
      <xsl:apply-templates mode="text"/>
    </hi>
  </xsl:template>
  <!-- special case in CV149 (2 occurrences) -->
  <xsl:template match="note//hi[@rend='font-family:GFS Neohellenic;']" mode="text">
    <hi rendition="#greek">
      <xsl:apply-templates mode="text"/>
    </hi>
  </xsl:template>
  
  <xsl:template match="hi[contains(@rend,'vertical-align:super')]" mode="text">
    <xsl:choose>
      <!-- annotations on identical lemmata on the same line are differentiated with superscripts -->
      <xsl:when test="ancestor::mentioned">
        <xsl:sequence select=". => translate('12345','¹²³⁴⁵')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:sequence select="@* except @rend"/>
          <xsl:attribute name="rendition">#sup</xsl:attribute>
          <xsl:apply-templates mode="text"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="note//hi[matches(@rend,'font-size:9.5pt;')][matches(.//text(),'\S')]" mode="text">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template match="note//hi[matches(@rend,'font-weight:bold;')][matches(.//text(),'\S')]" mode="text">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <xsl:template match="ref" mode="text">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  
  <xsl:template match="note[@place='left' or @place='right']//text()" mode="text"/>
  <xsl:template match="head[not(matches(@rendition,'#rp-heading_\d'))]//text()" mode="text"/>
  <xsl:template match="hi[contains(@rend,'display:none;')]//text()" mode="text"/>
  <xsl:template match="p[@rendition='#rp-kopf']//text()" mode="text"/>
  
  <xsl:template match="text()" mode="text">{.}</xsl:template>
  
</xsl:stylesheet>
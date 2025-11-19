<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:local="https://dsl.unibe.ch"
  xmlns:util="aco-utils.xsl"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="#all"
  expand-text="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Mar 21, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:output method="json" indent="true"/>
  
  <xsl:import href="aco-utils.xsl"/>
  
    
  <xsl:mode on-no-match="shallow-skip"/>
  <xsl:mode name="meta-docs-html" on-no-match="shallow-skip"/>
  
  <xsl:global-context-item as="map(*)"/>
  <xsl:variable name="meta-docs-incoming" select=".?*[matches(.,'Vorwort|Einleitung|Literaturverzeichnis|Abkürzungsverzeichnis')]"/>
  
  <xsl:param name="accumulated-pointer-targets" as="map(*)" static="true" select="map{}"/>
  
  <!-- using 'build-text' mode from: -->
<!--  <xsl:import href="aco-dsl-tei_to_aco-text-json.xsl"/>-->
  
  
  <xsl:template match="/">
    
    <xsl:message select="$accumulated-pointer-targets"></xsl:message>
    
    <xsl:variable name="payload">
      <map xmlns="http://www.w3.org/2005/xpath-functions">
        <map key="metaDocs">
            <xsl:apply-templates select="$meta-docs-incoming/TEI"/>
        </map>
        <map key="meta">
          <string key="task"></string>
          <string key="generated-by">{base-uri(document('')) => tokenize('/') => reverse() => head()}</string>
          <string key="generated-on">{current-dateTime()}</string>
          <string key="description"></string>
        </map>
      </map>
    </xsl:variable>
    
    <xsl:sequence select="$payload => xml-to-json() => parse-json()"/>
    
  </xsl:template>
  
  <xsl:template match="TEI">
    <xsl:variable name="payload">
      <xsl:apply-templates select="text" mode="meta-docs-html"/>
    </xsl:variable>
    
    <xsl:message select="$payload"/>
    
    <map key="{@xml:id => tokenize('_') => reverse() => head()}" xmlns="http://www.w3.org/2005/xpath-functions">
      <string key="text">
        <xsl:sequence select="serialize($payload,$util:serialization-parameters) => normalize-space()"/>
      </string>
      <map key="footnotes">
        <xsl:for-each select="text//note">
          <string key="note-{@n}">
            <xsl:variable name="current-note">
              <xsl:apply-templates mode="meta-docs-html"/>
            </xsl:variable>
            <xsl:sequence select="serialize($current-note,$util:serialization-parameters) => normalize-space()"/>
          </string>
        </xsl:for-each>
      </map>
    </map>
  </xsl:template>
  
  <xsl:template match="text" mode="meta-docs-html">
    <article lang="{@xml:lang}">
      <xsl:apply-templates mode="meta-docs-html"/>
    </article>
  </xsl:template>
  
  <xsl:template match="head" mode="meta-docs-html">
    <h1>
      <xsl:apply-templates select="@rendition" mode="meta-docs-html"/>
      <xsl:apply-templates mode="meta-docs-html"/>
    </h1>
  </xsl:template>
  
  <xsl:template match="div" mode="meta-docs-html">
    <div><xsl:apply-templates mode="meta-docs-html"/></div>
  </xsl:template>
  
  <xsl:template match="p" mode="meta-docs-html">
    <p><xsl:apply-templates mode="meta-docs-html"/></p>
  </xsl:template>
  
  <!-- inline -->
  <xsl:template match="hi" mode="meta-docs-html">
    <span class="{@rend => replace('#','')}">
      <xsl:apply-templates mode="meta-docs-html"/>
    </span>
  </xsl:template>
  
  <xsl:template match="emph" mode="meta-docs-html">
    <em><xsl:apply-templates mode="meta-docs-html"/></em>
  </xsl:template>
  
  <xsl:template match="ref[not(contains(@rend,'page')) and not(@type='footnotereference')]" mode="meta-docs-html">
    <a>
      <xsl:choose>
        <xsl:when test="matches(@target,'^https?://')">
          <xsl:attribute name="href" select="@target"/>
        </xsl:when>
        <xsl:otherwise>
          <!-- targets relative to edition contents (sequence of attributes) -->
          <xsl:variable name="processed-targets" as="attribute()*">
            <!-- derive linking targets from accumulated pointers -->
            <xsl:call-template name="util:process-targets">
              <xsl:with-param name="target" select="@target"/>
              <xsl:with-param name="accumulated-pointer-targets" tunnel="true" select="$accumulated-pointer-targets"/>
            </xsl:call-template>
          </xsl:variable>
          <!-- adjust targets for vol 1 -->
          <xsl:attribute name="href">
            <xsl:sequence select="$processed-targets[name()='href']/data() => replace('\.\./','/edition/1/')"/>
          </xsl:attribute>
          <xsl:sequence select="$processed-targets[name()!='href']"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="meta-docs-html"/>
    </a>
  </xsl:template>
  
  <xsl:template match="ref[contains(@rend,'page')]" mode="meta-docs-html">
    <xsl:variable name="page-target" select="@target => replace('^#(.*?)\s.*','$1')"/>
    <xsl:variable name="targeted-page" select="//anchor[contains(@xml:id,$page-target)]/preceding::pb[1]/@n"/>
    <!-- <p>S. hierzu unten S. <ref target="#w7199s #w7273" rend="page lines">XXXVI,6 – 12</ref>.</p> -->
    <a href="#page-{$targeted-page}" dev="{@target}">
      <xsl:apply-templates mode="meta-docs-html"/>
    </a>
  </xsl:template>
  
  <xsl:template match="pb[@n]" mode="meta-docs-html">
    <span id="page-{@n}"/>
  </xsl:template>
  
  <xsl:template match="ref[@type='footnotereference']" mode="meta-docs-html">
    <xsl:variable name="fn-target" select="@target => replace('#','')"/>
    <xsl:variable name="targeted-fn" select="//anchor[contains(@xml:id,$fn-target)]/following-sibling::note[1]/@n"/>
    <a href="#{$targeted-fn}">{$targeted-fn}</a>
  </xsl:template>
  
  <xsl:template match="note" mode="meta-docs-html">
    <sup id="ref-{@n}">{@n}</sup>
  </xsl:template>
  
  <xsl:template match="listBibl" mode="meta-docs-html">
    <section>
      <xsl:apply-templates mode="meta-docs-html"/>
    </section>
  </xsl:template>
  
  <xsl:template match="listBibl/head" mode="meta-docs-html">
    <h2>
      <xsl:apply-templates select="@rendition" mode="meta-docs-html"/>
      <xsl:apply-templates mode="meta-docs-html"/>
    </h2>
    <ul>
      <xsl:for-each select="following-sibling::bibl">
        <li><xsl:apply-templates mode="meta-docs-html"/></li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="@rendition" mode="meta-docs-html">
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="data()='#rp-heading_1'">h1</xsl:when>
        <xsl:when test="data()='#rp-heading_2'">h2</xsl:when>
        <xsl:otherwise>FML not caught</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="bibl" mode="meta-docs-html"/>
  
  
  <xsl:template match="list[@type='abbreviations']" mode="meta-docs-html">
    <xsl:apply-templates select="head" mode="meta-docs-html"/>
    <dl class="abbreviations">
      <xsl:apply-templates select="node() except head" mode="meta-docs-html"/>
    </dl>
  </xsl:template>
  
  <xsl:template match="list[@type='abbreviations']/head" mode="meta-docs-html">
    <h1>
      <xsl:apply-templates select="@rendition" mode="meta-docs-html"/>
      <xsl:apply-templates mode="meta-docs-html"/>
    </h1>
  </xsl:template>
  
  <xsl:template match="item" mode="meta-docs-html">
    <dt><xsl:apply-templates select="abbr" mode="meta-docs-html"/></dt>
    <dd><xsl:apply-templates select="expan" mode="meta-docs-html"/></dd>
  </xsl:template>
  
  <xsl:template match="abbr|expan" mode="meta-docs-html">
    <xsl:apply-templates mode="meta-docs-html"/>
  </xsl:template>
  
  <xsl:template match="text()" mode="meta-docs-html">{. => util:trimShy()}</xsl:template>
  
  <xsl:template match="lb" mode="meta-docs-html"/>
  <xsl:template match="milestone" mode="meta-docs-html"/>
  
  
  <!--<xsl:template match="div">
    <array key="{head}" xmlns="http://www.w3.org/2005/xpath-functions">
      <xsl:apply-templates/>
    </array>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-p_index']">
    <map xmlns="http://www.w3.org/2005/xpath-functions">
      <string key="label">{. => tokenize(' ') => head()}</string>
        <!-\-<xsl:for-each select=". => tokenize('\s') => tail() => local:decompress-index()">
          <string>{. => normalize-space()}</string>
        </xsl:for-each>-\->
        <map key="loc">
          <xsl:for-each-group select="(. => tokenize('\s') => tail() => local:decompress-index())" group-by="tokenize(.,',') => head()">
            <array key="{current-grouping-key()}">
              <xsl:for-each select="current-group()">
                <string>{. => normalize-space()}</string>
              </xsl:for-each>
            </array>
          </xsl:for-each-group>
        </map>
<!-\-      <array key="loc-s0">
        <xsl:for-each select="(. => tokenize('\s') => tail() => local:decompress-index() => local:split-to-string())">
          <array>
            <xsl:for-each select="tokenize(.,'\s')">
              <string>{. => normalize-space()}</string>
            </xsl:for-each>
          </array>
        </xsl:for-each>
      </array>-\->
        <map key="loc-s">
          <xsl:for-each-group select="(. => tokenize('\s') => tail() => local:decompress-index() => local:split-to-string())" group-by="tokenize(.,'\s') => head()">
              <array key="{current-grouping-key()}">
                <xsl:for-each select="current-group() ! substring-after(.,current-grouping-key())">
                  <string>{. => normalize-space()}</string>
                </xsl:for-each>
              </array>
            </xsl:for-each-group>            
        </map>
      <string key="print">{. => tokenize(' ') => tail() => normalize-space()}</string>
    </map>
  </xsl:template>
  
  <xsl:function name="local:decompress-index" as="item()*">
    <xsl:param name="compressed"/>
    <xsl:for-each select="$compressed">
      <xsl:variable name="doc" select=". ! tokenize(.,',') => head()"/>
      <xsl:variable name="locs" select=". ! tokenize(.,',') => tail() => string-join(',')"/>
      <xsl:for-each select="$locs">
        <xsl:choose>
          
          <!-\- case: CPal21,Z.112.131.136.144.155.163.164.170.183.367; -\->
          <!-\- CPal35,Z.1f.3
            CPal35,Z.15f.
          -\->
          <xsl:when test="matches(.,'^Z')">
            <xsl:for-each select="(tokenize(.,'\.') => tail())[matches(.,'\w')] ! ($doc||',Z.'||.||' ') ! replace(.,';','')">{.}</xsl:for-each>
          </xsl:when>
          
          <!-\- case: CV7,8.11.12.27.41; -\->
          <xsl:when test="matches(.,'^[\.;\d]+$')">
            <xsl:for-each select="(tokenize(.,'\.')) ! ($doc||','||.||' ') ! replace(.,';','')">{.}</xsl:for-each>
          </xsl:when>
          
          <!-\- case: CV166,I,1.III,2.6.V,Praef.; -\->
          <xsl:otherwise>
            <xsl:variable name="locs-tmp" select="replace(.,'\.?([IVX]+)(,)','¦$1$2') ! replace(.,'\.;$','ø')"/>
              <xsl:for-each select="($locs-tmp => tokenize('¦'))[matches(.,'\S')]">
                <xsl:variable name="lib" select="substring-before(.,',')"/>
                <xsl:sequence select="tokenize(. => substring-after($lib||','),'\.') ! ($doc||','||$lib||'-'||.=>lower-case()||' ') ! replace(.,'ø','') ! replace(.,';','')"/>
              </xsl:for-each>
          </xsl:otherwise>
          
        </xsl:choose>
      </xsl:for-each>
    </xsl:for-each>
    
  </xsl:function>
  
  <xsl:function name="local:split-to-string" as="item()*">
    <xsl:param name="decompressed"/>
    <xsl:for-each select="($decompressed ! tokenize(.,'\s'))[matches(.,'\S')]">
      <xsl:choose>
        <xsl:when test="matches(.,',[IVX]')">{. => replace(',([IVX]+-)',',lib$1') => tokenize(',')}</xsl:when>
        <xsl:otherwise>{. => tokenize(',')}</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:function>-->
  
</xsl:stylesheet>
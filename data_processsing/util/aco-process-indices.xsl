<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:local="https://dsl.unibe.ch"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs math xd"
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
  
  <xsl:mode on-no-match="shallow-skip"/>
  
  <xsl:template match="/">
    
    <xsl:variable name="payload">
      <map xmlns="http://www.w3.org/2005/xpath-functions">
        <map key="registerData">
          <xsl:apply-templates select="//text/body/div/div"/>
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
  
  <xsl:template match="div">
    <array key="{head}" xmlns="http://www.w3.org/2005/xpath-functions">
      <xsl:apply-templates/>
    </array>
  </xsl:template>
  
  <xsl:template match="p[@rendition='#rp-p_index']">
    <map xmlns="http://www.w3.org/2005/xpath-functions">
      <string key="label">{. => tokenize(' ') => head()}</string>
        <!--<xsl:for-each select=". => tokenize('\s') => tail() => local:decompress-index()">
          <string>{. => normalize-space()}</string>
        </xsl:for-each>-->
        <map key="loc">
          <xsl:for-each-group select="(. => tokenize('\s') => tail() => local:decompress-index())" group-by="tokenize(.,',') => head()">
            <array key="{current-grouping-key()}">
              <xsl:for-each select="current-group()">
                <string>{. => normalize-space()}</string>
              </xsl:for-each>
            </array>
          </xsl:for-each-group>
        </map>
<!--      <array key="loc-s0">
        <xsl:for-each select="(. => tokenize('\s') => tail() => local:decompress-index() => local:split-to-string())">
          <array>
            <xsl:for-each select="tokenize(.,'\s')">
              <string>{. => normalize-space()}</string>
            </xsl:for-each>
          </array>
        </xsl:for-each>
      </array>-->
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
          
          <!-- case: CPal21,Z.112.131.136.144.155.163.164.170.183.367; -->
          <!-- CPal35,Z.1f.3
            CPal35,Z.15f.
          -->
          <xsl:when test="matches(.,'^Z')">
            <xsl:for-each select="(tokenize(.,'\.') => tail())[matches(.,'\w')] ! ($doc||',Z.'||.||' ') ! replace(.,';','')">{.}</xsl:for-each>
          </xsl:when>
          
          <!-- case: CV7,8.11.12.27.41; -->
          <xsl:when test="matches(.,'^[\.;\d]+$')">
            <xsl:for-each select="(tokenize(.,'\.')) ! ($doc||','||.||' ') ! replace(.,';','')">{.}</xsl:for-each>
          </xsl:when>
          
          <!-- case: CV166,I,1.III,2.6.V,Praef.; -->
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
  </xsl:function>
  
</xsl:stylesheet>
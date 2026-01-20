<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns="http://www.w3.org/2005/xpath-functions"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization"
  xmlns:dsl="https://dsl.unibe.ch"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:util="aco-utils.xsl"
  exclude-result-prefixes="xs xd"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  expand-text="true"
  xml:preserve-space="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Jun 13, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:output indent="true"/>
  
  <xsl:character-map name="unescape-solidus">
    <xsl:output-character character="/" string="/"/>
  </xsl:character-map>
  
  <xsl:mode name="metadata" on-no-match="shallow-copy"/>
  <xsl:mode name="metadata-note" on-no-match="shallow-copy"/>
  
  <xsl:param name="verbose" static="true" select="true()"/>
  <xsl:param name="path_api" select="'.'"/>
  <xsl:param name="task" select="'metaData'"/>
  
  <xsl:import href="aco-utils.xsl"/>
  
  <xsl:template match="/">
   <xsl:variable name="payload">
      <xsl:call-template name="build-json"/>
    </xsl:variable>
    <xsl:sequence select="$payload => xml-to-json(map { 'indent' : true() }) => replace('\sxmlns=\p{P}.*?([\s>])','$1') => normalize-space() => replace('\s–','&#160;–') => parse-json()"/>
    <xsl:message>Task `{$task}` done.</xsl:message>
  </xsl:template>
  
  <xsl:template name="build-json">
    <map>
      <map key="meta">
        <string key="task"></string>
        <string key="generated-by">{base-uri(document('')) => tokenize('/') => reverse() => head()}</string>
        <string key="generated-on">{current-dateTime()}</string>
        <string key="description"></string>
      </map>
      <array key="metaData">
        <xsl:apply-templates select="//tei:TEI[@ana='aco-doc']"/>
      </array>
    </map>
  </xsl:template>
  
  <xsl:template match="tei:TEI">
        <!-- 
          
          pattern:
        		{
			"slug": "CPal20",
			"schwartzSlug": "CPal20",
			"schwartzSlugNum": "20",
			"acoNumX": "1",
			"acoNumLabel": "Dok. 1",
			"type": "CPal",
			"title": "Nestorius’ erste Predigt gegen den θεοτόκος-Titel (sermo 9)",
			"unitSlugs": ["test"],
			"unitLabels": [],
			"unitLabelsInline": [""],
			"content": {
				"head": "",
				"inhalt": ""
			}
		},
        -->
    <map>
<!--      <string key="slug">{.//tei:text/tei:body/tei:div[1]/@n => substring-before('-acoTitle')}</string>-->
      <string key="slug">{(@xml:id => tokenize('_'))[3] => replace(',','-')}</string>
      <string key="schwartzSlug">{(@xml:id => tokenize('_'))[3]}</string>
      <string key="schwartzNum">{(@xml:id => tokenize('_'))[3] => replace('^[aA-zZ]+','')}</string>
      <string key="acoDocNum">{(@xml:id => tokenize('_'))[2] => number() => format-number('0')}</string>
      <string key="acoDocLabel">Dok. {(@xml:id => tokenize('_'))[2] => number() => format-number('0')}</string>
      <string key="type">{(@xml:id => tokenize('_'))[3] => replace('[0-9]+$','')}</string>
      <string key="title">
        <xsl:variable name="build-title">
          <xsl:apply-templates select=".//tei:head[matches(.,'Dok')]" mode="metadata"/>
        </xsl:variable>
        <xsl:text>{$build-title => tokenize(',\s') => tail() => string-join(', ') => normalize-space()}</xsl:text>
      </string>
      <string key="pageStart">{(.//tei:pb/@n) => head()}</string>
      <string key="pageEnd">{(.//tei:pb/@n) => reverse() =>  head()}</string>
      <map key="pageLimits">
        <xsl:for-each select=".//tei:text/tei:body/tei:div">
          <array key="{if (contains(@n,',')) then @n => tokenize(',') => tail() => string-join('-') => util:sanitizeForJS() else 'text'}">
            <string>{(.//text()[matches(.,'\S')][not(ancestor::metamark)])[1]/preceding::tei:pb[@n/data()][1]/@n}</string>
            <string>{if (.//tei:pb) then (.//tei:pb/@n) => reverse() => head() else preceding::tei:pb[@n][1]/@n}</string>
          </array>
        </xsl:for-each>
      </map>

      <array key="unitSlugs">
        <xsl:for-each select=".//tei:text/tei:body/tei:div/@n">
          <xsl:choose>
            <xsl:when test="contains(.,',')">
              <string>{. => tokenize(',') => tail() => string-join('-') => util:sanitizeForJS()}</string>
            </xsl:when>
            <xsl:when test="not(parent::tei:div//tei:p)">
              <string>{.}</string>
            </xsl:when>
            <xsl:otherwise>
              <string>text</string>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </array>
      <array key="unitLabelsLong">
        <!-- conditional logic needed? -->
        <xsl:for-each select=".//tei:text/tei:body/tei:div/@n">
          <xsl:choose>
            <xsl:when test="contains(.,',')">
              <string>{. => tokenize(',') => tail()}</string>
            </xsl:when>
            <!--<xsl:when test="matches(.,'\S')">
              <string>{.}</string>
            </xsl:when>-->
            <xsl:when test="not(parent::tei:div//tei:p)">
              <string>{.}</string>
            </xsl:when>
            <xsl:otherwise>
              <string>text</string>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </array>
      <array key="unitLabels">
        <xsl:for-each select=".//tei:text/tei:body/tei:div">
          <xsl:variable name="div" select="."/>
          <xsl:for-each select="(.//text()[matches(.,'\S')])[1]">
            <!-- if there are numbers in brackets such as "(1)" or "[2]" at the begin of the chapter take these -->
            <xsl:choose>
              <xsl:when test="matches(.,'^[\[\(]+\d+[\]\)]+')">
                <string>{. => replace('(^[\[\(]+\d+[\]\)]+).*','$1','s') => normalize-space()}</string>
              </xsl:when>
              <!-- the bracket expression might follow later (e.g. CV18) -->
              <xsl:when test="$div/tei:p/tei:lb/following-sibling::text()[1][matches(.,'^[\[\(]+\d+[\]\)]+')]">
                <xsl:for-each select="$div/tei:p/tei:lb/following-sibling::text()[1][matches(.,'^[\[\(]+\d+[\]\)]+')]">
                  <string>{. => replace('(^[\[\(]+\d+[\]\)]+).*','$1','s') => normalize-space()}</string>
                </xsl:for-each>
              </xsl:when>
              <!-- special case: CV22 -->
              <xsl:when test="matches(.,'^[\[\(]+\d+.+?[\]\)]+')">
                <string>{. => replace('(^[\[\(]+\d+.+?[\]\)]+).*','$1','s') => normalize-space()}</string>
              </xsl:when>
              <xsl:when test="$div//tei:p">
                <string>text</string>
              </xsl:when>
              <xsl:otherwise>
                <string>{$div/@n}</string>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:for-each>
      </array>
      <map key="content">
        <string key="head">
          <!-- fields Edition, Verzeichnisnummern, Verfasser, Datierung, Lat. Übersetzungen, Literatur -->
          <xsl:variable name="build-head">
            <xsl:for-each select=".//tei:text/tei:body/tei:list/tei:item[not(matches(tei:title,'^Inhalt:'))]">
              <![CDATA[<p><span data-type='head_key'>]]>{title/text()}<![CDATA[</span> ]]><!--{p/text()}-->
              <xsl:apply-templates select="p" mode="metadata"/>
              <![CDATA[</p>]]>
            </xsl:for-each>
          </xsl:variable>
          <xsl:text>{$build-head => normalize-space()}</xsl:text>
        </string>
        <string key="inhalt">
          <!-- fields: Inhalt -->
          <xsl:variable name="build-content">
            <xsl:for-each select=".//tei:text/tei:body/tei:list/tei:item[matches(tei:title,'^Inhalt:')]">
              <![CDATA[<p><span data-type='head_key'>]]>{title/text()}<![CDATA[</span> ]]><xsl:apply-templates select="p" mode="metadata"/><![CDATA[</p>]]>
            </xsl:for-each>
          </xsl:variable>
          <xsl:text>{$build-content => normalize-space()}</xsl:text>
        </string>
        <array key="footnotes_head">
          <xsl:variable name="build-notes">
            <xsl:for-each select=".//tei:text/tei:body/tei:list/tei:item[position() le 5]//tei:note">
              <map>
                <string key="note_id">{count(preceding-sibling::note)+1}</string>
                <xsl:choose>
                  <xsl:when test="contains(.,'…')">
                    <string key="text_start">{. => tokenize(' … ') => head()}</string>
                    <string key="text_end">{. => tokenize(' … ') => tail() => substring-before(']') => normalize-space()}</string>
                  </xsl:when>
                  <xsl:otherwise>
                    <string key="text_start">{. => substring-before(']')}</string>
                    <string key="text_end"></string>
                  </xsl:otherwise>
                </xsl:choose>
                
                <string key="note_content">
                  <xsl:apply-templates select="." mode="metadata-note"/>
                </string>
              </map>
            </xsl:for-each>
          </xsl:variable>
          <xsl:sequence select="$build-notes"/>
        </array>
        
      </map>
    </map>
    
    <!-- 
    obsolete:
    <string key="slug">{.//tei:text/tei:body/tei:div[1]/@n => substring-before('-acoTitle')}</string>
    -->
  </xsl:template>
  
  <xsl:template match="p" mode="metadata">
    <xsl:apply-templates mode="metadata"/>
  </xsl:template>
  
  <xsl:template match="p" mode="metadata-note">
    <xsl:apply-templates mode="metadata"/>
  </xsl:template>
  
  <xsl:template match="hi[@rendition='#i']" mode="metadata">
    <![CDATA[<em>]]><xsl:apply-templates mode="metadata"/><![CDATA[</em>]]>
  </xsl:template>
  
  <xsl:template match="hi[@rendition='#i']" mode="metadata-note">
    <![CDATA[<em>]]><xsl:apply-templates mode="metadata-note"/><![CDATA[</em>]]>
  </xsl:template>
  
  <xsl:template match="hi[@rendition='#greek']" mode="metadata"><![CDATA[<span data-lang="greek">]]><xsl:apply-templates mode="metadata"/><![CDATA[</span>]]></xsl:template>
  
  <xsl:template match="hi[@rendition='#greek']" mode="metadata-note">
    <![CDATA[<span data-lang="greek">]]><xsl:apply-templates mode="metadata-note"/><![CDATA[</span>]]>
  </xsl:template>
  
  <xsl:template match="note" mode="metadata"><![CDATA[<span data-note=']]>{count(preceding-sibling::note)+1}'><![CDATA[</span><sup>]]>{count(preceding-sibling::note)+1}<![CDATA[</sup>]]></xsl:template>
  
  <xsl:template match="note" mode="metadata-note">
    <xsl:apply-templates mode="metadata-note"/>
  </xsl:template>
  
  <xsl:template match="note/text()[1]" mode="metadata-note">
    <xsl:text>{. => replace('.*\]\s','')}</xsl:text>
  </xsl:template>
  
  <xsl:template match="ref[@target]" mode="metadata-note">
    <![CDATA[<span data-ref="]]>{@target}<![CDATA["/>]]><xsl:apply-templates mode="metadata-note"/><![CDATA[</span>]]>
  </xsl:template>
  
  <xsl:template match="ref[@xml:id]" mode="metadata-note">
    <![CDATA[<span data-ref-id="]]>{@xml:id}<![CDATA["/>]]><xsl:apply-templates mode="metadata-note"/><![CDATA[</span>]]>
  </xsl:template>
  
</xsl:transform>

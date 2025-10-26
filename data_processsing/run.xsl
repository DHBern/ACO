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
  expand-text="true" version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Jun 13, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p/>
    </xd:desc>
  </xd:doc>

  <xsl:character-map name="unescape-solidus">
    <xsl:output-character character="/" string="/"/>
    <xsl:output-character character='"' string="'"/>
  </xsl:character-map>
  
  <xsl:import href="util/aco-utils.xsl"/>
  
  <xsl:param name="verbose" static="true" select="true()"/>
  <!-- old-style-precede (default), old-style-follow, app-tags (not implemented) -->
  <xsl:param name="cte-apparatus-export-method" static="true" select="'old-style-precede'"/>

  <xsl:template name="xsl:initial-template">

    <xsl:variable name="basepath" select="base-uri() =>tokenize('/') => reverse() => tail() =>reverse() => string-join('/')"/>

    <xsl:variable name="tei-pre-processed" as="map(*)">
      <xsl:map>
        
        <xsl:for-each select="uri-collection('input-dev-new-export?select=*.xml')">
    
          <xsl:variable name="filename" as="xs:string" select="(. => tokenize('/'))[last()]"/>
    
          <!-- add a step to comment DTD declarations (using uparsed text)? or pre-process externally -->
    
          <xsl:map-entry key="$filename">
            <xsl:map>

              <!-- step 1 -->
              <!-- transform to TEI base format -->
              <xsl:variable name="step1" as="node()" select="dsl:step1(.)"/>
              <xsl:map-entry key="'step1'">
                <xsl:sequence select="$step1"/>
              </xsl:map-entry>

              <!-- step 2 -->
              <!-- move/reposition notes to comply with frontend requirements -->              
              <xsl:variable name="step2" as="node()" select="dsl:step2($step1)"/>
              <xsl:map-entry key="'step2'">
                <xsl:sequence select="$step2" use-when="$cte-apparatus-export-method='old-style-follow'"/>
                <!-- skipping repositioning due to new output structure -->
                <xsl:sequence select="$step1" use-when="$cte-apparatus-export-method='old-style-precede'"/>
              </xsl:map-entry>
              
            </xsl:map>  
          </xsl:map-entry>
          
        </xsl:for-each>
        
      </xsl:map>
    </xsl:variable>
    
    <xsl:variable name="meta-processed" as="map(*)">
      <xsl:map>
        
        <xsl:for-each select="uri-collection('input-dev/meta?select=*.xml')">
          
          <xsl:variable name="filename" as="xs:string" select="(. => tokenize('/'))[last()]"/>
          
          <!-- add a step to comment DTD declarations (using uparsed text)? or pre-process externally -->
          
          <xsl:map-entry key="$filename">
            <!-- TODO transform meta files to something useful (simplify as much as possible) -->
            <xsl:sequence select="dsl:transform-meta(.)"/>
          </xsl:map-entry>
        </xsl:for-each>
      </xsl:map>
    </xsl:variable>
    
        
        
    <!-- storing intermediary XML files to step folders -->  
    <!-- files -->
    <xsl:for-each select="map:keys($tei-pre-processed)">
      <xsl:variable name="filename" select="."/>
      <!-- steps -->
      <xsl:for-each select="map:keys($tei-pre-processed?(.))">
        <xsl:variable name="step" select="."/>
        <xsl:result-document href="{$basepath}/output/{$step}/{$filename}" indent="true">
          <xsl:sequence select="map:get($tei-pre-processed,$filename)?($step)"/>
        </xsl:result-document>
      </xsl:for-each>
    </xsl:for-each>
    
    
    <!-- creating output formats -->
    
    <xsl:variable name="tei-corpus" as="node()">
      <xsl:sequence select="transform(
        map {
        'stylesheet-location' : 'util/aco-create-tei-corpus.xsl',
        'source-node' : doc('util/aco-create-tei-corpus.xsl'),
        'static-params': map{ 
        QName('', 'files-map') : $tei-pre-processed,
        QName('', 'meta-map') : $meta-processed,
        QName('', 'use-step') : 'step2' }
        })?output
        "/>
    </xsl:variable>
    
    <xsl:result-document href="{$basepath}/output/aco-teicorpus.xml" method="xml" indent="true">
      <xsl:sequence select="$tei-corpus"/>  
      <xsl:message use-when="$verbose">…writing {$basepath}/output/aco-teicorpus.xml…</xsl:message>
    </xsl:result-document>
    
    <xsl:result-document href="{$basepath}/output/aco-metadata.json" method="json" indent="true" exclude-result-prefixes="#all" use-character-maps="unescape-solidus">
      <xsl:sequence select="transform(
        map {
        'stylesheet-location' : 'util/aco-dsl-tei_to_aco-metadata-json.xsl',
        'source-node' : $tei-corpus,
        'delivery-format' : 'raw'
        })?output
        "/>
      <xsl:message use-when="$verbose">…writing {$basepath}/output/aco-metadata.json…</xsl:message>
    </xsl:result-document>
    
    <xsl:result-document href="{$basepath}/output/aco-text.json" indent="true" method="json" exclude-result-prefixes="#all" use-character-maps="unescape-solidus">
      <xsl:sequence select="transform(
        map {
        'stylesheet-location' : 'util/aco-dsl-tei_to_aco-text-json.xsl',
        'source-node' : $tei-corpus,
        'delivery-format' : 'raw'
        })?output
        "/>
      <xsl:message use-when="$verbose">…writing {$basepath}/output/aco-text.json…</xsl:message>
    </xsl:result-document>
    
    <xsl:result-document href="{$basepath}/output/aco-notes.json" method="json" indent="true" exclude-result-prefixes="#all" use-character-maps="unescape-solidus">
      <xsl:sequence select="transform(
        map {
        'stylesheet-location' : 'util/aco-dsl-tei_to_aco-notes-json.xsl',
        'source-node' : $tei-corpus,
        'delivery-format' : 'raw'
        })?output
        "/>
      <xsl:message use-when="$verbose">…writing {$basepath}/output/aco-notes.json…</xsl:message>
    </xsl:result-document>
    
    <xsl:result-document href="{$basepath}/output/aco-register.json" method="json" indent="true" exclude-result-prefixes="#all" use-character-maps="unescape-solidus">
      <xsl:sequence select="transform(
        map {
        'stylesheet-location' : 'util/aco-process-indices.xsl',
        'source-node' : $meta-processed?*[matches(.,'Indices')],
        'delivery-format' : 'raw'
        })?output
        "/>
      <xsl:message use-when="$verbose">…writing {$basepath}/output/aco-register.json…</xsl:message>
    </xsl:result-document>
    
  </xsl:template>
  
  <!-- pre-processing steps -->
  
  <xsl:function name="dsl:step1">
    <xsl:param name="uri" as="xs:anyURI"/>
    <xsl:sequence select="transform(
      map {
      'stylesheet-location' : 'util/aco-cte-tei_to_tei.xsl',
      'source-node' : doc($uri)
      })?output
      "/>
  </xsl:function>
  
  <xsl:function name="dsl:step2">
    <xsl:param name="input" as="node()"/>
    <xsl:sequence select="transform(
      map {
      'stylesheet-location' : 'util/tei_to_tei-notes-repositioned.xsl',
      'source-node' : $input
      })?output
      "/>
  </xsl:function>
  
  <!-- creating intermediary meta files (introduction, indices, etc) -->
  
  <xsl:function name="dsl:transform-meta">
    <xsl:param name="uri" as="xs:anyURI"/>
    <xsl:sequence select="transform(
      map {
      'stylesheet-location' : 'util/aco-transform-meta.xsl',
      'source-node' : doc($uri)
      })?output
      "/>
  </xsl:function>

</xsl:transform>

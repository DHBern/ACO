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
  
  <xsl:param name="file-dir" static="true" select="'input-dev-new-export'"/>

  <!-- two partial files require pre-processing for later inclusion (left and right column of CV22,8 -->
  <xsl:variable name="inclusions-pre-processed" as="map(*)">
    <xsl:map>     
      <xsl:for-each select="uri-collection($file-dir||'/inclusions?select=*.xml')">
        <xsl:variable name="filename" as="xs:string" select="(. => tokenize('/'))[last()]"/>
        <!-- add a step to comment DTD declarations (using uparsed text)? or pre-process externally -->
        <xsl:map-entry key="$filename">
          <xsl:map>
            <!-- step 0 -->
            <!-- insert chapter div -->
            <xsl:variable name="step0" as="node()">
              <xsl:sequence select="transform(
                map {
                'stylesheet-location' : 'util/aco-preprocess-inclusions.xsl',
                'source-node' : doc(.)
                })?output
                "/>
            </xsl:variable>
            <xsl:map-entry key="'step0'">
              <xsl:sequence select="$step0"/>
            </xsl:map-entry>
            
            <!-- step 1 -->
            <!-- transform to TEI base format -->
            <xsl:variable name="step1" as="node()">
              <xsl:sequence select="transform(
                map {
                'stylesheet-location' : 'util/aco-cte-tei_to_tei.xsl',
                'source-node' : $step0
                })?output
                "/>
            </xsl:variable>
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
  
  <xsl:template name="xsl:initial-template">

    <xsl:variable name="basepath" select="base-uri() =>tokenize('/') => reverse() => tail() =>reverse() => string-join('/')"/>

    <xsl:variable name="tei-pre-processed" as="map(*)">
      <xsl:map>
        
        <xsl:for-each select="uri-collection($file-dir||'?select=*.xml')">
          
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
        
        <xsl:for-each select="uri-collection($file-dir||'/meta?select=*.xml')">
          
          <xsl:variable name="filename" as="xs:string" select="(. => tokenize('/'))[last()]"/>
          
          <!-- add a step to comment DTD declarations (using uparsed text)? or pre-process externally -->
          
          <xsl:map-entry key="$filename">
            <xsl:sequence select="dsl:transform-meta(.)"/>
          </xsl:map-entry>
        </xsl:for-each>
      </xsl:map>
    </xsl:variable>
    
    
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

    <!-- accumulating poimter targets to have an efficient way to determine links -->
    <xsl:variable name="accumulated-pointer-targets" as="map(xs:string, map(*))" select="
          fold-left(
          $tei-corpus//TEI[@ana='aco-doc']//*[local-name()=('anchor','ref','seg')][@xml:id],
          map{},
          function($acc, $r) {
            let $id := $r/@xml:id/data(),
                $doc := $r/ancestor::TEI[1]/@xml:id/data() => util:canonizeFilename(),
                $docId := $doc => substring-after('_'),
                $key := $doc||'#'||$id => replace('_anchor',''),
                (: if chapter = $docId take 'text' :)
                $chapter := ($r/ancestor::div[1]/@n/data() => substring-after($docId) => substring-after(',') => replace(',','-'),'text')[normalize-space()][1],
                $line := $r/preceding::lb[1]/@n/data()
            return
              if ($id = '') then $acc
              else
                let $occ := map{
                  'doc'     : $doc,
                  'id'      : $id,
                  'chapter' : if ($chapter = '') then () else $chapter,
                  'line'    : if ($line = '') then () else $line,
                  'target'  : '../'||$docId||'/'||($chapter[normalize-space()],'text')[1] => replace('\.','')||'?line='||$line,
                  'context' : $r => string() => normalize-space()
                  },
                $existing := $acc => map:get($key)
              return
                if (exists($existing)) then $acc       (: keep first occurrence :)
                else $acc => map:put($key, $occ)
                }
          )"/>
      

    
    <!-- debug -->
    <xsl:result-document href="{$basepath}/output/accumulated-pointer-targets.json" method="json" indent="true" exclude-result-prefixes="#all" use-character-maps="unescape-solidus">
      <xsl:sequence select="$accumulated-pointer-targets"/>
    </xsl:result-document>
        
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
        'delivery-format' : 'raw',
        'static-params': map{ 
        QName('', 'accumulated-pointer-targets') : $accumulated-pointer-targets
        }
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
    
    <xsl:result-document href="{$basepath}/output/aco-meta-docs.json" method="json" indent="true" exclude-result-prefixes="#all" use-character-maps="unescape-solidus">
      <xsl:sequence select="transform(
        map {
        'stylesheet-location' : 'util/aco-process-meta-docs.xsl',
        'source-node' : doc('util/aco-process-meta-docs.xsl'),
        'global-context-item' : $meta-processed,
        'static-params': map{ 
        QName('', 'accumulated-pointer-targets') : $accumulated-pointer-targets
        },
        'delivery-format' : 'raw'
        })?output
        "/>
      <xsl:message use-when="$verbose">…writing {$basepath}/output/aco-meta-docs.json…</xsl:message>
    </xsl:result-document>
    
  </xsl:template>
  
  <!-- pre-processing steps -->
  
  <xsl:function name="dsl:step1">
    <xsl:param name="uri" as="xs:anyURI"/>
    <xsl:sequence select="transform(
      map {
      'stylesheet-location' : 'util/aco-cte-tei_to_tei.xsl',
      'source-node' : doc($uri),
      'static-params': map{ 
      QName('', 'inclusions-map') : $inclusions-pre-processed
      }
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

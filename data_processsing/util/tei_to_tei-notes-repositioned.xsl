<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns="http://www.tei-c.org/ns/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization"
  xmlns:dsl="https://dsl.unibe.ch"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="output dsl map array tei xs xd"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  expand-text="true"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Oct 17, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> pd</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <!-- This transformation is only needed when exporting with the CTE export option
       "Old style - variants follow first word"
  -->
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="teiHeader">
    <xsl:copy-of select="."/>
  </xsl:template>

  <!-- repositioning logic: -->

  <!-- determine last whitespace-bounded string before note and place the note marker at this position -->
  <!-- general case -->
  <xsl:template match="text()[following-sibling::*[1]/self::note]">
    <xsl:call-template name="initiate-replacement">
      <xsl:with-param name="note" select="following-sibling::*[1][self::note]"/>
    </xsl:call-template>
  </xsl:template>
  <!-- note targeting last word in seg element -->
  <xsl:template match="seg/text()[last()][parent::seg[following-sibling::node()[1]/self::note]]">
    <xsl:call-template name="initiate-replacement">
      <xsl:with-param name="note" select="parent::seg/following-sibling::node()[1][self::note]"/>
    </xsl:call-template>
  </xsl:template>
  <!-- ad hoc fix: note targeting last word in seg element discounting some weird encodings 
        case:
            05_CV1
            <note place="foot" type="n1" targetEnd="#CV1_w2976">
              <mentioned>See­len­gebärerin]</mentioned> Der Ausdruck „Seelengebärerin“ (<hi rendition="#rf-griechisch">ψυχοτόκος</hi>) findet sich in der Literatur erstmalig im Rahmen der Streitigkeiten um den <hi rendition="#rf-griechisch">θεοτόκος</hi>-Begriff. Er kommt außer an dieser Stelle auch noch in einer Äußerung des Nestorius vor, welche Kyrill in <hi rendition="#rf-kursiv">Contra Nestorium</hi> anführt (vgl. <ref target="25_CV166_dg.xml#r-AWxucwVG 25_CV166_dg.xml#r-AWxucwVG-e"
                rend="line">CV166,I,4,62 – 70</ref>, ACO I,1,6 S. 23,31–36 = Loofs, Nestoriana S. 352,6–13 [Dok. 25]). Die Ausführungen des Nestorius stellen dabei möglicherweise eine Reakion auf das hier Geäußerte dar (vgl. Anm. zu der oben angeführten Stelle).</note> Denn sie gebar den beseelten 
              <lb n="23"/>Täufer und den Menschen als <hi rendition="#i">eins</hi> aus zweien, nämlich aus Seele und Leib.</p>
            <p>
  -->
  <xsl:template match="seg/text()[matches(.,'^Seelengebärerin$')][parent::seg[following-sibling::node()[1]/self::note]]">
    <xsl:call-template name="initiate-replacement">
      <xsl:with-param name="note" select="parent::seg/following-sibling::node()[1][self::note]"/>
    </xsl:call-template>
  </xsl:template>
  <!-- end of line with hyphenation and note at the end of hyphenated string 
        examples:
          erst in diesem Moment 〈fürch­
          <lb n="36"/>test<note place="foot" targetEnd="#w42704"/>〉 du
          
          „Des&#173;<milestone n="268" unit="chapterline" />
          <milestone n="36" unit="line" />wegen<note place="foot" type="n1" rend="visible bracket" targetEnd="#w38248"><p rendition="#rd-Text"><mentioned rend="visible bracket" n="252 – 253&#160;">Deswegen … hier] </mentioned>Jes 52,6.</p></note>
  -->
  <xsl:template match="text()[following-sibling::node()[1]/self::lb[@type='hyphen' and following-sibling::text()[1][matches(.,'^\S+$')][following-sibling::node()[1]/self::note]]]">
    <xsl:call-template name="initiate-replacement">
      <xsl:with-param name="note" select="following::*[self::note][1]"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="text()[matches(.,'^\S+$') and preceding-sibling::node()[1]/self::lb[@type='hyphen'] and following-sibling::node()[1]/self::note]"/>
  
  <!-- execution: -->
  
  <xsl:template name="initiate-replacement">
    <xsl:param name="note"/>
    <!--<xsl:analyze-string select="." regex="\w+,?­?\n?$">-->
    <xsl:analyze-string select="." regex="\w+\p{{P}}*\n?$">
      <xsl:matching-substring>
        <xsl:apply-templates select="$note" mode="replace-note"/>
        <xsl:text>{.}</xsl:text>
      </xsl:matching-substring>
      <xsl:non-matching-substring>{.}</xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
  <!-- inserting the note_start where it needs to be -->
  <xsl:template match="note" mode="replace-note">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <!-- ignore actual note marker -->
  <xsl:template match="note"/>
    
</xsl:transform>
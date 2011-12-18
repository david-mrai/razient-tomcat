<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
   by MCM Software Solution Inc. v1.0.0
   Copyright (c) 2002 MCM Software Solution Inc.
   All Rights Reserved.
   XslPager.xsl Ver. 1S
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="XSLPager">
    <xsl:param name="cant"/>
    <xsl:param name="count"/>
    <xsl:param name="page"/>
    <xsl:param name="xbrfname"/>
    <xsl:param name="xslname"/>
    <xsl:variable name="ant">
      <xsl:value-of select="$page - 1"/>
    </xsl:variable>
    <xsl:variable name="sig">
      <xsl:value-of select="$page + 1"/>
    </xsl:variable>
    <!-- Inicio Variables para calcular total de paginas -->
     <xsl:variable name="Pages" select="$count div $cant" />
     <xsl:variable name="DecPages" select="$Pages mod 1" />
     <xsl:variable name="IntPages" select="$Pages - $DecPages" />
     <xsl:variable name="NumPages">
       <xsl:choose>
         <xsl:when test="$DecPages = 0.0 ">
           <xsl:value-of select="$IntPages"/>
         </xsl:when>
         <xsl:otherwise>
           <xsl:value-of select="$IntPages + 1"/>
         </xsl:otherwise>
       </xsl:choose>
     </xsl:variable>
    <!-- Fin Variables para calcular total de paginas -->
    <xsl:choose>
      <xsl:when test="($page>1)*($cant!=1)">
        <a href="/{$NameApp}/LogicServerAppServlet?sourceXBRF={$xbrfname}&amp;Page={$ant}&amp;Function=XSLPager&amp;NameXSL={$xslname}">
          <xsl:value-of select="$ant"/>
        </a>
        <xsl:text> &lt;&lt; </xsl:text>
      </xsl:when>
      <xsl:when test="($page>1)*($cant=1)">
        <a href="/{$NameApp}/LogicServerAppServlet?sourceXBRF={$xbrfname}&amp;Page={$ant}&amp;Function=XSLPager&amp;NameXSL={$xslname}">
          <xsl:text> &lt;&lt; </xsl:text>
        </a>
        </xsl:when>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="$cant!=1">
        <xsl:text>Pag. </xsl:text><xsl:value-of select="$page"/>
      </xsl:when>
      <xsl:when test="$cant=$count">
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>.   .</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="($page&lt;$NumPages)*($cant!=1)">
        <xsl:text> &gt;&gt; </xsl:text>
        <a href="/{$NameApp}/LogicServerAppServlet?sourceXBRF={$xbrfname}&amp;Page={$sig}&amp;Function=XSLPager&amp;NameXSL={$xslname}">
          <xsl:value-of select="$sig"/>
        </a>
      </xsl:when>
      <xsl:when test="($page&lt;$NumPages)*($cant=1)">
        <a href="/{$NameApp}/LogicServerAppServlet?sourceXBRF={$xbrfname}&amp;Page={$sig}&amp;Function=XSLPager&amp;NameXSL={$xslname}">
          <xsl:text> &gt;&gt; </xsl:text>
        </a>
      </xsl:when>
    </xsl:choose>
    <br/>
    <br/>
    <xsl:choose>
      <xsl:when test="$count=0">
        [ 0 / 0 ]. No hay datos en esta consulta.
      </xsl:when>
      <xsl:when test="$count=1">
      </xsl:when>
      <xsl:when test="$count=$cant">
      </xsl:when>
      <xsl:when test="$cant=1">
        [ <xsl:value-of select="$page"/> / <xsl:value-of select="$count"/> ]
      </xsl:when>
      <xsl:when test="$page&lt;$NumPages">
        [ <xsl:value-of select="($page*($cant)-($cant)) + 1"/> - <xsl:value-of select="$page*($cant)"/> ] / <xsl:value-of select="$count"/>
      </xsl:when>
      <xsl:otherwise>
        [ <xsl:value-of select="($page*($cant)-($cant)) + 1"/> - <xsl:value-of select="$count"/> ] / <xsl:value-of select="$count"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
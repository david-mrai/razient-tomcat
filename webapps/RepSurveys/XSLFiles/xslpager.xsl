<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
   by MCM Software Solution Inc. v1.0.0
   Copyright (c) 2002 MCM Software Solution Inc.
   All Rights Reserved.
   XslPager.xsl Ver. 4E
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
    <!-- Begin Variables to calculate total pages -->
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
    <!-- End Variables to calculate total pages -->
    <xsl:choose>
      <xsl:when test="$cant!=1">
        <xsl:text>Page </xsl:text><xsl:value-of select="$page"/><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;of&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:value-of select="$NumPages"/>
      </xsl:when>
    </xsl:choose>
    <br/>
    <xsl:choose>
      <xsl:when test="$count=0">
        [ 0 / 0 ]. No Rows Found.
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
    <br/>
    <br/>
    <xsl:choose>
      <xsl:when test="$NumPages&gt;1">
        <center>Page(s)</center>
        <!-- BEGIN PAGE -->
         <xsl:if test="($page = 1)">
           Begin<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
         </xsl:if>
         <xsl:if test="($page != 1)">
           <a href="/{$NameApp}/LogicServerAppServlet?sourceXBRF={$xbrfname}&amp;Page=1&amp;Function=XSLPager&amp;NameXSL={$xslname}">
             Begin
           </a><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
         </xsl:if>
        <xsl:call-template name="allPages">
          <xsl:with-param name="cant">
            <xsl:value-of select="$cant"/>
          </xsl:with-param>
          <xsl:with-param name="count">
            <xsl:value-of select="$count"/>
          </xsl:with-param>
          <xsl:with-param name="page">
            <xsl:value-of select="$page"/>
          </xsl:with-param>
          <xsl:with-param name="xbrfname">
            <xsl:value-of select="$xbrfname"/>
          </xsl:with-param>
          <xsl:with-param name="xslname">
            <xsl:value-of select="$xslname"/>
          </xsl:with-param>
          <xsl:with-param name="actual"><xsl:value-of select="$page - 5"/></xsl:with-param>
          <xsl:with-param name="numPages">
            <xsl:value-of select="$NumPages"/>
          </xsl:with-param>
        </xsl:call-template>
        <!-- END PAGE-->
         <xsl:if test="($page = $NumPages)">
           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
           End
         </xsl:if>
         <xsl:if test="($page != $NumPages)">
           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
           <a href="/{$NameApp}/LogicServerAppServlet?sourceXBRF={$xbrfname}&amp;Page={$NumPages}&amp;Function=XSLPager&amp;NameXSL={$xslname}">
             End
           </a>
         </xsl:if>
      </xsl:when>
    </xsl:choose>	
  </xsl:template>
  <xsl:template name="allPages">
    <xsl:param name="cant"/>
    <xsl:param name="count"/>
    <xsl:param name="page"/>
    <xsl:param name="xbrfname"/>
    <xsl:param name="xslname"/>
    <xsl:param name="actual"/>
    <xsl:param name="numPages"/>
    <xsl:if test="($actual&lt;=$page + 5)and($actual &lt;= $numPages)">
      <xsl:if test="($actual &gt; 0)and($actual != $page)">
        <a href="/{$NameApp}/LogicServerAppServlet?sourceXBRF={$xbrfname}&amp;Page={$actual}&amp;Function=XSLPager&amp;NameXSL={$xslname}">
          <xsl:value-of select="$actual"/>
        </a><xsl:text>	</xsl:text>
      </xsl:if>
      <xsl:if test="($actual = $page)">
        <xsl:value-of select="$actual"/><xsl:text>	</xsl:text>
      </xsl:if>
      <xsl:call-template name="allPages">
        <xsl:with-param name="cant">
          <xsl:value-of select="$cant"/>
        </xsl:with-param>
        <xsl:with-param name="count">
          <xsl:value-of select="$count"/>
        </xsl:with-param>
        <xsl:with-param name="page">
          <xsl:value-of select="$page"/>
        </xsl:with-param>
        <xsl:with-param name="xbrfname">
          <xsl:value-of select="$xbrfname"/>
        </xsl:with-param>
        <xsl:with-param name="xslname">
          <xsl:value-of select="$xslname"/>
        </xsl:with-param>
        <xsl:with-param name="actual">
          <xsl:value-of select="$actual + 1"/>
        </xsl:with-param>
        <xsl:with-param name="numPages">
          <xsl:value-of select="$numPages"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
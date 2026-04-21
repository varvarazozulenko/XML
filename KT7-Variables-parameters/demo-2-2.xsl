<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:variable name="header">Книги по XML</xsl:variable>
  <xsl:variable name="xmlBooks" select="pricelist/book[contains(title, 'XML')]"/>
  
  <xsl:template match="/">
    <html>
      <title><xsl:value-of select="$header"/></title>
      <h1><xsl:value-of select="$header"/></h1>
      <xsl:call-template name="textBlock">
        <xsl:with-param name="title" select="'Всего'"/>
        <xsl:with-param name="text" select="concat(count($xmlBooks/price), ' книг.')"/>
        <xsl:with-param name="bg" select="'#ffd'"/>
      </xsl:call-template>
      <xsl:call-template name="textBlock">
        <xsl:with-param name="title" select="'Средняя цена'"/>
        <xsl:with-param name="text" select="concat(count($xmlBooks/price) div count($xmlBooks), ' руб.')"/>
        <xsl:with-param name="bg" select="'#f99'"/>
      </xsl:call-template>
      <xsl:apply-templates select="$xmlBooks"/>
    </html>
  </xsl:template>
  
  <xsl:template match="book">
    <xsl:call-template name="textBlock">
      <xsl:with-param name="title" select="title"/>
      <xsl:with-param name="text" select="concat(author, ' ', price, ' руб.')"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="textBlock">
    <xsl:param name="title" />
    <xsl:param name="text" />
    <xsl:param name="bg" select="'#fff'"/>
    <div style="border-bottom:1px dotted black;background:{$bg}">
      <h4><xsl:value-of select="$title"/></h4>
      <p><xsl:value-of select="$text"/></p>
    </div>
  </xsl:template>

</xsl:stylesheet>

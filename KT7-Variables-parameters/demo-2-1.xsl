<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:variable name="header">Книги по XML</xsl:variable>
  <xsl:variable name="xmlBooks" select="pricelist/book[contains(title, 'XML')]"/>
  <xsl:variable name="USD" select="73.45"/>
  
  <xsl:template match="/">
    <html>
      <title><xsl:value-of select="$header"/></title>
      <h1><xsl:value-of select="$header"/></h1>
      <table border="1">
        <xsl:call-template name="tableHeader"/>
        <xsl:for-each select="$xmlBooks">
          <tr>  
            <td><xsl:value-of select="./title"/></td>
            <td><xsl:value-of select="./author"/></td>
            <td>
              <xsl:call-template name="price">
                <xsl:with-param name="value" select="./price"/>
              </xsl:call-template>
              <xsl:text> (</xsl:text>
              <xsl:call-template name="price">
                <xsl:with-param name="value" select="./price div $USD"/>
                <xsl:with-param name="symbol" select="'$'"/>
              </xsl:call-template>
              <xsl:text>)</xsl:text>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </html>
  </xsl:template>

  <xsl:template name="price">
    <xsl:param name="value"/>
    <xsl:param name="symbol">₽</xsl:param>
    <span>
      <xsl:value-of select="format-number($value, '#.00')"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$symbol"/>
    </span>
  </xsl:template>

  <xsl:template name="tableHeader">
    <tr>
      <td>Название</td>
      <td>Автор</td>
      <td>Цена</td>
    </tr>
  </xsl:template>

</xsl:stylesheet>

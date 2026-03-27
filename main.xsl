<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" />

<xsl:template match="/items">
    <goods>
        <xsl:comment>Всего элементов: <xsl:value-of select="count(element)"/></xsl:comment>
        <xsl:apply-templates select="element" />
    </goods>
</xsl:template>

<xsl:template match="element">
    <xsl:element name="{@name}">
        <xsl:value-of select="@value"/>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>
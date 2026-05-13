<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:param name="sum" select="0"/>
        
        <xsl:call-template name="sum-sequence">
            <xsl:with-param name="current" select="/sum-of-sequence/from"/>
            <xsl:with-param name="to" select="/sum-of-sequence/to"/>
            <xsl:with-param name="sum" select="0"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sum-sequence">
        <xsl:param name="current"/>
        <xsl:param name="to"/>
        <xsl:param name="sum"/>

        <xsl:choose>
            <xsl:when test="$current > $to">
                <xsl:value-of select="$sum"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="sum-sequence">
                    <xsl:with-param name="current" select="$current + 1"/>
                    <xsl:with-param name="to" select="$to"/>
                    <xsl:with-param name="sum" select="$sum + $current"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <body>
                <xsl:call-template name="build-thread">
                    <xsl:with-param name="parent" select="0"/>
                </xsl:call-template>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="build-thread">
        <xsl:param name="parent"/>
        
        <xsl:for-each select="/items/item[@parentid = $parent]">
            <li>
                <xsl:value-of select="@author"/>: <xsl:value-of select="."/>
                
                <xsl:if test="/items/item[@parentid = current()/@id]">
                    <ul>
                        <xsl:call-template name="build-thread">
                            <xsl:with-param name="parent" select="@id"/>
                        </xsl:call-template>
                    </ul>
                </xsl:if>
            </li>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

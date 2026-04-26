<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="city-org" match="item" use="concat(@city, '|', @org)" />
    
    <xsl:key name="city" match="item" use="@city" />

    <xsl:template match="/orgs">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Города</title>
            </head>
            <body>
                <h1>Города и компании</h1>
                <ul>
                    <xsl:for-each select="item[generate-id() = generate-id(key('city', @city)[1])]">
                        <xsl:sort select="@city" />
                        
                        <xsl:variable name="city-name" select="@city"/>
                        <xsl:variable name="city-items" select="key('city', $city-name)"/>
                        
                        <li>
                            <h3><xsl:value-of select="$city-name"/></h3>
                            <p>Всего товаров: <xsl:value-of select="count($city-items)"/></p>
                            
                            <xsl:for-each select="$city-items[generate-id() = generate-id(key('city-org', concat(@city, '|', @org))[1])]"> <!-- группируем по компаниям внутри одного города  -->
                                <xsl:sort select="@org" />
                                
                                <xsl:variable name="org-name" select="@org"/>
                                <xsl:variable name="org-items" select="key('city-org', concat($city-name, '|', $org-name))"/> <!--все товары компании в этом городе -->
                                
                                <ul>
                                    <li>
                                        <h4><xsl:value-of select="$org-name"/></h4>
                                        <p>Всего товаров: <xsl:value-of select="count($org-items)"/></p>
                                        <ul>
                                            <xsl:for-each select="$org-items">
                                                <li><xsl:value-of select="@title"/></li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                </ul>
                            </xsl:for-each>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table {
                        border: 1px solid black;
                        border-collapse: collapse;
                        width: 500px;
                        font-family: Arial, sans-serif;
                    }
                    th, td {
                        border: 1px solid gray;
                        padding: 5px;
                        text-align: left;
                    }
                    .header-main {
                        text-align: center;
                        font-weight: bold;
                        font-size: 1.2em;
                    }

                    .row1 { background-color: #ffffff; }
                    .row2 { background-color: #c0c0c0; }
                </style>
            </head>
            <body>

                <table>
                    <tr>
                        <th colspan="2" class="header-main">
                            Всего элементов: <xsl:value-of select="count(items/element)"/>
                        </th>
                    </tr>
                    <tr>
                        <th style="text-align:center;">Тип</th>
                        <th style="text-align:center;">Наименование</th>
                    </tr>

                    <xsl:for-each select="items/element">

                        <xsl:sort select="@name" data-type="text" order="descending"/>

                        <tr>
                            <xsl:attribute name="class">
                                <xsl:choose>
                                    <xsl:when test="position() mod 2 = 0">row1</xsl:when>
                                    <xsl:otherwise>row2</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>

                            <td>
                                <xsl:value-of select="@name"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="@value"/>
                                <xsl:if test="@name='Принтер'">
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

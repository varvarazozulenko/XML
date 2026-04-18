<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="courses-teach" match="course" use="teachers/teacher" />
    <xsl:key name="courses-keyword" match="course" use="keywords/keyword" />

    <xsl:template match="/">
        <html>
            <body>
                <h1>Наши курсы</h1>

                <h3>Курсы, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('courses-teach','Борисов И.О.')">
                        <li>
                            <xsl:value-of select="title"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, которые используют XML</h3>
                <ul>
                    <xsl:for-each select="key('courses-keyword','XML')">
                        <li>
                            <xsl:value-of select="title"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы по изучению XSLT, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('courses-teach','Борисов И.О.')[keywords/keyword = 'XSLT']">
                        <li>
                            <xsl:value-of select="title"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
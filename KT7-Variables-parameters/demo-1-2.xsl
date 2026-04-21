<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output 
		method="html" 
		doctype-public="-//W3C//DTD HTML 4.01//EN" 
		doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
		indent="yes"/>

  <xsl:variable name="header">Книги по XML</xsl:variable>
  <xsl:variable name="xmlBooks" select="pricelist/book[contains(title, 'XML')]"/>

	<!-- Шаблон корневого элемента -->
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="$header"/></title>
			</head>
			<body>
				<h1><xsl:value-of select="$header"/></h1>
				<p>
					<xsl:text>Найдено </xsl:text>
					<xsl:value-of select="count($xmlBooks)" />
					<xsl:text> книг</xsl:text>
					<br />
					<xsl:text>Средняя цена </xsl:text>
					<xsl:value-of select="
						sum($xmlBooks/price) 
						div 
						count($xmlBooks)" />
					<xsl:text> руб.</xsl:text>
				</p>
				<xsl:apply-templates select="$xmlBooks" />
			</body>
		</html>
	</xsl:template>
	
	<!-- Вывод одной книги -->
	<xsl:template match="book">
		<div>
			<h3>
				<xsl:value-of select="title" />
			</h3>
			<strong>
				<xsl:value-of select="author" />
			</strong>
			<em>
				<xsl:value-of select="price" />
			</em>
		</div>
	</xsl:template>
	
	
</xsl:stylesheet>
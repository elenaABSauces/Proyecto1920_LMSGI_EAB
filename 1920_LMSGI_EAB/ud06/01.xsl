
<!--
    Document   : 01.xsl
    Created on : 17 de abril de 2020
    Author     : Elena de Antón
    Description:
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    
    <xsl:template match="edificio">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01 XSLT Elena de Anton Barrio</title>
            </head>
            <body>
					<xsl:comment>Titulo</xsl:comment>
                <header>
                    <h1>Información de las viviendas</h1>
                </header>
                
                <xsl:apply-templates select="vivienda"/>
                <p>Número de viviendas:<xsl:value-of select="count(vivienda)"/></p>
                <p>Total de vecinos:<xsl:value-of select="count(//nombre)"/></p>
            </body>
        </html>
    </xsl:template>
                       
        <xsl:template match="vivienda">
            <p>Piso:<xsl:value-of select="piso"/> Puerta:<xsl:value-of select="puerta"/></p>
            <xsl:apply-templates select="vecinos"/>
        </xsl:template>
        
        <xsl:template match="vecinos">
            <ol>
                <xsl:apply-templates select="nombre"/>
            </ol>
        </xsl:template>
        
        <xsl:template match="nombre">
            <li><xsl:value-of select="./text()"/></li>
        </xsl:template>
        
</xsl:stylesheet>

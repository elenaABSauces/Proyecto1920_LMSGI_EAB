<?xml version="1.0" encoding="utf-8"?>
<!--
    Document   : 03.xsl
    Created on : 28 de abril de 2020
    Author     : Elena de AntÃ³n
    Description:
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>
        </xsl:text>
        <xsl:apply-templates select="comment()"/>
        <xsl:text>
        </xsl:text>
        <html>
            <head lang="es">
                <title>XSLT 03 Elena de Anton</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Elena de Anton"/>
                <meta name="application-name" content="AppWeb de LMSGI"/>
                <meta name="description" content="Informacion peliculas"/>
                <meta name="keywords" content="peliculas, puntos, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
                <link href="css.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="favicon.ico" type="image/x-icon"/>
            </head>

            <body>
                <section>
                    <header>
                        <h1>InformaciÃ³n de pelÃ­culas</h1>
                    </header>
                    <xsl:apply-templates select="peliculas"/>
                </section>

                <footer>
                    <p>Numero total de peliculas: <xsl:value-of select="count(peliculas/pelicula)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="peliculas">
        <xsl:for-each select="pelicula">
            <xsl:sort select="./publico" data-type="text" order="ascending"/>
            <xsl:sort select="./valracion/@puntos" data-type="nombre" order="descending"/>
            <xsl:sort select="./nombre" data-type="text" order="descending"/>
            
            <article>
                <header>
                    <h3>
                        <xsl:value-of select="nombre"/>
                    </h3>
                </header>
                <table>
                    <tr>
                        <td>
                            <xsl:choose>
                                <xsl:when test="valoracion[@puntos &lt; 5]">
                                    Puntuacion: <span>***</span>
                                </xsl:when>
                                <xsl:when test="valoracion[@puntos &gt;= 5 and @puntos &lt; 7]">
                                    Puntuacion: <span>****</span>
                                </xsl:when>
                                <xsl:otherwise>
                                    Puntuacion: <span>*****</span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>Dirigido a: <xsl:value-of select="publico"/></td>
                    </tr>
                </table>
            </article>
        </xsl:for-each>
    </xsl:template>
        <xsl:template match="comment()">
        <xsl:comment><xsl:value-of select="."/></xsl:comment>
    </xsl:template>
</xsl:stylesheet>

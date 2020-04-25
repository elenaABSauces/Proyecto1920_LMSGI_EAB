<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl.xsl
    Created on : 21 de abril de 2020, 10:53
    Author     : Elena de Anton
    Description: "Listado Tickets"
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
            <head>
                <title>XSL 02 - Elena de Anton</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Elena de Anton"/>
                <meta name="application-name" content="AppWeb de LMSGI"/>
                <meta name="description" content="Información de tickets"/>
                <meta name="keywords" content="tickets, total, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
                <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="favicon.ico" type="image/x-icon"/>
            </head>
            <body>
                <header>
                    <h1>Informacion de tickets</h1>
                </header>
                
                <main>
                    <header>
                        <h2>Listado de Tickets</h2>
                    </header>
                        <xsl:apply-templates select="listatickets"/>
                </main>
            </body>
            <footer>
                <p>NÚMERO DE TICKETS: <xsl:value-of select="count(listatickets/ticket)"/></p>
                <p>TOTAL DE TICKETS: <xsl:value-of select="sum(listatickets/ticket/total)"/></p>
            </footer>
        </html>

    </xsl:template>
    <xsl:template match="listatickets">
        
        <xsl:for-each select="ticket">
            <h3>Tickets: <xsl:value-of select="numero"/></h3>
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="producto">
                        <tr>
                            <td>
                                <xsl:value-of select="nombre"/>
                            </td>
                            <td>
                                <xsl:value-of select="precio"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <th>Total</th>
                        <th><xsl:value-of select="sum(producto/precio)"/></th>
                    </tr>
                </tbody>
                <caption>
                    Fecha del ticket <xsl:value-of select="fecha"/>
                </caption>
            </table>
        </xsl:for-each>
 </xsl:template>
 <xsl:template match="comment()">
    <xsl:comment><xsl:value-of select="."/></xsl:comment>
</xsl:template>
</xsl:stylesheet>

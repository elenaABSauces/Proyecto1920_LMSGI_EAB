<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 07.xsl
    Created on : 07 de mayo de 2020
    Author     : Elena de Anton
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="plantilla.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        
        <xsl:call-template name="doctype"/>
        <xsl:apply-templates select="comment()"/>
         
        <html lang="es">
            <head>
                <title>ELENAAB: SERVIDOR WEB UBUNTU</title>
                <xsl:call-template name="miHead"/>
                <meta name="application-name" content="AppWeb de LMSGI"/>
                <meta name="description" content="Manual de Instalacion y configuracion"/>
                <meta name="keywords" content="manual,instalacion, xslt, xml"/>
            </head>
            <body>
                <header>
                    <h1><xsl:apply-templates select="manual/titulo"/></h1>
                </header>
                
                <main>
                    <header>
                         <h2><xsl:apply-templates select="manual/subtitulo"/></h2>
                    </header>
                    <xsl:apply-templates select="manual"/>
                </main>
                
                <footer>
                    
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="manual">
        <article>
            <p><span class="name">DATE CREATE/UPDATE: </span><xsl:value-of select="fechaCreacion"/></p>
            <p><span class="name">SISTEMA OPERATIVO: </span><xsl:value-of select="sistema"/></p>
            <p><span class="name">ARQUITECTURA: </span><xsl:value-of select="sistema/@tipo"/></p>
            <p><span class="name">DOCUMENTACION: </span>
                    <ul>
                            <xsl:for-each select="url">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                    </ul>
                    
            </p>
           
            <div class="pasos">
                <h3>Pasos a seguir</h3>
                    
                        <xsl:for-each select="paso">
                            <div class="paso">
                                <p>
                                    <span class="id">
                                    <xsl:value-of select="@id"/>
                                    </span>
                                    <xsl:text></xsl:text>
                                    Paso
                                    <xsl:value-of select="position()"/>
                                </p>
                                <p class="comando">
                                    <xsl:value-of select="comando"/>
                                </p>
                                <p class="descripcion">
                                    <xsl:value-of select="descripcion"/>
                                </p>
                            </div>
                        </xsl:for-each>
                    
            </div>
        </article>
 </xsl:template>
 <xsl:template match="comment()">
    <xsl:comment><xsl:value-of select="."/></xsl:comment>
</xsl:template>
</xsl:stylesheet>
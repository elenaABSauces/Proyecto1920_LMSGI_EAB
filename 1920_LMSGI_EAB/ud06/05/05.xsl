<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 15 de mayo de 2020
    Author     : Elena de Anton
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:import href="../plantilla.xsl"/>
   <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        
        <xsl:call-template name="doctype"/>
        <xsl:apply-templates select="comment()"/>
        
        <html lang="es">
            <head>
                <title>XSLT 05 Elena de Anton</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>                
                <meta name="author" content="Elena de Anton"/>
                <meta name="application-name" content="Taller de Coches"/>
                <meta name="description" content="Reparaciones de coches"/>
                <meta name="keywords" content="taller, coche, reparacion"/>
                <xsl:call-template name="miHead"/>
            </head>
            <body>
                <header>
                    <h1>XSLT 05 Informacion de garajes</h1>
                </header>
                <main>
                     <xsl:apply-templates select="//coches/coche"/>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="coche">
        <xsl:if test="count(//reparacion[matricula=current()/matricula])>0">  
            <article>
                    <xsl:element name="table" use-attribute-sets="bordesSencillos">
                        <div>
                            <tr>
                                <xsl:element name="td" use-attribute-sets="bordesSencillos">          
                                    <p>
                                        <xsl:value-of select="concat(name(matricula),': ',./matricula)"/>
                                    </p>
                                    <xsl:element name="img" use-atribute-sets="setImagen">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="concat('images/',marca,'.jpg')"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="concat('imagen',marca)"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </tr>
                        </div>
                        
                        <div> 
                            <tr>
                                <xsl:element name="td" use-attribute-sets="bordesSencillos">
                                    <p>
                                        <xsl:apply-templates select="//reparaciones/reparacion[matricula=current()/matricula]"/>
                                    </p>
                                        
                                    <p>
                                        <xsl:value-of select="concat('Reparaciones: ',count(//reparacion[matricula=current()/matricula]))"/>
                                    </p>
                                    <p>
                                        <xsl:value-of select="concat('Total horas: ',sum(//reparacion[matricula=current()/matricula]/horas))"/>
                                    </p>
                                    <p>
                                        <xsl:value-of select="concat('Total a pagar: ',sum(//reparacion[matricula=current()/matricula]/horas)*12)"/>
                                    </p>
                                </xsl:element>
                            </tr>
                        </div>
                    </xsl:element>
                </article>
            </xsl:if>
        </xsl:template>

    <xsl:template match="reparacion[matricula=current()/matricula]">
        
        <span><xsl:value-of select="name(//reparacion)"/></span>
       
        <li>
            <xsl:value-of select="name(@codigo)"/>:<xsl:value-of select="@codigo"/>
        </li>
        <li>
            <xsl:value-of select="name(descripcion)"/>:<xsl:value-of select="descripcion"/>
        </li>
        <li>
            <xsl:value-of select="concat('Fechas:(','IN: ',./fecha_entrada,' OUT: ',./fecha_salida,')')"/>
        </li>
        <li>
            <xsl:value-of select="concat(name(./horas),': ',./horas)"/>
        </li>
    </xsl:template>

    <xsl:attribute-set name="setImagen"> 
        <xsl:attribute name="width">120px</xsl:attribute> 
        <xsl:attribute name="height">120px</xsl:attribute>  
    </xsl:attribute-set> 

  <xsl:attribute-set name="bordesSencillos">
        <xsl:attribute name="style">border:1px solid black</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:template match="comment()">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
    </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 04 de mayo de 2020
    Author     : Elena de Anton
    Description:
        Purpose of transformation follows.
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
        <html lang="es">
            <head>
                <title>XSLT 04 Elena de Anton</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Elena de Anton"/>
                <meta name="application-name" content="AppWeb de LMSGI"/>
                <meta name="description" content="Informacion de actividad en un gimnasio"/>
                <meta name="keywords" content="actividad, gimnasio, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
                <link href="css.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="favicon.ico" type="image/x-icon"/>
            </head>
            <body>
                <xsl:apply-templates select="actividades"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="actividades">
        
        <h1>Practica XPath 04 - 01</h1>
        <div>
            <h2>1.TODOS LOS ELEMENTOS DE LAS ACTIVIDADES INFANTILES.</h2>
            <p>Opcion A --------- //actividad[@nivel="infantil"]/*-------</p>
            <xsl:for-each select="actividad[@nivel='infantil']">
                <div>
                    <hr/>
                    <p><xsl:value-of select="concat(name(./codigo),': ',./codigo)"/></p>
                    <p><xsl:value-of select="concat(name(./titulo),': ',./titulo)"/></p>
                    <p><xsl:value-of select="concat(name(./fecha_inicio),': ',./fecha_inicio)"/></p>
                    <p><xsl:value-of select="concat(name(./sesiones),': ',./sesiones/minutos_sesion,' ',./sesiones/sesiones_semana)"/></p>
                </div>
            </xsl:for-each>
        </div>
        
        <h1>Practica XPath 04 - 02</h1>
        <div>
            <h2>EL NOMBRE DE LAS ACTIVIDADES PARA ADULTOS.</h2>
            <p>Opcion A --------- //actividad[@nivel="adultos"]/titulo-------</p>
            <xsl:for-each select="actividad[@nivel='adultos']/titulo">
                <div>
                    <p><xsl:value-of select="."/></p>
                </div>
            </xsl:for-each>
        </div>
        
        <h1>Practica XPath 04 - 03. El nombre de las actividades de adultos.</h1>
        <div>
            <h2>OPCION A //actividad[sesiones/sesiones_semana='2']/titulo</h2>
            <xsl:for-each select="actividad[sesiones/sesiones_semana='2']/titulo">
                <div>
                    <p><xsl:value-of select="."/></p>
                </div>
            </xsl:for-each>
        </div>
        <div>
            <h2>OPCION B //sesiones[sesiones_semana='2']/../titulo</h2>
            <xsl:for-each select="actividad/sesiones[sesiones_semana='2']/../titulo">
                <div>
                    <p><xsl:value-of select="."/></p>
                </div>
            </xsl:for-each>
        </div>
        <div>
            <h2>OPCION C //sesiones[sesiones_semana='2']/parent::node()/titulo</h2>
            <xsl:for-each select="actividad/sesiones[sesiones_semana='2']/parent::node()/titulo">
                <div>
                    <p><xsl:value-of select="."/></p>
                </div>
            </xsl:for-each>
        </div>
        
        <h1>Practica XPath 04 - 04. Cuenta el numero de actividades.</h1>
        <div>
            <h2>OPCION A count(//actividad)</h2>
            <xsl:value-of select="concat('Numero de actividades: ',count(actividad))"/>
        </div>
        
        <h1>Practica XPath 04 - 05. Cuenta el numero de actividades infantiles.</h1>
        <div>
            <h2>OPCION A count(//actividad[@nivel='infantil'])</h2>
            <xsl:value-of select="concat('Numero de actividades infantiles: ',count(//actividad[@nivel='infantil']))"/>
        </div>
        
        <h1>Practica XPath 04 - 06<br/>Convertir el numero de actividades a string.</h1>
        <div>
            <h2>OPCION A string(count(//actividad))</h2>
            <xsl:value-of select="concat('Numero de actividades infantiles: ',string(count(//actividad)))"/>
        </div>
        
        <h1>Practica XPath 04 - 07. Suma de las sesiones semanales de las actividades para adultos.</h1>
        <div>
            <h2>OPCION A sum(//actividad[@nivel='adultos']/sesiones/sesiones_semana)</h2>
            <xsl:value-of select="concat('Suma de las sesiones semanales de las actividades para adultos: ',sum(//actividad[@nivel='adultos']/sesiones/sesiones_semana))"/>
        </div>
        
        <h1>Practica XPath 04 - 08<br/>Nodos de la actividad de codigo A06</h1>
        <div>
            <h2>OPCION A //actividad[codigo='A06']/descendant::*</h2>
            <xsl:variable name="sesion" select="/actividades/actividad[./codigo='A06']/descendant::*"/> 
                <xsl:for-each select="$sesion[not(name()='sesiones')]">
                    <p><xsl:value-of select="name(.)"/> : <xsl:value-of select="."/></p>
                </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
    </xsl:template>
</xsl:stylesheet>


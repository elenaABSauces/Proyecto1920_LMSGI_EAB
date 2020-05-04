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
        
        <h1>1.TODOS LOS ELEMENTOS DE LAS ACTIVIDADES INFANTILES.</h1>
        <div>
            <h2>--------- //actividad[@nivel="infantil"]/*-------</h2>
            <xsl:for-each select="actividades/actividad[@nivel='infantil']/*/text()
">
                <div>
                    <hr/>
                    <p><xsl:value-of select="concat(name(./codigo),': ',./codigo)"/></p>
                    <p><xsl:value-of select="concat(name(./titulo),': ',./titulo)"/></p>
                    <p><xsl:value-of select="concat(name(./fecha_inicio),': ',./fecha_inicio)"/></p>
                    <p><xsl:value-of select="concat(name(./sesiones),': ',./sesiones/minutos_sesion,' ',./sesiones/sesiones_semana)"/></p>
                </div>
            </xsl:for-each>
        </div>
        
        <h1>2. EL NOMBRE DE LAS ACTIVIDADES PARA ADULTOS</h1>
        <div>
            <h2>--------- //actividad[@nivel="adultos"]/titulo -------</h2>
            <xsl:for-each select="actividad[@nivel='adultos']/titulo/text()">
                <div>
                    <p><xsl:value-of select="."/></p>
                </div>
            </xsl:for-each>
        </div>
        
        <h1>3. EL NOMBRE DE LAS ACTIVIDADES DE ADULTOS.</h1>
        <div>
            <h2>-------- //sesiones[sesiones_semana='2']/../titulo -------</h2>
            <xsl:for-each select="actividad/sesiones[sesiones_semana='2']/../titulo">
                <div>
                    <p><xsl:value-of select="."/></p>
                </div>
            </xsl:for-each>
        </div>
        
        <h1>4. CUENTA EL NUMERO DE ACTIVIDADES.</h1>
        <div>
            <h2>------ count(//actividad) ------</h2>
            <xsl:value-of select="count(/actividades/actividad)"/>
        </div>
        
        <h1>5. CUENTA EL NUMERO DE ACTIVIDADES INFANTILES.</h1>
        <div>
            <h2>----- count(//actividad[@nivel='infantil'])------</h2>
            <xsl:value-of select="concat('Numero de actividades infantiles: ',count(//actividad[@nivel='infantil']))"/>
        </div>
        
        <h1>6. CONVERTIR EL NUMERO DE ACTIVIADES A STRING</h1>
        <div>
            <h2>------- string(count(//actividad))-------</h2>
            <xsl:value-of select="concat('Numero de actividades infantiles: ',string(count(//actividad)))"/>
        </div>
        
        <h1>07. SUMA DE LAS SESIONES SEMANALES DE LAS ACTIVIADES PARA ADULTOS.</h1>
        <div>
            <h2>--------- sum(//actividad[@nivel='adultos']/sesiones/sesiones_semana)----------</h2>
            <xsl:value-of select="concat('Suma de las sesiones semanales de las actividades para adultos: ',sum(//actividad[@nivel='adultos']/sesiones/sesiones_semana))"/>
        </div>
        
        <h1>8. NODOS DE LA ACTIVIDAD DE CODIGO A06.</h1>
        <div>
            <h2>------ //actividad[codigo='A06']/descendant::* -------</h2>
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


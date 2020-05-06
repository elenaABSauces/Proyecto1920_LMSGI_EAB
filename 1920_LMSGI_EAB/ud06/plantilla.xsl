<?xml version="1.0" encoding="UTF-8"?>

<!--
    Author: Elena de Anton
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="doctype">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    </xsl:template>

    <xsl:template name="miHead">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="author" content="Elena de Anton Barrio"/>
        <meta name="robots" content="index, follow"/>
        <link href="css.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="favicon.ico" type="image/x-icon"/>
    </xsl:template>

    <xsl:template match="comment()">
        <xsl:text>
            
        </xsl:text>
        
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
        
        <xsl:text>
            
        </xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
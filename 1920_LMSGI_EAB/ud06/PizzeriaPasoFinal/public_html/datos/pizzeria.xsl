<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Creado por.- La Banda del Patio
    Fecha: 27/05/2020
    Descripcion.- Pizzeria Paso
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>



    <xsl:template match="/menus">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:apply-templates select="comment()"/>

        <html lang="es">
            <head>
                <title>Pizzeria paso</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="La Banda del Patio"/>
                <link href="../estilo.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="favicon.ico" type="image/x-icon"/>
                <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@700&amp;display=swap" rel="stylesheet"/>
            </head>

            <body>
                <header>
                    <h1>Pizzeria<img src="../images/logo.png" alt="#"/>paso</h1>
                </header>



                <div class="pizzas">
                    <h3>Pizzas</h3>
                    <div>
                        <xsl:apply-templates select="menu"/>
                    </div>
                </div>

                <div class="pizza-del-dia">
                    <h2>Pizza<br/>del<br/>día</h2>
                     
                    <xsl:apply-templates select="document('PizzeriaXml.xml')//pizza[@codPizza = current()//menu[1]/@codigoPizza]"/>

                </div>


                <div class="aperitivos">
                    <h3>Aperitivos</h3>
                    <div class="image-container">
                        <div class="slider"></div>
                    </div>
                </div>

                <div class="postres">
                    <h3>Postres</h3>
                    <div class="image-container">
                        <img src="../images/postre2.png" alt="#"/>
                        <img src="../images/postre3.png" alt="#"/>
                        <img src="../images/postre1.png" alt="#"/>
                    </div>
                </div>
                <div class="bebidas">
                    <h3>Bebidas</h3>
                    <div class="image-container">
                        <img src="../images/bebida1.png" alt="#"/>
                        <img src="../images/bebida2.png" alt="#"/>
                        <img src="../images/bebida3.png" alt="#"/>
                    </div>

                </div>

                <footer>
                    <h3>Conócenos</h3>
                    <div>
                        <div>
                            <p>Realizamos pizzas irresistibles y únicas. Elaboradas con
                                la máxima atención al detalle y una selección rigurosa de ingredientes frescos y naturales.</p>
                        </div>
                        <img src="../images/justeat.png" alt="#"/>
                        <img src="../images/twitter.png" alt="#"/>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="menu">
        <xsl:if test="position() != 1">
            <xsl:for-each select="document('PizzeriaXml.xml')//pizza[@codPizza = current()/@codigoPizza]">                        
                <div>
                    <h4>
                        <xsl:value-of select="nombre"/>
                    </h4>
                    <div class="deslizante">
                        <div class="texto">
                            <ul>
                                <xsl:for-each select="ingredientes">
                                    <xsl:for-each select="ingrediente">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </ul>
                            <p>
                                <xsl:value-of select="precio"/>€</p>
                        </div>
                        <img src="{concat('../images/',@codPizza,'.png')}" alt="#"/>
                    </div>
                </div>
            </xsl:for-each>
        </xsl:if>
               
                

    </xsl:template> 


    <xsl:template match="pizza">
		<img src="{concat('../images/',@codPizza,'.png')}" alt="#"/>
		<div>
            <h4><xsl:value-of select="nombre"/></h4>
            <ul>
                <xsl:for-each select="ingredientes/ingrediente">
                    <li>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
 
            <p><xsl:value-of select="precio"/>€</p>
		</div>
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

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <!-- Plantilla principal -->
  <xsl:template match="/automoviles">
    <listado tienda="{concesionario}">
      <xsl:for-each select="modelo[unidades]">
        <xsl:sort select="unidades" data-type="number" order="descending"/>
        <xsl:variable name="pos" select="position()"/>
        <coche lanzamiento="{disponibilidad}">
          <nombre orden="{$pos}">
            <xsl:value-of select="concat(nombreModelo, ' (', unidades, ' unidades)')"/>
          </nombre>
          <motores>
            <xsl:call-template name="concat-motores">
              <xsl:with-param name="motores" select="motorizaciones/motor"/>
            </xsl:call-template>
          </motores>
        </coche>
      </xsl:for-each>
    </listado>
  </xsl:template>

  <!-- Plantilla para concatenar motores -->
  <xsl:template name="concat-motores">
    <xsl:param name="motores"/>
    <xsl:for-each select="$motores">
      <xsl:choose>
        <xsl:when test="position() = last() and last() &gt; 1">
          <xsl:text> y </xsl:text>
        </xsl:when>
        <xsl:when test="position() &gt; 1">
          <xsl:text>, </xsl:text>
        </xsl:when>
      </xsl:choose>
      <xsl:value-of select="."/>
    </xsl:for-each>
    <xsl:text>.</xsl:text>
  </xsl:template>

</xsl:stylesheet>
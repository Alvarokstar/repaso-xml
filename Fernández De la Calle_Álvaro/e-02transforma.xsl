<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" encoding="utf-8" indent="yes"/>

  <xsl:template match="/automoviles">
    <xsl:comment>Listado generado del fichero automoviles.xml </xsl:comment>
    <xsl:element name = "listado">
        <xsl:attribute name= "tienda">
          <xsl:value-of select= "concesionario" />
        </xsl:attribute>
        <xsl:for-each select= "modelo[unidades &gt; 0]">
          <xsl:sort select="unidades" data-type="number" order="descending"/>
          <xsl:element name="coche">
            <xsl:attribute name="lanzamiento">
              <xsl:value-of select="disponibilidad">
            </xsl:attribute>
            <xsl:element name="nombre">
              <xsl:attribute name="orden">
                <xsl:value-of select="position()" />
              </xsl:attribute>
              <xsl:value-of select= "nombreModelo" />
              <xsl:text> (</xsl:text)
              <xsl:value-of select= "unidades" />
              <xsl:text> unidades)</xsl:text)
            </xsl:element>
            <xsl:element name="motores">
              <xsl:value-of select= "motorizaciones/motor" />
                <xsl:value-of select="." />
                  <xsl:choose>
                    <xsl:when test="position()=last()">
                      <xsl:text> .</xsl:text)
                    </xsl:when>
                    <xsl:when test="position()=last()-1">
                      <xsl:text> y</xsl:text)
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text> ,</xsl:text)
                    </xsl:otherwise>
            </xsl:element>
  </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="html" version="1.0"
     indent="yes" doctype-system="about:legacy-compact" />
     <xsl:param name="sort">name</xsl:param>
<xsl:template match="/">
        <html>
            <head>
                <title>
                    Uczelnia
                </title>
                <link rel="stylesheet" type="text/css" href="../CSSzad5.css" media="screen" />
            </head>
            <body>
                <xsl:choose>
                  <xsl:when test="$sort = 'wydzial'">
                  <xsl:for-each select="./uczelnia/wydzial" > 
                    <xsl:sort select="nazwaWydzialu/text()" />
                    <xsl:call-template name="Wydzial" />
              </xsl:for-each>
                  </xsl:when>
                
                <xsl:otherwise>
                  <xsl:for-each select="./uczelnia/wydzial" >
                    <xsl:call-template name="Wydzial" />
                  </xsl:for-each>
                </xsl:otherwise>

                </xsl:choose>
            </body>
        </html>
</xsl:template>

<xsl:template name="Wydzial">
  <table border="1" cellpadding="5">
        <thead>
        <tr><th colspan = "4"><xsl:value-of select="./nazwaWydzialu"/></th></tr>
        </thead>
        <xsl:for-each select="kierunek" >
          <xsl:sort select="nazwaKierunku/text()" />
          <xsl:call-template name="Kierunek" />
        </xsl:for-each>
  </table>
</xsl:template>

<xsl:template name="Kierunek">
  <tbody>
  <tr>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="nazwaKierunku='Informatyka stosowana'">red</xsl:when>
        <xsl:when test="nazwaKierunku='Informatyka niestosowana'">green</xsl:when>
        <xsl:when test="nazwaKierunku='Fizyka niestosowana'">pink</xsl:when>
        <xsl:otherwise>blue</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <th colspan="4"><xsl:value-of select="./nazwaKierunku"/></th></tr>
    <tr>
    <td>Numer</td>          
    <td>Imie</td>
    <td>Nazwisko</td>
    <td>Numer indeksu</td>
  </tr>
      <xsl:choose>
        <xsl:when test="$sort = 'student'">
           <xsl:for-each select="student" >
              <xsl:sort select="nazwisko/text()"/>
              <xsl:call-template name="student" />
              </xsl:for-each> 
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="student" >
              <xsl:call-template name="student" />
              </xsl:for-each> 
        </xsl:otherwise>
      </xsl:choose>
</tbody>
</xsl:template>

<xsl:template name = "student">

     <tr>
                <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="../nazwaKierunku='Informatyka stosowana'">red</xsl:when>
        <xsl:when test="../nazwaKierunku='Informatyka niestosowana'">green</xsl:when>
        <xsl:when test="../nazwaKierunku='Fizyka niestosowana'">pink</xsl:when>
        <xsl:otherwise>blue</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
          <td><xsl:number value = "position()" format="1" /> </td>
          <td><xsl:value-of select="imie" /> </td>
          <td><xsl:value-of select="nazwisko" /> </td>
          <td><xsl:value-of select="indeks" /> </td>
     </tr>
</xsl:template>

</xsl:stylesheet>

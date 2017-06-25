<?xml version="1.0" encoding="UTF-8"?>
<!--run against 00index.xml to include single files"-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:lido="http://www.lido-schema.org"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="catalogue_style.css"/>
      </head>
      <body>
        <h2>Notenrollen</h2>
        <xsl:for-each select="/list/entry">
          <!--document loop-->
          <xsl:for-each select="document(@name)/lido:lidoWrap/lido:lido">
            <!--record loop-->
            <xsl:variable name = "recordID" select = "lido:administrativeMetadata/lido:recordWrap/lido:recordID"/>
            <table>
              <thead>
                <tr>
                  <!--title-->
                  <th colspan="4">
                    <xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:titleWrap/lido:titleSet/lido:appellationValue"/>
                  </th>
                </tr>
              </thead>
              <tbody>
                <!--objectID-->
                <tr>
                  <td class="descriptors">ObjectID</td>
                  <td class="values">
                    <xsl:value-of select="lido:lidoRecID"/>
                  </td>
                  <!-- Images -->
                  <xsl:variable name = "picDir" select = "'./img/'"/>
                  <xsl:variable name = "picUrl1" select = "concat($picDir, $recordID, '_1.jpg')"/>
                  <xsl:variable name = "picUrl2" select = "concat($picDir, $recordID, '_2.jpg')"/>
                  <xsl:variable name = "picUrl3" select = "concat($picDir, $recordID, '_3.jpg')"/>
                  <xsl:variable name = "picUrl4" select = "concat($picDir, $recordID, '_4.jpg')"/>
                  <td class="imgcol" rowspan="99">
                    <a href = "{$picUrl1}" target="new">
                      <img src="{$picUrl1}" alt="ein Notenrollenbild"/>
                    </a>
                    <a href = "{$picUrl2}" target="new">
                      <img src="{$picUrl2}" alt="ein Notenrollenbild"/>
                    </a>
                  </td>
                  <td class="imgcol" rowspan="99">
                    <a href = "{$picUrl3}" target="new">
                      <img src="{$picUrl3}" alt="ein Notenrollenbild"/>
                    </a>
                    <a href = "{$picUrl4}" target="new">
                      <img src="{$picUrl4}"/>
                    </a>
                  </td>
                </tr>
                <!--object type-->
                <tr>
                  <td class="descriptors">Objekttyp</td>
                  <td class="values">
                    <xsl:value-of select="(lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/lido:term)[1]"/>
                  </td>
                </tr>
                <!--instrument-->
                <tr>
                  <td class="descriptors">Instrument</td>
                  <td class="values">
                    <xsl:value-of select="(lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/lido:term)[2]"/>
                  </td>
                </tr>
                <!--description1-->
                <tr>
                  <td class="descriptors">Beschreibung 1</td>
                  <td class="values">
                    <xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:inscriptionsWrap/lido:inscriptions/lido:inscriptionDescription/lido:descriptiveNoteValue"/>
                  </td>
                </tr>
                <!--description2-->
                <tr>
                  <td class="descriptors">Beschreibung 2</td>
                  <td class="values">
                    <xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:objectDescriptionWrap/lido:objectDescriptionSet/lido:descriptiveNoteValue"/>
                  </td>
                </tr>
                <!--actors (Manufacturer, Composer, Interpret)-->
                <xsl:for-each select="lido:descriptiveMetadata/lido:eventWrap/lido:eventSet/lido:event/lido:eventActor/lido:actorInRole">
                  <tr>
                    <td class="descriptors">
                      <xsl:value-of select="lido:roleActor/lido:term"/>
                    </td>
                    <!--actor role-->
                    <td class="values">
                      <xsl:value-of select="lido:actor/lido:nameActorSet/lido:appellationValue"/>
                      <br/>
                      <!--actor name-->
                      <!--actor info-->
                      <xsl:variable name="wikiurl" select="lido:actor/lido:actorID[@lido:source='Wikipedia']" />
                      <xsl:variable name="gndurl" select="lido:actor/lido:actorID[@lido:source='GND']" />
                      <xsl:choose>
                        <xsl:when test="$wikiurl != '' ">
                          <!--wikipedia if available-->
                          <a href="{$wikiurl}">
                            <xsl:value-of select="$wikiurl" />
                          </a>
                        </xsl:when>
                        <xsl:otherwise>
                          <!--else DND-->
                          <a href="{$gndurl}">
                            <xsl:value-of select="$gndurl" />
                          </a>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
                <!--constructed URL to original project page-->
                <xsl:variable name = "baseUrl" select="'https://digital.deutsches-museum.de/projekte/notenrollen/detail/'" />
                <xsl:variable name = "recordUrl" select="concat($baseUrl, $recordID)" />
                <tr>
                  <td class="descriptors">URL</td>
                  <td class="values">
                    <a href="{$recordUrl}">
                      <xsl:value-of select = "$recordUrl" />
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </xsl:for-each>
          <!--end record loop-->
        </xsl:for-each>
        <!--end document loop-->
        <br/>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0"?>
<!--run against 00index.xml to include single files"-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:lido="http://www.lido-schema.org"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">


<xsl:template match="/">
 <html>
 <body>
   <h2>Notenrollen</h2>
   <table border="0" >
       <xsl:for-each select="/list/entry"> <!--document loop-->
           <xsl:for-each select="document(@name)/lido:lidoWrap/lido:lido"> <!--record loop-->
               <xsl:variable name = "recordID" select = "lido:administrativeMetadata/lido:recordWrap/lido:recordID"/>
               <thead>   
               <tr bgcolor="#9acd32">

                   <!--title-->
               <th colspan="3">
                   <xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:titleWrap/lido:titleSet/lido:appellationValue"/>
               </th>
               </tr>
               </thead>
               <tbody>

                   <!--objectID-->
               <tr>
                   <td style="font-weight:bold">ObjectID</td>
                   <td><xsl:value-of select="lido:lidoRecID"/></td>

                   <!--Picture --> 
                   <xsl:variable name = "picUrl1" select = "concat('http://digital.deutsches-museum.de/media/', $recordID, '_0001/full/,1200/0/default.jpg')"/>             
                   <td rowspan="5"><img src="{$picUrl1}" alt="ein Notenrollenbild" height="210" width="240"/></td>
               </tr>

                   <!--object type-->
               <tr>
                   <td style="font-weight:bold">Objekttyp</td>
                   <td><xsl:value-of select="(lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/lido:term)[1]"/></td>
               </tr>

                   <!--instrument-->
               <tr>
                   <td style="font-weight:bold">Instrument</td>
                   <td><xsl:value-of select="(lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/lido:term)[2]"/></td>
               </tr>

                   <!--description-->
               <tr>
                   <td style="font-weight:bold">Beschreibung 1</td>
                   <td><xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:inscriptionsWrap/lido:inscriptions/lido:inscriptionDescription/lido:descriptiveNoteValue"/></td>
               </tr>

                   <!--description-->
               <tr>
                   <td style="font-weight:bold">Beschreibung 2</td>
                   <td><xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:objectDescriptionWrap/lido:objectDescriptionSet/lido:descriptiveNoteValue"/></td>
               </tr>

                   <!--actors (Manufacturer, Composer, Interpret)-->
               <xsl:for-each select="lido:descriptiveMetadata/lido:eventWrap/lido:eventSet/lido:event/lido:eventActor/lido:actorInRole">
                   <tr>
                   <td style="font-weight:bold"><xsl:value-of select="lido:roleActor/lido:term"/></td> <!--actor role-->
                   <td><xsl:value-of select="lido:actor/lido:nameActorSet/lido:appellationValue"/><br/> <!--actor name-->
                   <!--actor info-->
                   <xsl:variable name="wikiurl" select="lido:actor/lido:actorID[@lido:source='Wikipedia']" />
                   <xsl:variable name="gndurl" select="lido:actor/lido:actorID[@lido:source='GND']" />
                   <xsl:choose>
                       <xsl:when test="$wikiurl != '' "> <!--wikipedia if available-->
                           <a href="{$wikiurl}"><xsl:value-of select="$wikiurl" /></a>
                       </xsl:when>
                       <xsl:otherwise> <!--else DND-->
                            <a href="{$gndurl}"><xsl:value-of select="$gndurl" /></a>
                       </xsl:otherwise>
                   </xsl:choose>
                  </td>
                  </tr>
               </xsl:for-each>

               <!--constructed URL to original project page-->
               <xsl:variable name = "baseUrl" select="'https://digital.deutsches-museum.de/projekte/notenrollen/detail/'" />
               <xsl:variable name = "recordUrl" select="concat($baseUrl, $recordID)" />
               <tr>
               <td style="font-weight:bold">URL</td>
               <td>
               <a href="{$recordUrl}"><xsl:value-of select = "$recordUrl" /></a>
               </td>
               </tr>
             </tbody>
         </xsl:for-each> <!--end record loop-->
     </xsl:for-each> <!--end document loop-->
   </table>
 </body>
 </html>
</xsl:template>

</xsl:stylesheet>

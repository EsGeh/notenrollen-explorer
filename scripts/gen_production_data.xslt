<?xml version="1.0" encoding="UTF-8"?>
<!--run against /res/allobjects.xml->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:lido="http://www.lido-schema.org"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

  <xsl:template match="/">
  	<notenrollen>
		<xsl:for-each select="lido:lidoWrap/lido:lido">
			<xsl:variable name = "recordID" select = "lido:administrativeMetadata/lido:recordWrap/lido:recordID"/>
			<xsl:variable name = "objectID" select = "lido:lidoRecID"/>
			<!--record loop-->
			<object id="{$objectID}">
			<descriptiveMetadata>
				<objectID><xsl:value-of select="$objectID"/></objectID>
				<title>	<xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:titleWrap/lido:titleSet/lido:appellationValue"/></title>
				<objectType><xsl:value-of select="(lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/lido:term)[1]"/></objectType>
				<instrument><xsl:value-of select="(lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/lido:term)[2]"/></instrument>
				<objectDescription>
					<term><xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:inscriptionsWrap/lido:inscriptions/lido:inscriptionDescription/lido:descriptiveNoteValue"/></term>
					<term><xsl:value-of select="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:objectDescriptionWrap/lido:objectDescriptionSet/lido:descriptiveNoteValue"/></term>
				</objectDescription>
			</descriptiveMetadata>

			<objectData>
				<xsl:variable name = "picDir" select = "'static/notenrollen/images/'"/>
				<image><xsl:value-of select="concat($picDir, $recordID, '_1.jpg')"/></image>
				<image><xsl:value-of select="concat($picDir, $recordID, '_2.jpg')"/></image>
				<image><xsl:value-of select="concat($picDir, $recordID, '_3.jpg')"/></image>
				<image><xsl:value-of select="concat($picDir, $recordID, '_4.jpg')"/></image>
			</objectData>

			<actors>
				<!--actors (Manufacturer, Composer, Interpret)-->
				<xsl:for-each select="lido:descriptiveMetadata/lido:eventWrap/lido:eventSet/lido:event/lido:eventActor/lido:actorInRole">
						<xsl:variable name = "actor_role" select = "lido:roleActor/lido:term"/>
						<xsl:element name = "{$actor_role}"><xsl:value-of select="lido:actor/lido:nameActorSet/lido:appellationValue"/></xsl:element>
				</xsl:for-each>			
			</actors>
		</object>
		</xsl:for-each>
		<!--end record loop-->
	</notenrollen>
  </xsl:template>
</xsl:stylesheet>

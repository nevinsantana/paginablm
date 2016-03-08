<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template match="FEEDBACK">
<xsl:call-template name="MODULE-CSS"/>
<form method="POST">
	<table cellpadding="10" cellspacing="0" border="0" width="100%" class="mod-form" style="margin: 10px 0;">
		<tr>
			<td style="font-weigh: bold; text-align: center; vertical-align: middle;">
				<xsl:apply-templates select="RESPONSE-TEXT"/>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">
				<xsl:apply-templates select="BUTTON" mode="feedback"/>
			</td>
		</tr>
	</table>
</form>
</xsl:template>

<xsl:template match="RESPONSE-TEXT">
	<xsl:value-of select="." disable-output-escaping="yes"/>
</xsl:template>

<xsl:template match="BUTTON" mode="feedback">
	<input type="submit" value="{@CAPTION}"/>
</xsl:template>
	
</xsl:stylesheet>
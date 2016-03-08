<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="FEEDBACK">
		<xsl:variable name="objectName">
			<xsl:text>feedback_</xsl:text>
			<xsl:value-of select="@INSTANCE-ID"/>
		</xsl:variable>
		<script type="text/javascript" language="javascript" src="resources/js/validator.js">void(1);</script>
		<script type="text/javascript" language="javascript" src="resources/js/modules/Feedback/form.js">void(1);</script>
		<script type="text/javascript" language="javascript">
			<xsl:value-of select="$objectName"/><xsl:text>=new FeedbackForm();</xsl:text>
		</script>
		<xsl:call-template name="MODULE-CSS"/>
		<form method="POST" name="{$objectName}Form">
			<table cellpadding="0" cellspacing="0" border="0" width="100%" class="mod-form" style="padding: 0px; padding: 0px;">
				<tr>
					<td colspan="2" class="mod-form-title" style="padding: 10px;">
						<b>
							<xsl:value-of select="@CAPTION"/>
						</b>
					</td>
				</tr>
				<tr>
					<xsl:apply-templates select="FORM/INPUT" mode="feedback">
						<xsl:with-param name="objectName">
							<xsl:value-of select="$objectName"/>
						</xsl:with-param>
					</xsl:apply-templates>
				</tr>
				<tr>
					<td colspan="2" style="padding-top:15px;">
						<img src="{$img_url}line.gif" width="100%" height="1"/>
					</td>
				</tr>
				<tr>
					<td style="padding: 10px; color:#555555;">
						<xsl:if test="@REQ-FIELDS != ''">
							<span class="requiered">*</span>&#160;<xsl:value-of select="@REQ-FIELDS"/>
						</xsl:if>
					</td>
					<td style="padding: 10px; text-align: right;">
						<xsl:apply-templates select="BUTTON" mode="feedback"/>
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript" language="javascript">
			<xsl:text>document.forms.</xsl:text><xsl:value-of select="$objectName"/><xsl:text>Form.onsubmit=function(){return </xsl:text><xsl:value-of select="$objectName"/><xsl:text>.validate(true,true,false);}</xsl:text>
			<xsl:apply-templates select="VALIDATORS/VALIDATOR" mode="feedback">
				<xsl:with-param name="objectName">
					<xsl:value-of select="$objectName"/>
				</xsl:with-param>
			</xsl:apply-templates>
		</script>
	</xsl:template>
	
	<xsl:template match="BUTTON" mode="feedback">
		<input type="submit" value="{@CAPTION}"/>
	</xsl:template>
	
	<xsl:template match="INPUT" mode="feedback">
		<xsl:param name="objectName"/>
		<tr>
			<td style="padding-left: 10px; padding-bottom: 0px; padding-right: 10px; padding-top: 10px; width: 30%;">
				<xsl:value-of select="@CAPTION"/>
				<xsl:if test="@REQUIRED!='0'">
					&#160;<span class="requiered">*</span>
				</xsl:if>
			</td>
			<td style="padding-left: 10px; padding-bottom: 0px; padding-right: 10px; padding-top: 10px; width: 70%;">
				<xsl:apply-templates select="current()" mode="feedbackControl">
					<xsl:with-param name="objectName">
						<xsl:value-of select="$objectName"/>
					</xsl:with-param>
				</xsl:apply-templates>
			</td>
		</tr>
		<tr style="display: none;">
			<xsl:attribute name="ID"><xsl:value-of select="@NAME"/>_message</xsl:attribute>
			<td>&#160;</td>
			<td style="color: red; font-size: 10px; padding-left: 10px;">&#160;</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="INPUT[@TYPE='string']" mode="feedbackControl">
		<xsl:param name="objectName"/>
		<input>
			<xsl:apply-templates select="current()" mode="feedbackInputAtibutes">
				<xsl:with-param name="objectName">
					<xsl:value-of select="$objectName"/>
				</xsl:with-param>
			</xsl:apply-templates>
			<xsl:attribute name="value">
				<xsl:value-of select="@INIT-VALUE"/>
			</xsl:attribute>
		</input>
	</xsl:template>

	<xsl:template match="INPUT[@TYPE='passwd']" mode="feedbackControl">
		<xsl:param name="objectName"/>
		<input type="password">
			<xsl:apply-templates select="current()" mode="feedbackInputAtibutes">
				<xsl:with-param name="objectName">
					<xsl:value-of select="$objectName"/>
				</xsl:with-param>
			</xsl:apply-templates>
			<xsl:attribute name="value">
				<xsl:value-of select="@INIT-VALUE"/>
			</xsl:attribute>
		</input>
	</xsl:template>

	<xsl:template match="INPUT[@TYPE='text']" mode="feedbackControl">
		<xsl:param name="objectName"/>
		<textarea>
			<xsl:apply-templates select="current()" mode="feedbackInputAtibutes">
				<xsl:with-param name="objectName">
					<xsl:value-of select="$objectName"/>
				</xsl:with-param>
			</xsl:apply-templates>
			<xsl:value-of select="@INIT-VALUE"/>
		</textarea>
	</xsl:template>
	
	<xsl:template match="INPUT" mode="feedbackInputAtibutes">
		<xsl:param name="objectName"/>	
		<xsl:attribute name="name">
			<xsl:value-of select="@NAME"/>
		</xsl:attribute>
		<xsl:attribute name="id">
			<xsl:value-of select="@NAME"/>
		</xsl:attribute>
		<xsl:attribute name="onchange"><xsl:value-of select="$objectName"/>.validate(false,true,false);</xsl:attribute>
		<xsl:attribute name="class">mod-input</xsl:attribute>
		<xsl:attribute name="style">width: 100%;</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="VALIDATOR" mode="feedback">
		<xsl:param name="objectName"/>
		var field=new FeedbackFormField('<xsl:value-of select="@FIELD_ID"/>','<xsl:value-of select="@FIELD_ID"/>_message');
		<xsl:apply-templates select="METHOD" mode="feedbackValidator"/>
		<xsl:value-of select="$objectName"/>.registerField(field);
	</xsl:template>
	
	<xsl:template match="METHOD" mode="feedbackValidator">
		field.appendValidator('<xsl:value-of select="@FUNC"/>','<xsl:value-of select="@DESCRIPTION"/>');
	</xsl:template>
	
</xsl:stylesheet>
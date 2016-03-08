<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" indent="no"/>
<xsl:strip-space elements="*"/>
	<!--MENU-->
	<xsl:template match="MENU" mode="top">
		<xsl:apply-templates select="MENU-ITEM"  mode="top"/>
	</xsl:template>

	<!--MENU-ITEM-->
	<xsl:template match="MENU-ITEM"  mode="top">
   		<xsl:choose>
           <!-- active menu with link-->
           	<xsl:when test="MENU-ITEM[@ID=/LAYOUT/@ID] or @ID=/LAYOUT/@ID">

<td class="tmenua"><div align="center"><img src="images/bullet.gif"/><br/>
 <a href="{@HREF}" class="tmenua"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a></div> </td>
            
			</xsl:when>
            
            
            <xsl:otherwise>
			
<td class="tmenu"><div align="center"><img src="images/bullet.gif"/><br/>
 <a href="{@HREF}" class="tmenu"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a></div> </td>
 
            </xsl:otherwise>
	    </xsl:choose>
  		<xsl:if test="position()!=last()">
 <td width="10"></td>
<td width="1" bgcolor="#E0E0E0" ></td>
 <td width="10"></td>
  		</xsl:if>
	</xsl:template>	

</xsl:stylesheet>

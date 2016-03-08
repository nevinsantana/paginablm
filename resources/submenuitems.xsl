<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:output method="html" indent="yes" encoding="utf-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>
<xsl:strip-space elements="*"/>
<xsl:include href="buttons.xsl"/>

<xsl:template match="LAYOUT">
	<xsl:variable name="cID" select="@ID"/>
	<html>
<!-- av-159 -->
		<head>
			<title><xsl:value-of select="@SITE-TITLE" disable-output-escaping="yes"/> - <xsl:value-of select="@TITLE" disable-output-escaping="yes"/></title>
			<xsl:apply-templates select="META-TAGS"/>
			<link href="css/styles.css" rel="stylesheet" type="text/css" />
		</head>
<!--start-->
<body style="margin:0px;" bgcolor="#ffffff">
<center>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#D0D0D0" background="images/001.gif" style="background-repeat:repeat-x;padding-left:10px;padding-right:10px;">
	<!-- MENU -->
	<table  border="0" cellspacing="0" cellpadding="0" align="left" height="50">
      <tr>
	  <td width="10"></td>
        <xsl:call-template name="TOP-MENU"/>
      </tr>
    </table>
	<!-- END MENU -->
	</td>
  </tr>
  <tr>
    <td height="1" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td valign="top" height="100%"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="240" background="images/003.gif" style="background-repeat:repeat-x;">
		<!-- LOGO -->
		<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="company">
                <xsl:value-of select="COMPANY-INFO/NAME" disable-output-escaping="yes"/>
            </td>
            <td><a href="./"><img src="images/{LOGO/@NAME}" border="0" alt="" style="margin-left: 5px;"/></a></td>
          </tr>
        </table>
		
		</td>
        <td width="1" bgcolor="#FFFFFF"></td>
        <td background="images/header1.gif"><table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td style="background-image:url(images/header.gif);background-position:top left;background-repeat:no-repeat;padding-right:10px;"><table width="180" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td class="slogan"><div align="center"><xsl:value-of select="COMPANY-INFO/SLOGAN" disable-output-escaping="yes"/></div></td>
              </tr>
            </table></td>
          </tr>
        </table><!-- END LOGO --></td>
      </tr>
      <tr>
        <td height="1" colspan="3" bgcolor="#FFFFFF"></td>
        </tr>
      <tr>
        <td valign="top" background="images/002.gif" style="background-repeat:repeat-y;"><table width="240" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top" style="padding-top:20px;padding-bottom:20px;">
			<!-- SUBMENU -->
			<table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
<xsl:call-template name="SUB-MENU">
<xsl:with-param name="pageID" select="@ID"/>
</xsl:call-template>
            </table>
			<!-- END SUBMENU -->
			</td>
          </tr>
        </table></td>
        <td width="1" bgcolor="#FFFFFF"></td>
        <td height="100%" valign="top">
		<!-- CONTENT -->
		<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" valign="top">
          <tr>
            <td align="top" width="100%" height="100%" valign="top">
<table  border="0" cellpadding="0" cellspacing="0" valign="top">
                <tr>
                  <td class="pageContent"><span  class="pathway"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></span></td>
                  <td><img src="images/008.gif" width="17" height="17"/></td>
                </tr>
              </table>
                <br/>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td width="100%" height="100%" class="pageContent" name="SB_stretch" valign="top">
	<xsl:apply-templates select="PAGE-CONTENT"/>
	</td>
</tr>
</table>
</td>
          </tr>
        </table>
		<!-- END CONTENT -->
		</td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td height="1" bgcolor="#FFFFFF" align="center"><img src="images/006.gif" width="780" height="1"/></td>
  </tr>
  <tr>
    <td bgcolor="#E5E5E5" style="background-image:url(images/007_1.gif);background-position:top;background-repeat:repeat-x;padding-top:20px;padding-bottom:20px;" align="center" ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="20"></td>
        <td>
		<!-- BOTTOM MENU -->
		<table border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <xsl:call-template name="BOTTOM-MENU"/>
             
          </tr>
        </table>
		<!-- END BOTTOM MENU -->
		</td>
        <td width="20"></td>
      </tr>
      <tr>
        <td></td>
        <td style="padding:15px;">
		<!-- FOOTER -->
		<table border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="copyright"><xsl:value-of select="COPYRIGHT" disable-output-escaping="yes"/></td>
          </tr>
        </table>
		<!-- END FOOTER -->
		</td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</center>
</body>
<!--end-->
</html>
</xsl:template>


<xsl:template name="TOP-MENU">
		<xsl:apply-templates select="MENU" mode="top"/>	
</xsl:template>


<xsl:template name="SUB-MENU">
	<xsl:param name="pageID"/>
	<xsl:choose>
		<xsl:when test="//MENU/MENU-ITEM[@ID = $pageID]/MENU-ITEM">
			<xsl:apply-templates select="//MENU/MENU-ITEM[@ID = $pageID]/MENU-ITEM" mode="sub"/>
		</xsl:when>
		<xsl:when test="//MENU/MENU-ITEM/MENU-ITEM[@ID = $pageID]">
			<xsl:variable name="parentID" select="//MENU/MENU-ITEM/MENU-ITEM[@ID = $pageID]/../@ID"/>
			<xsl:apply-templates select="//MENU/MENU-ITEM[@ID=$parentID]/MENU-ITEM" mode="sub"/>
		</xsl:when>
	</xsl:choose>
</xsl:template>
	
<xsl:template match="MENU-ITEM" mode="sub">
	<xsl:choose>
		<xsl:when test="@ID=/LAYOUT/@ID" >


<tr>
<td class="smenu"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></td>
 <td class="s1"><img src="images/005.gif"/></td>
</tr>
		</xsl:when>
		<xsl:otherwise>
		<xsl:if test="../MENU-ITEM[@ID=/LAYOUT/@ID] or ../../MENU-ITEM[@ID=/LAYOUT/@ID]">


<tr>
<td class="smenua"><a href='{@HREF}' class="smenua"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a> </td>
<td class="s1"><img src="images/005.gif"/></td>
</tr>
			  
		</xsl:if>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:if test="position()!=last()">

<tr>
 <td height="20" colspan="2"><div style="height:1px; background-repeat: repeat-x;background-image:url(images/004.gif);"><span></span></div></td>
</tr>

	</xsl:if>
</xsl:template>	

<xsl:template name="BOTTOM-MENU">   		
	<xsl:apply-templates select="MENU" mode="bottom"/>			
</xsl:template>

<xsl:template match="MENU" mode="bottom">
	<xsl:apply-templates select="MENU-ITEM"  mode="bottom"/>
</xsl:template>
		
<xsl:template match="MENU-ITEM"  mode="bottom">
	<xsl:choose>
       <!-- when vizited inside-->
       	<xsl:when test="MENU-ITEM[@ID=/LAYOUT/@ID] or @ID=/LAYOUT/@ID">


<td ><a href='{@HREF}' class="bmenua" id="abmenu"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a> </td>
	   </xsl:when>

           <!-- when active-->
           
           <xsl:otherwise>

<td><a href='{@HREF}'  class="bmenu" id="bmenu{position()}"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a></td>

	   </xsl:otherwise>
       </xsl:choose>
  		<xsl:if test="position()!=last()">

<td width="10"></td>
<td width="1" background="images/007.gif" class="b1"></td>
<td width="10"></td>

  		</xsl:if>
</xsl:template>
	
<xsl:template match="META-TAGS">
	<xsl:apply-templates mode="meta-tags"/>
</xsl:template>
	
<xsl:template match="*" mode="meta-tags">
	<meta name="{local-name(.)}"><xsl:attribute name="content"><xsl:value-of select="." disable-output-escaping="yes"/></xsl:attribute></meta>
</xsl:template>


<xsl:template match="PAGE-CONTENT">
	<xsl:comment> EDITABLE CONTENT </xsl:comment>
	<xsl:apply-templates mode="meta-tags"/>
</xsl:template>
	     	
</xsl:stylesheet>

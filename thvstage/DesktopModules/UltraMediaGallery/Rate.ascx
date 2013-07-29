<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Rate.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Rate" %>

<script type="text/javascript">
    UPG_listen("showRating");
</script>

<p class="Head">
<asp:Label ID="Label1" runat="server" resourcekey="About"></asp:Label></p>
<div id="divRating">
</div>

<script type="text/javascript" language="javascript">
function showRating()
{
    enterLoadingState2();
    enterLoadingState3();

	var eventArgs = 'load|' + currentPhotoId;
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,showRating_CallBack,this,showRating_CallBackError,null,null,null,0);
}

function enterLoadingState2()
{
	var loading = "<div align=center><br><img src='<%=ResolveUrl("~/DesktopModules/UltraMediaGallery/images/loading.gif") %>'><p class='SubHead'><%=Localize("Loading") %><br></div>";
	document.getElementById("divRating").innerHTML = loading;
}

function enterLoadingState3()
{
	var loading = "<div align=center><p class='SubHead'><%=Localize("Loading") %><br></div>";
	document.getElementById("divScores").innerHTML = loading;
}

function showRating_CallBack(result, ctx)
{
    var rating = result.substring(0, 3) * 1;
    var total = result.substring(3, 8) * 1;
    var html = result.substring(8);
	document.getElementById("divRating").innerHTML = html;
    BindStars(rating * 1, total * 1);
}

function showRating_CallBackError(result, ctx)
{
	alert(result);
}

function BindStars(stars, total)
{
    var starsHtml = "";
    if (total > 0)
    {
        var i = 0;
        for (;i<stars-1;i++)
        {
            starsHtml += "<img src='<%=ModulePath%>images/star_solid.png' border='0'>";
        }
        
        if (stars - i > 0)
        {
            var difference = stars - i;
            if (difference >= .75)
            {
                starsHtml += "<img src='<%=ModulePath%>images/star_solid.png' border='0'>";
                i += 1;
            }
            else if (difference >= .25)
            {
                starsHtml += "<img src='<%=ModulePath%>images/star_solid2.png' border='0'>";
                i += 1;
            }
        }
        
        if (i < 5)
        {
            //
            for (;i<5;i++)
                starsHtml += "<img src='<%=ModulePath%>images/star_hollow.png' border='0'>";
        }
        
        starsHtml += "&nbsp;&nbsp;&nbsp;&nbsp;<font class='Normal'>";
        starsHtml += "<font class='SubSubHead'>" + stars + "</font> <%=Localize("stars") %> / <font class='SubSubHead'>" + total + "</font> <%=Localize("ratings") %>";
        starsHtml += "</font>";
    }
    else
    {
        starsHtml = "<font class='Normal'><%=Localize("NotRated.Help") %></font>";
    }
    
	document.getElementById("divScores").innerHTML = starsHtml;
	
	document.getElementById("btnRate").disabled = false;
	
	var rdoRating5 = document.getElementById("<%= rdoRating5.ClientID%>");
    var rdoRating4 = document.getElementById("<%= rdoRating4.ClientID%>");
    var rdoRating3 = document.getElementById("<%= rdoRating3.ClientID%>");
    var rdoRating2 = document.getElementById("<%= rdoRating2.ClientID%>");
    var rdoRating1 = document.getElementById("<%= rdoRating1.ClientID%>");
    rdoRating5.checked = false;
    rdoRating4.checked = false;
    rdoRating3.checked = false;
    rdoRating2.checked = false;
    rdoRating1.checked = false;
}

function postRate()
{   
    var score = 0;
    var rdoRating5 = document.getElementById("<%= rdoRating5.ClientID%>");
    var rdoRating4 = document.getElementById("<%= rdoRating4.ClientID%>");
    var rdoRating3 = document.getElementById("<%= rdoRating3.ClientID%>");
    var rdoRating2 = document.getElementById("<%= rdoRating2.ClientID%>");
    var rdoRating1 = document.getElementById("<%= rdoRating1.ClientID%>");
    if (rdoRating5.checked)
        score = 5;
    else if (rdoRating4.checked)
        score = 4;
    else if (rdoRating3.checked)
        score = 3;
    else if (rdoRating2.checked)
        score = 2;
    else if (rdoRating1.checked)
        score = 1;
    
    if (score < 1) return;
    
	var eventArgs = "post|" + currentPhotoId + "|" + score;
	enterLoadingState3();
	document.getElementById("btnRate").disabled = true;
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,postRate_CallBack,this,showRating_CallBackError,null,null,null,0);
}

function postRate_CallBack(result, ctx)
{
    var rating = result.substring(0, 3) * 1;
    var total = result.substring(3, 8) * 1;
    BindStars(rating, total);
    
    if (result.length > 8)
        alert(result.substring(8));
}
</script>

<p class="Head">
<asp:Label ID="Label2" runat="server" resourcekey="Rate"></asp:Label></p>
<p>
<div id="divScores" class="verticalMiddle">
    <img alt="star" src="<%=ModulePath%>images/star_hollow.png" border="0">
    <img alt="star" src="<%=ModulePath%>images/star_hollow.png" border="0">
    <img alt="star" src="<%=ModulePath%>images/star_hollow.png" border="0">
    <img alt="star" src="<%=ModulePath%>images/star_hollow.png" border="0">
    <img alt="star" src="<%=ModulePath%>images/star_hollow.png" border="0">
    <font class="Normal">0 <%=Localize("stars") %> / 0 <%=Localize("ratings") %></font></div></p>
    <div style="white-space: nowrap">
    <asp:RadioButton ID="rdoRating5" runat="server" GroupName="rdoRating" CssClass="Normal" resourcekey="Excellent" />
    <asp:RadioButton ID="rdoRating4" runat="server" GroupName="rdoRating" CssClass="Normal" resourcekey="Good" />
    <asp:RadioButton ID="rdoRating3" runat="server" GroupName="rdoRating" CssClass="Normal" resourcekey="Acceptable" />
    <asp:RadioButton ID="rdoRating2" runat="server" GroupName="rdoRating" CssClass="Normal" resourcekey="Poor" />
    <asp:RadioButton ID="rdoRating1" runat="server" GroupName="rdoRating" CssClass="Normal" resourcekey="Worst" />
    </div>
<p>
    <input onclick="postRate();" id="btnRate" type="button" value="<%=Localize("RateIt")%>"
        disabled class="Normal" />
</p>

<p align="right">
<!-- AddThis Button BEGIN -->
<a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4b3c6dbc27e6001b"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4b3c6dbc27e6001b"></script>
<!-- AddThis Button END -->
</p>

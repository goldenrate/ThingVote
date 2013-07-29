<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ShoppingCart.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ShoppingCart" %>

<script type="text/javascript">
function enterLoadingState4()
{
	var loading = "<div align=center><br><img src='<%=ResolveUrl("~/DesktopModules/UltraMediaGallery/images/loading.gif") %>'><p class='SubHead'><%=Localize("Loading") %><br></div>";
	document.getElementById("divCart").innerHTML = loading;
}
function UPG_AddToCart(id,tn) // Photo Id and thumbnail
{
    enterLoadingState4();

	var eventArgs = 'add|' + id + "|" + tn;
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,updateCart_CallBack,this,updateCart_CallBackError,null,null,null,0);
}
function RemoveItem(downloadId)
{
    enterLoadingState4();

	var eventArgs = 'remove|' + downloadId;
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,updateCart_CallBack,this,updateCart_CallBackError,null,null,null,0);
}
function updateCart_CallBack(result, ctx)
{
    if (result.indexOf("|")>0)
    {
        alert(result.substring(0, result.indexOf("|")));
        document.getElementById("divCart").innerHTML = result.substring(result.indexOf("|") + 1);
    }
    else
    {
	    document.getElementById("divCart").innerHTML = result;
	}
}
function updateCart_CallBackError(result, ctx)
{
	alert(result);
}

addEvent(window,"load" , Page_Load);

function Page_Load()
{
    enterLoadingState4();

	var eventArgs = '';
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,updateCart_CallBack,this,null,null,null,null,0);
}

</script>

<div id="divCart">
</div>
<p align="right">
<asp:HyperLink class="verticalMiddle" ID="lnkCheckout" runat="server">
    <asp:Image ID="imgCart" runat="server" ImageUrl="~/images/rt.gif"></asp:Image>
    <font class="CommandButton"><%=Localize("Checkout")%></font>
</asp:HyperLink>
</p>
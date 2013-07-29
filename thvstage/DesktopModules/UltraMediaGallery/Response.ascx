<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Response.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Response" %>
<script type="text/javascript">
    UPG_listen("showComment");
</script>

<p class="Head"><asp:Label ID="Label1" runat="server" resourcekey="Response"></asp:Label>
    </p>
<div id="divComments" class="ItemGroup">
</div>
<p class="Head">
    <asp:Label ID="Label2" runat="server" resourcekey="AddYourResponse"></asp:Label></p>
<asp:Panel ID="pnlNameEmail" runat="server" CssClass="Normal">
    <%=Localize("Name") %>
    :
    <input type="text" id="txtName" width="150" class="NormalTextBox" />
    <%=Localize("Email") %>
    :
    <input type="text" id="txtEmail" width="150" class="NormalTextBox" />
    <div class="Script2">
        <%=Localize("EmailIsHidden")%>
    </div>
</asp:Panel>
<p>
    <textarea id="txtComment" style="width: 340px" rows="5" class="NormalTextBox" onfocus="if (this.value=='<%=Localize("CommentInstruction")%>')this.value='';"><%=Localize("CommentInstruction")%></textarea>
</p>
<p>
    <input onclick="postComment();" id="btnPost" type="button" value="<%=Localize("Post")%>"
        disabled class="Normal" />
</p>
<asp:Panel ID="pnlPostComment" runat="server">

    <script language="javascript">
function postComment()
{
	var txtComment = document.getElementById("txtComment");
	if (txtComment.value.trim() == '')
	{
		return false;
	}
	
	var txtName = document.getElementById("txtName");
	var txtEmail = document.getElementById("txtEmail");
	var extraArgs = "";
	if (txtName && txtEmail)
	{
	    //Guest!
	    if (txtName.value.trim().length < 3 || txtEmail.value.trim().length < 6)
	    {
	        alert("<%=Localize("NameAndEmailRequired")%>");
	        return;
	    }
	    extraArgs =  "|" + txtName.value.trim()  + "|" + txtEmail.value.trim() ;
	}
    
	var eventArgs = "post|" + currentPhotoId + "|" + document.getElementById("txtComment").value+ extraArgs;
	//enterLoadingState();
	document.getElementById("btnPost").disabled = true;
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,postComment_CallBack,this,showComment_CallBackError,null,null,null,0);
}

function discardComment()
{
	document.getElementById("txtComment").value = "";
}

function deleteComment(itemId)
{
	if (!window.confirm("<%=Localize("DeleteItem") %>"))
	{
		return;
	}
	var eventArgs = 'delete|' + itemId;
	enterLoadingState();
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,deleteComment_CallBack,this,showComment_CallBackError,null,null,null,0);
}

function postComment_CallBack(result, ctx)
{
	document.getElementById("btnPost").disabled = false;
	if (result != "")
	{ 
		alert(result);
		return;
	}  
	
	discardComment();
	showComment();
}

function deleteComment_CallBack(result, ctx)
{
	if (result != "")
	{ 
		alert(result);
		return;
	}  
	
	showComment(currentPage);
}

function getInnerText(obj)
{
  return document.all?obj.innerText:obj.textContent;
}

function quoteComment(elementId, author)
{
    var element = document.getElementById(elementId);
    //var html = "\n[QUOTE]" + author + " <%=Localize("says") %>:<br>" + getInnerText(element) + "[/QUOTE]";
    var html = "[QUOTE]" + author + " <%=Localize("says") %>:<br>" + element.innerHTML + "[/QUOTE]\n";

    var txtComment = document.getElementById("txtComment");
    txtComment.value = html;
    txtComment.focus();
}
    </script>

</asp:Panel>
<asp:Label ID="lblLoginToComment" runat="server" Visible="false" resourcekey="LoginToComment" CssClass="Normal"></asp:Label>
<asp:Panel ID="pnlShowComment" runat="server">

<script language="javascript">
var currentPage = 0;

function showComment(page)
{
    if (!page)
    {
        page = 0;
    }
	currentPage = page;
	enterLoadingState();
	var eventArgs = 'load|' + currentPhotoId + '|' + currentPage;
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,showComment_CallBack,this,showComment_CallBackError,null,null,null,0);
    
    var btnPost = document.getElementById("btnPost");
    if (btnPost && btnPost.disabled)
        btnPost.disabled = false;
}

function showComment_CallBack(result, ctx)
{
	ClientBind(result);
}

function showComment_CallBackError(result, ctx)
{
    var btnPost = document.getElementById("btnPost");
    if (btnPost && btnPost.disabled)
        btnPost.disabled = false;
	alert(result);
}

function ClientBind(comments)
{
    var commentsData;
    if (comments.indexOf("|") > 0)
    {
        var arr = comments.split("|");
        commentsData = arr[1];
        var info = arr[0].split("%");
        var txtName = document.getElementById("txtName");
	    var txtEmail = document.getElementById("txtEmail");
	    if (txtName.value == "") txtName.value = info[0];
	    if (txtEmail.value == "") txtEmail.value = info[1];
    }
    else
    {
        commentsData = comments;
    }
    document.getElementById("divComments").innerHTML = commentsData;
}

function enterLoadingState()
{
	var loading = "<div align=center><br><img src='<%=ResolveUrl("~/DesktopModules/UltraMediaGallery/images/loading.gif") %>'><p class='SubHead'><%=Localize("Loading") %><br></div>";
	document.getElementById("divComments").innerHTML = loading;
}
    </script>

</asp:Panel>

<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PhotoCalendar.ascx.vb" Inherits="BizModules.UltraPhotoGallery.PhotoCalendar" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<table width="100%" border="0">
	<tr>
		<td class="Head" align="center" width="10%"><asp:linkbutton id="lnkPreviousMonth" runat="server" DESIGNTIMEDRAGDROP="408"></asp:linkbutton></td>
		<td class="Head" align="center"><asp:linkbutton id="lnkCurrentMonth" runat="server"></asp:linkbutton><asp:label id="lblCurrentMonth" runat="server"></asp:label></td>
		<td class="Head" align="center" width="10%"><asp:linkbutton id="lnkNextMonth" runat="server" DESIGNTIMEDRAGDROP="408"></asp:linkbutton></td>
	</tr>
</table>
<table style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid"
	cellSpacing="0" cellPadding="2" width="100%" border="0">
	<tr>
		<%=WeekCalendarHeader%>
		<td class="Weekday" align="center" height="20"><font class="Head"><%=Localize("Sunday")%></font></td>
		<td class="Weekday" align="center"><font class="Head"><%=Localize("Monday")%></font></td>
		<td class="Weekday" align="center"><font class="Head"><%=Localize("Tuesday")%></font></td>
		<td class="Weekday" align="center"><font class="Head"><%=Localize("Wednesday")%></font></td>
		<td class="Weekday" align="center"><font class="Head"><%=Localize("Thursday")%></font></td>
		<td class="Weekday" align="center"><font class="Head"><%=Localize("Friday")%></font></td>
		<td class="Weekday" align="center"><font class="Head"><%=Localize("Saturday")%></font></td>
	</tr>
	<asp:repeater id="lstCalendar" runat="server">
		<ItemTemplate>
			<%=LineStart%>
			<%# Container.DataItem.CellText%>
			<%=LineEnd%>
		</ItemTemplate>
	</asp:repeater></table>

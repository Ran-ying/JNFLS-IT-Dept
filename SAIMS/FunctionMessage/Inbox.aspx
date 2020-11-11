<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="FunctionMessage_Inbox" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {background-image:url(../Images/microicons/xiaoxi1.png);
font-family: 微软雅黑,黑体;
        }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%">
    <tr><td class="auto-style1"><table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #2db036;">
<td>收件箱</td></tr></table><br />
        </td></tr>
    <tr><td class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="View.aspx?ID={0}" Text="查看" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="发起人" HeaderText="发起人" SortExpression="发起人" />
                <asp:BoundField DataField="收件人" HeaderText="收件人" SortExpression="收件人" />
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                <asp:CheckBoxField DataField="已读" HeaderText="已读" SortExpression="已读" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [ID], [发起人], [日期], [已读], [收件人] FROM [消息] WHERE (([可见] = @可见) AND ([收件人] = @收件人))">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="可见" Type="Boolean" />
                <asp:SessionParameter Name="收件人" SessionField="usersname" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </td></tr>
    
    
    <tr><td class="auto-style1"></td></tr>
</table>
    </form>
</body>
</html>

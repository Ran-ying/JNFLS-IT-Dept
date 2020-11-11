<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examine.aspx.cs" Inherits="FunctionRecommendedSM_examine" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">        body {
            background-image: url(../Images/microicons/baosongsheng1.png);
            font-family: 微软雅黑,黑体;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"><Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
    <div>
        <asp:GridView Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="text-align: center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="view.aspx?id={0}" Text="审批" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="分类" HeaderText="分类" SortExpression="分类" />
                <asp:CheckBoxField DataField="是否审批" HeaderText="是否审批" SortExpression="是否审批" />
                <asp:CheckBoxField DataField="是否完成" HeaderText="是否完成" SortExpression="是否完成" />
                <asp:BoundField DataField="申请者" HeaderText="申请者" SortExpression="申请者" />
                <asp:BoundField DataField="成就" HeaderText="成就" SortExpression="成就" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [ID], [分类], [是否审批], [是否完成], [申请者], [成就] FROM [保送生分目标] WHERE ([是否审批] = @是否审批)">
            <SelectParameters>
                <asp:Parameter DefaultValue="false" Name="是否审批" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="FunctionRecommendedSM_list" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {
            background-image: url(../Images/microicons/baosongsheng1.png);
            font-family: 微软雅黑,黑体;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
    <div style="text-align: center">
    
        <br />
        <table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #cb0000;">
<td>个人企划分目标列表</td></tr></table><asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="finish.aspx?id={0}" Text="完成目标" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="标题" HeaderText="标题" SortExpression="标题" />
                <asp:BoundField DataField="分类" HeaderText="分类" SortExpression="分类" />
                <asp:CheckBoxField DataField="是否完成" HeaderText="是否完成" SortExpression="是否完成" />
                <asp:CheckBoxField DataField="是否审批" HeaderText="是否审批" SortExpression="是否审批" />
<asp:BoundField DataField="申请者" HeaderText="申请者" SortExpression="申请者"></asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [分类], [申报描述], [是否完成], [是否审批], [ID], [申请者], [标题] FROM [保送生分目标] WHERE ([申请者] = @申请者)">
            <SelectParameters>
                <asp:SessionParameter Name="申请者" SessionField="名字" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

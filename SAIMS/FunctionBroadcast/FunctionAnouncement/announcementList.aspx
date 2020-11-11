<%@ Page Language="C#" AutoEventWireup="true" CodeFile="announcementList.aspx.cs" Inherits="FunctionAnouncement_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/gonggao1.png);}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%" height="100%" align="center">
    <tr >
        <td>
 <table width="100%" height="100%">
    <tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #3d8867;">
         <td>公告列表</td>
    </tr></table>
        </td></tr>
    <tr><td>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            EmptyDataText="没有可显示的数据记录。" ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" Height="100%" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="查看公告"  />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ID" />
                <asp:BoundField DataField="部门" HeaderText="部门" SortExpression="部门" />
                <asp:BoundField DataField="名字" HeaderText="名字" SortExpression="名字" />
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                <asp:BoundField DataField="标题" HeaderText="标题" SortExpression="标题" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White"  />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
            DeleteCommand="DELETE FROM [公告] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [公告] ([部门], [名字], [内容], [日期], [标题]) VALUES (@部门, @名字, @内容, @日期, @标题)" 
            ProviderName="<%$ ConnectionStrings:Main1ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [部门], [名字], [内容], [日期], [标题] FROM [公告]" 
            UpdateCommand="UPDATE [公告] SET [部门] = @部门, [名字] = @名字, [内容] = @内容, [日期] = @日期, [标题] = @标题 WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="部门" Type="String" />
                <asp:Parameter Name="名字" Type="String" />
                <asp:Parameter Name="内容" Type="String" />
                <asp:Parameter Name="日期" Type="DateTime" />
                <asp:Parameter Name="标题" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="部门" Type="String" />
                <asp:Parameter Name="名字" Type="String" />
                <asp:Parameter Name="内容" Type="String" />
                <asp:Parameter Name="日期" Type="DateTime" />
                <asp:Parameter Name="标题" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
   

        </td></tr>
    <tr><td style="text-align: center">

        <asp:Button ID="AddBtn" runat="server" Text="新 增" onclick="Add_Click" Height="41px" Width="102px" />

        </td></tr>
</table>
    </form>
</body>
</html>

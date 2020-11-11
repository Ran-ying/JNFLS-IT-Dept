<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zjcpage.aspx.cs" Inherits="济南外国语学校高中部综合考勤系统.zjcpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        您好<asp:Label ID="happy" runat="server" Text="！"></asp:Label>
    
        <br />
        <table class="auto-style1">
            <tr>
                <td>查询教师是否签到：<br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="值" DataValueField="值">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [时代] WHERE ([类型] = @类型)">
            <SelectParameters>
                <asp:Parameter DefaultValue="年级" Name="类型" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="值" DataValueField="值">
        </asp:DropDownList>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [时代] WHERE ([类型] = @类型)">
            <SelectParameters>
                <asp:Parameter DefaultValue="班级" Name="类型" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        开始<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    
        结束<asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
    
        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
        <br />
    
                </td>
                <td>
        <br />
    
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
    
                    这是教师的签到记录<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource3">
        </asp:GridView>
    
                    这是当前时间段内未到的学生<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="id号" HeaderText="id号" SortExpression="id号" />
                <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

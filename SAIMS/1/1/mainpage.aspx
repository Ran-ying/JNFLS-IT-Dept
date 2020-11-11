<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="济南外国语学校高中部综合考勤系统.mainpage" %>

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
                <td>您的学生:<br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="姓名" DataValueField="Id">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
    
        <br />
        您的时间：<br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="时间" DataValueField="小时">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [时间]"></asp:SqlDataSource>
    
        <br />
        <asp:Button ID="go" runat="server" Text="提交" OnClick="go_Click" />
    
        <br />
                </td>
                <td>
        <br />
        查询：<br />
        开始<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br />
        结束<asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" />
        <br />
    
                </td>
                <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="id号" HeaderText="id号" SortExpression="id号" />
                <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

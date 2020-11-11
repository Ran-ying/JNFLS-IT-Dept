<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkfs.aspx.cs" Inherits="运动会出入场管理系统.checkfs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <title>出入场管理系统</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: 30pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
    
        <asp:Label ID="Label1" runat="server" style="font-size: 100px" Text="扣分和检录项目查询" Font-Names="Microsoft YaHei UI"></asp:Label>
                    <br />
        <br />
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:TextBox ID="number" runat="server" CssClass="auto-style2"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" style="font-size: 50pt" Text=""></asp:Label>
                </td>
                <td class="auto-style2" style="font-family: 'Microsoft YaHei UI'">正在检录项目</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="bjinfo" HorizontalAlign="Center" style="font-size: 20pt">
                        <Columns>
                            <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="bjinfo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ydyinfo" HorizontalAlign="Center" style="font-size: 20pt">
                        <Columns>
                            <asp:BoundField DataField="编号" HeaderText="编号" SortExpression="编号" />
                            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                            <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                            <asp:BoundField DataField="项目" HeaderText="项目" SortExpression="项目" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="ydyinfo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="bjkf" HorizontalAlign="Center" style="font-size: 20pt">
                        <Columns>
                            <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                            <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                            <asp:BoundField DataField="卡号" HeaderText="卡号" SortExpression="卡号" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="bjkf" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="ydykf" HorizontalAlign="Center" style="font-size: 20pt">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="卡号" HeaderText="卡号" SortExpression="卡号" />
                            <asp:BoundField DataField="编号" HeaderText="编号" SortExpression="编号" />
                            <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                            <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="ydykf" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="jlxm" HorizontalAlign="Center" style="font-size: 20pt">
                        <Columns>
                            <asp:BoundField DataField="项目" HeaderText="项目" SortExpression="项目" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="jlxm" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <br />
    <div>
    
    </div>
    </form>
</body>
</html>

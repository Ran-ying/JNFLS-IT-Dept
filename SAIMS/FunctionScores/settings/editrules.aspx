﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editrules.aspx.cs" Inherits="editrules" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="部门"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>主席团</asp:ListItem>
                        <asp:ListItem>团委会</asp:ListItem>
                        <asp:ListItem>监察部</asp:ListItem>
                        <asp:ListItem>学习部</asp:ListItem>
                        <asp:ListItem>自律部</asp:ListItem>
                        <asp:ListItem>卫生部</asp:ListItem>
                        <asp:ListItem>生活部</asp:ListItem>
                        <asp:ListItem>体育部</asp:ListItem>
                        <asp:ListItem>社团部</asp:ListItem>
                        <asp:ListItem>男宿部</asp:ListItem>
                        <asp:ListItem>女宿部</asp:ListItem>
                        <asp:ListItem>宣传部</asp:ListItem>
                        <asp:ListItem>文艺部</asp:ListItem>
                        <asp:ListItem>公物部</asp:ListItem>
                        <asp:ListItem>信息部</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="内容"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="部门"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                        <asp:ListItem>主席团</asp:ListItem>
                        <asp:ListItem>团委会</asp:ListItem>
                        <asp:ListItem>监察部</asp:ListItem>
                        <asp:ListItem>学习部</asp:ListItem>
                        <asp:ListItem>自律部</asp:ListItem>
                        <asp:ListItem>卫生部</asp:ListItem>
                        <asp:ListItem>生活部</asp:ListItem>
                        <asp:ListItem>体育部</asp:ListItem>
                        <asp:ListItem>社团部</asp:ListItem>
                        <asp:ListItem>男宿部</asp:ListItem>
                        <asp:ListItem>女宿部</asp:ListItem>
                        <asp:ListItem>宣传部</asp:ListItem>
                        <asp:ListItem>文艺部</asp:ListItem>
                        <asp:ListItem>公物部</asp:ListItem>
                        <asp:ListItem>信息部</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="内容"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="原因" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [原因], [ID] FROM [扣分原因] WHERE ([部门] = @部门)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="部门" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="删除" onclick="Button2_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">返回</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">退出登录</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

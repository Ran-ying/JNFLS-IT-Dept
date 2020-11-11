<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editclass.aspx.cs" Inherits="editclass" %>

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
        <table style="width: 100%;">
            <tr>
                <td>
                    &nbsp;
                    <asp:Label ID="Label1" runat="server" Text="选择年级"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
                        SelectCommand="SELECT [年级], [ID] FROM [年级]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Text="班级名称："></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Width="72px"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" Text="班"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Label ID="Label4" runat="server" Text="班级编号：（年级号-班级号，如1-1、1-11）"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox2" runat="server" Width="84px" ></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" 
                        Width="67px" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">返回</asp:LinkButton>
                </td>
                <td>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">退出登录</asp:LinkButton>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

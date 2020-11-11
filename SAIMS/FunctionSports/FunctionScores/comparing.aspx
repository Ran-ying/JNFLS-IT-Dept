<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comparing.aspx.cs" Inherits="FunctionScores_comparing" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;}
        .auto-style1 
        {
            height: 20px;
        }
        .auto-style2 {
            width: 993px;
        }
        .auto-style3 {
            height: 20px;
            width: 993px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"><Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <table style="width: 100%;">
    <tr>
        <td class="auto-style2">
            &nbsp;
            <asp:Label ID="Label1" runat="server" Text="选择年级"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [年级], [ID] FROM [年级]"></asp:SqlDataSource>
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            &nbsp;
            <asp:Label ID="Label2" runat="server" Text="选择时段"></asp:Label>
            <br />
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        </td>
        <td>
            <div id="tablediv" runat="server"></div>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            &nbsp;
        </td>
        <td class="auto-style1">
            &nbsp;
        </td>
        <td class="auto-style1">
            &nbsp;
        </td>
    </tr>
</table>
    </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>

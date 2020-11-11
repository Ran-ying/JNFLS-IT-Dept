<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="FunctionAttendanceManaging_view" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {background-image:url(../Images/microicons/kaoqin1.png);font-family: 微软雅黑,黑体; 
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
    <tr><td class="auto-style1">查看申请信息</td></tr>
    <tr><td class="auto-style1">
        <asp:TextBox ID="TextBox1" runat="server" Height="119px" TextMode="MultiLine" Width="267px" ReadOnly="True"></asp:TextBox>
        </td></tr>
    <tr><td class="auto-style1">
        <asp:Button ID="agree" runat="server" OnClick="agree_Click" Text="同意" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="return" runat="server" Text="返回" />
        </td></tr>
    <tr><td class="auto-style1"></td></tr>
    <tr><td class="auto-style1"></td></tr>
    <tr><td class="auto-style1"></td></tr>
</table>
    </form>
</body>
</html>

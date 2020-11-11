<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Start.aspx.cs" Inherits="FunctionRecommendedSM_Start" %>

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
        .auto-style1 {
            height: 20px;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%">
    <tr><td><table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #cb0000;">
<td>开启目标</td></tr></table></td></tr>
        <tr><td class="auto-style1">目标名称<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td></tr>

        <tr><td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="开启目标！" />
            </td></tr>

        <tr><td></td></tr>


</table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="FunctionMessage_View" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {background-image:url(../Images/microicons/xiaoxi1.png);
font-family: 微软雅黑,黑体;
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
        <tr><td class="auto-style1"><table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #2db036;">
<td>我的消息</td></tr></table></td></tr>
        <tr><td class="auto-style1">发件人:<asp:Label ID="label_addressor" runat="server"></asp:Label>
&nbsp;日期:<asp:Label ID="label_date" runat="server"></asp:Label>
&nbsp;状态:<asp:Label ID="label_state" runat="server"></asp:Label>
            </td></tr>
        <tr><td class="auto-style1">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="500" Height="106px" ReadOnly="True"></asp:TextBox>
            </td></tr>
        <tr><td class="auto-style1">
            <a href=reply.aspx><asp:Button ID="reply" runat="server" Height="27px" Text="回复" Width="77px" OnClick="reply_Click" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="delete" runat="server" Height="26px"  Text="删除" Width="82px" OnClick="delete_Click" />
            </td></tr>
        <tr><td class="auto-style1"></td></tr>
    </table>
    </form>
</body>
</html>

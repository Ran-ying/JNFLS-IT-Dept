<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reply.aspx.cs" Inherits="FunctionMessage_reply" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {
            background-image: url(../Images/microicons/xiaoxi1.png);
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
<td>新消息</td></tr></table></td></tr>
        <tr><td class="auto-style1">收件人:<asp:TextBox ID="textbox_addressor" runat="server"></asp:TextBox>
            (账户)&nbsp;日期:<asp:Label ID="label_date" runat="server"></asp:Label>
            &nbsp;</td></tr>
        <tr><td class="auto-style1">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="500" Height="106px"></asp:TextBox>
            </td></tr>
        <tr><td class="auto-style1">
            <asp:Button ID="SEND" runat="server" Height="27px" Text="发送" Width="77px" OnClick="reply_Click" />
            </td></tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>

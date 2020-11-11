<%@ Page Language="C#" AutoEventWireup="true" CodeFile="finish.aspx.cs" Inherits="FunctionRecommendedSM_finish" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {
background-image:url(../Images/microicons/baosongsheng1.png);
font-family: 微软雅黑,黑体;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"><Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%">
    <tr><td class="auto-style2"><table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #cb0000;">
<td>提交完成报告</td></tr></table></td></tr>

    <tr><td class="auto-style1">成就：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td></tr>

    <tr><td class="auto-style1">证明材料</td></tr>

    <tr><td class="auto-style1"><CKEditor:CKEditorControl runat="server" ID="text1" Height="330px" OnTextChanged="Unnamed1_TextChanged"></CKEditor:CKEditorControl></td></tr>

    <tr><td class="auto-style1">
        <asp:Button ID="Button1" runat="server" Height="27px" OnClick="Button1_Click" Text="提交" Width="83px" />
        </td></tr>
</table>
    </form>
</body>
</html>

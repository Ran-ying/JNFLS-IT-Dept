<%@ Page Language="C#" AutoEventWireup="true" CodeFile="announcement.aspx.cs" Inherits="FunctionAnouncement_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {
            font-family: 微软雅黑,黑体;
        }
        .auto-style1 {
            font-size: x-large;
        }
    </style>
  
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%" height="100%">
    <tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
         <td center; background-color: #3D8867;">公告发布</td>
    </tr>
    <tr><td style="text-align: center"><span class="auto-style1"><strong>标题</strong></span>
        <asp:TextBox ID="titleTextBox" runat="server" Width="238px" style="margin-top: 0px" Height="18px"></asp:TextBox>
        <br />
        发布时间<asp:Label ID="publishDateTime" runat="server" Text=""></asp:Label>
&nbsp;公告ID<asp:Label ID="announceID" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td>

    <ckeditor:ckeditorcontrol ID="CKEditor1" runat="server" Height="400px"></ckeditor:ckeditorcontrol>

        </td></tr>
    <tr><td style="text-align: center">
                <asp:Button ID="msgSaveBtn" runat="server" Text="发布" 
            onclick="msgSaveBtn_Click" Height="44px" Width="125px" />
        
                <br />
        <asp:HiddenField ID="saveFlag" Value = "false" runat="server" />
        <asp:HiddenField ID="annouceFlag" Value = "add" runat="server" />
        
        </td></tr>
</table>
    </form>
</body>
</html>

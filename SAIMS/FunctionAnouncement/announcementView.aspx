<%@ Page Language="C#" AutoEventWireup="true" CodeFile="announcementView.aspx.cs" Inherits="FunctionAnouncement_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
          body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/gonggao1.png);}
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%" height="100%">
    <tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #3d8867;">
         <td><asp:Label ID="titleTextBox0" ReadOnly = "true" runat="server" Width="895px" style="text-align: center; font-size: xx-large; background-color: #3d8867;" Font-Bold="True" Font-Names="微软雅黑" ForeColor="White"></asp:Label>
         </td>
    </tr>
    <tr><td style="text-align: center">发布时间：<asp:Label ID="publishDateTime" runat="server" Width="200px" ReadOnly = "true"></asp:Label> 
    公告ID：
    <asp:Label ID="announceID" runat="server" ReadOnly = "true" Width="200px"></asp:Label> 
        </td></tr>
    <tr><td>

    <CKEditor:CKEditorControl ID="CKEditor1"  ReadOnly="true" runat="server" 
            Height="500px" style="background-color: #6699FF"></CKEditor:CKEditorControl>

        </td></tr>
    <tr><td style="text-align: center">
        
        <asp:HiddenField ID="saveFlag" Value = "false" runat="server" />
        <asp:HiddenField ID="annouceFlag" Value = "add" runat="server" />
       

        </td></tr>
</table>
    </form>
</body>
</html>

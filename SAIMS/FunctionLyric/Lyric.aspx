<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lyric.aspx.cs" Inherits="Lyric" %>
<%@ Register Src="TIME.ascx" TagName= "TIME"  TagPrefix="view"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>每周一歌 - 济南外国语学校校务综合管理系统</title>   
     <style type="text/css">
        body {font-family: 微软雅黑,黑体;}
     </style>


</head>
    <body>

    <form id="form1" runat="server">
<asp:Label ID="prev" runat="server" Text="--"></asp:Label>
<asp:Label ID="prst" runat="server" Text="---"></asp:Label>
<asp:Label ID="next" runat="server" Text="--"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
        </body>
</html>
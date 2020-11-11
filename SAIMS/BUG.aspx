<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BUG.aspx.cs" Inherits="BUG" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        

    <div style="text-align: center">
    
        于测试期间出现的BUG给您带来的不便表示抱歉，<br />
        请提交对BUG的详细描述使我们尽快修复问题，<br />
        我们将会逐步完善您的用户体验，谢谢！<br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="171px" TextMode="MultiLine" Width="434px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Height="35px" OnClick="Button1_Click" Text="提交" Width="130px" />
    
    </div>
    </form>
</body>
</html>

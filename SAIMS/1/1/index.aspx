<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="济南外国语学校高中部综合考勤系统.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        济南外国语学校高中部综合考勤系统<br />
        <br />
    
        登陆<br />
        用户名：<asp:TextBox ID="loginusername" runat="server"></asp:TextBox>
        <br />
        密码：<asp:TextBox ID="loginpassword" type="password" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="loginButton" runat="server" Text="登陆" OnClick="loginButton_Click" />
    
    </div>
    </form>
</body>
</html>

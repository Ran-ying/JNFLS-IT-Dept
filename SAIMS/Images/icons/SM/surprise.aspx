<%@ Page Language="C#" AutoEventWireup="true" CodeFile="surprise.aspx.cs" Inherits="Images_icons_SM_surprise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        执行语句：<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" ReadOnly="True" Width="620px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Height="26px" OnClick="Button1_Click" Text="GO!" Width="87px" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Height="25px" OnClick="Button2_Click" Text="开启！" Width="88px" />
    
    </div>
    </form>
</body>
</html>

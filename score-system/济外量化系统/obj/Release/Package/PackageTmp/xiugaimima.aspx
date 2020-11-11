<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xiugaimima.aspx.cs" Inherits="济外量化系统.xiugaimima" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        编码：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        原密码：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        新密码：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">返回首页</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>

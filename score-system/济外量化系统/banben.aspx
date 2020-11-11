<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="banben.aspx.cs" Inherits="济外量化系统.banben" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">返回首页</asp:HyperLink>
        本次版本：<asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        更新人：<asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
        更新说明：<asp:Label ID="Label2" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>

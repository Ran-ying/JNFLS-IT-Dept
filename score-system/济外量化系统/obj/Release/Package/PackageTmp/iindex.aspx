<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iindex.aspx.cs" Inherits="济外量化系统.iindex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style3 {
            height: 426px;
            width: 611px;
        }
        .auto-style2 {
            height: 50px;
            width: 411px;
        }
        .auto-style4 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
            <img alt="" class="auto-style3" src="未标题-4.png" />
            <br />
            <img alt="" class="auto-style2" src="未标题-3.png" />
            <br />
            <span class="auto-style4" style="font-family: &quot;Microsoft YaHei UI Light&quot;"><span class="auto-style4">量化管理系统</span><br />  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="cx"></asp:SqlDataSource>
            <br />
            </span></asp:Panel>

    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ydyjl.aspx.cs" Inherits="运动会出入场管理系统.ydyjl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="1.js"></script>
    <title>出入场管理系统</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        #Panel1 {
            display : none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1" style="font-family: &quot;Microsoft YaHei UI&quot;">
    
        <br />
    
        <asp:Panel ID="Panel12" runat="server">
            <div class="auto-style1">
                <span class="auto-style2">运动员检录</span><br class="auto-style2" /> <span class="auto-style2">项目:</span><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="auto-style2" DataSourceID="SqlDataSource1" DataTextField="项目" DataValueField="项目" Font-Names="Microsoft YaHei UI">
                </asp:DropDownList>
                <br />
                <span class="auto-style2">项目检录情况：</span><asp:Label ID="Label1" runat="server" style="font-size: xx-large" Text=""></asp:Label>
            </div>
        <div class="auto-style1">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="开始项目" Font-Names="Microsoft YaHei UI" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="结束项目" Font-Names="Microsoft YaHei UI" />
        </div>
        </asp:Panel>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [项目]"></asp:SqlDataSource>
    </form>
</body>
</html>

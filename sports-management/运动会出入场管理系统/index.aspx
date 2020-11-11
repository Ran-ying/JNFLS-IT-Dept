<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="运动会出入场管理系统.index" %>

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
            font-size: xx-large;
        }
        .auto-style2 {
            width: 696px;
            height: 100px;
        }
        .auto-style3 {
            width: 135px;
            height: 100px;
        }
        #Panel2 {
            display : none;
        }
        .auto-style4 {
            width: 100%;
        }
    </style>
</head>
<body style="text-align: center;">
    <form id="form1" runat="server">
    <div style="font-family: 'Microsoft YaHei UI'">
    
        <br />
        <asp:Panel ID="Panel1" runat="server">
        <img alt="" class="auto-style3" src="未标题-4.png" />
        <img alt="" class="auto-style2" src="未标题-3.png" /><br />
    
        <span class="auto-style1">济南外国语学校2017级团委学生会信息技术部</span><br class="auto-style1" />
        <span class="auto-style1">2018年秋季运动会出入场管理系统</span><br />
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Panel21" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Timer ID="Timer1" runat="server" Interval="100000" OnTick="Timer1_Tick">
            </asp:Timer>
        <br />
            <table class="auto-style4">
                <tr>
                    <td>&nbsp;</td>
                    <td style="width: 300px; height: 200px; border-style:solid; border-width: 2px; border-radius:25px;">
                        <asp:Label ID="Label1" runat="server" style="font-size: x-large"></asp:Label>
                        <br />
                        <br />
                        <asp:TextBox ID="number" runat="server" Height="40px" TextMode="Password" Width="250px" Visible="False"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" Font-Names="Microsoft YaHei UI" Height="40px" OnClick="Button1_Click" Text="登录" Width="250px" Visible="False" />
                        <br />
                        <asp:HyperLink ID="HyperLink2" NavigateUrl="~/dea.aspx" runat="server">系统制作者信息</asp:HyperLink>

                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
        <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>

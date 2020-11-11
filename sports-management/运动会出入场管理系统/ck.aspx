<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ck.aspx.cs" Inherits="运动会出入场管理系统.ydyc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <title>出入场管理系统</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style5 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1" style="font-family: 'Microsoft YaHei UI'">
    
        <br class="auto-style2" />
    
        <table class="auto-style5">
            <tr>
                <td>
    
        <asp:Label ID="Label1" runat="server" style="font-size: 100px" Text="出口"></asp:Label>
                    <br />
                    <asp:TextBox ID="number" runat="server" CssClass="auto-style2" ></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="刷卡" OnClick="Button1_Click" CssClass="auto-style2" Font-Names="Microsoft YaHei UI" />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" style="font-size: 25pt" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" style="font-size: 25pt" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" style="font-size: 25pt" Text=""></asp:Label>
                    <br />
                </td>
                <td>
                    <asp:Label ID="trf" runat="server" style="font-size: 50pt" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>

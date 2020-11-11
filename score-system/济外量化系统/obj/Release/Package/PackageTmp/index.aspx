<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="济外量化系统.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>量化管理系统</title>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <script src="jquery.js"></script>
    <style type="text/css">
        .auto-style2 {
            width: 289px;
            height: 35px;
        }
        .auto-style3 {
            width: 117px;
            height: 89px;
        }
        .auto-style4 {
            font-size: xx-large;
        }
        .auto-style5 {
            font-size: x-large;
        }
        #table,#TextBox1,#TextBox2,#Button1 {
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            border-radius:15px;
            font-size: x-large;
        }
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            height: 46px;
        }
        .新建样式1 {
            font-family: "Microsoft YaHei UI";
            height: 10px;
            width: 11px;
        }
        .auto-style8 {
            width: 100%;
            border-width: 15px;
        }
        #body {
            background-image:url(bg.jpg);
            background-repeat:no-repeat;
            background-size:100%;
            background-attachment:fixed;
        }
        .auto-style9 {
            height: 46px;
            text-align: center;
        }
    </style>
    <script>
        function SLIDE() {
            $('#Panel3').fadeOut('slow');
            $('#Panel1').fadeOut('slow');
            $("#background").animate({left:'250px'});
        }
    </script>
</head>
<body id="body">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
            <img alt="" class="auto-style3" src="未标题-4.png" />
            <br />
            <img alt="" class="auto-style2" src="未标题-3.png" />
            <br />
            <span class="auto-style4" style="font-family: &quot;Microsoft YaHei UI Light&quot;">量化管理系统<br />  
            <br />
            </span></asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            
        <table id="table" align="center">
            <tr>
                <td>
                    <asp:Panel ID="Panel2" runat="server" Height="200px" HorizontalAlign="Center" Width="300px" style="font-size: large">
                        <table align="center" class="auto-style8">
                            <tr>
                                <td style="font-size: x-large"><span class="auto-style5">
                                    <asp:HyperLink ID="banben" runat="server" NavigateUrl="~/banben.aspx">[banben]</asp:HyperLink>
                                    </span></td>
                            </tr>
                            <tr>
                                <td style="font-size: x-large"><span class="auto-style5">
                                    <asp:TextBox ID="TextBox1" runat="server" Height="40px" Width="250px"></asp:TextBox>
                                    </span></td>
                            </tr>
                            <tr>
                                <td style="font-size: x-large"><span class="auto-style5">
                                    <asp:TextBox ID="TextBox2" type ="password" runat="server" Height="40px" Width="250px"></asp:TextBox>
                                    </span></td>
                            </tr>
                            <tr>
                                <td style="font-size: x-large">
                                    <asp:Button ID="Button7" runat="server" Height="40px" OnClick="Button1_Click" OnClientClick="SLIDE();" Text="登录" Width="250px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
        <table align="center" class="auto-style6">
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style9" style="width: 250px"><asp:HyperLink ID="修改密码" NavigateUrl="~/xiugaimima.aspx" runat="server">修改密码</asp:HyperLink>
                    &nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Names="微软雅黑" NavigateUrl="~/systemmaker.aspx" BorderStyle="None" style="text-align: center; font-size: large;" Width="249px" >济南外国语学校<br />2017级团委学生会信息技术部
                        </asp:HyperLink>
                        </td>
                <td class="auto-style7"></td>
            </tr>
        </table>
                </td>
            </tr>
        </table>
        </asp:Panel>

    </div>
    </form>
</body>
</html>

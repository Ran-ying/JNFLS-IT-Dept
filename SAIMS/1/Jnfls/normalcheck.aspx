<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="normalcheck.aspx.cs" Inherits="Jnfls_server.normalcheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>济南外国语学校量化管理系统</title>
	<link rel="stylesheet" href="../css/normal.css" type="text/css" />
	<script src="../js/jquery.js"></script>
    <script src="../js/normal.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }
    </style>
</head>
<body onload="start()">
    <form id="form1" runat="server">
    <div>
        <div id="top">
            <div id="top_text">济南外国语学校量化管理系统</div>
            <hr id="top_hr" color="white"/>
        </div>

        <div id="main">
            
            <asp:Label ID="Label1" runat="server" Text="　　您好，请输入您的班级代号：" style="font-size:23px;"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="font-size:23px;"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="本周分数查询" OnClick="Button1_Click" CssClass="Button1" style="font-size:23px;"/>
            <asp:Button ID="Button2" runat="server" Text="上周分数查询" OnClick="Button2_Click" CssClass="Button1" style="font-size:23px;"/>
            <asp:Panel ID="Panel1" runat="server" Visible="false">       
            <asp:Label ID="Label22" runat="server" Text="　　您好，贵班本周的量化管理分数：" style="font-size:23px;"></asp:Label>
            <table class="auto-style1" style="font-size:20px;">
            <tr>
                <td>部门</td>
                <td>自律部</td>
                <td>卫生部</td>
                <td>男女宿</td>
                <td>体育部</td>
                <td>学习部</td>
                <td>文艺部</td>
                <td>生活部</td>
                <td>公物部</td>
                <td>总分</td>
            </tr>
            <tr>
                <td>分数</td>
                <td>
                    <asp:Label ID="zlfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="wsfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="nsfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="tyfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="xxfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="wyfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="shfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="gwfs" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="zfs" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>排名</td>
                <td>
                    <asp:Label ID="zlpm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="wspm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="nspm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="typm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="xxpm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="wypm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="shpm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="gwpm" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="zpm" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        </asp:Panel>
        </div>

        <div id="down">
            <a href="index.aspx" style="text-decoration:none; color:white">
		    济南外国语学校2017级团委学生会信息技术部
            </a>
            | Copyright © 2017 - 2020 IT Delt., All Rights Reserved
        </div>

    </div>
    </form>
</body>
</html>

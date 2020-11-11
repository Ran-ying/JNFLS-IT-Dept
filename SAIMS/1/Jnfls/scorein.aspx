<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="scorein.aspx.cs" Inherits="Jnfls_server.scorein" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>济南外国语学校量化管理系统</title>
	<link rel="stylesheet" href="css/scorein.css" type="text/css" />
	<script src="js/jquery.js"></script>
    <script src="js/scorein.js"></script>
</head>
<body onload="start()">
    <form id="form1" runat="server">
    <div>
    
        <div id="top">
            <div id="top_text">济南外国语学校量化管理系统</div>
            <hr id="top_hr" color="white"/>
        </div>

        <div id="main">
            <br />
            <asp:Label ID="nianji" runat="server" Text="　　年级：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="nianji1" runat="server" style="font-size:20px;"></asp:TextBox>
            <asp:Label ID="bumen" runat="server" Text="　　部门：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="bumen1" runat="server" style="font-size:20px;" Text="studentunion"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Text="　　时间：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="time" runat="server" style="font-size:20px;"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="　　分数：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="score" runat="server" style="font-size:20px;"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="　　班级：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="class1" runat="server" style="font-size:20px;"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="　　备注：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="beizhu" runat="server" style="font-size:20px;"></asp:TextBox>
            <br />　　
            <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" style="font-size:20px;"/>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Jnfls_server.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>济南外国语学校量化管理系统</title>
	<link rel="stylesheet" href="../css/index.css" type="text/css" />
	<script src="../js/jquery.js"></script>
    <script src="../js/index.js"></script>
</head>
<body onload="start()">
    <form id="form1" runat="server">
    <div>
        <div id="top">
            <div id="top_text">济南外国语学校量化管理系统</div>
            <hr id="top_hr" color="white"/>
        </div>

        <div id="main">
    <div id="news">
        <p class="main_text">公告</p>
        <div style="width:95%;position:absolute;left:2.5%">
        <asp:Label ID="Label1" runat="server" Text="欢迎来到济南外国语学校量化管理系统，最新公告查询中。" style="font-size:20px;"></asp:Label>
    </div>
        </div>
    <div id="teacher_check">
        <p class="main_text">教师查询</p>
        <p class="check_text">用户名：<asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox></p>
        <p class="check_text">密　码：<asp:TextBox ID="TextBox2" runat="server" type="password" CssClass="textbox"></asp:TextBox></p>
        <center><asp:Button ID="Button2" runat="server" Text="登陆" CssClass="check_button" OnClick="Button2_Click"/></center>
    </div>
    <div id="studentunion_check">
        <p class="main_text">团委学生会查询</p>
        <p class="check_text">用户名：<asp:TextBox ID="TextBox3" runat="server" CssClass="textbox"></asp:TextBox></p>
        <p class="check_text">密　码：<asp:TextBox ID="TextBox4" runat="server" type="password" CssClass="textbox"></asp:TextBox></p>
        <center><asp:Button ID="Button1" runat="server" Text="登陆" CssClass="check_button" OnClick="Button1_Click"/></center>
    </div>
    <div id="normal_check">
        <p class="main_text">普通查询</p>
        <center><asp:Button ID="Button3" runat="server" Text="进入查询入口" CssClass="check_button" OnClick="Button3_Click"/></center>
    </div>
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

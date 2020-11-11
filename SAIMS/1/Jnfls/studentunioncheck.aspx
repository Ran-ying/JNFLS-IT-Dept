<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentunioncheck.aspx.cs" Inherits="Jnfls_server.studentunioncheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>济南外国语学校量化管理系统</title>
	<link rel="stylesheet" href="../css/studentunion.css" type="text/css" />
	<script src="../js/jquery.js"></script>
    <script src="../js/studentunion.js"></script>
    <style type="text/css">
        .auto-style1 {
            font-size:16px;
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
            <asp:Label ID="Label1" runat="server" Text="　　您好，信息正在加载中……" style="font-size:21px;"></asp:Label>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="　　请输入查询时间：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="font-size:18px;width:15%"></asp:TextBox>　
            <asp:TextBox ID="TextBox2" runat="server" style="font-size:18px;width:15%"></asp:TextBox>　
            <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" style="font-size:20px;"/>
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                        <table class="auto-style1">
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">自律部</td>
                <td class="auto-style2">卫生部</td>
                <td class="auto-style2">男女宿</td>
                <td class="auto-style2">体育部</td>
                <td class="auto-style2">学习部</td>
                <td class="auto-style2">文艺部</td>
                <td class="auto-style2">生活部</td>
                <td class="auto-style2">公物部</td>
                <td class="auto-style2">总排名</td>
            </tr>
            <tr>
                <td>1班</td>
                <td><asp:Label ID="zlpm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm01" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>2班</td>
                <td><asp:Label ID="zlpm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm02" runat="server" Text=""></asp:Label></td>
            </tr>
                           
            <tr>
                <td>3班</td>
                <td><asp:Label ID="zlpm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm03" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>4班</td>
                <td><asp:Label ID="zlpm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm04" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>5班</td>
                <td><asp:Label ID="zlpm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm05" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>6班</td>
                <td><asp:Label ID="zlpm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm06" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>7班</td>
                <td><asp:Label ID="zlpm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm07" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>8班</td>
                <td><asp:Label ID="zlpm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm08" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>9班</td>
                <td><asp:Label ID="zlpm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm09" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>10班</td>
                <td><asp:Label ID="zlpm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm10" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>11班</td>
                <td><asp:Label ID="zlpm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm11" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>12班</td>
                <td><asp:Label ID="zlpm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm12" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>13班</td>
                <td><asp:Label ID="zlpm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm13" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>14班</td>
                <td><asp:Label ID="zlpm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm14" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>15班</td>
                <td><asp:Label ID="zlpm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm15" runat="server" Text=""></asp:Label></td>
                <td><asp:Button ID="Button1" runat="server" Text="查看分数" OnClick="Button1_Click" style="font-size:16px;"/></td>
            </tr>
            <tr>
                <td>16班</td>
                <td><asp:Label ID="zlpm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm16" runat="server" Text=""></asp:Label></td>
                
            </tr>
                                
        </table><br />
                
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false">

                
         <table class="auto-style1">
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">自律部</td>
                <td class="auto-style2">卫生部</td>
                <td class="auto-style2">男女宿</td>
                <td class="auto-style2">体育部</td>
                <td class="auto-style2">学习部</td>
                <td class="auto-style2">文艺部</td>
                <td class="auto-style2">生活部</td>
                <td class="auto-style2">公物部</td>
                <td class="auto-style2">总分</td>
            </tr>
            <tr>
                <td>1班</td>
                <td><asp:Label ID="zlfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs01" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs01" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>2班</td>
                <td><asp:Label ID="zlfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs02" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs02" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>3班</td>
                <td><asp:Label ID="zlfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs03" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs03" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>4班</td>
                <td><asp:Label ID="zlfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs04" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs04" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>5班</td>
                <td><asp:Label ID="zlfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs05" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs05" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>6班</td>
                <td><asp:Label ID="zlfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs06" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs06" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>7班</td>
                <td><asp:Label ID="zlfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs07" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs07" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>8班</td>
                <td><asp:Label ID="zlfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs08" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs08" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>9班</td>
                <td><asp:Label ID="zlfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs09" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs09" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>10班</td>
                <td><asp:Label ID="zlfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs10" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs10" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>11班</td>
                <td><asp:Label ID="zlfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs11" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs11" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>12班</td>
                <td><asp:Label ID="zlfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs12" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs12" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>13班</td>
                <td><asp:Label ID="zlfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs13" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs13" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>14班</td>
                <td><asp:Label ID="zlfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs14" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs14" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>15班</td>
                <td><asp:Label ID="zlfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs15" runat="server" Text=""></asp:Label></td>
                <td><asp:Button ID="Button3" runat="server" Text="查看排名" OnClick="Button3_Click" style="font-size:16px;" /></td>
            </tr>
            <tr>
                <td>16班</td>
                <td><asp:Label ID="zlfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wsfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nsfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="tyfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wyfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwfs16" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zfs16" runat="server" Text=""></asp:Label></td>
                
            </tr>
        </table><br />
                
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

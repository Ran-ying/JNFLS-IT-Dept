<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teachercheck.aspx.cs" Inherits="Jnfls_server.teachercheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>济南外国语学校量化管理系统</title>
	<link rel="stylesheet" href="../css/teacher.css" type="text/css" />
	<script src="../js/jquery.js"></script>
    <script src="../js/teacher.js"></script>
    <style type="text/css">
        .auto-style1 {
            border-style: solid;
            border-width: 1px;
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
            <asp:Label ID="Label1" runat="server" Text="　　您好，信息正在加载中……" style="font-size:21px;"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="　　请输入查询时间：" style="font-size:20px;"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="font-size:18px;width:15%"></asp:TextBox>　
            <asp:TextBox ID="TextBox2" runat="server" style="font-size:18px;width:15%"></asp:TextBox>　
            <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" style="font-size:20px;"/>
            <asp:Label ID="Label5" runat="server" Text="　　行数：" style="font-size:20px;"></asp:Label><asp:TextBox ID="TextBox60" runat="server" style="width:5%" Text="6"></asp:TextBox>

            <asp:Panel ID="Panel1" runat="server" Visible="false">
                
            <asp:Label ID="Label4" runat="server" Text="总体数据：" style="font-size:23px;"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="查看宏观排名" OnClick="Button1_Click" style="font-size:20px;"/>
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
                <td><asp:Label ID="zlfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="wsfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="nsfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="tyfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="xxfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="wyfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="shfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="gwfs" runat="server" Text="0"></asp:Label></td>
                <td><asp:Label ID="zfs" runat="server" Text="0"></asp:Label></td>
            </tr>
            <tr>
                <td>排名</td>
                <td><asp:Label ID="zlpm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wspm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="nspm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="typm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="xxpm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="wypm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="shpm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="gwpm" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="zpm" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
            <asp:Label ID="Label3" runat="server" Text="具体数据：" style="font-size:23px;"></asp:Label>
                <asp:Button ID="Button4" runat="server" Text="全部"  style="font-size:20px;" OnClick="Button4_Click"/>
                <asp:Button ID="Button5" runat="server" Text="自律部"  style="font-size:20px;" OnClick="Button5_Click"/>
                <asp:Button ID="Button6" runat="server" Text="卫生部"  style="font-size:20px;" OnClick="Button6_Click"/>
                <asp:Button ID="Button7" runat="server" Text="男宿部"  style="font-size:20px;" OnClick="Button7_Click"/>
                <asp:Button ID="Button8" runat="server" Text="女宿部"  style="font-size:20px;" OnClick="Button8_Click"/>
                <asp:Button ID="Button9" runat="server" Text="体育部"  style="font-size:20px;" OnClick="Button9_Click"/>
                <asp:Button ID="Button10" runat="server" Text="学习部"  style="font-size:20px;" OnClick="Button10_Click"/>
                <asp:Button ID="Button11" runat="server" Text="文艺部"  style="font-size:20px;" OnClick="Button11_Click"/>
                <asp:Button ID="Button12" runat="server" Text="生活部"  style="font-size:20px;" OnClick="Button12_Click"/>
                <asp:Button ID="Button13" runat="server" Text="公物部"  style="font-size:20px;" OnClick="Button13_Click"/>
         <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="6" AutoGenerateColumns="false" DataKeyNames="Id" DataSourceID="SqlDataSource1" style="font-size:23px;">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="扣分数" HeaderText="扣分数" SortExpression="扣分数" />
                <asp:BoundField DataField="扣分部门" HeaderText="扣分部门" SortExpression="扣分部门" />
                <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"></asp:SqlDataSource>

        </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false">
                        <table class="font-size:16px;">
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
                <td ><asp:Button ID="Button3" runat="server" Text="查看具体数据" OnClick="Button3_Click"  style="font-size:16px;"/></td>
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

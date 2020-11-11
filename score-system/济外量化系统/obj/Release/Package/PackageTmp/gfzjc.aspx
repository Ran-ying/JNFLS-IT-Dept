<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gfzjc.aspx.cs" Inherits="济外量化系统.gfzjc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>量化管理系统</title>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            vertical-align:top;
        }
        .auto-style5 {
            width: 133px;
        }
        .auto-style3 {
            width: 117px;
            height: 89px;
        }
        .auto-style2 {
            width: 289px;
            height: 35px;
        }
        .auto-style4 {
            font-size: xx-large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="maindiv">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" rowspan="3">
            <img alt="" class="auto-style3" src="未标题-4.png" />
            </td>
                <td>
            <img alt="" class="auto-style2" src="未标题-3.png" /></td>
            </tr>
            <tr>
                <td>
            <span class="auto-style4" style="font-family: &quot;Microsoft YaHei UI Light&quot;">量化管理系统</span></td>
            </tr>
            <tr>
                <td>
    
        <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="退出登录" />
                    <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="清除缓存" />
                    <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="提交BUG" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top">

                    <asp:Button ID="Button5" runat="server" Text="查看未处理分数" OnClick="Button5_Click" />
                    <br />
                    <asp:Button ID="Button6" runat="server" Text="添加信息部账号" OnClick="Button6_Click" />
                    <br />
                    <asp:Button ID="Button7" runat="server" Text="添加宿舍楼" OnClick="Button7_Click" />
                    <br />
                    <br />

                </td>
                <td class="zhongxin">
                    
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        查看未处理分数：<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="点击查看" />
                        <br />
                        （只能看最近15天的呢）<br />  
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                                <asp:BoundField DataField="扣分部门" HeaderText="扣分部门" SortExpression="扣分部门" />
                                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                                <asp:BoundField DataField="审核中" HeaderText="审核中" SortExpression="审核中" />
                                <asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" SortExpression="扣分人姓名" />
                                <asp:BoundField DataField="宿舍编号" HeaderText="宿舍编号" SortExpression="宿舍编号" />
                                <asp:BoundField DataField="床号" HeaderText="床号" SortExpression="床号" />
                                <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                                <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="确认删除" ShowHeader="True" Text="删除" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>"></asp:SqlDataSource>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                        添加信息部账号：<br /> 年级：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="添加账号" />
                        <br />
                        删除信息部账号：<br /> 
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="年级" DataValueField="年级">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [用户] WHERE ([身份] = @身份)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="信息技术部" Name="身份" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="删除账号" />
                        <br />
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                        添加宿舍楼：<br /> 部门：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                        年级：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />
                        楼号：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="添加宿舍楼" />
                        <br />
                        <br />
                        删除宿舍楼：<br /> 
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="部门" HeaderText="部门" SortExpression="部门" />
                                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                                <asp:BoundField DataField="楼号" HeaderText="楼号" SortExpression="楼号" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="删除" ShowHeader="True" Text="删除" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [宿舍楼]"></asp:SqlDataSource>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
        <br />
    
    </div>
    </form>
</body>
</html>

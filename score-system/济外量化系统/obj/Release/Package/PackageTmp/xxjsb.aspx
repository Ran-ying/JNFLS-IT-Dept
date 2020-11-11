<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xxjsb.aspx.cs" Inherits="济外量化系统.xxjsb" %>

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

                    <asp:Button ID="Button6" runat="server" Text="查看未处理分数" OnClick="Button6_Click" />
                    <br />
                    <asp:Button ID="Button7" runat="server" Text="公告编写" OnClick="Button7_Click" />
                    <br />
                    <asp:Button ID="Button8" runat="server" Text="学生会账号编辑" OnClick="Button8_Click" />
                    <br />
                    <asp:Button ID="Button9" runat="server" Text="班主任账号编辑" OnClick="Button9_Click" />
                    <br />
                    <asp:Button ID="Button10" runat="server" Text="宿舍楼编辑" OnClick="Button10_Click" />

                </td>
                <td class="zhongxin">

                    <asp:Panel ID="Panel1" runat="server" Visible="False">
                        查看未处理分数：<asp:Button ID="Button5" runat="server" Text="点击查看" OnClick="Button5_Click" />
                        <br />
                        （只能看最近15天的呢）<br /> 
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource7" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
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
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>"></asp:SqlDataSource>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        公告编写：<br /> 版本：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        内容：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" />
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" Visible="False">
                        添加学生会账号：<br /> 部门：<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="区域" DataValueField="编号">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [做卡表] WHERE 卡类型 = '团委会' OR 卡类型 = '学生会'"></asp:SqlDataSource>
                        职务：<asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem Value="0">书记</asp:ListItem>
                            <asp:ListItem Value="1">副书记</asp:ListItem>
                            <asp:ListItem Value="2">组织委员</asp:ListItem>
                            <asp:ListItem Value="3">主席</asp:ListItem>
                            <asp:ListItem Value="4">副主席</asp:ListItem>
                            <asp:ListItem Value="5">秘书长</asp:ListItem>
                            <asp:ListItem Value="6">秘书</asp:ListItem>
                            <asp:ListItem Value="7">部长</asp:ListItem>
                            <asp:ListItem Value="8">副部长</asp:ListItem>
                            <asp:ListItem Value="9">干事</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        姓名：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="添加" />
                        <br />
                        <br />
                        <div>
                            <div id="qrcode">
                            </div>
                            <div id="h">
                                <canvas id="myCanvas"></canvas>
                            </div>
                        </div>
                        <script src="jquery-1.10.2.min.js">
</script>
                        <script src="jquery.qrcode.min.js" type="text/javascript">
</script>
                        <br />
                        <br />
                        删除学生会账号:<br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="编码" HeaderText="编码" SortExpression="编码" />
                                <asp:BoundField DataField="区域" HeaderText="区域" SortExpression="区域" />
                                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="删除" ShowHeader="True" Text="删除" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [用户] WHERE (([年级] = @年级) AND (([身份] LIKE '%' + @身份 + '%') OR ([身份] LIKE '%' + @身份2 + '%')))">
                            <SelectParameters>
                                <asp:SessionParameter Name="年级" SessionField="年级" Type="Int32" DefaultValue="" />
                                <asp:Parameter DefaultValue="学生会" Name="身份" Type="String" />
                                <asp:Parameter DefaultValue="秘书处" Name="身份2" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    <asp:Panel ID="Panel4" runat="server" Visible="False">
                        添加班主任账号：<br /> 班级：<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="区域" DataValueField="编号">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [做卡表] WHERE ([区域] LIKE '%' + @区域 + '%')">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="班" Name="区域" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        姓名：<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="添加" />
                        <br />
                        删除班主任账号：<br /> 
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" DataSourceID="SqlDataSource4">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="编码" HeaderText="编码" SortExpression="编码" />
                                <asp:BoundField DataField="身份" HeaderText="身份" SortExpression="身份" />
                                <asp:BoundField DataField="区域" HeaderText="区域" SortExpression="区域" />
                                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                                <asp:BoundField DataField="跳转" HeaderText="跳转" SortExpression="跳转" />
                                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="删除" ShowHeader="True" Text="删除" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [用户] WHERE (([年级] = @年级) AND ([身份] LIKE '%' + @身份 + '%'))">
                            <SelectParameters>
                                <asp:SessionParameter Name="年级" SessionField="年级" Type="Int32" />
                                <asp:Parameter DefaultValue="班主任" Name="身份" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="Panel5" runat="server" Visible="False">
                        添加宿舍：<br /> 楼号：<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="年级" DataValueField="年级">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [用户] WHERE ([身份] = @身份)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="宿舍管理部" Name="身份" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        宿舍号：<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <br />
                        床号：<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <br />
                        班级：<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="区域" DataValueField="区域">
                        </asp:DropDownList>
                        <br />
                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="添加" />
                        <br />
                        <br />
                        删除宿舍：<br /> 
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" DataSourceID="SqlDataSource6">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                                <asp:BoundField DataField="宿舍编号" HeaderText="宿舍编号" SortExpression="宿舍编号" />
                                <asp:BoundField DataField="床号" HeaderText="床号" SortExpression="床号" />
                                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                                <asp:BoundField DataField="楼号" HeaderText="楼号" SortExpression="楼号" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="删除" ShowHeader="True" Text="删除" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [宿舍表] WHERE ([年级] = @年级)">
                            <SelectParameters>
                                <asp:SessionParameter Name="年级" SessionField="年级" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    <br />
                </td>
            </tr>
        </table>
    
        <br />
    
    </div>
    </form>
</body>
</html>

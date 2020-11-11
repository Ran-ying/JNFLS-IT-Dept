<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptxsh.aspx.cs" Inherits="济外量化系统.ptxsh" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>量化管理系统</title>
		<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
		<script src="jquery-1.9.1.js"></script>
		<script src="ui/jquery.ui.core.js"></script>
		<script src="ui/jquery.ui.widget.js"></script>		
		<script src="ui/jquery.ui.mouse.js"></script>
		<script src="ui/jquery.ui.resizable.js"></script>
		<link rel="stylesheet" href="demos.css">
		<script language="javascript">
		    //jquery的网页加载完成回调函数
		    $(function () {
		        $("#TextBox4").resizable();//使层可改变尺寸
		    });
		    $(function () {
		        $("#TextBox5").resizable();//使层可改变尺寸
		    });
		</script>
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
        .auto-style6 {
            height: 50px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id ="maindiv">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" rowspan="3">
            <img alt="" class="auto-style3" src="未标题-4.png" />
            </td>
                <td>
            <img alt="" class="auto-style2" src="未标题-3.png" /></td>
            </tr>
            <tr>
                <td class="auto-style6">
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

                    <asp:Button ID="Button9" runat="server" Text="输入分数" OnClick="Button9_Click" />
                    <br />
                    <asp:Button ID="Button6" runat="server" Text="修改扣分原因" OnClick="Button6_Click" />
                    <br />
                    <asp:Button ID="Button7" runat="server" Text="扣分查询" OnClick="Button7_Click" />
                    <br />
                    <asp:Button ID="Button8" runat="server" Text="处理申诉" OnClick="Button8_Click" />
                    <br />
                    <br />

                </td>
                <td class="zhongxin">
                    
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        输入分数<br /> 日期：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        （YYYYMMDD）<br /> 
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>">
                        </asp:SqlDataSource>
                        <table>
                            <tr>
                                <td>班级：<asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource2" DataTextField="区域" DataValueField="区域" Height="231px" SelectionMode="Multiple"></asp:ListBox>
                                </td>
                                <td>原因：<asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="原因" DataValueField="原因" Height="225px" SelectionMode="Multiple"></asp:ListBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>"></asp:SqlDataSource>
                        <br />
                        扣分：<asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        备注：<asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="提交" />
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                        扣分原因修改<br /> 输入扣分原因：<br /> 
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" />
                        <br />
                        删除扣分原因：<br /> 
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="原因" DataValueField="原因">
                        </asp:DropDownList>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go！" />
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                        扣分查询<br /> 时间从：<asp:TextBox ID="timefrom" runat="server"></asp:TextBox>
                        到：<asp:TextBox ID="timeto" runat="server"></asp:TextBox>
                        （YYYYMMDD）<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="点击查询（全部班级）" />
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                                <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                                <asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" SortExpression="扣分人姓名" />
                                <asp:BoundField DataField="扣分部门" HeaderText="扣分部门" SortExpression="扣分部门" />
                                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                                <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>"></asp:SqlDataSource>
                    </asp:Panel>
                    <asp:Panel ID="Panel4" runat="server" Visible="false">
                        处理申诉（只能看近15天的哦）<asp:Button ID="Button4" runat="server" Text="查看申诉" OnClick="Button4_Click"  />
                        <br />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                                <asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" SortExpression="扣分人姓名" />
                                <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                                <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="确认" ShowHeader="True" Text="确认" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>"></asp:SqlDataSource>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
        <br />
    
    </div>
    </form>
</body>
</html>

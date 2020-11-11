<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ssxsh.aspx.cs" Inherits="济外量化系统.ssxsh" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>量化管理系统</title>
		<!--  引入必要的js和css文件 -->
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
		        $("#TextBox8").resizable();//使层可改变尺寸
		    });
		</script>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <style type="text/css">

        .auto-style1 {
            width: 100%;
            vertical-align:top;
        }
        .auto-style3 {
            width: 117px;
            height: 89px;
        }
        .auto-style2 {
            width: 289px;
            height: 35px;
        }
        .auto-style6 {
            height: 50px;
            text-align: center;
            font-family: "Microsoft YaHei UI Light";
            font-size: xx-large;
        }
        .auto-style8 {
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="maindiv">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style8">
            <img alt="" class="auto-style3" src="未标题-4.png" /><br />
            <img alt="" class="auto-style2" src="未标题-3.png" /></td>
            </tr>
            <tr>
                <td class="auto-style6">
                    量化管理系统</td>
            </tr>
            <tr>
                <td style="text-align: center">
    
        <asp:Label ID="Label1" runat="server"></asp:Label>

                    <br />

                    <asp:Button ID="Button5" runat="server" Text="输入分数" OnClick="Button5_Click" />
                    <asp:Button ID="Button6" runat="server" Text="修改扣分原因" OnClick="Button6_Click" />
                    <asp:Button ID="Button7" runat="server" Text="扣分查询" OnClick="Button7_Click" />
                    <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="退出登录" />
                </td>
            </tr>
            <tr>
                <td class="zhongxin">
                    
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        
                                
                                    <div class="auto-style8">
                                        命令行输分：<br /> 扣分时间：<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                        （YYYYMMDD）<br /> 扣分原因：<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="原因" DataValueField="原因" Width="274px" Height="16px">
                                        </asp:DropDownList>
                                        <br />
                                    </div>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [扣分原因表] WHERE (([年级] = @年级) AND ([部门] = @部门))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="年级" SessionField="年级" Type="Int32" />
                                            <asp:SessionParameter Name="部门" SessionField="区域" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="auto-style8">
                                        <br />
                                        <asp:TextBox ID="TextBox8" runat="server" class="ui-widget-content" Height="172px" TextMode="MultiLine" Width="268px"></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="提交" Height="58px" Width="92px" />
                                        <br />
                                    </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                        扣分原因修改<br /> 输入扣分原因：<br /> 
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" />
                        <br />
                        删除扣分原因：<br /> 
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="原因" DataValueField="原因">
                        </asp:DropDownList>
                        <asp:Button ID="Button2" runat="server" Text="删除" OnClick="Button2_Click"/>
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                        扣分查询<br /> 时间从：<asp:TextBox ID="timefrom" runat="server"></asp:TextBox>
                        到：<asp:TextBox ID="timeto" runat="server"></asp:TextBox>
                        （YYYYMMDD）<br />
                        <asp:Button ID="chaxun" runat="server" OnClick="chaxun_Click" Text="点击查询" />
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" SortExpression="扣分人姓名" />
                                <asp:BoundField DataField="宿舍编号" HeaderText="宿舍编号" SortExpression="宿舍编号" />
                                <asp:BoundField DataField="床号" HeaderText="床号" SortExpression="床号" />
                                <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                                <asp:BoundField DataField="有效" HeaderText="有效" SortExpression="有效" />
                                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                                <asp:BoundField DataField="扣分部门" HeaderText="扣分部门" SortExpression="扣分部门" />
                                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                                <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>">
                        </asp:SqlDataSource>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="Panel4" runat="server" Visible="false">
                        处理申诉（只能看近15天的哦）<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="查看申诉" />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                                <asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" SortExpression="扣分人姓名" />
                                <asp:BoundField DataField="床号" HeaderText="床号" SortExpression="床号" />
                                <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                                <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                                <asp:BoundField DataField="宿舍编号" HeaderText="宿舍编号" SortExpression="宿舍编号" />
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

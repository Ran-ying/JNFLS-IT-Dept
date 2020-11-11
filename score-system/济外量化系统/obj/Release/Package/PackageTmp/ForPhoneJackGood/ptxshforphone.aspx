<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptxshforphone.aspx.cs" Inherits="济外量化系统.ptxshforphone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>量化管理系统</title>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <style type="text/css">
        
        body 
        { 
            background-image:url(bg.jpg);
            background-repeat:no-repeat;
            background-size:100%;
            background-attachment:fixed;
            font-family:'Microsoft YaHei',黑体;
        }
        #Button1 {
            border:2px solid;
            border-radius:15px;
        }
        #Button2 {
            border:2px solid;
            border-radius:15px;
        }
        #Button3 {
            border:2px solid;
            border-radius:15px;
        }
        #Button4 {
            border:2px solid;
            border-radius:15px;
        }
        #Button5 {
            border:2px solid;
            border-radius:15px;
        }
        #Button6 {
            border:2px solid;
            border-radius:15px;
        }
        #TextBox1 {
            border:2px solid;
            border-radius:15px;
        }
        #TextBox2 {
            border:2px solid;
            border-radius:15px;
        }
        #TextBox3 {
            border:2px solid;
            border-radius:15px;
        }
        #TextBox4 {
            border:2px solid;
            border-radius:15px;
        }
        #TextBox5 {
            border:2px solid;
            border-radius:15px;
        }
        .auto-style1 {
            font-size: 4em;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            font-size: 4em;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="auto-style2">
                            <span class="auto-style3">
                            <br />
                            <br />
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <br />
                            输入分数</span><br class="auto-style3" />
                            <span class="auto-style3">日期：</span><br class="auto-style3" />
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style3" Width="90%"></asp:TextBox>
                            <br class="auto-style3" />
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [区域编号表] WHERE ([区域] LIKE '%班%')">
                        </asp:SqlDataSource>
                        <div class="auto-style2">
                            <span class="auto-style3">扣分：</span><br class="auto-style3" />
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style3" Width="90%"></asp:TextBox>
                            <br class="auto-style3" />
                            <span class="auto-style3">备注：</span><br class="auto-style3" />
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style3" Width="90%"></asp:TextBox>
                            <br class="auto-style3" />
                            <span class="auto-style3">班级：</span><br class="auto-style3" />
                            <asp:ListBox ID="ListBox2" runat="server" CssClass="auto-style3" DataSourceID="SqlDataSource2" DataTextField="区域" DataValueField="区域" SelectionMode="Multiple" Width="90%"></asp:ListBox>
                            <br class="auto-style3" />
                            <span class="auto-style3">原因：</span><br class="auto-style3" />
                            <asp:ListBox ID="ListBox1" runat="server" CssClass="auto-style3" DataSourceID="SqlDataSource1" DataTextField="原因" DataValueField="原因" SelectionMode="Multiple" Width="90%"></asp:ListBox>
                            <br class="auto-style3" />
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>"></asp:SqlDataSource>
                        <div class="auto-style2">
                            <br class="auto-style1" />
                            <asp:Button ID="Button3" runat="server" CssClass="auto-style1" Font-Size="4em" OnClick="Button3_Click" Text="提交" Width="90%" />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </asp:Panel>

    <!--
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" rowspan="2">
            <img alt="" class="auto-style3" src="未标题-4.png" />
            </td>
                <td>
            <img alt="" class="auto-style2" src="未标题-3.png" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
            <span class="auto-style4" style="font-family: &quot;Microsoft YaHei UI Light&quot;">量化管理系统</span></td>
                <td class="auto-style6">
    
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top">

                    <asp:Button ID="Button9" runat="server" Text="输入分数" OnClick="Button5_Click" />
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
                    
                    <asp:Panel ID="Panel2" runat="server">
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
                    <asp:Panel ID="Panel3" runat="server">
                        扣分查询<br /> 时间从：<asp:TextBox ID="timefrom" runat="server"></asp:TextBox>
                        到：<asp:TextBox ID="timeto" runat="server"></asp:TextBox>
                        （YYYYMMDD）<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="点击查询（全部班级）" />
                        <br />
                        班级：<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="区域" DataValueField="区域">
                        </asp:DropDownList>
                        <asp:Button ID="chaxun" runat="server" OnClick="chaxun_Click" Text="点击查询（选中班级）" />
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
                    <asp:Panel ID="Panel4" runat="server">
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
                <td>
                    
                    &nbsp;</td>
            </tr>
        </table>
    
        <br />
    -->
    </div>
    </form>
</body>
</html>

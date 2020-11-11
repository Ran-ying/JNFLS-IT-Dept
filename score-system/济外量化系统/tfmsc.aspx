<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tfmsc.aspx.cs" Inherits="济外量化系统.tfmsc" %>

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
        .auto-style6 {
            height: 50px;
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

                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="统计分数" />
                    <br />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="修改标准分" />

                </td>
                <td class="zhongxin">
                    
        <br />
                    
                    <asp:Panel ID="Panel1" runat="server" Visible="False">
                        日期从：<asp:TextBox ID="timefrom" runat="server"></asp:TextBox>
                        到：<asp:TextBox ID="timeto" runat="server"></asp:TextBox>
                        (YYYYMMDD)<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="点击查询" />
                        <br />
                        <br />
                        分数<br /> 
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />
                        <br />
                        <br />
                        排名<br /> 
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                        <br />
                        <br />
                        <br />
                        标准分<br /> 
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                        <br />
                        <br />
                        标准分后排名<br /> 
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        添加标准分：<br /> 部：<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="区域" DataValueField="区域">
                        </asp:DropDownList>
                        (宿管部请录到女宿部！！！)<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [区域编号表] WHERE ([区域] LIKE '%' + @区域 + '%')">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="部" Name="区域" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        名次：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        分数：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="添加" />
                        <br />
                        <br />
                        删除标准分：<asp:GridView ID="GridView1" runat="server" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                                <asp:BoundField DataField="部门" HeaderText="部门" SortExpression="部门" />
                                <asp:BoundField DataField="名次" HeaderText="名次" SortExpression="名次" />
                                <asp:BoundField DataField="分数" HeaderText="分数" SortExpression="分数" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="删除" ShowHeader="True" Text="删除" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT * FROM [标准分] WHERE ([年级] = @年级)">
                            <SelectParameters>
                                <asp:SessionParameter Name="年级" SessionField="年级" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
    
        <br /> <br />
                    
                </td>
            </tr>
        </table>
    
        <br />

    </div>
    </form>
</body>
</html>

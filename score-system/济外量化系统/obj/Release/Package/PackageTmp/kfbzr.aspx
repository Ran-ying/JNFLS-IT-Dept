<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kfbzr.aspx.cs" Inherits="济外量化系统.kfbzr" %>

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
                <td>

                    <br />
                    <br />

                </td>
                <td class="zhongxin">
                    
        扣分查询<br />
        时间从：<asp:TextBox ID="timefrom" runat="server"></asp:TextBox>
        到：<asp:TextBox ID="timeto" runat="server"></asp:TextBox>
        （YYYYMMDD）<asp:Button ID="chaxun" runat="server" OnClick="chaxun_Click" Text="Button" />
        <br />
        分数和标准分后排名<br />
        <table>
            <tr>
                <td>
        <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
                <td>
        <asp:Label ID="Label5" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        我要申诉：<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="扣分部门" HeaderText="扣分部门" SortExpression="扣分部门" />
                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                <asp:BoundField DataField="审核中" HeaderText="审核中" SortExpression="审核中" />
                <asp:BoundField DataField="有效" HeaderText="有效" SortExpression="有效" />
                <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                <asp:BoundField DataField="床号" HeaderText="床号" SortExpression="床号" />
                <asp:BoundField DataField="宿舍编号" HeaderText="宿舍编号" SortExpression="宿舍编号" />
                <asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" SortExpression="扣分人姓名" />
                <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="申诉" ShowHeader="True" Text="申诉"  />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>"></asp:SqlDataSource>
    
                    <br />
                    
                </td>
            </tr>
        </table>
    
        <br />
    
    </div>
    </form>
</body>
</html>

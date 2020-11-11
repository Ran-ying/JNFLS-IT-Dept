<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="systemmaker.aspx.cs" Inherits="济外量化系统.systemmaker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>量化管理系统</title>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
        .auto-style5 {
            width: 133px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" rowspan="2">
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

                </td>
                <td>

                    <br />
                    <br />
                    <br />
                    本系统来自济南外国语学校2017级团委学生会信息技术部贾宝琰<br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">返回首页</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    历届更新详表：<br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="865px">
                        <Columns>
                            <asp:BoundField DataField="版本号" HeaderText="版本号" SortExpression="版本号" />
                            <asp:BoundField DataField="更新内容" HeaderText="更新内容" SortExpression="更新内容" />
                            <asp:BoundField DataField="更新人" HeaderText="更新人" SortExpression="更新人" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AConnectionString %>" SelectCommand="SELECT [版本号], [更新内容], [更新人] FROM [更新表] ORDER BY [id] DESC"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="FunctionLyric_Setting" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">        body {background-image:url(../Images/microicons/meizhouyige1.png);
font-family: 微软雅黑,黑体;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainSQLConnectionString %>" SelectCommand="SELECT [ID], [歌词], [日期], [背景], [偏移量] FROM [歌词表]"></asp:SqlDataSource>
        
        <table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #ffd800;">
<td>后台设置</td></tr></table>
        <div style="text-align:left">
            当前歌词：<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:TemplateField HeaderText="歌词" SortExpression="歌词">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("歌词") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="TextBoxPrstLrc" runat="server" Text='<%# Bind("歌词") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                <asp:BoundField DataField="背景" HeaderText="背景" SortExpression="背景" />
                <asp:BoundField DataField="偏移量" HeaderText="偏移量" SortExpression="偏移量" />
            </Columns>
        </asp:GridView>
            <br />
            设置：<table border="1">
            <tr><td>歌词上传：<asp:TextBox ID="TextBoxLrc" runat="server"></asp:TextBox></td></tr>
            <tr><td>选择背景:<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">红</asp:LinkButton>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">黄</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">蓝</asp:LinkButton>
                <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">绿</asp:LinkButton>
                </td></tr>
            <tr><td><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Save">保存歌词</asp:LinkButton></td></tr>
        </table>
        <table>
        <tr><td>设置偏移量, 当前偏移量:<asp:Label ID="Label1" runat="server" Text="偏移量"></asp:Label></tr></td>
            <tr><td>
            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="Plus1s_Click">+1s</asp:LinkButton></td>
                <td><asp:LinkButton ID="LinkButton7" runat="server" OnClick="PlusM1s_Click" >-1s</asp:LinkButton></td></tr>
            <tr><td><asp:LinkButton ID="LinkButton8" runat="server" OnClick="Plus100ms_Click" >+0.1s</asp:LinkButton></td>
                <td><asp:LinkButton ID="LinkButton9" runat="server" OnClick="PlusM100ms_Click" >-0.1s</asp:LinkButton></td></tr></table>
        </div>
        -----------------------------------------<br />
        <!--
        <iframe src="Lyric.html" width="100%" style="height: 286px"></iframe>
        -->
   </form>
</body>
</html>

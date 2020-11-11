<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clubapplystatus.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/shetuan1.png);} 
        .auto-style1 {
            font-size: xx-large;
            text-align: center;
            color: #FFFFFF;
        }
        .auto-style2 {
            height: 369px;
        }
        </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%">
<table width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #BB1AFF;">
<td>审批状态</td></tr></table>            <tr><td class="auto-style2">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="300px" Width="100%" 
            AllowPaging="True" AutoGenerateRows="False" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            onpageindexchanging="DetailsView1_PageIndexChanging" style="text-align: center">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="预约社团" HeaderText="预约社团" SortExpression="预约社团" />
                <asp:BoundField DataField="预约场地" HeaderText="预约场地" SortExpression="预约场地" />
                <asp:BoundField DataField="预约时间" HeaderText="预约时间" SortExpression="预约时间" />
                <asp:CheckBoxField DataField="审批" HeaderText="审批" SortExpression="审批" />
                <asp:BoundField DataField="申请内容" HeaderText="申请内容" SortExpression="申请内容" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [预约社团], [预约场地], [预约时间], [审批], [申请内容] FROM [预约] WHERE ([预约社团] = @预约社团)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="预约社团" QueryStringField="ID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <br />
</td></tr>
            
            <tr><td>
                &nbsp;</td></tr>
            </table>
    </form>
</body>
</html>

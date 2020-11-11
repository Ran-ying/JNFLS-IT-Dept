<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Doctorview.aspx.cs" Inherits="FunctionAttendanceManaging_Doctorview" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 20px;
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
        }
        .style1
        {
            text-align: center;
            height: 121px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%">
    <tr><td class="auto-style2">校医登记="server">
        
<table width="100%">
    <tr><td ><table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #692aa4;">
<td>校医登记</td></tr></table></td></tr>
    <tr><td class="style1"><br />

              <asp:TextBox ID="TextBox1" runat="server" BackColor="#692aa4" BorderColor="#7e34cc"
                   BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" 
                  Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="White"
                   Height="40px" OnFocus="javascript:if(this.value=='                   请刷卡') {this.value='';}"
                    OnBlur="javascript:if( his.value==''){this.value='                   请刷卡';}" Width="339px" >                   请刷卡</asp:TextBox>
              <br />
              <br />
              <br />
              <asp:Button ID="确定" runat="server" Height="29px" onclick="Button1_Click" Text="确定" Width="91px" />

        </td></tr>
        <tr id="controltr" runat="server" visible= "false"><td style="text-align: center">
        
            症状或体征:<asp:TextBox ID="zheng" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            用药:<asp:TextBox ID="yao" runat="server"></asp:TextBox>
            (选填)<br />
            金额:<asp:TextBox ID="jin" runat="server"></asp:TextBox>
            (选填)<br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="28px" Text="确定" Width="82px" 
                onclick="Button1_Click1" />
        
        </td></tr>
    <tr><td class="auto-style1">查看病假申请<br />
        <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="view.aspx?ID={0}" Text="查看申请理由" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="IC卡编号" HeaderText="IC卡编号" SortExpression="IC卡编号" />
                <asp:CheckBoxField DataField="申请状态" HeaderText="申请状态" SortExpression="申请状态" />
                <asp:BoundField DataField="申请时间" HeaderText="申请时间" SortExpression="申请时间" />
                <asp:BoundField DataField="理由" HeaderText="理由" SortExpression="理由" />
                <asp:BoundField DataField="类型" HeaderText="类型" SortExpression="类型" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [ID], [姓名], [班级], [IC卡编号], [申请状态], [申请时间], [理由], [类型] FROM [离校申请] WHERE ([类型] = @类型)">
            <SelectParameters>
                <asp:Parameter DefaultValue="病假" Name="类型" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </td></tr>
    <tr><td class="auto-style2">查看最近看病记录</td></tr>
    <tr><td class="auto-style2">
        <asp:GridView ID="GridView2" Width=100% runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
            GridLines="None" style="text-align: center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
            SelectCommand="SELECT [姓名], [班级], [时间], [ID] FROM [校医登记]">
        </asp:SqlDataSource>
        </td></tr>
</table>
    </form>
</body>
</html>

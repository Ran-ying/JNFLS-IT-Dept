<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dom.aspx.cs" Inherits="FunctionAttendanceManaging_dom" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {background-image:url(../Images/microicons/kaoqin1.png); font-family: 微软雅黑,黑体; 
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
            height: 20px;
        }
        .auto-style3 {
            text-align: center;
            height: 137px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%" align="center" style="height: 317px">
    <tr><td class="auto-style1">宿舍登记</td></tr>
        <tr><td class="auto-style1">

              <asp:TextBox ID="TextBox1" runat="server" BackColor="#652aa4" BorderColor="#7e34cc"
                   BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" 
                  Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="White"
                   Height="40px" OnFocus="javascript:if(this.value=='                   请刷卡') {this.value='';}"
                    OnBlur="javascript:if( his.value==''){this.value='                   请刷卡';}" Width="339px" >                   请刷卡</asp:TextBox>
              <br />
              <br />
              <br />
              <asp:Button ID="确定" runat="server" Height="29px" onclick="Button1_Click" Text="确定" Width="91px" />

            </td></tr>
        <tr><td class="auto-style2">
        
              <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" Font-Names="微软雅黑" style="font-size: xx-large"></asp:Label>
       

              <br />
              <br />
              人数统计表
       

            </td></tr>
        <tr><td class="auto-style3">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                style="text-align: center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                    <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
                SelectCommand="SELECT [ID], [姓名], [班级], [时间] FROM [宿舍登记]">
            </asp:SqlDataSource>
            


</table>
    </form>
</body>
</html>

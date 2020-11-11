<%@ Page Language="C#" AutoEventWireup="true" CodeFile="class.aspx.cs" Inherits="FunctionAnouncement_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/kaoqin1.png);}
</style>
    </head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%" height="100%">
    <tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #692cab;">
         <td>
            <asp:label ID="标题" runat="server" Font-Names="微软雅黑" ForeColor="White" style="text-align: center" Text="请刷卡签到" Font-Bold="True"></asp:label>
         </td>
    </tr>
    <tr id="查看签到情况" runat="server"><td style="text-align: center">
        
        
            <asp:GridView   ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="100%" Width="100%" style="font-size: medium"  CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="IC卡编号" HeaderText="IC卡编号" SortExpression="IC卡编号" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                    <asp:CheckBoxField DataField="是否迟到" HeaderText="是否迟到" SortExpression="是否迟到" />
                    <asp:BoundField DataField="进入时间" HeaderText="进入时间" SortExpression="进入时间" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [IC卡编号], [姓名], [班级], [是否迟到], [进入时间] FROM [班级签到]"></asp:SqlDataSource>
        
        
        </td></tr>
    <tr id ="刷卡签到" runat="server"><td style="text-align: center">

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
    <tr><td style="text-align: center">
        
              <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" Font-Names="微软雅黑" style="font-size: xx-large"></asp:Label>
       

        </td></tr>
</table>
    </form>
</body>
</html>

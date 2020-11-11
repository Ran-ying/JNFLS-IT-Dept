<%@ Page Language="C#" AutoEventWireup="true" CodeFile="leaveschool.aspx.cs" Inherits="FunctionAnouncement_Default" %>

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
    <tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #692AA4;">
         <td>
            <asp:label ID="标题" runat="server" Font-Names="微软雅黑" ForeColor="White" style="font-size: xx-large;" Text="请刷卡" Font-Bold="True" Font-Size="X-Large"></asp:label>
         </td>
    </tr>
    <tr id="离校审批" runat="server"><td style="text-align: center">
        
        
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="View.aspx?ID={0}" Text="查看申请理由" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                    <asp:BoundField DataField="IC卡编号" HeaderText="IC卡编号" SortExpression="IC卡编号" />
                    <asp:BoundField DataField="申请时间" HeaderText="申请时间" SortExpression="申请时间" />
                    <asp:CheckBoxField DataField="申请状态" HeaderText="申请状态" SortExpression="申请状态" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [姓名], [班级], [IC卡编号], [申请时间], [申请状态], [ID] FROM [离校申请]"></asp:SqlDataSource>
        
        
        </td></tr>
    <tr id ="刷卡离校" runat="server"><td style="text-align: center">

              <asp:TextBox ID="TextBox1" runat="server" BackColor="#652AA4" BorderColor="#7E34CC"
                   BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" 
                  Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="White"
                   Height="34px" OnFocus="javascript:if(this.value=='  请刷卡申请离校或查看申请状态') {this.value='';}"
                    OnBlur="javascript:if( his.value==''){this.value='  请刷卡申请离校或查看申请状态';}" Width="370px" >  请刷卡申请离校或查看申请状态</asp:TextBox>
               <br />
               <br />
              <br />
              <br />
              <asp:Button ID="确定" runat="server" Height="36px" onclick="Button1_Click" Text="确定" Width="105px" />
              <br />
              <br />
              <br />
              <br />

        </td></tr>
    <tr>
        <td style="text-align: center">
        
              <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" Font-Names="微软雅黑" style="font-size: xx-large"></asp:Label>
       

        </td>
    </tr>
    <tr id="reason" runat="server" visible="false"><td style="text-align: center">
        类型<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>---请选择类型---</asp:ListItem>
            <asp:ListItem Value="事假">事假</asp:ListItem>
            <asp:ListItem Value="病假">病假</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
    <asp:TextBox ID="reason0" runat="server" Height="129px" TextMode="MultiLine" Width="481px"></asp:TextBox>
              &nbsp;<br />
              <asp:Button ID="确定0" runat="server" Height="36px"  Text="确定" Width="105px" OnClick="确定0_Click" />
              </td></tr>
    <tr id="view_" runat="server"><td>
        <asp:GridView ID="GridView2" runat="server" Width ="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
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
        
                                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [ID], [姓名], [班级], [IC卡编号], [申请状态], [申请时间], [理由], [类型] FROM [离校申请] WHERE ([姓名] = @姓名)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="姓名" SessionField="名字" Type="String" />
                                      </SelectParameters>
        </asp:SqlDataSource>
        
                                  </td></tr>
</table>
    </form>
</body>
</html>

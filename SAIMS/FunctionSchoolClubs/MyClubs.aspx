<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyClubs.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;}
        .style6
        {
            font-family: 微软雅黑,黑体;
          
        }
        .style1
        {
            font-family: 微软雅黑,黑体;
        }
        .style3
        {
            color: #FFFFFF;
            font-size: x-large;
        }
        .style2
        {
            color: #FFFFFF;
            text-align: center;
        }
        </style>
    </head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%">
            <tr><td style="text-align: center">

<table width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">

<td>我的社团</td></tr></table>
  
                </td></tr>
            <tr><td style="text-align: center">



 <asp:gridview ID="Gridview1" runat="server" Width="100%" 
            AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            style="text-align: center; font-size: large" 
                    onselectedindexchanged="Gridview1_SelectedIndexChanged">
     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
     <Columns>
         <asp:BoundField DataField="社团名" HeaderText="社团名" SortExpression="社团名" />
         <asp:HyperLinkField DataNavigateUrlFields="社团名" DataNavigateUrlFormatString="memberclub.aspx?ID={0}" HeaderText="查看" Text="详细" />
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
        </asp:gridview>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClubConnectionString %>" 
            
            SelectCommand="SELECT [社团名] FROM [社团成员] WHERE ([社团成员] = @社团成员)">
            <SelectParameters>
                <asp:SessionParameter Name="社团成员" SessionField="名字" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                <br />

  

                </td></tr>
            
             </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberClub.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

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
            font-size: medium;
           
        }
        .style6
        {
            font-family: 微软雅黑,黑体;
          
        }
        .style1
        {
            font-family: 微软雅黑,黑体;
        }
        .auto-style2 {
            color: #FFFFFF;
        }
        .style3
        {
            color: #FFFFFF;
            font-size: x-large;
        }
        .auto-style3 {
            color: #FEFFFF;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%">
            <tr runat="server" id="first"><td style="font-family: 微软雅黑,黑体; text-align: left; color: #FFFFFF;" class="auto-style1" >
   
                <strong><asp:Image  
          runat="server" width="150px" height="150px" 
          style="float: none; text-align: center" ID="ClubsImg" CssClass="style6" />
                社团:<asp:Label ID="managepage_club_name" runat="server" CssClass="style6" style="text-align: center; font-size: medium;"></asp:Label>
                &nbsp; 社长:</strong><asp:Label ID="managepage_club_manager" runat="server" style="font-weight: 700;  font-family: 微软雅黑,黑体; font-size: medium;"></asp:Label>

  
                </td></tr>
            <tr><td style="text-align: center">

      <h1 class="style1">
          <strong style="text-align: center">&nbsp;<span class="auto-style2">社 团 管 理</span></strong></h1>
  
                </td></tr>
            <tr><td style="text-align: center">



                <strong>



      <span class="style3">社员列表<asp:GridView ID="GridView1" runat="server" 
          AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" 
          style="font-size: medium" Height="100%" Width="100%" CellPadding="4" CssClass="auto-style3" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          <Columns>
              <asp:BoundField DataField="社团名" HeaderText="社团名" SortExpression="社团名" />
              <asp:BoundField DataField="社团成员" HeaderText="社团成员" SortExpression="社团成员" />
              <asp:BoundField DataField="社团职务" HeaderText="社团职务" SortExpression="社团职务" />
              <asp:BoundField DataField="社员班级" HeaderText="社员班级" SortExpression="社员班级" />
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
          ConnectionString="<%$ ConnectionStrings:ClubConnectionString %>" 
          SelectCommand="SELECT [社团名], [社团成员], [社团职务], [社员班级] FROM [社团成员] WHERE ([社团名] = @社团名)" OnSelecting="SqlDataSource2_Selecting">
          <SelectParameters>
              <asp:QueryStringParameter Name="社团名" QueryStringField="ID" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
                </span>
      </strong><br />
      本社团目前有社员<asp:Label ID="Label1" runat="server" Text=""></asp:Label>

  

                人</td></tr>
            <tr><td style="text-align: center">
                <br />
                </td></tr>
            <tr><td style="text-align: center">

     
       <strong><span class="style3">社团事务</span><br />
       <a href="clubupload.aspx">
       <asp:Button ID="Button1" runat="server" Height="82px" Text="资料上传" 
           Width="194px" BackColor="#BB1AFF" BorderStyle="Outset" 
           onclick="Button1_Click" 
           style="color: #FFFFFF; font-size: x-large; font-weight: 700; font-family: 微软雅黑,黑体" /></a>&nbsp; &nbsp;
       
       <asp:Button ID="ApplyStatus" runat="server" 
           Height="83px" Text="查看审批状态" 
           Width="188px" onclick="ApplyStatus_Click" BackColor="#BB1AFF" 
           BorderStyle="Outset" 
           style="font-size: x-large; font-family: 微软雅黑,黑体; font-weight: 700; color: #FFFFFF" />
       </strong>

                </td></tr>
             </table>
    </form>
</body>
</html>

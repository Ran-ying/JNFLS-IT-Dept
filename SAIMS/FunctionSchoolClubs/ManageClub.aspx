<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageClub.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

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
        .style3
        {
            color: #FFFFFF;
            font-size: x-large;
        }
        .auto-style3 {
            color: #000000;
        }
        .auto-style4 {
            font-family: 微软雅黑,黑体;
            color: #000000;
        }
        .auto-style5 {
            ;
        }
        .style7
        {
            height: 157px;
        }
        .style8
        {
            height: 25px;
        }
        </style>
    </head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%" style="filter:alpha(opacity=90)">
            <tr runat="server" id="first"><td style="font-family: 微软雅黑,黑体; text-align: left; color: #FFFFFF;" class="auto-style1" >
   
                <strong><asp:Image  
          runat="server" width="150px" height="150px" 
          style="float: none; text-align: center" ID="ClubsImg" CssClass="style6" />
                <span class="auto-style3">&nbsp;社团:</span><asp:Label ID="managepage_club_name" runat="server" CssClass="auto-style4" style="text-align: center; font-size: medium;"></asp:Label>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp; 社长:</span></strong><span class="auto-style3"><asp:Label ID="managepage_club_manager" runat="server" style="font-weight: 700;  font-family: 微软雅黑,黑体; font-size: medium;"></asp:Label>

  
                </span>
                <Judge:JudgeLogin runat="server" />
  
                </td></tr>
            <tr><td style="text-align: center" class="auto-style5">

      <h1 class="style1">
<table width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #BB1AFF;">
<td>社团管理</td></tr></table>  
                </td></tr>
            <tr><td style="text-align: center" class="auto-style5">



                <span class="style3"><strong><asp:GridView ID="GridView1" runat="server" 
          AutoGenerateColumns="False" DataSourceID="viewmember" AllowPaging="True" 
          style="font-size: medium" CellPadding="4" ForeColor="#333333" 
          GridLines="None" Height="100px" Width="100%" EnableTheming="True" 
                    AllowSorting="True" CssClass="auto-style5" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField DataField="社团名" HeaderText="社团名" SortExpression="社团名" />
              <asp:BoundField DataField="社团成员" HeaderText="社团成员" SortExpression="社团成员" />
              <asp:BoundField DataField="社员班级" HeaderText="社员班级" SortExpression="社员班级" />
              <asp:BoundField DataField="社团职务" HeaderText="社团职务" SortExpression="社团职务" />
          </Columns>
          <EditRowStyle BackColor="#2461BF" />
          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#EFF3FB" />
          <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
          <SortedAscendingCellStyle BackColor="#F5F7FB" />
          <SortedAscendingHeaderStyle BackColor="#6D95E1" />
          <SortedDescendingCellStyle BackColor="#E9EBEF" />
          <SortedDescendingHeaderStyle BackColor="#4870BE" />
      </asp:GridView>
      </strong></span>
                <br />
                <strong>本社团目前有社员<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                人</strong><asp:SqlDataSource ID="viewmember" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ClubConnectionString %>" 
          onselecting="SqlDataSource1_Selecting" 
          
          
          
          
          
          SelectCommand="SELECT [社团名], [社团成员], [社员班级],[社团职务] FROM [社团成员] WHERE ([社团名] = @社团名)" 
          OldValuesParameterFormatString="original_{0}">
          <SelectParameters>
              <asp:ControlParameter ControlID="managepage_club_name" Name="社团名" PropertyName="Text" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>

  

                </td></tr>
            <tr><td style="text-align: center" class="auto-style5">
                <br />
                <strong>社员编辑<br />
                <br />
                </strong>学生名称 <asp:TextBox 
              ID="wantJoinClubUserName" runat="server" Height="16px" Width="154px" ></asp:TextBox>
          &nbsp;班级 <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="班级" DataValueField="班级">
          </asp:DropDownList>
          &nbsp;&nbsp;
                <br />
      <asp:Button ID="JoinClubBtn" runat="server" Text = "加入" 
              onclick="JoinClubBtn_Click" Height="21px" Width="101px" />
      &nbsp;&nbsp;<asp:Button ID="Out" runat="server" Text = "踢出" 
               Height="21px" Width="101px" onclick="Out_Click" />
                &nbsp;<br />
                <asp:Button ID="renming" runat="server" Text = "任命副社长" 
               Height="21px" Width="101px" onclick="renming_Click"  />
                &nbsp;
                <asp:Button ID="chexiao" runat="server" Text = "撤销副社长" 
               Height="21px" Width="101px" onclick="chexiao_Click"  />
          &nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
                    SelectCommand="SELECT [班级],[编号] FROM [班级] WHERE ([年级] = @年级)">
              <SelectParameters>
                  <asp:SessionParameter Name="年级" SessionField="年级ID" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
                学生名称 
                <asp:TextBox 
              ID="wantJoinClubUserName0" runat="server" Height="16px" Width="154px" ></asp:TextBox>
          &nbsp;<br />
                班级 <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="班级" DataValueField="班级">
          </asp:DropDownList>
          &nbsp;&nbsp;<br />
&nbsp;职务<asp:TextBox 
              ID="wantJoinClubUserName1" runat="server" Height="16px" Width="154px" ></asp:TextBox>
                <br />
      <asp:Button ID="JoinClubBtn0" runat="server" Text = "任命" 
              Height="21px" Width="101px" onclick="JoinClubBtn0_Click" />
      &nbsp;<asp:SqlDataSource 
          ID="managemember" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ClubConnectionString %>" 
          SelectCommand="SELECT ID, 社团成员 FROM 社团成员" 
          onselecting="managemember_Selecting" ConflictDetection="CompareAllValues" 
          DeleteCommand="DELETE FROM [社团成员] WHERE [ID] = @original_ID AND (([社团成员] = @original_社团成员) OR ([社团成员] IS NULL AND @original_社团成员 IS NULL)) AND (([班级] = @original_班级) OR ([班级] IS NULL AND @original_班级 IS NULL))" 
          InsertCommand="INSERT INTO [社团成员] ([社团成员], [班级]) VALUES (@社团成员, @班级)" 
          OldValuesParameterFormatString="original_{0}" 
          UpdateCommand="UPDATE [社团成员] SET [社团成员] = @社团成员, [班级] = @班级 WHERE [ID] = @original_ID AND (([社团成员] = @original_社团成员) OR ([社团成员] IS NULL AND @original_社团成员 IS NULL)) AND (([班级] = @original_班级) OR ([班级] IS NULL AND @original_班级 IS NULL))">
          <DeleteParameters>
              <asp:Parameter Name="original_ID" Type="Int32" />
              <asp:Parameter Name="original_社团成员" Type="String" />
              <asp:Parameter Name="original_班级" Type="String" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="社团成员" Type="String" />
              <asp:Parameter Name="班级" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="社团成员" Type="String" />
              <asp:Parameter Name="班级" Type="String" />
              <asp:Parameter Name="original_ID" Type="Int32" />
              <asp:Parameter Name="original_社团成员" Type="String" />
              <asp:Parameter Name="original_班级" Type="String" />
          </UpdateParameters>
      </asp:SqlDataSource>
       &nbsp;<asp:Label ID="errorMsgLable" runat="server" style="color: #FF3300"></asp:Label>
                </td></tr>
            <tr><td style="text-align: center" class="style7">

     
       <strong>社团事务<br />
                <br />
       <a href="clubupload.aspx">
       <asp:Button ID="Button1" runat="server" Height="82px" Text="资料上传" 
           Width="194px" BackColor="#BB1AFF" BorderStyle="Outset" 
           onclick="Button1_Click" 
           style="color: #FFFFFF; font-size: x-large; font-weight: 700; font-family: 微软雅黑,黑体" /></a>&nbsp; <a href="clubposition.aspx"><asp:Button ID="Button2" runat="server" 
           Height="83px" Text="场地申请" 
           Width="188px" BackColor="#BB1AFF" BorderStyle="Outset" 
           onclick="Button2_Click" 
           style="font-weight: 700; font-size: x-large; font-family: 微软雅黑,黑体; color: #FFFFFF" /></a>&nbsp;
       
       <asp:Button ID="ApplyStatus" runat="server" 
           Height="83px" Text="查看审批状态" 
           Width="188px" onclick="ApplyStatus_Click" BackColor="#BB1AFF" 
           BorderStyle="Outset" 
           style="font-size: x-large; font-family: 微软雅黑,黑体; font-weight: 700; color: #FFFFFF" />
                <br />
       </strong>

                </td></tr>
                <tr>
                <td class="style8" style="text-align: center">
                
     
       <strong>社团量化<asp:GridView Width=100% ID="GridView2" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
                        style="text-align: center">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="社团名" HeaderText="社团名" SortExpression="社团名" />
                            <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                            <asp:BoundField DataField="原因" HeaderText="原因" SortExpression="原因" />
                            <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                            <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
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
                        SelectCommand="SELECT [ID], [社团名], [扣分], [原因], [备注], [扣分时间] FROM [社团扣分] WHERE ([社团名] = @社团名)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="managepage_club_name" Name="社团名" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
       </strong>

                </td></tr>
             </table>
    </form>
</body>
</html>

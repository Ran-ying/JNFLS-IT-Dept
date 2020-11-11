<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="SetBackFunction.aspx.cs" Inherits="FunctionSports_AddSportFunc" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center">
    
    <div style =" border-width: inherit; border-color: #FFFFFF; position: absolute;  top: 172px; left: 64px; z-index: 5; height: 201px; width: 210px; text-align: center;">

    <label style="font-family: 微软雅黑,黑体; color: #FFFFFF; font-size: large; font-weight: 700;">更改队伍宽限时间<br />
        </label>


        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="用户" DataValueField="用户" 
            Height="28px" style="margin-left: 0px" Width="102px" AutoPostBack="True">
            <asp:ListItem Value="&quot;&quot;">--请选择--</asp:ListItem>
        </asp:DropDownList>
        


        <br />


      <asp:TextBox ID="TimeChange" runat="server" Height="43px" Width="199px" 
      OnFocus="javascript:if(this.value=='请输入用户名') {this.value='';}"
      OnBlur="javascript:if(this.value==''){this.value='请输入用户名';}" 
      BackColor="#0076B4" BorderColor="#0183C8" BorderStyle="Solid" 
      BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" Font-Overline="False" 
      Font-Size="Large" Font-Strikeout="False" ForeColor="White" 
      ontextchanged="TextBox1_TextChanged" style="text-align: justify">  请输入宽限时间
      </asp:TextBox>

       <br />

        <asp:Button ID="TimeChangeButton" runat="server" Text="确定" Height="29px" 
            onclick="TimeChangeButton_Click" Width="103px" />

        <br />
        <asp:Label ID="NowTime" runat="server" Text="" ForeColor="Red"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            SelectCommand="SELECT [用户] FROM [运动会设置]"></asp:SqlDataSource>
    </div>


    <div style =" position: absolute;  top: 174px; left: 290px; z-index: 4; height: 200px; width: 233px; text-align: center;">

        <label style="font-family: 微软雅黑,黑体; color: #FFFFFF; font-size: large; font-weight: 700; text-align: justify;">手动锁卡<br />
        </label>


      <asp:TextBox ID="LockTXTBOX" runat="server" Height="43px" Width="199px" 
      OnFocus="javascript:if(this.value=='请输入用户名') {this.value='';}"
      OnBlur="javascript:if(this.value==''){this.value='请输入用户名';}" 
      BackColor="#0076B4" BorderColor="#0183C8" BorderStyle="Solid" 
      BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" Font-Overline="False" 
      Font-Size="Large" Font-Strikeout="False" ForeColor="White" 
      ontextchanged="TextBox1_TextChanged" style="text-align: center">         锁卡ID
      </asp:TextBox>

     

        <br />

        <asp:Button ID="Lock" runat="server" Text="确定" Height="29px" 
            Width="103px" onclick="Lock_Click" />

     

        <br />
        <br />

     

        <br />
        <asp:Label ID="LockState" runat="server" Text="" ForeColor="Red"></asp:Label>

     

    </div>  
     
    <div style =" position: absolute;  top: 172px; left: 546px; z-index: 4; height: 199px; width: 242px; text-align: center;">

   
   <label style="font-family: 微软雅黑,黑体; color: #FFFFFF; font-size: large; font-weight: 700; text-align: justify;">禁止出场次数统计<br />
        </label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="确定" />
        <asp:GridView ID="GridView3" runat="server" style="margin-top: 0px; margin-left: 0px;" 
            AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" 
            Height="215px">
            <Columns>
                <asp:BoundField DataField="IC卡编号" HeaderText="电通号" SortExpression="IC卡编号" />
                <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" />
                <asp:BoundField DataField="刷卡前状态" HeaderText="刷前状态" SortExpression="刷卡前状态" />
                <asp:BoundField DataField="刷卡后状态" HeaderText="刷后状态" SortExpression="刷卡后状态" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            SelectCommand="SELECT [IC卡编号], [时间], [刷卡前状态], [刷卡后状态] FROM [运动会后台数据] WHERE (([IC卡编号] = @IC卡编号) AND ([刷卡前状态] = @刷卡前状态))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="IC卡编号" PropertyName="Text" 
                    Type="String" />
                <asp:Parameter DefaultValue="L" Name="刷卡前状态" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

   <div style =" position: absolute;  top: 357px; left: 64px; z-index: 4; height: 243px; width: 725px; text-align: center;">

    <label style="font-family: 微软雅黑,黑体; color: #FFFFFF; font-size: large; font-weight: 700; text-align: justify;">读取持卡者信息<br />
        <asp:TextBox ID="CHI_KA_ZHEInFo" runat="server" 
           ontextchanged="CHI_KA_ZHEInFo_TextChanged"></asp:TextBox>
       <asp:Button ID="CHI_KA_ZHEInFoBut" runat="server" Text="查询" 
           onclick="CHI_KA_ZHEInFoBut_Click" />
        </label>
   
       <br />
   
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
           ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
           
           
           
           SelectCommand="SELECT [名字], [班级], [运动会项目1], [运动会项目2], [证件状态], [出场时间], [入场时间] FROM [持卡者信息VIEW] WHERE ([IC卡编号] = @IC卡编号)">
           <SelectParameters>
               <asp:ControlParameter ControlID="Label1" Name="IC卡编号" PropertyName="Text" 
                   Type="String" />
           </SelectParameters>
       </asp:SqlDataSource>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
           DataSourceID="SqlDataSource2" Height="16px" CellPadding="4" 
           ForeColor="#333333" GridLines="None" Width="723px">
           <AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:BoundField DataField="名字" HeaderText="名字" SortExpression="名字" />
               <asp:BoundField DataField="班级" HeaderText="班级" 
                   SortExpression="班级" />
               <asp:BoundField DataField="运动会项目1" HeaderText="运动会项目1" 
                   SortExpression="运动会项目1" />
               <asp:BoundField DataField="运动会项目2" HeaderText="运动会项目2" 
                   SortExpression="运动会项目2" />
               <asp:BoundField DataField="证件状态" HeaderText="证件状态" SortExpression="证件状态" />
               <asp:BoundField DataField="出场时间" HeaderText="出场时间" 
                   SortExpression="出场时间" />
               <asp:BoundField DataField="入场时间" HeaderText="入场时间" 
                   SortExpression="入场时间" />
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
   
   <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </div>

    <div style =" position: absolute;  top: 118px; left: 560px; z-index: 4; height: 21px; width: 297px; text-align: center; font-weight: 700; font-size: xx-large; font-family: 微软雅黑,黑体; color: #FFFFFF; right: 553px;">
    运动会后台功能
    </div>

        <div style =" position: absolute;  top: 172px; left: 816px; z-index: 4; height: 462px; width: 510px; text-align: center; font-weight: 700; color: #FFFFFF; font-size: x-large; font-family: 微软雅黑,黑体;">
        查询锁卡记录
  
     
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" 
                style="font-size: medium" Width="508px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="刷卡后状态" HeaderText="刷卡后状态" SortExpression="刷卡后状态" />
                    <asp:BoundField DataField="刷卡前状态" HeaderText="刷卡前状态" SortExpression="刷卡前状态" />
                    <asp:BoundField DataField="操作者" HeaderText="操作者" SortExpression="操作者" />
                    <asp:BoundField DataField="IC卡编号" HeaderText="IC卡编号" SortExpression="IC卡编号" />
                    <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
                SelectCommand="SELECT [刷卡后状态], [刷卡前状态], [操作者], [IC卡编号], [时间] FROM [运动会后台数据] WHERE (([刷卡后状态] = @刷卡后状态) AND ([刷卡前状态] = @刷卡前状态)) ORDER BY [ID]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="L" Name="刷卡后状态" Type="String" />
                    <asp:Parameter DefaultValue="L" Name="刷卡前状态" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
  
    </div>
        </div>
</asp:Content>


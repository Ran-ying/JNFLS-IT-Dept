<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="SetTime.aspx.cs" Inherits="FunctionSports_SET" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

     <div style =" text-align: center;">

     
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
             ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
             SelectCommand="SELECT [ID], [年级] FROM [年级]"></asp:SqlDataSource>
   
     
       <table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>设置比赛时间</td></tr></table>

         <br />

     
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
             DataSourceID="SqlDataSource2" DataTextField="年级" DataValueField="ID">
             <asp:ListItem Value="">---选择年级---</asp:ListItem>
         </asp:DropDownList>
   
     
         <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
             DataSourceID="SqlDataSource1" DataTextField="项目名称" DataValueField="项目代码">
             <asp:ListItem Value="">--选择项--</asp:ListItem>
         </asp:DropDownList>
         <br />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
             
             SelectCommand="SELECT [项目代码], [项目名称], [参赛年级] FROM [运动会项目] WHERE ([参赛年级] = @参赛年级)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="DropDownList1" Name="参赛年级" 
                     PropertyName="SelectedValue" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="比赛开始检录" 
             Height="66px" Width="147px" />
         <br />
         <br />
         <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="比赛结束" 
             Height="65px" Width="139px" />
   
         <br />
         <br />
         <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
   
    </div>
</asp:Content>


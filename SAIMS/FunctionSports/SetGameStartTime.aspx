<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="SetGameStartTime.aspx.cs" Inherits="FunctionSports_SetGameStartTime" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <div style ="  text-align: center;">


    <table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>设置比赛时间</td></tr></table>

        <br />

        <br />

        <asp:Label ID="Label3" runat="server" Text="项目年级:" ForeColor="White" 
            style="font-weight: 700; font-family: 微软雅黑,黑体; font-size: large"></asp:Label>

        <asp:DropDownList ID="DropDownList2" runat="server" 
            style="font-size: medium" Height="22px" Width="97px">
            <asp:ListItem>--请选择年级--</asp:ListItem>
            <asp:ListItem Value="1">高一</asp:ListItem>
            <asp:ListItem Value="2">高二</asp:ListItem>
            <asp:ListItem Value="3">高三</asp:ListItem>
        </asp:DropDownList>   
        &nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Label ID="Label2" runat="server" Text="项目名称:" ForeColor="White" 
            style="font-weight: 700; font-family: 微软雅黑,黑体; font-size: large"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="项目名称" DataValueField="项目代码" 
            Height="16px" style="font-size: medium" Width="89px" AutoPostBack="True">
            <asp:ListItem>--请选择项目--</asp:ListItem>
        </asp:DropDownList>
        <br />
        &nbsp;
        <br />
        <strong>
        <asp:Button ID="GAMESTART" runat="server" 
           Height="125px" Text="比赛开始检录" 
           Width="292px" BackColor="#999999" BorderStyle="Outset" 
           onclick="GAMESTART_Click" 
           
            
            style="font-weight: 700; font-size: xx-large; font-family: 微软雅黑,黑体; color: #FFFFFF; margin-left: 20px;" />
        </strong>
        <br />
        <br />
        <br />
        &nbsp; 
       <strong>
       
       <asp:Button ID="GAMEEND" runat="server" 
           Height="121px" Text="比赛结束" 
           Width="290px" BackColor="#999999" BorderStyle="Outset" 
           onclick="GAMEEND_Click" 
           
            
            style="font-weight: 700; font-size: xx-large; font-family: 微软雅黑,黑体; color: #FFFFFF; margin-top: 0px;" />
       </strong>

     
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            SelectCommand="SELECT [项目名称], [项目代码] FROM [运动会项目] WHERE ([参赛年级] = @参赛年级)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="参赛年级" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        </div>
</asp:Content>


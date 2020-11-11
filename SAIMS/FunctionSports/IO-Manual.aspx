<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="IO-Manual.aspx.cs" Inherits="FunctionSports_IO_Manual" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-family: 微软雅黑,黑体;
            font-size: xx-large;
            color: #FFFFFF;
        }
        .style2
        {
            color: #FFFFFF;
            font-family: 微软雅黑,黑体;
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

    <div style ="  text-align: center;">
    


<table  width="100%" height="30px">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>运动会出入场管理：手动进出</td></tr></table>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="68px" 
            style="text-align: center" Width="651px"></asp:TextBox>
    


        <br />
        <br />
        <asp:Button ID="OK" runat="server" BorderStyle="Solid" Height="53px" 
            onclick="OK_Click" Text="确定" Width="153px" />
    


        <br />
        <br />
        <span class="style2">
        ——↓消息区↓——</span><br />
    


        <br />
        <asp:Label ID="Info" runat="server" 
            style="font-size: xx-large; color: #FF0000; font-weight: 700;"></asp:Label>
    




    </div>

    <br />

</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LibIO.aspx.cs" Inherits="FunctionLib_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style type="text/css">
         .lib{ background-image:url(../Images/microicons/tushuguan1.png);}
         .auto-style1 {
             height: 52px;
         }
         </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table class="lib" width="100%">

        <tr><td>
<table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>图书馆进出管理</td></tr></table>            </td></tr>

        <tr><td class="auto-style1">


         <asp:TextBox ID="TextBox1" runat="server" Height="40px" Width="337px" 
                    OnFocus="javascript:if(this.value=='               图书馆进出') {this.value='';}"
                    OnBlur="javascript:if( his.value==''){this.value='               图书馆进出';}" 
                        BackColor="#0076B4" BorderColor="#0183C8" BorderStyle="Solid" 
                        BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" Font-Overline="False" 
                        Font-Size="X-Large" Font-Strikeout="False" ForeColor="White" >                   请刷卡</asp:TextBox>

          
            </td></tr>

        <tr><td>

        <asp:Button ID="Button1" runat="server" Height="29px" onclick="Button1_Click" 
            Text="确定" Width="91px" />

            </td></tr>

        <tr><td>

            <asp:Label ID="Label1" runat="server"  Font-Names="微软雅黑" style="font-weight: 700; text-align: center; font-size: xx-large; color: #FFFFFF;"></asp:Label>

            </td></tr>

</table>
    </form>
</body>
</html>

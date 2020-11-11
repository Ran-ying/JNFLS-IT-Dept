<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Achievements.aspx.cs" Inherits="FunctionRecommendedSM_Achievements" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {
            background-image: url(../Images/microicons/baosongsheng1.png);
            font-family: 微软雅黑,黑体;
        }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"><Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%">
    <tr><td class="auto-style1"><table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #cb0000;">
<td>申报企划</td></tr></table></td></tr>
       <tr><td style="margin-left: 40px" class="auto-style1">题目<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp; 类型<asp:DropDownList ID="DropDownList1" runat="server" Height="16px" style="text-align: center" Width="70px">
               <asp:ListItem>A</asp:ListItem>
               <asp:ListItem>B</asp:ListItem>
               <asp:ListItem>C</asp:ListItem>
               <asp:ListItem>D</asp:ListItem>
               <asp:ListItem>E</asp:ListItem>
               <asp:ListItem>F</asp:ListItem>
               <asp:ListItem>G</asp:ListItem>
           </asp:DropDownList>
           </td></tr>
       <tr><td class="auto-style1">
           <asp:TextBox ID="TextBox2" runat="server" Height="109px" TextMode="MultiLine" Width="273px"></asp:TextBox>
           </td></tr>
       <tr><td class="auto-style1">
           <asp:Button ID="updata" runat="server" OnClick="updata_Click" Text="提交" />
           </td></tr>
       <tr><td class="auto-style1">
           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查看个人企划表" />
           </td></tr>
</table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClubExamine.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

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
            font-size: xx-large;
            text-align: center;
            color: #FFFFFF;
            height: 19px;
        }
        .auto-style8 {
            width: 197px;
            font-size: large;
            font-weight: bold;
            height: 55px;
            text-align: center;
        }
        .auto-style13 {
            height: 55px;
            text-align: center;
        }
        .auto-style9 {
            height: 55px;
            text-align: center;
        }
        </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%">
            <tr><td class="auto-style1">
            <table width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #BB1AFF;">
<td>场地审批</td></tr></table></td></tr>

            <tr>
                <td>
    
               <table width="100%">
                <tr>
                    <td bgcolor="#BB1AFF" class="auto-style8" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >预约社团： </font></td>
                    <td class="auto-style13" bgcolor="#ffffff">
                        <asp:Label ID="预约社团" runat="server"></asp:Label>
                    </td>
                </tr>
            <tr>
                    <td bgcolor="#BB1AFF" class="auto-style8" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >预约场地：</font></td>
                    <td class="auto-style13" bgcolor="#ffffff">
                        <asp:Label ID="预约场地" runat="server"></asp:Label>
                    </td>
                </tr>
            <tr>
                    <td bgcolor="#BB1AFF" class="auto-style8" style="font-family: 微软雅黑,黑体"  ><font color="#FFFFFF" >预约时间：</font></td>
                    <td class="auto-style13" bgcolor="#ffffff">
                        <asp:Label ID="预约时间" runat="server"></asp:Label>
                    </td>
                </tr>
                   <tr>
                    <td bgcolor="#BB1AFF" class="auto-style8" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >审批状态：</font></td>
                    <td class="auto-style9" bgcolor="#ffffff">
                        <asp:Label ID="申请状态" runat="server"></asp:Label>
                    </td>
                   </tr>
                   <tr>
                    <td bgcolor="#BB1AFF" class="auto-style8" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >申请理由：</font></td>
                    <td class="auto-style9" bgcolor="#ffffff">
                        <asp:Label ID="理由" runat="server"></asp:Label>
                    </td>
                   </tr>
            <tr>
                    <td bgcolor="#BB1AFF" class="auto-style8" style="font-family: 微软雅黑,黑体"   >&nbsp;</td>
                    <td class="auto-style9" bgcolor="#ffffff">
                        <asp:Button ID="Button1" runat="server" Height="32px" OnClick="Button1_Click" Text="通过" Width="87px" />
                    </td>
                </tr>
                              
         </table>
                       </td></tr>
           
                 <tr> <td style="text-align: center">
            <table width="100%">   
                <tr>    <td class="auto-style10">
                <asp:LinkButton ID="上一页" runat="server" OnClick="上一页_Click">上一页</asp:LinkButton></td>
            <td class="auto-style10">
                共<asp:Label ID="Label2" runat="server"></asp:Label>个，第<asp:Label ID="Label3" runat="server"></asp:Label>
           个 </td><td class="auto-style10">
                <asp:LinkButton ID="下一页" runat="server" OnClick="下一页_Click">下一页</asp:LinkButton></td>
                    </tr>
            </table>
                </td></tr>
        
         </table>
       
    </form>
</body>
</html>

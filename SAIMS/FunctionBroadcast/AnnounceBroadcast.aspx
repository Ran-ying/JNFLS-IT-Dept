<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnnounceBroadcast.aspx.cs" Inherits="FunctionBroadcast_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style type="text/css">
        body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/guangbo1.png);}
        #table1 {
            font-weight: 700;
            font-size: large;
        }
        .auto-style1 {
            height: 21px;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            height: 31px;
        }
        .auto-style5 {
            height: 30px;
        }
        .auto-style6 {
            height: 31px;
            width: 129px;
        }
        .auto-style7 {
            height: 30px;
            width: 129px;
        }
        .auto-style8 {
            height: 31px;
            width: 121px;
        }
        .auto-style9 {
            height: 30px;
            width: 121px;
        }
       
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
    <div>
    <table width="100%">
      <tr><td class="auto-style3">
       <table width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #edc256;">
<td>待发布广播列表</td></tr></table>
          </td></tr>
           <tr><td class="auto-style1">
         
            <table border="0" cellpadding="0" id="table1" width="100%" align="center">
                <tr>
                    <td bgcolor="#e4bb52" class="auto-style8" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >申请人： </font></td>
                    <td class="auto-style4" >
                        <asp:Label ID="申请人" runat="server"></asp:Label>
                    </td>
                     <td bgcolor="#e4bb52" class="auto-style6" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >申请时间：</font></td>
                    <td class="auto-style4" >
                        <asp:Label ID="申请时间" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr id="班级行" runat="server">
                    <td bgcolor="#e4bb52" class="auto-style9" style="font-family: 微软雅黑,黑体"  ><font color="#FFFFFF" >播报时间：</font></td>
                    <td class="auto-style5" >
                        <asp:Label ID="播报时间" runat="server"></asp:Label>
                    </td>
                     <td bgcolor="#e4bb52" class="auto-style7" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >播报状态：</font></td>
                    <td class="auto-style5" >
                        <asp:Label ID="播报状态" runat="server"></asp:Label>
                    </td>
                </tr>       
            </table>
               


               
               </td></tr>
           <tr><td class="auto-style3">
               <table width="100%">
                   <tr><td style="text-align: center;">
                       <asp:TextBox ID="内容" runat="server" BorderStyle="Solid" Height="222px" ReadOnly="True" TextMode="MultiLine" Width="546px" Font-Bold="True" Font-Names="黑体" Font-Size="X-Large"></asp:TextBox>
                       <br />
                       <asp:Button ID="已播报" runat="server" BackColor="#e4bb52" BorderStyle="Solid" Height="33px" OnClick="Button1_Click" Text="已播报" Width="93px" />
                       <br />
                       </td></tr>
               </table>
               </td></tr>
        <tr>
            <td style="text-align: center">
            <table width="100%">   
                <tr>    <td class="auto-style10">
                <asp:LinkButton ID="上一页" runat="server" OnClick="上一页_Click">上一页</asp:LinkButton></td>
            <td class="auto-style10">
                共<asp:Label ID="Label2" runat="server"></asp:Label>个，第<asp:Label ID="Label3" runat="server"></asp:Label>
           个 </td><td class="auto-style10">
                <asp:LinkButton ID="下一页" runat="server" OnClick="下一页_Click">下一页</asp:LinkButton></td>
                    </tr>
            </table>
                </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>

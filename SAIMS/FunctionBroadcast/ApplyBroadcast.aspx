<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplyBroadcast.aspx.cs" Inherits="FunctionBroadcast_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
           body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/guangbo1.png);}
        .auto-style1 {
            color: #FFFFFF;
        }
        .auto-style2 {
            color: #000000;
        }
        .auto-style3 {
            text-align: center;
           
        }
        .auto-style4 {
            text-align: center;
          
        }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
    <div>
    <table width="100%" style="height: 454px">
      <tr><td class="auto-style3">

   <table width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #ebc256;">
<td>申请广播</td></tr></table></td></tr>
           <tr><td class="auto-style3">
         
        <table width="100%">
            <tr><td class="auto-style5">

                <strong>

        <span class="auto-style2">标题</span><span class="auto-style1"><asp:TextBox ID="标题" runat="server" BorderStyle="Solid" Height="16px" Width="102px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;</span><span class="auto-style2">&nbsp; 申请人姓名</span></strong><asp:TextBox ID="name" runat="server" BorderStyle="Solid" Height="16px" Width="102px"></asp:TextBox>
                （如果不填写则以当前账户为准）</td></tr>
            <tr><td class="auto-style4">
               
        <asp:CheckBox ID="上午间操" runat="server" style="font-weight: 700" Text="上午间操" />&nbsp;
        <asp:CheckBox ID="下午间操" runat="server" style="font-weight: 700" Text="下午间操" />&nbsp;
        <asp:CheckBox ID="每周一歌" runat="server" style="font-weight: 700" Text="每周一歌" />&nbsp;
        <asp:CheckBox ID="活动课" runat="server" style="font-weight: 700" Text="活 动 课" />&nbsp;
        <asp:CheckBox ID="天气预报" runat="server" style="font-weight: 700" Text="天气预报" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|| &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="今天" runat="server" style="font-weight: 700" Text="今天播出" />
                &nbsp;
                <asp:CheckBox ID="明天" runat="server" style="font-weight: 700" Text="明天播出" />
        <br />
                </td></tr>
            <tr><td class="auto-style4">        <strong>
                <div>详细内容:</div>
                </strong>
                
        <asp:TextBox ID="内容" runat="server" BorderStyle="Solid" Height="123px" TextMode="MultiLine" Width="532px"></asp:TextBox>
                </td></tr>
        </table>
               </td></tr>
           <tr><td class="auto-style3">
        <asp:Button ID="Button1" runat="server" BackColor="#edc256" BorderStyle="Solid" Height="33px" OnClick="Button1_Click" Text="确定" Width="93px" />
               </td></tr>
           <tr><td class="auto-style3"></td></tr>
    </table>
    </div>
    </form>
</body>
</html>

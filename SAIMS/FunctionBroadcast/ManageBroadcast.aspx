<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageBroadcast.aspx.cs" Inherits="FunctionBroadcast_Default" %>

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
            width: 109px;
            text-align: center;
        }
        .auto-style3 {
            width: 109px;
            font-size: large;
            font-weight: bold;
            height: 21px;
        }
        .auto-style4 {
            height: 21px;
        }
        .auto-style8 {
            width: 109px;
            font-size: large;
            font-weight: bold;
            height: 55px;
            text-align: center;
        }
        .auto-style9 {
            height: 55px;
            text-align: center;
        }
        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            height: 55px;
            text-align: center;
        }
        .auto-style14 {
            width: 187px;
            font-size: large;
            font-weight: bold;
            height: 21px;
        }
        #table1 {
            height: 282px;
            margin-top: 0px;
        }
        .auto-style15 {
            height: 55px;
            text-align: center;
        }
    </style>
 
</head>
<body style="height: 446px">
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
    <div>
    <table width="100%" style="height: 439px">
      <tr><td class="auto-style3">

    <label style="font-family: 微软雅黑,黑体; font-size: xx-large; color: #FFFFFF; font-weight: 700;">审批广播</td></tr>
           <tr><td class="auto-style4">
         
            <table border="0" cellpadding="0" id="table1" width="100%" align="center">
                <tr>
                    <td bgcolor="#ebc256" class="auto-style9" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >申请人： </font></td>
                    <td class="auto-style13" bgcolor="#ffffff">
                        <asp:Label ID="申请人" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="选择输入模式">
                    <td bgcolor="#ebc256" class="auto-style9" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >申请时间：</font></td>
                    <td class="auto-style13" bgcolor="#ffffff">
                        <asp:Label ID="申请时间" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr id="班级行" runat="server">
                    <td bgcolor="#ebc256" class="auto-style9" style="font-family: 微软雅黑,黑体"  ><font color="#FFFFFF" >播报时间：</font></td>
                    <td class="auto-style13" bgcolor="#ffffff">
                        <asp:Label ID="播报时间" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ebc256" class="auto-style9" style="font-family: 微软雅黑,黑体"   ><font color="#FFFFFF" >申请状态：</font></td>
                    <td class="auto-style9" bgcolor="#ffffff">
                        <asp:Label ID="申请状态" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr id="宿舍行" runat="server">
                    <td bgcolor="#ebc256"  style="font-family: 微软雅黑,黑体" class="auto-style9"><font  color="#FFFFFF" style="font-weight: 700">广播内容：</font></td>
                    <td class="auto-style15" bgcolor="#ffffff">
                        <asp:Label ID="广播内容" runat="server"></asp:Label>
                        </td>
                </tr>
            
                <tr runat="server" id="提交行">
                    <td   bgcolor="#ebc256" class="auto-style1" style="font-family: 微软雅黑,黑体" ></td>
                    <td  class="auto-style12" bgcolor="#ffffff">
                        <p class="auto-style16">
                            <font size="2">
                                <asp:Button ID="提交" runat="server" Height="24px" Text="通过/拒绝" Width="96px" OnClick="提交_Click" />
                                </font>
                        </p>
                    </td>
                </tr>
                
            </table>



               
               <table width="100%" style="text-align: center">
                   <tr bgcolor="#ffffff">
                 <td class="auto-style14" >
               <asp:LinkButton ID="上一条" runat="server" OnClick="上一条_Click">上一条</asp:LinkButton>
              </td>
               <td>
                   
                   今日共<asp:Label ID="条数" runat="server" Text=""></asp:Label> 条,第<asp:Label ID="条数0" runat="server" Text=""></asp:Label> 条</td>
               <td>
                <asp:LinkButton ID="下一条" runat="server" OnClick="下一条_Click">下一条</asp:LinkButton>
               </td></tr>
        </table>
    </table>
    </div>
    </form>
</body>
</html>

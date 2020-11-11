<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ICerror.aspx.cs" Inherits="ICerror" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
    
        对不起，您的校园电子通行证出现了一些问题，<br />
        请您提供以下信息来帮助我们尽快更正您的个人信息，<br />
        或者您也可以于一号楼（圆顶楼）二楼广播室反映此信息。<br />
        <br />
        对此给您带来的不便尽请谅解！<br />
        <br />
        姓名:<asp:TextBox ID="name" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        班级:<asp:TextBox ID="class0" runat="server"></asp:TextBox>
        (请填数字)<br />
        年级:<asp:TextBox ID="grade" runat="server"></asp:TextBox>
        (请填数字)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 校园通行证卡号:<asp:TextBox ID="number" runat="server"></asp:TextBox>
        (校园通行证背面8位编码)&nbsp; <span class="auto-style1">..</span> <span class="auto-style1">..</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" />
        <br />
        ///(详细跳转代码见leaveschool.aspx)///</div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RMsingin.aspx.cs" Inherits="FunctionRecommendedSM_RMsingin" %>

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
        #set {
            text-align: center;
        }
        #signin {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
    <div id="set" runat="server" visible="false">
    <table  width="100%" height="30px">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #cb0000;">
<td>保送生追踪设置</td></tr></table>
        <strong>设置当前IP地址所处位置

     
        <br />
        </strong>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" />

        <br />
        <br />
        <strong>保送生追踪</strong><br />
        <br />
        姓名:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查找" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>

    </div>
        <div id="signin" runat="server">

              <table  width="100%" height="30Px">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #cb0000;">
<td>保送生签到</td></tr></table>
            <br />
              <asp:TextBox ID="TextBox2" runat="server" BackColor="#cb0000" BorderColor="#880000"
                   BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" 
                  Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="White"
                   Height="40px" OnFocus="javascript:if(this.value=='                   请刷卡') {this.value='';}"
                    OnBlur="javascript:if( his.value==''){this.value='                   请刷卡';}" Width="339px" >                   请刷卡</asp:TextBox>
              <br />
              <br />
              <br />
              <asp:Button ID="确定" runat="server" Height="29px"  Text="确定" Width="91px" OnClick="确定_Click" />

        </div>

    </form>
</body>
</html>

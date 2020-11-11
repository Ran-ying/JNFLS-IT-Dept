<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎 - 济南外国语学校校务综合管理系统</title>
    <link href="css/layout.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            height: 54px;
        }
  
.button10 {
border-radius:5px;
border:0px solid black;
text-align:center;
font-size:25px;
font-family:'Microsoft YaHei';
}
     </style>

</head>
<body>

    <!--[if lt IE 9]>
   <div style="position:fixed;top:0;left:0;right:0;bottom:0;background:black;z-index:999999999;text-align:center;">
   <a href="../ximieie/upgrade.html"><img src="../ximieie/img/show.jpg" alt="您使用的Internet Explorer版本过低，无法访问校务综合管理系统第三版！我们建议您升级IE，或换用其他内核的浏览器。您可以点击这里了解，它将协助您升级浏览器。" />
   </a></div></body></html><![endif]-->



    <form id="form1" runat="server">
   
   <div id="container">
  <div id="header"><a href="index.aspx" ><img src="Images/titles/logo.png" style="float: left" />
      </a></div>
   <div id="Div1">&nbsp;</div>
  <div id="mainContent">
    <div id="sidebar" >&nbsp;&nbsp;&nbsp;&nbsp;</div>

    <div id="sidebar2"></div>
    <div id="content">
         <table style="width:100%; ">
            <tr>
                <td class="style1">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Height="40px" Width="337px" 
                    OnFocus="javascript:if(this.value=='请输入用户名') {this.value='';}"
                    OnBlur="javascript:if(this.value==''){this.value='请输入用户名';}" 
                        BackColor="White" BorderColor="#217F99" BorderStyle="Solid" 
                        BorderWidth="3px" Font-Bold="True" Font-Names="微软雅黑" Font-Overline="False" 
                        Font-Size="X-Large" Font-Strikeout="False" ForeColor="#217F99" 
                        ontextchanged="TextBox1_TextChanged" EnableTheming="True">请输入用户名</asp:TextBox>
                </td>
       
            </tr>
            <tr>
                <td class="style1">
                    <br />
                    <asp:TextBox ID="TextBox2" runat="server" Height="40px" 
                        style="margin-left: 0px" Width="335px" BackColor="White" 
                        BorderColor="#217F99" BorderStyle="Solid" BorderWidth="3px" 
                        Font-Bold="True" Font-Names="微软雅黑" Font-Size="Large" ForeColor="#217F99" 
                        TextMode="Password">请输入密码</asp:TextBox><br />
			
<!-- :<br/>
            <button class="button10" onclick="goto2()"/><a href="1/Jnfls/index.aspx" style="text-decoration:none; color:black">第二平台</a> </button>
            -->
<script>
function goto2()
{
window.location.href = "1/Jnfls/index.aspx"
self.location.href="1/Jnfls/index.aspx"
}
</script>
			
			
                </td>
              
            </tr>
                   
            <tr>
            <td class="auto-style1">
            
                    <br />
            
           </td>
        
           </tr>
             <tr>
                 <td>
            
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="登陆" 
                        BorderStyle="Solid" Height="47px" style="margin-left: 0px" 
                        Width="134px" BackColor="White" Font-Bold="True" Font-Names="微软雅黑" 
                        Font-Size="Large" ForeColor="#217F99" />
            
                 </td>
             </tr>
        </table>
    
         <a href="index.aspx" ><!--
      <asp:Image ID="Image1" runat="server"  style="position:absolute; top: 542px; right: 0px; height: 104px; width: 420px;" ImageUrl="http://www.7timer.com/v4/bin/civillight.php?lon=117.209&amp;lat=36.795&amp;lang=zh-CN&amp;ac=0&amp;unit=metric&amp;tzshift=0" />-->
      </a>
    
      </div>
  </div>
  <div id="Div2">&nbsp;</div>
  <div id="footer" style="color:#000000">
      ©2012 - 2015 济南外国语学校高中部学生会信息技术部 / IT Dept., the Student&#39;s Union of JFLS Senior Branch
<br />
保留所有权利。 All rights reserved.&nbsp;<a class="tblinks" href="AboutUs.aspx"  >[关于我们]</a> <a class="tblinks" href="ConnectUs.aspx">[联系我们]</a>
<a href="1/1/index.aspx" style="text-decoration:none; color:black">测试</a>
</div>
    </form>
</body>
</html>

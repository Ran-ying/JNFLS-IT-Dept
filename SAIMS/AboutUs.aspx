<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>关于我们 - 济南外国语学校校务综合管理系统</title>
     <link href="css/index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style2 {
            text-align: left;
        }
        </style>
</head>
<body>
 <form id="form1" runat="server">
             <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        

     <div id="container">
  <div id="header" class="auto-style1">

      <a href="index.aspx" ><img src="Images/titles/logo.png" style="float: left" /></a><view:viewinfo ID="Viewinfo1" runat="server"/>
       </div>
   <div id="Div1">&nbsp;</div>
  <div id="Div3" class="introtitle"><strong>关于我们</strong></div>
  <div id="Div4" class="introword">我们是济南外国语学校高中部学生会信息技术部，成立于2012年3月。<br />
      <br />
      <a href="Xiangge.aspx">响哥的话</a><br />
         </div>

  
  <div id="footer" class="auto-style2" >
      ©2012 - 2015 济南外国语学校高中部学生会信息技术部 / IT Dept., the Student&#39;s Union of JFLS Senior Branch
      <br />
      保留所有权利。 All rights reserved.&nbsp;<a class="tblinks" href="AboutUs.aspx">[关于我们]</a> <a class="tblinks" href="ConnectUs.aspx">[联系我们]</a></div>
</div>
    </form>
</body>
</html>

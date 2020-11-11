<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Xiangge.aspx.cs" Inherits="Xiangge" %>

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
  <div id="Div3" class="introtitle"><strong>响哥的话</strong></div>
  <div id="Div4" class="introword">这里是大响哥，我走了再见~~<br />
      背景都是一张纸的，十分感谢~~~~<br />
      一起奋斗的程序猿还有董天和张笑晨~~~~~<br />
      UI是钟源做的，别喷我~~~~~~~~<br />
      我们是快乐的信息部~~~~~~~<br />
      最后合影一张~~~~~~~<br />
      <img  src="Images/backgrounds/DSC_0042.jpg" 
          style="width: 800px; height: 450px"/><br />
      <br />
      我的QQ168278236，谁想找我找我吧，不找就算了= =~~~~~<br />
      以后的信息部学弟们有什么不会的可以问我~~~~~~<br />
         </div>

  
  <div id="footer" class="auto-style2" >
      ©2012 - 2015 济南外国语学校高中部学生会信息技术部 / IT Dept., the Student&#39;s Union of JFLS Senior Branch
      <br />
      保留所有权利。 All rights reserved.&nbsp;<a class="tblinks" href="AboutUs.aspx">[关于我们]</a> <a class="tblinks" href="ConnectUs.aspx">[联系我们]</a></div>
</div>
    </form>
</body>
</html>

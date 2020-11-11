<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>考勤管理 - 济南外国语学校校务综合管理系统</title>
     <link href="css/index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body { font-family: 微软雅黑,黑体; font-size:14px;  background-position: center center;
    background-image: url('../Images/backgrounds/Attendance.jpg');
   
    background-repeat:no-repeat;
    background-color: #CCCCCC;
    background-attachment: fixed;
     margin:0;}
        .tblinks {color: #CCCCCC;}



#container {margin:0 auto; width:100%;}
#header { height:100px; background-image: url('../Images/titles/shangbiaoti.png'); margin-bottom:5px;}

#content {
    
    background-position: center center;
    margin: 0 0px !important;
    height: 500px;
    
    text-align: center;
    background-repeat: no-repeat;
    background-attachment: inherit;
}
#footer {
    font-family: 微软雅黑,黑体;
    font-size: medium;
    font-style: normal;
    color: #FFFFFF;
    height: 60px;
    background-image: url('../Images/titles/xiabiaoti.png');
}
        .auto-style1 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
     <div id="container">
  <div id="header" class="auto-style1">
<a href="../index.aspx" ><img src="../Images/titles/logo.png" style="float: left" /></a>
      <view:viewinfo ID="Viewinfo1" runat="server"/>
</div>
   <div id="Div1">&nbsp;</div>
  <div id="mainContent">

    
    <div id="content">   <img src="../Images/icons/attendance.png" usemap="#Map" />
 <map name="Map" id="Map">
      <area shape="rect" coords="0, 0, 242, 499" href="mainfunc.aspx?id=leave" 
            alt="离校审批" />
      <area shape="rect" coords="756, 0, 999, 499" 
            href="mainfunc.aspx?ID=doc" alt="校医登记" /> 
     <area shape="rect" coords="504, 0, 747, 499" 
            href="mainfunc.aspx?ID=dom" alt="宿舍登记" />
      <area shape="rect" coords="252, 0, 495, 499" 
            href="mainfunc.aspx?ID=class" alt="班级签到" />
     </map>

    </div>
  </div>
  <div id="Div2">&nbsp;</div>
  <div id="footer" >
©2012 - 2015 济南外国语学校高中部学生会信息技术部 / IT Dept., the Student&#39;s Union of JFLS Senior Branch
<br />
保留所有权利。 All rights reserved.&nbsp;<a class="tblinks" href="../AboutUs.aspx">[关于我们]</a> <a class="tblinks" href="../ConnectUs.aspx">[联系我们]</a></div>
</div>
    </form>
</body>
</html>

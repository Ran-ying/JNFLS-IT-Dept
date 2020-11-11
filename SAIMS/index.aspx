<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>
<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>济南外国语学校校务综合管理系统</title>
     <link href="css/index.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style2 {
            text-align: left;
        }
        body { font-family:Verdana; font-size:14px;  background-position: center center;
    background-image: url('Images/backgrounds/index.jpg');
   
    background-repeat:no-repeat;
    background-color: #CCCCCC;
    background-attachment: fixed;
     margin:0;
     font-family: 微软雅黑,黑体;

}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
     <div id="container">
  <div id="header" class="auto-style1">

      <a href="index.aspx" ><img src="Images/titles/logo.png" style="float: left" /></a>
      <view:viewinfo runat="server"/>
      </div>
      <script language=javascript>
          window.open();

          function indeximg_onclick() {

          }

      </script>
   <div> 
        
         
         </div>
         
  <div id="mainContent">

    
    <div id="content"> 
    <map name="Map" id="Map">
      <area shape="rect" coords="0, 2, 330, 331" href="FunctionScores/index.aspx" 
            alt="量化" />
      <area shape="rect" coords="0, 340, 331, 499" 
            href="FunctionSchoolClubs/index.aspx" alt="社团" />
      <area shape="rect" coords="677, 341, 840, 499" href="FunctionBroadcast/Index.aspx" 
            alt="广播" />
      <area shape="rect" coords="849, 0, 1014, 160" 
            href="FunctionAnouncement/Index.aspx" alt="公告" />
       <area shape="rect" coords="849, 169, 1014, 331" href="FunctionMessage/Index.aspx" 
            alt="保送生管理" />
      <area shape="rect" coords="339, 170, 672, 332" href="FunctionRecommendedSM/index.aspx" 
            alt="保送生管理" />
           <area shape="rect" coords="339, 340, 672, 499" href="FunctionSports/Index.aspx" 
            alt="运动会" />
      <area shape="rect" coords="680, 169, 841, 332" href="FunctionLyric/index.aspx"
           alt="每周一歌" />
            <area shape="rect" coords="679, 0, 840, 160" href="FunctionLib/index.aspx"
           alt="图书馆管理" />
        <area shape="rect" coords="341, 1, 674, 161" href="FunctionAttendanceManaging/Index.aspx"
           alt="考勤管理" />
            <area shape="rect" coords="849, 340, 1014, 499" href="settings/Index.aspx"
           alt="设置" />
       
    </map>
     
        <img src="Images/icons/index.png" usemap="#Map" 
            style=" margin-left: 0px" border="0" id="indeximg" runat="server" onclick="return indeximg_onclick()" />
         
    </div>
  </div>
  <div id="Div2">&nbsp;</div>
  <div id="footer" class="auto-style2" >
      ©2012 - 2015 济南外国语学校高中部学生会信息技术部 / IT Dept., the Student&#39;s Union of JFLS Senior Branch
      <br />
      保留所有权利。 All rights reserved.&nbsp;<a class="tblinks" href="AboutUs.aspx">[关于我们]</a> <a class="tblinks" href="ConnectUs.aspx">[联系我们]</a></div>
</div>
    </form>
</body>
</html>

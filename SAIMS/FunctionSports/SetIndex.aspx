<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>运动会管理 - 济南外国语学校校务综合管理系统</title>
     <link href="css/index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {background-image:url(../Images/microicons/yundonghui1.png);
font-family: 微软雅黑,黑体;}
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
     <div id="container">
 
 
  <div id="mainContent">

    
    <div id="content" style="text-align:center">  <img src="../Images/icons/SM/settings.png"
            style="height: 420px; width: 840px;" usemap="#SETmap" />

    <map id="SETmap" name="SETmap" >
					
                <area shape="rect" coords="0, 0, 411, 434" href="Settime.aspx"
                    alt="SetGameStartTime.aspx" />

                 <area shape="rect" coords="426, 3, 839, 437" href= "SetBackFunction.aspx"
                    alt="" />
              </map>
</div>
  </div>
  
    </form>
</body>
</html>


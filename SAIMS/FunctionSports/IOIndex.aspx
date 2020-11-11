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
        body { font-family:微软雅黑,黑体; font-size:14px; 
    background-image: url('../Images/microicons/yundonghui1.png');
   

    
     }


#container {margin:0 auto; width:100%;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
     <div id="container">


    
    <div >  <img src="../Images/icons/SM/IO.png"  usemap="#IOmap"/>
              <map id="Map1" name="IOmap" >
					
                <area shape="rect" coords="0, 0, 281, 499" href="setunlock.aspx" />
                <area shape="rect" coords="289, 0, 711, 499" href="IO-IC.aspx" />
                <area shape="rect" coords="720, 0, 1869, 1213" href="IO-Manual.aspx" />
              </map>
</div>
  </div>
 
    </form>
</body>
</html>



<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainFunc.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>考勤管理 - 济南外国语学校校务综合管理系统</title>
    <style type="text/css">      
       
        #sidebar { float:left; width:256px; height:500px; }
        .links {color:#FFFFFF; font-family:微软雅黑; }
        #content { margin-left:261px !important; margin-left:258px ; 
height:500px; }
       
        body { font-size:14px;  background-position: center center;
               background-image: url('../Images/backgrounds/Attendance.jpg'); 
               background-repeat:no-repeat;
               background-color: #CCCCCC;
               background-attachment: fixed;
               margin:0;
               font-family:微软雅黑;
        }
        .tblinks {color: #CCCCCC;}
      #container {margin:0 auto; width:100%;}
      #header {
                height:100px;
                background-image: url('../Images/titles/shangbiaoti.png');
                margin-bottom:5px;
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
        .auto-style2 {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<div id="container">
  <div id="header" class="auto-style1"><a href="../index.aspx" ><img src="../Images/titles/logo.png" style="float: left" /></a>
       <view:viewinfo ID="Viewinfo1" runat="server"/>

</div>
 <div id="div1">&nbsp;</div>
  <div id="mainContent">
        <div style="float:left; height: 0px; width: 20px;" >&nbsp;&nbsp; </div>
      <div style="float:right; height: 0px; width: 20px;" >&nbsp;&nbsp; </div>
    <div id="sidebar"><table>
      <tr><td><a href="Index.aspx"><img src="../Images/microicons/kaoqin.png" style="height:100px;width:256px"/></a></td></tr>
    
   <tr style="background-image: url('../Images/microicons/kaoqin1.png'); height: 40px;"><td><ul>
     <li><a class="links" href="mainfunc.aspx?id=leave">离校审批<br>
       Leaving Permission</a></li>
   </ul></td>
   </tr> 
        <tr style="background-image: url('../Images/microicons/kaoqin1.png'); height: 40px;">
            <td><ul>
       <li><a class="links" href="mainfunc.aspx?id=class">班级签到<br>
         Class Attendance</a></li>
     </ul></td>
        </tr>
     <tr style="background-image: url('../Images/microicons/kaoqin1.png'); "><td class="auto-style2"><ul>
       <li><a class="links" href="mainfunc.aspx?id=dom">宿舍登记<br>
         Dorm. Attendance</a></li>
     </ul></td>
     </tr>  
         <tr style="background-image: url('../Images/microicons/kaoqin1.png'); "><td class="auto-style2"><ul>
       <li><a class="links" href="mainfunc.aspx?id=doc">校医登记<br>
         Doctor Attendance</a></li>
     </ul></td>
     </tr>  
</table></div>
    
    <div id="content" runat="server">

 </div>
  </div>
     <div id="div2">&nbsp;</div>
  <div id="footer">©2012 - 2015 济南外国语学校高中部学生会信息技术部 / IT Dept., the Student&#39;s Union of JFLS Senior Branch
      <br />
      保留所有权利。 All rights reserved.&nbsp;<a class="tblinks" href="../AboutUs.aspx">[关于我们]</a> <a class="tblinks" href="../ConnectUs.aspx">[联系我们]</a></div>
</div>
    </form>
    
</body>
</html>

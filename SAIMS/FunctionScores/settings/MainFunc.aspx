<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainFunc.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">      
       
        #sidebar { float:left; width:200px; height:500px; }
        #content { margin-left:205px !important; margin-left:202px; height:500px; }
       
        body { font-family:Verdana; font-size:14px;  background-position: center center;
               background-image: url('../Images/backgrounds/background.png'); 
               background-repeat:no-repeat;
               background-color: #CCCCCC;
               background-attachment: fixed;
               margin:0;}
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div id="container">
  <div id="header"></div>
 <div id="div1">&nbsp;</div>
  <div id="mainContent">
    <div id="sidebar"></div>
    
    <div id="content" runat="server">

 </div>
  </div>
     <div id="div2">&nbsp;</div>
  <div id="footer"></div>
</div>
    </form>
    
</body>
</html>

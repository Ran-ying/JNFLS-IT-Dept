<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="ContestantScoreIndex.aspx.cs" Inherits="FunctionSports_ContestantScore" %>
<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
           body { font-family:微软雅黑; font-size:14px;  background-position: center center;
    background-image: url('../Images/microicons/yundonghui1.png');
   }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
    <body>
    
<div >

       

 <img src="../Images/icons/SM/jingsai.png"  usemap="#IOmap"/>
              <map id="Map1" name="IOmap" >
					
                <area shape="rect" coords="0, 0, 421, 499" href="ContestantScoreInput.aspx" />
                <area shape="rect" coords="429, 0, 711, 499" href="ContestantScoreAdvancement.aspx" />
                <area shape="rect" coords="720, 0, 1869, 1213" href="ContestantScoreAward.aspx" />
              </map>
  
   
    
      
</div>
    </body>
    </html>
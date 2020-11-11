<!--#include file="conn/rs.asp"-->
<%if request("action") = "login" then%>
<!--#include file="data/pwd.asp"-->

<%

function killw(byval s1) '过滤字符型参数
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function

rs.open "select idnum,username,pwd,confirmed from users where idnum='" & killw(Replace(request.form("idnum"),"x","X")) & "' and (pwd='" & md5(request.form("pwd"),32) & "' or isnull(pwd))",conn,1,1
if not rs.bof then

session("zs_idnum") = rs("idnum")
session("zs_cname") = rs("username")
session("confirmed") = rs("confirmed")

if isnull(rs("pwd")) then
if request.form("pwd") = "" then
session("zs_pwd") = True%>
<script lanaguage='javascript'>    alert('登陆成功！请先设置密码')</script>
<script>    self.location.href = 'change_pwd.asp'; </script>
<%response.end
else
%>
<script lanaguage='javascript'>    alert('账号或密码有误，请返回重试！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
end if
%>
<script lanaguage='javascript'>    alert('登录成功！')</script>
<script>    window.top.self.location.href = 'main.asp'; </script>
<%
else
%>
<script lanaguage='javascript'>    alert('账号或密码有误，请返回重试！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
rs.close
end if

if request("action") = "logout" then
session.abandon()
%>
<script lanaguage='javascript'>    alert('退出成功！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
end if
%>


<%if session("confirmed") = false then
%>
<script language="javascript">alert("您暂未通过审核，请耐心等待。\n通过审核后，请点击上方的个人主页来创建您的页面。\n您也可以通过右上角的搜索框来搜索您所需要的校友信息。")</script>
<%
end if
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN " > 
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>济南外国语学校校友录</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .fixtop
     {
         position: fixed; 
         top：0;
         z-index:1;
     }
     .bottom
    {
        position: fixed; 
         bottom:0;
        z-index:10;
    }
    .content
    {
        z-index:0;
        position:absolute;
        top:40px;
    }
    .content2
    {
        z-index:0;
        position:relative;
        top:40px;
    }
    .style4
    {
        height: 30px;
    }
    .style5
    {
        height: 40px;
    }
    </style>
<!--[if gte IE 6]>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .fixtop
     {
         position: fixed; 
         top：0;
         z-index:1;
     }
     .bottom
    {
        position: fixed; 
         bottom:0;
        z-index:10;
    }
    .content2
    {
        z-index:0;
        position:fixed;
        top:40px;
    }
    .style4
    {
        height: 30px;
    }
    .style5
    {
        height: 40px;
    }
    </style>
<![endif]-->
 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<div>
<table border="0" width="100%" cellspacing="0" cellpadding="0" height="40px" bgcolor="#67a2cb" class="fixtop">
 <tr>
   <td align="center" >
      <table border="0" width="800px" cellspacing="0" cellpadding="0" height="40px" bgcolor="#67a2cb">
        <tr>
        <td align="left">
        <table border="0" width="800px" cellspacing="0" cellpadding="0" height="40px" bgcolor="#67a2cb">
        <tr>
            <td width="200px">
            <map name="FPMap00">
				<area href="main.asp" shape="rect" coords="0, 0, 200, 40">
				</map>
            <img src="image/logo1.png" border="0" usemap="#FPMap00"/>
            </td>
            <td width="20">
            </td>
            <td width="100">
       <map name="FPMap2">
				<area href="userinfo.asp" target="I1" shape="rect" coords="0, 0, 100, 30">
				</map>
                <img src="image/button1.png" border="0" usemap="#FPMap2"/>
            </td>
            <td width="100">
       <map name="FPMap3">
				<area href="yourpage.asp" target="I1" shape="rect" coords="0, 0, 100, 30">
				</map>
                <img src="image/button2.png" border="0" usemap="#FPMap3"/>
            </td>
            <td width="100">
       <map name="FPMap6">
				<area href="main.asp?action=logout" target="I1" shape="rect" coords="0, 0, 100, 30">
				</map>
                <img src="image/button5.png" border="0" usemap="#FPMap6"/>
            </td>
            <td width="80">
            </td>
            <form name="form1" method="post" action="pages.asp?action=search" target="I1">
            <td width="150">
                <input name="key1" type="text" class="style4">
            </td>
            <td width="50">
                <input id="Submit1" type="submit" class="style4" value="搜索"/>
  
            </td>
            </form>
        </tr>
        </table>
        </td>
        </tr>
      </table>      
   </td>
 </tr>
</table> 

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%" bgcolor="#FFFFFF">
 <tr>
   <td align="center">
       <table border="0" width="800" cellspacing="0" cellpadding="0" height="100%" bgcolor="#FFFFFF" class="content2">
       <tr >
       <td align="center" id="iHeight0" width="200" height="100%" bgcolor="#67a2cb" valign="top">
       <table width="200">
       <tr>
       <td><map name="FPMap0">
				<area href="main.asp" shape="rect" coords="0, 0, 567, 369">
				</map>
                <img src="image/logo2.png" border="0" width="200" usemap="#FPMap0"/></td>
       </tr>
       <tr>
       <td height="40" width="200">
       <map name="FPMap1">
				<area href="newscenter.asp" target="I1" shape="rect" coords="0, 0, 100, 30">
				</map>
                <img src="image/button6.png" border="0" usemap="#FPMap1"/></td>
       </tr>
       <tr>
       <td width="200" class="style5">
       <map name="FPMap5">
				<area href="recent.asp" target="I1" shape="rect" coords="0, 0, 100, 30">
				</map>
                <img src="image/button4.png" border="0" usemap="#FPMap5"/></td>
       </tr>
       <tr>
       <td height="40" width="200">
       <map name="FPMap7">
				<area href="favorite.asp" target="I1" shape="rect" coords="0, 0, 100, 30">
				</map>
                <img src="image/button7.png" border="0" usemap="#FPMap7"/></td>
       </tr>
       <tr>
       <td height="40" width="200">
       <map name="FPMap4">
				<area href="ask.asp" target="I1" shape="rect" coords="0, 0, 100, 30">
				</map>
                <img src="image/button3.png" border="0" usemap="#FPMap4"/></td>
       </tr>
       </table>
       </td>
       <td id="iHeight" name="iHeight" align="center" width="600" height="100%" bgcolor="#BBBBBB">
           <iframe name="I1" width="600" height="100%" src="userinfo.asp" border="0" target="maintg" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></p>
	       浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
       
       </td>
      </tr>
      </table>    
   </td>
 </tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="40px" bgcolor="#67a2cb" class="bottom">
 <tr>
   <td align="center">
     <table>
       <tr>
         <td width="200"></td>
        <td width="600">
       <p align="center">
         <font size="2" color="#999999">
		济南外国语学校高中部2011级 秦子堃 制作
        </font>
         </p></td>
       </tr>
     </table>      
   </td>
 </tr>
</table>
</div>

</body>

</html>

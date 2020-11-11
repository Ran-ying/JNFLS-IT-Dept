<!--#include file="conn/rs.asp"-->
<!--#include file="conn/rs2.asp"-->

<%
if session("zs_idnum") = "" then
%>
<script lanaguage='javascript'>alert('您还没有登录！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
%>
<%
if session("confirmed") = false then
%>
<script lanaguage='javascript'>    alert('您还没有被授权！')</script>
<script>    window.top.self.location.href = 'main.asp'; </script><%
response.end
end if
%>
<%
function killw(byval s1) '过滤字符型参数
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function
%>

<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>最近发布</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .style1
    {
        width:200px;
    }
    .style2
    {
        width:400px
    }
    .style3
    {
        height: 40px;
    }
    .style4
    {
        height: 40px;
        width: 20px
    }
    </style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">
<table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
     <tr>
      <td height="60" bgcolor="#BBBBBB" align="center" valign="center">
					<p align="center"><font size="5" color="#000000"><b>最 近 发 布</b></font></p>
	  </td>
	 </tr>
     <tr>
	  <td align="left" valign="top">
     <table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
<%
rs.open "select * from pages order by ID desc",conn,1,1
if not rs.eof then
i = 0
do while not rs.eof
 %>
 <tr>
   <td calss="style4" bgcolor="#f7eac7">&nbsp;</td>
   <td class="style3" align="left" bgcolor="#f7eac7"><b><font size="5" color="#316694"><a href="pages.asp?action=view&id=<%= rs("id") %>">
   <%= rs("title") %>
   </a></font></b>
   </td>
 </tr>
<%
i = i + 1
rs.movenext
if i > 10 then
exit do
end if
Loop
rs.close
end if
 %>
         </table>
         </td>
		 </tr>
</table>
</body>

</html>


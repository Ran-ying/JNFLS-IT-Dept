<!--#include file="conn/rs.asp"-->
<%
function killn(byval s1) '过滤数值型参数
if not isnumeric(s1) then 
  killn=0
else
  if s1<0 or s1>2147483647 then 
   killn=0
  else
   killn=clng(s1)
  end if
end if
end function
%>
<%
if session("confirmed") = false then
%>
<script lanaguage='javascript'>    alert('您还没有被授权！')</script>
<script>    window.top.self.location.href = 'main.asp'; </script><%
response.end
end if
%>

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>济南外国语学校校友录</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
</style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%" bgcolor="#BBBBBB">
	<tr>
		<td colspan="6" align="center">　
        <table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
			<tr>
				<td height="100" align="center" valign="top">
					<p align="center"><font size="5" color="#000000"><b>新 闻 中 心</b></font></p>

					<table border="0" width="600" cellspacing="0" cellpadding="0">

                        <%rs.open "select * from news order by adate desc",conn,1,1
if not rs.eof then
Do while not rs.eof and i<=9
i = i + 1
%>
<tr>
<td width="40" bgcolor="#f7eac7"></td>
<td height="30" bgcolor="#f7eac7">
<font color="#000000" size="3">
<a target="I1" href="../news.asp?id=<%=rs("ID")%>"><span style="text-decoration: none">
<font color="#316694"><b>[<%=year(rs("adate")) & "-" & month(rs("adate")) & "-" & day(rs("adate"))%>]<%=rs("title")%></font></b></span></a></font><br>
</td></tr>
<%
rs.movenext
Loop
else
%>
<tr><td height="30">
<b><font size="3" color="#000000">暂无新闻！</font></b>
</td></tr>
<%end if%>
</table>
					<p>　</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>

</html>

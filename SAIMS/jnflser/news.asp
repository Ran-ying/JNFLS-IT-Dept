<!--#include file="conn/rs.asp"-->
<%
if session("confirmed") = false then
%>
<script lanaguage='javascript'>    alert('您还没有被授权！')</script>
<script>    window.top.self.location.href = 'main.asp'; </script><%
response.end
end if
%>
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

rs.open "select title,adate,info from news where id=" & killn(request("ID")),conn,1,1
if rs.bof then %>
<script lanaguage='javascript'>alert('您访问的新闻不存在！')</script>
<script>    window.top.self.location.href = 'main.asp'; </script>
<%end if
%>

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>济南外国语学校 - 公告中心</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
</style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%" bgcolor="#BBBBBB">
	
	<tr>
		<td height="20">
	</tr>	<tr>
		<td colspan="6" align="center">　
        <table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
			<tr>
				<td height="300" align="center" valign="top">
					<p align="center"><font size="5" color="#2B287F"><b>新 闻 中 心</b></font></p>
					<p align="center">　</p>

					<table border="0" width="600" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" bgcolor="#f3da98"><b>
							<font color="#000080">&nbsp;</font><font color="#000080"><span style="text-decoration: none">[<%=year(rs("adate")) & "-" & month(rs("adate")) & "-" & day(rs("adate"))%>]<%=rs("title")%></span></a></font></b></td>
						</tr>

						<tr>
							<td height="30" width="600" align="left" bgcolor="#f7eac7">
							<font size="2" color="#2D287F"><%=rs("info")%></font></td>
						</tr></table>
					<p>　</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>

</html>

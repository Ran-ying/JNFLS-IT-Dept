
<!--#include file="conn/rs.asp"-->
<!--#include file="data/pwd.asp"-->
<%
function killw(byval s1) '过滤字符型参数
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function




if request("action") = "change" then

rs.open "select [pwd] from users where idnum='" & killw(Replace(request.form("idnum"),"x","X")) & "' and [answer]='" & killw(request.form("answer")) & "' and not isnull([answer])",conn,1,3
if rs.bof then%>
<script lanaguage='javascript'>alert('密码保护问题答案错误！')</script>
<%else

if len(request.form("pwd")) < 6 or len(request.form("pwd")) > 14 then
%>
<script lanaguage='javascript'>alert('密码长度不符合要求！密码长度应为6-14位。')</script>
<script>    window.top.self.location.href = 'change_pwd.asp'; </script>
<%response.end
end if


if request.form("pwd") = request.form("pwd2") then
rs("pwd") = md5(request.form("pwd"),32)
rs.update
%>
<script lanaguage='javascript'>alert('密码更改成功！请重新登录。')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%session.abandon()
else%>
<script lanaguage='javascript'>alert('两次输入密码不一致，请重试！')</script><%
end if
end if
rs.close


end if%>






<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>济南外国语学校校友录</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
</style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="200">
	<tr>
		<td valign="top" height="200">　
        <table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
			<tr>
				<td>
				<p align="center"><font size="5" color="#000000"><b>重置密码</b></font></p>
				
				<%if not request("action")="Next" then%>
				<form method="POST" action="del_pwd.asp?action=Next">
					<p align="center"><font color="#000000"><b><font size="2">
					请输入要清空密码的身份证号：</font></b><input name="idnum" size="20" style="font-weight: 700" maxlength="18"></font></p>
					<p align="center"><input type="submit" value="继续" name="B1"></p>
				</form>
				<p align="center">
				<%else
				rs.open "select [question] from users where idnum='" & killw(Replace(request.form("idnum"),"x","X")) & "'",conn,1,1
				if rs.bof then
				%>
				<b><font color="#FF0000">该身份证号未注册！</font></b></p>
				<p align="center"><font color="#FF0000" size="2"><b>
				<a href="del_pwd.asp">【返回】</a></b></font>
				<%else%>
				<%if isnull(rs("question")) then%>
				<p align="center"><b><font color="#FF0000">该身份证号未设置密保问题及答案，请致电招生办核实信息后手动清除！</font></b></p>
				<p align="center"><font color="#FF0000" size="2"><b>
				<a href="del_pwd.asp">【返回】</a></b></font>				
				<%else%>
								</p>
								<form method="POST" action="del_pwd.asp?action=change">
					<p align="center"><b><font size="2" color="#000000">密码提示问题：</font><font size="2" color="#0000FF"><%=rs("question")%></font></b></p>
					<p align="center"><font color="#000000"><b><font size="2">
					请输入密保答案：</font></b><input name="answer" size="20" style="font-weight: 700"></font></p>
					<p align="center"><font color="#000000"><b><font size="2">
					请设置密码：</font></b><input name="pwd" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><font color="#000000"><b><font size="2">
					请再输一遍：</font></b><input name="pwd2" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><input type="submit" value="提交" name="B2"></p>
					<input type="hidden" name="idnum" value="<%=request.form("idnum")%>">
				</form>
				<%end if
				end if
				rs.close%>
				<%end if%>
                </td>
			</tr>
			</table>
		</td>
	</tr>
</table>

</body>

</html>

<!--#include file="conn/rs.asp"-->
<!--#include file="conn/rs2.asp"-->
<!--#include file="conn/rs3.asp"-->
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

rs.open "select idnum,username,pwd from users where idnum='" & killw(Replace(request.form("idnum"),"x","X")) & "' and (pwd='" & md5(request.form("pwd"),32) & "' or isnull(pwd))",conn,1,1
if not rs.bof then

session("zs_idnum") = rs("idnum")
session("zs_cname") = rs("username")

if isnull(rs("pwd")) then
if request.form("pwd") = "" then
session("zs_pwd") = True%>
<script lanaguage='javascript'>alert('登陆成功！请先设置密码')</script>
<script>    self.location.href = 'change_pwd.asp'; </script>
<%response.end
else
%>
<script lanaguage='javascript'>alert('账号或密码有误，请返回重试！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
end if

%>
<script lanaguage='javascript'>alert('登录成功！')</script>
<script> self.location.href = 'userinfo.asp'; </script>
<%
else
%>
<script lanaguage='javascript'>alert('账号或密码有误，请返回重试！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
rs.close
end if

if request("action") = "logout" then
session.abandon()
%>
<script lanaguage='javascript'>alert('退出成功！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
end if


if session("zs_idnum") = "" then
%><script lanaguage='javascript'>alert('您还没有登录！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script><%
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
    .style1
    {
        height: 30px;
    }
    .FixedTitleRow
     {
         position:fixed;
         top:0px;         
     }
</style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">

<table border="0" width="600" cellspacing="0" cellpadding="0" height="100%" bgcolor="#BBBBBB">
			<tr>
				<td height="20"></td>
			</tr>
			<tr>
				<td height="300" align="center" valign="top">
					<p align="center"><font size="5" color="#000000"><b>用 户 中 心</b></font></p>
					<p align="center"><font color="#316694" size="2"><b>
					欢迎回来，<%=session("zs_cname")%>。以下是您的个人信息：</b></font></p>

                    <%rs.open "select * from users where idnum ='" & killw(session("zs_idnum")) & "'",conn,1,1
                    if not rs.bof then%>
					<table border="0" width="600" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" colspan="3" bgcolor="#f3da98"><b>
							<font color="#000000">&nbsp;您的个人信息：&nbsp;</font><a href="change_pwd.asp"><font color="#316694">【更改密码】</font></a></b></td>
						</tr>
						<tr>
							<td width="200" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000">姓名：</font></td>

                            <td width="530" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000"><%=rs("username")%></font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">性别：</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%if rs("sex") = 1 then%><%="男"%><% else %><%="女"%><%End if%></font></td>
						</tr>
                        <tr>
							<td width="200" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000">身份证号：</font></td>

                            <td width="530" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000"><%=rs("idnum")%></font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">年级：</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%=rs("grade")%>级</font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">班级：</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%=rs("class")%>班</font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">注册时间：</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%=rs("reg_date")%></font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">审核状态：</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%if rs("confirmed") then%><%="已通过" %><%else %><%="暂未通过，请耐心等待。" %><%End if %></font></td>
						</tr>
                        <tr>
							<td height="30" colspan="3" bgcolor="#f3da98" align="center"><b>您的页面已被
                            <%rs2.open "select id from pages where idnum = '" & killw(session("zs_idnum")) & "'",conn,1,1
                              if not rs2.eof then
                              rs3.open "select * from favorite where pageid = '" & rs2("id") & "'",conn,1,1
                              if not rs3.eof then
                              i = 0
                              do while not rs3.eof
                              i = i + 1
                              rs3.movenext
                              loop
                              %>
                              <%= i %>
                              <%
                              else
                              %>
                              0
                              <%
                              end if
                              end if
                               %>
                            人收藏</b></td>
						</tr>
<%
end if
rs.close%>

					</table>
　</td>
			</tr>
			
		</table>
</body>

</html>

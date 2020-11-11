<%if request("action") = "submit" then

alerted = false


'=======姓名验证=======
if request.form("cname") = "" and alerted = false then
%><script lanaguage='javascript'>alert('请输入姓名！')</script><%
alerted = True
end if
if len(request.form("cname")) < 2 and alerted = false then
%><script lanaguage='javascript'>alert('姓名长度过短，请返回重试！')</script><%
alerted = True
end if
if len(request.form("cname")) > 4 and alerted = false then
%><script lanaguage='javascript'>alert('姓名长度过长，请返回重试！')</script><%
alerted = True
end if
For i=1 to len(request.form("cname"))
if not abs(asc(mid(request.form("cname"),i,1)))>127 then 
%><script lanaguage='javascript'>alert('姓名中有非法字符，请返回重试！')</script><%
alerted = True
Exit for
end if 
Next

'=======性别验证=======
if not (request.form("sex") = 1 or request.form("sex") = 2) and alerted = false then
%><script lanaguage='javascript'>alert('请选择性别！')</script><%
alerted = True
end if

'=======身份证验证=======
if not len(request.form("idnum")) = 18 and alerted = false then
%><script lanaguage='javascript'>alert('身份证位数不足，请输入18位身份证号！')</script><%
alerted = True
end if
if alerted = false then
cID = left(request.form("idnum"),17)
nSum=mid(cID,1,1) * 7
nSum=nsum+mid(cID,2,1) * 9 
nSum=nsum+mid(cID,3,1) * 10 
nSum=nsum+mid(cID,4,1) * 5 
nSum=nsum+mid(cID,5,1) * 8 
nSum=nsum+mid(cID,6,1) * 4
nSum=nsum+mid(cID,7,1) * 2
nSum=nsum+mid(cID,8,1) * 1
nSum=nsum+mid(cID,9,1) * 6
nSum=nsum+mid(cID,10,1) * 3
nSum=nsum+mid(cID,11,1) * 7
nSum=nsum+mid(cID,12,1) * 9
nSum=nsum+mid(cID,13,1) * 10
nSum=nsum+mid(cID,14,1) * 5
nSum=nsum+mid(cID,15,1) * 8
nSum=nsum+mid(cID,16,1) * 4
nSum=nsum+mid(cID,17,1) * 2
'*计算校验位
check_number=12-nsum mod 11
If check_number=10 then
check_number="X"
elseIf check_number=12 then
check_number="1"
elseif check_number=11 then
check_number="0"
End if
if cstr(right(request.form("idnum"),1)) <> cstr(check_number) and alerted = false then
%><script lanaguage='javascript'>alert('身份证号码输入有误，请检查后再试！')</script><%
alerted = True
end if
end if

'=======年级验证=======
if request.form("grade") = "" and alerted = false then
%><script lanaguage='javascript'>      alert('请输入年级！')</script><%
alerted = True
end if

'=======班级验证=======
if request.form("class") = "" and alerted = false then
%><script lanaguage='javascript'>      alert('请输入班级！')</script><%
alerted = True
end if

'=======密码校验=======
if len(request.form("pwd"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('请输入密码！')</script><%
alerted = True
end if
if len(request.form("pwd2"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('请再次输入密码！')</script><%
alerted = True
end if
if request.form("pwd") <> request.form("pwd2") and alerted = false then
%><script lanaguage='javascript'>alert('两次密码输入不一致，请返回重输！')</script><%
alerted = True
end if
if len(request.form("pwd")) < 6 and alerted = false then
%><script lanaguage='javascript'>alert('密码长度应在6位以上，请返回重试！')</script><%
alerted = True
end if
if len(request.form("pwd")) > 15 and alerted = false then
%><script lanaguage='javascript'>alert('密码长度应为15位以内，请返回重试！')</script><%
alerted = True
end if


'=======密保问题校验=======
if len(request.form("question"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('请输入密码保护问题！')</script><%
alerted = True
end if
if len(request.form("question")) < 4 and alerted = false then
%><script lanaguage='javascript'>alert('密码保护问题长度应在4个字以上，请返回重试！')</script><%
alerted = True
end if
if len(request.form("question")) > 12 and alerted = false then
%><script lanaguage='javascript'>alert('密码保护问题长度应为12个字以内，请返回重试！')</script><%
alerted = True
end if


'=======密保答案校验=======
if len(request.form("answer"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('请输入密码保护问题！')</script><%
alerted = True
end if
if len(request.form("answer")) < 2 and alerted = false then
%><script lanaguage='javascript'>alert('密码保护问题长度应在2个字以上，请返回重试！')</script><%
alerted = True
end if
if len(request.form("answer")) > 12 and alerted = false then
%><script lanaguage='javascript'>alert('密码保护问题长度应为12个字以内，请返回重试！')</script><%
alerted = True
end if

'=======校验是否已经注册=======

function killw(byval s1) '过滤字符型参数
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function

%>
<!--#include file="conn/rs.asp"-->
<!--#include file="data/pwd.asp"-->
<%

rs.open "select * from users where idnum='" & killw(request.form("idnum")) & "'",conn,1,1
if not rs.bof then
%>
<script lanaguage='javascript'>alert('该身份证号已经注册，如有疑问请联系管理员！')</script>
<%
end if
rs.close


If alerted = false then

rs.open "select * from users",conn,1,3
rs.addnew

rs("username") = killw(request.form("cname"))
rs("pwd") = md5(request.form("pwd"),32)
rs("sex") = request.form("sex")
rs("grade") = request.form("grade")
rs("class") = request.form("class")
rs("idnum") = Replace(request.form("idnum"),"x","X")
rs("question") = Request.form("question")
rs("answer") = Request.form("answer")
rs("confirmed") = "false"
rs("reg_date") = now()
rs("reg_ip") = Request.ServerVariables("REMOTE_ADDR")

rs.update
rs.close

session("zs_idnum") = Replace(request.form("idnum"),"x","X")
session("zs_cname") = killw(request.form("cname"))
%>
<script lanaguage='javascript'>alert('注册成功！请等待审核。')</script>
<script> window.top.self.location.href= 'main.asp'; </script>
<%
Response.End
else
%>
<script>    history.back();</script>

<%
end if
end if%>

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>济南外国语学校 - 用户注册</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .style1
    {
        width: 150px;
    }
    .style2
    {
        width: 239px;
    }
    .style4
    {
        height: 603px;
    }
    .style5
    {
        width: 10%;
    }
    </style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;">
<table border="0" width="600" cellspacing="0" cellpadding="0" height="100%" bgcolor="#BBBBBB">
			<tr>
				<td height="10">
				</td>
			</tr>
			<tr>
				<td height="300" align="left" valign="top">
				<form method="POST" action="reg.asp?action=submit" name="form1" onsubmit="return uname()">
				<script language=javascript>
function uname(){
var pattern=/^[\u4e00-\u9fa5]+$/;
if (!pattern.test(document.form1.cname.value)){ 
alert("用户名必须为汉字！"); 
document.form1.cname.focus();
return false; 
}}
				</script>
					<p align="center"><b><font size="5" color="#000000">用 户 注 册</font></b></p>
					<p align="center"><font color="#FF0000" size="2"><b>
					注：以下内容请按照本人信息进行填写。</b></font></p>
					<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#BBBBBB">
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">姓　　名：</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="cname" size="20" value="<%=request.form("cname")%>"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（请按户口本或身份证填写，2-4个汉字）</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">性　　别：</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000"><select size="1" name="sex">
							<option value="0">--请选择--</option>
							<option value="1" <%if request.form("sex")=1 then response.write "Selected"%>>男</option>
							<option value="2" <%if request.form("sex")=2 then response.write "Selected"%>>女</option>
							</select></font></b></td>
							<td height="40">　</td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">身份证号：</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="idnum" size="20" value="<%=request.form("idnum")%>" maxlength="18"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（请按户口本或身份证填写）</font></b></td>
						</tr>
                        <tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">入学年级：</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="grade" size="20" value="<%=request.form("grade")%>" maxlength="18"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（请填写入学年级）</font></b></td>
						</tr>
                        <tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">入学班级：</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="class" size="20" value="<%=request.form("class")%>" maxlength="18"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（请填写入学班级）</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">设 置 密 码：</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="password" name="pwd" size="20"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（密码建议使用字母、数字混合，6-15位）</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">密 码 确 认：</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="password" name="pwd2" size="20"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（请再输一遍）</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<font color="#000000"><b>密码保护问题：</b></font></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="question" size="20" value="<%=request.form("question")%>"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（4-12个字符，请不要使用特殊符号）</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<font color="#000000"><b>密码问题答案：</b></font></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="answer" size="20"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">（2-12个字符，请不要使用特殊符号）</font></b></td>
						</tr>
					</table>
					<p align="center">
					<input type="submit" value="提  交" name="B1">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="重  置" name="B2"></p>
				</form>
　</td>
			</tr>
			<tr>
				<td>　</td>
			</tr>
		</table>
</body>
</html>


<!--#include file="conn/rs.asp"-->
<!--#include file="data/pwd.asp"-->
<%
function killw(byval s1) '�����ַ��Ͳ���
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function




if request("action") = "change" then

rs.open "select [pwd] from users where idnum='" & killw(Replace(request.form("idnum"),"x","X")) & "' and [answer]='" & killw(request.form("answer")) & "' and not isnull([answer])",conn,1,3
if rs.bof then%>
<script lanaguage='javascript'>alert('���뱣������𰸴���')</script>
<%else

if len(request.form("pwd")) < 6 or len(request.form("pwd")) > 14 then
%>
<script lanaguage='javascript'>alert('���볤�Ȳ�����Ҫ�����볤��ӦΪ6-14λ��')</script>
<script>    window.top.self.location.href = 'change_pwd.asp'; </script>
<%response.end
end if


if request.form("pwd") = request.form("pwd2") then
rs("pwd") = md5(request.form("pwd"),32)
rs.update
%>
<script lanaguage='javascript'>alert('������ĳɹ��������µ�¼��')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%session.abandon()
else%>
<script lanaguage='javascript'>alert('�����������벻һ�£������ԣ�')</script><%
end if
end if
rs.close


end if%>






<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���������ѧУУ��¼</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
</style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="200">
	<tr>
		<td valign="top" height="200">��
        <table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
			<tr>
				<td>
				<p align="center"><font size="5" color="#000000"><b>��������</b></font></p>
				
				<%if not request("action")="Next" then%>
				<form method="POST" action="del_pwd.asp?action=Next">
					<p align="center"><font color="#000000"><b><font size="2">
					������Ҫ�����������֤�ţ�</font></b><input name="idnum" size="20" style="font-weight: 700" maxlength="18"></font></p>
					<p align="center"><input type="submit" value="����" name="B1"></p>
				</form>
				<p align="center">
				<%else
				rs.open "select [question] from users where idnum='" & killw(Replace(request.form("idnum"),"x","X")) & "'",conn,1,1
				if rs.bof then
				%>
				<b><font color="#FF0000">�����֤��δע�ᣡ</font></b></p>
				<p align="center"><font color="#FF0000" size="2"><b>
				<a href="del_pwd.asp">�����ء�</a></b></font>
				<%else%>
				<%if isnull(rs("question")) then%>
				<p align="center"><b><font color="#FF0000">�����֤��δ�����ܱ����⼰�𰸣����µ��������ʵ��Ϣ���ֶ������</font></b></p>
				<p align="center"><font color="#FF0000" size="2"><b>
				<a href="del_pwd.asp">�����ء�</a></b></font>				
				<%else%>
								</p>
								<form method="POST" action="del_pwd.asp?action=change">
					<p align="center"><b><font size="2" color="#000000">������ʾ���⣺</font><font size="2" color="#0000FF"><%=rs("question")%></font></b></p>
					<p align="center"><font color="#000000"><b><font size="2">
					�������ܱ��𰸣�</font></b><input name="answer" size="20" style="font-weight: 700"></font></p>
					<p align="center"><font color="#000000"><b><font size="2">
					���������룺</font></b><input name="pwd" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><font color="#000000"><b><font size="2">
					������һ�飺</font></b><input name="pwd2" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><input type="submit" value="�ύ" name="B2"></p>
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

<%if session("zs_idnum")="" then
%>
<script lanaguage='javascript'>alert('����û�е�¼��')</script>
<script> self.location.href= 'index.asp'; </script>
<%response.end
end if%>
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
if request("action") = "add" then

rs.open "select pwd from users where idnum='" & killw(Replace(session("zs_idnum"),"x","X")) & "' and isnull(pwd)",conn,1,3
if rs.bof then%>
<script lanaguage='javascript'>alert('�������������룡��ʹ�������¼��')</script>
<script> self.location.href= 'index.asp'; </script>
<%session.abandon()
else

if len(request.form("pwd")) < 6 or len(request.form("pwd")) > 14 then
%>
<script lanaguage='javascript'>alert('���볤�Ȳ�����Ҫ�����볤��ӦΪ6-14λ��')</script>
<script> self.location.href= 'change_pwd.asp'; </script>
<%response.end
end if


if request.form("pwd") = request.form("pwd2") then
rs("pwd") = md5(request.form("pwd"),32)
rs.update
%>
<script lanaguage='javascript'>alert('�������óɹ�����ʹ�������¼��')</script>
<script> self.location.href= 'index.asp'; </script>
<%session.abandon()
else%>
<script lanaguage='javascript'>alert('�����������벻һ�£������ԣ�')</script><%
end if
end if
rs.close


end if


if request("action") = "change" then

rs.open "select pwd from users where idnum='" & killw(Replace(session("zs_idnum"),"x","X")) & "' and pwd='" & md5(request.form("old_pwd"),32) & "'",conn,1,3
if rs.bof then%>
<script lanaguage='javascript'>alert('ԭ�������')</script>
<%else

if len(request.form("pwd")) < 6 or len(request.form("pwd")) > 14 then
%>
<script lanaguage='javascript'>alert('���볤�Ȳ�����Ҫ�����볤��ӦΪ6-14λ��')</script>
<script> self.location.href= 'change_pwd.asp'; </script>
<%response.end
end if


if request.form("pwd") = request.form("pwd2") then
rs("pwd") = md5(request.form("pwd"),32)
rs.update
%>
<script lanaguage='javascript'>alert('������ĳɹ��������µ�¼��')</script>
<script> self.location.href= 'index.asp'; </script>
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
<title>���������ѧУ - ��������ϵͳ</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
</style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
<tr><td height="20"></td></tr>
	<tr>
		<td align="center">��
        <table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
			
            <tr>
				<td valign="top">
				<p align="center"><font size="5" color="#2B287F"><b>��������</b></font></p>
				
				<%if session("zs_pwd")=True then%>
				<form method="POST" action="change_pwd.asp?action=add">
					<p align="center"><font color="#2D287F"><b><font size="2">
					���������룺</font></b><input name="pwd" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><font color="#2D287F"><b><font size="2">
					���ٴ�ȷ�ϣ�</font></b><input name="pwd2" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><input type="submit" value="�ύ" name="B1"></p>
				</form>
				<%else%>
								<form method="POST" action="change_pwd.asp?action=change">
					<p align="center"><font size="2" color="#2D287F"><b>������ԭ���룺</b></font><font color="#2D287F"><input name="old_pwd" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><font color="#2D287F"><b><font size="2">
					�����������룺</font></b><input name="pwd" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><font color="#2D287F"><b><font size="2">
					���ٴ�ȷ�ϣ�</font></b><input name="pwd2" size="20" style="font-weight: 700" type="password"></font></p>
					<p align="center"><input type="submit" value="�ύ" name="B2"></p>
				</form>
				<%end if%>
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>

</body>

</html>

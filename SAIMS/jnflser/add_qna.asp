<!--#include file="conn/rs.asp"-->
<%if session("zs_idnum") = "" then%>
<script lanaguage='javascript'>alert('����û�е�¼��')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%response.end
end if
function killw(byval s1) '�����ַ��Ͳ���
if len(s1)=0 then
killw=0
else
killw=cdbl(s1)
end if
end function

if request("action") = "save" then
if request("question") = "" or request("title")="" then
%>
<script lanaguage='javascript'>    alert('����д������')</script>
<script>    self.location.href = 'add_qna.asp';   </script>
<%
else
rs.open "select * from qna",conn,1,3

rs.addnew
rs("question") = left(request("question"),120)
rs("idnum") = session("zs_idnum")
rs("cname") = session("zs_cname")
rs("title") = left(request("title"),8)
rs("sdate") = now()
rs.update
rs.close

%>
<script lanaguage='javascript'>alert('���ʳɹ��������ĵȴ��а�ظ���')</script>
<script>    window.top.self.location.href = 'main.asp'; </script>

<%
end if
end if
%>

<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����ʴ�</title>
</head>

<body onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">
<form method="POST" action="add_qna.asp?action=save">
							
					<table border="1" width="600" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" height="141">
                        <tr>
							<td height="48" colspan="2" bgcolor="#f3da98"><b>
							<font color="#2D287F">&nbsp;�������߷�����</font></b></td>
						</tr>
						<tr>
							<td height="30" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>�ꡡ�⣺</b></font></td>
							<td height="30" width="555" align="left" bgcolor="#f7eac7">
							<font size="2">

								<input name="title" size="27" maxlength="8">(8������)</font></td>
						</tr>
						<tr>
							<td height="100" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>�ڡ��ݣ�</b></font></td>
							<td height="100" width="555" align="center" bgcolor="#f7eac7" valign="top">
							<p align="left">
							<textarea rows="7" name="question" cols="76"></textarea><p align="left">
							<font size="2"><input type="submit" value="�ύ" name="B1">��120�����ڣ�</font></td>
						</tr>
						</table></form>
                        
					
</body>

</html>
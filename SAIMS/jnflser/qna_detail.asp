<!--#include file="conn/rs.asp"-->
<%function killw(byval s1) '�����ַ��Ͳ���
if len(s1)=0 then
killw=0
else
killw=cdbl(s1)
end if
end function


if request("action") = "save" then
if session("zs_uid") = "" then%>
<script lanaguage='javascript'>alert('����Ȩ�Կ�������ѯ���лظ���')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if

rs.open "select * from qna where ID=" & killw(request("ID")) & " and isnull(answer)",conn,1,3
if rs.bof then%>
<script lanaguage='javascript'>alert('���ⲻ���ڻ��ѻظ���')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if

rs("answer") = left(request.form("answer"),200)
rs("replier") = session("zs_uid")
rs("rdate") = now()
rs.update
rs.close

%>
<script lanaguage='javascript'>alert('�ظ��ɹ���')</script>
<%

end if





rs.open "select * from qna where ID=" & killw(request("ID")),conn,1,1
if rs.bof then%>
<script lanaguage='javascript'>alert('��ѯ��Ϣ�����ڣ�')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if

if( rs("idnum") <> session("zs_idnum") ) and session("zs_uid")="" then%>
<script lanaguage='javascript'>alert('����Ȩ�鿴���˵���ѯ��Ϣ��')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����ʴ�</title>
</head>

<body onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">

					<table border="1" width="700" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" height="141">
						<tr>
							<td height="48" colspan="2" bgcolor="#f3da98"><b>
							<font color="#2D287F">&nbsp;�������߷�����</font></b></td>
						</tr>
						<tr>
							<td height="30" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>��ѯ�ˣ�</b></font></td>
							<td height="30" width="555" align="center" bgcolor="#f7eac7">
							<p align="left"><font size="2">&nbsp;[<%=rs("idnum")%>]<%=rs("cname")%></font></td>
						</tr>
						<tr>
							<td height="30" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>�ꡡ�⣺</b></font></td>
							<td height="30" width="555" align="center" bgcolor="#f7eac7">
							<font size="2"><%=rs("title")%>
							��</font></td>
						</tr>
						<tr>
							<td height="100" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>�ڡ��ݣ�</b></font></td>
							<td height="100" width="555" align="center" bgcolor="#f7eac7" valign="top">
							<p align="left"><font size="2"><br>
														����<%=rs("question")%>
							��</font></td>
						</tr>
						<tr>
							<td height="140" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>�𡡸���</b></font></td>
							<td height="140" width="555" align="center" bgcolor="#f7eac7" valign="top">
							<p align="left"><font size="2"><br>
							<%if not isnull(rs("answer")) then%>
 �װ���<%=rs("cname")%>����ã�<br>
							����������������Ѿ��յ������ڴ����⣬<%=rs("answer")%>��<br>
							<br>
							�����������������ʣ����ٴ����߷�����ֱ����ϵ����Ա������ѯ��</font>
								<!--webbot bot="SaveResults" U-File="fpweb:///_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" --><p align="left">
							<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ���������ѧУУ��¼<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=year(rs("rdate"))%>��<%=month(rs("rdate"))%>��<%=day(rs("rdate"))%>��</font>
						    <%else%>
						    
						    <%if session("zs_uid")="" then%>
						    
						    <i><font size="2">&nbsp;&nbsp; �ȴ��ظ�����</font></i>
						    
						    <%else%>
						    <form method="POST" action="qna_detail.asp?action=save">
						    <textarea rows="6" name="answer" cols="69"></textarea><p>
							<input type="submit" value="�ύ" name="B1"></p>
							<input type="hidden" name="ID" value="<%=request("ID")%>">
						    </form>
						     
						    <%end if%>
						    <%end if%>
						    
						   
						    
						    </td>
						</tr>
					</table>
					
</body>

</html>
<!--#include file="conn/rs.asp"-->
<!--#include file="conn/rs2.asp"-->
<!--#include file="conn/rs3.asp"-->
<%if request("action") = "login" then%>
<!--#include file="data/pwd.asp"-->
<%

function killw(byval s1) '�����ַ��Ͳ���
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
<script lanaguage='javascript'>alert('��½�ɹ���������������')</script>
<script>    self.location.href = 'change_pwd.asp'; </script>
<%response.end
else
%>
<script lanaguage='javascript'>alert('�˺Ż����������뷵�����ԣ�')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
end if

%>
<script lanaguage='javascript'>alert('��¼�ɹ���')</script>
<script> self.location.href = 'userinfo.asp'; </script>
<%
else
%>
<script lanaguage='javascript'>alert('�˺Ż����������뷵�����ԣ�')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
rs.close
end if

if request("action") = "logout" then
session.abandon()
%>
<script lanaguage='javascript'>alert('�˳��ɹ���')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
end if


if session("zs_idnum") = "" then
%><script lanaguage='javascript'>alert('����û�е�¼��')</script>
<script>    window.top.self.location.href = 'index.asp'; </script><%
response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���������ѧУУ��¼</title>
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
					<p align="center"><font size="5" color="#000000"><b>�� �� �� ��</b></font></p>
					<p align="center"><font color="#316694" size="2"><b>
					��ӭ������<%=session("zs_cname")%>�����������ĸ�����Ϣ��</b></font></p>

                    <%rs.open "select * from users where idnum ='" & killw(session("zs_idnum")) & "'",conn,1,1
                    if not rs.bof then%>
					<table border="0" width="600" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" colspan="3" bgcolor="#f3da98"><b>
							<font color="#000000">&nbsp;���ĸ�����Ϣ��&nbsp;</font><a href="change_pwd.asp"><font color="#316694">���������롿</font></a></b></td>
						</tr>
						<tr>
							<td width="200" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000">������</font></td>

                            <td width="530" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000"><%=rs("username")%></font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">�Ա�</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%if rs("sex") = 1 then%><%="��"%><% else %><%="Ů"%><%End if%></font></td>
						</tr>
                        <tr>
							<td width="200" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000">���֤�ţ�</font></td>

                            <td width="530" align="center" bgcolor="#f7eac7" class="style1">
							<font size="2" color="#000000"><%=rs("idnum")%></font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">�꼶��</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%=rs("grade")%>��</font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">�༶��</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%=rs("class")%>��</font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">ע��ʱ�䣺</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%=rs("reg_date")%></font></td>
						</tr>
                        <tr>
							<td height="30" width="200" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000">���״̬��</font></td>

                            <td height="30" width="530" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000000"><%if rs("confirmed") then%><%="��ͨ��" %><%else %><%="��δͨ���������ĵȴ���" %><%End if %></font></td>
						</tr>
                        <tr>
							<td height="30" colspan="3" bgcolor="#f3da98" align="center"><b>����ҳ���ѱ�
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
                            ���ղ�</b></td>
						</tr>
<%
end if
rs.close%>

					</table>
��</td>
			</tr>
			
		</table>
</body>

</html>

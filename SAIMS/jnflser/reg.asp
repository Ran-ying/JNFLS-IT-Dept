<%if request("action") = "submit" then

alerted = false


'=======������֤=======
if request.form("cname") = "" and alerted = false then
%><script lanaguage='javascript'>alert('������������')</script><%
alerted = True
end if
if len(request.form("cname")) < 2 and alerted = false then
%><script lanaguage='javascript'>alert('�������ȹ��̣��뷵�����ԣ�')</script><%
alerted = True
end if
if len(request.form("cname")) > 4 and alerted = false then
%><script lanaguage='javascript'>alert('�������ȹ������뷵�����ԣ�')</script><%
alerted = True
end if
For i=1 to len(request.form("cname"))
if not abs(asc(mid(request.form("cname"),i,1)))>127 then 
%><script lanaguage='javascript'>alert('�������зǷ��ַ����뷵�����ԣ�')</script><%
alerted = True
Exit for
end if 
Next

'=======�Ա���֤=======
if not (request.form("sex") = 1 or request.form("sex") = 2) and alerted = false then
%><script lanaguage='javascript'>alert('��ѡ���Ա�')</script><%
alerted = True
end if

'=======���֤��֤=======
if not len(request.form("idnum")) = 18 and alerted = false then
%><script lanaguage='javascript'>alert('���֤λ�����㣬������18λ���֤�ţ�')</script><%
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
'*����У��λ
check_number=12-nsum mod 11
If check_number=10 then
check_number="X"
elseIf check_number=12 then
check_number="1"
elseif check_number=11 then
check_number="0"
End if
if cstr(right(request.form("idnum"),1)) <> cstr(check_number) and alerted = false then
%><script lanaguage='javascript'>alert('���֤��������������������ԣ�')</script><%
alerted = True
end if
end if

'=======�꼶��֤=======
if request.form("grade") = "" and alerted = false then
%><script lanaguage='javascript'>      alert('�������꼶��')</script><%
alerted = True
end if

'=======�༶��֤=======
if request.form("class") = "" and alerted = false then
%><script lanaguage='javascript'>      alert('������༶��')</script><%
alerted = True
end if

'=======����У��=======
if len(request.form("pwd"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('���������룡')</script><%
alerted = True
end if
if len(request.form("pwd2"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('���ٴ��������룡')</script><%
alerted = True
end if
if request.form("pwd") <> request.form("pwd2") and alerted = false then
%><script lanaguage='javascript'>alert('�����������벻һ�£��뷵�����䣡')</script><%
alerted = True
end if
if len(request.form("pwd")) < 6 and alerted = false then
%><script lanaguage='javascript'>alert('���볤��Ӧ��6λ���ϣ��뷵�����ԣ�')</script><%
alerted = True
end if
if len(request.form("pwd")) > 15 and alerted = false then
%><script lanaguage='javascript'>alert('���볤��ӦΪ15λ���ڣ��뷵�����ԣ�')</script><%
alerted = True
end if


'=======�ܱ�����У��=======
if len(request.form("question"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('���������뱣�����⣡')</script><%
alerted = True
end if
if len(request.form("question")) < 4 and alerted = false then
%><script lanaguage='javascript'>alert('���뱣�����ⳤ��Ӧ��4�������ϣ��뷵�����ԣ�')</script><%
alerted = True
end if
if len(request.form("question")) > 12 and alerted = false then
%><script lanaguage='javascript'>alert('���뱣�����ⳤ��ӦΪ12�������ڣ��뷵�����ԣ�')</script><%
alerted = True
end if


'=======�ܱ���У��=======
if len(request.form("answer"))=0 and alerted = false then
%><script lanaguage='javascript'>alert('���������뱣�����⣡')</script><%
alerted = True
end if
if len(request.form("answer")) < 2 and alerted = false then
%><script lanaguage='javascript'>alert('���뱣�����ⳤ��Ӧ��2�������ϣ��뷵�����ԣ�')</script><%
alerted = True
end if
if len(request.form("answer")) > 12 and alerted = false then
%><script lanaguage='javascript'>alert('���뱣�����ⳤ��ӦΪ12�������ڣ��뷵�����ԣ�')</script><%
alerted = True
end if

'=======У���Ƿ��Ѿ�ע��=======

function killw(byval s1) '�����ַ��Ͳ���
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
<script lanaguage='javascript'>alert('�����֤���Ѿ�ע�ᣬ������������ϵ����Ա��')</script>
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
<script lanaguage='javascript'>alert('ע��ɹ�����ȴ���ˡ�')</script>
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
<title>���������ѧУ - �û�ע��</title>
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
alert("�û�������Ϊ���֣�"); 
document.form1.cname.focus();
return false; 
}}
				</script>
					<p align="center"><b><font size="5" color="#000000">�� �� ע ��</font></b></p>
					<p align="center"><font color="#FF0000" size="2"><b>
					ע�����������밴�ձ�����Ϣ������д��</b></font></p>
					<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#BBBBBB">
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">�ա�������</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="cname" size="20" value="<%=request.form("cname")%>"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">���밴���ڱ������֤��д��2-4�����֣�</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">�ԡ�����</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000"><select size="1" name="sex">
							<option value="0">--��ѡ��--</option>
							<option value="1" <%if request.form("sex")=1 then response.write "Selected"%>>��</option>
							<option value="2" <%if request.form("sex")=2 then response.write "Selected"%>>Ů</option>
							</select></font></b></td>
							<td height="40">��</td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">���֤�ţ�</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="idnum" size="20" value="<%=request.form("idnum")%>" maxlength="18"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">���밴���ڱ������֤��д��</font></b></td>
						</tr>
                        <tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">��ѧ�꼶��</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="grade" size="20" value="<%=request.form("grade")%>" maxlength="18"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">������д��ѧ�꼶��</font></b></td>
						</tr>
                        <tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">��ѧ�༶��</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="class" size="20" value="<%=request.form("class")%>" maxlength="18"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">������д��ѧ�༶��</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">�� �� �� �룺</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="password" name="pwd" size="20"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">�����뽨��ʹ����ĸ�����ֻ�ϣ�6-15λ��</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<b><font color="#000000">�� �� ȷ �ϣ�</font></b></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="password" name="pwd2" size="20"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">��������һ�飩</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<font color="#000000"><b>���뱣�����⣺</b></font></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="question" size="20" value="<%=request.form("question")%>"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">��4-12���ַ����벻Ҫʹ��������ţ�</font></b></td>
						</tr>
						<tr>
							<td align="right" height="40" class="style1">
							<font color="#000000"><b>��������𰸣�</b></font></td>
							<td height="40" class="style2"><b>
							<font color="#000000">
							<input type="text" name="answer" size="20"></font></b></td>
							<td height="40"><b>
							<font size="1" color="#000000">��2-12���ַ����벻Ҫʹ��������ţ�</font></b></td>
						</tr>
					</table>
					<p align="center">
					<input type="submit" value="��  ��" name="B1">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="��  ��" name="B2"></p>
				</form>
��</td>
			</tr>
			<tr>
				<td>��</td>
			</tr>
		</table>
</body>
</html>

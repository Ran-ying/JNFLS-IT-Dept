<!--#include file="conn/rs.asp"-->
<!--#include file="conn/rs2.asp"-->
<%
if session("confirmed") = false then
%>
<script lanaguage='javascript'>    alert('����û�б���Ȩ��')</script>
<script>    window.top.self.location.href = 'main.asp'; </script><%
response.end
end if
%>
<%function nore(str)  '�������ظ��ַ����ַ���
dim chr()
i = len(str)
redim preserve chr(i)
for m=0 to i-1
chr(m) = mid(str,m+1,1)
next
for m=0 to i-1
for n=m to i-1
if chr(m) = chr(n) and (m<>n) then
chr(n)= ""
end if
next
next
t = i
for m = 0 to t-1
newstr = newstr & chr(m)
next
nore = newstr
end function
%>

<%
function red(original,str)    '��ɫ����
dim chr()
i = len(str)
redim preserve chr(i)
for m = 0 to i-1
chr(m) = mid(str,m+1,1)
next
for m = 0 to i-1
original = replace(original,chr(m),"<font color=""red"">"&chr(m)&"</font>")
next
red = original
end function
 %>

<%
if session("zs_idnum") = "" then
%>
<script lanaguage='javascript'>alert('����û�е�¼��')</script>
<script>    window.top.self.location.href = 'index.asp'; </script>
<%
response.end
end if
%>

<%
function killw(byval s1) '�����ַ��Ͳ���
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function
%>

<%
function creatsql(str,title) 
sql = "select * from pages where "
for i = 0 to len(str)-2
sql = sql + title + " like '%" + mid(str,i+1,1) + "%' or "
next
sql = sql + title + " like '%" + mid(str,i+1,1) + "%'"
creatsql = sql
end function
%>

<%
if request("action")="favorite" then
rs.open "select * from favorite where idnum = '" & session("zs_idnum") & "' and pageid = '" & request("id") & "'",conn,1,3
if not rs.eof then
%>
<script lanaguage='javascript'>    alert('�ղ��Ѵ��ڣ�')</script>
<script>    history.back()</script>
<%
rs.close
else
rs.addnew
rs("idnum") = session("zs_idnum")
rs("pageid") = request("id")
rs.update
rs.close
%>
<script lanaguage='javascript'>    alert('�ղ�����ӣ�')</script>
<script>    history.back()</script>
<%
end if
end if
%>

<%
if request("action") = "view" then
rs.open "select * from pages where ID = " & killw(request("id")) ,conn,1,1
if not rs.eof then
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���ҳ��</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .style1
    {
        width:200px;
    }
    .style2
    {
        width:400px
    }
    </style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">
<table border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#BBBBBB">
            <tr>
                <td>
                <form name="favorite" method="POST" action="pages.asp?action=favorite&id=<%= rs("ID") %>">
                <table valign="bottom">
                <tr>
                 <td height="30" width="50"></td>
                 <td height="30" width="500" valign="bottom"><p align="center"><font size="5" color="#000000"><b><%= rs("title") %></b></font></p></td>
                 <td width="50"><input id="Submit1" type="submit" value="�ղظ�ҳ" /></td>
                </tr>
                </table>
                </form>
                </td>
			</tr>
			         <tr>
				     <td height="40" align="left" valign="top">
                     <table border="0" width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center" height="30" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">�Ա�</font></b></td>
							<td height="30" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("sex")%></font></b></td>
						</tr>
                        <tr>
							<td align="center" height="30" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">��ϵ�绰��</font></b></td>
							<td height="30" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("tel")%></b></td>
                            </td>
						</tr>
                        <tr>
							<td align="center" height="30" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">QQ��</font></b></td>
							<td height="30" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("qq")%></b></td>
						</tr>
                        <tr>
							<td align="center" height="30" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">΢����</font></b></td>
							<td height="30" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("weipo")%></b></td>
						</tr>
                        <tr>
							<td align="center" height="30" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">΢�ţ�</font></b></td>
							<td height="30" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("wechat")%></b></td>
						</tr>
                        <tr>
							<td align="center" height="30" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">���䣺</font></b></td>
							<td height="30" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("email")%></b></td>
						</tr>
                        <tr>
							<td align="center" height="30" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">������</font></b></td>
							<td height="30" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("constellation") %></b></td>
						</tr>
                        <tr>
							<td align="center" bgcolor="#f7eac7" height="10">
							<b><font color="#000000"></font></b></td>
							<td bgcolor="#f7eac7"  align="left"><b>
							<font color="#000000"></b></td>
						</tr>
                        <tr>
							<td align="center" bgcolor="#f7eac7" class="style7" >
							<b><font color="#000000">��Ƭ��</font></b></td>
							<td bgcolor="#f7eac7" class="style4" align="left"><b>
							<font color="#000000"><image src="photo\upfiles\<%= rs("title") %>.jpg" width=350></b></td>
						</tr>
                        <tr>
							<td align="center" bgcolor="#f7eac7" height="10">
							<b><font color="#000000"></font></b></td>
							<td bgcolor="#f7eac7"  align="left"><b>
							<font color="#000000"></b></td>
						</tr>
                        <tr>
							<td align="center" bgcolor="#f7eac7" class="style7" >
							<b><font color="#000000">��ѧ&רҵ��</font></b></td>
							<td bgcolor="#f7eac7" class="style4" align="left"><b>
							<font color="#000000"><%= rs("university") %></b></td>
						</tr>
                        <tr>
							<td align="center" height="40" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">������</font></b></td>
							<td height="40" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("job") %></b></td>
						</tr>
                        <tr>
							<td align="center" height="40" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">�־ӵأ�</font></b></td>
							<td height="40" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("home")%></b></td>
						</tr>
                        <tr>
							<td align="center" height="60" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">������</font></b></td>
							<td height="40" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("activity")%></b></td>
						</tr>
                        <tr>
							<td align="center" height="60" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">��Ȥ���ã�</font></b></td>
							<td height="40" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("favorite")%></b></td>
						</tr>
                        <tr>
							<td align="center" bgcolor="#f7eac7" class="style5" >
							<b><font color="#000000">���</font></b></td>
							<td bgcolor="#f7eac7" class="style6" align="left"><b>
							<font color="#000000"><%= rs("word")%></b></td>
						</tr>
                        <tr>
							<td align="center" height="60" bgcolor="#f7eac7" class="style1" >
							<b><font color="#000000">����ְ��</font></b></td>
                            <td height="40" bgcolor="#f7eac7" class="style2" align="left"><b>
							<font color="#000000"><%= rs("position")%></font></b></td>
						</tr>
			 		</table>
��                  </td>
			        </tr>
</table>
</body>

</html>
<%else %>
<script lanaguage='javascript'>    alert('��ҳ�治���ڣ�')</script>
<script lanaguage='javascript'>    history.back()</script>
<%
rs.close
end if 
end if
%>

<%
if request("action") = "search" then
   key = request("key1")
   'key = request.QueryString("key")
   if key = "" then
%>
<script lanaguage='javascript'>    alert('������ؼ��ʣ�')</script>
<script>    history.back()</script>

<%else %>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���ҳ��</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .style1
    {
        width:200px;
    }
    .style2
    {
        width:400px
    }
    .style3
    {
        height: 30px;
    }
    .style4
    {
        height: 20px;
        width: 20px
    }
    .style5
    {
        width: 200px;
        height: 60px;
    }
    .style6
    {
        width: 400px;
        height: 60px;
    }
    .style7
    {
        width: 200px;
        height: 20px;
    }
    </style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">
<table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
     <tr>
      <td height="60" bgcolor="#BBBBBB" align="center" valign="center">
					<p align="center"><font size="5" color="#000000"><b>�� �� �� ��</b></font></p>
	  </td>
	 </tr>
     <tr>
	  <td align="left" valign="top">
     <table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#f7eac7">
<%
rs.open creatsql(nore(key),"title"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("title")
 %>
 <tr>
   <td calss="style4">&nbsp;</td>
   <td class="style3" align="left"><b><font size="5"><a href="pages.asp?action=view&id=<%= rs("id") %>">
   <%= red(content,nore(key)) %>
   </a></font></b>
   </td>
 </tr>
<%
rs.movenext
Loop
rs.close
else
rs.close
rs.open creatsql(nore(key),"university"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("university")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
 else
rs.close
rs.open creatsql(nore(key),"job"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("job")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
 else
rs.close
rs.open creatsql(nore(key),"home"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("home")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
 else
rs.close
rs.open creatsql(nore(key),"activity"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("activity")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
 else
rs.close
rs.open creatsql(nore(key),"favorite"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("favorite")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
 else
rs.close
rs.open creatsql(nore(key),"constellation"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("constellation")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
 else
rs.close
rs.open creatsql(nore(key),"weipo"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("weipo")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
  else
rs.close
rs.open creatsql(nore(key),"wechat"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("wechat")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
  else
rs.close
rs.open creatsql(nore(key),"email"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("email")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
  else
rs.close
rs.open creatsql(nore(key),"qq"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("qq")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
   else
rs.close
rs.open creatsql(nore(key),"tel"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("tel")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
   else
rs.close
rs.open creatsql(nore(key),"sex"),conn,1,1
if not rs.eof then
do while not rs.eof
content = rs("sex")
 %>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;<a href="pages.asp?action=view&id=<%= rs("id") %>"><b><font size="4"><%= red(rs("title"),nore(key)) %></font></b></a>
   </td>
 </tr>
 <tr>
 <td class="style4">&nbsp;</td>
   <td class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size="3">
   <%= red(content,nore(key)) %>
   </font></b>
   </td>
 </tr>
<%
rs.movenext
 Loop
 rs.close
 else
 %>
 <script lanaguage='javascript'>     alert('�޽�����볢�Ը��Ĺؼ��ʡ�')</script>
<script>    history.back()</script>
 <%
 end if
 end if
  end if
 end if
  end if
 end if
  end if
 end if
  end if
 end if
  end if
 end if
  end if
 %>
         </table>
         </td>
		 </tr>
</table>
</body>

</html>
<%end if 
end if%>

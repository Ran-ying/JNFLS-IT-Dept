<!--#include file="conn/rs.asp"-->
<%function killw(byval s1) '过滤字符型参数
if len(s1)=0 then
killw=0
else
killw=cdbl(s1)
end if
end function


if request("action") = "save" then
if session("zs_uid") = "" then%>
<script lanaguage='javascript'>alert('您无权对考生的咨询进行回复！')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if

rs.open "select * from qna where ID=" & killw(request("ID")) & " and isnull(answer)",conn,1,3
if rs.bof then%>
<script lanaguage='javascript'>alert('问题不存在或已回复！')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if

rs("answer") = left(request.form("answer"),200)
rs("replier") = session("zs_uid")
rs("rdate") = now()
rs.update
rs.close

%>
<script lanaguage='javascript'>alert('回复成功！')</script>
<%

end if





rs.open "select * from qna where ID=" & killw(request("ID")),conn,1,1
if rs.bof then%>
<script lanaguage='javascript'>alert('咨询信息不存在！')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if

if( rs("idnum") <> session("zs_idnum") ) and session("zs_uid")="" then%>
<script lanaguage='javascript'>alert('您无权查看他人的咨询信息！')</script>
<script> self.location.href= 'javascript:window.close()'; </script>
<%response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线问答</title>
</head>

<body onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">

					<table border="1" width="700" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" height="141">
						<tr>
							<td height="48" colspan="2" bgcolor="#f3da98"><b>
							<font color="#2D287F">&nbsp;问题在线反馈：</font></b></td>
						</tr>
						<tr>
							<td height="30" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>咨询人：</b></font></td>
							<td height="30" width="555" align="center" bgcolor="#f7eac7">
							<p align="left"><font size="2">&nbsp;[<%=rs("idnum")%>]<%=rs("cname")%></font></td>
						</tr>
						<tr>
							<td height="30" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>标　题：</b></font></td>
							<td height="30" width="555" align="center" bgcolor="#f7eac7">
							<font size="2"><%=rs("title")%>
							　</font></td>
						</tr>
						<tr>
							<td height="100" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>内　容：</b></font></td>
							<td height="100" width="555" align="center" bgcolor="#f7eac7" valign="top">
							<p align="left"><font size="2"><br>
														　　<%=rs("question")%>
							　</font></td>
						</tr>
						<tr>
							<td height="140" width="138" align="center" bgcolor="#f7eac7">
							<font size="2" color="#000080"><b>答　复：</b></font></td>
							<td height="140" width="555" align="center" bgcolor="#f7eac7" valign="top">
							<p align="left"><font size="2"><br>
							<%if not isnull(rs("answer")) then%>
 亲爱的<%=rs("cname")%>，你好！<br>
							　　你的问题我们已经收到。关于此问题，<%=rs("answer")%>。<br>
							<br>
							　　若还有其他疑问，可再次在线反馈或直接联系管理员进行咨询。</font>
								<!--webbot bot="SaveResults" U-File="fpweb:///_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" --><p align="left">
							<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 济南外国语学校校友录<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=year(rs("rdate"))%>年<%=month(rs("rdate"))%>月<%=day(rs("rdate"))%>日</font>
						    <%else%>
						    
						    <%if session("zs_uid")="" then%>
						    
						    <i><font size="2">&nbsp;&nbsp; 等待回复……</font></i>
						    
						    <%else%>
						    <form method="POST" action="qna_detail.asp?action=save">
						    <textarea rows="6" name="answer" cols="69"></textarea><p>
							<input type="submit" value="提交" name="B1"></p>
							<input type="hidden" name="ID" value="<%=request("ID")%>">
						    </form>
						     
						    <%end if%>
						    <%end if%>
						    
						   
						    
						    </td>
						</tr>
					</table>
					
</body>

</html>
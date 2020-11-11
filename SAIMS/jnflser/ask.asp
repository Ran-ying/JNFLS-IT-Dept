<!--#include file="conn/rs.asp"-->
<!--#include file="data/pwd.asp"-->
<%

function killw(byval s1) '过滤字符型参数
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function

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
<title>济南外国语学校 - 用户中心</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .FixedTitleRow
     {
         position:fixed;
         top:0px;         
     }
    .style4
    {
        height: 30px;
    }
</style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight.height=this.document.body.scrollHeight+10;parent.document.all.iHeight0.height=this.document.body.scrollHeight+10;">

<table border="0" width="600" cellspacing="0" cellpadding="0" height="100%" bgcolor="#BBBBBB">
			<tr>
				<td height="20"></td>
			</tr>
			<tr>
				<td align="center" valign="top" height="40">
					<p align="center"><font size="5" color="#000000"><b>问 题 反 馈</b></font></p>
                    </td>
			</tr>
			<tr>
				<td align="center" valign="top">
				<p align="center">　<table border="0" width="600" cellspacing="0" cellpadding="0" id="table1">
						<tr>
							<td bgcolor="#f3da98" colspan="3" class="style4"><b>
							<font color="#000000">&nbsp;在线咨询：<a href="add_qna.asp">【点击咨询】</a></font></b></td>
						</tr>
						<tr>
							<td height="30" width="700" align="center" bgcolor="#f7eac7">
							<b><font size="2" color="#000000">日期</font></b></td>
							<td height="30" width="700" align="center" bgcolor="#f7eac7">
							<b><font size="2" color="#000000">标题</font></b></td>
							<td height="30" width="700" align="center" bgcolor="#f7eac7">
							<b><font size="2" color="#000000">答复情况</font></b></td>
						</tr>					
						<%rs.open "select * from qna where idnum='" & killw(session("zs_idnum")) & "' order by sdate desc",conn,1,1
						if rs.bof then%>
						<tr>
						
							<td height="30" width="2100" align="center" bgcolor="#f7eac7" colspan="3">
							<i><font size="2" color="#000000">您暂未提交过咨询信息！</font></i></td>
						</tr>	
						<%else
						Do while not rs.eof%>				
						<tr>
							<td height="30" width="700" align="center" bgcolor="#f7eac7">
							<font size="2">
							<%=rs("sdate")%></font></td>
							<td height="30" width="700" align="center" bgcolor="#f7eac7">
							<font size="2">
							<a href="qna_detail.asp?ID=<%=rs("ID")%>" target="I1"><%=rs("title")%></a></font></td>
							<td height="30" width="700" align="center" bgcolor="#f7eac7">
							<%if isnull(rs("answer")) then
							%><font size="2" color="#FF0000">未答复</font><%
							else
							%><font color="#008000" size="2">已答复</font><%
							end if%></td>
						</tr>
						<%rs.movenext
						Loop
						end if
						%>					
					</table>
				</td>
			</tr>
		</table>
</body>

</html>

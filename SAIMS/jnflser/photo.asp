<!--#include file="conn/rs.asp"-->
<!--#include file="conn/rs2.asp"-->
<!--#include file="conn/rs3.asp"-->
<!--#include file="conn/rs4.asp"-->
<!--#include file="data/pwd.asp"-->
<%
if session("zs_idnum") = "" then
%>
<script lanaguage='javascript'>alert('您还没有登录！')</script>
<script>    window.top.self.location.href = 'index.asp'; </script><%
response.end
end if
%>
<%
if session("confirmed") = false then
%>
<script lanaguage='javascript'>    alert('您还没有被授权！')</script>
<script>    window.top.self.location.href = 'main.asp'; </script><%
response.end
end if
%>
<%
function killw(byval s1) '过滤字符型参数
if len(s1)=0 then
killw=""
else
killw=trim(replace(s1,"'",""))
end if
end function
%>

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>搜索结果</title>
</head>
<style type="text/css"> 
img, div { behavior: url(../iepngfix.htc) } 
    .style1
    {
        width:200px;
    }
    .style2
    {
        width:200px
    }
    .style3
    {
        width:100px
    }
    </style> 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onload="parent.document.all.iHeight4.height=this.document.img1.scrollHeight;parent.parent.document.all.iHeight.height=parent.document.body.scrollHeight;">
<table border="0" width="200" cellspacing="0" cellpadding="0" height="100%">
	<tr>
		<td>
            <img name="img1" src="<%="photo\upFiles\" & session("title") & ".jpg"%>" width="200" /> 
       </td>
	</tr>
</table>


</body>

</html>

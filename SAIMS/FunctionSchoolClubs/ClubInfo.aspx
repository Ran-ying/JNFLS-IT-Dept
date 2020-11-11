<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClubInfo.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/shetuan1.png);}
</style>
</head>
<body style="height: 474px">
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%" style="height: 364px">
            <tr><td class="auto-style1">
 <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="470px" 
            ></CKEditor:CKEditorControl>
                </td></tr>
           
            </table>
    </form>
</body>
</html>

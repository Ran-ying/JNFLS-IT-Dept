<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClubUpload.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;
            background-image: url(../Images/microicons/shetuan1.png);
        }
        .auto-style1 {
            font-size: xx-large;
            color: #FFFFFF;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%">
            <tr runat="server" id="first"><td style=" text-align: center;" class="auto-style1" >
   
                上传社团信息

  
                </td></tr>
            <tr><td style="text-align: center">
                  <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="540px" 
            style="margin-left: 0px; margin-top: 0px" Width="100%"></CKEditor:CKEditorControl>


                  <br />
        <asp:Button ID="SaveButton" runat="server" Text="保存文档" Height="33px" 
            Width="91px" onclick="SaveButton_Click" />


                </td></tr>
            <tr><td style="text-align: center">
                <br />
                上传社团图标<br />
                <br />
                <asp:FileUpload 
            ID="FileUpload1" runat="server" Width="185px" Height="20px" style="margin-left: 7px" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" onclick="Button1_Click" Text="上传社团图标" 
            Height="30px" Width="144px" />
        <br />
        <asp:Label ID="UploadStatusLabel" runat="server"></asp:Label>
        <asp:HiddenField ID="iconFileName" runat="server" />
                </td></tr>
             </table>
    </form>
</body>
</html>

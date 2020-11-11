<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SportsClassScore.aspx.cs" Inherits="FunctionSports_SportsClassScore" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>运动会管理 - 济南外国语学校校务综合管理系统</title>
     <link href="css/index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body { font-family:微软雅黑; font-size:14px;  background-position: center center;
    background-image: url('../Images/microicons/yundonghui1.png');
   }
        .tblinks {color: #CCCCCC;}


#container {margin:0 auto; width:100%;}
#header { height:100px; background-image: url('../Images/titles/shangbiaoti.png'); margin-bottom:5px;}

#content {
    
    background-position: center center;
    margin: 0 0px !important;
    
    text-align: center;
    background-repeat: no-repeat;
    background-attachment: inherit;
}
#footer {
    font-family: 微软雅黑,黑体;
    font-size: medium;
    font-style: normal;
    color: #FFFFFF;
    height: 60px;
    background-image: url('../Images/titles/xiabiaoti.png');
}
        .auto-style1 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
     <div id="container">
  
   <div id="Div1">&nbsp;</div>
  <div id="mainContent">

    
    <div id="content"> 

       <asp:Button ID="Button1" runat="server" Height="110px" Text="量化输入" 
            Width="256px" Font-Names="微软雅黑" Font-Size="Larger" 
            onclick="Button1_Click" />
        
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="选择年级" Font-Names="微软雅黑"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="gradeSource" DataTextField="年级" DataValueField="ID">
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button2" runat="server" Height="118px" Text="量化查询" 
            Width="254px" Font-Names="微软雅黑" Font-Size="Larger" 
            onclick="Button2_Click"  />

            <asp:SqlDataSource ID="gradeSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            SelectCommand="SELECT [ID], [年级] FROM [年级] WHERE ([ID] &lt;&gt; @ID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="ID" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>

</div>
  </div>
  <div id="Div2">&nbsp;</div>
  
    </form>
</body>
</html>




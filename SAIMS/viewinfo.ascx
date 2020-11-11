<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewinfo.ascx.cs" Inherits="WebUserControl" %>
<style type="text/css">
   body {font-family: 微软雅黑,黑体;}
    .tblinks {color: #CCCCCC;}
    .auto-style1 {text-align: right;}
</style>
<%    if (登陆判断 != 0)
    {
        Response.Clear();
        Response.Write("<script>alert('对不起,您未登录!');top.location='../login.aspx';</script>");
        Response.Flush();
        Response.End();
}%>
<div id="header" class="auto-style1">
    <br />
    <br />
    <asp:label id="infolable" runat="server" Font-Names="微软雅黑" Font-Size="Small" ForeColor="White"></asp:label><br />
    <asp:label  id="viewinfo_lable_nowDiv" ClientIDMode="Static" runat="server" Font-Names="微软雅黑" Font-Size="Small" ForeColor="White"></asp:label><br />
    <a class="tblinks" href="../bug.aspx">[BUG提交]</a>&nbsp;
    <asp:LinkButton class="tblinks" ID="LinkButton1" runat="server" OnClick="Unnamed1_Click" style="color: #CCCCCC" >[退出登陆]</asp:LinkButton>&nbsp;
    <a class="tblinks" href="../settings/mainfunc.aspx?ID=user">[个人设置]</a>
</div>

<script type="text/javascript">
    function show() {
        var date = new Date(); //日期对象 
        var now = "";
        now = date.getFullYear() + "年"; //读英文就行了 
        now = now + (date.getMonth() + 1) + "月"; //取月的时候取的是当前月-1如果想取当前月+1就可以了 
        now = now + date.getDate() + "日";
        now = now + date.getHours() + "时";
        now = now + date.getMinutes() + "分";
        now = now + date.getSeconds() + "秒";

        document.getElementById("viewinfo_lable_nowDiv").innerText = "现在是：" +now; //div的html是now这个字符串 
        setTimeout("show()", 1000); //设置过1000毫秒就是1秒，调用show方法
    }
    
    show();    
</script> 
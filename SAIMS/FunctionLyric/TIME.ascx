<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TIME.ascx.cs" Inherits="WebUserControl" %>



<%


    if (登陆判断 != 0)
    {

        Response.Clear();
        Response.Write("<script>alert('对不起,您未登录!');top.location='../login.aspx';</script>");
        Response.Flush();

        
        Response.End();
}

 %>
   <div id="info" 
      
    
    style=" position:absolute; z-index: 5; top: 35px; left: 975px; width: 406px;">
    <asp:label id="infolable" runat="server" Font-Names="微软雅黑" Font-Size="Small" 
            ForeColor="White"></asp:label>

    </div>
    
      <div id="vsiewinfo_now" 
      
    
    style=" position:absolute; z-index: 5; top: 65px; left: 975px; width: 411px;">
      <asp:label  id="viewinfo_lable_nowDiv" ClientIDMode="Static" runat="server" 
              Font-Names="微软雅黑" Font-Size="Small" ForeColor="White"></asp:label>

      </div>

<script type="text/javascript" language="javascript">
    
</script> 
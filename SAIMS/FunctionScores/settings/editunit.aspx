<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editunit.aspx.cs" Inherits="editunit" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="名称"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="年级"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [年级], [ID] FROM [年级]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="选择"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="单元名" DataValueField="ID" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [单元名], [ID] FROM [宿舍单元]" ></asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="更改为"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="年级"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="保存" onclick="Button2_Click" />
                    <asp:Label ID="Label6" runat="server" Text="注意：宿舍单元数据保存更改后，该单元下所有宿舍年级数据将自动重设，请注意重设班级数据！"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                 <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">返回</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">退出登录</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

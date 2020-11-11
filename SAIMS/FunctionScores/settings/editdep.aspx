<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editdep.aspx.cs" Inherits="editdep" %>

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
                    <asp:Label ID="Label1" runat="server" Text="添加部门"></asp:Label></br></br>
                    <asp:Label ID="Label2" runat="server" Text="选择年级"></asp:Label>
                    
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
                        SelectCommand="SELECT [年级], [ID] FROM [年级]"></asp:SqlDataSource></br>
                    <asp:Label ID="Label3" runat="server" Text="部门名称"></asp:Label>
                    
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></br>
                    <asp:Label ID="Label6" runat="server" Text="部门代号"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" 
                        oncheckedchanged="RadioButton1_CheckedChanged" Text="参与量化" />
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="折合比例"></asp:Label>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </br></br>
                    <asp:Button ID="Button1" runat="server" Text="确认提交" onclick="Button1_Click" />
                    
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="添加职务"></asp:Label></br>
                    <asp:Label ID="Label5" runat="server" Text="职务名称"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="选择量化管理权限"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="权限" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
                        SelectCommand="SELECT [权限], [ID] FROM [量化权限]"></asp:SqlDataSource></br>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="选择公告发布权限" /></br>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="选择公告删除权限"/></br>
                    <asp:CheckBox ID="CheckBox3" runat="server"  Text="管理员权限"/></br>
                    <asp:Button ID="Button2"   runat="server" Text="确认提交" onclick="Button2_Click" />
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="编辑职务权限"></asp:Label>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="选择职务"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource3" DataTextField="组名" DataValueField="ID" 
                        onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
                        SelectCommand="SELECT [ID], [组名], [administor], [公告删除权限], [公告发布权限], [量化权限] FROM [职务]"></asp:SqlDataSource></br>
                    <asp:Label ID="Label10" runat="server" Text="职务名称"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="选择量化管理权限"></asp:Label>
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="权限" DataValueField="ID">
                    </asp:DropDownList>
                    <br />
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="选择公告发布权限" />
                    <br />
                    <asp:CheckBox ID="CheckBox5" runat="server" Text="选择公告删除权限"/>
                    <br />
                    <asp:CheckBox ID="CheckBox6" runat="server" Text="管理员权限" />
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="保存" Width="76px" 
                        onclick="Button3_Click" />
                </td>
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

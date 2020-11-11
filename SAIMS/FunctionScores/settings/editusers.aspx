<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editusers.aspx.cs" Inherits="editusers" %>

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
    
        <table style="width:100%;" id="AddUsers">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="姓名"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="年级"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [年级], [ID] FROM [年级]"></asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="班级"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="编号">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [编号], [班级] FROM [班级] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="部门"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource3" DataTextField="部门名" DataValueField="部门代号">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [部门名], [部门代号] FROM [部门] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="职务"></asp:Label>
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource4" DataTextField="组名" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [组名], [ID] FROM [职务]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
                    <br />
                </td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="用户名"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="重置密码" onclick="Button2_Click" />
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="删除用户" onclick="Button3_Click" />
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

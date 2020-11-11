<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeSelfInfo.aspx.cs" Inherits="editselfinf" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div>
    
        
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="用户名"></asp:Label>
    
        <br />
        <asp:Label ID="Label5" runat="server" Text="姓名："></asp:Label>
    
                    <asp:Label ID="Label15" runat="server" Text="姓名  "></asp:Label>
    
                    <asp:Label ID="Label10" runat="server" Text="更改为："></asp:Label>
    
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    
        <br />
        
        <asp:Label ID="Label6" runat="server" Text="年级："></asp:Label>
                    <asp:Label ID="Label16" runat="server" Text="年级  "></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="更改为："></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label7" runat="server" Text="班级："></asp:Label>
                    <asp:Label ID="Label17" runat="server" Text="班级  "></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text="更改为："></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="编号">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label8" runat="server" Text="部门："></asp:Label>
                    <asp:Label ID="Label18" runat="server" Text="部门  "></asp:Label>
                    <asp:Label ID="Label13" runat="server" Text="更改为："></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource3" DataTextField="部门名" DataValueField="部门代号" >
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label9" runat="server" Text="职务："></asp:Label>
                    <asp:Label ID="Label19" runat="server" Text="职务  "></asp:Label>
                    <asp:Label ID="Label14" runat="server" Text="更改为："></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource4" DataTextField="组名" DataValueField="ID">
        </asp:DropDownList>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="保存（不更改的选项请选择原项目值）"
                        onclick="Button1_Click" />
        <br />
        </td>
                <td>
                   <asp:Label ID="Label3" runat="server" Text="重设密码："></asp:Label>
    
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="确认密码："></asp:Label>
    
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="重设" onclick="Button2_Click" />
        <br />
                   </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [ID], [年级] FROM [年级]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [ID], [班级], [编号] FROM [班级] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [ID], [部门名], [部门代号] FROM [部门] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Main1SQLConnectionString %>" 
                        SelectCommand="SELECT [组名], [ID] FROM [职务]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
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
        </table>
        
    
    </div>
    </form>
</body>
</html>

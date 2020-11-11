<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.Administrator.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>欢迎 - 济南外国语学校校务综合管理系统</title>
</head>
<body>
<form id="form1" runat="server">
<div>      
<asp:Panel ID="Panel1" runat="server">
<asp:TextBox ID="ssbh" runat="server"></asp:TextBox>
<asp:Button ID="Button2" runat="server" Text="" />
</asp:Panel>
<asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<Columns>
<asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" /><asp:BoundField DataField="班级" HeaderText="班级" /><asp:BoundField DataField="扣分人" HeaderText="扣分人" /><asp:BoundField DataField="扣分原因" HeaderText="扣分原因" /><asp:BoundField DataField="扣分数" HeaderText="扣分数" /><asp:BoundField DataField="扣分时间" HeaderText="扣分时间" /><asp:BoundField DataField="投诉" HeaderText="投诉" /><asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" /><asp:BoundField DataField="扣分部门" HeaderText="扣分部门" /><asp:BoundField DataField="扣分部门代号" HeaderText="扣分部门代号" /><asp:BoundField DataField="年级" HeaderText="年级" /><asp:BoundField DataField="宿舍编号" HeaderText="宿舍编号" /><asp:BoundField DataField="备注" HeaderText="备注" /><asp:BoundField DataField="是否有效" HeaderText="是否有效" /><asp:CommandField HeaderText="选择" ShowSelectButton="True" /><asp:CommandField HeaderText="编辑" ShowEditButton="True" /><asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
</Columns>
<RowStyle ForeColor="#000066" />
<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
</asp:GridView>
</div>
</form>
</body>
</html>

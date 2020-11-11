<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editdor.aspx.cs" Inherits="editdor" %>

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
                    <asp:Label ID="Label1" runat="server" Text="宿舍名"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="年级"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [年级], [ID] FROM [年级]"></asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="班级"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="编号" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [班级], [编号] FROM [班级] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="单元"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource3" DataTextField="单元名" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [单元名], [ID] FROM [宿舍单元] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="编号（单元编号-宿舍号,如1-106,单元编号请联系管理员查询）"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="混宿（混宿班级可任选）"/>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
                    <br />
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="年级"></asp:Label>
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="单元"></asp:Label>
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource6" DataTextField="单元名" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [单元名], [ID] FROM [宿舍单元] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList4" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="宿舍"></asp:Label>
                    <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource4" DataTextField="宿舍名" DataValueField="编号">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [宿舍名], [编号] FROM [宿舍] WHERE ([单元] = @单元)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList5" Name="单元" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="设置班级"></asp:Label>
                    <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource7" DataTextField="班级" DataValueField="编号">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [编号], [班级] FROM [班级] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList4" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="混宿(混宿班级可任选)"/>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="保存" onclick="Button2_Click" />
                </td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="选择年级"></asp:Label>
                    <asp:DropDownList ID="DropDownList12" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="年级" DataValueField="ID">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="选择单元"></asp:Label>
                    <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource8" DataTextField="单元名" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [单元名], [ID] FROM [宿舍单元] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList12" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="选择混宿"></asp:Label>
                    <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource5" DataTextField="宿舍名" DataValueField="编号">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [编号], [宿舍名] FROM [宿舍] WHERE (([单元] = @单元) AND ([混宿] = @混宿))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList8" Name="单元" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter DefaultValue="true" Name="混宿" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="床数"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" AutoCompleteType="Disabled" 
                        Wrap="False"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" Text="设置" onclick="Button3_Click" />
                    <asp:Label ID="Label16" runat="server" Text="（点击后该混宿原有床号数据将被清空）"></asp:Label>
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="床号"></asp:Label>
                    <asp:DropDownList ID="DropDownList10" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:Label ID="Label14" runat="server" Text="班级"></asp:Label>
                    <asp:DropDownList ID="DropDownList11" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource9" DataTextField="班级" DataValueField="编号">
                    </asp:DropDownList>
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="设置" />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Lh1SQLConnectionString %>" 
                        SelectCommand="SELECT [编号], [班级] FROM [班级] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList12" Name="年级" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

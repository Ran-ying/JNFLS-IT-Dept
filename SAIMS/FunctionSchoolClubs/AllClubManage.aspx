<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllClubManage.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/shetuan1.png);}
        .auto-style34 {
            width: 71px;
            height: 41px;
            text-align: right;
        }
        .auto-style24 {
            width: 71px;
            height: 41px;
            }
        .auto-style7 {
            width: 71px;
            height: 40px;
            text-align: right;
        }
        .auto-style21 {
            height: 40px;
        }
        .auto-style19 {
            width: 71px;
            height: 44px;
            text-align: right;
        }
        .auto-style20 {
            height: 44px;
            margin-left: 40px;
            }
        .auto-style1 {
            width: 71px;
            text-align: right;
        }
        .auto-style16 {
            text-align: center;
            height: 30px;
            width: 187px;
        }
        
       
        .auto-style35 {
            width: 71px;
            height: 42px;
            text-align: right;
        }
        .auto-style36 {
            height: 42px;
            }
        
       
        .auto-style30 {
            width: 71px;
            height: 15px;
        }
        .auto-style26 {
            height: 41px;
        }
        .auto-style28 {
            height: 41px;
            margin-left: 40px;
        }
        .auto-style31 {
            width: 71px;
            height: 16px;
            text-align: right;
        }
        .auto-style32 {
            height: 16px;
        }
                
       
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
<table width="100%" >
    <tr><td>

            <table border="0" cellpadding="0" id="table1" runat="server" width="100%">
                <tr runat="server" id="选择社团">
                    <td bgcolor="#BB1AFF" background="../image/d_banner_cross.png" class="auto-style34"><font size="2" color="#FFFFFF" >社团：</font></td>
                    <td bgcolor="White" class="auto-style24">&nbsp;<asp:DropDownList ID="选择社团DropDownList" runat="server" DataSourceID="SqlDataSource1"  Style="text-align: center" DataTextField="社团名" DataValueField="社团名" Height="68px" Width="166px" AppendDataBoundItems="True"  AutoPostBack="True" OnSelectedIndexChanged="选择社团DropDownList_SelectedIndexChanged">
                        <asp:ListItem>---选择社团---</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>

                <tr id="社团显示" runat="server">
                    <td bgcolor="#BB1AFF" background="../image/d_banner_cross.png" class="auto-style7"><font size="2" color="#FFFFFF" >社团：</font></td>
                    <td bgcolor="White" class="auto-style21">&nbsp;<asp:Label ID="社团显示label" runat="server">社团</asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="社长行">
                    <td bgcolor="#BB1AFF" background="../image/d_banner_cross.png" class="auto-style35"><font size="2" color="#FFFFFF" >社长：</font></td>
                    <td bgcolor="White" class="auto-style36">&nbsp;<asp:Label ID="社长label" runat="server">社长</asp:Label>
                    </td>
                </tr>
                
                <tr id="原因行" runat="server">
                    <td bgcolor="#BB1AFF" class="auto-style19"><font color="#FFFFFF"  size="2">原因：</font></td>
                    <td bgcolor="White" class="auto-style20"><asp:DropDownList ID="原因" runat="server" DataSourceID="SqlDataSource2" DataTextField="原因" DataValueField="原因" Style="text-align: center" Height="23px" Width="134px" AppendDataBoundItems="True">
                        <asp:ListItem>----请选择原因-----</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr id="备注行" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#BB1AFF" class="auto-style7"><font color="#FFFFFF"  size="2">备注：</font></td>
                    <td bgcolor="White" background="../image/60white.png" class="auto-style21"><font size="2"><a href="javascript:;" title="不同项目的扣分请分别提交。"><asp:TextBox ID="备注" runat="server" Wrap="False" CausesValidation="True"></asp:TextBox>
                        <img border="0" src="../FunctionScores/image/index/qm.jpg" width="20" height="20" />
                    </a></font></td>
                </tr>

                <tr id="输入分数行" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#BB1AFF" class="auto-style1" height="40"><font color="#FFFFFF"  size="2">扣分：</td>
                    <td bgcolor="White" background="../image/60white.png" height="40"><font size="2">
                        <asp:TextBox ID="扣分数" runat="server" Wrap="False"></asp:TextBox>
                        <a href="javascript:;" title="如需加分请在数字前输入“-”， 系统自动保留一位小数。">
                            <img border="0" src="../FunctionScores/image/index/qm.jpg" width="20" height="20" />
                        </a></font></td>
                </tr>
                <tr runat="server" id="提交行">
                    <td background="../image/d_banner_cross.png" bgcolor="#BB1AFF" class="auto-style7"></td>
                    <td bgcolor="White" background="../image/60white.png" class="auto-style21">
                        <p class="auto-style16">
                            <font size="2">
                                <asp:Button ID="提交" runat="server" Height="27px" OnClick="提交_Click" Text="提交" Width="118px" />
                            </font>&nbsp;
                        </p>
                    </td>
                </tr>
               
            </table>




            <br />




        </td></tr>
<tr><td>


            <table border="0" cellpadding="0" id="table2" runat="server" width="100%">
                <tr runat="server" id="选择社团0">
                    <td bgcolor="#BB1AFF" background="../image/d_banner_cross.png" class="auto-style34">&nbsp;<font size="2" color="#FFFFFF" >社团名： </font></td>
                    <td bgcolor="White" class="auto-style30">
        <asp:TextBox ID="社团名TextBox" runat="server" Height="21px" Width="178px"></asp:TextBox> 
                    </td>
                </tr>

                <tr id="社团显示0" runat="server">
                    <td bgcolor="#BB1AFF" background="../image/d_banner_cross.png" class="auto-style34"><font size="2" color="#FFFFFF" >社长管理账户：</font></td>
                    <td bgcolor="White" class="auto-style26">
        <asp:TextBox ID="社长管理账户TextBox" runat="server" Height="21px" Width="178px"></asp:TextBox>
                    </td>
                </tr>
                <tr runat="server" id="社长行0">
                    <td bgcolor="#BB1AFF" background="../image/d_banner_cross.png" class="auto-style34"><font size="2" color="#FFFFFF" >社长姓名：</font></td>
                    <td bgcolor="White" class="auto-style26">
        <asp:TextBox ID="社长姓名TextBox" runat="server"  Height="21px" Width="179px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr id="原因行0" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#BB1AFF" class="auto-style34"><font color="#FFFFFF"  size="2">社长班级：</font></td>
                    <td bgcolor="White" class="auto-style28">
        
                        <asp:DropDownList ID="社长班级TextBox" runat="server" DataSourceID="SqlDataSource4" 
                            DataTextField="班级" DataValueField="编号" Height="23px" style="font-size: small" 
                            Width="181px">
                            <asp:ListItem Selected="True">---请选择班级---</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="提交行0">
                    <td background="../image/d_banner_cross.png" bgcolor="#BB1AFF" class="auto-style31"></td>
                    <td bgcolor="White" background="../image/60white.png" class="auto-style32">
                        <p class="auto-style16">
                            <font size="2">
        <asp:Button ID="添加社团Button" runat="server" Text="确定" Height="28px" OnClick="添加社团Button_Click" Width="131px" />
        

                            </font>&nbsp;
                        </p>
                    </td>
                </tr>
               
            </table>




            <br />




    </td></tr>
    <tr><td>
 
        <asp:GridView  width="100%" height="100%" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="社团名" HeaderText="社团名" SortExpression="社团名" />
                <asp:BoundField DataField="扣分" HeaderText="扣分" SortExpression="扣分" />
                <asp:BoundField DataField="原因" HeaderText="原因" SortExpression="原因" />
                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                <asp:BoundField DataField="扣分人姓名" HeaderText="扣分人姓名" SortExpression="扣分人姓名" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>


        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [原因] FROM [扣分原因] WHERE ([部门] = @部门)" OnSelecting="SqlDataSource2_Selecting">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="社团部" Name="部门" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [社团名] FROM [社团] WHERE ([年级] = @年级)">
                            <SelectParameters>
                                <asp:SessionParameter Name="年级" SessionField="年级ID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
            SelectCommand="SELECT [班级],[编号] FROM [班级] WHERE ([年级] = @年级)">
                        <SelectParameters>
                            <asp:SessionParameter Name="年级" SessionField="年级ID" Type="Int32" />
                        </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MainSQLConnectionString %>" SelectCommand="SELECT [ID], [社团名], [扣分], [原因], [备注], [扣分时间], [扣分人姓名] FROM [社团扣分]"></asp:SqlDataSource>
                    <br />


        </td></tr>
</table>
    </form>
</body>
</html>

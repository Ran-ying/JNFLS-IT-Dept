<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ScoresView.aspx.cs" Inherits="FunctionScores_ScoresView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        body {
            background-image: url(../Images/microicons/lianghua1.png);
            font-family: 微软雅黑,黑体;
        }

        .auto-style2 {
            width: 161px;
            height: 48px;
        }

        .auto-style3 {
            text-align: center;
        }

        #table2 {
            height: 80px;
        }

        #table10 {
            height: 92px;
            width: 23%;
        }

        .auto-style6 {
            height: 48px;
        }

        .auto-style7 {
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" id="查询div" visible="true">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <table border="0" width="100%" cellpadding="5" id="查询table" runat="server">

                        <tr>
                            <td bgcolor="#3366FF" colspan="6" style="background-image: url('../image/d_banner.png')" height="40"><b><font color="#FFFFFF">搜索量化详情：</font></b></td>
                        </tr>
                        <tr>

                            <td rowspan="2" colspan="5" class="auto-style3">
                                <asp:RadioButton ID="按姓名查询" runat="server" OnCheckedChanged="按姓名查询_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按姓名</span></font>
                                <asp:TextBox ID="XINGMING" runat="server" AutoPostBack="True" OnTextChanged="XINGMING_TextChanged" CssClass="auto-style7"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="200" align="center" class="auto-style7">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="6"></td>
                        </tr>
                        <tr>
                            <td width="200" align="center">
                                <asp:RadioButton ID="ZONGHEJIANSUO" runat="server" OnCheckedChanged="ZONGHEJIANSUO_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">综合检索</span></font><span class="auto-style7"> </span>
                            </td>
                            <td colspan="5" class="auto-style7">

                                <font size="2">请设置以下条件：</font></td>
                        </tr>
                        <tr>
                            <td width="200" align="center">
                                <asp:CheckBox ID="BANJI" runat="server" OnCheckedChanged="BANJI_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按班级</span></font></td>
                            <td colspan="5">

                                <asp:DropDownList ID="BANJILIST" runat="server" DataKeyNames="编号" DataSourceID="检索班级" DataTextField="班级" DataValueField="编号" OnSelectedIndexChanged="BANJILIST_SelectedIndexChanged" AutoPostBack="True" CssClass="auto-style7">
                                    <asp:ListItem>--请选择班级--</asp:ListItem>
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="检索班级" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                                    SelectCommand="SELECT 班级, 编号, ID FROM 班级 ORDER BY ID"></asp:SqlDataSource>

                            </td>
                        </tr>
                        <tr>
                            <td width="200" align="center">
                                <asp:CheckBox ID="SUSHE" runat="server" OnCheckedChanged="SUSHE_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按宿舍</span></font></td>
                            <td colspan="5">
                                <font color="#808080" size="2">

                                    <asp:Label ID="Label6" runat="server" Text="单元"></asp:Label>
                                    <asp:DropDownList ID="SUSHEDANYUANLIST" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="宿舍楼" DataValueField="宿舍楼"
                                        OnSelectedIndexChanged="SUSHEDANYUANLIST_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:Label ID="Label5" runat="server" Text="宿舍："></asp:Label>
                                    <asp:DropDownList ID="SUSHELIST" runat="server" Visible="false" DataKeyNames="编号" OnSelectedIndexChanged="SUSHELIST_SelectedIndexChanged"
                                        DataSourceID="宿舍查询" DataTextField="宿舍名" DataValueField="宿舍名" AutoPostBack="True" CssClass="auto-style7">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                                        SelectCommand="SELECT [宿舍楼] FROM [宿舍单元]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="宿舍查询" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                                        SelectCommand="SELECT [宿舍名] FROM [宿舍]"></asp:SqlDataSource>

                                    <span class="auto-style7">&nbsp;
                                    </span>
                                    <a title="勾选此项后，非宿舍量化将不会被检索出来。若勾选的宿舍和班级不符，则也不会有记录返回。" href="javascript:;">
                                        <img border="0" src="image/index/qm.jpg" width="20" height="20" class="auto-style7"><span class="auto-style7"> </span>
                                    </a></font></td>
                        </tr>
                        <tr>
                            <td width="200" align="center">
                                <asp:CheckBox ID="BUMEN" runat="server" OnCheckedChanged="BUMEN_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按部门</span></font></td>
                            <td colspan="5">
                                <asp:DropDownList ID="BUMENLIST" runat="server" OnSelectedIndexChanged="BUMENLIST_SelectedIndexChanged" DataSourceID="检索部门" DataTextField="部门名" DataValueField="部门名" AutoPostBack="True" CssClass="auto-style7">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="检索部门" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [部门名], [年级] FROM [部门]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td width="200" align="center">
                                <asp:CheckBox ID="SHIJIAN" runat="server" OnCheckedChanged="SHIJIAN_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按时间</span></font></td>
                            <td colspan="5">

                                <asp:TextBox ID="QISHIRIQI" runat="server" Width="116px" AutoPostBack="True" OnTextChanged="QISHIRIQI_TextChanged" Height="19px" CssClass="auto-style7"></asp:TextBox>
                                <font size="2" color="#808080"><span class="auto-style7">至
                                </span>
                                    <asp:TextBox ID="JIESHURIQI" runat="server" Width="116px" AutoPostBack="True" OnTextChanged="JIESHURIQI_TextChanged" CssClass="auto-style7"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="请输入&quot;年-月-日&quot;格式,如2012-12-21" CssClass="auto-style7"></asp:Label>
                                </font></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="6"></td>
                        </tr>
                        <tr>
                            <td width="200" align="center" class="auto-style6">
                                <asp:CheckBox ID="WUXIAOLIANGHUA" runat="server" OnCheckedChanged="WUXIAOLIANGHUA_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">显示无效量化</span></font></td>
                            <td align="center" class="auto-style6">
                                <p align="center">
                                    <asp:RadioButton ID="BANJISHUNXU" runat="server" OnCheckedChanged="BANJISHUNXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                    <font size="2"><span class="auto-style7">按班级顺序排序</span></font><span class="auto-style7"> </span>
                            </td>
                            <td align="center" class="auto-style6">
                                <asp:RadioButton ID="RIQISHUNXU" runat="server" OnCheckedChanged="RIQISHUNXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按日期顺序排序</span></font></td>
                            <td align="center" class="auto-style6">
                                <asp:RadioButton ID="RIQIDAOXU" runat="server" OnCheckedChanged="RIQIDAOXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按日期倒序排序</span></font></td>
                            <td align="center" class="auto-style2">
                                <asp:RadioButton ID="FENSHUPAIXU" runat="server" OnCheckedChanged="FENSHUPAIXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按分数排序</span></font></td>
                            <td align="center" class="auto-style6">
                                <asp:RadioButton ID="TIJIAOREN" runat="server" Text="" OnCheckedChanged="TIJIAOREN_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                                <font size="2"><span class="auto-style7">按提交人排序</span></font></td>
                        </tr>
                        <tr>
                            <td colspan="6">

                                <p align="center">
                                    <asp:LinkButton ID="TeacherFrameLB" runat="server" Text="转到教师表" Visible="false"
                                        OnClick="TeacherFrameLB_Click"></asp:LinkButton>

                                    <%
                                        if (什么都没有输入)
                                        {
                                            //<script type="text/javascript">
                                            //     alart("未输入任何查询条件");
                                            // </script>
                                            Response.Clear();
                                            Response.Write(" <script language='javascript'+> location.reload();;alert('对不起,您什么都没有输入!');</script>");
                                            Response.Flush();
                                            Response.End();
                                        }
                                    %>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="Sure" runat="server" OnClick="Sure_Click" Text="提交"
                Width="129px" />


        </div>

        <div runat="server" id="结果div" visible="false">

            <asp:GridView ID="GridView1" runat="server" Width="965px"
                DataSourceID="SqlDataSource1" AllowPaging="True"
                OnPageIndexChanging="GridView1_PageIndexChanging" AllowSorting="True"
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />



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
            <% if (GridView1.Visible)
               {%>
            <asp:Label ID="Label2" runat="server" Text="注意:分数请以其负数读取。即:-0.5为加0.5分。0.5分为扣0.5分。" ForeColor="Red"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click" Visible="False">分数作废</asp:LinkButton>
            <%}
               else
               { %>
            <asp:Label ID="Label4" runat="server" Text="没有量化记录!" ForeColor="Red"></asp:Label>
            <%}
            %>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="False">分数作废</asp:LinkButton>

        </div>
        <div id="作废框" runat="server" visible="false">
            <table border="0" width="100%" cellpadding="5">
                <tr>
                    <td bgcolor="#3366FF"><b><font color="#FFFFFF">填写分数作废原因：></b></td>
                </tr>
                <tr>
                    <td bgcolor="#ECECFF">
                        <p align="center">
                            <asp:Label ID="Label3" runat="server" Text="ID："></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 原因：<asp:TextBox ID="作废原因TB" runat="server"></asp:TextBox>
                            </font>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ECECFF">
                        <p align="center">
                            <font size="2" color="#FF0000">注：期末将进行干部审核，所有工作失误导致的错扣分将对工作评定产生影响，</font><font size="2" color="#008000">不提交视为放弃解释机会，且今后将无法补充提交，</font><font size="2" color="#FF0000">望知晓。</font>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ECECFF" height="32">
                        <p align="center">
                            <asp:Button ID="确定作废BT" runat="server" Text="提交" OnClick="确定作废BT_Click"
                                Height="22px" Width="99px" />
                    </td>
                </tr>
            </table>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" DeleteCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>

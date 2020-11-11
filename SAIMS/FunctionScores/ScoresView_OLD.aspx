<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ScoresView.aspx.cs" Inherits="Old_Search" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <%
        if (没有登录Bol)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../login.aspx';alert('对不起,您未登录!');</script>");
            Response.Flush();
            Response.End();
       
        }
         %>

    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title></title>
    <style type="text/css">
        body {background-image:url(../Images/microicons/lianghua1.png);font-family: 微软雅黑,黑体;}
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
        .auto-style4 {
            color: #FF0000;
        }
        .auto-style5 {
            height: 24px;
        }
        .auto-style6 {
            height: 48px;
        }
        .auto-style7 {
            color: #000000;
        }
        .auto-style8 {
            width: 200px;
        }
        .auto-style9 {
            height: 48px;
            width: 200px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <input type="hidden" value="<%//=request("b")%>" name="b">
        <div runat="server" id="查询div" visible="true">
            <table border="0" width="100%" cellpadding="5" id="查询table" runat="server">

                <tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;"><td class="auto-style8" colspan="6">
搜索量化详情</td>      </tr>
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
                    <td align="center" colspan="6">
                       
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:RadioButton ID="ZONGHEJIANSUO" runat="server" OnCheckedChanged="ZONGHEJIANSUO_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">综合检索</span></font><span class="auto-style7"> </span>
                    </td>
                    <td colspan="5" class="auto-style7">

                        <font size="2">请设置以下条件：</font></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:CheckBox ID="BANJI" runat="server" OnCheckedChanged="BANJI_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">按班级</span></font></td>
                    <td colspan="5">

                     <asp:DropDownList ID="BANJILIST" runat="server"   DataKeyNames="编号" DataSourceID="检索班级" DataTextField="班级" DataValueField="编号" OnSelectedIndexChanged="BANJILIST_SelectedIndexChanged" AutoPostBack="True" CssClass="auto-style7">
                            <asp:ListItem>--请选择班级--</asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:SqlDataSource ID="检索班级" runat="server"  ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                            SelectCommand="SELECT 班级, 编号, ID FROM 班级 ORDER BY ID"></asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:CheckBox ID="SUSHE" runat="server" OnCheckedChanged="SUSHE_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">按宿舍</span></font></td>
                    <td colspan="5">
                        <font color="#808080" size="2">
                            <asp:DropDownList ID="SUSHELIST" runat="server"  DataKeyNames="编号" OnSelectedIndexChanged="SUSHELIST_SelectedIndexChanged"
                                DataSourceID="宿舍查询" DataTextField="宿舍名" DataValueField="宿舍名" AutoPostBack="True" CssClass="auto-style7">
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="宿舍查询" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                                SelectCommand="SELECT [宿舍名], [单元] FROM [宿舍]"></asp:SqlDataSource>

                            <span class="auto-style7">&nbsp;
                </span>
                <a title="勾选此项后，非宿舍量化将不会被检索出来。若勾选的宿舍和班级不符，则也不会有记录返回。" href="javascript:;">
                    <img border="0" src="image/index/qm.jpg" width="20" height="20" class="auto-style7"><span class="auto-style7"> </span>
                </a></font></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:CheckBox ID="BUMEN" runat="server" OnCheckedChanged="BUMEN_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">按部门</span></font></td>
                    <td colspan="5">
                        <asp:DropDownList ID="BUMENLIST" runat="server" OnSelectedIndexChanged="BUMENLIST_SelectedIndexChanged" DataSourceID="检索部门" DataTextField="部门名" DataValueField="部门名" AutoPostBack="True" CssClass="auto-style7">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="检索部门" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [部门名] FROM [部门]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
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
                    <td align="center" class="auto-style9">
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
                            <asp:Button ID="Sure" runat="server" OnClick="Sure_Click" Text="提交" />

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
            <input type="hidden" name="action" value="scores">
        </div>




        <div id="结果div" runat="server" visible="false" >
            <!-- 尾工程:改位置 -->
            <table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2">
                <p align="left"><b><font   size="3" color="#808080">以下是系统检索出的符合条件的记录：</font></b></p>

                <tr>
                    <td align="center" bgcolor="#3366FF" style="border-left: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >ID</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >部门</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >姓名</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >班级</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >分数</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >折合分</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >原因</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >对象</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >提交时间</font></b></td>
                    
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >状态</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >操作</font></b></td>
                </tr>


                <tr>
                    <%            

            string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
            System.Data.SqlClient.SqlConnection con1 = new System.Data.SqlClient.SqlConnection(ClubConnectionString);
            con1.Open();
            System.Data.SqlClient.SqlCommand SQLCom = new System.Data.SqlClient.SqlCommand();
            SQLCom.Connection = con1;
            SQLCom.CommandText =总SQL;
            SQLCom.CommandType = System.Data.CommandType.Text;
            System.Data.SqlClient.SqlDataReader conda2=SQLCom.ExecuteReader();
  
      
            if (conda2.Read()==false)
            {
                  %>
                    <td align='center' bgcolor="#ECECFF" style="border-left: 1px solid #ccc; border: 1px solid #ccc; border-top: none;" colspan="12" class="auto-style5">
                        <i>
                            <font size="2" color="#94AEC6">无符合条件的记录！</font></i></td>
                </tr>
                <%
                con1.Close();
                
               }
               else
               {
               string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(Main1ConnectionString);
                con.Open();
                System.Data.SqlClient.SqlCommand cons = new System.Data.SqlClient.SqlCommand(总SQL, con);
                System.Data.SqlClient.SqlDataReader conda = cons.ExecuteReader();
                while (conda.Read())
                {
                    j++;
                    k++;
                    查询ID.Text = conda.GetInt32(0).ToString();
                    扣分部门 = conda.GetString(1);
                    if (扣分部门 == null)
                        部门.Text = "N/A";
                    else
                        部门.Text = 扣分部门;
                    if (显示分数编辑者Bol)//班主任不可见扣分姓名!!
                    {
                        姓名.Text = conda.GetString(2);
                    }
                    else
                        姓名.Text = "/";
                    操作班级.Text = conda.GetString(3) + conda.GetString(9).ToString() + "班";

                    KOUFENSHU = (double)conda.GetFloat(4);
                    KOUFENSHU = -KOUFENSHU;
                    if (KOUFENSHU > 0)
                    {
                        分数.Text = "+" + KOUFENSHU.ToString();
                    }
                    else
                        分数.Text = KOUFENSHU.ToString();

                    //if (显示折合分数Bol)
                    //{
                    //    计算折合分 = 0.2 * KOUFENSHU;
                    //}
                    //if (计算折合分 != 0)
                    //{
                    //    if (计算折合分 > 0)
                    //        折合分.Text = "+" + 计算折合分.ToString();
                    //}
                    //else
                    //{
                    折合分.Text = "/";
                    原因.Text = conda.GetString(5);
                    提交时间.Text = conda.GetDateTime(6).ToString();
                    
                    if (conda.GetBoolean(7).ToString().ToLower() == "true")
                        状态.Text = "有效~";
                    else
                        状态.Text = "无效...";
                    if (conda.GetString(10) != null)
                        备注Label.Text = conda.GetString(10);
                    else
                        备注Label.Text = "NULL";
      %>
                <tr>
                    <td align='center' bgcolor="#ECECFF" style="border-left: 1px solid #ccc; border: 1px solid #ccc; border-top: none;">
                        <asp:Label ID="查询ID" runat="server" Text=""></asp:Label>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="部门" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="姓名" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="操作班级" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="分数" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="折合分" runat="server" Text="Label"></asp:Label></font>

                    <td align="center" bgcolor="#ECECFF" style="border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22"><font size="2">
                        <asp:Label ID="原因" runat="server" Text="Label"></asp:Label></font>

                    <td align="center" bgcolor="#ECECFF" style="border-left: medium none; border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22">
                        <asp:Label ID="备注Label" runat="server" Text="Label"></asp:Label>
                    <td align="center" bgcolor="#ECECFF" style="border-left: medium none; border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22"><font size="2">
                        <asp:Label ID="提交时间" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border-left: medium none; border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22"><font size="2">

                        <asp:Label ID="状态" runat="server" Text="Label" ></asp:Label></font>
                       
                    <td align="center" bgcolor="#ECECFF" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; text-align: left; border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" height="22">
                        
                         <%if (状态.Text == "有效~" && 量化作废Bol) { 
                               %>&nbsp;
                     <asp:LinkButton ID="分数作废LINK" Style="font-size: small" runat="server" OnClick="分数作废LINK_Click" >
                            分数作废
                        </asp:LinkButton>
                         <%  
                           }
                           else
                           {
                               if (状态.Text == "有效~" && 量化作废Bol == false)
                               {%>&nbsp;
                        <font size="2">请联系上级修改</font>
                         <%}
                               else
                               { %>
                         <font size="2">分数已<span class="auto-style4"><strong>作废 </strong></span></font><%} %>

                    </td>
                </tr>
                <%
                }
                } //结果信息.Text = "第" + 1 + "页/总" + Math.Ceiling((double)(k / 每页条数)) + "页 本页" + (k < 10 ? k : 10) + "条/总" + k + "条 ";

       // if ((int)(k / (每页条数)) == 1)
        //{
       //     首页.Enabled = false;
       //     下一页.Enabled = false;
      //      上一页.Enabled = false;
      //      末页.Enabled = false;
      //  }
               } %>
            </table>
            <br>

            <tr>
                <td bgcolor="#ECECFF" height="32" >
                    <div id="作废框" runat="server" visible="false" >
        <table border="0" width="100%" cellpadding="5" >
	<tr>
		<td bgcolor="#3366FF"><b><font   color="#FFFFFF">填写分数作废原因：</font></b></td>
	</tr>
	<tr>
		<td bgcolor="#ECECFF">
		<p align="center"><font size="2">原因：<asp:TextBox ID="作废原因TB" runat="server"></asp:TextBox>
            </font></td>
	</tr>
	<tr>
		<td bgcolor="#ECECFF">
<p align="center"> <font size="2" color="#FF0000">
			注：期末将进行干部审核，所有工作失误导致的错扣分将对工作评定产生影响，</font><font size="2" color="#008000">不提交视为放弃解释机会，且今后将无法补充提交，</font><font size="2" color="#FF0000">望知晓。</font></td>
	</tr>
	<tr>
		<td bgcolor="#ECECFF" height="32">
<p align="center"> 
    <asp:Button ID="确定作废BT" runat="server" Text="提交" OnClick="确定作废BT_Click" />
        </td>
	</tr>
</table>

                    </div></div>


    </form>
</body>

</html>

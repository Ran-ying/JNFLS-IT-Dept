<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ScoresView.aspx.cs" Inherits="Old_Search" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <%
        if (û�е�¼Bol)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../login.aspx';alert('�Բ���,��δ��¼!');</script>");
            Response.Flush();
            Response.End();
       
        }
         %>

    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title></title>
    <style type="text/css">
        body {background-image:url(../Images/microicons/lianghua1.png);font-family: ΢���ź�,����;}
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
        <div runat="server" id="��ѯdiv" visible="true">
            <table border="0" width="100%" cellpadding="5" id="��ѯtable" runat="server">

                <tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: ΢���ź�,����; right: 16px; text-align: center; background-color: #6699FF;"><td class="auto-style8" colspan="6">
������������</td>      </tr>
                <tr>

                    <td rowspan="2" colspan="5" class="auto-style3">
                        <asp:RadioButton ID="��������ѯ" runat="server" OnCheckedChanged="��������ѯ_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">������</span></font>
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
                        <font size="2"><span class="auto-style7">�ۺϼ���</span></font><span class="auto-style7"> </span>
                    </td>
                    <td colspan="5" class="auto-style7">

                        <font size="2">����������������</font></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:CheckBox ID="BANJI" runat="server" OnCheckedChanged="BANJI_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">���༶</span></font></td>
                    <td colspan="5">

                     <asp:DropDownList ID="BANJILIST" runat="server"   DataKeyNames="���" DataSourceID="�����༶" DataTextField="�༶" DataValueField="���" OnSelectedIndexChanged="BANJILIST_SelectedIndexChanged" AutoPostBack="True" CssClass="auto-style7">
                            <asp:ListItem>--��ѡ��༶--</asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:SqlDataSource ID="�����༶" runat="server"  ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                            SelectCommand="SELECT �༶, ���, ID FROM �༶ ORDER BY ID"></asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:CheckBox ID="SUSHE" runat="server" OnCheckedChanged="SUSHE_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">������</span></font></td>
                    <td colspan="5">
                        <font color="#808080" size="2">
                            <asp:DropDownList ID="SUSHELIST" runat="server"  DataKeyNames="���" OnSelectedIndexChanged="SUSHELIST_SelectedIndexChanged"
                                DataSourceID="�����ѯ" DataTextField="������" DataValueField="������" AutoPostBack="True" CssClass="auto-style7">
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="�����ѯ" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                                SelectCommand="SELECT [������], [��Ԫ] FROM [����]"></asp:SqlDataSource>

                            <span class="auto-style7">&nbsp;
                </span>
                <a title="��ѡ����󣬷��������������ᱻ��������������ѡ������Ͱ༶��������Ҳ�����м�¼���ء�" href="javascript:;">
                    <img border="0" src="image/index/qm.jpg" width="20" height="20" class="auto-style7"><span class="auto-style7"> </span>
                </a></font></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:CheckBox ID="BUMEN" runat="server" OnCheckedChanged="BUMEN_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">������</span></font></td>
                    <td colspan="5">
                        <asp:DropDownList ID="BUMENLIST" runat="server" OnSelectedIndexChanged="BUMENLIST_SelectedIndexChanged" DataSourceID="��������" DataTextField="������" DataValueField="������" AutoPostBack="True" CssClass="auto-style7">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="��������" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [������] FROM [����]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        <asp:CheckBox ID="SHIJIAN" runat="server" OnCheckedChanged="SHIJIAN_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">��ʱ��</span></font></td>
                    <td colspan="5">

                        <asp:TextBox ID="QISHIRIQI" runat="server" Width="116px" AutoPostBack="True" OnTextChanged="QISHIRIQI_TextChanged" Height="19px" CssClass="auto-style7"></asp:TextBox>
                        <font size="2" color="#808080"><span class="auto-style7">��
             </span>
             <asp:TextBox ID="JIESHURIQI" runat="server" Width="116px" AutoPostBack="True" OnTextChanged="JIESHURIQI_TextChanged" CssClass="auto-style7"></asp:TextBox>
                            <asp:Label ID="Label1" runat="server" Text="������&quot;��-��-��&quot;��ʽ,��2012-12-21" CssClass="auto-style7"></asp:Label>
                        </font></td>
                </tr>
                <tr>
                    <td align="center" colspan="6"></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style9">
                        <asp:CheckBox ID="WUXIAOLIANGHUA" runat="server" OnCheckedChanged="WUXIAOLIANGHUA_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">��ʾ��Ч����</span></font></td>
                    <td align="center" class="auto-style6">
                        <p align="center">
                            <asp:RadioButton ID="BANJISHUNXU" runat="server" OnCheckedChanged="BANJISHUNXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                            <font size="2"><span class="auto-style7">���༶˳������</span></font><span class="auto-style7"> </span>
                    </td>
                    <td align="center" class="auto-style6">
                        <asp:RadioButton ID="RIQISHUNXU" runat="server" OnCheckedChanged="RIQISHUNXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">������˳������</span></font></td>
                    <td align="center" class="auto-style6">
                        <asp:RadioButton ID="RIQIDAOXU" runat="server" OnCheckedChanged="RIQIDAOXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">�����ڵ�������</span></font></td>
                    <td align="center" class="auto-style2">
                        <asp:RadioButton ID="FENSHUPAIXU" runat="server" OnCheckedChanged="FENSHUPAIXU_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">����������</span></font></td>
                    <td align="center" class="auto-style6">
                        <asp:RadioButton ID="TIJIAOREN" runat="server" Text="" OnCheckedChanged="TIJIAOREN_CheckedChanged" AutoPostBack="True" CssClass="auto-style7" />
                        <font size="2"><span class="auto-style7">���ύ������</span></font></td>
                </tr>
                <tr>
                    <td colspan="6">
                        <p align="center">
                            <asp:Button ID="Sure" runat="server" OnClick="Sure_Click" Text="�ύ" />

                            <%
                                if (ʲô��û������)
                                {
                                    //<script type="text/javascript">
                                    //     alart("δ�����κβ�ѯ����");
                                    // </script>
                                    Response.Clear();
                                    Response.Write(" <script language='javascript'+> location.reload();;alert('�Բ���,��ʲô��û������!');</script>");
                                    Response.Flush();
                                    Response.End();
                                }
                            %>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="action" value="scores">
        </div>




        <div id="���div" runat="server" visible="false" >
            <!-- β����:��λ�� -->
            <table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2">
                <p align="left"><b><font   size="3" color="#808080">������ϵͳ�������ķ��������ļ�¼��</font></b></p>

                <tr>
                    <td align="center" bgcolor="#3366FF" style="border-left: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >ID</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >����</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >����</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >�༶</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >����</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >�ۺϷ�</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >ԭ��</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >����</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >�ύʱ��</font></b></td>
                    
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >״̬</font></b></td>
                    <td align="center" bgcolor="#3366FF" style="border-right: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc" height="24">
                        <b><font size="2"  >����</font></b></td>
                </tr>


                <tr>
                    <%            

            string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
            System.Data.SqlClient.SqlConnection con1 = new System.Data.SqlClient.SqlConnection(ClubConnectionString);
            con1.Open();
            System.Data.SqlClient.SqlCommand SQLCom = new System.Data.SqlClient.SqlCommand();
            SQLCom.Connection = con1;
            SQLCom.CommandText =��SQL;
            SQLCom.CommandType = System.Data.CommandType.Text;
            System.Data.SqlClient.SqlDataReader conda2=SQLCom.ExecuteReader();
  
      
            if (conda2.Read()==false)
            {
                  %>
                    <td align='center' bgcolor="#ECECFF" style="border-left: 1px solid #ccc; border: 1px solid #ccc; border-top: none;" colspan="12" class="auto-style5">
                        <i>
                            <font size="2" color="#94AEC6">�޷��������ļ�¼��</font></i></td>
                </tr>
                <%
                con1.Close();
                
               }
               else
               {
               string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(Main1ConnectionString);
                con.Open();
                System.Data.SqlClient.SqlCommand cons = new System.Data.SqlClient.SqlCommand(��SQL, con);
                System.Data.SqlClient.SqlDataReader conda = cons.ExecuteReader();
                while (conda.Read())
                {
                    j++;
                    k++;
                    ��ѯID.Text = conda.GetInt32(0).ToString();
                    �۷ֲ��� = conda.GetString(1);
                    if (�۷ֲ��� == null)
                        ����.Text = "N/A";
                    else
                        ����.Text = �۷ֲ���;
                    if (��ʾ�����༭��Bol)//�����β��ɼ��۷�����!!
                    {
                        ����.Text = conda.GetString(2);
                    }
                    else
                        ����.Text = "/";
                    �����༶.Text = conda.GetString(3) + conda.GetString(9).ToString() + "��";

                    KOUFENSHU = (double)conda.GetFloat(4);
                    KOUFENSHU = -KOUFENSHU;
                    if (KOUFENSHU > 0)
                    {
                        ����.Text = "+" + KOUFENSHU.ToString();
                    }
                    else
                        ����.Text = KOUFENSHU.ToString();

                    //if (��ʾ�ۺϷ���Bol)
                    //{
                    //    �����ۺϷ� = 0.2 * KOUFENSHU;
                    //}
                    //if (�����ۺϷ� != 0)
                    //{
                    //    if (�����ۺϷ� > 0)
                    //        �ۺϷ�.Text = "+" + �����ۺϷ�.ToString();
                    //}
                    //else
                    //{
                    �ۺϷ�.Text = "/";
                    ԭ��.Text = conda.GetString(5);
                    �ύʱ��.Text = conda.GetDateTime(6).ToString();
                    
                    if (conda.GetBoolean(7).ToString().ToLower() == "true")
                        ״̬.Text = "��Ч~";
                    else
                        ״̬.Text = "��Ч...";
                    if (conda.GetString(10) != null)
                        ��עLabel.Text = conda.GetString(10);
                    else
                        ��עLabel.Text = "NULL";
      %>
                <tr>
                    <td align='center' bgcolor="#ECECFF" style="border-left: 1px solid #ccc; border: 1px solid #ccc; border-top: none;">
                        <asp:Label ID="��ѯID" runat="server" Text=""></asp:Label>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="����" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="����" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="�����༶" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="����" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border: 1px solid #ccc; border-left: none; border-top: none;"><font size="2">

                        <asp:Label ID="�ۺϷ�" runat="server" Text="Label"></asp:Label></font>

                    <td align="center" bgcolor="#ECECFF" style="border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22"><font size="2">
                        <asp:Label ID="ԭ��" runat="server" Text="Label"></asp:Label></font>

                    <td align="center" bgcolor="#ECECFF" style="border-left: medium none; border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22">
                        <asp:Label ID="��עLabel" runat="server" Text="Label"></asp:Label>
                    <td align="center" bgcolor="#ECECFF" style="border-left: medium none; border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22"><font size="2">
                        <asp:Label ID="�ύʱ��" runat="server" Text="Label"></asp:Label></font>
                    <td align="center" bgcolor="#ECECFF" style="border-left: medium none; border-right: 1px solid #ccc; border-top: medium none; border-bottom: 1px solid #ccc" height="22"><font size="2">

                        <asp:Label ID="״̬" runat="server" Text="Label" ></asp:Label></font>
                       
                    <td align="center" bgcolor="#ECECFF" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; text-align: left; border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" height="22">
                        
                         <%if (״̬.Text == "��Ч~" && ��������Bol) { 
                               %>&nbsp;
                     <asp:LinkButton ID="��������LINK" Style="font-size: small" runat="server" OnClick="��������LINK_Click" >
                            ��������
                        </asp:LinkButton>
                         <%  
                           }
                           else
                           {
                               if (״̬.Text == "��Ч~" && ��������Bol == false)
                               {%>&nbsp;
                        <font size="2">����ϵ�ϼ��޸�</font>
                         <%}
                               else
                               { %>
                         <font size="2">������<span class="auto-style4"><strong>���� </strong></span></font><%} %>

                    </td>
                </tr>
                <%
                }
                } //�����Ϣ.Text = "��" + 1 + "ҳ/��" + Math.Ceiling((double)(k / ÿҳ����)) + "ҳ ��ҳ" + (k < 10 ? k : 10) + "��/��" + k + "�� ";

       // if ((int)(k / (ÿҳ����)) == 1)
        //{
       //     ��ҳ.Enabled = false;
       //     ��һҳ.Enabled = false;
      //      ��һҳ.Enabled = false;
      //      ĩҳ.Enabled = false;
      //  }
               } %>
            </table>
            <br>

            <tr>
                <td bgcolor="#ECECFF" height="32" >
                    <div id="���Ͽ�" runat="server" visible="false" >
        <table border="0" width="100%" cellpadding="5" >
	<tr>
		<td bgcolor="#3366FF"><b><font   color="#FFFFFF">��д��������ԭ��</font></b></td>
	</tr>
	<tr>
		<td bgcolor="#ECECFF">
		<p align="center"><font size="2">ԭ��<asp:TextBox ID="����ԭ��TB" runat="server"></asp:TextBox>
            </font></td>
	</tr>
	<tr>
		<td bgcolor="#ECECFF">
<p align="center"> <font size="2" color="#FF0000">
			ע����ĩ�����иɲ���ˣ����й���ʧ���µĴ�۷ֽ��Թ�����������Ӱ�죬</font><font size="2" color="#008000">���ύ��Ϊ�������ͻ��ᣬ�ҽ���޷������ύ��</font><font size="2" color="#FF0000">��֪����</font></td>
	</tr>
	<tr>
		<td bgcolor="#ECECFF" height="32">
<p align="center"> 
    <asp:Button ID="ȷ������BT" runat="server" Text="�ύ" OnClick="ȷ������BT_Click" />
        </td>
	</tr>
</table>

                    </div></div>


    </form>
</body>

</html>

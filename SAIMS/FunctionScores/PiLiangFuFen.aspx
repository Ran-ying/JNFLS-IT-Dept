<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PiLiangFuFen.aspx.cs" Inherits="FunctionScores_PiLiangFuFen" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            background-image: url(../Images/microicons/lianghua1.png );
            font-family: 微软雅黑,黑体;
        }
        .style1
        {
            text-align: center;
        }
        .style2
        {
            font-family: 微软雅黑,黑体;
        }
        .auto-style1
        {
            text-align: center;
            height: 39px;
        }
        .auto-style2
        {
            font-size: xx-large;
            font-weight: bold;
        }
        .auto-style3
        {
            height: 92px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="共用">
        <table border="1" width="100%" cellpadding="5">
            <tr>
                <td colspan="5" bgcolor="#6699FF" class="auto-style1">
                    <font face="微软雅黑" color="#FFFFFF" style="text-align: center"><span class="auto-style2">
                        批量赋分</span></font>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <p align="center">
                        <font color="#FFFFFF" size="2"><span class="style2">不同原因的量化请多次提交，分数一旦提交后<font color="#FF0000">不可更改</font></span>！</font></p>
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <span class="style2"><font size="2" color="#FFFFFF"><strong>学期：</strong></font></span>
                </td>
                <td nowrap="nowrap" colspan="4">
                    <asp:Label ID="学期LB" runat="server" Text="Label" Font-Names="微软雅黑"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="120" align="center" height="25">
                    <font size="2" color="#FFFFFF" style="font-weight: 700"><span class="style2">部门：</span>
                    </font>
                </td>
                <td nowrap="nowrap" colspan="4" height="25">
                    <asp:Label ID="部门LB" runat="server" Text="Label" Font-Names="微软雅黑"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div id="CHOOSE" runat="server">
        <asp:LinkButton ID="通过选班级赋分" runat="server" OnClick="CHOOSE_DO">通过选班级赋分</asp:LinkButton>
        <hr />
        <asp:LinkButton ID="通过宿舍号赋分" runat="server" OnClick="CHOOSE_DO">通过宿舍号赋分</asp:LinkButton>
    </div>
    <div id="按班级" runat="server" visible="false">
        <table border="1" width="100%" cellpadding="5">
            <tr>
                <td width="120" align="center">
                    <font size="2" color="#FFFFFF">统一原因：
                </td>
                <td nowrap>
                    <font size="2"><font color="#FFFFFF" id="--">&nbsp;<asp:DropDownList ID="按班级原因DDL"
                        runat="server" DataSourceID="SqlDataSource1" DataTextField="原因" DataValueField="原因"
                        OnSelectedIndexChanged="按班级原因DDL_SelectedIndexChanged">
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                            SelectCommand="SELECT [原因] FROM [扣分原因] WHERE ([部门] = @部门)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="宿管部" Name="部门" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        &nbsp; </font>
                </td>
                <td nowrap colspan="2">
                    <font size="2" color="#FFFFFF">统一备注：</font>
                </td>
                <td nowrap>
                    <asp:TextBox ID="按班级备注" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font size="2"><font color="#FFFFFF">班级：<font color="#FFFFFF"><asp:DropDownList ID="按班级班级1"
                        runat="server" DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="班级">
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                            SelectCommand="SELECT [班级] FROM [班级]"></asp:SqlDataSource>
                    </font></font>&nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="按班级扣分1" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">相关学生姓名:
                        <asp:TextBox ID="按班级学生1" runat="server"></asp:TextBox> &nbsp;
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">班级：</font><font color="#FFFFFF" size="2"><asp:DropDownList
                        ID="按班级班级2" runat="server" DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="班级">
                    </asp:DropDownList>
                    </font>&nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="按班级扣分2" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">相关学生姓名:
                        <asp:TextBox ID="按班级学生2" runat="server"></asp:TextBox> &nbsp;
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">班级：</font><font color="#FFFFFF" size="2"><asp:DropDownList
                        ID="按班级班级3" runat="server" DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="班级">
                    </asp:DropDownList>
                    </font>&nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="按班级扣分3" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">相关学生姓名:
                        <asp:TextBox ID="按班级学生3" runat="server"></asp:TextBox> &nbsp;
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">班级：</font><font color="#FFFFFF" size="2"><asp:DropDownList
                        ID="按班级班级4" runat="server" DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="班级">
                    </asp:DropDownList>
                    </font>&nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="按班级扣分4" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">相关学生姓名:
                        <asp:TextBox ID="按班级学生4" runat="server"></asp:TextBox> &nbsp;
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">班级：</font><font color="#FFFFFF" size="2"><asp:DropDownList
                        ID="按班级班级5" runat="server" DataSourceID="SqlDataSource2" DataTextField="班级" DataValueField="班级">
                    </asp:DropDownList>
                    </font>&nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="按班级扣分5" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">相关学生姓名:
                        <asp:TextBox ID="按班级学生5" runat="server"></asp:TextBox> &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="宿管部" runat="server" visible="false">
        <table border="1" width="100%" cellpadding="5">
            <tr>
                <td width="120" align="center">
                    <font size="2" color="#FFFFFF">统一原因：
                </td>
                <td nowrap>
                    <font size="2"><font color="#FFFFFF"><font color="#FFFFFF" size="2">
                        <asp:DropDownList ID="宿管部原因DDL" runat="server" DataSourceID="SqlDataSource4" DataTextField="原因"
                            DataValueField="原因" OnSelectedIndexChanged="宿管部原因DDL_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                            SelectCommand="SELECT [原因] FROM [扣分原因]"></asp:SqlDataSource>
                    </font>&nbsp;&nbsp; </font><a title="若原因不同请分别提交。" href="javascript:;">
                        <img border="0" src="image/index/qm.jpg" width="20" height="20"></a>
                </td>
                <td nowrap colspan="2">
                    <font size="2" color="#FFFFFF">统一备注：</font>
                </td>
                <td nowrap>
                    <asp:TextBox ID="宿管部备注" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="120" align="center" class="auto-style3">
                    <font size="2" color="#FFFFFF">选择单元：</font>
                </td>
                <td nowrap colspan="4" class="auto-style3">
                    <font color="#FFFFFF" size="2">
                        <asp:DropDownList ID="选择单元DDL" runat="server" DataSourceID="SqlDataSource3" DataTextField="宿舍楼"
                            DataValueField="宿舍楼">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>"
                            SelectCommand="SELECT [宿舍楼] FROM [宿舍单元]"></asp:SqlDataSource>
                    </font>&nbsp;<script>
                                     function SelectAll(k, p) {
                                         var checkboxs = document.getElementsByName("info" + k);
                                         for (var i = 0; i < checkboxs.length; i++) {
                                             var e = checkboxs[i];
                                             e.checked = !e.checked;
                                         }

                                         if (k == 1) {
                                             document.Form1.class2.focus()
                                             if (p) {
                                                 document.Form1.ainfo1.checked = !document.Form1.ainfo1.checked
                                             }
                                         }

                                         if (k == 2) {
                                             document.Form1.class3.focus()
                                             if (p) {
                                                 document.Form1.ainfo2.checked = !document.Form1.ainfo2.checked
                                             }
                                         }

                                         if (k == 3) {
                                             document.Form1.class4.focus()
                                             if (p) {
                                                 document.Form1.ainfo3.checked = !document.Form1.ainfo3.checked
                                             }
                                         }

                                         if (k == 4) {
                                             document.Form1.class5.focus()
                                             if (p) {
                                                 document.Form1.ainfo4.checked = !document.Form1.ainfo4.checked
                                             }
                                         }

                                         if (k == 5) {
                                             document.Form1.B1.focus()
                                             if (p) {
                                                 document.Form5.ainfo1.checked = !document.Form1.ainfo5.checked
                                             }
                                         }
                                     }

                    </script><script>
                                 function NAlla() {
                                     document.Form1.ainfo1.checked = false
                                 }

                                 function NAllb() {
                                     document.Form1.ainfo2.checked = false
                                 }

                                 function NAllc() {
                                     document.Form1.ainfo3.checked = false
                                 }

                                 function NAlld() {
                                     document.Form1.ainfo4.checked = false
                                 }

                                 function NAlle() {
                                     document.Form1.ainfo5.checked = false
                                 }   
                    </script>
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font size="2"><font color="#FFFFFF">宿舍：</font><asp:TextBox ID="宿舍1" runat="server"
                        Width="52px"></asp:TextBox> &nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="宿舍扣分1" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">量化对象：</font>
                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="全部1" runat="server" OnCheckedChanged="全部_CheckedChanged" AutoPostBack="True" />
                            <font size="2">全部(勾选此项则无需以下选择)</font></font><p>
                                <font size="2">
                                    <asp:CheckBox ID="全部11" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="1号" />
                                    <asp:CheckBox ID="全部12" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="2号" />
                                    <asp:CheckBox ID="全部13" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="3号" />
                                    <asp:CheckBox ID="全部14" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="4号" />
                                    <asp:CheckBox ID="全部15" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="5号" />
                                    <br>
                                    <asp:CheckBox ID="全部16" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="6号" />
                                    <asp:CheckBox ID="全部17" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="7号" />
                                    <asp:CheckBox ID="全部18" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="8号" />
                                    <asp:CheckBox ID="全部19" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="9号" />
                                    <asp:CheckBox ID="全部110" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="10号" />
                            &nbsp;
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">宿舍：</font><asp:TextBox ID="宿舍2" runat="server" Width="52px"></asp:TextBox>
                    &nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="宿舍扣分2" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">量化对象：</font>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="全部2" runat="server" OnCheckedChanged="全部_CheckedChanged" AutoPostBack="True" />
                            <font size="2">全部(勾选此项则无需以下选择)</font></font><p>
                                <font size="2">
                                    <asp:CheckBox ID="全部21" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="1号" />
                                    <asp:CheckBox ID="全部22" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="2号" />
                                    <asp:CheckBox ID="全部23" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="3号" />
                                    <asp:CheckBox ID="全部24" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="4号" />
                                    <asp:CheckBox ID="全部25" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="5号" />
                                    <br>
                                    <asp:CheckBox ID="全部26" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="6号" />
                                    <asp:CheckBox ID="全部27" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="7号" />
                                    <asp:CheckBox ID="全部28" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="8号" />
                                    <asp:CheckBox ID="全部29" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="9号" />
                                    <asp:CheckBox ID="全部210" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="10号" />
                            &nbsp;
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">宿舍：</font><asp:TextBox ID="宿舍3" runat="server" Width="52px"></asp:TextBox>
                    &nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="宿舍扣分3" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">量化对象：</font>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="全部3" runat="server" OnCheckedChanged="全部_CheckedChanged" AutoPostBack="True" />
                            <font size="2">全部(勾选此项则无需以下选择)</font></font><p>
                                <asp:CheckBox ID="全部31" runat="server" OnCheckedChanged="子全部_CheckedChanged" Text="1号" />
                                <font size="2">
                                    <asp:CheckBox ID="全部32" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="2号" />
                                    <asp:CheckBox ID="全部33" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="3号" />
                                    <asp:CheckBox ID="全部34" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="4号" />
                                    <asp:CheckBox ID="全部35" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="5号" />
                                    <br>
                                    <asp:CheckBox ID="全部36" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="6号" />
                                    <asp:CheckBox ID="全部37" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="7号" />
                                    <asp:CheckBox ID="全部38" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="8号" />
                                    <asp:CheckBox ID="全部39" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="9号" />
                                    <asp:CheckBox ID="全部310" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="10号" />
                            &nbsp;</ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">宿舍：</font><asp:TextBox ID="宿舍4" runat="server" Width="52px"></asp:TextBox>
                    &nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="宿舍扣分4" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">量化对象：</font>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="全部4" runat="server" OnCheckedChanged="全部_CheckedChanged" AutoPostBack="True" />
                            <font size="2">全部(勾选此项则无需以下选择)</font></font><p>
                                <font size="2">
                                    <asp:CheckBox ID="全部41" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="1号" />
                                    <asp:CheckBox ID="全部42" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="2号" />
                                    <asp:CheckBox ID="全部43" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="3号" />
                                    <asp:CheckBox ID="全部44" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="4号" />
                                    <asp:CheckBox ID="全部45" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="5号" />
                                    <br>
                                    <asp:CheckBox ID="全部46" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="6号" />
                                    <asp:CheckBox ID="全部47" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="7号" />
                                    <asp:CheckBox ID="全部48" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="8号" />
                                    <asp:CheckBox ID="全部49" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="9号" />
                                    <asp:CheckBox ID="全部410" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="10号" />
                            &nbsp;</ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td width="120" align="center">
                    <font color="#FFFFFF" size="2">宿舍：</font><asp:TextBox ID="宿舍5" runat="server" Width="52px"></asp:TextBox>
                    &nbsp;
                </td>
                <td width="200" nowrap colspan="2">
                    <font size="2">扣分：
                        <asp:TextBox ID="宿舍扣分5" runat="server"></asp:TextBox> &nbsp;
                </td>
                <td width="300" nowrap colspan="2">
                    <font size="2">量化对象：</font>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="全部5" runat="server" OnCheckedChanged="全部_CheckedChanged" AutoPostBack="True" />
                            <font size="2">全部(勾选此项则无需以下选择)</font></font><p>
                                <font size="2">
                                    <asp:CheckBox ID="全部51" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="1号" />
                                    <asp:CheckBox ID="全部52" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="2号" />
                                    <asp:CheckBox ID="全部53" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="3号" />
                                    <asp:CheckBox ID="全部54" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="4号" />
                                    <asp:CheckBox ID="全部55" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="5号" />
                                    <br>
                                    <asp:CheckBox ID="全部56" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="6号" />
                                    <asp:CheckBox ID="全部57" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="7号" />
                                    <asp:CheckBox ID="全部58" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="8号" />
                                    <asp:CheckBox ID="全部59" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="9号" />
                                    <asp:CheckBox ID="全部510" runat="server" OnCheckedChanged="子全部_CheckedChanged" AutoPostBack="True"
                                        Text="10号" />
                            &nbsp;
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    <table border="0" width="100%" cellpadding="5" id="确定表格" runat="server" visible="false">
        <tr>
            <td width="120" align="center">
                <font color="#FFFFFF" size="2">备注：</font>
            </td>
            <td nowrap colspan="4">
                <font size="2">如需加分请在数字前输入“-”， 系统自动保留一位小数。不选班级、不填分数或分数写0的将直接被系统忽略。
            </td>
        </tr>
        <tr>
            <td width="120" align="center">
            </td>
            <td nowrap colspan="4">
                <font size="2">&nbsp;&nbsp;
                    <asp:Button ID="全部提交" runat="server" Text="全部提交" OnClick="全部提交_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="全部重置" runat="server" Text="全部重置" OnClick="全部重置_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

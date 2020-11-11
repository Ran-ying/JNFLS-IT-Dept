
<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ScoresInput.aspx.cs" Inherits="FunctionScores_InputScores_ifr" %>


<!DOCTYPE html>
<html>
<head>
<script language=javascript type="text/javascript">
    //alert("正在维护，请用批量量化");
</script>
</head>
</html>
<!--bug维护


    

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body { background-image:url(../Images/microicons/lianghua1.png);font-family: 微软雅黑,黑体;}
        #table1 {
            height: 371px;
            width: 423px;
            margin-right: 39px;
            margin-top: 0px;
        }
        #table2 {
            height: 28px;
            width: 297px;
            margin-right: 39px;
            margin-top: 0px;
        }
        .auto-style9 {
            width: 221px;
        }
        .auto-style10 {
            width: 218px;
            text-align: left;
        }
        .auto-style16 {
            text-align: center;
        }
        .auto-style19 {
            width: 81px;
            height: 44px;
            text-align: center;
        }
        .auto-style20 {
            height: 44px;
            margin-left: 40px;
        }
        .auto-style21 {
            height: 40px;
        }
        .auto-style22 {
            width: 218px;
            text-align: left;
            height: 40px;
        }
        .auto-style24 {
            width: 71px;
            height: 42px;
        }
        .auto-style25 {
            width: 247px;
            height: 32px;
            text-align: center;
        }
        .auto-style26 {
            width: 81px;
            height: 40px;
            text-align: center;
        }
        .auto-style27 {
            width: 81px;
            text-align: center;
        }
        .auto-style28 {
            width: 81px;
            height: 42px;
            text-align: center;
        }
        .auto-style29 {
            color: #FFFFFF;
        }
        .auto-style30 {
            color: #FFFFFF;
            font-size: x-large;
        }
        .auto-style31 {
            width: 81px;
            text-align: center;
            height: 55px;
        }
        .auto-style32 {
            height: 55px;
        }
        .auto-style33 {
            color: #FF0000;
        }
        .auto-style34 {
            font-size: x-large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
                        <input type="hidden" name="counttype" value="">

        <asp:Panel ID="输入详情Panel" runat="server">
<table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>量化提交（输入详情）</td></tr></table>            <p>
                <span class="auto-style29">多项扣分请多次提交，分数一旦提交后</span><font color="#FF0000">不可更改</font><span class="auto-style29">！</span><br>
             
            </p>
            <table border="0" cellpadding="0" id="table1">
                <tr>
                    <td bgcolor="#3366FF" background="../image/d_banner_cross.png" class="auto-style28"><font size="2" color="#FFFFFF"  >部门：</font></td>
                    <td class="auto-style24">
                        <asp:Label ID="部门显示label" runat="server">部门</asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="选择输入模式">
                    <td bgcolor="#3366FF" background="../image/d_banner_cross.png" class="auto-style28"><font size="2" color="#FFFFFF"  >选择：</font></td>
                    <td class="auto-style24">
                        <p style="width: 222px">
                            <asp:RadioButton ID="RadioButton1" runat="server" Text="按宿舍" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="True" CausesValidation="True" />

                            &nbsp;&nbsp;&nbsp;&nbsp;
                
                         <asp:RadioButton ID="RadioButton2" runat="server" Text="按班级" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="True" CausesValidation="True" />

                        </p>

                    </td>
                </tr>

                <tr id="班级行" runat="server">
                    <td bgcolor="#3366FF" background="../image/d_banner_cross.png" class="auto-style26"><font size="2" color="#FFFFFF"  >班级：</font></td>
                    <td class="auto-style21"><asp:DropDownList ID="班级" runat="server" DataSourceID="班级下拉框" DataTextField="班级" DataValueField="班级" Height="19px" Width="132px" AppendDataBoundItems="True" OnSelectedIndexChanged="班级_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>---选择年级---</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="宿舍楼行">
                    <td bgcolor="#3366FF" background="../image/d_banner_cross.png" class="auto-style26"><font size="2" color="#FFFFFF"  >宿舍楼：</font></td>
                    <td class="auto-style21"><asp:DropDownList ID="宿舍楼" runat="server" DataSourceID="选择宿舍楼" DataTextField="宿舍楼" DataValueField="宿舍楼" Height="19px" Width="132px" OnSelectedIndexChanged="宿舍楼_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem>---选择宿舍楼---</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr id="宿舍行" runat="server">
                    <td bgcolor="#3366FF" background="../image/d_banner_cross.png" class="auto-style27" height="40"><font size='2'   color="#FFFFFF">宿舍：</font></td>
                    <td height="40">
                        <asp:DropDownList ID="宿舍DDL" runat="server" DataSourceID="选择宿舍" DataTextField="宿舍名" DataValueField="宿舍名" Height="21px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="131px" AppendDataBoundItems="True">
                            <asp:ListItem>---选择宿舍---</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="原因行" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#3366FF" class="auto-style19"><font color="#FFFFFF"   size="2">原因：</font></td>
                    <td class="auto-style20"><asp:DropDownList ID="原因" runat="server" DataSourceID="扣分原因" DataTextField="原因" DataValueField="原因" Style="text-align: center" Height="23px" Width="134px" AppendDataBoundItems="True">
                        <asp:ListItem>----请选择原因-----</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr id="备注行" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#3366FF" class="auto-style26"><font color="#FFFFFF"   size="2">备注：</font></td>
                    <td background="../image/60white.png" class="auto-style21"><font size="2"><a href="javascript:;" title="不同项目的扣分请分别提交。"><asp:TextBox ID="备注" runat="server" Wrap="False" CausesValidation="True"></asp:TextBox>
                    </a></font></td>
                </tr>
                <tr id="相关学号tr" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#3366FF" class="auto-style27" height="40"><font color="#FFFFFF"   size="2">相关学号:</font></td>
                    <td background="../image/60white.png" height="40"><font size="2">
                        <asp:TextBox ID="相关学号" runat="server" Wrap="False" CausesValidation="True"></asp:TextBox>
                    </font></td>
                </tr>


                <tr id="床号" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#3366FF" class="auto-style31"><font color="#FFFFFF"   size="2">床号:</font></td>
                    <td background="../image/60white.png" class="auto-style32">

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <asp:CheckBox ID="全部" runat="server" Text="全部(勾选此项则无需输入)" OnCheckedChanged="全部_CheckedChanged" AutoPostBack="True" CausesValidation="True" />
                                <p class="auto-style25">
                                    <asp:CheckBox ID="first" runat="server" Text="1号" CausesValidation="True" />
                                    <asp:CheckBox ID="second" runat="server" Text="2号" CausesValidation="True" />
                                    <asp:CheckBox ID="third" runat="server" Text="3号" CausesValidation="True" AutoPostBack="True" />
                                    <asp:CheckBox ID="fourth" runat="server" Text="4号" CausesValidation="True" />
                                    <asp:CheckBox ID="fifth" runat="server" Text="5号" CausesValidation="True" />
                                    <br />
                                    <asp:CheckBox ID="sixth" runat="server" Text="6号" CausesValidation="True" />
                                    <asp:CheckBox ID="seventh" runat="server" Text="7号" CausesValidation="True" />
                                    <asp:CheckBox ID="eighth" runat="server" Text="8号" CausesValidation="True" />
                                    <asp:CheckBox ID="ninth" runat="server" Text="9号" CausesValidation="True" />
                                    <asp:CheckBox ID="tenth" runat="server" Text="10号" CausesValidation="True" />
                                </p>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>

                <tr id="输入分数行" runat="server">
                    <td background="../image/d_banner_cross.png" bgcolor="#3366FF" class="auto-style27" height="40"><font color="#FFFFFF"   size="2">扣分：</font></td>
                    <td background="../image/60white.png" height="40"><font size="2">
                        <asp:TextBox ID="扣分数" runat="server" AutoPostBack="True" Wrap="False"></asp:TextBox>
                        <a href="javascript:;" title="如需加分请在数字前输入“-”， 系统自动保留一位小数。">
                            <img border="0" src="image/index/qm.jpg" width="20" height="20" />
                        </a></font></td>
                </tr>
                <tr runat="server" id="提交行">
                    <td background="../image/d_banner_cross.png" bgcolor="#3366FF" class="auto-style26"></td>
                    <td background="../image/60white.png" class="auto-style21">
                        <p class="auto-style16">
                            <font size="2">
                                <asp:Button ID="提交" runat="server" Height="24px" OnClick="提交_Click" Text="提交" Width="51px" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="重置" runat="server" Height="23px" Text="重置" Width="51px" OnClick="重置_Click" />
                            </font>&nbsp;
                        </p>
                    </td>
                </tr>
                </tr>
            </table>

        </asp:Panel>
            
        <asp:Panel ID="选择年级Panel" runat="server">
          
<table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>量化提交（选择年级）</td></tr></table>            <p class="auto-style29">
                多项扣分请多次提交，分数一旦提交后<span class="auto-style33">不可更改</span>！</p>
            <table border="0" width="300" cellpadding="0" id="table3">
                <tr>
                    <td width="71" height="40" bgcolor="#3366FF" align="center" background="../image/d_banner_cross.png"><font size="2"   color="#FFFFFF">年级：</font></td>
                    <td height="40" background="../image/60white.png" class="auto-style9" style="text-align: left">
                        <asp:DropDownList ID="年级DList" runat="server" style="text-align: center" DataSourceID="选择年级" DataTextField="年级" DataValueField="年级" AutoPostBack="True" OnSelectedIndexChanged="年级DList_SelectedIndexChanged" AppendDataBoundItems="True" CausesValidation="True">
                            <asp:ListItem>---选择年级---</asp:ListItem>
                        </asp:DropDownList>
                        <a title="请选择年级，然后系统会自动调出该年级参与量化的部门清单。" href="javascript:;">
                        <img border="0" src="image/index/qm.jpg" width="20" height="20"/> </font></td>
                </tr>
            </table>
        </asp:Panel>
        
     
        <asp:Panel ID="选择部门Panel" runat="server">
<table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>量化提交（选择部门）</td></tr></table>            <p class="auto-style29">
                多项扣分请多次提交，分数一旦提交后<span class="auto-style33">不可更改</span>！ 
            </p>
            <table id="table2" border="0" cellpadding="0">
                <tr>
                    <td align="center"  bgcolor="#3366FF" width="71" class="auto-style21"><font color="#FFFFFF"   size="2">年级：</font></td>
                    <td class="auto-style22">
                        <asp:Label ID="年级Label" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center"  bgcolor="#3366FF" height="40" width="71"><font color="#FFFFFF"   size="2">部门：</font></td>
                    <td  height="40" class="auto-style10">
                        <asp:DropDownList ID="选择部门DList" runat="server" DataSourceID="选择部门" DataTextField="部门名" DataValueField="部门名" AutoPostBack="True" OnSelectedIndexChanged="选择部门DList_SelectedIndexChanged" Width="81px">
                            <asp:ListItem>---选择部门---</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </asp:Panel>



        
        <div id="量化选择部门" runat="server">



        
        </div>

        <div style ="position:absolute; top: 158px; left: 848px; height: 207px; width: 202px; margin-top: 0px;" runat ="server" visible ="false">
             <asp:SqlDataSource ID="扣分原因" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [原因] FROM [扣分原因] ORDER BY [ID]"></asp:SqlDataSource>
             <asp:SqlDataSource ID="选择年级" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [ID], [年级] FROM [年级] ORDER BY [ID]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="选择部门" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [年级], [部门名], [部门代号] FROM [部门] ORDER BY [ID]"></asp:SqlDataSource>
             <asp:SqlDataSource ID="选择宿舍" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [宿舍名] FROM [宿舍] ORDER BY [单元]" ></asp:SqlDataSource>
             <asp:SqlDataSource ID="选择宿舍楼" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [年级], [宿舍楼] FROM [宿舍单元]"></asp:SqlDataSource>

                       

             <asp:SqlDataSource ID="班级下拉框" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [班级] FROM [班级]"></asp:SqlDataSource>

                       

             
  
        </div>

       






    </form>
</body>
</html>
-->
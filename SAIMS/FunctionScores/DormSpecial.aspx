<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DormSpecial.aspx.cs" Inherits="DormSpecial" %>

<%@ Register Src="~/JudgeLogin.ascx" TagName="JudgeLogin" TagPrefix="Judge" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 225px;
        }

        .auto-style2 {
            width: 225px;
            height: 321px;
        }

        .auto-style3 {
            height: 321px;
        }
        .style1
        {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" id="SEARCH">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="年级"></asp:Label>
                    </td>
                    <td>

                        <asp:DropDownList ID="GRADE" runat="server">
                            <asp:ListItem>高一</asp:ListItem>
                            <asp:ListItem>高二</asp:ListItem>
                            <asp:ListItem>高三</asp:ListItem>
                            <asp:ListItem>全部</asp:ListItem>
                        </asp:DropDownList>

                        <asp:Label ID="ONEGRADE" runat="server" Text="ONEGRADE" Visible="false"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="时间段"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Calendar ID="BEGINTIME" runat="server" BackColor="#FFFFCC" 
                            BorderColor="#FFCC66" DayNameFormat="Shortest" Font-Names="Verdana" 
                            Font-Size="8pt" ForeColor="#663399" Height="200px" Width="220px" 
                            BorderWidth="1px" ShowGridLines="True">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                                ForeColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        </asp:Calendar>
                        <asp:Label ID="Label5" runat="server" Text="到"></asp:Label>
                        <asp:Calendar ID="ENDTIME" runat="server" BackColor="#FFFFCC" 
                            BorderColor="#FFCC66" DayNameFormat="Shortest" Font-Names="Verdana" 
                            Font-Size="8pt" ForeColor="#663399" Height="200px" Width="220px" 
                            BorderWidth="1px" ShowGridLines="True">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                                ForeColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        </asp:Calendar>

                        <asp:Label ID="Label6" runat="server" Text="使用说明:如果分别选择2013-03-06和2013-04-06,那么意味着结果是在2013-03-06零点到2013-04-06零点之间所扣的分数.(时间以输分的时间为准!)" Font-Bold="true"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label4" runat="server" Text="计分类型"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="JILV" runat="server" Text="纪律" />
                        <asp:CheckBox ID="WEISHENG" runat="server" Text="卫生" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="SUBMIT" runat="server" Height="22px" Text="提交" Width="179px" OnClick="SUBMIT_Click" />
        </div>
        <div runat="server" id="TABLE" visible="false">
            <table style="padding: inherit; width: 100%;" bgcolor="White">
                <tr>
                    <td class="style1">班级</td>
                    <td class="style1">对应宿舍相关项的分数</td>
                </tr>
                <% 
                         string str="";
                         string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
                         float ScoreOfClass=0;
                         for (int CLASS = 1; CLASS <= 20; CLASS++)
                        {
                            ScoreOfClass = 0;
                            str = (CLASS < 10 ? "0" + CLASS.ToString() : CLASS.ToString()) + "班";
                             
                            using(System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(Main1ConnectionString)){
                            con.Open();
                            System.Data.SqlClient.SqlCommand cons = new System.Data.SqlClient.SqlCommand(SQL+"AND 班级='"+str+"'", con);
                            System.Data.SqlClient.SqlDataReader conda = cons.ExecuteReader();
                                while(conda.Read())
                                {
                                    ScoreOfClass+=conda.GetFloat(0);
                                } 
                                CLASSLB.Text=str;
                                SCORELB.Text = (-ScoreOfClass).ToString();
                %>
                <tr>
                    <td>
                        <asp:Label ID="CLASSLB" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="SCORELB" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <%con.Close();} }%>
            </table>
        </div>
    </form>
</body>
</html>

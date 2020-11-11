<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrameOfTeachers.aspx.cs"
    Inherits="FunctionScores_FrameOfTeachers" %>

<%@ Register Src="~/viewinfo.ascx" TagName="viewinfo" TagPrefix="view" %>
<%@ Register Src="~/JudgeLogin.ascx" TagName="JudgeLogin" TagPrefix="Judge" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-image: url(../Images/microicons/lianghua1.png);
            font-family: 微软雅黑,黑体;
            font-:;
        }

        .style1 {
            width: 986px;
        }

        .style2 {
            width: 74px;
        }

        .style3 {
            width: 74px;
            height: 25px;
            font-size: small;
        }

        .style7 {
            width: 110px;
            text-align: center;
        }

        .style13 {
            width: 110px;
            height: 25px;
        }

        .style14 {
            width: 110px;
        }

        .style19 {
            height: 25px;
            width: 111px;
        }

        .style20 {
            width: 111px;
        }

        .style21 {
            height: 25px;
            width: 109px;
        }

        .style22 {
            width: 109px;
        }

        #GET {
            height: 376px;
        }

        .stylex {
            width: 684px;
        }

        .style23 {
            width: 74px;
            height: 25px;
        }

        .style24 {
            height: 25px;
            width: 403px;
        }
        .style25
        {
            height: 25px;
            width: 98px;
        }
        .style26
        {
            width: 98px;
        }
        .style27
        {
            height: 25px;
            width: 134px;
        }
        .style28
        {
            width: 134px;
        }
        .style29
        {
            width: 67px;
            height: 25px;
        }
        .style30
        {
            width: 67px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1" runat="server" />
        <div>


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="扣分数" HeaderText="扣分数" SortExpression="扣分数" />
                    <asp:BoundField DataField="扣分原因" HeaderText="扣分原因" SortExpression="扣分原因" />
                    <asp:BoundField DataField="扣分时间" HeaderText="扣分时间" SortExpression="扣分时间" />
                    <asp:BoundField DataField="宿舍编号" HeaderText="宿舍编号" SortExpression="宿舍编号" />
                    <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [扣分数], [扣分原因], [扣分时间], [宿舍编号], [备注] FROM [扣分]"></asp:SqlDataSource>


        </div>
        <div id="GET" runat="server">
            <table width="100%" height="30px">
                <tr style="font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
                    <td>请选择分数对比时间段</td>
                </tr>
            </table>
            <br />
            <asp:Calendar ID="起始日期" runat="server" Style="position: absolute; top: 149px; left: 264px;"
                BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest"
                Font-Names="微软雅黑" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True"
                Width="220px">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
            </asp:Calendar>
            &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="GO" runat="server" Text="确定" Style="position: absolute; top: 383px; left: 497px; width: 82px; height: 30px;"
            OnClick="GO_Click" />
            <asp:Calendar ID="结束日期" runat="server" Style="position: absolute; top: 149px; left: 582px;"
                BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest"
                Font-Names="微软雅黑" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True"
                Width="220px">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
            </asp:Calendar>
            <%
           
            %>
            <asp:Label ID="Label2" runat="server" Text="我想要查看" Style="position: absolute; top: 249px; left: 168px; width: 86px;"
                Font-Names="微软雅黑"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="到" Style="position: absolute; top: 249px; left: 532px; width: 14px;"
                Font-Names="微软雅黑"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="的内容。例:查询3月6号的扣分需分别选择3月6号和3月7号" Style="position: absolute; top: 249px; left: 818px; width: 193px;"
                Font-Names="微软雅黑"></asp:Label>
        </div>
        <div id="TABLE" runat="server" visible="false">
            <table align="center" class="style1">
                <font color="white">
                    <tr>
                        <td class="style3" style="font-family: 微软雅黑,黑体;background-color:White" >班级<br />
                            &nbsp;&nbsp;&nbsp;&nbsp; 部门
                        </td>
                        <td class="style13" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="学习部" runat="server" OnClick="学习部_Click" Style="text-align: center">学习部</asp:LinkButton>
                        </td>
                        <td class="style13" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="体育部" runat="server" OnClick="体育部_Click">体育部</asp:LinkButton>
                        </td>
                        <td class="style13" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="文艺部" runat="server" OnClick="文艺部_Click">文艺部</asp:LinkButton>
                        </td>
                        <td class="style21" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="自律部" runat="server" OnClick="自律部_Click">自律部</asp:LinkButton>
                        </td>
                        <td class="style13" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="卫生部" runat="server" OnClick="卫生部_Click">卫生部</asp:LinkButton>
                        </td>
                        <td class="style19" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="男宿部" runat="server" OnClick="男宿部_Click">男宿部</asp:LinkButton>
                        </td>
                        <td class="style25" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="监察部" runat="server" OnClick="监察部_Click">监察部</asp:LinkButton>
                        </td>
                        <td class="style19" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="生活部" runat="server" OnClick="生活部_Click">生活部</asp:LinkButton>
                        </td>
                        <td class="style19" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="女宿部" runat="server" OnClick="女宿部_Click">女宿部</asp:LinkButton>
                        </td>
                        <td class="style29" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="宣传部" runat="server" OnClick="宣传部_Click">宣传部</asp:LinkButton>
                        </td>
                        <td class="style27" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:Silver"
                            align="center">
                            <asp:LinkButton ID="信息部" runat="server" OnClick="信息部_Click">信息部</asp:LinkButton>
                        </td>
                        <td class="style19" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="主席团" runat="server" OnClick="主席团_Click" >主席团</asp:LinkButton>
                        </td>

                        <td class="style19" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:LinkButton ID="公物部" runat="server" OnClick="公物部_Click" >公物部</asp:LinkButton>
                            </td>
                        <td class="style19" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                               <asp:Label ID="adsgasdg" runat="server" Text="总分(宿舍量化20%)"></asp:Label>
                        </td>
                    </tr>
                <%
                        string str = "";
                        for (int CLASS = 1; CLASS <= 20; CLASS++)
                        {

                            str = (CLASS < 10 ? "0" + CLASS.ToString() : CLASS.ToString()) + "班";
                            string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
                            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(Main1ConnectionString);
                            con.Open();
                            System.Data.SqlClient.SqlCommand cons = new System.Data.SqlClient.SqlCommand(SQLOFCLASS + " AND 班级='" + str + "' AND 是否有效='True'", con);
                            System.Data.SqlClient.SqlDataReader conda = cons.ExecuteReader();
                            
                            while (conda.Read())
                            {
                                if ((qishiriqi.CompareTo(conda.GetDateTime(2))) >= 0 || jieshuriqi.CompareTo(conda.GetDateTime(2)) <= 0)
                                    continue;
                                else
                                {
                                    switch (conda.GetString(0))
                                    {
                                        case "学习部":
                                            学习扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "体育部":
                                            体育扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "卫生部":
                                            卫生扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "自律部":
                                            自律扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "生活部":
                                            生活扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "男宿部":
                                            男宿扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "女宿部":
                                            女宿扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "监察部":
                                            监察扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "文艺部":
                                            文艺扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "主席团":
                                            主席扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "信息部":
                                            信息扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "宣传部":
                                            宣传扣分 += (-conda.GetFloat(1));
                                            break;
                                        case "公物部":
                                            公物扣分 += (-conda.GetFloat(1));
                                            break;
                                    }
                                }
                            }
                            班级.Text = str;
                            
                           
                            学习SCORE.Text = Math.Round(学习扣分,2).ToString();
                            体育SCORE.Text = Math.Round(体育扣分,2).ToString();
                            男宿SCORE.Text = Math.Round(男宿扣分,2).ToString();
                            卫生SCORE.Text = Math.Round(卫生扣分,2).ToString();
                            自律SCORE.Text = Math.Round(自律扣分,2).ToString();
                            文艺SCORE.Text = Math.Round(文艺扣分,2).ToString();
                            监察SCORE.Text = Math.Round(监察扣分,2).ToString();
                            生活SCORE.Text = Math.Round(生活扣分,2).ToString();
                            女宿SCORE.Text = Math.Round(女宿扣分,2).ToString();
                            主席SCORE.Text = Math.Round(主席扣分,2).ToString();
                            信息SCORE.Text = Math.Round(信息扣分,2).ToString();
                            宣传SCORE.Text = Math.Round(宣传扣分,2).ToString();
                            公物SCORE.Text = Math.Round(公物扣分, 2).ToString();
                            SUM.Text = Math.Round((宣传扣分 + 信息扣分 + 主席扣分+女宿扣分*0.2+生活扣分+监察扣分+文艺扣分+自律扣分+卫生扣分+男宿扣分*0.2+体育扣分+学习扣分+公物扣分),3).ToString();

                            CLASSSCORESUM[CLASS - 1] = SUM.Text;
                            
                            学习扣分 = 0;
                            体育扣分 = 0;
                            男宿扣分 = 0;
                            卫生扣分 = 0;
                            自律扣分 = 0;
                            文艺扣分 = 0;
                            监察扣分 = 0;
                            生活扣分 = 0;
                            女宿扣分 = 0;
                            主席扣分 = 0;
                            信息扣分 = 0;
                            宣传扣分 = 0;
                            公物扣分 = 0;
                    %>
                    <tr>
                        <td class="style2" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center">
                            <asp:Label ID="班级" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="style14" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="学习SCORE" runat="server" Text="Label" ></asp:Label>
                        </td>
                        <td class="style7" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="体育SCORE" runat="server" Text="Label" ></asp:Label>
                        </td>
                        <td class="style14" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="文艺SCORE" runat="server" Text="Label" ></asp:Label>
                        </td>
                        <td class="style22" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="自律SCORE" runat="server" Text="Label" ></asp:Label>
                        </td>
                        <td class="style14" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="卫生SCORE" runat="server" Text="Label" ></asp:Label>
                        </td>
                        <td class="style20" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="男宿SCORE" runat="server" Text="Label" ></asp:Label>
                        </td>
                        <td class="style26" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="监察SCORE" runat="server" ></asp:Label>
                        </td>
                        <td class="style20" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="生活SCORE" runat="server" ></asp:Label>
                        </td>
                        <td class="style20" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="女宿SCORE" runat="server" Text="0" ></asp:Label>
                        </td>
                        <td class="style30" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="宣传SCORE" runat="server" Text="55555" ></asp:Label>
                        </td>
                        <td class="style28" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="信息SCORE" runat="server" Text="0" ></asp:Label>
                        </td>
                        <td class="style20" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="主席SCORE" runat="server" Text="0" ></asp:Label>
                        </td>
                        <td class="style20" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                            align="center" bgcolor="White">
                            <asp:Label ID="公物SCORE" runat="server" Text="0" ></asp:Label>
                        </td>
                        <td class="style20" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:Yellow"
                            align="center" >
                        <asp:Label ID="SUM" runat="server" BackColor="Yellow"></asp:Label></td>
                    </tr>
                    <% con.Close();
                        }
                       // Label1.Text = METHODS.GETMAX(CLASSSCORESUM).ToString()+"班量化最高!";
                        
                        %></font>
            </table>
            <asp:Label ID="Label1" runat="server" 
                Text="由于网络原因，投诉功能可能会带来不便。若对分数有疑问，请咨询相关部门部长。" 
                ForeColor="#FF3300"></asp:Label>
        </div>
        <div id="DETAIL" runat="server" visible="false">
            <asp:Label ID="详情部门" runat="server" Text="未选择" Font-Names="微软雅黑"></asp:Label>
            <table align="center" class="stylex">
                <tr>
                    <td class="style23" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                        align="center">
                        <asp:Label ID="adsgag" runat="server" Text="时间"></asp:Label>
                    </td>
                    <td class="style24" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                        align="center">
                        <asp:Label ID="原傲盾嘎因" runat="server" Text="原因及备注"></asp:Label>
                        <asp:LinkButton ID="投诉LB" runat="server" OnClick="投诉LB_Click">(我要投诉)</asp:LinkButton>
                    </td>
                    <td class="style21" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                        align="center" id="扣分">
                        <asp:Label ID="扣啊根深蒂固分" runat="server" Text="分数"></asp:Label>
                    </td>
                    
                    
                </tr>
                <%
                    if (SB == true)
                    {
                        Response.Clear();
                        Response.Write(" <script language='javascript'>alert('各个班量化详情正在建设。。。');</script>");
                        Response.Flush();
                        Response.End();
                      
                    }
                    else
                    {
                        string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
                        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(Main1ConnectionString);
                        con.Open();
                        System.Data.SqlClient.SqlCommand cons = new System.Data.SqlClient.SqlCommand(SQLOFDEP, con);
                        System.Data.SqlClient.SqlDataReader conda = cons.ExecuteReader();
                        DateTime qishi = new DateTime();
                        DateTime jieshu = new DateTime();
                        string qishistr = Session["qishiriqi"].ToString();
                        string jieshustr = Session["jieshuriqi"].ToString();
                        qishi = Convert.ToDateTime(qishistr);
                        string str = "";
                        jieshu = Convert.ToDateTime(jieshustr);
                        while (conda.Read())
                        {
                            if ((qishi.CompareTo(conda.GetDateTime(0))) >= 0 || jieshu.CompareTo(conda.GetDateTime(0)) <= 0)
                                continue;

                            时间.Text = conda.GetDateTime(0).ToString();
                            原因及备注.Text = "ID:" + conda.GetInt32(5).ToString() + "。原因:" + conda.GetString(1) + "。备注:" + conda.GetString(2) + "。" + (conda.IsDBNull(3) ? "" : " 宿舍编号:" + conda.GetString(3));
                            分数.Text = (-conda.GetFloat(4)).ToString();
                %>
                <tr>
                    <td class="style23" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                        align="center" >
                        <asp:Label ID="时间" runat="server" Text="LABLE" ></asp:Label>
                    </td>
                    <td class="style24" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                        align="center">
                        <asp:Label ID="原因及备注" runat="server" Text="Label" ></asp:Label>
                    </td>
                    <td class="style21" style="font-family: 微软雅黑,黑体; border: 1px solid #ccc; border-left: none; border-top: none; background-color:White"
                        align="center">
                        <asp:Label ID="分数" runat="server" Text="Label" ></asp:Label>
                    </td>
                    
                </tr>
                <%} con.Close();
                    }%>
            </table>
        </div>
        <div runat="server" id="投诉DIV" visible="false">
            <asp:Label runat="server" Text="投诉的分数的ID(请务必保证正确，否则将错误地通知其他部门):"></asp:Label>
            <asp:TextBox ID="投诉IDTB" runat="server"></asp:TextBox>
            <asp:Button ID="投诉BT" runat="server" Text="确定" OnClick="投诉BT_Click" 
                Height="18px" Width="96px" />

        </div>
        <br /><div style="text-align:center">
        <asp:CheckBox ID="checkbox_domiscore" runat="server" 
            oncheckedchanged="CheckBox1_CheckedChanged" Text="分别显示宿管纪律卫生量化" 
            AutoPostBack="True" />
        <asp:CheckBox ID="checkbox_ZILV_d" runat="server" 
            oncheckedchanged="CheckBox2_CheckedChanged" Text="分别显示自律仪表纪律量化" 
            AutoPostBack="True" />
            </div><br />
        <asp:SqlDataSource ID="SqlDataSource_domiScore_D_c" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [MainSQL].[dbo].[班级].班级,SUM(-[MainSQL].[dbo].[扣分].扣分数)
  FROM [MainSQL].[dbo].[班级] , [MainSQL].[dbo].[扣分] , MainSQL.dbo.年级
  WHERE ((MainSQL.dbo.班级.班级=MainSQL.dbo.扣分.班级) AND ([MainSQL].[dbo].[班级].年级=MainSQL.dbo.年级.ID) AND (MainSQL.dbo.年级.年级=@年级) AND (是否有效='True') AND ([MainSQL].[dbo].[扣分].年级=@年级) AND ([MainSQL].[dbo].[扣分].扣分原因 LIKE '卫生%') AND ([扣分时间] &lt;= @扣分时间) AND ([扣分时间] &gt;= @扣分时间2))
  GROUP BY [MainSQL].[dbo].[班级].班级 ORDER BY [MainSQL].[dbo].[班级].班级
">
            <SelectParameters>
                <asp:SessionParameter Name="年级" SessionField="年级名" />
                <asp:ControlParameter ControlID="结束日期" Name="扣分时间" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="起始日期" Name="扣分时间2" 
                    PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_ZILV_YIBIAO" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [MainSQL].[dbo].[班级].班级,SUM(-[MainSQL].[dbo].[扣分].扣分数)
  FROM [MainSQL].[dbo].[班级] , [MainSQL].[dbo].[扣分] , MainSQL.dbo.年级
  WHERE (([MainSQL].[dbo].[扣分].扣分部门='自律部') AND (MainSQL.dbo.班级.班级=MainSQL.dbo.扣分.班级) AND ([MainSQL].[dbo].[班级].年级=MainSQL.dbo.年级.ID) AND (MainSQL.dbo.年级.年级=@年级) AND (是否有效='True') AND ([MainSQL].[dbo].[扣分].年级=@年级) AND (([扣分原因]='仪表') OR ([扣分原因]='穿拖鞋')) AND ([扣分时间] &lt;= @扣分时间) AND ([扣分时间] &gt;= @扣分时间2))
  GROUP BY [MainSQL].[dbo].[班级].班级 ORDER BY [MainSQL].[dbo].[班级].班级
">
            <SelectParameters>
                <asp:SessionParameter Name="年级" SessionField="年级名" />
                <asp:ControlParameter ControlID="结束日期" Name="扣分时间" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="起始日期" Name="扣分时间2" 
                    PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_domiScore_D_r" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [MainSQL].[dbo].[班级].班级,SUM(-[MainSQL].[dbo].[扣分].扣分数)
  FROM [MainSQL].[dbo].[班级] , [MainSQL].[dbo].[扣分] , MainSQL.dbo.年级
  WHERE ((MainSQL.dbo.班级.班级=MainSQL.dbo.扣分.班级) AND ([MainSQL].[dbo].[班级].年级=MainSQL.dbo.年级.ID) AND (MainSQL.dbo.年级.年级=@年级) AND (是否有效='True') AND ([MainSQL].[dbo].[扣分].年级=@年级) AND ([MainSQL].[dbo].[扣分].扣分原因 LIKE '纪律%') AND ([扣分时间] &lt;= @扣分时间) AND ([扣分时间] &gt;= @扣分时间2))
  GROUP BY [MainSQL].[dbo].[班级].班级 ORDER BY [MainSQL].[dbo].[班级].班级
">
            <SelectParameters>
                <asp:SessionParameter Name="年级" SessionField="年级名" />
                <asp:ControlParameter ControlID="结束日期" Name="扣分时间" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="起始日期" Name="扣分时间2" 
                    PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_ZILV_JILV" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" SelectCommand="SELECT [MainSQL].[dbo].[班级].班级,SUM(-[MainSQL].[dbo].[扣分].扣分数)
  FROM [MainSQL].[dbo].[班级] , [MainSQL].[dbo].[扣分] , MainSQL.dbo.年级
  WHERE ((MainSQL.dbo.班级.班级=MainSQL.dbo.扣分.班级) AND ([MainSQL].[dbo].[班级].年级=MainSQL.dbo.年级.ID) AND (MainSQL.dbo.年级.年级=@年级) AND (是否有效='True') AND ([MainSQL].[dbo].[扣分].年级=@年级) AND (([扣分原因]='走动') OR ([扣分原因]='眼操') OR ([扣分原因]='午自习') OR ([扣分原因]='闯岗') OR ([扣分原因]='早读迟到') OR ([扣分原因]='追加扣分')) AND ([扣分时间] &lt;= @扣分时间) AND ([扣分时间] &gt;= @扣分时间2))
  GROUP BY [MainSQL].[dbo].[班级].班级 ORDER BY [MainSQL].[dbo].[班级].班级
">
            <SelectParameters>
                <asp:SessionParameter Name="年级" SessionField="年级名" />
                <asp:ControlParameter ControlID="结束日期" Name="扣分时间" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="起始日期" Name="扣分时间2" 
                    PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="float:left">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_domiScore_D_c" Visible="False" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="Column1" HeaderText="卫生" ReadOnly="True" 
                    SortExpression="Column1" />
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
        </asp:GridView></div>
        <div style="float:left">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_domiScore_D_r" Visible="False" CellPadding="4" 
                ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="Column1" HeaderText="纪律" ReadOnly="True" 
                    SortExpression="Column1" />
                    
           

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
        
        
        </div>
        <div style="float:left">
        
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_ZILV_JILV" Visible="False" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="Column1" HeaderText="纪律" ReadOnly="True" 
                    SortExpression="Column1" />
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
        </div><div style="float:left">
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_ZILV_YIBIAO" Visible="False" CellPadding="4" 
                ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="Column1" HeaderText="仪表" ReadOnly="True" 
                    SortExpression="Column1" />
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
        </div>
    </form>
</body>
</html>

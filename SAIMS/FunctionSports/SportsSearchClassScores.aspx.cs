using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.EnterpriseServices;

public partial class FunctionSports_SportsSearchClassScores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportConnectionString);
        con.Open();
        try
        {
            string SportManageSql;

            SportManageSql = "SELECT 运动会出入场管理 FROM 权限表,用户 WHERE 用户.名字 = '" + Session["名字"] + "' AND 用户.用户组 = 权限表.职务";
            SqlCommand SportManageCommand = new SqlCommand();
            SportManageCommand.Connection = con;
            SportManageCommand.CommandText = SportManageSql;
            SportManageCommand.CommandType = CommandType.Text;

            bool SportManage = (bool)SportManageCommand.ExecuteScalar();

            if (SportManage == false)
            {
                Response.Redirect("index.aspx");
            }

            //========================================先默认载入高一成绩======================================
            string SearchClassSql;

            SearchClassSql = "SELECT 班级,编号,ID FROM 班级 WHERE 年级 = '" + Session["运动会班级"].ToString() + "'AND 班级 <> '级部'";

            SqlCommand SearchClassIns = new SqlCommand(SearchClassSql, con);
            SqlDataReader SearchClassDa1 = SearchClassIns.ExecuteReader();//=============先搜一遍班级数

            int count = 0;
            while (SearchClassDa1.Read())
            {
                count++;
            }
            SearchClassDa1.Close();

            SqlDataReader SearchClassDa2 = SearchClassIns.ExecuteReader();//===============这一边是记录班级代号、名称

            string[] classname = new string[count];
            string[] classnumber = new string[count];
            int[] classnum = new int[count];
            int i = 0;
            while (SearchClassDa2.Read())
            {
                classname[i] = SearchClassDa2.GetString(0);
                classnumber[i] = SearchClassDa2.GetString(1);
                classnum[i] = SearchClassDa2.GetInt32(2);//==================注意这里的顺序应与SELECT语句对应
                i++;
            }
            SearchClassDa2.Close();

            string t;
            int m=0;
            int n=0;
            for (m=0;m<count;m++)
            {
                for (n = m + 1; n < count;n++ )
                {
                    if(classnum[m]>classnum[n])
                    {
                        t = classnumber[m];
                        classnumber[m] = classnumber[n];
                        classnumber[n] = t;
                        t = classname[m];
                        classname[m] = classname[n];
                        classname[n] = t;
                        i = classnum[m];
                        classnum[m] = classnum[n];
                        classnum[n] = i;
                    }
                }
            }
            
            float[,] score = new float[count,5];//===================要开始算分数了
            
            string SearchClassScoreSql;
            string[] jianchazu = new string[5];
            jianchazu[0]="考勤";
            jianchazu[1]="纪律";
            jianchazu[2]="卫生";
            jianchazu[3]="场务";
            jianchazu[4]="宣传";
            int ii = 0;

                for (i = 0; i < count; i++)
                {
                    for (ii = 0; ii < 5; ii++)
                    {
                        SearchClassScoreSql = "SELECT 量化赋分 FROM 运动会赋分 WHERE 班级 = '" + classnumber[i] + "'AND 检查组 = '"+jianchazu[ii]+"'";//=======班级代号=classnumber[i]

                        SqlCommand SearchClassScoreIns = new SqlCommand(SearchClassScoreSql, con);
                        SqlDataReader SearchClassScoreDa = SearchClassScoreIns.ExecuteReader();

                        while (SearchClassScoreDa.Read())
                        {
                            score[i,ii] = score[i,ii] + SearchClassScoreDa.GetFloat(0);
                        }
                        SearchClassScoreDa.Close();
                    }
                }

            StringBuilder sb = new StringBuilder();//=============输出成绩表格
            sb.Append("<table width=80%>");//开始填充表格标签
            for (m = 0; m < count; m++)
            {
                sb.Append("<tr>");//开始填充行标签
                if (m == 0)
                {
                        sb.Append("<td>");
                        sb.Append("班级");
                        sb.Append("</td>");
                        sb.Append("<td>");
                        sb.Append("考勤");
                        sb.Append("</td>");
                        sb.Append("<td>");
                        sb.Append("纪律");
                        sb.Append("</td>");
                        sb.Append("<td>");
                        sb.Append("卫生");
                        sb.Append("</td>");
                        sb.Append("<td>");
                        sb.Append("场务");
                        sb.Append("</td>");
                        sb.Append("<td>");
                        sb.Append("宣传");
                        sb.Append("</td>");
                }
                else
                {
                    for (n = 0; n < 6; n++)
                    {
                        if (n == 0)
                        {
                            sb.Append("<td>");

                            sb.Append(classname[m - 1].ToString());
                            sb.Append("</td>");
                        }
                        else
                        {
                            sb.Append("<td>");

                            sb.Append(score[m - 1, n - 1].ToString());
                            sb.Append("</td>");
                        }
                    }
                }
                
                sb.Append("</tr>");
            }
            sb.Append("</table>");

           tablediv.InnerHtml = sb.ToString();
            
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }

    }
    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SportsClassScores.aspx");
    }
}
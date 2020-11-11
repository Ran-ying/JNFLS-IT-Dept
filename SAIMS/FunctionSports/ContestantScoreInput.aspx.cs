using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;

public partial class FunctionSports_Addgrades : System.Web.UI.Page
{
    public string grade,jifenfangshi;
    public int jifen;

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
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }


    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        GridView1.EditIndex = e.RowIndex;

        TextBox danweibox = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1"));
        Response.Write(danweibox.Text.ToString());

        Response.Write(danweibox);
        grade = danweibox.Text.ToString();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
            SqlConnection con = new SqlConnection(SportConnectionString);
            con.Open();
            try
            {
                string SearchJifenSql;

                SearchJifenSql = "SELECT 计分方式 FROM 运动会项目 WHERE 项目代码 = '" + DropDownList2.SelectedValue + "'";

                SqlCommand SearchJifenIns = new SqlCommand(SearchJifenSql, con);
                SqlDataReader SearchJifenDa1 = SearchJifenIns.ExecuteReader();

                if (SearchJifenDa1.Read())
                {
                    jifenfangshi = SearchJifenDa1.GetString(0);
                }
                SearchJifenDa1.Close();

                if (jifenfangshi == "按时间")
                {
                    Session["计分方式"] = 1;
                }
                else
                {
                    if (jifenfangshi == "按距离")
                    {
                        Session["计分方式"] = 2;
                    }
                    else
                    {
                        if (jifenfangshi == "按计数")
                        {
                            Session["计分方式"] = 3;
                        }
                    }
                }
            }
            finally
            {
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            } //=========================获取计分方式

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddGrades")
        {

            //获取当前行
            GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).Parent.Parent;

            //获取当前行中的某一列中的TextBox控件
            TextBox txtJobsName = (TextBox)gvr.Cells[9].FindControl("TextBox1");

            grade = txtJobsName.Text.ToString();


            string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
            SqlConnection con = new SqlConnection(SportConnectionString);
            con.Open();
            try
            {
                string AddGradesSql;
                Response.Write(jifen);
                switch (Convert.ToInt32(Session["计分方式"]))
                {
                    case (1):
                        {

                            AddGradesSql = "UPDATE 运动会比赛名单 SET 成绩时间 = '" + grade + "' WHERE ID = '" + e.CommandArgument.ToString() + "'";
                            SqlCommand AddGradesCommand = new SqlCommand();
                            AddGradesCommand.Connection = con;
                            AddGradesCommand.CommandText = AddGradesSql;
                            AddGradesCommand.CommandType = CommandType.Text;

                            DateTime NowTime = DateTime.Now;
                            if (txtJobsName.Text.ToString() == "")
                            {
                                Info.Text = "提交失败！（" + NowTime.ToString() + "）";
                            }
                            else
                            {
                                AddGradesCommand.ExecuteNonQuery();
                                Info.Text = "提交成功！（" + NowTime.ToString() + "）";//==========显示提交时间以确认提交
                            }
                            //============================提交量化数据==============================



                            break;
                        }
                    case (2):
                        {
                            AddGradesSql = "UPDATE 运动会比赛名单 SET 成绩距离 = '" + grade + "' WHERE ID = '" + e.CommandArgument.ToString() + "'";
                            SqlCommand AddGradesCommand = new SqlCommand();
                            AddGradesCommand.Connection = con;
                            AddGradesCommand.CommandText = AddGradesSql;
                            AddGradesCommand.CommandType = CommandType.Text;

                            DateTime NowTime = DateTime.Now;
                            if (txtJobsName.Text.ToString() == "")
                            {
                                Info.Text = "提交失败！（" + NowTime.ToString() + "）";
                            }
                            else
                            {
                                AddGradesCommand.ExecuteNonQuery();
                            }
                            //============================提交量化数据==============================


                            Info.Text = "提交成功！（" + NowTime.ToString() + "）";//==========显示提交时间以确认提交
                            break;
                        }
                    case (3):
                        {
                            AddGradesSql = "UPDATE 运动会比赛名单 SET 成绩计数 = '" + grade + "' WHERE ID = '" + e.CommandArgument.ToString() + "'";
                            SqlCommand AddGradesCommand = new SqlCommand();
                            AddGradesCommand.Connection = con;
                            AddGradesCommand.CommandText = AddGradesSql;
                            AddGradesCommand.CommandType = CommandType.Text;

                            DateTime NowTime = DateTime.Now;
                            if (txtJobsName.Text.ToString() == "")
                            {
                                Info.Text = "提交失败！（" + NowTime.ToString() + "）";
                            }
                            else
                            {
                                AddGradesCommand.ExecuteNonQuery();
                            }
                            //============================提交量化数据==============================


                            Info.Text = "提交成功！（" + NowTime.ToString() + "）";//==========显示提交时间以确认提交
                            break;
                        }



                }
            }
            finally
            {
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }




        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}
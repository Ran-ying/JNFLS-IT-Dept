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

public partial class FunctionSports_award : System.Web.UI.Page
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
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "award")
        {
            string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
            SqlConnection con = new SqlConnection(SportConnectionString);
            con.Open();
            try
            {
                string AddGradesSql;

                
                            AddGradesSql = "UPDATE 运动会决赛发奖 SET 已发奖 = 'true' WHERE ID = '" + e.CommandArgument.ToString() + "'";
                            SqlCommand AddGradesCommand = new SqlCommand();
                            AddGradesCommand.Connection = con;
                            AddGradesCommand.CommandText = AddGradesSql;
                            AddGradesCommand.CommandType = CommandType.Text;

                            DateTime NowTime = DateTime.Now;
                            
                                AddGradesCommand.ExecuteNonQuery();
                            
                            //============================提交量化数据==============================


                            Info.Text = "提交成功！（" + NowTime.ToString() + "）";//==========显示提交时间以确认提交
                            
                        
                   

                
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
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
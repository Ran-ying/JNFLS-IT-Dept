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

public partial class FunctionSports_SportsClassScore : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SportsAddClassScore.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["运动会班级"] = DropDownList1.SelectedValue.ToString();
        Response.Redirect("SportsSearchClassScores.aspx");
    }
}
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing.Text;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string consql = "SELECT 班级签到,班级签到管理 FROM 权限表 WHERE 职务 = '" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 班级签到Bol = false, 班级签到管理Bol = false;


        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            班级签到Bol = conda.GetBoolean(0);
            班级签到管理Bol = conda.GetBoolean(1);
        }

        con.Close();

        if (班级签到Bol == false && 班级签到管理Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有此项操作权限!');</script>");
            Response.Flush();
            Response.End();
        }
    }
}
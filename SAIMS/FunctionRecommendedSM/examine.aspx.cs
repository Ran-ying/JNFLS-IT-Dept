using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionRecommendedSM_examine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string consql = "SELECT 审批广播 FROM 权限表 WHERE 职务 ='" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 审批广播Bol = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            审批广播Bol = conda.GetBoolean(0);
        }
        con.Close();
        if (审批广播Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有此权限!');</script>");
            Response.Flush();
            Response.End();
        }
    }
}
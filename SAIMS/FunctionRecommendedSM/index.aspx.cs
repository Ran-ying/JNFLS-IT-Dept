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

        string consql = "SELECT 保送生 FROM 用户 WHERE 用户名 ='" + Session["usersname"] + " '";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();
        bool TorF = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            TorF = conda.GetBoolean(0);
  
        }
        conda.Close();
        con.Close();

        if (Session["职务"].ToString() == "45")
            TorF = true;
        if (TorF == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='../index.aspx';alert('对不起,没有权限!');</script>");
            Response.Flush();
            Response.End();
        }
    }

}
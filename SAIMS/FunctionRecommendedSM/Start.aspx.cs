using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionRecommendedSM_Start : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        string consql = "SELECT ID FROM 保送生总目标 WHERE 申请者 ='"+ Session["名字"]+"'";
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

		string 读取="";

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            读取 = conda.GetString(0);
        }

		con.Close();



        if (读取 != "")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='Achievements.aspx';</script>");
            Response.Flush();
            Response.End();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            upclubdata = "INSERT INTO 保送生总目标 (申请者,是否完成,目标标题) VALUES ('" + Session["名字"] + "', 'false','"+TextBox1.Text+"')";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

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
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionRecommendedSM_finish : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       string id = Request.QueryString["id"];
       if (id == "")
       {
           Response.Clear();
           Response.Write(" <script language='javascript'+>top.location='index.aspx';</script>");
           Response.Flush();
           Response.End();
       }

       string consql = "SELECT 成就,申报描述 FROM 保送生分目标 WHERE ID =" + id + "AND 是否完成 = 'true'";
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
       con.Open();

       string 成就 = "",申报描述 = "";

       SqlCommand cons = new SqlCommand(consql, con);
       SqlDataReader conda = cons.ExecuteReader();
       while (conda.Read())
       {
           成就 = conda.GetString(0);
           申报描述 = conda.GetString(1);
       }

       con.Close();
       TextBox1.Text = 成就;
       text1.Text = 申报描述;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];

        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            upclubdata = " UPDATE 保送生分目标 SET 申报描述 = '" + text1.Text + "', 成就 = '" + TextBox1.Text + "',是否完成 ='true' WHERE ID=" + id;
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
    protected void Unnamed1_TextChanged(object sender, EventArgs e)
    {

    }
}
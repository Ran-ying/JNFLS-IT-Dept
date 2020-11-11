using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionAttendanceManaging_view : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Request.QueryString["ID"];
        if (ID != null)
        {
            string consql = "SELECT 申报描述 FROM 保送生分目标 WHERE ID =" + ID;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
            con.Open();

            string reason = "";

            SqlCommand cons = new SqlCommand(consql, con);
            SqlDataReader conda = cons.ExecuteReader();
            while (conda.Read())
            {
                reason = conda.GetString(0);
            }

            con.Close();
            TextBox1.Text = reason;
        }
    }
    protected void agree_Click(object sender, EventArgs e)
    {
           string ID = Request.QueryString["ID"];
           if (ID != null)
           {
               string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
               SqlConnection con = new SqlConnection(ClubConnectionString);
               con.Open();
               try
               {
                   string upclubdata;
                   upclubdata = "UPDATE 保送生分目标 SET 是否审批 ='true' WHERE ID="+ID;
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
    protected void return_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Write(" <script language='javascript'+>location='examine.aspx';</script>");
        Response.Flush();
        Response.End();    
    }
}
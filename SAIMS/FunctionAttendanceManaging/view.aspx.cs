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
            string consql = "SELECT 理由 FROM 离校申请 WHERE ID =" + ID;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
            con.Open();

            string reason = "";

            SqlCommand cons = new SqlCommand(consql, con);
            SqlDataReader conda = cons.ExecuteReader();
            while (conda.Read())
            {
                if(conda.GetString(0) != null)
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
                   upclubdata = "UPDATE 消息 SET 申请状态 ='true' WHERE ID="+ID;
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
}
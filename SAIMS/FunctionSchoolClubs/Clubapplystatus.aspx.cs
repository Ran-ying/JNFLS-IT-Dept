using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionSchoolClubs_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string ID = Request.QueryString["ID"];

                string apply_statussql;

                apply_statussql = "SELECT 审批 FROM 预约 WHERE 预约社团 = '" + ID + "'";
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con;
                Command1.CommandText = apply_statussql;
                Command1.CommandType = CommandType.Text;

                if (Command1.ExecuteScalar() != null)
                {
                    bool apply_status = (bool)Command1.ExecuteScalar(); //获取审批状态
                }
                else
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>alert('对不起,您的社团还没有预约记录!');</script>");
                    Response.Flush();
                    Response.End();
                }
            
            con.Close();
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
      
    }
}
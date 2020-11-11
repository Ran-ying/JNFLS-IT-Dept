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
        
        /*
         * bool TF;


        string ConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        try
        {
            string ClearanceSql;

            ClearanceSql = "SELECT 图书馆管理 FROM 权限表 WHERE 职务 = '" + Session["职务"] + "'";
            SqlCommand ClearanceSqlCommand = new SqlCommand();
            ClearanceSqlCommand.Connection = con;
            ClearanceSqlCommand.CommandText = ClearanceSql;
            ClearanceSqlCommand.CommandType = CommandType.Text;

            TF = (bool)ClearanceSqlCommand.ExecuteScalar();
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
        if (TF != true)
        {

            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('您无此权限！');</script>");
                Response.Flush();
                Response.End();

            }
        }
         * */

    }
}
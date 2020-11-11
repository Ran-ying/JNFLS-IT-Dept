using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionLyric_Face : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        backgroundlabel.Text=ReadBackground().ToString();

    }

    protected string ReadBackground()
    {
        string backgroundid = "";
        string ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string ClearanceSql = "SELECT [背景] FROM [MainSQL].[dbo].[歌词表] WHERE ID='1'";
        SqlCommand ClearanceCommand = new SqlCommand();
        ClearanceCommand.Connection = con;
        ClearanceCommand.CommandText = ClearanceSql;
        ClearanceCommand.CommandType = CommandType.Text;
        backgroundid = ClearanceCommand.ExecuteScalar().ToString();
        if (con != null && con.State != System.Data.ConnectionState.Closed)
        {
            con.Close();
        }
        return backgroundid;
    }

}
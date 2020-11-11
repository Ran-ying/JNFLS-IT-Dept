using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionMessage_reply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string recei = Request.QueryString["recei"];

        if (recei != null)
        {
            textbox_addressor.Text = recei; 
        }
    }
    protected void reply_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            upclubdata = "INSERT INTO 消息 (发起人,收件人,内容,日期) VALUES ('" + Session["usersname"] + "', '" + textbox_addressor.Text + "', '" + TextBox1.Text+"', '" + DateTime.Now + "')";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='outbox.aspx';alert('发送成功!');</script>");
            Response.Flush();
            Response.End();  
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
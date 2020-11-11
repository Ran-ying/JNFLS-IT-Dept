using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionMessage_View : System.Web.UI.Page
{
    public string ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = Request.QueryString["ID"];
        
        if (ID != null)
        {
            string consql = "SELECT 发起人,收件人,内容,日期,已读 FROM 消息 WHERE ID =" + ID + " AND 可见 = 'true'";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
            con.Open();

            string addressor="",receiver="",info="";
            DateTime date=DateTime.Now;
            bool state=false;//变量初始化

            SqlCommand cons = new SqlCommand(consql, con);
            SqlDataReader conda = cons.ExecuteReader();
            while (conda.Read())
            {
                addressor = conda.GetString(0);
                receiver = conda.GetString(1);
                info = conda.GetString(2);
                date = conda.GetDateTime(3);
                state = conda.GetBoolean(4);
            }
            conda.Close();
            if (receiver == Session["usersname"].ToString())
            {
                if (state == false)
                {
                    consql = "UPDATE 消息 SET 已读 = 'true' WHERE ID =" + ID;
                    SqlCommand Command1 = new SqlCommand();
                    Command1.Connection = con;
                    Command1.CommandText = consql;
                    Command1.CommandType = CommandType.Text;
                    Command1.ExecuteNonQuery();
                }
            }
            con.Close();

            label_addressor.Text = addressor;
            label_date.Text = date.ToString();
            label_state.Text = state.ToString();
            TextBox1.Text = info;
        }
    }

    protected void reply_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Write(" <script language='javascript'+>location='reply.aspx';</script>");
        Response.Flush();
        Response.End();    
    }
    protected void delete_Click(object sender, EventArgs e)
    {
        ID = Request.QueryString["ID"];
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            upclubdata = "UPDATE 消息 SET 可见 = 'false' WHERE ID ="+ID; 
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='inbox.aspx';alert('删除成功！')</script>");
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class FunctionAnouncement_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CKEditor1.config.toolbar = "Basic";
        string id = Request.QueryString["ID"] == null ? "" : Request.QueryString["ID"].ToString();
        if (id != null && id != "")
        {
            string MessageConnectionString = "";
            announceID.Text = id;
            MessageConnectionString = ConfigurationManager.ConnectionStrings["MessageConnectionString"].ToString();
            SqlConnection con1 = new SqlConnection(MessageConnectionString);
            try
            {
                con1.Open();
                string selectSQL;

                selectSQL = "select 日期,标题,内容 from 公告 where ID ='" + id + "'";
                SqlCommand selectNotes = new SqlCommand(selectSQL, con1);
                SqlDataReader noteReader = selectNotes.ExecuteReader();
                while (noteReader.Read())
                {
                    DateTime date = noteReader.GetDateTime(0);
                    string title = noteReader.GetString(1);
                    string content = noteReader.GetString(2);
                    titleTextBox0.Text = title;
                    CKEditor1.Text = content;
                    publishDateTime.Text = date.ToLongDateString() + "  " + date.ToLongTimeString();

                }
            }
            finally
            {
                if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
                {
                    con1.Close();
                }
            }
        }
    }  
}
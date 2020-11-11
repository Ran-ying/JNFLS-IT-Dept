using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Images_icons_SM_surprise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string MessageConnectionString = "";
        MessageConnectionString = ConfigurationManager.ConnectionStrings["MessageConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(MessageConnectionString);
        try
        {
            con1.Open();
            string selectSQL;
            selectSQL = TextBox1.Text.ToString();
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con1;
            Command1.CommandText = selectSQL;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

            if (Command1.ExecuteNonQuery() <= 0)
            {
                Label1.Text = "出错了！检查语句亲！";
            }
            else
            {
                Label1.Text = "操作成功";
            }
        }
        catch
        {
            Label1.Text = "出错了！检查语句亲！";
        }
        finally
        {
            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
               
            }
        }
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == "我是大响哥")
        {
            TextBox1.ReadOnly = false;
        }
        else if (TextBox2.Text == "信息部，一辈子")
        {
            TextBox1.ReadOnly = false;
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}
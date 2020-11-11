using System;
using System.Collections.Generic;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class FunctionAnouncement_Default : System.Web.UI.Page
{
    public bool 公告发布 = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        string consql = "SELECT 公告发布 FROM 权限表 WHERE 职务 ='" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();



        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            公告发布 = conda.GetBoolean(0);
        }

        con.Close();
        if (公告发布 == false)
        {
            AddBtn.Enabled = false;
            AddBtn.Visible = false;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (公告发布)
        {
            //处理查询
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = GridView1.SelectedRow;
            string id = row.Cells[1].Text;
            // Display the company name from the selected row.
            // In this example, the third column (index 2) contains
            // the company name.
            //Message.Text = "You selected " + row.Cells[2].Text + ".";

            Response.Redirect("./announcement.aspx?flag=modify&id=" + id);
        }
        else
        {
            //处理查询
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = GridView1.SelectedRow;
            string id = row.Cells[1].Text;
            // Display the company name from the selected row.
            // In this example, the third column (index 2) contains
            // the company name.
            //Message.Text = "You selected " + row.Cells[2].Text + ".";

            Response.Redirect("./announcementView.aspx?id=" + id);

        }

    }
    protected void Add_Click(object sender, EventArgs e)
    {
        Response.Redirect("./announcement.aspx?flag=add");
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionSchoolClubs_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Request.QueryString["ID"];

        string select = "SELECT 社团职务 From 社团成员 WHERE 社团名 = '" + ID + "' AND 社团成员 = '"+Session["名字"]+"'";

        string consql = "SELECT 社徽,社长 FROM 社团 WHERE 社团名 = '" + ID + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        string 社徽 = "", 社长 = "",社职="";

        SqlCommand cons = new SqlCommand(select, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {

            if(conda.GetString(0) != null);
            社职 = conda.GetString(0);
        }
        if(社职 == "副社长")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='ManageClub.aspx?ID=1'</script>");
            Response.Flush();
            Response.End();
        }
        cons = new SqlCommand(consql, con);
        conda = cons.ExecuteReader();
        while (conda.Read())
        {
            社徽 = conda.GetString(0);
            社长 = conda.GetString(1);
        }

        con.Close();
        ClubsImg.ImageUrl = 社徽;
        managepage_club_manager.Text = 社长;
        managepage_club_name.Text = ID;

        if (GridView1.Rows.Count.ToString() != null)
        Label1.Text = GridView1.Rows.Count.ToString();
    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
    

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Write(" <script language='javascript'+>alert('对不起,该功能暂对社员不开放!');location.reload();</script>");
        Response.Flush();
        Response.End();
    }
    protected void ApplyStatus_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Write(" <script language='javascript'+>location='Clubapplystatus.aspx?ID=" + Request.QueryString["ID"] + "';</script>");
        Response.Flush();
        Response.End();
    }
}
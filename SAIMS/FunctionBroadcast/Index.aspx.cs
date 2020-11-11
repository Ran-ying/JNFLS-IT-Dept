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
        string consql = "SELECT 下广播,审批广播 FROM 权限表 WHERE 职务 ='" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 下广播Bol = false, 审批广播Bol = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            下广播Bol = conda.GetBoolean(0);
            审批广播Bol = conda.GetBoolean(1);
        }

        con.Close();


        if (审批广播Bol == true)
        {
            img1.Src = "../Images/icons/broadcast-a.png";
            Announce.Disabled = true;
        }
        else
        {
            content.InnerHtml = " <img src=\"../Images/icons/broadcast-b.png\" usemap=\"#Map1\" border=\"0\"  runat=\"server\" id=\"img1\"/>"+
                "<map name=\"Map1\" id=\"Map1\" runat=\"server\">"+

             "<area shape=\"rect\" coords=\"0, 3, 490, 500\" href=\"mainfunc.aspx?ID=apply\" />"+
       //     " <area shape=\"rect\" coords=\"509, 5, 998, 500\" href=\"mainfunc.aspx?ID=manage\" id=\"Manage\" runat=\"server\" />"+
             "<area shape=\"rect\" coords=\"509, 3, 998, 500\" href=\"mainfunc.aspx?ID=announce\" id=\"Announce\" runat=\"server\" />"+

          " </map>";
          //  img1.Src = "../Images/icons/broadcast-b.png";
         //   Manage.Disabled = true;
          
        }
    }
}
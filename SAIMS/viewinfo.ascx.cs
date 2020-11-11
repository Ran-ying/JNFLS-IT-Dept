using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Clear();
        Response.Write(" <script language='javascript'+>top.location='../login.aspx';</script>");
        Response.Flush();
        Response.End();
    }
    public int 登陆判断 = 1;
 protected void Page_Load(object sender, EventArgs e)
    {


        //===============================================各种具体用户信息
        string MainConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(MainConnectionString);
        con1.Open();

        string indsql1;
        indsql1 = "SELECT 组名 FROM 职务 WHERE ID LIKE '" + Session["职务"] + "'";
        SqlCommand indins1 = new SqlCommand(indsql1,con1);
        SqlDataReader indda1 = indins1.ExecuteReader();
        if (indda1.Read())
        {
            Session["职务名"] = indda1.GetValue(0);
        }
        indda1.Close();

        string indsql2;
        indsql2 = "SELECT 部门名 FROM 部门 WHERE 部门代号 LIKE '" + Session["部门"] + "'";
        SqlCommand indins2 = new SqlCommand(indsql2, con1);
        SqlDataReader indda2 = indins2.ExecuteReader();
        if (indda2.Read())
        {

            Session["部门名"] = indda2.GetValue(0);

        }
        indda2.Close();

        string indsql3;
        indsql3 = "SELECT 班级,年级 FROM 班级 WHERE 编号 LIKE '" + Session["班级"] + "'";
        SqlCommand indins3 = new SqlCommand(indsql3, con1);
        SqlDataReader indda3 = indins3.ExecuteReader();
        while (indda3.Read())
        {

            Session["班级名"] = indda3.GetValue(0);
            Session["年级ID"] = indda3.GetValue(1);

        }
        indda3.Close();

        string indsql4;
        indsql4 = "SELECT 年级 FROM 年级 WHERE ID LIKE '" + Session["年级ID"] + "'";
        SqlCommand indins4 = new SqlCommand(indsql4, con1);
        SqlDataReader indda4 = indins4.ExecuteReader();
        if (indda4.Read())
        {

            Session["年级名"] = indda4.GetValue(0);

        }
        indda4.Close();

        con1.Close();
        //============================================================
        if (Session["login"] == "OK")
        {
            登陆判断 = 0;
            if (Session["年级名"] != null && Session["职务名"] != null && Session["名字"] != null)
            {

                infolable.Text = "您好，来自" + Session["年级名"].ToString() + Session["职务名"].ToString() + "的" + Session["名字"].ToString() ;
            }
            else
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>top.location='login.aspx';alert('错误的用户名或密码!');</script>");
                Response.Flush();
                Response.End();          
            }
           
        }
    }

 protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
 {
     Session.Clear();//=======================清除用户信息===============
     Response.Redirect("~/login.aspx");
 }
}


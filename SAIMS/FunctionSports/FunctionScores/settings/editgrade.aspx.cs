using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;



public partial class editgrade : System.Web.UI.Page
{
    public void MsgBox(string strMsg)//======================对话框模块======================
    {
        string StrScript;
        StrScript = ("<script language=javascript>alert('" + strMsg + "');</script>");
        System.Web.HttpContext.Current.Response.Write(StrScript);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "OK")
        {
            MsgBox("您未登录");
            Response.Redirect("login.aspx");
        }
        if (Convert.ToBoolean(Session["administor"]) == false)
        {
            MsgBox("对不起！您无此权限！");
            Response.Redirect("index.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string Main1ConnectionString = "";

        Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(Main1ConnectionString);
        con1.Open();
        string gradesql1;
        gradesql1 = "INSERT INTO 年级(年级) VALUES( '" +TextBox1.Text+"级"+"')";
        SqlCommand gradeins1 = new SqlCommand(gradesql1, con1);
        gradeins1.ExecuteNonQuery();
        con1.Close();

        Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con2 = new SqlConnection(Main1ConnectionString);
        con2.Open();
        string gradesql2;
        gradesql2 = "INSERT INTO 年级(年级) VALUES( '" + TextBox1.Text + "级" + "')";
        SqlCommand gradeins2 = new SqlCommand(gradesql2, con2);
        gradeins2.ExecuteNonQuery();
        con2.Close();

        MsgBox("提交成功！");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Clear();//=======================清除用户信息===============
        MsgBox("您已退出");
        Response.Redirect("login.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}

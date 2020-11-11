using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;

public partial class editclass : System.Web.UI.Page
{
    public int ID;
    public bool OK;
    public void MsgBox(string strMsg)//======================对话框模块======================
    {
        string StrScript;
        StrScript = ("<script language=javascript>");
        StrScript += ("alert('" + strMsg + "');");
        StrScript += ("</script>");
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

    protected void Button1_Click(object sender, EventArgs e)
    {


        string name;
        string num;
        OK = true;

        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);
        con1.Open();

        string classsql4;
        classsql4 = "SELECT 班级,编号 FROM 班级 WHERE 年级 LIKE '" + DropDownList1.SelectedValue  + "'";
        SqlCommand classins4 = new SqlCommand(classsql4, con1);
        SqlDataReader classda4 = classins4.ExecuteReader();
        while (classda4.Read())
        {
            name = classda4.GetString(0);
            num = classda4.GetString(1);
            if (name==TextBox1.Text+"班" || num== TextBox2.Text )
            {
                OK = false;
            }
            if (OK == false)
            {
                break;
            }
        }
        classda4.Close();

        if (OK == false)
        {
            MsgBox("当前班级名称或编号重复！");
            con1.Close();
            
        }
        else
        {
            string classsql1;
            classsql1 = "INSERT INTO 班级(班级,年级,编号) VALUES( '" + TextBox1.Text + "班" + "','" + DropDownList1.SelectedValue + "','" + TextBox2.Text + "')";
            SqlCommand classins1 = new SqlCommand(classsql1, con1);
            classins1.ExecuteNonQuery();

            con1.Close();


            ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
            SqlConnection con2 = new SqlConnection(ClubConnectionString);
            con2.Open();


            string classsql2;
            classsql2 = "SELECT ID FROM 年级 WHERE 年级 LIKE '" + DropDownList1.SelectedItem.Text + "'";
            SqlCommand classins2 = new SqlCommand(classsql2, con2);
            SqlDataReader classda2 = classins2.ExecuteReader();
            while (classda2.Read())
            {
                ID = classda2.GetInt32(0);
            }
            classda2.Close();

            string classsql3;
            classsql3 = "INSERT INTO 班级(班级,年级,编号) VALUES( '" + TextBox1.Text + "班" + "','" + ID + "','" + TextBox2.Text + "')";
            SqlCommand classins3 = new SqlCommand(classsql3, con2);
            classins3.ExecuteNonQuery();

            con2.Close();

            MsgBox("提交成功！");
        }
    }



}

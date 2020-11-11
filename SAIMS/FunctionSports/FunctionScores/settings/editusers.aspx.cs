using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editusers : System.Web.UI.Page
{
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string Main1SQLConnectionString = ConfigurationManager.ConnectionStrings["Main1SQLConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(Main1SQLConnectionString);
        con1.Open();

        string name;
        bool OK = true;
        string usersql1;
        usersql1 = "SELECT 用户名 FROM 用户 ";
        SqlCommand userins1 = new SqlCommand(usersql1, con1);
        SqlDataReader userda1 = userins1.ExecuteReader();
        while (userda1.Read())
        {
            name = userda1.GetString(0);
            if (name == TextBox1.Text)
            {
                OK = false;
            }
            if (OK == false)
            {
                break;
            }
        }
        userda1.Close();

        if (OK == false)
        {
            MsgBox("用户名有重复！");
            con1.Close();
        }
        else
        {
            string usersql2;
            usersql2 = "INSERT INTO 用户(用户名,名字,密码,用户组,部门,班级) VALUES( '" + TextBox1.Text + "','" + TextBox2.Text + "','957720459901671012142913139222184130207153','" + DropDownList4.SelectedValue + "','" + DropDownList3.SelectedValue + "','" + DropDownList2.SelectedValue + "')";
            SqlCommand userins2 = new SqlCommand(usersql2, con1);
            userins2.ExecuteNonQuery();
            con1.Close();
            MsgBox("提交成功！初始密码：password");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string Main1SQLConnectionString = ConfigurationManager.ConnectionStrings["Main1SQLConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(Main1SQLConnectionString);
        con1.Open();

        string name;
        bool OK = false;
        string usersql1;
        usersql1 = "SELECT 用户名 FROM 用户 ";
        SqlCommand userins1 = new SqlCommand(usersql1, con1);
        SqlDataReader userda1 = userins1.ExecuteReader();
        while (userda1.Read())
        {
            name = userda1.GetString(0);
            if (name == TextBox3.Text)
            {
                OK = true;
            }
            if (OK == true)
            {
                break;
            }
        }
        userda1.Close();

        if (OK == false)
        {
            MsgBox("用户名不存在！");
            con1.Close();
        }
        else
        {
            string usersql2;
            usersql2 = "UPDATE 用户 SET 密码 = '957720459901671012142913139222184130207153' WHERE 用户名 LIKE  '" + TextBox3.Text + "'";
            SqlCommand userup2 = new SqlCommand(usersql2, con1);
            userup2.ExecuteNonQuery();
            con1.Close();
            MsgBox("提交成功！初始密码：password");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string Main1SQLConnectionString = ConfigurationManager.ConnectionStrings["Main1SQLConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(Main1SQLConnectionString);
        con1.Open();

        string name;
        bool OK = false;
        string usersql1;
        usersql1 = "SELECT 用户名 FROM 用户 ";
        SqlCommand userins1 = new SqlCommand(usersql1, con1);
        SqlDataReader userda1 = userins1.ExecuteReader();
        while (userda1.Read())
        {
            name = userda1.GetString(0);
            if (name == TextBox3.Text)
            {
                OK = true;
            }
            if (OK == true)
            {
                break;
            }
        }
        userda1.Close();

        if (OK == false)
        {
            MsgBox("用户名不存在！");
            con1.Close();
        }
        else
        {
            string usersql2;
            usersql2 = "DELETE FROM 用户 WHERE 用户名 LIKE '" + TextBox3.Text + "'";
            SqlCommand userup2 = new SqlCommand(usersql2, con1);
            userup2.ExecuteNonQuery();
            con1.Close();
            MsgBox("删除成功！");
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
}

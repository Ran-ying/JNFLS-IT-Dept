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
public partial class editunit : System.Web.UI.Page
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
        string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(Main1ConnectionString);
        con1.Open();

        string name;
        bool OK = true;
        string unitsql1;
        unitsql1 = "SELECT 单元名 FROM 宿舍单元 WHERE 年级 LIKE '" + DropDownList1.SelectedValue + "'";
        SqlCommand unitins1 = new SqlCommand(unitsql1, con1);
        SqlDataReader unitda1 = unitins1.ExecuteReader();
        while (unitda1.Read())
        {
            name = unitda1.GetString(0);
            if (name == TextBox1.Text )
            {
                OK = false;
            }
            if (OK == false)
            {
                break;
            }
        }
        unitda1.Close();

        if (OK == false)
        {
            MsgBox("当前年级下单元名有重复！");
            con1.Close(); 
        }
        else
        {
            string unitsql2;
            unitsql2 = "INSERT INTO 宿舍单元(单元名,年级) VALUES( '" + TextBox1.Text + "','" + DropDownList1.SelectedValue +"')";
            SqlCommand unitins2 = new SqlCommand(unitsql2, con1);
            unitins2.ExecuteNonQuery();
            con1.Close();
            MsgBox("提交成功！");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con2 = new SqlConnection(Main1ConnectionString);
        con2.Open();

        string unitsql3;
        unitsql3 = "UPDATE 宿舍单元 SET 单元名 = '" + TextBox2.Text + "',年级='" + DropDownList3.SelectedValue + " 'WHERE ID LIKE  '" + DropDownList2.SelectedValue + "'";
        SqlCommand unitup3 = new SqlCommand(unitsql3, con2);
        unitup3.ExecuteNonQuery();

        string unitsql4 = "UPDATE 宿舍 SET 班级 = null , 年级 = '"+DropDownList3.SelectedValue+"'  WHERE 单元 LIKE '" + DropDownList2.SelectedValue + "'";
        SqlCommand unitup4 = new SqlCommand(unitsql4,con2);
        unitup4.ExecuteNonQuery();

        MsgBox("提交成功！");

        con2.Close();
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

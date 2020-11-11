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

public partial class editdep : System.Web.UI.Page
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
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);
        con1.Open();

        string name;
        int num;
        bool OK=true;
        string unitsql1;
        unitsql1 = "SELECT 部门名,部门代号 FROM 部门 WHERE 年级 LIKE '" + DropDownList1.SelectedValue + "'";
        SqlCommand unitins1 = new SqlCommand(unitsql1,con1);
        SqlDataReader unitda1 = unitins1.ExecuteReader();
        while (unitda1.Read())
        {
            name=unitda1.GetString(0);
            num = unitda1.GetInt32(1);
            if (name == TextBox1.Text || num.ToString() == TextBox2.Text)
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
            MsgBox("部门名或部门代号有重复！");
            con1.Close();
        }
        else
        {
            string unitsql2;
            unitsql2 = "INSERT INTO 部门(部门名,年级,部门代号) VALUES( '" + TextBox1.Text+ "','" +DropDownList1.SelectedValue + "','" + TextBox2.Text + "')";
            SqlCommand unitins2 = new SqlCommand(unitsql2, con1);
            unitins2.ExecuteNonQuery();
            con1.Close();
            MsgBox("提交成功！");
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

    protected void Button2_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con2 = new SqlConnection(ClubConnectionString);
        con2.Open();

        string name;
        bool OK = true;
        string depsql3;
        depsql3 = "SELECT 组名 FROM 职务 ";
        SqlCommand depins3 = new SqlCommand(depsql3, con2);
        SqlDataReader depda3 = depins3.ExecuteReader();
        while (depda3.Read())
        {
            name = depda3.GetString(0);
            if (name == TextBox3.Text )
            {
                OK = false;
            }
            if (OK == false)
            {
                break;
            }
        }
        depda3.Close();

        if (OK == false)
        {
            MsgBox("职务名称有重复！");
            con2.Close();
        }
        else
        {
            string depsql4;
            depsql4 = "INSERT INTO 职务(组名,量化权限,公告发布权限,公告删除权限,administor) VALUES( '" + TextBox3.Text + "','" + DropDownList2.SelectedValue + "','" + CheckBox1.Checked + "','"+CheckBox2.Checked+"','"+CheckBox3.Checked+"')";
            SqlCommand depins4 = new SqlCommand(depsql4, con2);
            depins4.ExecuteNonQuery();
            con2.Close();
            MsgBox("提交成功！");
        }

    }


    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {


        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con3 = new SqlConnection(ClubConnectionString);
        con3.Open();

        string depsql7;
        depsql7 = "SELECT 组名,量化权限,公告发布权限,公告删除权限,administor FROM 职务 WHERE ID LIKE '" + DropDownList3.SelectedValue + "'";
        SqlCommand depins7 = new SqlCommand(depsql7, con3);
        SqlDataReader depda7 = depins7.ExecuteReader();
        while (depda7.Read())
        {
            TextBox4.Text = depda7.GetString(0);
            DropDownList4.SelectedValue = depda7.GetInt32(1).ToString();
            CheckBox4.Checked = depda7.GetBoolean(2);
            CheckBox5.Checked = depda7.GetBoolean(3);
            CheckBox6.Checked = depda7.GetBoolean(4);
        }
        depda7.Close();

        con3.Close();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con3 = new SqlConnection(ClubConnectionString);
        con3.Open();
        
        string depsql8;
        depsql8 = "UPDATE 职务 SET 组名 = '"+TextBox4.Text+"',量化权限='"+DropDownList4.SelectedValue+"',公告发布权限='"+CheckBox4.Checked+"',公告删除权限='"+CheckBox5.Checked+"',administor='"+CheckBox6.Checked+" 'WHERE ID LIKE  '" + DropDownList3.SelectedValue + "'";
        SqlCommand depup8 = new SqlCommand(depsql8, con3);
        depup8.ExecuteNonQuery();

        MsgBox("提交成功！");
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == true)
        {
            TextBox5.Enabled = false;
        }
        else
        {
            TextBox5.Enabled = false;
        }
    }
}

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

public partial class editdor : System.Web.UI.Page
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
        string Main1ConnectionString = "";

        Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(Main1ConnectionString);
        con1.Open();

        string name,num;
        bool OK = true;
        string dorsql1;
        dorsql1 = "SELECT 宿舍名,编号 FROM 宿舍 WHERE 单元 LIKE '" + DropDownList3.SelectedValue + "'";
        SqlCommand dorins1 = new SqlCommand(dorsql1, con1);
        SqlDataReader dorda1 = dorins1.ExecuteReader();
        while (dorda1.Read())
        {
            name = dorda1.GetString(0);
            num = dorda1.GetString(1);
            if (name == TextBox1.Text||num == TextBox2.Text)
            {
                OK = false;
            }
            if (OK == false)
            {
                break;
            }
        }
        dorda1.Close();

        if (OK == false)
        {
            MsgBox("当前单元下宿舍名或编号有重复！");
            con1.Close();
        }
        else
        {
            
            string dorsql2;
            dorsql2 = "INSERT INTO 宿舍(宿舍名,混宿,班级,年级,单元,编号) VALUES( '" + TextBox1.Text + "','" + CheckBox1.Checked + "','" + DropDownList2.SelectedValue + "','" + DropDownList1.SelectedValue + "','" + DropDownList3.SelectedValue + "','" + TextBox2.Text + "')";
            SqlCommand dorins2 = new SqlCommand(dorsql2, con1);
            dorins2.ExecuteNonQuery();
            con1.Close();
            MsgBox("提交成功！");
        }
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        string Main1ConnectionString = "";

        Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con2 = new SqlConnection(Main1ConnectionString);
        con2.Open();


        string dorsql3;
        dorsql3 = "UPDATE 宿舍 SET 班级 = '" + DropDownList7.SelectedValue + "',混宿='" + CheckBox1.Checked + " 'WHERE 编号 LIKE  '" + DropDownList6.SelectedValue + "'";
        SqlCommand dorup3 = new SqlCommand(dorsql3, con2);
        dorup3.ExecuteNonQuery();
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        int i = 1;
        for (i = 1;i<= int.Parse(TextBox3.Text.ToString()); i++)
        {
            DropDownList10.Items.Add(i.ToString());
        }

        string Main1ConnectionString = "";

        Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con3 = new SqlConnection(Main1ConnectionString);
        con3.Open();


        string dorsql5;
        dorsql5 = "DELETE FROM 混宿 WHERE 宿舍编号 LIKE '" + DropDownList9.SelectedValue +"'";
        SqlCommand dorde5 = new SqlCommand(dorsql5, con3);
        dorde5.ExecuteNonQuery();

        con3.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string Main1ConnectionString = "";

        Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con3 = new SqlConnection(Main1ConnectionString);
        con3.Open();

        string dorsql5;
        dorsql5 = "DELETE FROM 混宿 WHERE 宿舍编号 LIKE '" + DropDownList9.SelectedValue + "'AND 床号 LIKE'" + DropDownList10.SelectedValue + "'";
        SqlCommand dorde5 = new SqlCommand(dorsql5, con3);
        dorde5.ExecuteNonQuery();
        string dorsql4;
        dorsql4 = "INSERT INTO 混宿(宿舍编号,床号,班级编号) VALUES( '" + DropDownList9.SelectedValue + "','" + DropDownList10.SelectedValue + "','" + DropDownList11.SelectedValue + "')";
        SqlCommand dorup4 = new SqlCommand(dorsql4, con3);
        dorup4.ExecuteNonQuery();
        MsgBox("提交成功！");

        con3.Close();
    }
}

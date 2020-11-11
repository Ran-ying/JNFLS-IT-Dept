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


public partial class editrules : System.Web.UI.Page
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
        if (TextBox1.Text == "")
        {
            MsgBox("输入内容不能为空！");
        }
        else
        {

            string Lh1SQLConnectionString = ConfigurationManager.ConnectionStrings["Lh1SQLConnectionString"].ToString();
            SqlConnection con1 = new SqlConnection(Lh1SQLConnectionString);
            con1.Open();


            string rulsql1;
            rulsql1 = "INSERT INTO 扣分原因(部门,原因) VALUES( '" + DropDownList1.SelectedValue + "','" + TextBox1.Text + "')";
            SqlCommand rulins1 = new SqlCommand(rulsql1, con1);
            rulins1.ExecuteNonQuery();


            con1.Close();
            MsgBox("提交成功！");
        }

    }
protected void  Button2_Click(object sender, EventArgs e)
{

    string Lh1SQLConnectionString = ConfigurationManager.ConnectionStrings["Lh1SQLConnectionString"].ToString();
    SqlConnection con2 = new SqlConnection(Lh1SQLConnectionString);
    con2.Open();
    string rulsql2;
    rulsql2 = "DELETE FROM 扣分原因 WHERE ID LIKE '" + DropDownList3.SelectedValue +"'";
    SqlCommand rulde2 = new SqlCommand(rulsql2, con2);
    rulde2.ExecuteNonQuery();
    con2.Close();
    MsgBox("删除成功！");
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

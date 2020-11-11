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


public partial class editselfinf : System.Web.UI.Page
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
       

        Label1.Text = Session["usersname"].ToString()+"    ";

        Label15.Text = Session["名字"].ToString() + "    ";

        Label16.Text = Session["年级名"].ToString() + "    ";

        Label17.Text = Session["班级名"].ToString() + "    ";

        Label18.Text = Session["部门名"].ToString() + "    ";

        Label19.Text = Session["职务名"].ToString() + "    ";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == TextBox2.Text)
        {

            //========================MD5加密输入密码=========================
            MD5 md5 = MD5.Create();
            string password = "";
            byte[] bytes = md5.ComputeHash(Encoding.GetEncoding("GB2312").GetBytes(TextBox1.Text));
            for (int i = 0; i < bytes.Length; i++)
            {
                password = password + bytes[i].ToString();
            }
            //==========================加密结束========================

            string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
            SqlConnection con1 = new SqlConnection(Main1ConnectionString);
            con1.Open();
            string infsql1;
            infsql1 = "UPDATE 用户 SET 密码 = '"+password.ToString()+"' WHERE 用户名 LIKE  '" + Session["usersname"] + "'";
            SqlCommand infup1 = new SqlCommand(infsql1, con1);
            infup1.ExecuteNonQuery();
            con1.Close();

            MsgBox("重设成功！");
        }
        else
        {
            MsgBox("对不起！两次密码不一致！");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con2 = new SqlConnection(Main1ConnectionString);
        con2.Open();
        string infsql2;
        infsql2 = "UPDATE 用户 SET 名字 = '" + TextBox3.Text + "',班级='"+DropDownList2.SelectedValue+"',部门='"+DropDownList3.SelectedValue+"',用户组='"+DropDownList4.SelectedValue+"' WHERE 用户名 LIKE  '" + Session["usersname"] + "'";
        SqlCommand infup2 = new SqlCommand(infsql2, con2);
        infup2.ExecuteNonQuery();
        con2.Close();
        MsgBox("更新成功！");
    }
}

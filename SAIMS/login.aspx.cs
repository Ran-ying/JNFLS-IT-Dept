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

public partial class _Default : System.Web.UI.Page
{
    public static int logintime;
    public static string pwd;
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
        if (Session["login"] == "OK")
        {
            Session.Clear();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["usersname"] = TextBox1.Text;

        string Main1ConnectionString = "";

        Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(Main1ConnectionString);
        con1.Open();
        string logsql1;
        logsql1 = "SELECT 密码 FROM 用户 WHERE 用户名 LIKE '" + Session["usersname"] + "'";
        SqlCommand logins1 = new SqlCommand(logsql1, con1);
        SqlDataReader logda1 = logins1.ExecuteReader();

        if (logda1.Read())
        {
            pwd = logda1.GetString(0);
        }
        con1.Close();


        Session["sum"] = 0;//这个别删，在广播页面里有用
        Session["sum1"] = 0;//这个别删，在广播页面里有用
        Session["clubsum"] = 0;//这个别删，在社团页面里有用
        //管翻页的Session
        Session["第一次载入"] = 0;//这个别删，在量化页面里有用
        Session["qishiriqi"] = "";
        Session["jieshuriqi"] = "";
        Session["是宿管部Bool"] = false;
        Session["宿管输分方式"] = "待定";
        Session["批量原因"] = "";
        //========================MD5加密输入密码=========================
        MD5 md5 = MD5.Create();
        string password = "";
        string asddsa = "";
        byte[] sssss = Encoding.GetEncoding("GB2312").GetBytes("1");
        for (int i = 0; i < sssss.Length; i++)
        {
            asddsa = asddsa + sssss[i].ToString();
        }
        byte[] bytes = md5.ComputeHash(Encoding.GetEncoding("GB2312").GetBytes(TextBox2.Text));
        for (int i = 0; i < bytes.Length; i++)
        {
            password = password + bytes[i].ToString();
        }
        //==========================加密结束========================


        //=============================验证用户名与密码=====================
        if (pwd == "0")//数据库里的密码
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='../index.aspx';alert('该账号已被停用，请联系信息技术部成员！请务必遵守量化系统使用规则！');</script>");
            Response.Flush();
            Response.Clear();
            Response.Write(" <script language='javascript'+>location.reflesh();alert('输入成功~');</script>");
            Response.Flush();

        }
        if (password.ToString() == pwd)//数据库里的密码
        {
            Session["login"] = "OK";

            //=========加载各种用户数据===========
            Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
            SqlConnection con2 = new SqlConnection(Main1ConnectionString);
            con2.Open();
            string logsql2;
            logsql2 = "SELECT 名字,用户组,部门,班级 FROM 用户 WHERE 用户名 LIKE '" + Session["usersname"] + "'";
            SqlCommand logins2 = new SqlCommand(logsql2, con2);
            SqlDataReader logda2 = logins2.ExecuteReader();
            while (logda2.Read())
            {
                Session["名字"] = logda2.GetString(0);
                Session["职务"] = logda2.GetValue(1);
                Session["部门"] = logda2.GetValue(2);
                Session["班级"] = logda2.GetString(3);
            }
            logda2.Close();

            string logsql3;
            logsql3 = "UPDATE 用户 SET 登录时间 = getdate() WHERE 用户名 LIKE  '" + Session["usersname"] + "'";
            SqlCommand logup = new SqlCommand(logsql3, con2);
            logup.ExecuteNonQuery();
            con2.Close();


            //=====================记录登录==================
            string RecordSQLconnStr = ConfigurationManager.ConnectionStrings["RecordConnectionString"].ToString();
            SqlConnection con3 = new SqlConnection(RecordSQLconnStr);
            con3.Open();
            string logsql4;
            logsql4 = "INSERT INTO 登录记录(用户名,密码,用户组,IP,登录时间) VALUES( '" + Session["usersname"] + "','" + Session["pwd"] + "','" + Session["用户组"] + "','" + Request.UserHostAddress.ToString() + "',getdate())";
            SqlCommand logins = new SqlCommand(logsql4, con3);
            logins.ExecuteNonQuery();
            con3.Close();
            //=================================下面是登陆时弹出的框
            if (TextBox2.Text == "0")
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='../index.aspx';alert('请尽快更换密码，否则该账号有可能会在下次维护时被禁用！');</script>");
                Response.Flush();

            }
            Response.Clear();
            //Response.Write(" <script language='javascript'+>location='../index.aspx';alert('维护公告：\\r\\n由于线路调整，量化系统将在12月19日(周五)16:00-16:30进行维护，谢谢谅解！\\r\\n \\r\\nTips:部分UI已更换为圣诞节主题，记得刷新页面或者清除Cookie哦！');</script>");
            Response.Write(" <script language='javascript'+>location='../index.aspx';</script>");
            Response.Flush();
            Response.End();
            //Response.Redirect("index.aspx");


        }
        else
        {

            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../login.aspx';alert('错误的用户名或密码');</script>");
            Response.Flush();
            Response.End();
        }


        //======================各种具体用户信息=========================
        string MainConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con11 = new SqlConnection(MainConnectionString);
        con11.Open();

        string indsql1;
        indsql1 = "SELECT 组名 FROM 职务 WHERE ID LIKE '" + Session["职务"] + "'";
        SqlCommand indins1 = new SqlCommand(indsql1, con11);
        SqlDataReader indda1 = indins1.ExecuteReader();
        if (indda1.Read())
        {

            Session["职务名"] = indda1.GetValue(0);

        }
        indda1.Close();

        string indsql2;
        indsql2 = "SELECT 部门名 FROM 部门 WHERE 部门代号 LIKE '" + Session["部门"] + "'";
        SqlCommand indins2 = new SqlCommand(indsql2, con11);
        SqlDataReader indda2 = indins2.ExecuteReader();
        if (indda2.Read())
        {

            Session["部门名"] = indda2.GetValue(0);

        }
        indda2.Close();

        string indsql3;
        indsql3 = "SELECT 班级,年级 FROM 班级 WHERE 编号 LIKE '" + Session["班级"] + "'";
        SqlCommand indins3 = new SqlCommand(indsql3, con11);
        SqlDataReader indda3 = indins3.ExecuteReader();
        while (indda3.Read())
        {

            Session["班级名"] = indda3.GetValue(0);
            Session["年级ID"] = indda3.GetValue(1);

        }
        indda3.Close();

        string indsql4;
        indsql4 = "SELECT 年级 FROM 年级 WHERE ID LIKE '" + Session["年级ID"] + "'";
        SqlCommand indins4 = new SqlCommand(indsql4, con11);
        SqlDataReader indda4 = indins4.ExecuteReader();
        if (indda4.Read())
        {

            Session["年级名"] = indda4.GetValue(0);

        }
        indda4.Close();
        con11.Close();




    }


    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        
        Response.Clear();
        Response.Write("<script language=JavaScript>window.open('http://bcs.duapp.com/data2014/“清除校园垃圾，提倡文明用语”活动方案2015年4月13日.doc' ,'_blank','');</script>");
        Response.Flush();
        Response.End();
        Response.Clear();
        Response.Write(" <script language='javascript'+>location='../login.aspx';</script>");

        //Response.Write("<script language=\"javascript\">window.open ('../login.aspx','newwindow','height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no') ;</script>");
        Response.Flush();
        Response.End();
    }
}

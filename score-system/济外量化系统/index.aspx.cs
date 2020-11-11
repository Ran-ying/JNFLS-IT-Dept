using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace 济外量化系统
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                //测试数据库连接
                try
                {
                    Session["1"] = "1";
                    Session.Clear();
                    con.Open();

                    //版本
                    string sql = "select top 1 * from 更新表 order by id desc";
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlDataReader indda1 = com.ExecuteReader();
                    if (indda1.Read())
                    {
                        banben.Text = indda1.GetString(1);
                    }
                    con.Close();
                    //输出Log
                    string scriptstrs = @"<script>console.log('济南外国语学校量化管理系统\r\n济南外国语学校2017级信息技术部贾宝琰制作');</script>";
                    if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                    }
                }
                catch
                {
                    Response.Redirect("ERROR.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*
             
             
		    //jquery的网页加载完成回调函数
		    $(function () {
		        //把层定义为一个进度条，并进行配置
		        $("#my_progressbar").progressbar({
		            value: 0//百分之75的进度
		        });
		    });
             
             */
            try
            {
                con.Open();
                try
                {
                    int 编码 = int.Parse(TextBox1.Text.ToString());
                    string sql = "SELECT * FROM 用户 WHERE 编码 = @username and 密码 = @password";
                    SqlCommand com = new SqlCommand(sql, con);
                    com.Parameters.Add(new SqlParameter("username", TextBox1.Text.ToString()));
                    com.Parameters.Add(new SqlParameter("password", TextBox2.Text.ToString()));
                    SqlDataReader read = com.ExecuteReader();
                    while (read.Read())
                    {
                        Session["身份"] = read.GetString(3);
                        Session["区域"] = read.GetString(4);
                        Session["年级"] = read.GetInt32(5);
                        string 跳转 = read.GetString(6);
                        Session["姓名"] = read.GetString(7);
                        read.Close();
                        con.Close();
                        System.Threading.Thread.Sleep(2000);
                        Response.Redirect(跳转);
                    }
                }
                catch
                {
                    string sql = "SELECT * FROM 用户 WHERE 姓名 = @username and 密码 = @password";
                    SqlCommand com = new SqlCommand(sql, con);
                    com.Parameters.Add(new SqlParameter("username", TextBox1.Text.ToString()));
                    com.Parameters.Add(new SqlParameter("password", TextBox2.Text.ToString()));
                    SqlDataReader read = com.ExecuteReader();
                    while (read.Read())
                    {
                        Session["身份"] = read.GetString(3);
                        Session["区域"] = read.GetString(4);
                        Session["年级"] = read.GetInt32(5);
                        string 跳转 = read.GetString(6);
                        Session["姓名"] = read.GetString(7);
                        read.Close();
                        con.Close();
                        System.Threading.Thread.Sleep(2000);
                        Response.Redirect(跳转);
                    }
                }
                finally
                {
                    con.Close();
                    throw new Exception();
                }
            }
            catch
            {
                string scriptstrs = "<script>alert('账号或密码错误！');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("xiugaimima.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string scriptstrs = "<script>alert('您的电脑记不住密码！请更换电脑！');</script>";
            if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string scriptstrs = "<script>alert('联系信息技术部！');</script>";
            if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
            }
        }
    }
}
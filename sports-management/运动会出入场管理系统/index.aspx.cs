using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace 运动会出入场管理系统
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                    SqlConnection con = new SqlConnection(ConnectionString);
                    con.Open();
                    con.Close();
                    Random i = new Random();
                    int p = i.Next(1000, 5000);
                    Label1.Text = "检验环境中，请等待" + p / 1000 + "秒";
                    Timer1.Interval = p;
                }
                catch
                {
                    Response.Redirect("FALSE.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int number = int.Parse(this.number.Text);
                string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlConnection con = new SqlConnection(ConnectionString);
                con.Open();
                string sql11;
                sql11 = "SELECT * FROM 登录 WHERE 卡号 = @num";
                SqlCommand com11 = new SqlCommand(sql11, con);
                SqlParameter num11 = new SqlParameter("num", number);
                com11.Parameters.Add(num11);
                SqlDataReader indda1 = com11.ExecuteReader();
                if (indda1.Read())
                {
                    Session["身份"] = indda1.GetString(3);
                    Response.Redirect(indda1.GetString(2));
                }
                else
                {
                    throw new Exception();
                }
                con.Close();
            }
            catch
            {
                this.number.Text = "";
                Label1.Text = "密钥错误，请重新输入。";
            }
            finally
            {
                this.number.Text = "";
                Label1.Text = "密钥错误，请重新输入。";
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            this.Label1.Text = "检验成功，输入您的密钥";
            this.number.Visible = true;
            this.Button1.Visible = true;
            this.Timer1.Enabled = false;
            this.number.Focus();
        }
    }
}
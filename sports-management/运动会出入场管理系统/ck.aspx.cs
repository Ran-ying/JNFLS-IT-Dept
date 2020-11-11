using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace 运动会出入场管理系统
{
    public partial class ydyc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() == "出口")
                    {
                        string scriptstrs = "<script>alert('您好，出口管理者！');</script>";
                        if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                        }
                    }
                }
                catch
                {
                    Response.Redirect("index.aspx");
                }
            }
            this.number.Focus();
        }

        string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Button1_Click(object sender, EventArgs e)
        {
            string banji = null;
            try
            {
                try
                {
                    SqlConnection con = new SqlConnection(ConnectionString);
                    con.Open();
                    int number = int.Parse(this.number.Text);
                    //string sql;
                    string bianhao = null;//编号
                    string sql11;//根据卡号得到编号
                    sql11 = "SELECT * FROM 运动员卡号信息 WHERE 运动员卡号 = @num";
                    SqlCommand com11 = new SqlCommand(sql11, con);
                    SqlParameter num11 = new SqlParameter("num", number);
                    com11.Parameters.Add(num11);
                    SqlDataReader indda1 = com11.ExecuteReader();
                    if (indda1.Read())
                    {
                        bianhao = indda1.GetString(2);
                        Label2.Text = "运动员";
                        Label3.Text = "运动员姓名：" + indda1.GetString(3) + "<br/>运动员班级：" + indda1.GetString(4);//"运动员姓名：" +
                        Label4.Text = indda1.GetString(2).ToString();
                        banji = indda1.GetString(4);
                    }
                    else
                    {
                        con.Close();
                        throw new Exception();
                    }
                    indda1.Close();
                    //根据编号得到项目、得到时间
                    string sql13;
                    bool tr = false;
                    sql13 = "SELECT * FROM 项目 WHERE 项目 in (SELECT 项目 FROM 运动员项目信息 WHERE 编号 = @num )";
                    SqlCommand com13 = new SqlCommand(sql13, con);
                    SqlParameter num13 = new SqlParameter("num", bianhao);
                    com13.Parameters.Add(num13);
                    SqlDataReader indda13 = com13.ExecuteReader();
                    while (indda13.Read())
                    {
                        try
                        {
                            //当前时间进行判断
                            DateTime kscm = indda13.GetDateTime(2);//开始出门
                            DateTime jscm = indda13.GetDateTime(3);//结束出门
                            if (DateTime.Now > kscm && DateTime.Now < jscm)
                            {
                                tr = true;
                            }
                        }
                        catch
                        {
                        }
                    }
                    indda13.Close();
                    if (tr == false)
                    {
                        trf.Text = "<img src='false.bmp' /><br />未到时间！<br />禁止出门！";
                    }
                    else
                    {
                        string sql23;
                        int kfkh = 0;//扣分卡号
                        sql23 = "SELECT * FROM 运动员出 WHERE 卡号 = @num";
                        SqlCommand com = new SqlCommand(sql23, con);
                        SqlParameter num = new SqlParameter("num", number);
                        com.Parameters.Add(num);
                        SqlDataReader indda5 = com.ExecuteReader();
                        if (indda5.Read())
                        {
                            kfkh = number;
                        }
                        indda5.Close();

                        if (kfkh == 0)//不扣分
                        {
                            string sql14 = "insert into 运动员出(卡号,出门时间) values('" + number + "','" + DateTime.Now + "')";
                            SqlCommand com14 = new SqlCommand(sql14, con);
                            com14.ExecuteNonQuery();
                            trf.Text = "<img src='true.bmp' /><br />无异常！请进！";
                        }
                        else//扣分
                        {
                            string sql1 = "insert into 运动员扣分汇总(卡号,备注,编号,班级) values('" + number + "',N'多次出门','" + bianhao + "','" + banji + "')";
                            SqlCommand com1 = new SqlCommand(sql1, con);
                            com1.ExecuteNonQuery();
                            trf.Text = "<img src='false.bmp' /><br />禁止出门！<br />您已被记录！";
                        }
                    }
                    this.number.Text = "";
                    con.Close();
                }
                catch
                {
                    SqlConnection con = new SqlConnection(ConnectionString);
                    con.Open();

                    int number = int.Parse(this.number.Text);
                    string sql;
                    int kfkh = 0;//扣分卡号
                    string sql11;
                    sql11 = "SELECT * FROM 班级卡号信息 WHERE 卡号 = @num";
                    SqlCommand com111 = new SqlCommand(sql11, con);
                    SqlParameter num111 = new SqlParameter("num", number);
                    com111.Parameters.Add(num111);
                    SqlDataReader indda51 = com111.ExecuteReader();
                    if (indda51.Read())
                    {
                        Label3.Text = indda51.GetString(2);
                    }
                    else
                    {
                        con.Close();
                        throw new Exception();
                    }
                    indda51.Close();
                    Label2.Text = "班级";
                    Label4.Text = null;
                    sql = "SELECT * FROM 班级出 WHERE 卡号 = @num";
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlParameter num = new SqlParameter("num", number);
                    com.Parameters.Add(num);
                    SqlDataReader indda5 = com.ExecuteReader();
                    if (indda5.Read())
                    {
                        kfkh = number;
                    }
                    indda5.Close();

                    if (kfkh == 0)//不扣分
                    {
                        string sql1 = "insert into 班级出(卡号,出门时间) values('" + number + "','" + DateTime.Now + "')";
                        SqlCommand com1 = new SqlCommand(sql1, con);
                        com1.ExecuteNonQuery();
                        trf.Text = "<img src='true.bmp' /><br />无异常！请出！";
                    }
                    else//扣分
                    {
                        string sql1 = "insert into 班级扣分汇总(卡号,备注,班级) values('" + number + "',N'多次出门','" + Label3.Text + "')";
                        SqlCommand com1 = new SqlCommand(sql1, con);
                        com1.ExecuteNonQuery();
                        trf.Text = "<img src='false.bmp' /><br />禁止出门！<br />您已被记录！";
                    }
                    this.number.Text = "";
                    con.Close();
                }
            }
            catch
            {
                Label2.Text = "错误请重刷！";
                Label3.Text = "错误请重刷！";
                Label4.Text = "错误请重刷！";
                trf.Text = "<img src='false.bmp' /><br />错误请重刷！";
                this.number.Text = "";
            }
        }
    }
}
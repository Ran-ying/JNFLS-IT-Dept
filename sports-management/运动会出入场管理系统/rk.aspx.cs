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
    public partial class ydyr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() == "入口")
                    {
                        string scriptstrs = "<script>alert('您好，入口管理者！');</script>";
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
                    string sql;
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
                        Label4.Text = indda1.GetString(2).ToString();//运动员编号
                        banji = indda1.GetString(4);
                    }
                    else
                    {
                        con.Close();
                        throw new Exception();
                    }
                    indda1.Close();
                    DateTime time = new DateTime();
                    int scsj = 0;
                    sql = "SELECT * FROM 运动员出 WHERE 卡号 = @num";
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlParameter num = new SqlParameter("num", number);
                    com.Parameters.Add(num);
                    SqlDataReader indda5 = com.ExecuteReader();
                    if (indda5.Read())
                    {
                        time = indda5.GetDateTime(2);
                        scsj = number;
                    }
                    indda5.Close();
                    DateTime t = time.AddHours(1);//标准间隔时间
                    if (scsj != 0)//有出门记录不扣分,删除数据
                    {
                        if (DateTime.Now > t)//判断时间,扣分
                        {
                            string sql1 = "insert into 运动员扣分汇总(卡号,备注,班级,编号) values('" + number + "',N'出门时间过长','" + banji + "','" + bianhao + "')";
                            SqlCommand com1 = new SqlCommand(sql1, con);
                            com1.ExecuteNonQuery();
                            string sql2 = "delete from 运动员出 where 卡号='" + number + "'";
                            SqlCommand com2 = new SqlCommand(sql2, con);
                            com2.ExecuteNonQuery();
                            trf.Text = "<img src='false.bmp' /><br />出门时间过长！<br />您已被记录！";
                        }
                        else//不扣分
                        {
                            string sql1 = "delete from 运动员出 where 卡号='" + number + "'";
                            SqlCommand com1 = new SqlCommand(sql1, con);
                            com1.ExecuteNonQuery();
                            trf.Text = "<img src='true.bmp' /><br />无异常！请进！";
                        }
                    }
                    else//扣分
                    {
                        string sql1 = "insert into 运动员扣分汇总(卡号,备注,编号,班级) values('" + number + "',N'多次入门','" + bianhao + "','" + banji + "')";
                        SqlCommand com1 = new SqlCommand(sql1, con);
                        com1.ExecuteNonQuery();
                        string sql2 = "delete from 运动员出 where 卡号='" + number + "'";
                        SqlCommand com2 = new SqlCommand(sql2, con);
                        com2.ExecuteNonQuery();
                        trf.Text = "<img src='false.bmp' /><br />没有出门记录！<br />您已被记录！";
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
                    int scsj = 0;//删除数据
                    DateTime time = new DateTime();//出门时间
                    string bj = "";
                    string sql11;
                    sql11 = "SELECT * FROM 班级卡号信息 WHERE 卡号 = @num";
                    SqlCommand com111 = new SqlCommand(sql11, con);
                    SqlParameter num111 = new SqlParameter("num", number);
                    com111.Parameters.Add(num111);
                    SqlDataReader indda51 = com111.ExecuteReader();
                    if (indda51.Read())
                    {
                        Label3.Text = indda51.GetString(2);
                        bj = indda51.GetString(2);
                    }
                    else
                    {
                        con.Close();
                        throw new Exception();
                    }
                    indda51.Close();
                    Label2.Text = "班级";
                    sql = "SELECT * FROM 班级出 WHERE 卡号 = @num";
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlParameter num = new SqlParameter("num", number);
                    com.Parameters.Add(num);
                    SqlDataReader indda5 = com.ExecuteReader();
                    if (indda5.Read())
                    {
                        time = indda5.GetDateTime(2);
                        scsj = number;
                    }
                    indda5.Close();
                    DateTime t = time.AddMinutes(30);//标准间隔时间
                    if (scsj != 0)//有出门记录不扣分,删除数据
                    {

                        if (DateTime.Now > t)//判断时间,扣分
                        {
                            string sql1 = "insert into 班级扣分汇总(卡号,备注,班级) values('" + number + "',N'出门时间过长','" + Label3.Text + "')";
                            SqlCommand com1 = new SqlCommand(sql1, con);
                            com1.ExecuteNonQuery();
                            string sql2 = "delete from 班级出 where 卡号='" + number + "'";
                            SqlCommand com2 = new SqlCommand(sql2, con);
                            com2.ExecuteNonQuery();
                            trf.Text = "<img src='false.bmp' /><br />出门时间过长！<br />您已被记录！";
                        }
                        else//不扣分
                        {
                            string sql1 = "delete from 班级出 where 卡号='" + number + "'";
                            SqlCommand com1 = new SqlCommand(sql1, con);
                            com1.ExecuteNonQuery();
                            trf.Text = "<img src='true.bmp' /><br />无异常！请进！";
                        }
                    }
                    else//无出门记录扣分
                    {
                        string sql1 = "insert into 班级扣分汇总(卡号,备注,班级) values('" + number + "',N'多次入门','" + Label3.Text + "')";
                        SqlCommand com1 = new SqlCommand(sql1, con);
                        com1.ExecuteNonQuery();
                        string sql2 = "delete from 班级出 where 卡号='" + number + "'";
                        SqlCommand com2 = new SqlCommand(sql2, con);
                        com2.ExecuteNonQuery();
                        trf.Text = "<img src='false.bmp' /><br />没有出门记录！<br />您已被记录！";
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
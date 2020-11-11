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
    public partial class checkfs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() == "赋分查询")
                    {
                        string scriptstrs = "<script>alert('您好，赋分查询管理者！');</script>";
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
            jlxm.SelectCommand = "SELECT [项目] FROM [项目] where 出门开始时间 < '" + DateTime.Now + "' and 出门结束时间 > '" + DateTime.Now + "'";
        }

        string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Text = "您好，请刷卡。";
            try
            {
                int number = int.Parse(this.number.Text);
                this.number.Text = "";
                try
                {
                    SqlConnection con = new SqlConnection(ConnectionString);
                    con.Open();
                    string sql11 = "SELECT * FROM 运动员卡号信息 WHERE 运动员卡号 = @num";
                    SqlCommand com11 = new SqlCommand(sql11, con);
                    SqlParameter num11 = new SqlParameter("num", number);
                    com11.Parameters.Add(num11);
                    SqlDataReader indda1 = com11.ExecuteReader();
                    if (indda1.Read())
                    {
                        indda1.Close();
                        ydyinfo.SelectCommand = "SELECT 运动员卡号信息.编号, 运动员卡号信息.姓名, 运动员卡号信息.班级, 运动员项目信息.项目 FROM 运动员卡号信息,运动员项目信息 WHERE 运动员卡号信息.编号 = 运动员项目信息.编号 AND 运动员卡号信息.运动员卡号 = '" + number + "'";
                        ydykf.SelectCommand = "SELECT [id], [卡号], [编号], [备注], [班级] FROM [运动员扣分汇总] WHERE 卡号 = '" + number + "'";
                        bjinfo.SelectCommand = "";
                        bjkf.SelectCommand = "";
                    }
                    else
                    {
                        con.Close();
                        throw new Exception();
                    }
                }
                catch
                {
                    SqlConnection con = new SqlConnection(ConnectionString);
                    con.Open();
                    string sql11 = "SELECT * FROM 班级卡号信息 WHERE 卡号 = @num";
                    SqlCommand com111 = new SqlCommand(sql11, con);
                    SqlParameter num111 = new SqlParameter("num", number);
                    com111.Parameters.Add(num111);
                    SqlDataReader indda51 = com111.ExecuteReader();
                    if (indda51.Read())
                    {
                        indda51.Close();
                        ydyinfo.SelectCommand = "";
                        ydykf.SelectCommand = "";
                        bjinfo.SelectCommand = "SELECT [班级] FROM [班级卡号信息] WHERE 卡号 = '" + number + "'";
                        bjkf.SelectCommand = "SELECT [备注], [班级], [卡号], [id] FROM [班级扣分汇总] WHERE 卡号 = '" + number + "'";
                    }
                    else
                    {
                        con.Close();
                        throw new Exception();
                    }
                }
            }
            catch
            {
                ydyinfo.SelectCommand = "";
                ydykf.SelectCommand = "";
                bjinfo.SelectCommand = "";
                bjkf.SelectCommand = "";
                Label2.Text = "再刷一次。";
            }
            finally
            {
                GridView1.DataBind();
                GridView2.DataBind();
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }
    }
}
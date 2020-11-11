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
    public partial class ydyjl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() == "运动员检录")
                    {
                        string scriptstrs = "<script>alert('您好，运动员检录管理者！');</script>";
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
            if (IsPostBack)
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlConnection con = new SqlConnection(ConnectionString);
                con.Open();
                string sql13 = "SELECT * FROM 项目 WHERE 项目 = '" + DropDownList1.SelectedValue + "'";
                SqlCommand com13 = new SqlCommand(sql13, con);
                SqlDataReader indda13 = com13.ExecuteReader();
                if (indda13.Read())
                {
                    try
                    {
                        //当前时间进行判断
                        DateTime kscm = indda13.GetDateTime(2);//开始出门
                        DateTime jscm = indda13.GetDateTime(3);//结束出门
                        if (DateTime.Now > kscm && DateTime.Now < jscm)
                        {
                            Label1.Text = "正在检录！";
                        }
                        else
                        {
                            Label1.Text = "未检录或检录结束！";
                        }
                    }
                    catch
                    {
                        Label1.Text = "未检录或检录结束！";
                    }
                }
                else
                {
                    Label1.Text = "服务器未连接或无此项目！";
                }
                indda13.Close();
                con.Close();
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //开始项目
            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlConnection con = new SqlConnection(ConnectionString);
                con.Open();
                {
                    string sql1 = "update 项目 set 出门开始时间='" + DateTime.Now + "',出门结束时间='" + DateTime.Now.AddHours(1) + "' where 项目='" + DropDownList1.SelectedValue + "'";
                    SqlCommand com1 = new SqlCommand(sql1, con);
                    com1.ExecuteNonQuery();
                    string sql2 = "update 运动员出 set 出门时间 = '" + DateTime.Now + "' where 卡号 in (select 运动员卡号 from 运动员卡号信息 where 编号 in (select 编号 from 运动员项目信息 where 项目 = '"+DropDownList1.SelectedValue+"'))";//嵌套语句
                    SqlCommand com2 = new SqlCommand(sql2, con);
                    com2.ExecuteNonQuery();
                    string sql13 = "SELECT * FROM 项目 WHERE 项目 = '" + DropDownList1.SelectedValue + "'";
                    SqlCommand com13 = new SqlCommand(sql13, con);
                    SqlDataReader indda13 = com13.ExecuteReader();
                    if (indda13.Read())
                    {
                        try
                        {
                            //当前时间进行判断
                            DateTime kscm = indda13.GetDateTime(2);//开始出门
                            DateTime jscm = indda13.GetDateTime(3);//结束出门
                            if (DateTime.Now > kscm && DateTime.Now < jscm)
                            {
                                Label1.Text = "正在检录！";
                            }
                            else
                            {
                                Label1.Text = "未检录或检录结束！";
                            }
                        }
                        catch
                        {
                            Label1.Text = "未检录或检录结束！";
                        }
                    }
                    else
                    {
                        Label1.Text = "服务器未连接或无此项目！";
                    }
                    indda13.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                string scriptstrs = "<script>alert('错误！');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //结束项目
            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlConnection con = new SqlConnection(ConnectionString);
                con.Open();
                {
                    string sql1 = "update 项目 set 出门结束时间='" + DateTime.Now + "' where 项目 ='" + DropDownList1.SelectedValue + "'";
                    SqlCommand com1 = new SqlCommand(sql1, con);
                    com1.ExecuteNonQuery();
                    string sql13 = "SELECT * FROM 项目 WHERE 项目 = '" + DropDownList1.SelectedValue + "'";
                    SqlCommand com13 = new SqlCommand(sql13, con);
                    SqlDataReader indda13 = com13.ExecuteReader();
                    if (indda13.Read())
                    {
                        try
                        {
                            //当前时间进行判断
                            DateTime kscm = indda13.GetDateTime(2);//开始出门
                            DateTime jscm = indda13.GetDateTime(3);//结束出门
                            if (DateTime.Now > kscm && DateTime.Now < jscm)
                            {
                                Label1.Text = "正在检录！";
                            }
                            else
                            {
                                Label1.Text = "未检录或检录结束！";
                            }
                        }
                        catch
                        {
                            Label1.Text = "未检录或检录结束！";
                        }
                    }
                    else
                    {
                        Label1.Text = "服务器未连接或无此项目！";
                    }
                    indda13.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                string scriptstrs = "<script>alert('错误！');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
            }
        }
    }
}
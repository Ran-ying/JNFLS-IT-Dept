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
    public partial class gfzjc : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() != "改分政教处")
                    {
                        throw new Exception();
                    }
                    else
                    {
                        Label1.Text = "您好，" + Session["区域"].ToString() + Session["姓名"].ToString() + "领导";
                    }
                }
                catch
                {
                    Response.Redirect("index.aspx");
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql1 = "update 扣分 set 审核中='政教处审核通过，此分无效！' where id ='" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com1 = new SqlCommand(sql1, con);
                com1.ExecuteNonQuery();
                string sql2 = "update 申诉表 set 政教处审核='政教处审核通过，此分无效！' where 申诉id ='" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com2 = new SqlCommand(sql2, con);
                com2.ExecuteNonQuery();
                string sql3 = "update 扣分 set 有效 = '666' where id ='" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.ExecuteNonQuery();
                con.Close();
                SqlDataSource1.SelectCommand = "SELECT * FROM [扣分] where id in (select 申诉id from 申诉表 where 政教处审核 IS NULL  and 学生会审核 = '学生会审核通过,等待政教处审核' and 申诉时间 >= '" + DateTime.Now.AddDays(-15) + "' and 申诉时间 <= '" + DateTime.Now + "')";
                SqlDataSource1.DataBind();
                GridView1.DataBind();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM [扣分] where id in (select 申诉id from 申诉表 where 政教处审核 IS NULL  and 学生会审核 = '学生会审核通过,等待政教处审核' and 申诉时间 >= '" + DateTime.Now.AddDays(-15) + "' and 申诉时间 <= '" + DateTime.Now + "')";
                SqlDataSource1.DataBind();
                GridView1.DataBind();
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql3 = "delete from 用户 where 身份 = '信息技术部' and 年级 = @nianji";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("nianji", int.Parse(DropDownList1.SelectedValue)));
                com3.ExecuteNonQuery();
                con.Close();
                DropDownList1.DataBind();
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
            try
            {
                con.Open();
                string sql3 = "insert into 用户(编码,密码,身份,区域,年级,跳转,姓名) values(@编码,@密码,@身份,@区域,@年级,@跳转,@姓名)";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("编码", int.Parse(TextBox1.Text.ToString()) + "000000"));
                com3.Parameters.Add(new SqlParameter("密码", "0"));
                com3.Parameters.Add(new SqlParameter("身份", "信息技术部"));
                com3.Parameters.Add(new SqlParameter("区域", "信息技术部"));
                com3.Parameters.Add(new SqlParameter("年级", int.Parse(TextBox1.Text)));
                com3.Parameters.Add(new SqlParameter("跳转", "xxjsb.aspx"));
                com3.Parameters.Add(new SqlParameter("姓名", "信息技术部"));
                com3.ExecuteNonQuery();
                con.Close();
                DropDownList1.DataBind();
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql3 = "delete from 宿舍楼 where id = @nianji";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("nianji", GridView2.SelectedDataKey.Values["id"].ToString()));
                com3.ExecuteNonQuery();
                con.Close();
                GridView2.DataBind();
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

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql3 = "insert into 宿舍楼(部门,年级,楼号) values(@部门,@年级,@楼号)";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("部门", TextBox2.Text));
                com3.Parameters.Add(new SqlParameter("年级", TextBox3.Text));
                com3.Parameters.Add(new SqlParameter("楼号", TextBox4.Text));
                com3.ExecuteNonQuery();
                con.Close();
                GridView2.DataBind();
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

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (Panel1.Visible == false)
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (Panel2.Visible == false)
            {
                Panel2.Visible = true;
            }
            else
            {
                Panel2.Visible = false;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            /*
            if (Panel3.Visible == false)
            {
                Panel3.Visible = true;
            }
            else
            {
                Panel3.Visible = false;
            }
             */
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            string scriptstrs = "<script>alert('清理成功！');</script>";
            if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
            }
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            string scriptstrs = "<script>alert('信息技术部不接受BUG！');</script>";
            if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
            }
        }
    }
}
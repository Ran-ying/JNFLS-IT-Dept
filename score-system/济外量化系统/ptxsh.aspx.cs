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
    public partial class ptxsh : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() != "普通学生会")
                    {
                        throw new Exception();
                    }
                    else
                    {
                        Label1.Text = "您好，" + Session["年级"].ToString() + "的学生会" + Session["区域"].ToString() + Session["姓名"].ToString() + "同学";
                        SqlDataSource1.SelectCommand = "SELECT * FROM 扣分原因表 where 年级 = '" + Session["年级"].ToString() + "' and 部门 = '" + Session["区域"].ToString() + "' order by id";
                        SqlDataSource1.DataBind();
                        DropDownList1.DataBind();
                        ListBox1.DataBind();
                        SqlDataSource2.SelectCommand = "SELECT 区域 FROM [区域编号表] WHERE 区域 in (select 区域 from 用户 where 身份 = '班主任' and 年级 = '" + Session["年级"].ToString() + "') and ( 区域 like '%0%' or 区域 like '%1%' )  order by id";
                        SqlDataSource2.DataBind();
                        ListBox2.DataBind();
                    }
                }
                catch
                {
                    Response.Redirect("index.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql1 = "insert into 扣分原因表(年级,部门,原因) values('" + Session["年级"].ToString() + "',N'" + Session["区域"].ToString() + "',@yuanyin)";
                SqlCommand com1 = new SqlCommand(sql1, con);
                com1.Parameters.Add(new SqlParameter("yuanyin", TextBox1.Text));
                com1.ExecuteNonQuery();
                con.Close();
                SqlDataSource1.SelectCommand = "SELECT * FROM 扣分原因表 where 年级 = '" + Session["年级"].ToString() + "' and 部门 = '" + Session["区域"].ToString() + "'";
                SqlDataSource1.DataBind();
                DropDownList1.DataBind();
                ListBox1.DataBind();
            }
            catch(Exception ex)
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
                string sql1 = "delete from 扣分原因表 where 年级 = '" + Session["年级"].ToString() + "' and 部门 = '" + Session["区域"].ToString() + "' and 原因 = @yuanyin";
                SqlCommand com1 = new SqlCommand(sql1, con);
                com1.Parameters.Add(new SqlParameter("yuanyin", DropDownList1.SelectedValue));
                com1.ExecuteNonQuery();
                con.Close();
                SqlDataSource1.SelectCommand = "SELECT * FROM 扣分原因表 where 年级 = '" + Session["年级"].ToString() + "' and 部门 = '" + Session["区域"].ToString() + "'";
                SqlDataSource1.DataBind();
                DropDownList1.DataBind();
                ListBox1.DataBind();
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
            if (DateTime.Now <= DateTime.Parse("2019-07-06 19:00:00"))
            {
                try
                {
                    con.Open();
                    try
                    {
                        try
                        {
                            float kf = float.Parse(TextBox4.Text);

                            string sj = int.Parse(TextBox2.Text.ToString().Substring(0, 4)) + "/" + int.Parse(TextBox2.Text.ToString().Substring(4, 2)) + "/" + int.Parse(TextBox2.Text.ToString().Substring(6, 2));
                            try
                            {
                                for (int n = 0; n < ListBox2.Items.Count; n++)//班级
                                {
                                    if (ListBox2.Items[n].Selected)
                                    {
                                        for (int p = 0; p < ListBox1.Items.Count; p++)//原因
                                        {
                                            if (ListBox1.Items[p].Selected)
                                            {
                                                try
                                                {
                                                    if (kf != 0)
                                                    {
                                                        string bj = ListBox2.Items[n].ToString();
                                                        DateTime time = DateTime.Parse(sj);
                                                        string sql1 = "insert into 扣分(年级,班级,扣分部门,扣分时间,备注,有效,扣分人姓名,扣分,扣分原因) values('" + Session["年级"].ToString() + "',N'" + bj + "',N'" + Session["区域"].ToString() + "','" + time + "',@beizhu,'0',N'" + Session["姓名"].ToString() + "','" + kf + "','" + ListBox1.Items[p] + "')";
                                                        SqlCommand com1 = new SqlCommand(sql1, con);
                                                        com1.Parameters.Add(new SqlParameter("beizhu", TextBox5.Text));
                                                        com1.ExecuteNonQuery();
                                                    }
                                                }
                                                catch
                                                {
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            catch
                            {
                            }

                            string scriptstrs = "<script>alert('输入成功！');</script>";
                            if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                            }
                        }
                        catch
                        {
                            float[,] str = new float[ListBox2.Items.Count, ListBox1.Items.Count];
                            string[] yiwei = TextBox4.Text.ToString().Split(new char[] { ' ' });
                            int jishu = 0;
                            for (int n = 0; n < ListBox2.Items.Count; n++)//班级
                            {
                                if (ListBox2.Items[n].Selected)
                                {
                                    for (int p = 0; p < ListBox1.Items.Count; p++)//原因
                                    {

                                        if (ListBox1.Items[p].Selected)
                                        {
                                            try
                                            {
                                                str[n, p] = float.Parse(yiwei[jishu]);
                                                jishu++;
                                            }
                                            catch
                                            {
                                                throw new Exception();
                                            }
                                        }
                                    }
                                }
                            }


                            string sj = int.Parse(TextBox2.Text.ToString().Substring(0, 4)) + "/" + int.Parse(TextBox2.Text.ToString().Substring(4, 2)) + "/" + int.Parse(TextBox2.Text.ToString().Substring(6, 2));
                            for (int n = 0; n < ListBox2.Items.Count; n++)//班级
                            {
                                if (ListBox2.Items[n].Selected)
                                {
                                    for (int p = 0; p < ListBox1.Items.Count; p++)//原因
                                    {
                                        if (ListBox1.Items[p].Selected)
                                        {
                                            try
                                            {
                                                if (str[n, p] != 0)
                                                {
                                                    string bj = ListBox2.Items[n].ToString();
                                                    DateTime time = DateTime.Parse(sj);
                                                    string sql1 = "insert into 扣分(年级,班级,扣分部门,扣分时间,备注,有效,扣分人姓名,扣分,扣分原因) values('" + Session["年级"].ToString() + "',N'" + bj + "',N'" + Session["区域"].ToString() + "','" + time + "',@beizhu,'0',N'" + Session["姓名"].ToString() + "','" + str[n, p] + "','" + ListBox1.Items[p] + "')";
                                                    SqlCommand com1 = new SqlCommand(sql1, con);
                                                    com1.Parameters.Add(new SqlParameter("beizhu", TextBox5.Text));
                                                    com1.ExecuteNonQuery();
                                                }
                                            }
                                            catch
                                            {
                                            }
                                        }
                                    }
                                }
                            }

                            string scriptstrs = "<script>alert('输入成功！');</script>";
                            if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                            }
                        }
                    }
                    catch
                    {
                        string scriptstrs = "<script>alert('错误！检查扣分文本框输入、时间文本框输入！');</script>";
                        if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                        }
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
            else
            {
                string scriptstrs = "<script>alert('暂停输分！');</script>";
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
                SqlDataSource4.SelectCommand = "SELECT [id], [年级], [班级], [扣分部门], [扣分时间], [备注], [有效], [审核中], [扣分人姓名], [宿舍编号], [床号], [扣分], [扣分原因] FROM [扣分] where id in (select 申诉id from 申诉表 where 申诉时间>='" + DateTime.Now.AddDays(-15) + "' and 申诉表.申诉时间<='" + DateTime.Now + "' and 审核中 = '正在审核') and 年级='" + Session["年级"].ToString() + "' and 扣分部门 ='" + Session["区域"].ToString() + "'";
                SqlDataSource4.DataBind();
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql1 = "update 扣分 set 审核中='审核通过，此分无效！' where id ='" + int.Parse(GridView2.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com1 = new SqlCommand(sql1, con);
                com1.ExecuteNonQuery();
                string sql2 = "update 申诉表 set 学生会审核='学生会审核通过,等待政教处审核' where 申诉id ='" + int.Parse(GridView2.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com2 = new SqlCommand(sql2, con);
                com2.ExecuteNonQuery();
                string sql3 = "update 扣分 set 有效 = '666' where id ='" + int.Parse(GridView2.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.ExecuteNonQuery();
                string sql4 = "update 申诉表 set 政教处审核='信息部审核通过，此分无效！' where 申诉id ='" + int.Parse(GridView2.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com4 = new SqlCommand(sql4, con);
                com4.ExecuteNonQuery();
                SqlDataSource4.SelectCommand = "SELECT [id], [年级], [班级], [扣分部门], [扣分时间], [备注], [有效], [审核中], [扣分人姓名], [宿舍编号], [床号], [扣分], [扣分原因] FROM [扣分] where id in (select 申诉id from 申诉表 where 申诉时间>='" + DateTime.Now.AddDays(-15) + "' and 申诉表.申诉时间<='" + DateTime.Now + "' and 审核中 = '正在审核') and 年级='" + Session["年级"].ToString() + "' and 扣分部门 ='" + Session["区域"].ToString() + "'";
                SqlDataSource4.DataBind();
                GridView2.DataBind();
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

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                string sjfrom = int.Parse(this.timefrom.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(6, 2));
                DateTime timefrom = DateTime.Parse(sjfrom);
                string sjto = int.Parse(this.timeto.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(6, 2));
                DateTime timeto = DateTime.Parse(sjto);
                SqlDataSource3.SelectCommand = "SELECT [扣分时间], [备注], [扣分], [扣分人姓名], [扣分部门], [班级], [年级], [扣分原因] FROM [扣分] where 年级='" + Session["年级"].ToString() + "' and 扣分部门 = '" + Session["区域"].ToString() + "' and 扣分时间>='" + timefrom + "' and 扣分时间 <='" + timeto + "' and 有效 = 0";
                SqlDataSource3.DataBind();
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

        protected void Button9_Click(object sender, EventArgs e)
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
            if (Panel3.Visible == false)
            {
                Panel3.Visible = true;
            }
            else
            {
                Panel3.Visible = false;
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (Panel4.Visible == false)
            {
                Panel4.Visible = true;
            }
            else
            {
                Panel4.Visible = false;
            }
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
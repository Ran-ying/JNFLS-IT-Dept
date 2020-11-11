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
    public partial class ssxsh : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
        public static string 区域;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() != "宿舍管理部")
                    {
                        throw new Exception();
                    }
                    else
                    {
                        Label1.Text = "您好，宿管，18-236宿舍全体成员祝您快乐！";
                        DropDownList1.DataBind();
                        区域 = Session["区域"].ToString();
                    }
                }
                catch
                {
                    Response.Redirect("index.aspx");
                }
            }
            DropDownList4.DataBind();
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
                string sql1 = "delete from 扣分原因表 where 年级 = '" + Session["年级"].ToString() + "' and 部门 = '" + Session["区域"].ToString() + "' and 原因 = @yunyin";
                SqlCommand com1 = new SqlCommand(sql1, con);
                com1.Parameters.Add(new SqlParameter("yuanyin", DropDownList1.SelectedValue));
                com1.ExecuteNonQuery();
                con.Close();
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                string scriptstrs = "<script>alert('错误！" + e.ToString() +"');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
            }
        }

        protected void chaxun_Click(object sender, EventArgs e)
        {
            try
            {
                string sjfrom = int.Parse(this.timefrom.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(6, 2));
                DateTime timefrom = DateTime.Parse(sjfrom);
                string sjto = int.Parse(this.timeto.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(6, 2));
                DateTime timeto = DateTime.Parse(sjto);


                if (TextBox1.Text.Length > 3)
                {
                    //"108,109,111,112"
                    
                    string b = "";
                    for (int n = 0; n < TextBox1.Text.Length; n++)
                    {
                        try
                        {
                            int.Parse(TextBox1.Text.ToString().Substring(n, 3));
                            b += int.Parse(TextBox1.Text.ToString().Substring(n, 3)) + ",";
                        }
                        catch
                        {
                        }
                    }
                    b += "0";


                    SqlDataSource3.SelectCommand = "SELECT [扣分人姓名], [宿舍编号], [床号], [扣分], [有效], [备注], [扣分时间], [扣分部门], [班级], [年级], [扣分原因] FROM [扣分] where 年级='" + Session["年级"].ToString() + "' and 扣分部门 = '" + Session["区域"].ToString() + "' and 宿舍编号 in (" + b + ") and 扣分时间>='" + timefrom + "' and 扣分时间 <='" + timeto + "'";
                    SqlDataSource3.DataBind();
                    GridView1.DataBind();
                }
                else
                {
                SqlDataSource3.SelectCommand = "SELECT * FROM 扣分 where 扣分部门 = '" + Session["区域"].ToString() + "' and 扣分时间>='" + timefrom + "' and 扣分时间 <='" + timeto + "'";
                SqlDataSource3.DataBind();
                GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
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
                string sql1 = "update 扣分 set 审核中='学生会审核通过,等待政教处审核' where id ='" + int.Parse(GridView2.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com1 = new SqlCommand(sql1, con);
                com1.ExecuteNonQuery();
                string sql2 = "update 申诉表 set 学生会审核='学生会审核通过,等待政教处审核' where 申诉id ='" + int.Parse(GridView2.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com2 = new SqlCommand(sql2, con);
                com2.ExecuteNonQuery();
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

        protected void Button9_Click(object sender, EventArgs e)
        {

            //在将文本写入文件前，处理文本行
            //StreamWriter一个参数默认覆盖
            //StreamWriter第二个参数为false覆盖现有文件，为true则把文本追加到文件末尾
            using (System.IO.StreamWriter file = new System.IO.StreamWriter("F:\\SAIMS\\bin\\" + 区域 +".csv", true))
            {

                DateTime time = DateTime.Parse(int.Parse(TextBox9.Text.ToString().Substring(0, 4)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(4, 2)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(6, 2)));

                string[] strsplit = TextBox8.Text.ToString().Split(Environment.NewLine.ToCharArray());
                string 扣分原因 = DropDownList4.SelectedValue;
                string 错误信息 = null;

                try
                {
                    for (int i = 0; i < strsplit.Length; i++)
                    {
                        string[] 一条扣分 = strsplit[i].Split(new char[] { ' ' });
                        for (int o = 2; o < 一条扣分.Length; o++)
                        {
                            try
                            {
                                string 宿舍编号 = 一条扣分[0];
                                string 扣分 = 一条扣分[1];
                                string 床号 = 一条扣分[o];

                                file.WriteLine(宿舍编号+","+扣分 + "," + 床号 + "," + time + "," + 扣分原因);// 直接追加文件末尾，换行 
                            }
                            catch
                            {
                            }
                        }
                    }
                }
                catch
                {

                }

                string scriptstrs = "<script>alert('输入成功');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
                TextBox8.Text = "";
                TextBox9.Text = "";
                file.Dispose();
            }
            

        }
            /*
            con.Open();
            DateTime time = DateTime.Parse(int.Parse(TextBox9.Text.ToString().Substring(0, 4)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(4, 2)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(6, 2)));

            int a;
            int b;
            int c;
            int[] d = new int[(TextBox8.Text.ToString().Split(Environment.NewLine.ToCharArray()).Length + 1) / 2];
            string str = TextBox8.Text.ToString();
            string[] strsplit = str.Split(Environment.NewLine.ToCharArray());
            string 错误信息 = null;
            try
            {
                for (a = 0; a < strsplit.Length; a += 2)
                {
                    try
                    {
                        string[] i = strsplit[a].Split(new char[] { ' ' });
                        float[] 一条 = new float[i.Length];
                        for (b = 0; b < i.Length; b++)
                        {
                            一条[b] = float.Parse(i[b]);
                        }
                        int 宿舍编号 = int.Parse(一条[0].ToString());
                        float 扣分 = 一条[1];

                        for (c = 2; c < i.Length; c++)
                        {
                            string banji = null;
                            int nianji = 0;
                            string sql = "SELECT * FROM 宿舍表 WHERE 楼号 = '" + Session["年级"].ToString() + "' and 宿舍编号 = '" + 宿舍编号 + "' and 床号 LIKE '%" + 一条[c] + "%'";
                            SqlCommand com = new SqlCommand(sql, con);
                            SqlDataReader read = com.ExecuteReader();
                            if (read.Read())
                            {
                                banji = read.GetString(4);
                                nianji = read.GetInt32(5);
                                read.Close();
                            }
                            if (banji != null && nianji != 0)
                            {
                                string sql1 = "insert into 扣分(年级,班级,扣分部门,扣分时间,备注,有效,扣分人姓名,扣分,宿舍编号,床号,扣分原因) values('" + nianji.ToString() + "',N'" + banji + "',N'" + Session["区域"].ToString() + "','" + time + "',@beizhu,'0',N'" + Session["姓名"].ToString() + "','" + 扣分 + "','" + Session["年级"].ToString() + "-" + 宿舍编号 + "',@chuanghao,'" + DropDownList4.SelectedValue + "')";
                                SqlCommand com1 = new SqlCommand(sql1, con);
                                com1.Parameters.Add(new SqlParameter("beizhu", ""));
                                com1.Parameters.Add(new SqlParameter("chuanghao", 一条[c]));
                                com1.ExecuteNonQuery();
                            }
                            else
                            {
                                if (错误信息 == null)
                                {
                                    错误信息 = "宿舍编号：" + 宿舍编号 + "床号：" + 一条[c] + "<br />";
                                }
                                else
                                {
                                    错误信息 += "宿舍编号：" + 宿舍编号 + "床号：" + 一条[c] + "<br />";
                                }
                            }
                        }
                    }
                    catch
                    {
                        d[a / 2] = a / 2 + 1;
                    }
                    string cuowu = null;
                    for (int h = 0; h < d.Length; h++)
                    {
                        if (d[h] != 0)
                        {
                            cuowu += "第" + d[h] + "行、";
                        }
                    }
                    if (错误信息 != null || cuowu != null)
                    {
                        if (错误信息 == null)
                        {
                            错误信息 = "无";
                        }
                        if (cuowu == null)
                        {
                            cuowu = "无";
                        }
                        string scriptstrs = "<script>alert('部分或全部宿舍扣分未录入。没有宿舍号、床号的信息：" + 错误信息 + "。因格式错误未录入的行号：" + cuowu + "请检查您的录入！');</script>";
                        if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                        }
                    }
                    else
                    {
                        string scriptstrs = "<script>alert('输入成功！');</script>";
                        if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                string scriptstrs = "<script>alert('错误！检查时间！');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
            }
        }
        */

/*
        con.Open();
            DateTime time = DateTime.Parse(int.Parse(TextBox9.Text.ToString().Substring(0, 4)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(4, 2)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(6, 2)));

            string[] strsplit = TextBox8.Text.ToString().Split(Environment.NewLine.ToCharArray());

            string 错误信息 = null;

            try
            {
                for(int i = 0;i<strsplit.Length;i++)
                {
                    string[] 一条扣分 = strsplit[i].Split(new char[] { ' ' });
                    for (int o = 2; o < 一条扣分.Length; o++)
                    {
                        try
                        {
                            string 宿舍编号 = 一条扣分[0];
                            string 扣分 = 一条扣分[1];
                            string 床号 = 一条扣分[o];

                            string 年级 = null;
                            string 班级 = null;

                            string sql = "select top 1 * from 更新表 where 宿舍编号=@宿舍编号 床号=@床号 楼号=@楼号";
                            SqlCommand com = new SqlCommand(sql, con);
                            com.Parameters.Add(new SqlParameter("宿舍编号", 宿舍编号));
                            com.Parameters.Add(new SqlParameter("床号", 床号));
                            com.Parameters.Add(new SqlParameter("楼号", Session["年级"].ToString()));
                            SqlDataReader indda1 = com.ExecuteReader();
                            if (indda1.Read())
                            {
                                年级 = indda1.GetString(5);
                                班级 = indda1.GetString(4);
                            }
                            string sql1 = "insert into 扣分(年级,班级,扣分部门,扣分时间,有效,扣分人姓名,宿舍编号,床号,扣分,扣分原因) values(@年级,@班级,@扣分部门,@扣分时间,'0',@扣分人姓名,@宿舍编号,@床号,@扣分,@扣分原因）";
                            SqlCommand com1 = new SqlCommand(sql1, con);
                            com1.Parameters.Add(new SqlParameter("年级", 年级));
                            com1.Parameters.Add(new SqlParameter("班级", 班级));
                            com1.Parameters.Add(new SqlParameter("扣分部门", Session["区域"].ToString()));
                            com1.Parameters.Add(new SqlParameter("扣分时间", time));
                            com1.Parameters.Add(new SqlParameter("扣分人姓名", Session["姓名"].ToString()));
                            com1.Parameters.Add(new SqlParameter("宿舍编号", int.Parse(宿舍编号)));
                            com1.Parameters.Add(new SqlParameter("床号", int.Parse(床号)));
                            com1.Parameters.Add(new SqlParameter("扣分", float.Parse(扣分)));
                            com1.Parameters.Add(new SqlParameter("扣分原因", DropDownList4.SelectedValue));
                            com1.ExecuteNonQuery();
                        }
                        catch
                        {

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
            TextBox8.Text = "";
            TextBox9.Text = "";

        */
            /*
            con.Open();
            DateTime time = DateTime.Parse(int.Parse(TextBox9.Text.ToString().Substring(0, 4)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(4, 2)) + "/" + int.Parse(TextBox9.Text.ToString().Substring(6, 2)));

            int a;
            int b;
            int c;
            int[] d = new int[(TextBox8.Text.ToString().Split(Environment.NewLine.ToCharArray()).Length + 1) / 2];
            string str = TextBox8.Text.ToString();
            string[] strsplit = str.Split(Environment.NewLine.ToCharArray());
            string 错误信息 = null;
            try
            {
                for (a = 0; a < strsplit.Length; a += 2)
                {
                    try
                    {
                        string[] i = strsplit[a].Split(new char[] { ' ' });
                        float[] 一条 = new float[i.Length];
                        for (b = 0; b < i.Length; b++)
                        {
                            一条[b] = float.Parse(i[b]);
                        }
                        int 宿舍编号 = int.Parse(一条[0].ToString());
                        float 扣分 = 一条[1];

                        for (c = 2; c < i.Length; c++)
                        {
                            string banji = null;
                            int nianji = 0;
                            string sql = "SELECT * FROM 宿舍表 WHERE 楼号 = '" + Session["年级"].ToString() + "' and 宿舍编号 = '" + 宿舍编号 + "' and 床号 LIKE '%" + 一条[c] + "%'";
                            SqlCommand com = new SqlCommand(sql, con);
                            SqlDataReader read = com.ExecuteReader();
                            if (read.Read())
                            {
                                banji = read.GetString(4);
                                nianji = read.GetInt32(5);
                                read.Close();
                            }
                            if (banji != null && nianji != 0)
                            {
                                string sql1 = "insert into 扣分(年级,班级,扣分部门,扣分时间,备注,有效,扣分人姓名,扣分,宿舍编号,床号,扣分原因) values('" + nianji.ToString() + "',N'" + banji + "',N'" + Session["区域"].ToString() + "','" + time + "',@beizhu,'0',N'" + Session["姓名"].ToString() + "','" + 扣分 + "','" + Session["年级"].ToString() + "-" + 宿舍编号 + "',@chuanghao,'" + DropDownList4.SelectedValue + "')";
                                SqlCommand com1 = new SqlCommand(sql1, con);
                                com1.Parameters.Add(new SqlParameter("beizhu", ""));
                                com1.Parameters.Add(new SqlParameter("chuanghao", 一条[c]));
                                com1.ExecuteNonQuery();
                            }
                            else
                            {
                                if (错误信息 == null)
                                {
                                    错误信息 = "宿舍编号：" + 宿舍编号 + "床号：" + 一条[c] + "<br />";
                                }
                                else
                                {
                                    错误信息 += "宿舍编号：" + 宿舍编号 + "床号：" + 一条[c] + "<br />";
                                }
                            }
                        }
                    }
                    catch
                    {
                        d[a / 2] = a / 2 + 1;
                    }
                    string cuowu = null;
                    for (int h = 0; h < d.Length; h++)
                    {
                        if (d[h] != 0)
                        {
                            cuowu += "第" + d[h] + "行、";
                        }
                    }
                    if (错误信息 != null || cuowu != null)
                    {
                        if (错误信息 == null)
                        {
                            错误信息 = "无";
                        }
                        if (cuowu == null)
                        {
                            cuowu = "无";
                        }
                        string scriptstrs = "<script>alert('部分或全部宿舍扣分未录入。没有宿舍号、床号的信息：" + 错误信息 + "。因格式错误未录入的行号：" + cuowu + "请检查您的录入！');</script>";
                        if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                        }
                    }
                    else
                    {
                        string scriptstrs = "<script>alert('输入成功！');</script>";
                        if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                string scriptstrs = "<script>alert('错误！检查时间！');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
            }
            */




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
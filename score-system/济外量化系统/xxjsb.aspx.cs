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
    public partial class xxjsb : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
        string shenfen;
        string quyu;
        int nianji;
        string xingming;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() != "信息技术部")
                    {
                        throw new Exception();
                    }
                    else
                    {
                        shenfen = Session["身份"].ToString();
                        quyu = Session["区域"].ToString();
                        nianji = int.Parse(Session["年级"].ToString());
                        xingming = Session["姓名"].ToString();
                        Label1.Text = "您好，" + nianji + "的" + quyu + xingming;
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
                string sql3 = "insert into 更新表(版本号,更新内容,更新人) values(@版本号,@更新内容,@更新人)";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("版本号", TextBox1.Text));
                com3.Parameters.Add(new SqlParameter("更新内容", TextBox2.Text));
                com3.Parameters.Add(new SqlParameter("更新人", "贾宝琰"));
                com3.ExecuteNonQuery();
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
            Random random = new Random();
            int 随机标识 = random.Next(100, 999);
            int 部门标识 = 0;
            string 部门 = DropDownList1.SelectedItem.Text;
            string 卡颜色 = null;
            string 跳转 = null;
            string 姓名 = TextBox4.Text;
            int 年级 = int.Parse(Session["年级"].ToString());
            int 职务标识 = int.Parse(DropDownList5.SelectedValue);
            string 职务 = DropDownList5.SelectedItem.Text;
            con.Open();
            string sql = "SELECT * FROM 做卡表 WHERE 编号 = @id";
            SqlCommand com = new SqlCommand(sql, con);
            com.Parameters.Add(new SqlParameter("id", DropDownList1.SelectedValue));
            SqlDataReader read = com.ExecuteReader();
            string 身份 = null;
            if (read.Read())
            {
                部门标识 = read.GetInt32(5);
                卡颜色 = read.GetString(1);
                身份 = read.GetString(2);
                try
                {
                    跳转 = read.GetString(4);
                }
                catch
                {
                }
                read.Close();
            }
            string 编号 = Session["年级"].ToString() + 部门标识.ToString() + 职务标识.ToString() + 随机标识.ToString();



            if (跳转 != null)
            {
                string sql3 = "insert into 用户(编码,密码,身份,区域,年级,跳转,姓名) values(@编码,@密码,@身份,@区域,@年级,@跳转,@姓名)";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("编码", 编号));
                com3.Parameters.Add(new SqlParameter("密码", "0"));
                com3.Parameters.Add(new SqlParameter("身份", 身份));
                com3.Parameters.Add(new SqlParameter("区域", DropDownList1.SelectedItem.Text));
                com3.Parameters.Add(new SqlParameter("年级", Session["年级"].ToString()));
                com3.Parameters.Add(new SqlParameter("跳转", 跳转));
                com3.Parameters.Add(new SqlParameter("姓名", TextBox4.Text));
                com3.ExecuteNonQuery();

            }

            con.Close();
            GridView1.DataBind();


            string scriptstrs = "<script>$(function () { var url = '" + 编号 + "';jQuery('#qrcode').qrcode({render: 'canvas',width: 300,height: 300,typeNumber: -1,correctLevel: 2,text: url});function convertCanvasToImage(canvas) {var image = new Image();image.src = canvas.toDataURL('image/png'); return image;}var mycanvas1 = document.getElementsByTagName('canvas')[0];var img = convertCanvasToImage(mycanvas1);$('#qrcode').html(''); $('#qrcode').append(img);$('#qrcode img').attr('id', 'tulip');var canvas = document.getElementById('myCanvas');var ctx = canvas.getContext('2d');var img = new Image();img.src = '工作证模板/" + 卡颜色 + ".png';canvas.width =  2480;canvas.height = 1748;var ewm = document.getElementById('tulip');img.crossOrigin = '*';img.onload = function () {ctx.drawImage(img, 0, 0);ctx.drawImage(ewm, 80, 1005);ctx.font = '74px KaiTi';ctx.fillText('" + 姓名 + "', 623, 987+74);ctx.font = '55px KaiTi';ctx.fillText('" + 部门 + 职务 + "', 599, 1104+55);ctx.font = '55px Segoe UI';ctx.fillText('" + 编号 + "', 599, 1195+55);var srcImg = new Image();srcImg.src = canvas.toDataURL('images/png');$('#h').html('');$('#h').append(srcImg);$('#h img').attr('width', '100%');$('#h img').attr('height', '100%');$('#qrcode').hide();}});</script>";
            if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
            }
        }

            /*
            try
            {
                string 部门 = DropDownList1.SelectedValue;
                bool issushe = false;
                bool ismishuchu = false;
                for (int i = 0; i < 部门.Length; i++)
                {
                    if (部门[i] == '宿')
                    {
                        issushe = true;
                    }
                    else if (部门[i] == '处')
                    {
                        ismishuchu = true;
                    }
                }
                con.Open();
                if (ismishuchu == false)
                {
                    if (issushe == true)
                    {
                        string sql3 = "insert into 用户(用户名,密码,身份,区域,年级,跳转,姓名) values(@用户名,@密码,@身份,@区域,@年级,@跳转,@姓名)";
                        SqlCommand com3 = new SqlCommand(sql3, con);
                        com3.Parameters.Add(new SqlParameter("用户名", Session["年级"].ToString() + TextBox3.Text));
                        com3.Parameters.Add(new SqlParameter("密码", "0"));
                        com3.Parameters.Add(new SqlParameter("身份", "宿舍学生会"));
                        com3.Parameters.Add(new SqlParameter("区域", DropDownList1.SelectedValue));
                        com3.Parameters.Add(new SqlParameter("年级", Session["年级"].ToString()));
                        com3.Parameters.Add(new SqlParameter("跳转", "ssxsh.aspx"));
                        com3.Parameters.Add(new SqlParameter("姓名", TextBox4.Text));
                        com3.ExecuteNonQuery();
                    }
                    else
                    {
                        string sql3 = "insert into 用户(用户名,密码,身份,区域,年级,跳转,姓名) values(@用户名,@密码,@身份,@区域,@年级,@跳转,@姓名)";
                        SqlCommand com3 = new SqlCommand(sql3, con);
                        com3.Parameters.Add(new SqlParameter("用户名", Session["年级"].ToString() + TextBox3.Text));
                        com3.Parameters.Add(new SqlParameter("密码", "0"));
                        com3.Parameters.Add(new SqlParameter("身份", "普通学生会"));
                        com3.Parameters.Add(new SqlParameter("区域", DropDownList1.SelectedValue));
                        com3.Parameters.Add(new SqlParameter("年级", Session["年级"].ToString()));
                        com3.Parameters.Add(new SqlParameter("跳转", "ptxsh.aspx"));
                        com3.Parameters.Add(new SqlParameter("姓名", TextBox4.Text));
                        com3.ExecuteNonQuery();
                    }
                }
                else
                {
                    string sql3 = "insert into 用户(用户名,密码,身份,区域,年级,跳转,姓名) values(@用户名,@密码,@身份,@区域,@年级,@跳转,@姓名)";
                    SqlCommand com3 = new SqlCommand(sql3, con);
                    com3.Parameters.Add(new SqlParameter("用户名", Session["年级"].ToString() + TextBox3.Text));
                    com3.Parameters.Add(new SqlParameter("密码", "0"));
                    com3.Parameters.Add(new SqlParameter("身份", "统分秘书处"));
                    com3.Parameters.Add(new SqlParameter("区域", DropDownList1.SelectedValue));
                    com3.Parameters.Add(new SqlParameter("年级", Session["年级"].ToString()));
                    com3.Parameters.Add(new SqlParameter("跳转", "tfmsc.aspx"));
                    com3.Parameters.Add(new SqlParameter("姓名", TextBox4.Text));
                    com3.ExecuteNonQuery();
                }
                con.Close();
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
            */

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql3 = "delete from 用户 where id = @nianji";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("nianji", GridView1.SelectedDataKey.Values["id"].ToString()));
                com3.ExecuteNonQuery();
                con.Close();
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

                Random random = new Random();
                int 随机标识 = random.Next(100, 999);
                int 部门标识 = 0;
                string 部门 = DropDownList2.SelectedItem.Text;
                string 卡颜色 = null;
                string 跳转 = null;
                string 姓名 = TextBox6.Text;
                int 年级 = int.Parse(Session["年级"].ToString());
                int 职务标识 = 00;
                string 职务 = "班主任";
                string sql = "SELECT * FROM 做卡表 WHERE 编号 = @id";
                SqlCommand com = new SqlCommand(sql, con);
                com.Parameters.Add(new SqlParameter("id", DropDownList2.SelectedValue));
                SqlDataReader read = com.ExecuteReader();
                string 身份 = null;
                if (read.Read())
                {
                    部门标识 = read.GetInt32(5);
                    卡颜色 = read.GetString(1);
                    身份 = read.GetString(2);
                    try
                    {
                        跳转 = read.GetString(4);
                    }
                    catch
                    {
                    }
                    read.Close();
                }
                string 编号 = Session["年级"].ToString() + 部门标识.ToString() + 职务标识.ToString() + 随机标识.ToString();



                if (跳转 != null)
                {

                    string sql3 = "insert into 用户(编码,密码,身份,区域,年级,跳转,姓名) values(@编码,@密码,@身份,@区域,@年级,@跳转,@姓名)";
                    SqlCommand com3 = new SqlCommand(sql3, con);
                    com3.Parameters.Add(new SqlParameter("编码", 编号));
                    com3.Parameters.Add(new SqlParameter("密码", "0"));
                    com3.Parameters.Add(new SqlParameter("身份", 身份));
                    com3.Parameters.Add(new SqlParameter("区域", DropDownList2.SelectedItem.Text));
                    com3.Parameters.Add(new SqlParameter("年级", Session["年级"].ToString()));
                    com3.Parameters.Add(new SqlParameter("跳转", 跳转));
                    com3.Parameters.Add(new SqlParameter("姓名", TextBox6.Text));
                    com3.ExecuteNonQuery();
                }

                con.Close();
                GridView2.DataBind();

                string scriptstrs = "<script>$(function () { var url = '" + 编号 + "';jQuery('#qrcode').qrcode({render: 'canvas',width: 300,height: 300,typeNumber: -1,correctLevel: 2,text: url});function convertCanvasToImage(canvas) {var image = new Image();image.src = canvas.toDataURL('image/png'); return image;}var mycanvas1 = document.getElementsByTagName('canvas')[0];var img = convertCanvasToImage(mycanvas1);$('#qrcode').html(''); $('#qrcode').append(img);$('#qrcode img').attr('id', 'tulip');var canvas = document.getElementById('myCanvas');var ctx = canvas.getContext('2d');var img = new Image();img.src = '工作证模板/" + 卡颜色 + ".png';canvas.width =  2480;canvas.height = 1748;var ewm = document.getElementById('tulip');img.crossOrigin = '*';img.onload = function () {ctx.drawImage(img, 0, 0);ctx.drawImage(ewm, 80, 1005);ctx.font = '74px KaiTi';ctx.fillText('" + 姓名 + "', 623, 987+74);ctx.font = '55px KaiTi';ctx.fillText('" + 部门 + 职务 + "', 599, 1104+55);ctx.font = '55px Segoe UI';ctx.fillText('" + 编号 + "', 599, 1195+55);var srcImg = new Image();srcImg.src = canvas.toDataURL('images/png');$('#h').html('');$('#h').append(srcImg);$('#h img').attr('width', '100%');$('#h img').attr('height', '100%');$('#qrcode').hide();}});</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }


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
                string sql3 = "delete from 用户 where id = @nianji";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("nianji", GridView2.SelectedDataKey.Values["id"].ToString()));
                com3.ExecuteNonQuery();
                con.Close();
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

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                for (int a = 0; a < TextBox7.Text.Length; a++)
                {
                    for (int n = 0; n < TextBox8.Text.Length; n++)
                    {
                        try
                        {
                            int sushehao = int.Parse(TextBox7.Text.ToString().Substring(a, 3));
                            int chuanghao = int.Parse(TextBox8.Text.ToString().Substring(n, 1));

                            string sql3 = "insert into 宿舍表(年级,宿舍编号,床号,班级,楼号) values(@年级,@宿舍编号,@床号,@班级,@楼号)";
                            SqlCommand com3 = new SqlCommand(sql3, con);
                            com3.Parameters.Add(new SqlParameter("年级", Session["年级"].ToString()));
                            com3.Parameters.Add(new SqlParameter("宿舍编号", sushehao));
                            com3.Parameters.Add(new SqlParameter("床号", chuanghao));
                            com3.Parameters.Add(new SqlParameter("班级", DropDownList4.SelectedValue));
                            com3.Parameters.Add(new SqlParameter("楼号", DropDownList3.SelectedValue));
                            com3.ExecuteNonQuery();
                        }
                        catch
                        {
                        }
                    }
                }
                con.Close();
                GridView3.DataBind();
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

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql3 = "delete from 宿舍表 where id = @nianji";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("nianji", GridView3.SelectedDataKey.Values["id"].ToString()));
                com3.ExecuteNonQuery();
                con.Close();
                GridView3.DataBind();
                con.Close();
                GridView3.DataBind();
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
                SqlDataSource7.SelectCommand = "SELECT * FROM [扣分] where id in (select 申诉id from 申诉表 where 政教处审核 IS NULL  and 学生会审核 = '学生会审核通过,等待政教处审核' and 年级 = '" + Session["年级"].ToString() + "' and 申诉时间 >= '" + DateTime.Now.AddDays(-15) + "' and 申诉时间 <= '" + DateTime.Now + "')";
                SqlDataSource7.DataBind();
                GridView4.DataBind();
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

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql1 = "update 扣分 set 审核中='信息部审核通过，此分无效！' where id ='" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com1 = new SqlCommand(sql1, con);
                com1.ExecuteNonQuery();
                string sql2 = "update 申诉表 set 政教处审核='信息部审核通过，此分无效！' where 申诉id ='" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com2 = new SqlCommand(sql2, con);
                com2.ExecuteNonQuery();
                string sql3 = "update 扣分 set 有效 = '666' where id ='" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.ExecuteNonQuery();
                con.Close();
                SqlDataSource1.SelectCommand = "SELECT * FROM [扣分] where id in (select 申诉id from 申诉表 where 政教处审核 IS NULL  and 学生会审核 = '学生会审核通过,等待政教处审核' and 申诉时间 >= '" + DateTime.Now.AddDays(-15) + "' and 申诉时间 <= '" + DateTime.Now + "')";
                SqlDataSource1.DataBind();
                GridView4.DataBind();
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

        protected void Button6_Click(object sender, EventArgs e)
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

        protected void Button7_Click(object sender, EventArgs e)
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

        protected void Button8_Click(object sender, EventArgs e)
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

        protected void Button9_Click(object sender, EventArgs e)
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

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (Panel5.Visible == false)
            {
                Panel5.Visible = true;
            }
            else
            {
                Panel5.Visible = false;
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
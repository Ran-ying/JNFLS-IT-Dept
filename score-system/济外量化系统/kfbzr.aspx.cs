using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace 济外量化系统
{
    public partial class kfbzr : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["身份"].ToString() != "班主任")
                    {
                        throw new Exception();
                    }
                    else
                    {
                        Label1.Text = "您好，" + Session["年级"].ToString() + "的" + Session["区域"].ToString() + "班主任" + Session["姓名"].ToString() + "老师！";
                    }
                }
                catch
                {
                    Response.Redirect("index.aspx");
                }
            }
        }

        protected void chaxun_Click(object sender, EventArgs e)
        {
                string sjfrom = int.Parse(this.timefrom.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(6, 2));
                DateTime timefrom = DateTime.Parse(sjfrom);
                string sjto = int.Parse(this.timeto.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(6, 2));
                DateTime timeto = DateTime.Parse(sjto);


                con.Open();
                //班级数组
                int a = 0;
                string sql = "SELECT 区域编号表.区域, 区域编号表.编号 FROM 区域编号表 INNER JOIN 用户 ON 区域编号表.区域 = 用户.区域 WHERE  年级 = '" + Session["年级"].ToString() + "' and 身份 = '班主任' order by 编号";
                SqlCommand com = new SqlCommand(sql, con);
                SqlDataReader read = com.ExecuteReader();
                while (read.Read())
                {
                    if (read.GetString(0)[0] == '0' || read.GetString(0)[0] == '1')
                    {
                        a++;
                    }
                }
                read.Close();
                //部门数组
                int b = 0;
                string sql1 = "SELECT 区域编号表.区域, 区域编号表.编号 FROM 区域编号表 INNER JOIN 用户 ON 区域编号表.区域 = 用户.区域 WHERE  年级 = '" + Session["年级"].ToString() + "' and 身份 in ('普通学生会','宿舍管理部') order by 编号";
                SqlCommand com1 = new SqlCommand(sql1, con);
                SqlDataReader read1 = com1.ExecuteReader();
                while (read1.Read())
                {
                    if (b <= read1.GetInt32(1)) b = read1.GetInt32(1);
                }
                read1.Close();
                b++;
                //班级数组
                string[] bj = new string[a];
                string[] bm = new string[b];

                bm[0] = "男宿部";
                bm[1] = "女宿部";
                string sql2 = "SELECT 区域编号表.区域, 区域编号表.编号 FROM 区域编号表 INNER JOIN 用户 ON 区域编号表.区域 = 用户.区域 WHERE  年级 = '" + Session["年级"].ToString() + "' and 身份 = '班主任' order by 编号";
                SqlCommand com2 = new SqlCommand(sql2, con);
                SqlDataReader read2 = com2.ExecuteReader();
                while (read2.Read())
                {

                    if (read2.GetString(0)[0] == '0' || read2.GetString(0)[0] == '1')
                    {
                        bj[read2.GetInt32(1)] = read2.GetString(0);
                    }
                }
                read2.Close();
                //部门数组

                string sql3 = "SELECT 区域编号表.区域, 区域编号表.编号 FROM 区域编号表 INNER JOIN 用户 ON 区域编号表.区域 = 用户.区域 WHERE  年级 = '" + Session["年级"].ToString() + "' and 身份 in ('普通学生会','宿舍管理部') order by 编号";
                SqlCommand com3 = new SqlCommand(sql3, con);
                SqlDataReader read3 = com3.ExecuteReader();
                while (read3.Read())
                {
                    bm[read3.GetInt32(1)] = read3.GetString(0);
                }
                read3.Close();
                //扣分检索
                //SELECT 扣分.扣分, 区域编号表.编号 AS 班级, 区域编号表_1.编号 AS 扣分部门 FROM 扣分 INNER JOIN 区域编号表 ON 扣分.班级 = 区域编号表.区域 INNER JOIN 区域编号表 AS 区域编号表_1 ON 扣分.扣分部门 = 区域编号表_1.区域
                float koufen = 0;
                int banji = 0;
                int bumen = 0;

                float[,] koufenzu = new float[bj.Length, bm.Length];

                string sql4 = "SELECT 扣分.扣分, 区域编号表.编号 AS 班级, 区域编号表_1.编号 AS 扣分部门 FROM 扣分 INNER JOIN 区域编号表 ON 扣分.班级 = 区域编号表.区域 INNER JOIN 区域编号表 AS 区域编号表_1 ON 扣分.扣分部门 = 区域编号表_1.区域 WHERE 有效 = '0' and 年级 = '" + Session["年级"].ToString() + "' and 扣分时间 >= '" + timefrom + "' and 扣分时间 <= '" + timeto + "'";
                SqlCommand com4 = new SqlCommand(sql4, con);
                SqlDataReader read4 = com4.ExecuteReader();
                while (read4.Read())
                {
                    try
                    {
                        koufen = float.Parse(read4.GetDouble(0).ToString());
                        banji = read4.GetInt32(1);
                        bumen = read4.GetInt32(2);
                        koufenzu[read4.GetInt32(1), read4.GetInt32(2)] += float.Parse(read4.GetDouble(0).ToString()) * 1000;
                    }
                    catch
                    {
                    }
                }
                read4.Close();
                string thisfenshu = "";
                //输出扣分部门
                thisfenshu += "<table><tr><td></td>";
                for (int h = 0; h < bm.Length; h++)
                {
                    thisfenshu += "<td>" + bm[h] + "</td>";
                }
                thisfenshu += "</tr>";
                for (int j = 0; j < bj.Length; j++)
                {
                    thisfenshu += "<tr><td>" + bj[j] + "</td>";
                    for (int i = 0; i < bm.Length; i++)
                    {
                        thisfenshu += "<td>" + koufenzu[j, i] / 1000 + "</td>";
                    }
                    thisfenshu += "</tr>";
                }
                thisfenshu += "</table>";
                Label2.Text = thisfenshu.ToString();

                //输出排名
                float[,] nannvsu = koufenzu;
                int[,] paiming = new int[bj.Length, bm.Length - 1];
                for (int k = 0; k < bj.Length; k++)
                {
                    nannvsu[k, 1] += nannvsu[k, 0];
                    nannvsu[k, 0] = 0;
                }
                for (int m = 1; m < bm.Length; m++)
                {
                    ArrayList p = new ArrayList();
                    for (int l = 0; l < bj.Length; l++)
                    {
                        p.Add(nannvsu[l, m]);
                    }
                    p.Sort();
                    for (int l = 0; l < bj.Length; l++)
                    {
                        paiming[l, m - 1] = p.IndexOf(nannvsu[l, m]) + 1;
                    }
                }

                string thispaiming = "";
                thispaiming += "<table><tr><td></td>";
                for (int h = 0; h < bm.Length; h++)
                {
                    if (h == 0 || h == 1)
                    {
                        if (h == 0)
                        {
                            thispaiming += "<td>男女宿</td>";
                        }
                    }
                    else
                    {
                        thispaiming += "<td>" + bm[h] + "</td>";
                    }
                }
                thispaiming += "</tr>";
                for (int j = 0; j < bj.Length; j++)
                {
                    thispaiming += "<tr><td>" + bj[j] + "</td>";
                    for (int i = 0; i < bm.Length - 1; i++)
                    {
                        thispaiming += "<td>" + paiming[j, i] + "</td>";
                    }
                    thispaiming += "</tr>";
                }
                thispaiming += "</table>";
                //Label3.Text = thispaiming.ToString();

                //输出标准分
                int[,] 标准分 = new int[bj.Length, bm.Length];
                string sql5 = "SELECT 区域编号表.编号, 标准分.分数, 标准分.名次 FROM 标准分 INNER JOIN 区域编号表 ON 标准分.部门 = 区域编号表.区域 WHERE 标准分.年级 = '" + Session["年级"].ToString() + "' and 标准分.部门 != '男宿部'";
                SqlCommand com5 = new SqlCommand(sql5, con);
                SqlDataReader read5 = com5.ExecuteReader();
                while (read5.Read())
                {
                    //
                    //部门编号GetInt32(0);
                    //分数read.GetInt32(1);
                    //名次read.GetInt32(2);
                    //
                    if (read5.GetInt32(0) == 0)
                    {
                    }
                    else
                    {
                        for (int n = 0; n < bj.Length; n++)
                        {
                            if (paiming[n, read5.GetInt32(0) - 1] == read5.GetInt32(2))
                            {
                                标准分[n, read5.GetInt32(0) - 1] = read5.GetInt32(1);
                            }
                        }
                    }
                }
                read5.Close();
                for (int n = 0; n < bj.Length; n++)
                {
                    int 存储 = 0;
                    for (int p = 0; p < bm.Length - 1; p++)
                    {
                        存储 += 标准分[n, p];
                    }
                    标准分[n, bm.Length - 1] = 存储;
                }


                string 输出标准分 = "";
                输出标准分 += "<table><tr><td></td>";
                for (int h = 0; h < bm.Length; h++)
                {
                    if (h == 0 || h == 1)
                    {
                        if (h == 0)
                        {
                            输出标准分 += "<td>男女宿</td>";
                        }
                    }
                    else
                    {
                        输出标准分 += "<td>" + bm[h] + "</td>";
                    }
                }
                输出标准分 += "<td>总分</td></tr>";
                for (int j = 0; j < bj.Length; j++)
                {
                    输出标准分 += "<tr><td>" + bj[j] + "</td>";
                    for (int i = 0; i < bm.Length; i++)
                    {
                        输出标准分 += "<td>" + 标准分[j, i] + "</td>";
                    }
                    输出标准分 += "</tr>";
                }
                输出标准分 += "</table>";
                //Label4.Text = 输出标准分.ToString();


                //输出标准分总分排名
                string bzfpm = "";
                bzfpm += "<table><tr><td>排名</td>";
                int[] bzf = new int[bj.Length];

                ArrayList pe = new ArrayList();
                for (int m = 0; m < bj.Length; m++)
                {
                    pe.Add(标准分[m, bm.Length - 1]);
                }
                pe.Sort();
                pe.Reverse();
                for (int l = 0; l < bj.Length; l++)
                {
                    bzf[l] = pe.IndexOf(标准分[l, bm.Length - 1]) + 1;
                }


                for (int n = 0; n < bj.Length; n++)
                {
                    bzfpm += "<tr><td>" + bzf[n] + "</td></tr>";
                }
                bzfpm += "</table>";
                Label5.Text = bzfpm;

                con.Close();

                SqlDataSource3.SelectCommand = "SELECT [id], [年级], [班级], [扣分部门], [扣分时间], [备注], [审核中], [有效], [扣分], [床号], [宿舍编号], [扣分人姓名], [扣分原因] FROM [扣分] where 年级='" + Session["年级"].ToString() + "' and 班级 = '"+Session["区域"].ToString()+"' and 扣分时间>='" + timefrom + "' and 扣分时间 <='" + timeto + "' and 有效 = 0";
                SqlDataSource3.DataBind();
                GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sjfrom = int.Parse(this.timefrom.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timefrom.Text.ToString().Substring(6, 2));
                DateTime timefrom = DateTime.Parse(sjfrom);
                string sjto = int.Parse(this.timeto.Text.ToString().Substring(0, 4)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(4, 2)) + "/" + int.Parse(this.timeto.Text.ToString().Substring(6, 2));
                DateTime timeto = DateTime.Parse(sjto);
                //查询是否正在审核
                string sql2 = "SELECT * FROM 申诉表 WHERE 申诉id = '" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                SqlCommand com2 = new SqlCommand(sql2, con);
                SqlDataReader read = com2.ExecuteReader();
                if (read.Read())
                {
                    read.Close();
                }
                else
                {
                    read.Close();
                    string sql1 = "update 扣分 set 审核中='正在审核' where id ='" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "'";
                    SqlCommand com1 = new SqlCommand(sql1, con);
                    com1.ExecuteNonQuery();
                    string sql = "insert into 申诉表(年级,班级,申诉id,申诉时间) values('" + Session["年级"].ToString() + "',N'" + Session["区域"].ToString() + "','" + int.Parse(GridView1.SelectedDataKey.Values["id"].ToString()) + "','" + DateTime.Now + "')";
                    SqlCommand com = new SqlCommand(sql, con);
                    com.ExecuteNonQuery();
                    SqlDataSource3.SelectCommand = "SELECT [id], [年级], [班级], [扣分部门], [扣分时间], [备注], [审核中], [有效], [扣分], [床号], [宿舍编号], [扣分人姓名], [扣分原因] FROM [扣分] where 年级='" + Session["年级"].ToString() + "' and 班级 = '"+Session["区域"].ToString()+"' and 扣分时间>='" + timefrom + "' and 扣分时间 <='" + timeto + "'";
                    SqlDataSource3.DataBind();
                    GridView1.DataBind();
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
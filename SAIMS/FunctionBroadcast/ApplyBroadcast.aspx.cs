using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing.Text;
public partial class FunctionBroadcast_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (标题.Text == null || (上午间操.Text == null && 下午间操.Text == null && 每周一歌.Text == null && 活动课.Text == null && 天气预报.Text == null) || (今天.Text == null && 明天.Text == null) || 内容.Text == null)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>alert('对不起，请输入完整信息!');location.reload();</script>");
            Response.Flush();
            Response.End();
        }
        else
        {
            string upclubdata;
            string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ClubConnectionString);
            con.Open();
            try
            {
                string nametext = Session["部门名"].ToString() + "-" + name.Text;

                if (上午间操.Checked == true)
                {
                    if (name.Text == "")
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','上午间操','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','上午间操','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();

                        }
                    }
                    else
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "',上午间操','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "',上午间操','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                    }
                }
                if (下午间操.Checked == true)
                {
                    if (name.Text == "")
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','下午间操','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','下午间操','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','下午间操','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','下午间操','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                    }
                }
                if (每周一歌.Checked == true)
                {
                    if (name.Text == "")
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','每周一歌','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','每周一歌','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','每周一歌','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','每周一歌','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                    }
                }
                if (天气预报.Checked == true)
                {
                    if (name.Text == "")
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','天气预报','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','天气预报','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();

                        }
                    }
                    else
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','天气预报','" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','天气预报','" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();

                        }
                    }
                }
                if (活动课.Checked == true)
                {
                    if (name.Text == "")
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,申请状态,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','活动课','" + true + "'" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,申请状态,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + Session["名字"] + "', '" + DateTime.Now + "','活动课','" + true + "'" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        if (今天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,申请状态,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','活动课','" + true + "'" + DateTime.Now.ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                        if (明天.Checked == true)
                        {
                            upclubdata = "INSERT INTO 广播 (标题,内容,申请人,申请时间,播报时间,申请状态,播报时间2) VALUES ('" + 标题.Text + "', '" + 内容.Text + "', '" + nametext + "', '" + DateTime.Now + "','活动课','" + true + "'" + DateTime.Now.AddDays(1).ToShortDateString() + "')";

                            SqlCommand Command1 = new SqlCommand();
                            Command1.Connection = con;
                            Command1.CommandText = upclubdata;
                            Command1.CommandType = CommandType.Text;
                            Command1.ExecuteNonQuery();
                        }
                    }
                }

            }
            finally
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>alert('操作成功!');location.reload();</script>");
                Response.Flush();
                Response.End();
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
    }
}
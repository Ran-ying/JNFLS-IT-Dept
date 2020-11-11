using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class FunctionAnouncement_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["login"] != "OK")
        {

            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='/jssm/login.aspx';alert('对不起,您没有登陆!');</script>");
            Response.Flush();
            Response.End();
        }

        bool 班级签到Bol = false, 班级签到管理Bol = false;

        string consql = "SELECT 班级签到,班级签到管理 FROM 权限表 WHERE 职务 = " + Session["职务"];
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();



        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            班级签到Bol = conda.GetBoolean(0);
            班级签到管理Bol = conda.GetBoolean(1);
        }

        con.Close();

        if (班级签到Bol == false && 班级签到管理Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='/jssm/index.aspx';alert('对不起,您没有此项操作权限!');</script>");
            Response.Flush();
            Response.End();
        }

        刷卡签到.Visible = false;
        查看签到情况.Visible = false;


        if (班级签到Bol == true)
        {
            标题.Text = "请刷卡签到:" + Session["班级名"];
            刷卡签到.Visible = true;
            Page.Form.DefaultButton = 确定.UniqueID;
        }


        if (班级签到管理Bol == true)
        {
            标题.Text = "查看各班级签到情况";

            查看签到情况.Visible = true;
        }

       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        string ConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        try
        {

            string ClearanceSql, IC = "", IC卡对应姓名 = "", IC卡对应班级 = "";


            if (TextBox1.Text.ToString().Length == 10)
            {
                DateTime 上午到校时间 = DateTime.Now, 下午到校时间 = DateTime.Now;

                ClearanceSql = "SELECT IC卡编号,姓名,班级 FROM IC卡 WHERE ICID = '" + TextBox1.Text + "'";
                SqlCommand cons = new SqlCommand(ClearanceSql, con);
                SqlDataReader conda = cons.ExecuteReader();
                while (conda.Read())
                {
                    IC = conda.GetString(0);
                    IC卡对应姓名 = conda.GetString(1);
                    IC卡对应班级 = conda.GetString(2);
                }
                conda.Close();

                string ClearanceSql2 = "SELECT 上午到校时间,下午到校时间 FROM 到校时间";
                SqlCommand cons2 = new SqlCommand(ClearanceSql2, con);
                SqlDataReader conda2 = cons2.ExecuteReader();
                while (conda2.Read())
                {
                    上午到校时间 = conda2.GetDateTime(0);
                    下午到校时间 = conda2.GetDateTime(1);
                }
                conda2.Close();

                if (IC != "")
                {
                    string updata;

                    bool 是否迟到 = false;

                    DateTime Time = DateTime.Now;





                    if ((Time.TimeOfDay > 上午到校时间.AddMinutes(-30).TimeOfDay) && (Time.TimeOfDay < 上午到校时间.AddMinutes(30).TimeOfDay))
                    //早上查迟到
                    {
                        if (Time.TimeOfDay > 上午到校时间.TimeOfDay)
                        {
                            是否迟到 = true;
                        }


                        updata = "INSERT INTO 班级签到 (IC卡编号,进入时间,姓名,班级,是否迟到) VALUES ('" + IC + "', '" + DateTime.Now + "','" + IC卡对应姓名 + "','" + IC卡对应班级 + "','" + 是否迟到 + "')";
                        SqlCommand Command1 = new SqlCommand();
                        Command1.Connection = con;
                        Command1.CommandText = updata;
                        Command1.CommandType = CommandType.Text;
                        Command1.ExecuteNonQuery();

                        if (是否迟到 == false)
                        {
                            Label1.Text = "学生进入";
                        }
                        else
                        {
                            Label1.Text = "对不起,您已迟到!";
                        }
                    }

                    else if ((Time.TimeOfDay > 下午到校时间.AddMinutes(-30).TimeOfDay) && (Time.TimeOfDay < 下午到校时间.AddMinutes(30).TimeOfDay))
                    //中午查迟到
                    {
                        if (Time.TimeOfDay > 下午到校时间.TimeOfDay)
                        {
                            是否迟到 = true;
                        }


                        updata = "INSERT INTO 班级签到 (IC卡编号,进入时间,姓名,班级,是否迟到) VALUES ('" + IC + "', '" + DateTime.Now + "','" + IC卡对应姓名 + "','" + IC卡对应班级 + "','" + 是否迟到 + "')";
                        SqlCommand Command1 = new SqlCommand();
                        Command1.Connection = con;
                        Command1.CommandText = updata;
                        Command1.CommandType = CommandType.Text;
                        Command1.ExecuteNonQuery();

                        if (是否迟到 == false)
                        {
                            Label1.Text = "学生进入";
                        }
                        else
                        {
                            Label1.Text = "对不起,您已迟到!";
                        }
                    }

                    else
                    {

                        Response.Clear();
                        Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,现在不是签到时间!');</script>");
                        Response.Flush();
                        Response.End();
                    }


                }
                else
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>top.location='../icerror.aspx?num=" + TextBox1.Text + ";</script>");
                    Response.Flush();
                    Response.End();    
                }
                
            }
            else
            
            {
                Label1.Text = "请刷卡！";
            }
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }

        TextBox1.Text = "";

        Page.Form.DefaultFocus = TextBox1.UniqueID;
    }
}
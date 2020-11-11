using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionRecommendedSM_RMsingin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["职务"].ToString() == "45")
        {
            signin.Visible = false;
            set.Visible = true;
        }

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != null)
        {
            string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ClubConnectionString);
            con.Open();
            try
            {

                string read = "";

                SqlCommand cons = new SqlCommand("SELECT 地点 FROM 保送生IP地址 WHERE IP = '" + Request.UserHostAddress.ToString()+"'", con);
                SqlDataReader conda = cons.ExecuteReader();
                while (conda.Read())
                {
                    read = conda.GetString(0);
                }
                conda.Close();
                if (read != "")
                {
                    string upclubdata;
                    upclubdata = "INSERT INTO 保送生IP地址 (地点,IP) VALUES ('" + TextBox1.Text + "', '" + Request.UserHostAddress.ToString() + "')";
                    SqlCommand Command1 = new SqlCommand();
                    Command1.Connection = con;
                    Command1.CommandText = upclubdata;
                    Command1.CommandType = CommandType.Text;
                    Command1.ExecuteNonQuery();

                    Response.Clear();
                    Response.Write(" <script language='javascript'+>location.reload();alert('设置成功!');</script>");
                    Response.Flush();
                    Response.End();  
                }
                else
                {
                    string upclubdata;
                    upclubdata = "UPDATE 保送生IP地址 SET 地点='" + TextBox1.Text + "' WHERE IP='" + Request.UserHostAddress.ToString() + "'"; 
                    SqlCommand Command1 = new SqlCommand();
                    Command1.Connection = con;
                    Command1.CommandText = upclubdata;
                    Command1.CommandType = CommandType.Text;
                    Command1.ExecuteNonQuery();

                    Response.Clear();
                    Response.Write(" <script language='javascript'+>location.reload();alert('设置成功!');</script>");
                    Response.Flush();
                    Response.End();  
                }
            }
            finally
            {
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
            
                }
            }
        }
        

    }
    protected void 确定_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string ClearanceSql, IC = "", IC卡对应姓名 = "", IC卡对应班级 = "";
            if (TextBox1.Text.ToString().Length == 10)
            {
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
                if (IC == "")
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>location='../icerror.aspx?num=" + TextBox1.Text + ";</script>");
                    Response.Flush();
                    Response.End();
                }
                else
                {

                    string 读取的="";

                    cons = new SqlCommand("SELECT 姓名 FROM 保送生追踪 WHERE IC卡号 ='"+IC+"'", con);
                    conda = cons.ExecuteReader();
                    while (conda.Read())
                    {
                        读取的 = conda.GetString(0);
                    }

                    string place="";
                    cons = new SqlCommand("SELECT 地点 FROM 保送生IP地址 WHERE IP ='" + Request.UserHostAddress.ToString() + "'", con);
                    conda = cons.ExecuteReader();
                    while (conda.Read())
                    {
                        place = conda.GetString(0);
                    }

                    conda.Close();
                    if (place == "")
                    {
                        place = Request.UserHostAddress.ToString();
                    }

                    if (读取的 == "")
                    {
                        string upclubdata;
                        upclubdata = "INSERT INTO 保送生追踪 (姓名,签到地点,时间,IC卡号) VALUES ('" + IC卡对应姓名 + "', '" + place + "', '" + DateTime.Now + "','" + IC + "')";
                        SqlCommand Command1 = new SqlCommand();
                        Command1.Connection = con;
                        Command1.CommandText = upclubdata;
                        Command1.CommandType = CommandType.Text;
                        Command1.ExecuteNonQuery();
                    }
                    else
                    {
                        string upclubdata;
                        upclubdata = "UPDATE 保送生追踪 SET 姓名='" + IC卡对应姓名 + "',签到地点='" + place + "',时间='" + DateTime.Now + "',IC卡号='" + IC + "'";
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
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();

                Response.Clear();
                Response.Write(" <script language='javascript'+>location.reload();alert('操作成功!');</script>");
                Response.Flush();
                Response.End();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string consql = "SELECT 签到地点,时间 FROM 保送生追踪 WHERE 姓名 ='" + TextBox3.Text + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        string 签到地点 = "", 时间=""; ;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            签到地点 = conda.GetString(0);
            时间 = conda.GetString(1);
        }

        con.Close();
        if (签到地点 == "")
        {
            签到地点 = "暂无此人信息";
        }
        else
        {
            签到地点 = "此人于" + 时间 + "在" + 签到地点 + "签到";
        }
        Label1.Text = 签到地点;
    }
}
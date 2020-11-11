using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;

public partial class FunctionScores_FrameOfTeachers : System.Web.UI.Page
{
    public DateTime qishiriqi = new DateTime();
    public DateTime jieshuriqi = new DateTime();
    public METHODS MT = new METHODS();
    public string SQLOFCLASS = "", 用户年级 = "", 用户班级 = "", SQLOFDEP = "";//="SELECT 扣分时间,扣分原因,备注,宿舍编号,扣分数 FROM 扣分 WHERE 是否有效='True' AND 扣分部门='信息部' AND 班级='14班'";
    public float 学习扣分 = 0, 公物扣分=0, 体育扣分 = 0, 文艺扣分 = 0, 自律扣分 = 0, 卫生扣分 = 0, 男宿扣分 = 0, 监察扣分 = 0, 生活扣分 = 0, 女宿扣分 = 0, 信息扣分 = 0, 宣传扣分 = 0, 主席扣分 = 0;
    string[] c;
    public string[] CLASSSCORESUM = new string[20];
    public bool SB = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT [扣分数], [扣分原因], [扣分时间], [宿舍编号], [备注] FROM [扣分] WHERE 年级='" + Session["年级名"] + "' AND 班级='" + Session["年级名"] + "'";
        if (Session["职务"].ToString() == "2")
        {
            SB = true;
        }
        else if (Session["职务"].ToString() == "4")
        {

            用户班级 = Session["班级名"].ToString();
            
        }
        SQLOFCLASS = "SELECT 扣分部门,扣分数,扣分时间 FROM 扣分 WHERE 是否有效='True' AND 年级='" + Session["年级名"] + "'";
    }
    protected void 学习部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 体育部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 文艺部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 自律部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 卫生部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 男宿部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 监察部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 生活部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 女宿部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 宣传部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 信息部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void 主席团_Click(object sender, EventArgs e)
    {

        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void GO_Click(object sender, EventArgs e)
    {
        TABLE.Visible = true; GET.Visible = false;//可有可无= =



        Session["qishiriqi"] = qishiriqi = 起始日期.SelectedDate;
        Session["jieshuriqi"] = jieshuriqi = 结束日期.SelectedDate.AddDays (1);
        if (qishiriqi.ToString().StartsWith("0") || jieshuriqi.ToString().StartsWith("0"))
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>alert('请确定选择了起始日期和查询日期.');</script>");
            Response.Flush();
            Response.End();
        }
    }
    protected void 投诉LB_Click(object sender, EventArgs e)
    {
        GET.Visible = false;
        TABLE.Visible = false;
        DETAIL.Visible = false;
        投诉DIV.Visible = true;

    }
    protected void 投诉BT_Click(object sender, EventArgs e)
    {
        string str = 投诉IDTB.Text;
        string NUMBER = ""; string upclubdata;
        if (str == "")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>alert('ID错误！');</script>");
            Response.Flush();
            Response.End();
        }
        else
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
            {
                con.Open();
                SqlCommand sqlcom = new SqlCommand("SELECT 扣分部门代号 FROM 扣分 WHERE ID ='" + str + "'", con);
                SqlDataReader conda = sqlcom.ExecuteReader();
                while (conda.Read())
                {
                    NUMBER = conda.GetString(0);
                }
                conda.Close();
            }


            using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
            {
                con2.Open();
                SqlCommand sqlcom = new SqlCommand("SELECT 用户名 FROM 用户 WHERE 部门='" + NUMBER + "'", con2);
                SqlDataReader conda = sqlcom.ExecuteReader();
                
                string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
                SqlConnection con = new SqlConnection(ClubConnectionString);
                con.Open();
                SqlCommand Command1 = new SqlCommand();
                while (conda.Read())
                {
                    upclubdata = "INSERT INTO 消息 (发起人,收件人,内容,日期) VALUES ('" + "12sunlin" + "', '" + conda.GetString(0) + "', '您部门的量化遭到了" + Session["名字"] + "投诉,ID 为" + NUMBER + "。请查询。', '" + DateTime.Now + "')";
                    Command1.Connection = con;
                    Command1.CommandText = upclubdata;
                    Command1.CommandType = CommandType.Text;
                    if (Command1.ExecuteNonQuery() > 0)
                    {
                        Response.Clear();
                        Response.Write(" <script language='javascript'+>location='outbox.aspx';alert('投诉信息发送成功!');</script>");
                        Response.Flush();
                        Response.End();
                    }
                    con.Close();
                }
                con2.Close();
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
            {
                con.Open();
                SqlCommand sqlcom = new SqlCommand("UPDATE 扣分 SET 投诉='True' WHERE ID ='" + str + "'", con);
                if(sqlcom.ExecuteNonQuery()<=0)
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>location='outbox.aspx';alert('投诉消息记录失败');</script>");
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
    protected void 公物部_Click(object sender, EventArgs e)
    {
        TABLE.Visible = false;
        DETAIL.Visible = true;
        详情部门.Text = METHODS.GETLBTEXT(sender);
        SQLOFDEP = METHODS.GETDETAIL(详情部门.Text, 用户班级) + " AND 年级='" + Session["年级名"] + "'";
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        GridView2.Visible = (bool)checkbox_domiscore.Checked;
        GridView3.Visible = (bool)checkbox_domiscore.Checked;
    }
}
public class METHODS
{
    public static string GETLBTEXT(object o)
    {
        LinkButton lb = new LinkButton();
        lb = (LinkButton)o;
        return lb.Text;
    }
    public static string GETDETAIL(string 部门, string 用户班级)
    {
        return "SELECT 扣分时间,扣分原因,备注,宿舍编号,扣分数,ID FROM 扣分 WHERE 是否有效='True' AND 扣分部门='" + 部门 + "' AND 班级='" + 用户班级 + "' AND 是否有效='True'";
        /////////////////////////
    }
    public SqlDataReader SQLStr(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        string SQLstr;
        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        return SQLCom.ExecuteReader();
    }
    public bool SQLBol(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();

        string SQLstr;

        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        bool a = (bool)SQLCom.ExecuteScalar();
        return a;
    }
    public int SQLInt(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();

        string SQLstr;

        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        int a = (int)SQLCom.ExecuteScalar();
        return a;

    }
    public double SQLFlo(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();

        string SQLstr;

        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        double a = (double)SQLCom.ExecuteScalar();
        return a;

    }
    public static SqlDataReader SQLREADER(string sql)
    {
        string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(Main1ConnectionString);
        con.Open();
        SqlCommand cons = new SqlCommand(sql, con);
        SqlDataReader conda = cons.ExecuteReader();
        return conda;
    }
    public static string GetClass(string str)
    {
        string Class = "";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
        {
            con.Open();
            SqlCommand sqlcom = new SqlCommand(str, con);
            SqlDataReader reader = sqlcom.ExecuteReader();
            while (reader.Read())
            {
                Class = reader.GetString(0);
            }
            con.Close();
        }
        return Class;
    }
    public static int GETMAX(string [] s)
    {
        float F=0,now;
        int CLASS = 0;
        for (int i = 0; i < s.Length; i++) 
        {
            now=Convert.ToSingle(s[i]);
            if (F < now) 
            {
                F = now;
                CLASS = i;
            }

        }
        return CLASS;
    }
}
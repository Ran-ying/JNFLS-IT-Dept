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

public partial class DormSpecial : System.Web.UI.Page
{
    public string JOB = "";
    public DateTime begin ,end;
    public bool allgrade = false, onegrade = true;
    public string SQL="";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 权限判断
        JOB=Session["职务"].ToString();
        string SQL = "Select 全年级量化 FROM 权限表 where 职务='"+JOB+"'";
        allgrade = DATA.GetBool(SQL);
        SQL = "Select 本年级量化 FROM 权限表 where 职务='" + JOB + "'";
        onegrade = DATA.GetBool(SQL);
        if (onegrade)
        {
            GRADE.Visible = false;
            ONEGRADE.Visible = true;
            ONEGRADE.Text = Session["年级名"].ToString();
        }
        else 
        {
            if (allgrade == false) 
            {
                Response.Clear();
                Response.Write(" <script language='javascript'>alert('对不起您不能使用这种查询！有疑问请咨询信息技术部');</script>");
                Response.Flush();
                Response.End();
                //Response.Redirect("http://192.168.0.168/FunctionScores/FrameOfTeachers.aspx");
                //HERE---change the address
            }
        }
#endregion
    }
    protected void SUBMIT_Click(object sender, EventArgs e)
    {
        SQL = "SELECT 扣分数 FROM 扣分 WHERE 是否有效='True' AND (扣分部门='男宿部' OR 扣分部门='女宿部')";
        SEARCH.Visible = false;
        TABLE.Visible = true;
        //===================读取日期========================
        begin = BEGINTIME.SelectedDate;
        end = ENDTIME.SelectedDate;
        if (begin.ToString().StartsWith("0") || end.ToString().StartsWith("0"))
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>alert('请确定选择了起始日期和查询日期.');</script>");
            Response.Flush();
            Response.End();
        }
        else 
        {
            SQL += "AND (扣分时间 BETWEEN '"+begin.ToString()+"' AND '"+end.ToString()+"')";
        }
        //===================读取年级========================
        if (allgrade)
        {
            SQL += (GRADE.SelectedValue=="全部"?"":"AND 年级='" + GRADE.SelectedValue+ "'") ;
        }
        else 
        {
            SQL+="AND 年级='"+ONEGRADE.Text+"'";
        }
        //===================读取类型=======================
        if (JILV.Checked && WEISHENG.Checked) 
        {
            SQL += "AND (扣分原因 like '纪律%' or 扣分原因 like '卫生%')";
        }
        else
        {
            if (JILV.Checked && WEISHENG.Checked == false) 
            {
                SQL += "AND 扣分原因 like '纪律%'";
            }
            if (JILV.Checked== false && WEISHENG.Checked )
            {
                SQL += "AND 扣分原因 like '卫生%'";
            }
            if (JILV.Checked == false && WEISHENG.Checked == false) 
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location.reload();alert('未选择类型!');</script>");
                Response.Flush();
                Response.End();
            }
        }
    }
}
class DATA 
{
    public static int Write(string str)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
        {
            int i = 0;
            con.Open();
            SqlCommand cons = new SqlCommand(str, con);
            i = cons.ExecuteNonQuery();
            con.Close();
            return i;
        }
    }
    public static string GetOneString(string str)
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
    public static bool GetBool(string str)
    {
        bool b= false;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
        {
            con.Open();
            SqlCommand sqlcom = new SqlCommand(str, con);
            SqlDataReader reader = sqlcom.ExecuteReader();
            while (reader.Read())
            {
                b = reader.GetBoolean(0);
            }
            con.Close();
        }
        return b;
    }
}
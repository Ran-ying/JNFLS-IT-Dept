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
using System.Collections;

public partial class FunctionBroadcast_Default : System.Web.UI.Page
{

    public ArrayList A申请人 = new ArrayList();
    public ArrayList A申请状态 = new ArrayList();
    public ArrayList A申请时间 = new ArrayList();
    public ArrayList A播报时间 = new ArrayList();
    public ArrayList A播报时间2 = new ArrayList();
    public ArrayList A已播报 = new ArrayList();
    public ArrayList A内容 = new ArrayList();
    public ArrayList A主键 = new ArrayList();
    public int cont = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        string consql = "SELECT 审批广播 FROM 权限表 WHERE 职务 ='" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 审批广播Bol = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            审批广播Bol = conda.GetBoolean(0);
        }
                con.Close();
        if (审批广播Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有此权限!');</script>");
            Response.Flush();
            Response.End();
        }
       
        string consql2 = "SELECT 申请人,申请状态,申请时间,播报时间,播报时间2,已播报,内容,ID FROM 广播 WHERE 播报时间2 ='" + DateTime.Now.Date.ToString() + "'ORDER BY 申请时间 DESC";
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con2.Open();

        

        SqlCommand cons2 = new SqlCommand(consql2, con2);
        SqlDataReader conda2 = cons2.ExecuteReader();
        while (conda2.Read())
        {
            A申请人.Add(conda2.GetString(0));
            A申请状态.Add(conda2.GetBoolean(1));
            A申请时间.Add(conda2.GetDateTime(2));
            A播报时间.Add(conda2.GetString(3));
            A播报时间2.Add(conda2.GetDateTime(4));
            A已播报.Add(conda2.GetBoolean(5));
            A内容.Add(conda2.GetString(6));
            A主键.Add(conda2.GetInt32(7));
            cont++;
        }

        con2.Close();
        if (cont == 0)
        {
            播报时间.Text = "~~~今日暂无广播~~~";
            上一条.Visible = false;
            下一条.Visible = false;
        }
        else 
        {
            int sum = (int)Session["sum"];

            String[] A申请人A = (String[])A申请人.ToArray(typeof(String));
            DateTime[] A申请时间A = (DateTime[])A申请时间.ToArray(typeof(DateTime));
            Boolean[] A申请状态A = (Boolean[])A申请状态.ToArray(typeof(Boolean));
            String[] A播报时间A = (String[])A播报时间.ToArray(typeof(String));
            DateTime[] A播报时间2A = (DateTime[])A播报时间2.ToArray(typeof(DateTime));
            Boolean[] A已播报A = (Boolean[])A已播报.ToArray(typeof(Boolean));
            String[] A内容A = (String[])A内容.ToArray(typeof(String));


            申请人.Text = A申请人A[sum].ToString();
            申请时间.Text = A申请时间A[sum].ToString();
            播报时间.Text = A播报时间A[sum].ToString() + "( "+ A播报时间2A[sum].ToShortDateString().ToString() + " )";
            if (A申请状态A[sum] == true)
            { 申请状态.Text = "已通过"; }
            else 
            { 申请状态.Text = "未通过"; }
            if (A已播报A[sum] == true)
            { 申请状态.Text = "已播报"; }
            广播内容.Text = A内容A[sum];
        }
        条数.Text = cont.ToString();
        条数0.Text = ((int)Session["sum"] + 1).ToString() ;
    }

    protected void 上一条_Click(object sender, EventArgs e)
    {
        if ((int)Session["sum"] < 0)
        {
            Session["sum"] = 0;
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是第一条');</script>");
            Response.Flush();
            Response.End();
        }
        else
        {
            Session["sum"] = (int)Session["sum"] - 1;
            int sum = (int)Session["sum"];

            String[] A申请人A = (String[])A申请人.ToArray(typeof(String));
            DateTime[] A申请时间A = (DateTime[])A申请时间.ToArray(typeof(DateTime));
            Boolean[] A申请状态A = (Boolean[])A申请状态.ToArray(typeof(Boolean));
            String[] A播报时间A = (String[])A播报时间.ToArray(typeof(String));
            DateTime[] A播报时间2A = (DateTime[])A播报时间2.ToArray(typeof(DateTime));
            Boolean[] A已播报A = (Boolean[])A已播报.ToArray(typeof(Boolean));
            String[] A内容A = (String[])A内容.ToArray(typeof(String));

            try
            {
                申请人.Text = A申请人A[sum].ToString();
                申请时间.Text = A申请时间A[sum].ToString();
                播报时间.Text = A播报时间A[sum].ToString() + "( " + A播报时间2A[sum].ToShortDateString().ToString() + " )";
                if (A申请状态A[sum] == true)
                { 申请状态.Text = "已通过"; }
                else
                { 申请状态.Text = "未通过"; }
                if (A已播报A[sum] == true)
                { 申请状态.Text = "已播报"; }
                广播内容.Text = A内容A[sum];
            }
            
            catch 
            {
                Session["sum"] = 0;
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是第一条');</script>");
                Response.Flush();
                Response.End();
            }
            条数0.Text = ((int)Session["sum"] + 1).ToString();
        }
    }
    protected void 下一条_Click(object sender, EventArgs e)
    {
        if ((int)Session["sum"] > cont-1)
        {
            Session["sum"] = cont - 1;
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是最后一条');</script>");
            Response.Flush();
            Response.End();
        }
        else
        {
            Session["sum"] = (int)Session["sum"] + 1;
            int sum = (int)Session["sum"];

            String[] A申请人A = (String[])A申请人.ToArray(typeof(String));
            DateTime[] A申请时间A = (DateTime[])A申请时间.ToArray(typeof(DateTime));
            Boolean[] A申请状态A = (Boolean[])A申请状态.ToArray(typeof(Boolean));
            String[] A播报时间A = (String[])A播报时间.ToArray(typeof(String));
            DateTime[] A播报时间2A = (DateTime[])A播报时间2.ToArray(typeof(DateTime));
            Boolean[] A已播报A = (Boolean[])A已播报.ToArray(typeof(Boolean));
            String[] A内容A = (String[])A内容.ToArray(typeof(String));

            try
            {
                申请人.Text = A申请人A[sum].ToString();
                申请时间.Text = A申请时间A[sum].ToString();
                播报时间.Text = A播报时间A[sum].ToString() + "( " + A播报时间2A[sum].ToShortDateString().ToString() + " )";
                if (A申请状态A[sum] == true)
                { 申请状态.Text = "已通过"; }
                else
                { 申请状态.Text = "未通过"; }
                if (A已播报A[sum] == true)
                { 申请状态.Text = "已播报"; }
                广播内容.Text = A内容A[sum];
            }
            catch
            {
                Session["sum"] = 0;
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是最后一条');</script>");
                Response.Flush();
                Response.End();
            }
            条数0.Text = ((int)Session["sum"] + 1).ToString();
        }
    }
    protected void 提交_Click(object sender, EventArgs e)
    {
        int[] A主键A = (int[])A主键.ToArray(typeof(int));
        int sum = (int)Session["sum"];

        string consql = "SELECT 申请状态,已播报 FROM 广播 WHERE ID =" + A主键A[sum];
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool TorF = false,播报 = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            TorF = conda.GetBoolean(0);
            播报 = conda.GetBoolean(1);
        }
        conda.Close();

        if (播报 != true)
        {
            if (TorF == true)
            {
                string updata;
                updata = "UPDATE 广播 SET 申请状态 = 'false' WHERE ID = " + A主键A[sum];
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con;
                Command1.CommandText = updata;
                Command1.CommandType = CommandType.Text;
                Command1.ExecuteNonQuery();
            }
            else
            {
                string updata;
                updata = "UPDATE 广播 SET 申请状态 = 'true' WHERE ID = " + A主键A[sum];
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con;
                Command1.CommandText = updata;
                Command1.CommandType = CommandType.Text;
                Command1.ExecuteNonQuery();
            }
            con.Close();
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('操作成功！');</script>");
            Response.Flush();
            Response.End();
        }
        else 
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前广播已播出！');</script>");
            Response.Flush();
            Response.End();
        }
        
    }
}
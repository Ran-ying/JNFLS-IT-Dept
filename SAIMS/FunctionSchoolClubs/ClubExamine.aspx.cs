using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class FunctionSchoolClubs_Default : System.Web.UI.Page
{
    public ArrayList A预约社团 = new ArrayList();
    public ArrayList A预约场地 = new ArrayList();
    public ArrayList A预约时间 = new ArrayList();
    public ArrayList A申请状态 = new ArrayList();
    public ArrayList A理由 = new ArrayList();
    public ArrayList A主键 = new ArrayList();

    public int cont = 0;


    protected void Page_Load(object sender, EventArgs e)
    {
     

        string consql = "SELECT 社团场地审批 FROM 权限表 WHERE 职务 ='" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 社团场地审批Bol = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            社团场地审批Bol = conda.GetBoolean(0);
        }
        conda.Close();
        con.Close();
        if (社团场地审批Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有此权限!');</script>");
            Response.Flush();
            Response.End();
        }

        string consql2 = "SELECT 预约社团,预约场地,预约时间,审批,申请内容,ID FROM 预约 WHERE 预约时间 <'" + DateTime.Now.Date.AddDays(7).ToString() + "'ORDER BY 预约时间 ";
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con2.Open();

        SqlCommand cons2 = new SqlCommand(consql2, con2);
        SqlDataReader conda2 = cons2.ExecuteReader();
        while (conda2.Read())
        {
            A预约社团.Add(conda2.GetString(0));
            A预约场地.Add(conda2.GetBoolean(1));
            A预约时间.Add(conda2.GetDateTime(2));
            A申请状态.Add(conda2.GetString(3));
            A理由.Add(conda2.GetDateTime(4));
            A主键.Add(conda2.GetInt32(5));

            cont++;
        }
        conda2.Close();
        con2.Close();
        if (cont == 0)
        {
            预约时间.Text = "七天内没有申请~";
        }
        else
        {
            int sum = (int)Session["clubsum"];

            String[] A预约社团A = (String[])A预约社团.ToArray(typeof(String));
            String[] A预约场地A = (String[])A预约场地.ToArray(typeof(String));
            DateTime[] A预约时间A = (DateTime[])A预约时间.ToArray(typeof(DateTime));
            Boolean[] A申请状态A = (Boolean[])A申请状态.ToArray(typeof(Boolean));
            String[] A理由A = (String[])A理由.ToArray(typeof(String));

            预约社团.Text = A预约社团A[sum].ToString();
            预约场地.Text = A预约场地A[sum].ToString();
            预约时间.Text = A预约时间A[sum].ToString();
            申请状态.Text = A申请状态A[sum].ToString();
            理由.Text = A理由A[sum].ToString();
        }
        Label2.Text = cont.ToString();
        Label3.Text = ((int)Session["clubsum"] + 1).ToString();
    }

    protected void 上一页_Click(object sender, EventArgs e)
    {
        if ((int)Session["clubsum"] < 0)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是第一条');</script>");
            Response.Flush();
            Response.End();
        }
        else
        {
            Session["clubsum"] = (int)Session["clubsum"] - 1;
            int sum = (int)Session["clubsum"];

            String[] A预约社团A = (String[])A预约社团.ToArray(typeof(String));
            String[] A预约场地A = (String[])A预约场地.ToArray(typeof(String));
            DateTime[] A预约时间A = (DateTime[])A预约时间.ToArray(typeof(DateTime));
            Boolean[] A申请状态A = (Boolean[])A申请状态.ToArray(typeof(Boolean));
            String[] A理由A = (String[])A理由.ToArray(typeof(String));

            try
            {

                预约社团.Text = A预约社团A[sum].ToString();
                预约场地.Text = A预约场地A[sum].ToString();
                预约时间.Text = A预约时间A[sum].ToString();
                申请状态.Text = A申请状态A[sum].ToString();
                理由.Text = A理由A[sum].ToString();
            }

            catch
            {
                Session["clubsum"] = 0;
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是第一条');</script>");
                Response.Flush();
                Response.End();
            }
            Label3.Text = ((int)Session["clubsum"] + 1).ToString();
        }
    }
    protected void 下一页_Click(object sender, EventArgs e)
    {
        if ((int)Session["clubsum"] > cont - 1)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是第一条');</script>");
            Response.Flush();
            Response.End();
        }
        else
        {
            Session["clubsum"] = (int)Session["clubsum"] + 1;
            int sum = (int)Session["clubsum"];

            String[] A预约社团A = (String[])A预约社团.ToArray(typeof(String));
            String[] A预约场地A = (String[])A预约场地.ToArray(typeof(String));
            DateTime[] A预约时间A = (DateTime[])A预约时间.ToArray(typeof(DateTime));
            Boolean[] A申请状态A = (Boolean[])A申请状态.ToArray(typeof(Boolean));
            String[] A理由A = (String[])A理由.ToArray(typeof(String));

            try
            {

                预约社团.Text = A预约社团A[sum].ToString();
                预约场地.Text = A预约场地A[sum].ToString();
                预约时间.Text = A预约时间A[sum].ToString();
                申请状态.Text = A申请状态A[sum].ToString();
                理由.Text = A理由A[sum].ToString();
            }

            catch
            {
                Session["clubsum"] = cont - 1;
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('当前已是第一条');</script>");
                Response.Flush();
                Response.End();
            }
            Label3.Text = ((int)Session["clubsum"] + 1).ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         int sum = (int)Session["clubsum"];
         int[] A主键A = (int[])A主键.ToArray(typeof(int));

         string consql2 = "SELECT 审批 FROM 预约 WHERE ID =" + A主键A[sum].ToString();
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con2.Open();

        bool TorF = false;
        SqlCommand cons2 = new SqlCommand(consql2, con2);
        SqlDataReader conda2 = cons2.ExecuteReader();
        while (conda2.Read())
        {
            TorF = conda2.GetBoolean(0);
        }

        if (TorF)
        {
            string updata;
            updata = "UPDATE 广播 SET 申请状态 = 'false' WHERE ID = " + A主键A[sum];
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con2;
            Command1.CommandText = updata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
        }
        else 
        {
            string updata;
            updata = "UPDATE 广播 SET 申请状态 = 'true' WHERE ID = " + A主键A[sum];
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con2;
            Command1.CommandText = updata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
        }
        conda2.Close();
        con2.Close();
        Response.Clear();
        Response.Write(" <script language='javascript'+>location='managebroadcast.aspx';alert('操作成功！');</script>");
        Response.Flush();
        Response.End();
    }
}
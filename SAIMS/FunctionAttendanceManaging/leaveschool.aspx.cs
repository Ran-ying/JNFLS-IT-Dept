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


        string consql = "SELECT 离校申请,离校管理 FROM 权限表 WHERE 职务 =" + Session["职务"];
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 离校申请Bol = false, 离校管理Bol = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            离校申请Bol = conda.GetBoolean(0);
            离校管理Bol = conda.GetBoolean(1);
        }

        con.Close();

        刷卡离校.Visible = false;
        离校审批.Visible = false;
        GridView1.Visible = false;

        if (离校申请Bol == false && 离校管理Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='/jssm/index.aspx';alert('对不起,您没有此项操作权限!');</script>");
            Response.Flush();
            Response.End();
        }

        else if (离校申请Bol == false && 离校管理Bol == true)
        {
            离校审批.Visible = true;
            GridView1.Visible = true;
            标题.Text = "审批离校人员";
        }

        else if (离校申请Bol == true && 离校管理Bol == false)
        {
            刷卡离校.Visible = true;
            Page.Form.DefaultButton = 确定.UniqueID;

            string id=Request.QueryString["id"];
            if (id=="fini")
            {
                  reason.Visible = true;
                刷卡离校.Visible = false;
            }
            else if (id == "view")
            {
                刷卡离校.Visible = false;
                reason.Visible = false;
                view_.Visible = true;
            }
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

            if (TextBox1.Text.ToString().Length == 10 )
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
                Response.Write(" <script language='javascript'+>location='../icerror.aspx?num=" + TextBox1.Text + "';</script>");
                Response.Flush();
                Response.End();    
            }


        

                string selectsql = "SELECT 姓名 FROM 离校申请 WHERE IC卡编号='" + IC + "' AND 申请状态 = 'false'";
                SqlCommand cons2 = new SqlCommand(selectsql, con);
                SqlDataReader conda2 = cons2.ExecuteReader();

                string 姓名是否为空 = "";

                while (conda2.Read())
                {
                    姓名是否为空 = conda2.GetString(0);
                }

                conda2.Close();

                if (姓名是否为空 == "")
                {


                    string updata = "INSERT INTO 离校申请 (IC卡编号,申请时间,姓名,班级) VALUES ('" + IC + "', '" + DateTime.Now + "','" + IC卡对应姓名 + "','" + IC卡对应班级 + "')";
                    SqlCommand Command1 = new SqlCommand();
                    Command1.Connection = con;
                    Command1.CommandText = updata;
                    Command1.CommandType = CommandType.Text;
                    Command1.ExecuteNonQuery();


                    Response.Clear();
                    Response.Write(" <script language='javascript'+>location='LEAVESCHOOL.aspx?id=fini';</script>");
                    Response.Flush();
                    Response.End();
                }
                else
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>top.location='leaveschool.aspx?id=view;</script>");
                    Response.Flush();
                    Response.End();    
                }

            }
            else
            {
                Label1.Text = "请直接刷卡!";
                TextBox1.Text = "";

                Page.Form.DefaultFocus = TextBox1.UniqueID;
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
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void 查看申请_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;


    }
    protected void 申请批准_Click(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void 确定0_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            upclubdata = "UPDATE 离校申请 SET 类型 = '"+DropDownList1.SelectedValue+"' ,理由 = '"+reason0.Text+"' WHERE 姓名 = '"+Session["名字"]+"AND 申请状态 = 'false'";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

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
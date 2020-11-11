using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionAttendanceManaging_Doctorview : System.Web.UI.Page
{
    string ClearanceSql, IC = "", IC卡对应姓名 = "", IC卡对应班级 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       /* if (Session["职务"].ToString() != "53")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有权限!');</script>");
            Response.Flush();
            Response.End();
        }*/
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
           
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
                    Response.Write(" <script language='javascript'+>location='../icerror.aspx?num=" + TextBox1.Text + "';</script>");
                    Response.Flush();
                    Response.End();
                }
            }
            else
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location.reload();alert('请刷卡!');</script>");
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
        controltr.Visible = true;
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {

          
                    
                    string upclubdata;
                    upclubdata = "INSERT INTO 校医登记 (姓名,班级,时间,症状,用药,金额) VALUES ('" + IC卡对应姓名 + "', '" + IC卡对应班级 + "', '" + DateTime.Now + "','"+zheng.Text+"','"+yao.Text+"','"+jin.Text+"')";
                    SqlCommand Command1 = new SqlCommand();
                    Command1.Connection = con;
                    Command1.CommandText = upclubdata;
                    Command1.CommandType = CommandType.Text;
                    Command1.ExecuteNonQuery();
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>location='doctorview.aspx';alert('操作成功!');</script>");
                    Response.Flush();
                    Response.End();
                
            
          
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
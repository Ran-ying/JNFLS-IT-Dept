
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionRecommendedSM_Achievements : System.Web.UI.Page
{
    int applyID = 0;
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
        conda.Close();
        con.Close();
        if (审批广播Bol == true)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='examine.aspx'</script>");
            Response.Flush();
            Response.End();
        }

        consql = "SELECT ID FROM 保送生总目标 WHERE 申请者 ='" + Session["名字"] + "'";
        con.Open();

        bool 有记录 = false;

        cons = new SqlCommand(consql, con);
        conda = cons.ExecuteReader();
        while (conda.Read())
        {
            有记录 = true;
            applyID = conda.GetInt32(0);
        }

        con.Close();

        if (有记录 == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='Start.aspx'</script>");
            Response.Flush();
            Response.End();
        }

    }
    protected void updata_Click(object sender, EventArgs e)
    {
          if (TextBox1.Text != null & TextBox2.Text != null & DropDownList1.SelectedValue != null)
        {
            string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ClubConnectionString);
            con.Open();
            try
            {
                bool TorF = true;
                if (DropDownList1.SelectedValue == "G" || DropDownList1.SelectedValue == "F")
                    TorF = false;
                string upclubdata;
                upclubdata = "INSERT INTO 保送生分目标 (总目标ID,分类,是否审批,申报描述,是否完成,申请者,标题) VALUES (" + applyID + ", '" + DropDownList1.SelectedValue + "', '" + TorF + "', '" + TextBox2.Text + "','False','"+Session["名字"]+"','"+TextBox1.Text +"')";
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
        else
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='achievements.aspx';alert('对不起,请输入全部信息!');</script>");
            Response.Flush();
            Response.End();
           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Clear();
        Response.Write(" <script language='javascript'+>location='list.aspx';</script>");
        Response.Flush();
        Response.End();
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionAttendanceManaging_dom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
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
                    
con.Close();

                Label1.Text = "电通有误！请在www.saims.tk/icerror.aspx申报故障。";
                }
                else
                {
                    string upclubdata;
                    upclubdata = "INSERT INTO 宿舍登记 (姓名,班级,时间) VALUES ('" + IC卡对应姓名 + "', '" + IC卡对应班级 + "', '" + DateTime.Now + "')";
                    SqlCommand Command1 = new SqlCommand();
                    Command1.Connection = con;
                    Command1.CommandText = upclubdata;
                    Command1.CommandType = CommandType.Text;
                    Command1.ExecuteNonQuery();
                }
            }
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();

                Label1.Text = "操作成功！";
            }
        }
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
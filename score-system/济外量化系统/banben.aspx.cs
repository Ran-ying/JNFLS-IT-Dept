using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace 济外量化系统
{
    public partial class banben : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //测试数据库连接
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
                con.Open();

                //版本
                string sql = "select top 1 * from 更新表 order by id desc";
                SqlCommand com = new SqlCommand(sql, con);
                SqlDataReader indda1 = com.ExecuteReader();
                if (indda1.Read())
                {
                    Label1.Text = indda1.GetString(1);
                    Label2.Text = indda1.GetString(2);
                    Label3.Text = indda1.GetString(3);
                }
                con.Close();
            }
            catch
            {
                Response.Redirect("ERROR.aspx");
            }
        }
    }
}
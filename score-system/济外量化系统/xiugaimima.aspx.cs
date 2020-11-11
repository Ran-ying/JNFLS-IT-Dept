using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace 济外量化系统
{
    public partial class xiugaimima : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql3 = "update 用户 set 密码 = @xinmima where 编码 = @yonghuming and 密码 = @mima";
                SqlCommand com3 = new SqlCommand(sql3, con);
                com3.Parameters.Add(new SqlParameter("yonghuming", TextBox1.Text));
                com3.Parameters.Add(new SqlParameter("mima", TextBox2.Text));
                com3.Parameters.Add(new SqlParameter("xinmima", TextBox3.Text));
                com3.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                string scriptstrs = "<script>alert('错误！');</script>";
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "welcome"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "welcome", scriptstrs);
                }
            }
        }
    }
}
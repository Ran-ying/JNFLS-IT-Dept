using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page {
     


    protected void Page_Load(object sender, EventArgs e) {
        
        
        

        string MessageConnectionString = ConfigurationManager.ConnectionStrings["MessageConnectionString"].ToString();
        SqlConnection con2 = new SqlConnection(MessageConnectionString);
        con2.Open();

        int i = 0, j = 0, k = 0;

        string indsql5;
        indsql5 = "SELECT ID FROM 消息 WHERE 收件人 LIKE '" + Session["usersname"] + "' AND 已读 = 'false'";
        SqlCommand indins5 = new SqlCommand(indsql5, con2);
        SqlDataReader indda5 = indins5.ExecuteReader();
        while(indda5.Read()) {
            if(indda5.GetValue(0).ToString() == "False") {
                i = 1;
                break;
                }
            }
        indda5.Close();

        indsql5 = "SELECT 名字 FROM 公告 WHERE  日期 < '" + DateTime.Now.AddDays(1).ToString() + "' AND 日期 > '" + DateTime.Now.AddDays(-1).ToString() + "'";
        indins5 = new SqlCommand(indsql5, con2);
        indda5 = indins5.ExecuteReader();
        while(indda5.Read()) {
            j = 1;
            break;
            }
        indda5.Close();

        con2.Close();

        if(i == 1 && j == 1)
            k = 1;

        if(i == 1) {
            indeximg.Src = "Images/icons/index-a.png";
            }

        if(j == 1) {
            indeximg.Src = "Images/icons/index-b.png";
            }
        if(k == 1) {
            indeximg.Src = "Images/icons/index-c.png";
            }
        }
   



    /*
    protected void Button1_Click(object sender, EventArgs e) {
        string suggest = TextBox1.Text;
        string SQL = "INSERT INTO BUG VALUES('" + Session["usersname"].ToString() + "','" + "[移动]" + suggest + "')";
        if(Write(SQL) <= 0) {
            Response.Clear();
            Response.Write(" <script language='javascript'>location.reload();alert('抱歉……服务器可能出了点差错。快去找张笑晨！');</script>");
            Response.Flush();
            Response.End();
            } else {
            Response.Clear();
            Response.Write(" <script language='javascript'>location.reload();alert('谢谢您的想法~');</script>");
            Response.Flush();
            Response.End();
            }
        }
    */
    public static int Write(string str) {
        using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString())) {
            int i = 0;
            con.Open();
            SqlCommand cons = new SqlCommand(str, con);
            i = cons.ExecuteNonQuery();
            con.Close();
            return i;
            }
        }
    }

            
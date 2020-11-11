using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class FunctionLib_Default : System.Web.UI.Page
{
    public void MsgBox(string strMsg)//======================对话框模块======================
    {
        string StrScript;
        StrScript = ("<script language=javascript>");
        StrScript += ("alert('" + strMsg + "');");
        StrScript += ("</script>");
        System.Web.HttpContext.Current.Response.Write(StrScript);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        bool TF;

        if (Session["login"] != "OK")
        {
            MsgBox("您未登录");
            Response.Redirect("../login.aspx");
        }
        else
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();
            try
            {
                string ClearanceSql;

                ClearanceSql = "SELECT 图书馆管理 FROM 权限表 WHERE 职务 = '" + Session["职务"] + "'";
                SqlCommand ClearanceSqlCommand = new SqlCommand();
                ClearanceSqlCommand.Connection = con;
                ClearanceSqlCommand.CommandText = ClearanceSql;
                ClearanceSqlCommand.CommandType = CommandType.Text;

                TF = (bool)ClearanceSqlCommand.ExecuteScalar();
            }
            finally
            {
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
            if (TF != true)
            {
                MsgBox("对不起，您无此权限！");
                Response.Redirect("../index.aspx");
            }
        }
    }
}
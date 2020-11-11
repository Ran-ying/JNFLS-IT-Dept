using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JudgeLogin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null ||
        Session["login"].ToString() != "OK"  )
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../login.aspx';alert('对不起,您未登录!');</script>");
            Response.Flush();
            Response.End();
        }
    }
}
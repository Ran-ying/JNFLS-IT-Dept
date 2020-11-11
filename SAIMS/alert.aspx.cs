using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionSchoolClubs_alert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Clear();
        Response.Write(" <script language='javascript'+>location='index.aspx';alert('对不起,该功能暂未开通!');</script>");
        Response.Flush();
        Response.End();             
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string Control1;
    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Request.QueryString["ID"];
        if (ID == "setting")
        {
            if (Session["职务"].ToString() != "45" && Session["职务"].ToString() != "46" && Session["职务"].ToString() != "47" && Session["职务"].ToString() != "48")
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='../FunctionLyric/Lyric.html';</script>");
                Response.Flush();
                Response.End();
            }
            else
            {
                content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"setting.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
            }
            }
        
     
    }
}
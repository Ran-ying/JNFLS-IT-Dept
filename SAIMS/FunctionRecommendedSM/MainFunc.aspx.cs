using System;
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
        if (ID == "a")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"achievements.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
        else if (ID == "r")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"rmsingin.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
     
    }
}
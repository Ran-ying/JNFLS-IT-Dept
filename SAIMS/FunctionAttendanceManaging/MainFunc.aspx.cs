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
        string ID = Request.QueryString["id"];
        if (ID == "leave")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"leaveschool.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
        else if(ID =="class")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"class.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
        else if (ID == "doc")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"doctorview.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
        else if (ID == "dom")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"dom.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
    }
}
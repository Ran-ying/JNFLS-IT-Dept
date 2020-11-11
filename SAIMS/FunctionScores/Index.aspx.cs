using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["职务"] != null)
        {
            if ((int)Session["职务"] == 4) 
            {

                content.InnerHtml = "<img src=\"../Images/icons/score.png\" usemap=\"#Map\"  runat=\"server\" id=\"img\"/>" +
                                 "    <map name=\"Map\" id=\"Map\">" +
                                   "  <area shape=\"rect\" coords=\"720, 0, 1000, 500\" href=\"mainfunc.aspx?id=manage\" alt=\"量化管理\"/>"+
       " <area shape=\"rect\" coords=\"0, 0, 421, 501\" href=\"mainfunc.aspx?id=input\" alt=\"量化输入\"/>" +
      "  <area shape=\"rect\" coords=\"427, 1, 711, 554\" href=\"mainfunc.aspx?id=frame\"alt=\"量化查看\" />" +
                                      "</map> ";
            }
           
            else
            {

                content.InnerHtml = "<img src=\"../Images/icons/score.png\" usemap=\"#Map\"  runat=\"server\" id=\"img\"/>" +
                                 "    <map name=\"Map\" id=\"Map\">" +
                                   "  <area shape=\"rect\" coords=\"720, 0, 1000, 500\" href=\"mainfunc.aspx?id=manage\" alt=\"量化管理\"/>" +
       " <area shape=\"rect\" coords=\"0, 0, 421, 501\" href=\"mainfunc.aspx?id=piliang\" alt=\"量化输入\"/>" +
      "  <area shape=\"rect\" coords=\"427, 1, 711, 554\" href=\"mainfunc.aspx?id=view\"alt=\"量化查看\" />" +
                                  "</map> ";
               // content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"Piliangfufen.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";   

            }

        }
    }
}

using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing.Text;

public partial class _Default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["职务"] != null)
        {
            if ( ((int)Session["职务"] == 45) ||((int)Session["职务"] == 33) || ((int)Session["职务"] == 34) || ((int)Session["职务"] == 35) || ((int)Session["职务"] == 1) || ((int)Session["职务"] == 3))
            {

                content.InnerHtml = "<img src=\"../Images/icons/st-tuanbu.png\" usemap=\"#Map\"  runat=\"server\" id=\"img\"/>" +
                                 "    <map name=\"Map\" id=\"Map\">" +
                                   "   <area shape=\"rect\" coords=\"0,0,281,500\" href=\"mainfunc.aspx?ID=show\" />" +
                                    "  <area shape=\"rect\" coords=\"290, 0, 711, 504\" href=\"mainfunc.aspx?ID=allclub\" id=\"allclub\" runat=\"server\"  />" +
                                  "    <area shape=\"rect\" coords=\"719,0,998,500\" href=\"AnnouncementList.aspx\" />" +
                                      "</map> ";
            }
            else if ((int)Session["职务"] == 49)
            {

                content.InnerHtml = "<img src=\"../Images/icons/st-shezhang.png\" usemap=\"#Map\"  runat=\"server\" id=\"img\"/>" +
                                 "    <map name=\"Map\" id=\"Map\">" +
                                   "   <area shape=\"rect\" coords=\"0,0,281,500\" href=\"mainfunc.aspx?ID=show\" />" +
                                    "  <area shape=\"rect\" coords=\"290, 0, 711, 504\" href=\"mainfunc.aspx?ID=manage\" id=\"allclub\" runat=\"server\"  />" +
                                  "    <area shape=\"rect\" coords=\"719,0,998,500\" href=\"AnnouncementList.aspx\" />" +
                                      "</map> ";
            }
            else
            {

                content.InnerHtml = "<img src=\"../Images/icons/st-users.png\" usemap=\"#Map\"  runat=\"server\" id=\"img\"/>" +
                             "    <map name=\"Map\" id=\"Map\">" +
                               "   <area shape=\"rect\" coords=\"0,0,281,500\" href=\"mainfunc.aspx?ID=show\" />" +
                                "  <area shape=\"rect\" coords=\"290, 0, 711, 504\" href=\"mainfunc.aspx?ID=MyClubs\" id=\"allclub\" runat=\"server\"  />" +
                              "    <area shape=\"rect\" coords=\"719,0,998,500\" href=\"AnnouncementList.aspx\" />" +
                                  "</map> ";
            }

        }

    }

}
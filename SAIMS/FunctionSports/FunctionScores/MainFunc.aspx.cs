using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string Control1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["职务"].ToString() == "4")
        {
            insert.Visible = false;
            set.Visible = false;
            bacth.Visible = false;
            views.Visible = false;//班主任
            command.Visible = false;
        }
        else if (Session["职务"].ToString() == "1" || Session["职务"].ToString() == "2" || Session["职务"].ToString() == "3" || Session["职务"].ToString() == "5" || Session["职务"].ToString() == "6" || Session["职务"].ToString() == "7")
        {
            frame.Visible = false;//校长等
            if (Session["职务"].ToString() == "2")
                frame.Visible=true;
        }
        else
        {
            set.Visible = false;
            frame.Visible = false;//学生会
        }
        if (Session["职务"].ToString() == "49" || Session["职务"].ToString() == "50" || Session["职务"].ToString() == "51" || Session["职务"].ToString() == "52")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有权限!');</script>");
            Response.Flush();
            Response.End();//同学
        }
        string ID = Request.QueryString["ID"];
        if (ID == "input")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"ScoresInput.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
        else if (ID == "view")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"ScoresView.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
        else if (ID == "frame")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"frameofteachers.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";   
        }
        else if (ID == "piliang")
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"Piliangfufen.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";   
        }
        else if (ID == "command")
        {
            if(Session["职务"].ToString()!="4")
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"CommandScores.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";
        }
        else if (ID == "manage") 
        {
            content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"../settings/LianghuaSetting.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>"; 
        }
        
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Clear();
        Response.Write(" <script language='javascript'+>top.location='../login.aspx';</script>");
        Response.Flush();
        Response.End();   
    }
}
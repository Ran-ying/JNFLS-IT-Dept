using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionSchoolClubs_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
           string ID = Request.QueryString["ID"];
           if (ID == null || ID != "1")
           {

               string Club_Img_Getsql;
               string Club_Namesql;
               Club_Img_Getsql = "SELECT 社徽 FROM 社团 WHERE 社长 = '" + Session["名字"] + "'";
               Club_Namesql = "SELECT 社团名 FROM 社团 WHERE 社长 = '" + Session["名字"] + "'";
               SqlCommand ImgCommand = new SqlCommand();
               ImgCommand.Connection = con;
               ImgCommand.CommandText = Club_Img_Getsql;
               ImgCommand.CommandType = CommandType.Text;
               string clubImg = (string)ImgCommand.ExecuteScalar(); //获取社徽URL
               ClubsImg.ImageUrl = clubImg;
               SqlCommand NameCommand = new SqlCommand();
               NameCommand.Connection = con;
               NameCommand.CommandText = Club_Namesql;
               NameCommand.CommandType = CommandType.Text;
               string clubName = (string)NameCommand.ExecuteScalar();//获取社团名

               managepage_club_name.Text = clubName;
               managepage_club_manager.Text = Session["名字"].ToString();

           }
           else
           {
               string Club_Img_Getsql;
               string Club_Namesql;

              
               Club_Namesql = "SELECT 社团名 FROM 社团成员 WHERE 社团成员 = '" + Session["名字"] + "'";
  
               SqlCommand NameCommand = new SqlCommand();
               NameCommand.Connection = con;
               NameCommand.CommandText = Club_Namesql;
               NameCommand.CommandType = CommandType.Text;
               string clubName = (string)NameCommand.ExecuteScalar();//获取社团名

               Club_Img_Getsql = "SELECT 社徽 FROM 社团 WHERE 社团名 = '" + clubName + "'";

               SqlCommand ImgCommand = new SqlCommand();
               ImgCommand.Connection = con;
               ImgCommand.CommandText = Club_Img_Getsql;
               ImgCommand.CommandType = CommandType.Text;
               string clubImg = (string)ImgCommand.ExecuteScalar(); //获取社徽URL
               ClubsImg.ImageUrl = clubImg;

               string Club_Managersql = "SELECT 社长 From 社团 Where 社团名 = '" + clubName + "'";
               SqlCommand ManagerCommand = new SqlCommand();
               ManagerCommand.Connection = con;
               ManagerCommand.CommandText = Club_Managersql;
               ManagerCommand.CommandType = CommandType.Text;
               string Manager = (string)ManagerCommand.ExecuteScalar(); //获取社徽URL


               managepage_club_name.Text = clubName;
               managepage_club_manager.Text = Manager;
           }


            DataTable dt = GridView1.DataSource as DataTable;
            if (dt != null)
            {
                Label1.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label1.Text = "0";
            }
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
        if (GridView1.Rows.Count.ToString() != null)
        Label1.Text = GridView1.Rows.Count.ToString();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void DetailsView2_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void managemember_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void ApplyStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clubapplystatus.aspx");
    }
    protected void JoinClubBtn_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = "";



        ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);

        try
        {
            con1.Open();
            //判断该用户是否合法用户
            string selectSQL;
            selectSQL = "select count(*) from 用户 where 名字='" + wantJoinClubUserName.Text + "'";
            SqlCommand selectNotes = new SqlCommand(selectSQL, con1);


            int count = (int)selectNotes.ExecuteScalar();
            if (count <= 0)
            {
                errorMsgLable.Text = "该用户不是系统中的用户！请修改。";
                return;
            }

            string select1SQL;
            select1SQL = "select count(*) from 社团成员 where 社团成员='" + wantJoinClubUserName.Text + "'";
            SqlCommand selectClubMemberReplicate = new SqlCommand(select1SQL, con1);


            int count1 = (int)selectClubMemberReplicate.ExecuteScalar();
            if (count1 > 0)
            {
                errorMsgLable.Text = "该用户已经是当前社团用户，不允许重复加入！请修改。";
                return;
            }


             string insertClubMemberSql = "insert into 社团成员(社团成员,社团名,社员年级,社员班级) values ('" + wantJoinClubUserName.Text + "','" + managepage_club_name.Text + "'," + Session["年级ID"] + ",'" + DropDownList1.SelectedValue + "')";



            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con1;
            Command1.CommandText = insertClubMemberSql;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();


        }




        finally
        {

            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
            Response.Clear();
            Response.Write(" <script language='javascript'+> location.reload();</script>");
            Response.Flush();
            Response.End();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("clubposition.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("clubupload.aspx");
    }
    protected void Out_Click(object sender, EventArgs e)
    {
       string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);
        try
        {
            string updatesql = "DELETE FROM 社团成员 WHERE 社团成员 = '" + wantJoinClubUserName.Text.ToString() + "' AND 社员班级 = '" + DropDownList1.SelectedValue + "'";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con1;
            Command1.CommandText = updatesql;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
        }
        catch
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location.reload();alert('请核查信息！');location.reload();</script>");
            Response.Flush();
            Response.End();
        }
           finally
        {

            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
        }
    }
    protected void renming_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);
        try
        {
            string select = "SELECT 社团成员 FROM 社团成员 where 社团成员 = '" + wantJoinClubUserName.Text.ToString() + "'";
            bool TorF = false;
            SqlCommand cons = new SqlCommand(select, con1);
            SqlDataReader conda = cons.ExecuteReader();
            while (conda.Read())
            {
                TorF = true;
            }
            conda.Close();
            if (TorF)
            {
                string updatesql = "UPDATE 社团成员 SET 社团职务 = '社员'  WHERE 社团成员 = '" + wantJoinClubUserName.Text.ToString() + "' AND 社员班级 = '" + DropDownList1.SelectedValue + "'";
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con1;
                Command1.CommandText = updatesql;
                Command1.CommandType = CommandType.Text;
                Command1.ExecuteNonQuery();
            }
            else
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location.reload();alert('请核查信息！');location.reload();</script>");
                Response.Flush();
                Response.End();
            }
        }
        catch
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location.reload();alert('请核查信息！');location.reload();</script>");
            Response.Flush();
            Response.End();
        }
        finally
        {

            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
        }
    }
    protected void chexiao_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);
        try
        {
            string select = "SELECT 社团成员 FROM 社团成员 where 社团成员 = '"+wantJoinClubUserName.Text.ToString()+"'";
            bool TorF = false;
            SqlCommand cons = new SqlCommand(select, con1);
            SqlDataReader conda = cons.ExecuteReader();
            while (conda.Read())
            {
                TorF = true;
            }
            conda.Close();
            if (TorF)
            {
                string updatesql = "UPDATE 社团成员 SET 社团职务 = '副社长'  WHERE 社团成员 = '" + wantJoinClubUserName.Text.ToString() + "' AND 社员班级 = '" + DropDownList1.SelectedValue + "'";
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con1;
                Command1.CommandText = updatesql;
                Command1.CommandType = CommandType.Text;
                Command1.ExecuteNonQuery();
            }
            else
            {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location.reload();alert('请核查信息！');location.reload();</script>");
            Response.Flush();
            Response.End();
            }
        }
        catch
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location.reload();alert('请核查信息！');location.reload();</script>");
            Response.Flush();
            Response.End();
        }
        finally
        {

            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
        }
    }
    protected void JoinClubBtn0_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);
        try
        {
            string select = "SELECT 社团成员 FROM 社团成员 where 社团成员 = '" + wantJoinClubUserName0.Text.ToString() + "'";
            bool TorF = false;
            SqlCommand cons = new SqlCommand(select, con1);
            SqlDataReader conda = cons.ExecuteReader();
            while (conda.Read())
            {
                TorF = true;
            }
            conda.Close();
            if (TorF)
            {
                string updatesql = "UPDATE 社团成员 SET 社团职务 = '"+wantJoinClubUserName1.Text.ToString()+"'  WHERE 社团成员 = '" + wantJoinClubUserName0.Text.ToString() + "' AND 社员班级 = '" + DropDownList2.SelectedValue + "'";
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con1;
                Command1.CommandText = updatesql;
                Command1.CommandType = CommandType.Text;
                Command1.ExecuteNonQuery();
            }
            else
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location.reload();alert('请核查信息！');location.reload();</script>");
                Response.Flush();
                Response.End();
            }
        }
        catch
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location.reload();alert('请核查信息！');location.reload();</script>");
            Response.Flush();
            Response.End();
        }
        finally
        {

            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
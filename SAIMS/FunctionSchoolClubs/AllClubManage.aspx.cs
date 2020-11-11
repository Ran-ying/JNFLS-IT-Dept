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
        string consql = "SELECT 社团管理 FROM 权限表 WHERE 职务 ='" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 社团管理Bol = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            社团管理Bol = conda.GetBoolean(0);
        }

        con.Close();
        if (社团管理Bol == false)
        {

            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有此权限!');</script>");
            Response.Flush();
            Response.End();
        }
        社团显示.Visible = false;
        社长行.Visible = false;
        原因行.Visible = false;
        输入分数行.Visible = false;
        备注行.Visible = false;
        提交行.Visible = false;
        table1.Height = "41px";

    }
    protected void 添加社团Button_Click(object sender, EventArgs e)
    {

        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {

            string str; bool TorF = true;
            str = "SELECT 名字 FROM 用户 WHERE 班级 = '" + Session["年级ID"].ToString() + "-" + 社长班级TextBox.SelectedValue.ToString() + "'";
            SqlCommand cons0 = new SqlCommand(str, con);
            SqlDataReader conda0 = cons0.ExecuteReader();
            while (conda0.Read())
            {
                if (conda0.GetBoolean(0) != null) ;
                TorF = conda0.GetBoolean(0);
            }
            conda0.Close();

            if (TorF)
            {
                string upclubdata;
                upclubdata = "INSERT INTO 社团 (社团名,社长,社长账户,年级,社徽,社长班级) VALUES ('" + 社团名TextBox.Text + "', '" + 社长姓名TextBox.Text + "', '" + 社长管理账户TextBox.Text + "', '" + Session["年级ID"] + "','icons/Error.jpg','" + 社长班级TextBox.Text + "')";
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con;
                Command1.CommandText = upclubdata;
                Command1.CommandType = CommandType.Text;
                Command1.ExecuteNonQuery();

                string 部门 = "";
                if (Session["年级ID"].ToString() == "1")
                {
                    部门 = "1018";
                }
                else if (Session["年级ID"].ToString() == "2")
                {
                    部门 = "2018";
                }
                else if (Session["年级ID"].ToString() == "3")
                {
                    部门 = "3018";
                }
                else
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>loacation.reload();alert('对不起,您提交的信息有误,请查证后再重新输入!');</script>");
                    Response.Flush();
                    Response.End();
                }



                if (部门 != "")
                {

                    string upclubdata2;
                    upclubdata2 = "INSERT INTO 用户 (名字,用户名,用户组,部门,班级) VALUES ('" + 社长姓名TextBox.Text + "', '" + 社长管理账户TextBox.Text + "', '49', '" + 部门 + "','" + 社长班级TextBox.SelectedValue + "')";
                    SqlCommand Command2 = new SqlCommand();
                    Command1.Connection = con;
                    Command1.CommandText = upclubdata2;
                    Command1.CommandType = CommandType.Text;
                    Command1.ExecuteNonQuery();
                }
                else
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>loacation.reload();alert('对不起,您提交的信息有误,请查证后再重新输入!');</script>");
                    Response.Flush();
                    Response.End();
                }

                Response.Clear();
                Response.Write(" <script language='javascript'+>loacation.reload();alert('操作成功！');</script>");
                Response.Flush();
                Response.End();
            }
            else
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>loacation.reload();alert('对不起,您提交的信息有误,请查证后再重新输入!');</script>");
                Response.Flush();
                Response.End();
            }
        }
        catch (Exception ex)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>loacation.reload();alert('对不起,您提交的信息有误,请查证后再重新输入!');</script>");
            Response.Flush();
            Response.End();

        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }

    protected void 提交_Click(object sender, EventArgs e)
    {
        string upclubdata = "INSERT INTO 社团扣分 (社团名,扣分人,原因,扣分,扣分时间,扣分人姓名,备注) VALUES ('" + 社团显示label.Text + "','" + Session["usersname"] + "','" + 原因.SelectedValue.ToString() + "'," + 扣分数.Text + ",'" + DateTime.Now + "','" + Session["名字"] + "','" + 备注.Text + "')";
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
            Response.Clear();
            Response.Write(" <script language='javascript'+>alert('操作成功'); location.reload();</script>");
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            if (upclubdata == "")
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>alert('请重新输入！');location.reload();</script>");
                Response.Flush();
                Response.End();
            }
            else if (ex != null)
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>alert('对不起，服务器繁忙，请稍后重试！');location.reload();</script>");
                Response.Flush();
                Response.End();
            }

            //throw ex;
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }

    protected void 选择社团DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        社团显示label.Text = 选择社团DropDownList.SelectedValue;
        选择社团.Visible = false;
        社团显示.Visible = true;
        社长行.Visible = true;
        原因行.Visible = true;
        输入分数行.Visible = true;
        备注行.Visible = true;
        提交行.Visible = true;
        table1.Height = "350px";

        string consql = "SELECT 社长 FROM 社团 WHERE 社团名 ='" + 选择社团DropDownList.SelectedValue + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        string 社长 = "";

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            社长 = conda.GetString(0);
        }

        con.Close();
        社长label.Text = 社长;
    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
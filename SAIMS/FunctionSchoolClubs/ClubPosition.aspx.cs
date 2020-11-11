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
    string Selected_Position;
    string Input_Info;
    string club_name;
    DateTime Selected_Date;

    protected void Page_Load(object sender, EventArgs e)
    {
        bool ClubManageClearance;
        
        //----------------------------读取社团操作权限----------------------------------------
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string ClubClearanceSql;

            ClubClearanceSql = "SELECT 社团管理 FROM 权限表,用户 WHERE 用户.名字 = '" + Session["名字"] + "' AND 用户.用户组 = 权限表.职务";
            SqlCommand ClubClearanceCommand = new SqlCommand();
            ClubClearanceCommand.Connection = con;
            ClubClearanceCommand.CommandText = ClubClearanceSql;
            ClubClearanceCommand.CommandType = CommandType.Text;
            ClubManageClearance = (bool)ClubClearanceCommand.ExecuteScalar();
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
        //-------------------------------------验证社团操作权限-------------------------------------------
        if (ClubManageClearance != true)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有操作权限!');</script>");
            Response.Flush();
            Response.End();   
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Selected_Position = DropDownList1.Text;
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
      
    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        selectedDateField.Value = Calendar1.SelectedDate.ToString("yyyy/MM/dd");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Input_Info = CKEditor1.Text;
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        SqlTransaction trans = null;
        try
        {
            con.Open();
            trans = con.BeginTransaction();
            string club_namesql;
            string apply_positionsql;
            club_namesql = "SELECT 社团名 FROM 社团 WHERE 社长 = '" + Session["名字"] + "'";
            SqlCommand clubname = new SqlCommand();
            clubname.Connection = con;
            clubname.Transaction = trans;
            clubname.CommandText = club_namesql;
            clubname.CommandType = CommandType.Text;
            club_name = (string)clubname.ExecuteScalar();
            apply_positionsql = "INSERT INTO 预约 (预约社团,预约时间,预约场地,申请内容) VALUES ('" + club_name + "','" + selectedDateField.Value + "','" + DropDownList1.SelectedValue + "','" + Input_Info + "')";
            SqlCommand Command = new SqlCommand();
            Command.Connection = con;
            Command.Transaction = trans;
            Command.CommandText = apply_positionsql;
            Command.CommandType = CommandType.Text;
            Command.ExecuteNonQuery();

            string selectidSql = "SELECT DISTINCT @@IDENTITY AS IDEN FROM 预约";

            SqlCommand comm2 = new SqlCommand(selectidSql, con, trans);
            object o = comm2.ExecuteScalar();
            string iden = null;
            if (o != null)
            {
                iden = o.ToString();
            }
            insertDataID.Value = iden;
            trans.Commit();


        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }
            throw ex;
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='manageclub.aspx';alert('操作成功!');</script>");
            Response.Flush();
            Response.End();   
        }

      

    }
}
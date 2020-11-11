using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;


public partial class FunctionSports_AddSportFunc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TimeChangeButton_Click(object sender, EventArgs e)
    {
        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportConnectionString);
        con.Open();
        try
        {
            
            string s = TimeChange.Text;

            int TimeValue = int.Parse(s);

            string upclubdata;
            upclubdata = "UPDATE 运动会设置 SET 时限 = '" + TimeValue.ToString()+"' WHERE 用户 = '"+ DropDownList1.SelectedValue.ToString() +"'";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

            NowTime.Text =  "更改成功！更改为："+TimeValue.ToString()+"分钟";
            //=============更改时限==========
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }
    
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Lock_Click(object sender, EventArgs e)
    {
        string SportsConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportsConnectionString);
        con.Open();
        try
        {
            string SportIOStateSql;



            SportIOStateSql = "SELECT 证件状态 FROM 运动会进出场数据 WHERE IC卡编号 = '" + LockTXTBOX.Text + "'";
            SqlCommand SportIOStateCommand = new SqlCommand();
            SportIOStateCommand.Connection = con;
            SportIOStateCommand.CommandText = SportIOStateSql;
            SportIOStateCommand.CommandType = CommandType.Text;

            string SportIOState = (string)SportIOStateCommand.ExecuteScalar();

            //------------------------------判断卡当前状态------------------

            if (SportIOState == "O" || SportIOState == "I" )
            {
                string UpDataUnLockedState = "UPDATE 运动会进出场数据 SET 证件状态 = 'L' WHERE IC卡编号 = '" + LockTXTBOX.Text + "'";
                SqlCommand UpDataUnLockedStateCommand = new SqlCommand();
                UpDataUnLockedStateCommand.Connection = con;
                UpDataUnLockedStateCommand.CommandText = UpDataUnLockedState;
                UpDataUnLockedStateCommand.CommandType = CommandType.Text;
                UpDataUnLockedStateCommand.ExecuteNonQuery();
                //------------------------将卡状态更改为场外------------------------
                LockState.Text = "锁卡成功!";
            }
            else
            {
                LockState.Text = "卡已锁！";
            }
        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }
    protected void CHI_KA_ZHEInFo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void CHI_KA_ZHEInFoBut_Click(object sender, EventArgs e)
    {
        string INFOcode,CHI_KA_ZHEInFoSql;
        INFOcode = CHI_KA_ZHEInFo.Text;
        Label1.Text = INFOcode;
    }
}
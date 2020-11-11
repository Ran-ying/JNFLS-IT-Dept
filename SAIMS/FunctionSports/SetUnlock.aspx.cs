using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;

public partial class FunctionSports_Unlock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Unlock_Click(object sender, EventArgs e)
    {
        string SportsConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportsConnectionString);
        con.Open();
        try
        {
            string SportIOStateSql, SportXUEJIHAOSql;
            string SportXUEJIHAO = "";
            string SportIOState = "";
           
           // SportXUEJIHAOSql = "SELECT IC卡编号 FROM IC卡 WHERE ICID = '" + Number.Text.ToString() + "'";
            //SqlCommand SportXUEJIHAOCommand = new SqlCommand();
            //SportXUEJIHAOCommand.Connection = con;
           // SportXUEJIHAOCommand.CommandText = SportXUEJIHAOSql;
           // SportXUEJIHAOCommand.CommandType = CommandType.Text;
           // SportXUEJIHAO = (string)SportXUEJIHAOCommand.ExecuteScalar();

            //-------------------------------读取IC卡编号-----------------

           // SportIOStateSql = "SELECT 证件状态 FROM 运动会进出场数据 WHERE IC卡编号 = '" + SportXUEJIHAO + "'";
            SportIOStateSql = "SELECT 证件状态 FROM 运动会进出场数据 WHERE IC卡编号 = '" + Number.Text.ToString() + "'";
            SqlCommand SportIOStateCommand = new SqlCommand();
            SportIOStateCommand.Connection = con;
            SportIOStateCommand.CommandText = SportIOStateSql;
            SportIOStateCommand.CommandType = CommandType.Text;

            SportIOState = (string)SportIOStateCommand.ExecuteScalar();
            //------------------------------判断卡当前状态------------------

            if (SportIOState == "I" || SportIOState == "O")
            {
                Info.Text = "不用解锁回去吧";
                
            }
            else
            {
                con.Close();
                string SportsConnectionString2 = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
                SqlConnection con2 = new SqlConnection(SportsConnectionString2);
                con2.Open();
                //string UpDataUnLockedState = "UPDATE 运动会进出场数据 SET 证件状态 = 'O', 出场时间 = getdate() WHERE IC卡编号 = '" + SportXUEJIHAO + "'";
                string UpDataUnLockedState = "UPDATE 运动会进出场数据 SET 证件状态 = 'O', 出场时间 = getdate() WHERE IC卡编号 = '" + Number.Text.ToString() + "'";
                SqlCommand UpDataUnLockedStateCommand = new SqlCommand();
                UpDataUnLockedStateCommand.Connection = con2;
                UpDataUnLockedStateCommand.CommandText = UpDataUnLockedState;
                UpDataUnLockedStateCommand.CommandType = CommandType.Text;
                UpDataUnLockedStateCommand.ExecuteNonQuery();
                //------------------------将卡状态更改为场外------------------------
                Info.Text = "解锁成功请于20分钟内入场";
                con2.Close();
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
}
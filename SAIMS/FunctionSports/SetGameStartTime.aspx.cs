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

public partial class FunctionSports_SetGameStartTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportConnectionString);
        con.Open();
        try
        {
            string SportManageSql;
            bool SportManage;

            SportManageSql = "SELECT 运动会出入场管理 FROM 权限表,用户 WHERE 用户.名字 = '" + Session["名字"] + "' AND 用户.用户组 = 权限表.职务";
            SqlCommand SportManageCommand = new SqlCommand();
            SportManageCommand.Connection = con;
            SportManageCommand.CommandText = SportManageSql;
            SportManageCommand.CommandType = CommandType.Text;

            SportManage = (bool)SportManageCommand.ExecuteScalar();
            if (SportManage == false)
            {
                Response.Redirect("index.aspx");
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


    protected void GAMESTART_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string SelectedSporterSql, upclubdata, Grade, GameName;

            DateTime NowTime = DateTime.Now;

            Grade = DropDownList2.SelectedValue.ToString();
            GameName = DropDownList1.SelectedValue.ToString();

            upclubdata = "UPDATE 运动会项目 SET 实际检录时间 = ('" + NowTime + "') , 比赛开始 = ' True ' WHERE 项目名称 = '" + GameName + "' AND 参赛年级 = '" + Grade + "'";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

              //--------------------------录入检录时间-----------------------------------
            string DTsql;

            DTsql = "SELECT 时限 FROM 运动会设置 WHERE 用户 = '学生'";
            SqlCommand DTsqlCommand = new SqlCommand();
            DTsqlCommand.Connection = con;
            DTsqlCommand.CommandText = DTsql;
            DTsqlCommand.CommandType = CommandType.Text;
            int DT = (int)DTsqlCommand.ExecuteScalar();


            //---------------------读取时限------------------------------

 
         
            


            SelectedSporterSql = "SELECT IC卡编号 FROM 运动会进出场数据 WHERE 证件状态 = 'O' AND 年级 = " + Grade + "AND (运动会项目1 = '" + GameName + "' OR 运动会项目2 = '" + GameName + "')";

            SqlCommand SelectedSporterIns = new SqlCommand(SelectedSporterSql, con);
            SqlDataReader SelectedSporterDa = SelectedSporterIns.ExecuteReader();//=============先搜一遍班级数
            string IC;

            while (SelectedSporterDa.Read())
            {
                IC = SelectedSporterDa.GetString(0);
                string SelectedSporterQXSql = "SELECT 权限 FROM 运动会进出场数据 WHERE IC卡编号 = '" + IC + "'";
                SqlCommand SelectedSporterQXIns = new SqlCommand(SelectedSporterQXSql, con);
                SqlDataReader SelectedSporterQXDa = SelectedSporterQXIns.ExecuteReader();
                int QX;
                if (SelectedSporterQXDa.Read())
                {
                    QX = SelectedSporterQXDa.GetInt32(0);

                    if (QX == 1)
                    {

                        string LimTimeSQL = "SELECT 出场时间 FROM 运动会进出场数据 WHERE IC卡编号 = '" + IC + "'";
                        SqlCommand LimTimeCommand = new SqlCommand();
                        LimTimeCommand.Connection = con;
                        LimTimeCommand.CommandText = LimTimeSQL;
                        LimTimeCommand.CommandType = CommandType.Text;
                        DateTime LimTime = (DateTime)LimTimeCommand.ExecuteScalar();
                        //===========获取出场时间

                        if (LimTime.AddMinutes(DT) < NowTime)
                        {
                            string upsporterdate1;



                            string UpDataInState = "UPDATE 运动会进出场数据 SET 证件状态 = 'I' WHERE IC卡编号 = '" + IC + "'";
                            SqlCommand UpDataInStateCommand = new SqlCommand();
                            UpDataInStateCommand.Connection = con;
                            UpDataInStateCommand.CommandText = UpDataInState;
                            UpDataInStateCommand.CommandType = CommandType.Text;
                            UpDataInStateCommand.ExecuteNonQuery();

                            //------------------以学生身份入场

                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + IC + "', 'O','I')";
                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                            INSERTBackDataCommand.Connection = con;
                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                            INSERTBackDataCommand.CommandType = CommandType.Text;
                            INSERTBackDataCommand.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------


                            upsporterdate1 = "UPDATE 运动会权限 SET 权限 = '2' WHERE IC卡编号 = '" + IC + "'";
                            SqlCommand upsporterdataCommand1 = new SqlCommand();
                            upsporterdataCommand1.Connection = con;
                            upsporterdataCommand1.CommandText = upsporterdate1;
                            upsporterdataCommand1.CommandType = CommandType.Text;
                            upsporterdataCommand1.ExecuteNonQuery();

                            //================更改场外运动员权限


                            string UpDataOutNullTime = "UPDATE 运动会进出场数据 SET 出场时间 = '" + NowTime + "' WHERE IC卡编号 = '" + IC + "'";
                            SqlCommand UpDataOutNullTimeCommand = new SqlCommand();
                            UpDataOutNullTimeCommand.Connection = con;
                            UpDataOutNullTimeCommand.CommandText = UpDataOutNullTime;
                            UpDataOutNullTimeCommand.CommandType = CommandType.Text;
                            UpDataOutNullTimeCommand.ExecuteNonQuery();


                            //-------------------------以运动员身份出场-----------------------

                            string INSERTBackDataSql2 = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + IC + "', 'I','O')";
                            SqlCommand INSERTBackData2Command = new SqlCommand();
                            INSERTBackData2Command.Connection = con;
                            INSERTBackData2Command.CommandText = INSERTBackDataSql2;
                            INSERTBackData2Command.CommandType = CommandType.Text;
                            INSERTBackData2Command.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------



                            string SelectedSporterBJSql = "SELECT 班级 FROM IC卡 WHERE IC卡编号 = '" + IC + "'";
                            SqlCommand SelectedSporterBJIns = new SqlCommand(SelectedSporterBJSql, con);
                            SqlDataReader SelectedSporterBJDa = SelectedSporterBJIns.ExecuteReader();
                            string BJ = "";
                            if (SelectedSporterBJDa.Read())
                            {
                                BJ = SelectedSporterBJDa.GetString(0);
                            }
                            //======================================================获取运动员班级



                            string upsporterdate2;
                            upsporterdate2 = "UPDATE 班级 SET 运动会场外人数 = 运动会场外人数 - 1 WHERE 运动会场外人数>0 AND 班级编号 = '" + BJ + "'";
                            SqlCommand upsporterdataCommand2 = new SqlCommand();
                            upsporterdataCommand2.Connection = con;
                            upsporterdataCommand2.CommandText = upsporterdate2;
                            upsporterdataCommand2.CommandType = CommandType.Text;
                            upsporterdataCommand2.ExecuteNonQuery();
                            //=================更新班级场外人数
                        }
                        else 
                        {
                            string UpDataLockState;
                            UpDataLockState = "UPDATE 运动会进出场数据 SET 证件状态 = 'L' WHERE IC卡编号 = '" + IC + "'";
                            SqlCommand UpDataLockStateCommand = new SqlCommand();
                            UpDataLockStateCommand.Connection = con;
                            UpDataLockStateCommand.CommandText = UpDataLockState;
                            UpDataLockStateCommand.CommandType = CommandType.Text;
                            UpDataLockStateCommand.ExecuteNonQuery();

                            //---------------------------------超时锁卡

                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + IC + "', 'O', 'L')";
                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                            INSERTBackDataCommand.Connection = con;
                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                            INSERTBackDataCommand.CommandType = CommandType.Text;
                            INSERTBackDataCommand.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------

                        }
                      

                    }
                }
            }
            SelectedSporterDa.Close();

        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }
    protected void GAMEEND_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            string Grade = DropDownList2.SelectedValue;
            string GameName = DropDownList2.SelectedValue;
            DateTime NowTime = DateTime.Now;


            upclubdata = "UPDATE 运动会项目 SET 比赛结束时间 = ('" + NowTime + "') ,比赛结束 = 'True' WHERE 项目名称 = '" + GameName + "' AND 参赛年级 = '" + Grade + "'";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();


        }
        finally
        {
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }

    public string upsporterdate { get; set; }
}
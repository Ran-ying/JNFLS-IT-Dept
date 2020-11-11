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

public partial class FunctionSports_IO_IC : System.Web.UI.Page
{
    DateTime NowTime = DateTime.Now;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.DefaultButton = Click.UniqueID;
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


    protected void Click_Click(object sender, EventArgs e)
    {

        string Number = ICNumber.Text;

        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportConnectionString);
        con.Open();
        try
        {
            string SportQuanxianSql, SELECTClassSql, SportIOStateSql, ICOutNumSql, ICBelongName;
            string ICOutNum="";



            ICOutNumSql = "SELECT IC卡编号,姓名 FROM IC卡 WHERE ICID = '" + Number + "'";
            SqlCommand ICOutNumCommand = new SqlCommand(ICOutNumSql, con);
            SqlDataReader SelectedValue = ICOutNumCommand.ExecuteReader();


            while (SelectedValue.Read())
            {
               
                ICOutNum = SelectedValue.GetString(0);
                ICBelongName = SelectedValue.GetString(1);
            }
            SelectedValue.Close();
            //-------------------------------读取IC卡编号-----------------

            int SportStudentQuanxian;
                SportQuanxianSql = "SELECT 权限 FROM 运动会权限 WHERE IC卡编号 = '" + ICOutNum + "'";
                SqlCommand SportQuanxianCommand = new SqlCommand();
                SportQuanxianCommand.Connection = con;
                SportQuanxianCommand.CommandText = SportQuanxianSql;
                SportQuanxianCommand.CommandType = CommandType.Text;
                SportStudentQuanxian = (int)SportQuanxianCommand.ExecuteScalar();
            



            //-------------------------------判断IC卡用户是否学生------------------------------------

            SportIOStateSql = "SELECT 证件状态 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
            SqlCommand SportIOStateCommand = new SqlCommand();
            SportIOStateCommand.Connection = con;
            SportIOStateCommand.CommandText = SportIOStateSql;
            SportIOStateCommand.CommandType = CommandType.Text;

            string SportIOState = (string)SportIOStateCommand.ExecuteScalar();
            //------------------------------判断IC卡当前状态------------------

            SELECTClassSql = "SELECT 班级 FROM IC卡 WHERE IC卡编号 = '" + ICOutNum + "'";
            SqlCommand SELECTClassSqlCommand = new SqlCommand();
            SELECTClassSqlCommand.Connection = con;
            SELECTClassSqlCommand.CommandText = SELECTClassSql;
            SELECTClassSqlCommand.CommandType = CommandType.Text;
            string SelectedClass = (string)SELECTClassSqlCommand.ExecuteScalar();
            //-----------------------------当前IC卡所在班级-------------------

            switch (SportStudentQuanxian)
            {
                case (1):
                    //-----------------------------用switch语句进行权限判断-------------------------------------
                    {

                        if (SportIOState == "I")
                        {

                            string LimitPersonSql,UpDataOutTime, UpDataOutState, UpDataBackDataSql, UpDataCountPeopleSql;

                            DateTime NowTime = DateTime.Now;


                            LimitPersonSql = "SELECT 运动会场外人数 FROM 班级 WHERE 编号 = '" + SelectedClass + "'";
                            SqlCommand LimitPersonSqlCommand = new SqlCommand();
                            LimitPersonSqlCommand.Connection = con;
                            LimitPersonSqlCommand.CommandText = LimitPersonSql;
                            LimitPersonSqlCommand.CommandType = CommandType.Text;
                            int i = (int)SportQuanxianCommand.ExecuteScalar();


                             if (i <= 3)
                                 {
                                   UpDataOutTime = "UPDATE 运动会进出场数据 SET 出场时间 = ('" + NowTime + "') WHERE IC卡编号 = '" + ICOutNum + "'";
                                   SqlCommand UpDataOutTimeCommand = new SqlCommand();
                                   UpDataOutTimeCommand.Connection = con;
                                   UpDataOutTimeCommand.CommandText = UpDataOutTime;
                                   UpDataOutTimeCommand.CommandType = CommandType.Text;
                                   UpDataOutTimeCommand.ExecuteNonQuery();

                                   //---------------------------------------------写入出场时间-------------------------------

                                   UpDataOutState = "UPDATE 运动会进出场数据 SET 证件状态 = 'O' WHERE IC卡编号 = '" + ICOutNum + "'";
                                   SqlCommand UpDataOutStateCommand = new SqlCommand();
                                   UpDataOutStateCommand.Connection = con;
                                   UpDataOutStateCommand.CommandText = UpDataOutState;
                                   UpDataOutStateCommand.CommandType = CommandType.Text;
                                   UpDataOutStateCommand.ExecuteNonQuery();

                                   Info.Text = "普通同学成功出场！";
                                   //---------------------------------------------写入证件状态-------------------------------


                            

                                   UpDataCountPeopleSql = "UPDATE 班级 SET 运动会场外人数 = '" + i + "'";
                                   SqlCommand UpDataCountPeopleSqlCommand = new SqlCommand();
                                   UpDataCountPeopleSqlCommand.Connection = con;
                                   UpDataCountPeopleSqlCommand.CommandText = UpDataCountPeopleSql;
                                   UpDataCountPeopleSqlCommand.CommandType = CommandType.Text;
                                   UpDataCountPeopleSqlCommand.ExecuteNonQuery();

                                   //---------------------------------------出场人数加一  ---------------------------------------

                                   UpDataBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'I','O')";
                                   SqlCommand UpDataBackDataSqlCommand = new SqlCommand();
                                   UpDataBackDataSqlCommand.Connection = con;
                                   UpDataBackDataSqlCommand.CommandText = UpDataBackDataSql;
                                   UpDataBackDataSqlCommand.CommandType = CommandType.Text;
                                   UpDataBackDataSqlCommand.ExecuteNonQuery();
                                   //------------------------------------------------写入后台数据----------------------------------


                                 }
                             else if(i > 3)
                             {
                                 Info.Text = "该班级场外人数过多无法出场！！";

                             }

                        }



                        
                        else if (SportIOState == "O")
                        {

                            string LimitPersonSql = "SELECT 运动会场外人数 FROM 班级 WHERE 编号 = '" + SelectedClass + "'";
                            SqlCommand LimitPersonSqlCommand = new SqlCommand();
                            LimitPersonSqlCommand.Connection = con;
                            LimitPersonSqlCommand.CommandText = LimitPersonSql;
                            LimitPersonSqlCommand.CommandType = CommandType.Text;
                            int i = (int)SportQuanxianCommand.ExecuteScalar();


                            string GetOutTimeSql;

                            GetOutTimeSql = "SELECT 出场时间 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                            SqlCommand GetOutTimeCommand = new SqlCommand();
                            GetOutTimeCommand.Connection = con;
                            GetOutTimeCommand.CommandText = GetOutTimeSql;
                            GetOutTimeCommand.CommandType = CommandType.Text;
                            DateTime OutTime = (DateTime)GetOutTimeCommand.ExecuteScalar();

                            string DTsql;

                            DTsql = "SELECT 时限 FROM 运动会设置 WHERE 用户 = '学生'";
                            SqlCommand DTsqlCommand = new SqlCommand();
                            DTsqlCommand.Connection = con;
                            DTsqlCommand.CommandText = DTsql;
                            DTsqlCommand.CommandType = CommandType.Text;
                            int DT = (int)DTsqlCommand.ExecuteScalar();


                            //---------------------读取时限------------------------------



                            DateTime InTime = DateTime.Now;
                            DateTime LimitedTime;
                            LimitedTime = OutTime.AddMinutes(DT);

                            if (InTime <= LimitedTime)
                            {
                                

                                string UpDataInState = "UPDATE 运动会进出场数据 SET 证件状态 = 'I' WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand UpDataInStateCommand = new SqlCommand();
                                UpDataInStateCommand.Connection = con;
                                UpDataInStateCommand.CommandText = UpDataInState;
                                UpDataInStateCommand.CommandType = CommandType.Text;
                                UpDataInStateCommand.ExecuteNonQuery();

                                Info.Text = "成功回场";
                                i--;

                                string UpDataCountPeopleSql = "UPDATE 班级 SET 运动会场外人数 = '" + i + "'";
                                SqlCommand UpDataCountPeopleSqlCommand = new SqlCommand();
                                UpDataCountPeopleSqlCommand.Connection = con;
                                UpDataCountPeopleSqlCommand.CommandText = UpDataCountPeopleSql;
                                UpDataCountPeopleSqlCommand.CommandType = CommandType.Text;
                                UpDataCountPeopleSqlCommand.ExecuteNonQuery();

                                //---------------------------------------出场人数减一  ---------------------------------------


                                string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'O','I')";
                                SqlCommand INSERTBackDataCommand = new SqlCommand();
                                INSERTBackDataCommand.Connection = con;
                                INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                INSERTBackDataCommand.CommandType = CommandType.Text;
                                INSERTBackDataCommand.ExecuteNonQuery();
                                //------------------------------------------------写入后台数据----------------------------------


                                string UpDataOutNullTime = "UPDATE 运动会进出场数据 SET 出场时间 = NULL WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand UpDataOutNullTimeCommand = new SqlCommand();
                                UpDataOutNullTimeCommand.Connection = con;
                                UpDataOutNullTimeCommand.CommandText = UpDataOutNullTime;
                                UpDataOutNullTimeCommand.CommandType = CommandType.Text;
                                UpDataOutNullTimeCommand.ExecuteNonQuery();


                                //----------------------------------------------------------入场成功并更改证件状态--------------------------
                            }
                            else
                            {

                                string INSERTBackDataSql;

                                string UpDataLockedState = "UPDATE 运动会进出场数据 SET 证件状态 = 'L' WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand UpDataLockedStateCommand = new SqlCommand();
                                UpDataLockedStateCommand.Connection = con;
                                UpDataLockedStateCommand.CommandText = UpDataLockedState;
                                UpDataLockedStateCommand.CommandType = CommandType.Text;
                                UpDataLockedStateCommand.ExecuteNonQuery();
                                //-----------------------------------------------------------超时并锁卡------------------------------
                               
                                Info.Text = "超时请到主席台解锁";

                                INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'O','L')";
                                SqlCommand INSERTBackDataCommand = new SqlCommand();
                                INSERTBackDataCommand.Connection = con;
                                INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                INSERTBackDataCommand.CommandType = CommandType.Text;
                                INSERTBackDataCommand.ExecuteNonQuery();
                                //------------------------------------------------写入后台数据----------------------------------

                            }



                        }
                        else if (SportIOState == "L")
                        {

                            string INSERTBackDataSql;

                            Info.Text = "超时已锁卡，请到主席台解锁";

                            INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'L', 'L')";
                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                            INSERTBackDataCommand.Connection = con;
                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                            INSERTBackDataCommand.CommandType = CommandType.Text;
                            INSERTBackDataCommand.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------

                        }
                        break;
                    }
                  
                case (2): //运动员
                    {

                        if (SportIOState == "I")
                        {

                            bool repea = false;
                            int SportIO = 0;
                         
                            string repeat = "SELECT 重复参赛,运动进出 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                            SqlCommand repeatCommand = new SqlCommand(repeat, con);
                            SqlDataReader RepeatData = repeatCommand.ExecuteReader();
                            //---------------判断是否重复参赛----------------          
                            if (RepeatData.Read())
                            {
                                repea = RepeatData.GetBoolean(0);
                                SportIO = RepeatData.GetInt32(1);
                            }
                            RepeatData.Close();

                            if (repea == false) //---不重复参赛----------------   
                                  {
                                    string sportxiangmu1, sportxiangmujianlu1;

                                    sportxiangmu1 = "SELECT 运动会项目1 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                                    SqlCommand sportxiangmu1Command = new SqlCommand();
                                    sportxiangmu1Command.Connection = con;
                                    sportxiangmu1Command.CommandText = sportxiangmu1;
                                    sportxiangmu1Command.CommandType = CommandType.Text;
                                    string xiangmu1 = (string)sportxiangmu1Command.ExecuteScalar();

                                //--------------------------获取项目1代码---------------------

                                     sportxiangmujianlu1 = "SELECT 比赛开始 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                     SqlCommand sportxiangmujianlu1Command = new SqlCommand();
                                     sportxiangmujianlu1Command.Connection = con;
                                     sportxiangmujianlu1Command.CommandText = sportxiangmujianlu1;
                                     sportxiangmujianlu1Command.CommandType = CommandType.Text;
                                     bool xiangmujianlu1 = (bool)sportxiangmujianlu1Command.ExecuteScalar();

                                //-------------------------获取项目1检录状态---------------------

                                    if (xiangmujianlu1 == false)
                                    {
                                        Info.Text = "检录未开始！";


                                        string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'I', 'I')";
                                       SqlCommand INSERTBackDataCommand = new SqlCommand();
                                       INSERTBackDataCommand.Connection = con;
                                       INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                       INSERTBackDataCommand.CommandType = CommandType.Text;
                                       INSERTBackDataCommand.ExecuteNonQuery();
                                    //------------------------------------------------写入后台数据----------------------------------

                                    }
                                    else
                                    {
                                       
                                            string UpDataOutTime;
                                            DateTime NowTime = DateTime.Now;

                                            UpDataOutTime = "UPDATE 运动会进出场数据 SET 出场时间 = ('" + NowTime + "') ,证件状态 = 'O',运动进出 = 1 WHERE IC卡编号 = '" + ICOutNum + "'";
                                            SqlCommand UpDataOutTimeCommand = new SqlCommand();
                                            UpDataOutTimeCommand.Connection = con;
                                            UpDataOutTimeCommand.CommandText = UpDataOutTime;
                                            UpDataOutTimeCommand.CommandType = CommandType.Text;
                                            UpDataOutTimeCommand.ExecuteNonQuery();

                                            //---------------------------------------------写入出场时间-------------------------------

                                            Info.Text = "运动员成功出场！";

                                            //----------------------------------写入证件状态-------------------------------


                                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'I', 'O')";
                                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                                            INSERTBackDataCommand.Connection = con;
                                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                            INSERTBackDataCommand.CommandType = CommandType.Text;
                                            INSERTBackDataCommand.ExecuteNonQuery();
                                            //------------------------------------------------写入后台数据----------------------------------
                                            
                                       }
                                    }
                           
                              
                            else  //若重复参赛
                            {
                                string sportxiangmu1, sportxiangmujianlu1,
                                       sportxiangmu2, sportxiangmujianlu2;
                                       
                                sportxiangmu1 = "SELECT 运动会项目1 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand sportxiangmu1Command = new SqlCommand();
                                sportxiangmu1Command.Connection = con;
                                sportxiangmu1Command.CommandText = sportxiangmu1;
                                sportxiangmu1Command.CommandType = CommandType.Text;
                                string xiangmu1 = (string)sportxiangmu1Command.ExecuteScalar();

                                //--------------------------获取项目1代码---------------------

                                sportxiangmujianlu1 = "SELECT 比赛开始 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmujianlu1Command = new SqlCommand();
                                sportxiangmujianlu1Command.Connection = con;
                                sportxiangmujianlu1Command.CommandText = sportxiangmujianlu1;
                                sportxiangmujianlu1Command.CommandType = CommandType.Text;
                                bool xiangmujianlu1 = (bool)sportxiangmujianlu1Command.ExecuteScalar();

                                //-------------------------获取项目1检录状态---------------------

                                sportxiangmu2 = "SELECT 运动会项目2 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand sportxiangmu2Command = new SqlCommand();
                                sportxiangmu2Command.Connection = con;
                                sportxiangmu2Command.CommandText = sportxiangmu2;
                                sportxiangmu2Command.CommandType = CommandType.Text;
                                string xiangmu2 = (string)sportxiangmu2Command.ExecuteScalar();

                                //--------------------------获取项目2代码---------------------

                                sportxiangmujianlu2 = "SELECT 比赛开始 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu2 + "'";
                                SqlCommand sportxiangmujianlu2Command = new SqlCommand();
                                sportxiangmujianlu2Command.Connection = con;
                                sportxiangmujianlu2Command.CommandText = sportxiangmujianlu1;
                                sportxiangmujianlu2Command.CommandType = CommandType.Text;
                                bool xiangmujianlu2 = (bool)sportxiangmujianlu2Command.ExecuteScalar();

                                //-------------------------获取项目2检录状态---------------------

                              
                                if (xiangmujianlu1 == false && xiangmujianlu2 == false)
                                {
                                    Info.Text = "运动检录未开始！";
                                }
                                else if (xiangmujianlu1 == true || xiangmujianlu2 == true)
                                {

      
                                            string UpDataOutTime;
                                            
                                            DateTime NowTime = DateTime.Now;
                                            
                                                SportIO++;

                                                UpDataOutTime = "UPDATE 运动会进出场数据 SET 出场时间 = ('" + NowTime + "') ,证件状态 = 'O',运动进出 =" + SportIO + " WHERE IC卡编号 = '" + ICOutNum + "'";
                                                SqlCommand UpDataOutTimeCommand = new SqlCommand();
                                                UpDataOutTimeCommand.Connection = con;
                                                UpDataOutTimeCommand.CommandText = UpDataOutTime;
                                                UpDataOutTimeCommand.CommandType = CommandType.Text;
                                                UpDataOutTimeCommand.ExecuteNonQuery();

                                                //---------------------------------------------写入出场时间、证件状态-------------------------------

                                                Info.Text = "运动员成功出场！";


                                                string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'I', 'O')";
                                                SqlCommand INSERTBackDataCommand = new SqlCommand();
                                                INSERTBackDataCommand.Connection = con;
                                                INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                                INSERTBackDataCommand.CommandType = CommandType.Text;
                                                INSERTBackDataCommand.ExecuteNonQuery();
                                                //---------------------------------------------写入后台数据----------------------------------

                                }
                             }
                          }
                         
                        


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                        //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                        //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                        //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


                        else if (SportIOState == "O") //运动员进场
                        {

                                string sportxiangmu1,sportxiangmujianlu1,sportxiangmu2,sportxiangmujianlu2;

                                sportxiangmu1 = "SELECT 运动会项目1 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand sportxiangmu1Command = new SqlCommand();
                                sportxiangmu1Command.Connection = con;
                                sportxiangmu1Command.CommandText = sportxiangmu1;
                                sportxiangmu1Command.CommandType = CommandType.Text;
                                string xiangmu1 = (string)sportxiangmu1Command.ExecuteScalar();

                                //--------------------------获取项目1代码---------------------

                                sportxiangmujianlu1 = "SELECT 比赛开始 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmujianlu1Command = new SqlCommand();
                                sportxiangmujianlu1Command.Connection = con;
                                sportxiangmujianlu1Command.CommandText = sportxiangmujianlu1;
                                sportxiangmujianlu1Command.CommandType = CommandType.Text;
                                bool xiangmujianlu1 = (bool)sportxiangmujianlu1Command.ExecuteScalar();

                                //-------------------------获取项目1检录状态---------------------
								
								string sportxiangmujianlu1end = "SELECT 比赛结束 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand Command1 = new SqlCommand();
                                Command1.Connection = con;
                                Command1.CommandText = sportxiangmujianlu1end;
                                Command1.CommandType = CommandType.Text;
                                bool xiangmujianlu1end = (bool)Command1.ExecuteScalar();

                                //-------------------------获取项目1检录状态---------------------


 

							
                                string UpDataInTime;
                                string UpDataInState;
								
								
								if(xiangmujianlu1end == true)
								{
                                UpDataInTime = "UPDATE 运动会进出场数据 SET 入场时间 = ('" + NowTime + "') WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand UpDataInTimeCommand = new SqlCommand();
                                UpDataInTimeCommand.Connection = con;
                                UpDataInTimeCommand.CommandText = UpDataInTime;
                                UpDataInTimeCommand.CommandType = CommandType.Text;
                                UpDataInTimeCommand.ExecuteNonQuery();

                                //---------------------------------------------写入入场时间-------------------------------

                                UpDataInState = "UPDATE 运动会进出场数据 SET 证件状态 = 'I' WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand UpDataInStateCommand = new SqlCommand();
                                UpDataInStateCommand.Connection = con;
                                UpDataInStateCommand.CommandText = UpDataInState;
                                UpDataInStateCommand.CommandType = CommandType.Text;
                                UpDataInStateCommand.ExecuteNonQuery();

                                Info.Text = "运动员成功入场！(转为普通同学)";
                                //---------------------------------------------写入证件状态-------------------------------

                                string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'O', 'I')";
                                SqlCommand INSERTBackDataCommand = new SqlCommand();
                                INSERTBackDataCommand.Connection = con;
                                INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                INSERTBackDataCommand.CommandType = CommandType.Text;
                                INSERTBackDataCommand.ExecuteNonQuery();
                                //------------------------------------------------写入后台数据----------------------------------

                                string upsporterdate1 = "UPDATE 运动会权限 SET 权限 = '1' WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand upsporterdataCommand1 = new SqlCommand();
                                upsporterdataCommand1.Connection = con;
                                upsporterdataCommand1.CommandText = upsporterdate1;
                                upsporterdataCommand1.CommandType = CommandType.Text;
                                upsporterdataCommand1.ExecuteNonQuery();

                                //================更改场外运动员权限

								}
								
                           else
						   {
							     UpDataInTime = "UPDATE 运动会进出场数据 SET 入场时间 = ('" + NowTime + "') WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand UpDataInTimeCommand = new SqlCommand();
                                UpDataInTimeCommand.Connection = con;
                                UpDataInTimeCommand.CommandText = UpDataInTime;
                                UpDataInTimeCommand.CommandType = CommandType.Text;
                                UpDataInTimeCommand.ExecuteNonQuery();

                                //---------------------------------------------写入入场时间-------------------------------

                                UpDataInState = "UPDATE 运动会进出场数据 SET 证件状态 = 'I' WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand UpDataInStateCommand = new SqlCommand();
                                UpDataInStateCommand.Connection = con;
                                UpDataInStateCommand.CommandText = UpDataInState;
                                UpDataInStateCommand.CommandType = CommandType.Text;
                                UpDataInStateCommand.ExecuteNonQuery();

                                Info.Text = "运动员成功入场！";
                                //---------------------------------------------写入证件状态-------------------------------

                                string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'O', 'I')";
                                SqlCommand INSERTBackDataCommand = new SqlCommand();
                                INSERTBackDataCommand.Connection = con;
                                INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                INSERTBackDataCommand.CommandType = CommandType.Text;
                                INSERTBackDataCommand.ExecuteNonQuery();
                                //------------------------------------------------写入后台数据----------------------------------


							   }

                            

                        }
                        break;
                    }
                case (3)://裁判学生会小记者
                    {
                        if (SportIOState == "I")
                        {
                            string UpDataOutTime;
                            string UpDataOutState;
                            DateTime NowTime = DateTime.Now;

                            UpDataOutTime = "UPDATE 运动会进出场数据 SET 出场时间 = ('" + NowTime + "') WHERE IC卡编号 = '" + ICOutNum + "'";
                            SqlCommand UpDataOutTimeCommand = new SqlCommand();
                            UpDataOutTimeCommand.Connection = con;
                            UpDataOutTimeCommand.CommandText = UpDataOutTime;
                            UpDataOutTimeCommand.CommandType = CommandType.Text;
                            UpDataOutTimeCommand.ExecuteNonQuery();

                            //---------------------------------------------写入出场时间-------------------------------

                            UpDataOutState = "UPDATE 运动会进出场数据 SET 证件状态 = 'O' WHERE IC卡编号 = '" + ICOutNum + "'";
                            SqlCommand UpDataOutStateCommand = new SqlCommand();
                            UpDataOutStateCommand.Connection = con;
                            UpDataOutStateCommand.CommandText = UpDataOutState;
                            UpDataOutStateCommand.CommandType = CommandType.Text;
                            UpDataOutStateCommand.ExecuteNonQuery();

                            Info.Text = "成功出场！";
                            //---------------------------------------------写入证件状态-------------------------------

                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'I', 'O')";
                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                            INSERTBackDataCommand.Connection = con;
                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                            INSERTBackDataCommand.CommandType = CommandType.Text;
                            INSERTBackDataCommand.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------

                        }
                        else if (SportIOState == "O")
                        {
                            string UpDataInTime;
                            string UpDataInState;
                            DateTime NowTime = DateTime.Now;

                            UpDataInTime = "UPDATE 运动会进出场数据 SET 入场时间 = ('" + NowTime + "') WHERE IC卡编号 = '" + ICOutNum + "'";
                            SqlCommand UpDataInTimeCommand = new SqlCommand();
                            UpDataInTimeCommand.Connection = con;
                            UpDataInTimeCommand.CommandText = UpDataInTime;
                            UpDataInTimeCommand.CommandType = CommandType.Text;
                            UpDataInTimeCommand.ExecuteNonQuery();

                            //---------------------------------------------写入入场时间-------------------------------

                            UpDataInState = "UPDATE 运动会进出场数据 SET 证件状态 = 'I' WHERE IC卡编号 = '" + ICOutNum + "'";
                            SqlCommand UpDataInStateCommand = new SqlCommand();
                            UpDataInStateCommand.Connection = con;
                            UpDataInStateCommand.CommandText = UpDataInState;
                            UpDataInStateCommand.CommandType = CommandType.Text;
                            UpDataInStateCommand.ExecuteNonQuery();

                            Info.Text = "成功入场！";
                            //---------------------------------------------写入证件状态-------------------------------

                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + ICOutNum + "', 'O', 'I')";
                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                            INSERTBackDataCommand.Connection = con;
                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                            INSERTBackDataCommand.CommandType = CommandType.Text;
                            INSERTBackDataCommand.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------

                        }
                        break;
                    }
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
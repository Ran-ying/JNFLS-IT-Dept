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

public partial class FunctionSports_IO_Manual : System.Web.UI.Page
{
    DateTime NowTime = DateTime.Now;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.DefaultButton = OK.UniqueID;
        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportConnectionString);
        con.Open();
        try
        {
            string SportManageSql;

            SportManageSql = "SELECT 运动会出入场管理 FROM 权限表,用户 WHERE 用户.名字 = '" +Session["名字"] + "' AND 用户.用户组 = 权限表.职务";
            SqlCommand SportManageCommand = new SqlCommand();
            SportManageCommand.Connection = con;
            SportManageCommand.CommandText = SportManageSql;
            SportManageCommand.CommandType = CommandType.Text;

            bool SportManage = (bool)SportManageCommand.ExecuteScalar();

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



    protected void OK_Click(object sender, EventArgs e)
    {

        string Number = TextBox1.Text;
        string ICOutNum = Number;

        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportConnectionString);
        con.Open();
        try
        {
            string SportQuanxianSql, SELECTClassSql, SportIOStateSql, ICOutNumSql, ICBelongName;
            

            SportQuanxianSql = "SELECT 权限 FROM 运动会权限 WHERE IC卡编号 = '" + Number + "'";
            SqlCommand SportQuanxianCommand = new SqlCommand();
            SportQuanxianCommand.Connection = con;
            SportQuanxianCommand.CommandText = SportQuanxianSql;
            SportQuanxianCommand.CommandType = CommandType.Text;
            int SportStudentQuanxian = (int)SportQuanxianCommand.ExecuteScalar();


            //-------------------------------判断IC卡用户是否学生------------------------------------

            ICOutNumSql = "SELECT 姓名 FROM IC卡 WHERE IC卡编号 = '" + Number + "'";
            SqlCommand ICOutNumCommand = new SqlCommand(ICOutNumSql, con);
            SqlDataReader SelectedValue = ICOutNumCommand.ExecuteReader();


            while (SelectedValue.Read())
            {
                ICBelongName = SelectedValue.GetString(0);
            }
            SelectedValue.Close();
            //-------------------------------读取IC卡编号-----------------
            SportIOStateSql = "SELECT 证件状态 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
            SqlCommand SportIOStateCommand = new SqlCommand();
            SportIOStateCommand.Connection = con;
            SportIOStateCommand.CommandText = SportIOStateSql;
            SportIOStateCommand.CommandType = CommandType.Text;

            string SportIOState = (string)SportIOStateCommand.ExecuteScalar();
            //------------------------------判断IC卡当前状态------------------

            SELECTClassSql = "SELECT 班级 FROM IC卡 WHERE 编号 = '" + ICOutNum + "'";
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

                            string LimitPersonSql, UpDataOutTime, UpDataOutState, UpDataBackDataSql, UpDataCountPeopleSql;

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

                                Info.Text = "成功出场！";
                                //---------------------------------------------写入证件状态-------------------------------


                                i++;

                                UpDataCountPeopleSql = "UPDATE 班级 SET 运动会场外人数 = '" + i + "'";
                                SqlCommand UpDataCountPeopleSqlCommand = new SqlCommand();
                                UpDataCountPeopleSqlCommand.Connection = con;
                                UpDataCountPeopleSqlCommand.CommandText = UpDataCountPeopleSql;
                                UpDataCountPeopleSqlCommand.CommandType = CommandType.Text;
                                UpDataCountPeopleSqlCommand.ExecuteNonQuery();

                                //---------------------------------------出场人数加一  ---------------------------------------

                                UpDataBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I','O')";
                                SqlCommand UpDataBackDataSqlCommand = new SqlCommand();
                                UpDataBackDataSqlCommand.Connection = con;
                                UpDataBackDataSqlCommand.CommandText = UpDataBackDataSql;
                                UpDataBackDataSqlCommand.CommandType = CommandType.Text;
                                UpDataBackDataSqlCommand.ExecuteNonQuery();
                                //------------------------------------------------写入后台数据----------------------------------


                            }
                            else
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


                                string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O','I')";
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

                                INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O','L')";
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

                            INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'L', 'L')";
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
                            string repeat;
                            repeat = "SELECT 重复参赛,运动进出 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
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


                                    string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'I')";
                                    SqlCommand INSERTBackDataCommand = new SqlCommand();
                                    INSERTBackDataCommand.Connection = con;
                                    INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                    INSERTBackDataCommand.CommandType = CommandType.Text;
                                    INSERTBackDataCommand.ExecuteNonQuery();
                                    //------------------------------------------------写入后台数据----------------------------------

                                }
                                else if (SportIO != 1)
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


                                    string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'O')";
                                    SqlCommand INSERTBackDataCommand = new SqlCommand();
                                    INSERTBackDataCommand.Connection = con;
                                    INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                    INSERTBackDataCommand.CommandType = CommandType.Text;
                                    INSERTBackDataCommand.ExecuteNonQuery();
                                    //------------------------------------------------写入后台数据----------------------------------

                                }
                                else if (SportIO == 1)
                                {
                                    Info.Text = "运动员出场次数过多！不允许出场！";

                                    string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'I')";
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
                                       sportxiangmu2, sportxiangmujianlu2,
                                       sportxiangmu1StartTimeSql, sportxiangmu2StartTimeSql,
                                       sportxiangmu1EndTimeSql, xiangmu2jieshushijianSql;


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

                                sportxiangmu1EndTimeSql = "SELECT 比赛结束时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmu1EndTimeCommand = new SqlCommand();
                                sportxiangmu1EndTimeCommand.Connection = con;
                                sportxiangmu1EndTimeCommand.CommandText = sportxiangmu1EndTimeSql;
                                sportxiangmu1EndTimeCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu1EndTime = (DateTime)sportxiangmu1EndTimeCommand.ExecuteScalar();

                                //-------------------------获取项目1结束时间---------------------

                                sportxiangmu2StartTimeSql = "SELECT 实际检录时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu2 + "'";
                                SqlCommand sportxiangmu2StartTimeCommand = new SqlCommand();
                                sportxiangmu2StartTimeCommand.Connection = con;
                                sportxiangmu2StartTimeCommand.CommandText = sportxiangmu2StartTimeSql;
                                sportxiangmu2StartTimeCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu2StartTime = (DateTime)sportxiangmu2StartTimeCommand.ExecuteScalar();

                                //-------------------------获取项目2开始时间---------------------

                                xiangmu2jieshushijianSql = "SELECT 比赛结束时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu2 + "'";
                                SqlCommand xiangmu2jieshushijianSqlCommand = new SqlCommand();
                                xiangmu2jieshushijianSqlCommand.Connection = con;
                                xiangmu2jieshushijianSqlCommand.CommandText = xiangmu2jieshushijianSql;
                                xiangmu2jieshushijianSqlCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu2jieshuTime = (DateTime)xiangmu2jieshushijianSqlCommand.ExecuteScalar();

                                //-------------------------获取项目2结束时间---------------------

                                sportxiangmu1StartTimeSql = "SELECT 实际检录时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmu1StartTimeSqlCommand = new SqlCommand();
                                sportxiangmu1StartTimeSqlCommand.Connection = con;
                                sportxiangmu1StartTimeSqlCommand.CommandText = sportxiangmu1StartTimeSql;
                                sportxiangmu1StartTimeSqlCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu1StartTime = (DateTime)sportxiangmu1StartTimeSqlCommand.ExecuteScalar();
                                //---------------------获取项目1检录时间--------------------------



                                //必须事先录入所有项目的开始时间与结束时间！！！！！！！否则运动员想要在非规定时间出场会报错！！！

                                if (xiangmujianlu1 == false && xiangmujianlu2 == false)
                                {
                                    Info.Text = "运动检录未开始！";
                                }
                                else //若其中一个项目开始检录
                                {

                                    // repeat = "SELECT 重复参赛,运动进出 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                                    // SqlCommand repeatCommand = new SqlCommand(repeat, con);
                                    // SqlDataReader RepeatData = repeatCommand.ExecuteReader();
                                    //---------------判断是否重复参赛----------------          
                                    // if (RepeatData.Read())
                                    //{
                                    //   repea = RepeatData.GetBoolean(0);
                                    //     SportIO = RepeatData.GetInt32(1);
                                    // }
                                    // RepeatData.Close();

                                    string DTsql;

                                    DTsql = "SELECT 时限 FROM 运动会设置 WHERE 用户 = '运动员'";
                                    SqlCommand DTsqlCommand = new SqlCommand();
                                    DTsqlCommand.Connection = con;
                                    DTsqlCommand.CommandText = DTsql;
                                    DTsqlCommand.CommandType = CommandType.Text;
                                    int DT = (int)DTsqlCommand.ExecuteScalar();

                                    DateTime xiangmu1jieshushixian = sportxiangmu1EndTime.AddMinutes(DT);
                                    DateTime xiangmu2jieshushijian = sportxiangmu2jieshuTime.AddMinutes(DT);
                                    DateTime xianzaishijian = DateTime.Now;
                                    //---------------------读取时限------------------------------
                                    if (xiangmu1jieshushixian >= sportxiangmu2StartTime)
                                    {
                                        if (xianzaishijian >= sportxiangmu1StartTime && xianzaishijian <= sportxiangmu2StartTime)
                                        {

                                            string UpDataOutTime;

                                            DateTime NowTime = DateTime.Now;
                                            if (SportIO <= 2)
                                            {
                                                SportIO++;
                                                UpDataOutTime = "UPDATE 运动会进出场数据 SET 出场时间 = ('" + NowTime + "') ,证件状态 = 'O',运动进出 =" + SportIO + " WHERE IC卡编号 = '" + ICOutNum + "'";
                                                SqlCommand UpDataOutTimeCommand = new SqlCommand();
                                                UpDataOutTimeCommand.Connection = con;
                                                UpDataOutTimeCommand.CommandText = UpDataOutTime;
                                                UpDataOutTimeCommand.CommandType = CommandType.Text;
                                                UpDataOutTimeCommand.ExecuteNonQuery();

                                                //---------------------------------------------写入出场时间、证件状态-------------------------------

                                                Info.Text = "运动员成功出场！";


                                                string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'O')";
                                                SqlCommand INSERTBackDataCommand = new SqlCommand();
                                                INSERTBackDataCommand.Connection = con;
                                                INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                                INSERTBackDataCommand.CommandType = CommandType.Text;
                                                INSERTBackDataCommand.ExecuteNonQuery();
                                                //---------------------------------------------写入后台数据----------------------------------

                                            }
                                            else
                                            {
                                                Info.Text = "运动员出场次数超过限制！禁止出场！";
                                            }

                                        }
                                        else
                                        {
                                            Info.Text = "时间未到，禁止通行！";

                                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'I')";
                                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                                            INSERTBackDataCommand.Connection = con;
                                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                            INSERTBackDataCommand.CommandType = CommandType.Text;
                                            INSERTBackDataCommand.ExecuteNonQuery();
                                            //------------------------------------------------写入后台数据----------------------------------

                                        }
                                    }
                                    else//其中一个项目开始
                                    {
                                        if ((xianzaishijian >= sportxiangmu1StartTime && xianzaishijian <= xiangmu1jieshushixian) || (xianzaishijian >= sportxiangmu2StartTime && xianzaishijian <= xiangmu2jieshushijian))
                                        {
                                            string UpDataOutTime;

                                            DateTime NowTime = DateTime.Now;

                                            if (SportIO <= 2)
                                            {
                                                SportIO++;

                                                UpDataOutTime = "UPDATE 运动会进出场数据 SET 出场时间 = ('" + NowTime + "') ,  证件状态 = 'O',运动进出 =" + SportIO + " WHERE IC卡编号 = '" + ICOutNum + "'";
                                                SqlCommand UpDataOutTimeCommand = new SqlCommand();
                                                UpDataOutTimeCommand.Connection = con;
                                                UpDataOutTimeCommand.CommandText = UpDataOutTime;
                                                UpDataOutTimeCommand.CommandType = CommandType.Text;
                                                UpDataOutTimeCommand.ExecuteNonQuery();

                                                //---------------------------------------------写入出场时间-------------------------------


                                                Info.Text = "成功出场！";
                                                //---------------------------------------------写入证件状态-------------------------------

                                                string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'O')";
                                                SqlCommand INSERTBackDataCommand = new SqlCommand();
                                                INSERTBackDataCommand.Connection = con;
                                                INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                                INSERTBackDataCommand.CommandType = CommandType.Text;
                                                INSERTBackDataCommand.ExecuteNonQuery();
                                                //------------------------------------------------写入后台数据----------------------------------
                                            }
                                            else
                                            {
                                                Info.Text = "运动员出场次数超过限制！禁止出场！";
                                            }
                                        }
                                        else
                                        {
                                            Info.Text = "时间未到，禁止通行！";

                                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'I')";
                                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                                            INSERTBackDataCommand.Connection = con;
                                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                            INSERTBackDataCommand.CommandType = CommandType.Text;
                                            INSERTBackDataCommand.ExecuteNonQuery();
                                            //------------------------------------------------写入后台数据----------------------------------

                                        }//时间未到，禁止通行
                                    }//其中一个项目开始
                                }//若其中一个项目开始检录
                            }//重复参赛
                        }//运动员出场

                        else if (SportIOState == "O") //运动员进场
                        {


                            string repeat = "SELECT 重复参赛 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";//变量是重载的
                            SqlCommand repeatCommand = new SqlCommand();//变量是重载的
                            repeatCommand.Connection = con;
                            repeatCommand.CommandText = repeat;
                            repeatCommand.CommandType = CommandType.Text;
                            bool repea = (bool)repeatCommand.ExecuteScalar();//变量是重载的

                            //---------------判断是否重复参赛----------------

                            if (repea == false) //不重复参赛
                            {

                                string sportxiangmu1,
                                       sportxiangmu1StartTimeSql,
                                       sportxiangmu1EndTimeSql;



                                sportxiangmu1 = "SELECT 运动会项目1 FROM 运动会进出场数据 WHERE IC卡编号 = '" + ICOutNum + "'";
                                SqlCommand sportxiangmu1Command = new SqlCommand();
                                sportxiangmu1Command.Connection = con;
                                sportxiangmu1Command.CommandText = sportxiangmu1;
                                sportxiangmu1Command.CommandType = CommandType.Text;
                                string xiangmu1 = (string)sportxiangmu1Command.ExecuteScalar();
                                //--------------------------获取项目1代码---------------------

                                sportxiangmu1StartTimeSql = "SELECT 实际检录时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmu1StartTimeSqlCommand = new SqlCommand();
                                sportxiangmu1StartTimeSqlCommand.Connection = con;
                                sportxiangmu1StartTimeSqlCommand.CommandText = sportxiangmu1StartTimeSql;
                                sportxiangmu1StartTimeSqlCommand.CommandType = CommandType.Text;

                                DateTime sportxiangmu1StartTime = (DateTime)sportxiangmu1StartTimeSqlCommand.ExecuteScalar();
                                //---------------------获取项目1检录时间--------------------------

                                sportxiangmu1EndTimeSql = "SELECT 比赛结束时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmu1EndTimeCommand = new SqlCommand();
                                sportxiangmu1EndTimeCommand.Connection = con;
                                sportxiangmu1EndTimeCommand.CommandText = sportxiangmu1EndTimeSql;
                                sportxiangmu1EndTimeCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu1EndTime = (DateTime)sportxiangmu1EndTimeCommand.ExecuteScalar();

                                //-------------------------获取项目1结束时间---------------------
                                string DTsql;

                                DTsql = "SELECT 时限 FROM 运动会设置 WHERE 用户 = '运动员'";
                                SqlCommand DTsqlCommand = new SqlCommand();
                                DTsqlCommand.Connection = con;
                                DTsqlCommand.CommandText = DTsql;
                                DTsqlCommand.CommandType = CommandType.Text;
                                int DT = (int)DTsqlCommand.ExecuteScalar();

                                DateTime xiangmu1jieshushixian = sportxiangmu1EndTime.AddMinutes(DT);
                                DateTime NowTime = DateTime.Now;
                                //---------------------读取时限------------------------------

                                if (NowTime >= sportxiangmu1StartTime && NowTime <= xiangmu1jieshushixian)
                                {
                                    string UpDataInTime;
                                    string UpDataInState;


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

                                    string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O', 'I')";
                                    SqlCommand INSERTBackDataCommand = new SqlCommand();
                                    INSERTBackDataCommand.Connection = con;
                                    INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                    INSERTBackDataCommand.CommandType = CommandType.Text;
                                    INSERTBackDataCommand.ExecuteNonQuery();
                                    //------------------------------------------------写入后台数据----------------------------------

                                }
                                else
                                {
                                    string UpDataInState;

                                    UpDataInState = "UPDATE 运动会进出场数据 SET 证件状态 = 'L' WHERE IC卡编号 = '" + ICOutNum + "'";
                                    SqlCommand UpDataInStateCommand = new SqlCommand();
                                    UpDataInStateCommand.Connection = con;
                                    UpDataInStateCommand.CommandText = UpDataInState;
                                    UpDataInStateCommand.CommandType = CommandType.Text;
                                    UpDataInStateCommand.ExecuteNonQuery();

                                    Info.Text = "超时锁卡！";
                                    //---------------------------------------------写入证件状态-------------------------------

                                    string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O', 'L')";
                                    SqlCommand INSERTBackDataCommand = new SqlCommand();
                                    INSERTBackDataCommand.Connection = con;
                                    INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                    INSERTBackDataCommand.CommandType = CommandType.Text;
                                    INSERTBackDataCommand.ExecuteNonQuery();
                                    //------------------------------------------------写入后台数据----------------------------------

                                }

                            }
                            else    //重复参赛
                            {
                                string sportxiangmu1, sportxiangmujianlu1,
                                   sportxiangmu2, sportxiangmujianlu2,
                                   sportxiangmu1StartTimeSql, sportxiangmu2StartTimeSql,
                                   sportxiangmu1EndTimeSql, xiangmu2jieshushijianSql;


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

                                sportxiangmu1EndTimeSql = "SELECT 比赛结束时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmu1EndTimeCommand = new SqlCommand();
                                sportxiangmu1EndTimeCommand.Connection = con;
                                sportxiangmu1EndTimeCommand.CommandText = sportxiangmu1EndTimeSql;
                                sportxiangmu1EndTimeCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu1EndTime = (DateTime)sportxiangmu1EndTimeCommand.ExecuteScalar();

                                //-------------------------获取项目1结束时间---------------------

                                sportxiangmu2StartTimeSql = "SELECT 实际检录时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu2 + "'";
                                SqlCommand sportxiangmu2StartTimeCommand = new SqlCommand();
                                sportxiangmu2StartTimeCommand.Connection = con;
                                sportxiangmu2StartTimeCommand.CommandText = sportxiangmu2StartTimeSql;
                                sportxiangmu2StartTimeCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu2StartTime = (DateTime)sportxiangmu2StartTimeCommand.ExecuteScalar();

                                //-------------------------获取项目2开始时间---------------------


                                xiangmu2jieshushijianSql = "SELECT 比赛结束时间 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu2 + "'";
                                SqlCommand xiangmu2jieshushijianSqlCommand = new SqlCommand();
                                xiangmu2jieshushijianSqlCommand.Connection = con;
                                xiangmu2jieshushijianSqlCommand.CommandText = xiangmu2jieshushijianSql;
                                xiangmu2jieshushijianSqlCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu2jieshuTime = (DateTime)xiangmu2jieshushijianSqlCommand.ExecuteScalar();

                                //-------------------------获取项目2结束时间---------------------

                                sportxiangmu1StartTimeSql = "SELECT 实际检录时间 FROM 运动会进出场数据 WHERE 项目代码 = '" + xiangmu1 + "'";
                                SqlCommand sportxiangmu1StartTimeSqlCommand = new SqlCommand();
                                sportxiangmu1StartTimeSqlCommand.Connection = con;
                                sportxiangmu1StartTimeSqlCommand.CommandText = sportxiangmu1StartTimeSql;
                                sportxiangmu1StartTimeSqlCommand.CommandType = CommandType.Text;
                                DateTime sportxiangmu1StartTime = (DateTime)sportxiangmu1StartTimeSqlCommand.ExecuteScalar();

                                //---------------------获取项目1检录时间--------------------------


                                string DTsql;

                                DTsql = "SELECT 时限 FROM 运动会设置 WHERE 用户 = '运动员'";
                                SqlCommand DTsqlCommand = new SqlCommand();
                                DTsqlCommand.Connection = con;
                                DTsqlCommand.CommandText = DTsql;
                                DTsqlCommand.CommandType = CommandType.Text;
                                int DT = (int)DTsqlCommand.ExecuteScalar();

                                DateTime xiangmu1jieshushixian = sportxiangmu1EndTime.AddMinutes(DT);
                                DateTime xiangmu2jieshushijian = sportxiangmu2jieshuTime.AddMinutes(DT);
                                DateTime xianzaishijian = DateTime.Now;

                                //---------------------读取时限------------------------------

                                if (xiangmu1jieshushixian >= sportxiangmu2StartTime)
                                {
                                    if (xianzaishijian >= sportxiangmu1StartTime && xianzaishijian <= sportxiangmu2StartTime)
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

                                        string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O', 'I')";
                                        SqlCommand INSERTBackDataCommand = new SqlCommand();
                                        INSERTBackDataCommand.Connection = con;
                                        INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                        INSERTBackDataCommand.CommandType = CommandType.Text;
                                        INSERTBackDataCommand.ExecuteNonQuery();
                                        //------------------------------------------------写入后台数据----------------------------------

                                    }

                                    else
                                    {
                                        string UpDataLockState = "UPDATE 运动会进出场数据 SET 证件状态 = 'L' WHERE IC卡编号 = '" + ICOutNum + "'";
                                        SqlCommand UpDataLockStateCommand = new SqlCommand();
                                        UpDataLockStateCommand.Connection = con;
                                        UpDataLockStateCommand.CommandText = UpDataLockState;
                                        UpDataLockStateCommand.CommandType = CommandType.Text;
                                        UpDataLockStateCommand.ExecuteNonQuery();

                                        Info.Text = "超时锁卡！";

                                        string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O', 'L')";
                                        SqlCommand INSERTBackDataCommand = new SqlCommand();
                                        INSERTBackDataCommand.Connection = con;
                                        INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                        INSERTBackDataCommand.CommandType = CommandType.Text;
                                        INSERTBackDataCommand.ExecuteNonQuery();
                                        //------------------------------------------------写入后台数据----------------------------------

                                    }
                                }
                                else //两比赛之间隔大于20
                                {
                                    if ((xianzaishijian >= sportxiangmu1StartTime && xianzaishijian <= xiangmu1jieshushixian) || (xianzaishijian >= sportxiangmu2StartTime && xianzaishijian <= xiangmu2jieshushijian))
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

                                        //---------------------------------------------写入出场时间-------------------------------

                                        UpDataInState = "UPDATE 运动会进出场数据 SET 证件状态 = 'I' WHERE IC卡编号 = '" + ICOutNum + "'";
                                        SqlCommand UpDataInStateCommand = new SqlCommand();
                                        UpDataInStateCommand.Connection = con;
                                        UpDataInStateCommand.CommandText = UpDataInState;
                                        UpDataInStateCommand.CommandType = CommandType.Text;
                                        UpDataInStateCommand.ExecuteNonQuery();

                                        Info.Text = "成功入场！";
                                        //---------------------------------------------写入证件状态-------------------------------

                                        string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O', 'L')";
                                        SqlCommand INSERTBackDataCommand = new SqlCommand();
                                        INSERTBackDataCommand.Connection = con;
                                        INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                                        INSERTBackDataCommand.CommandType = CommandType.Text;
                                        INSERTBackDataCommand.ExecuteNonQuery();
                                        //------------------------------------------------写入后台数据----------------------------------

                                    }
                                    else
                                    {
                                        string UpDataLockState;
                                        UpDataLockState = "UPDATE 运动会进出场数据 SET 证件状态 = 'L' WHERE IC卡编号 = '" + ICOutNum + "'";
                                        SqlCommand UpDataLockStateCommand = new SqlCommand();
                                        UpDataLockStateCommand.Connection = con;
                                        UpDataLockStateCommand.CommandText = UpDataLockState;
                                        UpDataLockStateCommand.CommandType = CommandType.Text;
                                        UpDataLockStateCommand.ExecuteNonQuery();

                                        Info.Text = "超时锁卡！";

                                        string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O', 'L')";
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
                        else if (SportIOState == "L")
                        {
                            Info.Text = "超时卡已锁";

                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'L', 'L')";
                            SqlCommand INSERTBackDataCommand = new SqlCommand();
                            INSERTBackDataCommand.Connection = con;
                            INSERTBackDataCommand.CommandText = INSERTBackDataSql;
                            INSERTBackDataCommand.CommandType = CommandType.Text;
                            INSERTBackDataCommand.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------

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

                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'I', 'O')";
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

                            string INSERTBackDataSql = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + Number + "', 'O', 'I')";
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


    protected void click_Click(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}
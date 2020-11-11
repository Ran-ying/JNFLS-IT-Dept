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

public partial class FunctionSports_SET : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);
        con1.Open();
        try
        {
            string SelectedSporterSql, upclubdata, GameName;

            DateTime NowTime = DateTime.Now;

            
            GameName = DropDownList2.SelectedValue.ToString();

            bool a = true;

            upclubdata = "UPDATE 运动会项目 SET 实际检录时间 = ('" + NowTime + "') , 比赛开始 = '"+ a +"' WHERE 项目代码 = '" + GameName + "'";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con1;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

            //--------------------------录入检录时间-----------------------------------
            string DTsql;

            DTsql = "SELECT 时限 FROM 运动会设置 WHERE 用户 = '学生'";
            SqlCommand DTsqlCommand = new SqlCommand();
            DTsqlCommand.Connection = con1;
            DTsqlCommand.CommandText = DTsql;
            DTsqlCommand.CommandType = CommandType.Text;
            int DT = (int)DTsqlCommand.ExecuteScalar();


            //---------------------读取时限------------------------------






            SelectedSporterSql = "SELECT IC卡编号 FROM 运动会进出场数据 WHERE (运动会项目1 = '" + GameName + "' OR 运动会项目2 = '" + GameName + "')";

            SqlCommand SelectedSporterIns = new SqlCommand(SelectedSporterSql, con1);
            SqlDataReader SelectedSporterDa = SelectedSporterIns.ExecuteReader();//=============先搜一遍班级数
            string IC;


            string[] NUM = new string[100];
            int count=0;

            while (SelectedSporterDa.Read())
            {
                NUM[count] = SelectedSporterDa.GetString(0);           
                count++;
            }
            SelectedSporterDa.Close();

           for (int i = 0; i <= count; i++)

            {
                IC = NUM[i];

                string ClubConnectionString2 = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
                SqlConnection con2 = new SqlConnection(ClubConnectionString);
                con2.Open();

                string SelectedSporterQXSql = "SELECT 权限 FROM 运动会权限 WHERE IC卡编号 = '" + IC + "'";
                SqlCommand SelectedSporterQXIns = new SqlCommand(SelectedSporterQXSql, con2);
                SqlDataReader SelectedSporterQXDa = SelectedSporterQXIns.ExecuteReader();
                int QX;
                if (SelectedSporterQXDa.Read())
                {
                    QX = SelectedSporterQXDa.GetInt32(0);

                    if (QX == 1)
                    {       
                        SelectedSporterQXDa.Close();

                            string upsporterdate1;

                            upsporterdate1 = "UPDATE 运动会权限 SET 权限 = '2' WHERE IC卡编号 = '" + IC + "'";
                            SqlCommand upsporterdataCommand1 = new SqlCommand();
                            upsporterdataCommand1.Connection = con1;
                            upsporterdataCommand1.CommandText = upsporterdate1;
                            upsporterdataCommand1.CommandType = CommandType.Text;
                            upsporterdataCommand1.ExecuteNonQuery();

                            //================更改场外运动员权限


                           

                            string INSERTBackDataSql2 = "INSERT INTO 运动会后台数据 (时间,操作者,IC卡编号,刷卡前状态,刷卡后状态) VALUES ('" + NowTime + "', '" + Session["名字"] + "','" + IC + "', 'O','O')";
                            SqlCommand INSERTBackData2Command = new SqlCommand();
                            INSERTBackData2Command.Connection = con1;
                            INSERTBackData2Command.CommandText = INSERTBackDataSql2;
                            INSERTBackData2Command.CommandType = CommandType.Text;
                            INSERTBackData2Command.ExecuteNonQuery();
                            //------------------------------------------------写入后台数据----------------------------------

                           
                        }
                       
                }
                con2.Close();

                    
              
            }
     
            Label2.Text = "成功！";
        }
        finally
        {
            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
          string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            string Grade = DropDownList1.SelectedValue;
            string GameName = DropDownList2.SelectedValue;
            DateTime NowTime = DateTime.Now;

            bool a = true;
            upclubdata = "UPDATE 运动会项目 SET 比赛结束时间 = ('" + NowTime + "') ,比赛结束 = '" + a + "' WHERE 项目代码 = '" + GameName + "'";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

            Label2.Text = "成功！";
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
    
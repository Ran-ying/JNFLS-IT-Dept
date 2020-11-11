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

public partial class FunctionSports_upgrade : System.Web.UI.Page
{
    public string  cla,nam,xiangmu,num,saicheng,IC;
    public int gra, mingci=0;
    public string next;
    protected void Page_Load(object sender, EventArgs e)
    {
        string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
        SqlConnection con = new SqlConnection(SportConnectionString);
        con.Open();
        try
        {
            string SportManageSql;


            SportManageSql = "SELECT 运动会出入场管理 FROM 权限表,用户 WHERE 用户.名字 = '" + Session["名字"] + "' AND 用户.用户组 = 权限表.职务";
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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "up")
        {
            string SportConnectionString = ConfigurationManager.ConnectionStrings["SportConnectionString"].ToString();
            SqlConnection con = new SqlConnection(SportConnectionString);
            con.Open();
            try
            {
                string SearchGradeSql;
                

                SearchGradeSql = "SELECT 年级,班级,姓名,项目,号码,赛程,IC卡编号 FROM 运动会比赛名单 WHERE ID = '" + e.CommandArgument.ToString() + "'";

                SqlCommand SearchGradeIns = new SqlCommand(SearchGradeSql, con);
                SqlDataReader SearchGradeDa = SearchGradeIns.ExecuteReader();//=============先搜一遍班级数

                if (SearchGradeDa.Read())
                {
                    gra = SearchGradeDa.GetInt32(0);
                    cla = SearchGradeDa.GetString(1);
                    nam = SearchGradeDa.GetString(2);
                    xiangmu = SearchGradeDa.GetString(3);
                    num = SearchGradeDa.GetString(4);
                    saicheng = SearchGradeDa.GetString(5);
                    IC = SearchGradeDa.GetString(6);
                }
                SearchGradeDa.Close();
                
                //============================以上读取数据==============================


                //=====================分晋级和发奖
                if (saicheng=="决赛"||saicheng=="预决赛")
                {
                //============================发奖
                string upSql;

                upSql = "INSERT INTO 运动会决赛发奖(年级,班级,姓名,项目,号码,已发奖) VALUES('" + gra.ToString() + "','" + cla + "','" + nam + "','"+xiangmu+"','"+num+"','false')";
                SqlCommand upCommand = new SqlCommand();
                upCommand.Connection = con;
                upCommand.CommandText = upSql;
                upCommand.CommandType = CommandType.Text;
                

                DateTime NowTime = DateTime.Now;

                if (gra==0||cla==""||nam==""||xiangmu==""||num=="")
                {
                    Info.Text = "提交失败！（" + NowTime.ToString() + "）";
                }
                else
                {
                upCommand.ExecuteNonQuery();
                Info.Text = "提交成功！（" + NowTime.ToString() + "）";//==========显示提交时间以确认提交
                }
                }
                else//=====================晋级
                {
                    string SearchXMSql;//===========搜索晋级项目


                    SearchXMSql = "SELECT 晋级项目代号 FROM 运动会项目 WHERE 项目代码 = '" + xiangmu + "'";

                    SqlCommand SearchXMIns = new SqlCommand(SearchXMSql, con);
                    SqlDataReader SearchXMDa = SearchXMIns.ExecuteReader();//=============先搜一遍班级数
                    
                    if (SearchXMDa.Read())
                    {
                        next = SearchXMDa.GetString(0);
                    }
                    SearchXMDa.Close();
                    string SearchXM1Sql;//===========搜索晋级项目
                    string XM1,XM2;

                    SearchXM1Sql = "SELECT 运动会项目1,运动会项目2 FROM 运动会进出场数据 WHERE IC卡编号 = '" + IC + "'";

                    SqlCommand SearchXM1Ins = new SqlCommand(SearchXM1Sql, con);
                    SqlDataReader SearchXM1Da = SearchXM1Ins.ExecuteReader();//=============先搜一遍班级数

                    if (SearchXM1Da.Read())
                    {
                        XM1 = SearchXM1Da.GetString(0);
                        XM2 = SearchXM1Da.GetString(1);

                        if (XM1==xiangmu)
                        {
                        string sportupdataSql;

                        sportupdataSql = "UPDATE 运动会进出场数据 SET 运动会项目1 = '" + next.ToString() + "' WHERE IC卡编号 = '" + IC + "'";
                        SqlCommand sportupdataCommand = new SqlCommand();
                        sportupdataCommand.Connection = con;
                        sportupdataCommand.CommandText = sportupdataSql;
                        sportupdataCommand.CommandType = CommandType.Text;
                        
                        sportupdataCommand.ExecuteNonQuery();
                        }
                        else if (XM2 == xiangmu)
                        {
                            string sportupdataSql;

                            sportupdataSql = "UPDATE 运动会进出场数据 SET 运动会项目2 = '" + next.ToString() + "' WHERE IC卡编号 = '" + IC + "'";
                            SqlCommand sportupdataCommand = new SqlCommand();
                            sportupdataCommand.Connection = con;
                            sportupdataCommand.CommandText = sportupdataSql;
                            sportupdataCommand.CommandType = CommandType.Text;

                            sportupdataCommand.ExecuteNonQuery();
                        }

                        }
                    SearchXM1Da.Close();
                    

                    string upSql;

                    upSql = "INSERT INTO 运动会比赛名单(年级,班级,姓名,项目,号码,赛程，IC卡编号) VALUES('" + gra.ToString() + "','" + cla + "','" + nam + "','" + next + "','" + num + "','决赛','"+IC+"')";
                    SqlCommand upCommand = new SqlCommand();
                    upCommand.Connection = con;
                    upCommand.CommandText = upSql;
                    upCommand.CommandType = CommandType.Text;


                    DateTime NowTime = DateTime.Now;

                    if (gra == 0 || cla == "" || nam == "" || xiangmu == "" || num == "")
                    {
                        Info.Text = "提交失败！（" + NowTime.ToString() + "）";
                    }
                    else
                    {
                        upCommand.ExecuteNonQuery();
                        Info.Text = "提交成功！（" + NowTime.ToString() + "）";//==========显示提交时间以确认提交
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


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
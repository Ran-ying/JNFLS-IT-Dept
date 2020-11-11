using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;

public partial class _Default : System.Web.UI.Page
{
    public string sex = "";
    public int peopleofDorm = 0;
    public bool AllBed = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
         mansql5 = "INSERT INTO 扣分(班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级班级,宿舍编号,备注) 
         * VALUES( '" + CheckBoxList1.Items[i].Value + "','";
         Session["usersname"] + "','" + RadioButtonList1.SelectedValue + "','" + TextBox1.Text + "',getdate()" + ",'" + Session["名字"] + "','" + Session["部门名"] + "','";
          Session["部门"] + "','" + Session["年级名"] + clan + "','" + DropDownList3.SelectedValue + "','" + TextBox2.Text + "')";
                                     */

        if (Session["职务"].ToString() == "4")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'>alert('对不起您无权进行命令量化！');</script>");
            Response.Flush();
            Response.End();
            Response.Redirect("http://192.168.0.168/FunctionScores/FrameOfTeachers.aspx");
        }
        if (Session["部门名"].ToString().StartsWith("男"))
        {
            sex = "男";
        }
        else
            sex = "女";

        SqlDataSource1.SelectCommand = "SELECT [原因] FROM [扣分原因] where 部门='" + (Session["部门名"].ToString() == "男宿部" || Session["部门名"].ToString() == "女宿部" ? "宿管部" : Session["部门名"].ToString()) + "'";
        SqlDataSource2.SelectCommand = "SELECT [宿舍楼] FROM [宿舍单元] where 年级='"+Session["年级ID"].ToString()+"'";
    }
    protected void 确定_Click(object sender, EventArgs e)
    {
        #region variable
        string str = 命令.Text;
        string[] str2 = str.Split(new string[] { " ", "\r\n" }, System.StringSplitOptions.RemoveEmptyEntries);//str.Split(new char[] { ' ', '\n', '\r' });
        int linenumber = 0;


        float scores=0;
        bool differentDorm = true;
        string SQL="";
        string Class = "";
        
        string Dorm = "";
        string FailDorm = "";
        bool ok = true;
        string[] unsameDorm;
        int beds = 0;
                string strnumOfbeds = "";
        string Dormnumber="";
        #endregion
        for (int i = 0; i < str2.Length; i++)
        {

            if (str2[i].Length == 3 && SQLClass.isMadeOfNumbers(str2[i]))
            {
                AllBed = false;
                Dorm = str2[i];
                #region 转换分数
                try
                {
                    scores = Convert.ToSingle(str2[i + 1]);
                }
                catch
                {
                    ok = false;
                    FailDorm += Dorm + ".";
                    continue;
                }
                #endregion
                #region 读取宿舍号对应班级+是否浑宿 
                string consql = "SELECT 混宿,班级名称,编号,人数 FROM 宿舍 Where 单元 ='" + 宿舍楼.SelectedValue + "' AND 宿舍名='" + Dorm + "'";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
                {
                con.Open();
                SqlCommand cons = new SqlCommand(consql, con);
                SqlDataReader conda = cons.ExecuteReader();
                while (conda.Read())
                {
                    differentDorm = conda.GetBoolean(0);
                    if(differentDorm==false)
                    Class = conda.GetString(1);
                    Dormnumber=conda.GetString(2);
                    peopleofDorm = conda.GetInt32(3);
                }
                conda.Close();
                con.Close();
                }
                #endregion//添加班级编号对应的班级一列!!!!!!!
                #region 合成床号String或者统计床数
                for(int j = 2;i+j<str2.Length&&str2[i + j].Length != 3;j++)
                {
                    strnumOfbeds += str2[i + j] + ",";
                    beds++;
                }
               #endregion
                #region 不输入床号及全选 以及 除去床号
                if (beds == 0)
                {
                    AllBed = true;
                    beds = peopleofDorm;
                    if (differentDorm == true)
                    {
                        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
                        {
                            con.Open();
                            SqlCommand sqlcom = new SqlCommand("SELECT 床号 FROM 混宿 WHERE 宿舍编号='"+Dormnumber+"'", con);
                            SqlDataReader reader = sqlcom.ExecuteReader();
                            while (reader.Read())
                            {
                                strnumOfbeds += reader.GetInt32(0).ToString() + ",";
                            }
                            con.Close();
                        }
                    }
                }
                else if(strnumOfbeds.StartsWith("-"))
                {
                    
                    string[] cutbed = strnumOfbeds.Split(new string[] { "," }, System.StringSplitOptions.RemoveEmptyEntries);
                    beds = peopleofDorm - cutbed.Length;
                    strnumOfbeds=SQLClass.GetOtherBed(cutbed, sex);
                }
                #endregion

                if (differentDorm ==true) 
                {
                    unsameDorm = strnumOfbeds.Split(new string[]{","},System.StringSplitOptions.RemoveEmptyEntries);
                    scores /= beds;
                    for (int a = 0; a < unsameDorm.Length; a++) 
                    {
                        Class=SQLClass.GetClass("SELECT 班级名称 FROM 混宿 WHERE 宿舍编号='"+Dormnumber+"' AND 床号='"+unsameDorm[a]+"'");//THERE
                        if (Class == "")
                        { 
                        FailDorm += (Dorm + ":" + unsameDorm[a] + "。");
                        continue;
                        }
                        SQL = "INSERT INTO 扣分(班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,宿舍编号,备注)  VALUES( '"
                        + Class + "','" + Session["usersname"].ToString() + "','" + 原因.SelectedValue + "','" + scores.ToString()+"','" + DateTime.Now + "','" + Session["名字"].ToString()
                        + "','" + Session["部门名"].ToString() + "','" + Session["部门"].ToString() + "','" + Session["年级名"].ToString() + "','" + Dorm + "','宿舍："
                        + 宿舍楼.SelectedValue + "[" + Dorm + "]" + "备注:" + 备注.Text + "。床号:" + unsameDorm[a] + "。')";
                        if (SQLClass.Write(SQL) <= 0)
                        {
                            FailDorm += Dorm +":"+unsameDorm[a]+ ",";
                            ok = false;
                            continue;
                        }
                    }
                }
                else
                {
                    SQL="INSERT INTO 扣分(班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,宿舍编号,备注) VALUES('" 
                        + Class + "','"+  Session["usersname"].ToString() + "','" + 原因.SelectedValue + "','" + scores.ToString() +"','"+ DateTime.Now+ "','" + Session["名字"].ToString()
                        + "','" + Session["部门名"].ToString() + "','" + Session["部门"].ToString() + "','" + Session["年级名"].ToString() + "','" + Dorm + "','宿舍："
                        + 宿舍楼.SelectedValue + "[" + Dorm + "]" + "备注:" + 备注.Text + "。床号:" + (AllBed?"全部":strnumOfbeds) + "')";
                    if (SQLClass.Write(SQL) <= 0) 
                    {
                        FailDorm += Dorm + ",";
                        ok = false;
                        continue;
                    }
                }
                

                linenumber++;

                beds = 0;
                strnumOfbeds = "";
            }
            else
                continue;
        }
        if (ok) 
        {
            Response.Clear();
            Response.Write(" <script language='javascript'>alert('成功输入" + linenumber.ToString() + "行量化记录!"+FailDorm+"');</script>");
            Response.Flush();
            Response.End();
            Response.Redirect("http://192.168.0.168/FunctionScores/CommandScores.aspx");
        }
        else
        {
             Response.Clear();
             Response.Write(" <script language='javascript'>alert('分数错误或数据库连接错误!宿舍" + FailDorm + "输入失败');</script>");
                   Response.Flush();
                    Response.End();
                    Response.Redirect("http://192.168.0.168/FunctionScores/CommandScores.aspx");
        }
        //----------------------------------------------------------------------------------------------------------------------
        string NewSQL = "INSERT INTO BUG VALUES('" + Session["usersname"].ToString()+ "','[Score]"+str+"','"+DateTime.Now+"')";
        SQLClass.Write(NewSQL);

    }
    


    
}
class SQLClass
{
    public static int Write(string str)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
        {
            int i=0;
            con.Open();
            SqlCommand cons = new SqlCommand(str, con);
           i=cons.ExecuteNonQuery();
            con.Close();
            return i;
        }
    }
    public static string GetClass(string str) 
    {
        string Class="";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString()))
        {
            con.Open();
            SqlCommand sqlcom=new SqlCommand(str,con);
            SqlDataReader reader=sqlcom.ExecuteReader();
            while(reader.Read())
            {
                Class=reader.GetString(0);
            }
            con.Close();
        }
            return Class;
        }
    public static bool isMadeOfNumbers(string str) 
    {
        char [] arr=str.ToCharArray();
        for (int i = 0; i < arr.Length;i++ )
        {
            if (Char.IsNumber(arr[i]) == false)
                return false;
        }
        return true;
    }
    public static string GetOtherBed(string[] str, string b)
    {
        string[] ch;
        int num = 0;
        string ret = "";
        if(b=="男")
            ch=new string[6]{"1","2","3","4","5","6"};
        else
            ch=new string[10]{"1","2","3","4","5","6","7","8","9","10"};
        foreach (string s in str) 
        {
            num=isInx(ch, s.Substring(1, s.Length - 1));
            if (num != -1)
                ch[num] = "0";
        }
        foreach (string a in ch) 
        {
            if (a != "0")
                ret += a+",";
        }
        return ret;
    }
    public static int isInx(string[] str, string str2) 
    {
        for(int a=0;a<str.Length;a++)
        {
            if (str[a] == str2)
                return a;
        }
        return -1;
    }
}


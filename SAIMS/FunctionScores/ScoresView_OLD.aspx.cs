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
//using System.Xml;
//显示无效量化没写
public partial class Old_Search : System.Web.UI.Page
{
     #region 变量们
    public bool 量化作废Bol=true;
    public bool 显示查询块 = true,没有数据=false,显示结果块=false, 显示分数编辑者Bol = false, 本部门量化Bol = false , 全年级量化Bol=false
    , 本班级量化Bol = false, 本年级量化Bol = false, 显示折合分数Bol = false, 什么都没有输入 = false, 量化查询Bol=false,没有登录Bol = false;
    public int IDforName = 0,ZHEHEFEN=0;
    public string Department = "",REASON="",DUIXIANG="";//DUIXAING 没写!
    public string Name = "", CAOZUOBANJI = "",总SQL=""; public int 扣分部门代号 = 0; public bool 显示折合分 = false;
    public double 计算折合分 = 0;
     
    public double KOUFENSHU = 0; public DateTime KOUFENSHIJIAN;public  bool KOUFEN_zhuangtai=false;
    public string 扣分部门="";
    public string CHAXUNYUJU = "";
    public int a = 0;
    public string 菜单项 = ""; public DateTime date = new DateTime();
    public string 综合搜索的SQL语句 = "";
    public string consql = "SELECT ID,扣分部门,扣分人姓名,年级,扣分数,扣分原因,扣分时间,是否有效,扣分部门,班级,备注 from [MainSQL].[dbo].[扣分] ";
    public const int 每页条数=10;
    public int 页数 = 1,k=0,已读取条数=0,部门ID=0;
    public int j = 0; public bool bb = false;
    #endregion
    #region 各种函数

    public string SQLStr(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();

        string SQLstr;

        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        string a = (string)SQLCom.ExecuteScalar();
        return a;

    }
    public bool SQLBol(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();

        string SQLstr;

        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        bool a = (bool)SQLCom.ExecuteScalar();
        return a;
    }
    public int SQLInt(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();

        string SQLstr;

        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        int a = (int)SQLCom.ExecuteScalar();
        return a;

    }
    public double SQLFlo(string SQLstring)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();

        string SQLstr;

        SQLstr = SQLstring;
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        double a = (double)SQLCom.ExecuteScalar();
        return a;
    }

        public void ZUOFEI(int id)
        {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        string SQLstr;
        SQLstr = "UPDATE 扣分 SET 是否有效=False WHERE ID='" + id +"'";
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        SQLCom.ExecuteNonQuery();


        }
     public void 提示框(string 返回地址,string 内容) 
    {
        Response.Clear();
        Response.Write(" <script language='javascript'+>top.location='"+返回地址+"';alert('"+内容+"');</script>");
        Response.Flush();
        Response.End();
    }

#endregion


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "OK")
        {
            没有登录Bol = true;
        }

        if (Session["职务"].ToString() == "4")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='/jssm/FunctionScores/FrameOfTeachers.aspx';</script>");
            Response.Flush();
            Response.End();
        }
        
        string consql0 = "SELECT 显示分数编辑者,本部门量化,全年级量化,本班级量化,本年级量化,是否折合分数,量化查询,ID,量化作废 FROM 权限表 WHERE 职务 = '" + Session["职务"]+ "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();//权限读取数据库
        SqlCommand cons0 = new SqlCommand(consql0, con);
        SqlDataReader conda0 = cons0.ExecuteReader();




        while (conda0.Read())
        {
            显示分数编辑者Bol = conda0.GetBoolean(0);
            本部门量化Bol = conda0.GetBoolean(1);
            全年级量化Bol = conda0.GetBoolean(2);
            本班级量化Bol = conda0.GetBoolean(3);
            本年级量化Bol = conda0.GetBoolean(4);
            显示折合分数Bol = conda0.GetBoolean(5);
            量化查询Bol = conda0.GetBoolean(6);
            部门ID=conda0.GetInt32(7);
            量化作废Bol = conda0.GetBoolean(8);
        }//读取权限

        con.Close();
        //HERE!
        if (量化查询Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='/jssm/index.aspx';alert('对不起,您没有量化查询权限!');</script>");
            Response.Flush();
            Response.End();
        }//判断有木有查询分数的权限鸟。
        if (显示分数编辑者Bol == false)
        {
            XINGMING.Enabled = false;
            姓名.Visible = false;
            按姓名查询.Enabled = false;
            //班主任不可用姓名查询.
        }
        if (本部门量化Bol)
        {
            BUMEN.Enabled = false;
            BUMENLIST.Enabled = false;
            //BUMENLIST.Text = "";
        }

        con.Close();
        //----------------------------------------------------------------------=-=-=-=-==-----------------------------------------------------
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con2.Open();//权限读取数据库
        string consql1 = "SELECT 班级,年级 FROM 班级 WHERE 班级<>'学校' AND 班级 <>'级部' AND 班级<>'教育处' ORDER BY 年级";
        string 年级 = "";
        SqlCommand cons = new SqlCommand(consql1, con2);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            if (conda.GetInt32(1) == 1)
            {
                年级 = "高一";
            }
            if (conda.GetInt32(1) == 2)
            {
                年级 = "高二";
            }
            if (conda.GetInt32(1) == 3)
            {
                年级 = "高三";
            }
            BANJILIST.Items.Add(年级 + conda.GetString(0));
        }//班级LIST项目添加
        检索班级.SelectCommand = "";
        con2.Close();
        SqlConnection con3 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con3.Open();//权限读取数据库
        string consql2 = "SELECT 部门名,年级 FROM 部门 WHERE 年级<>'4' ORDER BY 年级";
        SqlCommand cons11 = new SqlCommand(consql2, con3);
        SqlDataReader conda2 = cons11.ExecuteReader();
        string 部门年级 = ""; bool bo = false;
        while (conda2.Read())
        {
            if (conda2.GetString(0).ToString().StartsWith("高"))
            bo = true;  
            if (conda2.GetInt32(1) == 1)
            {
                部门年级 = "高一";
            }
            if (conda2.GetInt32(1) == 2)
            {
                部门年级 = "高二";
            }
            if (conda2.GetInt32(1) == 3)
            {
                部门年级 = "高三";
            }
            BUMENLIST.Items.Add((bo?"":部门年级) + conda2.GetString(0));
            bo = false;
        }//班级LIST项目添加
        检索部门.SelectCommand = "";
        con3.Close();
    }
    
    public string CHECKING( int a,string str,bool B) 
    {
        if (a > 0&&B)
        {
            a -= 1;
            return str;
        }
        else
            return "";
    }
    #region 各种check，仅为了观赏效果.

    protected void BANJI_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void SUSHE_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void BUMEN_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void SHIJIAN_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void WUXIAOLIANGHUA_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void BANJISHUNXU_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void RIQISHUNXU_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void RIQIDAOXU_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void FENSHUPAIXU_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
    }
    protected void TIJIAOREN_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;

    }
     protected void ZONGHEJIANSUO_CheckedChanged(object sender, EventArgs e)
    { 
        按姓名查询.Checked = false;
        XINGMING.Enabled = false; 
        BANJI.Enabled =true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled =true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled =true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true;ZONGHEJIANSUO.Checked = true;
    }
    protected void 按姓名查询_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = false;
            XINGMING.Enabled = true;
            BANJI.Enabled = false;
            SUSHE.Enabled = false;
            BUMEN.Enabled = false;
            SHIJIAN.Enabled = false;
            WUXIAOLIANGHUA.Enabled = false;
            BANJISHUNXU.Enabled = false;
            RIQISHUNXU.Enabled = false;
            RIQIDAOXU.Enabled = false;
            FENSHUPAIXU.Enabled = false;
            TIJIAOREN.Enabled = false;
    }  
    #endregion 
    protected void Sure_Click(object sender, EventArgs e)
    {
        查询div.Visible = false;
        结果div.Visible = true;
        #region 如果什么都没有输入
    if (ZONGHEJIANSUO.Checked==false && BUMEN.Checked ==false && SUSHE.Checked == false && BANJI.Checked == false && SHIJIAN.Checked == false &&XINGMING.Text==""&&按姓名查询.Enabled==false&&按姓名查询.Checked==false)
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>top.location='/jssm/Search.aspx';alert('对不起,你啥都没有输入!!');</script>");
                Response.Flush();
                Response.End();
            }
        #endregion
        #region 按姓名查询
        if (((XINGMING.Text=="")==false) && XINGMING.Enabled )
        {
            string 年级 = ""; string consql附加条件 = "";
            if (Session["班级"].ToString().StartsWith("1")) 年级 = "高一";
            if (Session["班级"].ToString().StartsWith("2")) 年级 = "高二";
            if (Session["班级"].ToString().StartsWith("3")) 年级 = "高三";
            if (全年级量化Bol)
            { consql附加条件 = "where 扣分人姓名='" + XINGMING.Text + "' AND(班级<>'级部' OR 班级<>'教育处' OR 班级<>'学校') ORDER BY 扣分时间"; }
            if(本年级量化Bol)
            { consql附加条件 = "where 扣分人姓名='" + XINGMING.Text + "' AND(班级<>'级部' OR 班级<>'教育处' OR 班级<>'学校' AND 年级 ='" + 年级 + "') ORDER BY 扣分时间"; }
            if(本部门量化Bol)
            { consql附加条件 = "where 扣分人姓名='" + XINGMING.Text + "' AND(班级<>'级部' OR 班级<>'教育处' OR 班级<>'学校' AND 年级 ='" + 年级 + "' AND 扣分部门代号='"+Session["部门"].ToString()+"') ORDER BY 扣分时间"; }
            总SQL = consql + consql附加条件;
        }
        #endregion
        #region 综合搜索
        if (ZONGHEJIANSUO.Checked)
        {   
            string BUMENsql="",SUSHEsql="",BANJIsql="",WHERE="",日期sql="",班级顺序="",日期顺序="",日期倒序="",分数排序="",提交人顺序="";
            bool 有BANJI = false, 有SUSHE = false, 有BUMEN = false, 有RIQI = false, 排序要求 = false; ;
            int 综合条件个数 = -1;
            if (ZONGHEJIANSUO.Checked && BUMEN.Checked == false && SUSHE.Checked == false && BANJI.Checked == false && SHIJIAN.Checked == false )
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>top.location='/jssm/Search.aspx';alert('对不起,你啥都没有输入!!');</script>");
                Response.Flush();
                Response.End();
            }
            if(BANJI.Checked || SUSHE.Checked ||BUMEN.Checked)
            {
                WHERE = "WHERE ";
                if (BANJI.Checked && ZONGHEJIANSUO.Checked&&BANJI.Enabled) 
                {
                    综合条件个数++;
                    有BANJI = true;
                    string str=BANJILIST.SelectedItem.ToString();
                BANJIsql= "年级='"+str.Substring(0,2)+"' AND 班级='"+str.Substring(2,2)+"'";//SQL修改
                }
                if (SUSHE.Checked && ZONGHEJIANSUO.Checked&&SUSHE.Enabled)
                {
                    综合条件个数++;
                    有SUSHE = true;
                SUSHEsql="宿舍编号='"+SUSHELIST.SelectedItem.ToString()+"'";
                }
                if (BUMEN.Checked && ZONGHEJIANSUO.Checked&&BUMEN.Enabled)
                {
                    综合条件个数++;
                    有BUMEN = true;
                    string str=BUMENLIST.SelectedItem.ToString();
                    BUMENsql = "扣分部门='"+str.Substring(2,3)+"' AND 年级='"+str.Substring(0,2)+"'";
                }
                if (SHIJIAN.Checked && ZONGHEJIANSUO.Checked&&SHIJIAN.Enabled && QISHIRIQI.Text!="" &&JIESHURIQI.Text!="")
                {
                    综合条件个数++;
                    有RIQI = true;
                    日期sql="扣分时间 BETWEEN '"+QISHIRIQI.Text+"' AND '"+JIESHURIQI.Text+"'";
                }
                if (BANJISHUNXU.Checked && ZONGHEJIANSUO.Checked) 
                {
                    排序要求 = true;
                    班级顺序 = " ORDER BY 班级 ";
                }
                if (RIQISHUNXU.Checked && ZONGHEJIANSUO.Checked)
                {
                    排序要求 = true;
                    日期顺序 = " ORDER BY 扣分时间 DESC";
                }
                if (RIQIDAOXU.Checked && ZONGHEJIANSUO.Checked)
                {
                    排序要求 = true;
                    日期倒序 = " ORDER BY 扣分时间";
                }
                if (FENSHUPAIXU.Checked && ZONGHEJIANSUO.Checked) 
                {
                    排序要求 = true;
                    分数排序 = " ORDER BY 扣分数";
                }
                if (TIJIAOREN.Checked && ZONGHEJIANSUO.Checked) 
                {
                    排序要求 = true;
                    提交人顺序 = " ORDER BY 扣分人";
                }
               // 总SQL = consql + WHERE + (有BANJI ? BANJIsql : "") + ((综合条件个数 > k++) ? " AND " : "") + (有SUSHE ? SUSHEsql : "") + ((综合条件个数 > k++) ? " AND " : "") + (有BUMEN ? BUMENsql : "") + ((综合条件个数 > k++) ? " AND " : "") + (有RIQI ? 日期sql : "")+(排序要求?班级顺序+日期倒序+日期顺序+分数排序+提交人顺序:"");
            }


//SELECT ID,扣分部门,扣分人姓名,年级,扣分数,扣分原因,扣分时间,是否有效,扣分部门,班级 from [MainSQL].[dbo].[扣分] WHERE 年级='高一' AND 班级='12' AND 宿舍编号='105' AND  AND "
            总SQL = consql + WHERE +
                (有BANJI ? BANJIsql : "")+ CHECKING(综合条件个数, " AND ",(有BANJI&&(有SUSHE||有BUMEN||有RIQI)?true:false)) +
                (有SUSHE ? SUSHEsql : "") + CHECKING(综合条件个数, " AND ",(有SUSHE&&(有BUMEN||有RIQI)?true:false)) +
                (有BUMEN ? BUMENsql : "") + CHECKING(综合条件个数, " AND ",(有BUMEN&&有RIQI?true:false)) +
                (有RIQI ? 日期sql : "") + (排序要求 ? 班级顺序 + 日期倒序 + 日期顺序 + 分数排序 + 提交人顺序 : "");
        }
        #endregion
        if (总SQL == "")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+> location.reload();;alert('你什么都没有输入!!!!');</script>");
            Response.Flush();
            Response.End();
        }
        Session["总SQL"] = 总SQL;
    }
    #region 下拉表
    protected void SUSHE_SelectedIndexChanged(object sender, EventArgs e)
    {
        SUSHE.Checked = true; 
        ZONGHEJIANSUO.Checked = true;
        按姓名查询.Checked = false; BANJI.Enabled = true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled = true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled = true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true;
    }
    protected void BUMENLIST_SelectedIndexChanged(object sender, EventArgs e)
    {
        BUMEN.Checked = true;
        ZONGHEJIANSUO.Checked = true; 按姓名查询.Checked = false; BANJI.Enabled = true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled = true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled = true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true;
    }
   

    protected void SUSHELIST_SelectedIndexChanged(object sender, EventArgs e)
    {
        SUSHE.Checked = true; ZONGHEJIANSUO.Checked = true; 按姓名查询.Checked = false; BANJI.Enabled = true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled = true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled = true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true;
       // if(Session["职务"].ToString()=="")
    }

    protected void BANJILIST_SelectedIndexChanged(object sender, EventArgs e)
    {
        BANJI.Checked = true;
        ZONGHEJIANSUO.Checked = true; 按姓名查询.Checked = false; BANJI.Enabled = true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled = true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled = true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true;
    } 
    #endregion

    protected void 首页_Click(object sender, EventArgs e)
    {
        
    }
    protected void 下一页_Click(object sender, EventArgs e)
    {

    }
    protected void 上一页_Click(object sender, EventArgs e)
    {

    }
    protected void 末页_Click(object sender, EventArgs e)
    {
        
    }
    protected void 分数作废LINK_Click(object sender, EventArgs e)
    {
        //string idn = ((LinkButton)sender).CommandName;
        //Response.Clear();
        //Response.Write(" <script language='javascript'+>alert('你真的真的要作废么?工作失误导致的错扣分将对工作评定产生影响.');</script>");
        //Response.Flush();
        //Response.End();
       /* string ClubConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        string str = "UPDATE [MainSQL].[dbo].[扣分] SET 是否有效 = 'False' WHERE ID ='" +分数作废LINK.CommandName+ "'";
        SqlCommand Command1 = new SqlCommand();
        Command1.Connection = con;
        Command1.CommandText = str;
        Command1.CommandType = CommandType.Text;
        Command1.ExecuteNonQuery();

            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>top.location='/jssm/FunctionScores/Search.aspx';alert('作废失败!');</script>");
                Response.Flush();
                Response.End();
            }
            else 
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>top.location='/jssm/FunctionScores/Search.aspx';alert('作废成功!');</script>");
                Response.Flush();
                Response.End();
            }

            con.Close();
          */查询div.Visible = false;
            结果div.Visible = true;
        作废框.Visible = true; 
        总SQL=Session["总SQL"].ToString();

    }
    protected void QISHIRIQI_TextChanged(object sender, EventArgs e)
    {
        按姓名查询.Checked = false;
        XINGMING.Enabled = false;
        ZONGHEJIANSUO.Enabled = true;
        ZONGHEJIANSUO.Checked = true;
        BANJI.Enabled = true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled = true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled = true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true;
        SHIJIAN.Checked = true;
    }
    protected void JIESHURIQI_TextChanged(object sender, EventArgs e)
    {
        按姓名查询.Checked = false;
        XINGMING.Enabled = false;
        ZONGHEJIANSUO.Enabled = true; ZONGHEJIANSUO.Checked = true;
        BANJI.Enabled = true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled = true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled = true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true;
        SHIJIAN.Checked = true;
    }
    protected void XINGMING_TextChanged(object sender, EventArgs e)
    {
        按姓名查询.Enabled = true;
        按姓名查询.Checked = true;
        ZONGHEJIANSUO.Checked = false;
        XINGMING.Enabled = true;
        BANJI.Enabled = false;
        SUSHE.Enabled = false;
        BUMEN.Enabled = false;
        SHIJIAN.Enabled = false;
        WUXIAOLIANGHUA.Enabled = false;
        BANJISHUNXU.Enabled = false;
        RIQISHUNXU.Enabled = false;
        RIQIDAOXU.Enabled = false;
        FENSHUPAIXU.Enabled = false;
        TIJIAOREN.Enabled = false;
    }
    protected void 确定作废BT_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Write(" <script language='javascript'+> location.reload();;alert('对不起，作废失败，请联系系统管理员。');</script>");
        Response.Flush();
        Response.End();
    }
}
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
public partial class FunctionScores_ScoresView : System.Web.UI.Page //FunctionScores_
{
    #region 变量们
    public bool 量化作废Bol = true;
    public bool 显示查询块 = true, 没有数据 = false, 显示结果块 = false, 显示分数编辑者Bol = false, 本部门量化Bol = false, 全年级量化Bol = false
    , 本班级量化Bol = false, 本年级量化Bol = false, 显示折合分数Bol = false, 什么都没有输入 = false, 量化查询Bol = false, 没有登录Bol = false;
    public int IDforName = 0, ZHEHEFEN = 0;
    public string Department = "", REASON = "", DUIXIANG = "";//DUIXAING 没写!
    public string Name = "", CAOZUOBANJI = "", 总SQL = ""; public int 扣分部门代号 = 0; public bool 显示折合分 = false;
    public double 计算折合分 = 0;

    public double KOUFENSHU = 0; public DateTime KOUFENSHIJIAN; public bool KOUFEN_zhuangtai = false;
    public string 扣分部门 = "";
    public string CHAXUNYUJU = "";
    public int a = 0;
    public string 菜单项 = ""; public DateTime date = new DateTime();
    public string 综合搜索的SQL语句 = "";
    public string consql = "SELECT ID,扣分部门,扣分人姓名,年级,扣分数,扣分原因,扣分时间,是否有效,扣分部门,班级,备注 from [MainSQL].[dbo].[扣分] ";
    public const int 每页条数 = 10;
    public int 页数 = 1, k = 0, 已读取条数 = 0, 部门ID = 0;
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
        SQLstr = "UPDATE 扣分 SET 是否有效=False WHERE ID='" + id + "'";
        SqlCommand SQLCom = new SqlCommand();
        SQLCom.Connection = con;
        SQLCom.CommandText = SQLstr;
        SQLCom.CommandType = CommandType.Text;
        SQLCom.ExecuteNonQuery();


    }
    public void 提示框(string 返回地址, string 内容)
    {
        Response.Clear();
        Response.Write(" <script language='javascript'+>top.location='" + 返回地址 + "';alert('" + 内容 + "');</script>");
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
            Response.Write(" <script language='javascript'+>location='../jssm/FunctionScores/FrameOfTeachers.aspx';</script>");
            Response.Flush();
            Response.End();
        }

        string consql0 = "SELECT 显示分数编辑者,本部门量化,全年级量化,本班级量化,本年级量化,是否折合分数,量化查询,ID,量化作废 FROM 权限表 WHERE 职务 = '" + Session["职务"] + "'";
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
            部门ID = conda0.GetInt32(7);
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
            //姓名.Visible = false;
            按姓名查询.Enabled = false;
            //班主任不可用姓名查询.
        }
        if (本部门量化Bol)
        {
            BUMEN.Enabled = false;

            BUMENLIST.Enabled = false;

            //BUMENLIST.Text = "";
        }
        if (量化作废Bol)
        {
            LinkButton1.Visible = true;
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
            BUMENLIST.Items.Add((bo ? "" : 部门年级) + conda2.GetString(0));
            bo = false;
        }//班级LIST项目添加
        检索部门.SelectCommand = "";
        con3.Close();
        if (Session["职务"].ToString() == "7")
        {
            TeacherFrameLB.Visible = true;
        }
    }

    public string CHECKING(int a, string str, bool B)
    {
        if (a > 0 && B)
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
        BANJISHUNXU.Checked = true;
        RIQISHUNXU.Checked = false;
        RIQIDAOXU.Checked = false;
        FENSHUPAIXU.Checked = false;
        TIJIAOREN.Checked = false;
    }
    protected void RIQISHUNXU_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
        BANJISHUNXU.Checked = false;
        RIQISHUNXU.Checked = true;
        RIQIDAOXU.Checked = false;
        FENSHUPAIXU.Checked = false;
        TIJIAOREN.Checked = false;
    }
    protected void RIQIDAOXU_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
        BANJISHUNXU.Checked = false;
        RIQISHUNXU.Checked = false;
        RIQIDAOXU.Checked = true;
        FENSHUPAIXU.Checked = false;
        TIJIAOREN.Checked = false;
    }
    protected void FENSHUPAIXU_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
        BANJISHUNXU.Checked = false;
        RIQISHUNXU.Checked = false;
        RIQIDAOXU.Checked = false;
        FENSHUPAIXU.Checked = true;
        TIJIAOREN.Checked = false;
    }
    protected void TIJIAOREN_CheckedChanged(object sender, EventArgs e)
    {
        ZONGHEJIANSUO.Checked = true;
        BANJISHUNXU.Checked = false;
        RIQISHUNXU.Checked = false;
        RIQIDAOXU.Checked = false;
        FENSHUPAIXU.Checked = false;
        TIJIAOREN.Checked = true;

    }
    protected void ZONGHEJIANSUO_CheckedChanged(object sender, EventArgs e)
    {
        按姓名查询.Checked = false;
        XINGMING.Enabled = false;
        BANJI.Enabled = true;
        SUSHE.Enabled = true;
        BUMEN.Enabled = true;
        SHIJIAN.Enabled = true;
        WUXIAOLIANGHUA.Enabled = true;
        BANJISHUNXU.Enabled = true;
        RIQISHUNXU.Enabled = true;
        RIQIDAOXU.Enabled = true;
        FENSHUPAIXU.Enabled = true;
        TIJIAOREN.Enabled = true; ZONGHEJIANSUO.Checked = true;
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
        if (ZONGHEJIANSUO.Checked == false && BUMEN.Checked == false && SUSHE.Checked == false && BANJI.Checked == false && SHIJIAN.Checked == false && XINGMING.Text == "" && 按姓名查询.Enabled == false && 按姓名查询.Checked == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'>top.location='/jssm/FunctionScores/mainfunc.aspx?id=view';alert('对不起,你什么都没有输入!!');</script>");
            Response.Flush();
            Response.End();
        }
        #endregion
        #region 按姓名查询
        if (((XINGMING.Text == "") == false) && XINGMING.Enabled)
        {
            string 年级 = ""; string consql附加条件 = "";
            if (Session["班级"].ToString().StartsWith("1")) 年级 = "高一";
            if (Session["班级"].ToString().StartsWith("2")) 年级 = "高二";
            if (Session["班级"].ToString().StartsWith("3")) 年级 = "高三";
            if (全年级量化Bol)
            { consql附加条件 = "where 扣分人姓名='" + XINGMING.Text + "' AND(班级<>'级部' OR 班级<>'教育处' OR 班级<>'学校') ORDER BY 扣分时间"; }
            if (本年级量化Bol)
            { consql附加条件 = "where 扣分人姓名='" + XINGMING.Text + "' AND(班级<>'级部' OR 班级<>'教育处' OR 班级<>'学校' AND 年级 ='" + 年级 + "') ORDER BY 扣分时间"; }
            if (本部门量化Bol)
            { consql附加条件 = "where 扣分人姓名='" + XINGMING.Text + "' AND(班级<>'级部' OR 班级<>'教育处' OR 班级<>'学校' AND 年级 ='" + 年级 + "' AND 扣分部门代号='" + Session["部门"].ToString() + "') ORDER BY 扣分时间"; }
            总SQL = consql + consql附加条件;
        }
        #endregion
        #region 综合搜索
        if (ZONGHEJIANSUO.Checked)
        {
            string BUMENsql = "", 无效SQL = "", SUSHEsql = "", BANJIsql = "", WHERE = "", 日期sql = "", 班级顺序 = "", 日期顺序 = "", 日期倒序 = "", 分数排序 = "", 提交人顺序 = "";
            bool 有BANJI = false, 有无效 = false, 有SUSHE = false, 有BUMEN = false, 有RIQI = false, 排序要求 = false; ;
            int 综合条件个数 = -1;
            if (ZONGHEJIANSUO.Checked && BUMEN.Checked == (本部门量化Bol ? true : false) && SUSHE.Checked == false && BANJI.Checked == false && SHIJIAN.Checked == false)
            {
                Response.Clear();
                Response.Write(" <script language='javascript'>alert('对不起,没有输入!!');</script>");
                Response.Flush();
                Response.End();
            }
            if (BANJI.Checked || SUSHE.Checked || BUMEN.Checked || SHIJIAN.Checked)
            {
                WHERE = "WHERE ";
                if (BANJI.Checked && ZONGHEJIANSUO.Checked && BANJI.Enabled)
                {
                    综合条件个数++;
                    有BANJI = true;
                    string str = BANJILIST.SelectedItem.ToString();
                    BANJIsql = "年级='" + str.Substring(0, 2) + "' AND 班级='" + str.Substring(2, 2) + "班'";//SQL修改
                }
                if (SUSHE.Checked && ZONGHEJIANSUO.Checked && SUSHE.Enabled)
                {
                    综合条件个数++;
                    有SUSHE = true;
                    SUSHEsql = "宿舍编号='" + SUSHELIST.SelectedItem.ToString() + "' AND (备注 LIKE '" + SUSHEDANYUANLIST.SelectedValue + "%' OR 备注 LIKE '宿舍：" + SUSHEDANYUANLIST.SelectedValue + "%')";
                }
                if (ZONGHEJIANSUO.Checked && ((BUMEN.Checked && BUMEN.Enabled) || 本部门量化Bol))
                {
                    string str = "";
                    综合条件个数++;
                    有BUMEN = true;
                    if (BUMEN.Enabled)
                    {
                        str = BUMENLIST.SelectedItem.ToString();
                        BUMENsql = "扣分部门='" + str.Substring(2, 3) + "' AND 年级='" + str.Substring(0, 2) + "'";
                    }
                    else if (本部门量化Bol)
                    {
                        BUMENsql = "扣分部门='" + Session["部门名"].ToString() + "' AND 年级='" + Session["年级名"].ToString() + "'";
                    }
                }
                if (SHIJIAN.Checked && ZONGHEJIANSUO.Checked && SHIJIAN.Enabled && QISHIRIQI.Text != "" && JIESHURIQI.Text != "")
                {
                    综合条件个数++;
                    有RIQI = true;
                    日期sql = "扣分时间 BETWEEN '" + QISHIRIQI.Text + "' AND '" + JIESHURIQI.Text + "'";
                }
                else
                {
                    if (QISHIRIQI.Text == "" && JIESHURIQI.Text == "")
                    {
                        if (SHIJIAN.Checked == false && ZONGHEJIANSUO.Checked && SHIJIAN.Enabled == false)
                        {
                            日期sql = "";
                            有RIQI = false;
                            综合条件个数--;
                        }
                        else
                        {
                            Response.Clear();
                            Response.Write(" <script language='javascript'>alert('没有日期!');</script>");
                            Response.Flush();
                            Response.End();
                        }
                    }
                    else
                    {
                        Response.Clear();
                        Response.Write(" <script language='javascript'>alert('日期信息不完整!');</script>");
                        Response.Flush();
                        Response.End();
                    }
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
                if (WUXIAOLIANGHUA.Checked == false)
                {
                    有无效 = true;
                    无效SQL = "是否有效='True'";
                    综合条件个数++;
                }
            }
            总SQL = consql + WHERE +
                (有BANJI ? BANJIsql : "") + CHECKING(综合条件个数, " AND ", (有BANJI && (有SUSHE || 有BUMEN || 有RIQI || 有无效) ? true : false)) +
                (有SUSHE ? SUSHEsql : "") + CHECKING(综合条件个数, " AND ", (有SUSHE && (有BUMEN || 有RIQI || 有无效) ? true : false)) +
                (有BUMEN ? BUMENsql : "") + CHECKING(综合条件个数, " AND ", (有BUMEN && (有RIQI || 有无效) ? true : false)) +
                (有无效 ? 无效SQL : "") + CHECKING(综合条件个数, " AND ", (有RIQI && 有无效) ? true : false) +
                (有RIQI ? 日期sql : "") + (排序要求 ? 班级顺序 + 日期倒序 + 日期顺序 + 分数排序 + 提交人顺序 : "");
            //Label2.Text = 总SQL;
        }
        #endregion
        if (总SQL == "")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>alert('你什么都没有输入!!!!');</script>");
            Response.Flush();
            Response.End();
        }
        Session["总SQL"] = 总SQL;
        //总SQL = Session["总SQL"].ToString();
        SqlDataSource1.SelectCommand = Session["总SQL"].ToString();
        //SqlDataSource1.DataBind();
        //GridView1.DataSourceID = "SqlDataSource1";
        //GridView1.DataBind();
        // Label2.Text = Session["总SQL"].ToString();
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
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        //SqlDataSource1.SelectCommand = 总SQL;
        //GridView1.DataSourceID = "SqlDataSource1";
        SqlDataSource1.SelectCommand = Session["总SQL"].ToString();

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
        string 班级 = "";
        string ID = "";
        string 扣分人 = "";
        float 扣分数 = 0;
        DateTime 扣分时间;
        string 扣分原因 = "";
        string 扣分人姓名 = "";
        string 扣分部门 = "";
        int 扣分部门代号 = 0;
        #region 读ID对应信息

        string consql_inaviscr = "SELECT ID,扣分人,扣分数,扣分时间,扣分原因,扣分人姓名,扣分部门,扣分部门代号,班级 FROM 扣分 WHERE ID = '" + TextBox1.Text.ToString() + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();//读取数据库
        SqlCommand cons0 = new SqlCommand(consql_inaviscr, con);
        SqlDataReader conda0_inaviscr = cons0.ExecuteReader();

        while (conda0_inaviscr.Read())
        {
            //conda0_inaviscr.GetBoolean(0);
            ID = conda0_inaviscr.GetInt32(0).ToString();
            扣分人 = conda0_inaviscr.GetString(1);
            扣分数 = conda0_inaviscr.GetFloat(2);
            扣分时间 = conda0_inaviscr.GetDateTime(3);
            扣分原因 = conda0_inaviscr.GetString(4);
            扣分人姓名 = conda0_inaviscr.GetString(5);
            扣分部门 = conda0_inaviscr.GetString(6);
            扣分部门代号 = conda0_inaviscr.GetInt32(7);
            班级 = conda0_inaviscr.GetString(8);
        }//读取原分数
        con.Close();
        #endregion
        #region 改扣分表
        string upclubdata_tofalse = "UPDATE  扣分 SET 是否有效='false'" + "WHERE ID='" + TextBox1.Text.ToString() + "'";
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con_tofalse = new SqlConnection(ClubConnectionString);
        con_tofalse.Open();
        try
        {
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con_tofalse;
            Command1.CommandText = upclubdata_tofalse;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            if (upclubdata_tofalse == "")
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>alert('请重新输入！');</script>");
                Response.Flush();
                Response.End();
            }
            throw ex;
        }
        finally
        {
            if (con_tofalse != null && con_tofalse.State != System.Data.ConnectionState.Closed)
            {
                con_tofalse.Close();
            }
        }
        #endregion
        #region 写作废分数表
        string upclubdata_inst = "INSERT INTO 作废分数 (班级,扣分人,扣分原因,扣分数,扣分时间,作废原因,作废时间,扣分人姓名,扣分部门,扣分部门代号,年级班级,投诉) VALUES ('" + 班级 + "','" + 扣分人 + "','" + 扣分原因 + "'," + 作废原因TB.Text.ToString() + ",'" + DateTime.Now + "','" + 扣分人姓名 + "','" + 扣分部门 + "','" + 扣分部门代号 + "','" + Session["年级名"] + 班级 + "','" + "false" + "')";
        //string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con_inst = new SqlConnection(ClubConnectionString);
        con_inst.Open();
        try
        {
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con_inst;
            Command1.CommandText = upclubdata_inst;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            if (upclubdata_inst == "")
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>alert('请重新输入！');</script>");
                Response.Flush();
                Response.End();
            }
            //throw ex;
        }
        finally
        {
            if (con_inst != null && con_inst.State != System.Data.ConnectionState.Closed)
            {
                con_inst.Close();
            }
        }
        #endregion

        Response.Clear();
        Response.Write(" <script language='javascript'+> location.reload();;alert('分数已作废 !!! ');</script>");
        Response.Flush();
        Response.End();

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        作废框.Visible = true;
        查询div.Visible = false;
        结果div.Visible = false;

    }
    protected void TeacherFrameLB_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://saims.tk/FunctionScores/FrameOfTeachers.aspx");
    }
    protected void SUSHEDANYUANLIST_SelectedIndexChanged(object sender, EventArgs e)
    {
        SUSHELIST.Visible = true;
        宿舍查询.SelectCommand = "SELECT [宿舍名] FROM [宿舍] where 单元 LIKE '" + SUSHEDANYUANLIST.SelectedValue + "%'";//!!!!!
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
    }
}

/*
public partial class FunctionScores_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
*/
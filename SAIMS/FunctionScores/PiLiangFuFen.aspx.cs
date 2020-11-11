using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;


public partial class FunctionScores_PiLiangFuFen : System.Web.UI.Page
{
    public bool 可以量化Bool = false, 按班级Bool = false;
    public string SQL = " ";
    public int count = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {


        部门LB.Text = Session["部门名"].ToString();
        学期LB.Text = "";//!!!   学期怎么填
        if ((int)Session["第一次载入"] == 0)
        {


            if (Session["部门名"].ToString() == "男宿部" || Session["部门名"].ToString() == "女宿部")
            {
                按班级.Visible = false;
                宿管部.Visible = false;
                确定表格.Visible = false;
                Session["是宿管部Bool"] = true;
            }
            else
            {
                CHOOSE.Visible = false;
                宿管部.Visible = false;
                按班级.Visible = true;
                确定表格.Visible = true;
            }
            Session["第一次载入"] = 123515;
        }
        else
        {
            if ((bool)Session["是宿管部Bool"] == true)
            {
                按班级.Visible = false;
                宿管部.Visible = false;
                确定表格.Visible = false;
                CHOOSE.Visible = true;
                if (Session["宿管输分方式"].ToString() == "班级")
                {
                    CHOOSE.Visible = false;
                    宿管部.Visible = false;
                    按班级.Visible = true;
                    确定表格.Visible = true;
                    按班级Bool = true;
                    SqlDataSource1.SelectCommand = "SELECT 原因 FROM 扣分原因 WHERE 部门='宿管部'";
                    // this.按班级原因DDL.Items.FindByText(Session["批量原因"].ToString()).Selected = true;

                }
                else if (Session["宿管输分方式"].ToString() == "宿舍")
                {
                    宿管部原因DDL.SelectedIndex = 宿管部原因DDL.Items.IndexOf(宿管部原因DDL.Items.FindByText(Session["批量原因"].ToString()));
                    CHOOSE.Visible = false;
                    宿管部.Visible = true;
                    按班级.Visible = false;
                    确定表格.Visible = true;
                    if (Session["部门名"].ToString() == "男宿部")
                    {
                        CheckBox cb = new CheckBox();
                        for (int i = 1; i <= 5; i++)
                        {
                            for (int b = 7; b <= 10; b++)
                            {
                                cb = (CheckBox)this.FindControl("全部" + i.ToString() + b.ToString());
                                cb.Visible = false;
                            }
                        }
                    }
                    //  this.宿管部原因DDL.Items.FindByText(Session["批量原因"].ToString()).Selected = true;
                }
                else if (Session["宿管输分方式"].ToString() == "待定")
                {
                    宿管部.Visible = false;
                    按班级.Visible = false;
                    确定表格.Visible = false;
                    CHOOSE.Visible = true;
                }
            }
            else
            {
                按班级.Visible = true;
                宿管部.Visible = false;
                确定表格.Visible = true;
                CHOOSE.Visible = false;
                // this.按班级原因DDL.Items.FindByText(Session["批量原因"].ToString()).Selected = true ;
            }

        }
        SqlDataSource1.SelectCommand = "SELECT 原因 FROM 扣分原因 WHERE 部门='" + Session["部门名"].ToString() + "'";
        SqlDataSource2.SelectCommand = "SELECT 班级 FROM 班级 WHERE 年级='" + Session["年级ID"].ToString() + "'";
        SqlDataSource4.SelectCommand = "SELECT 原因 FROM 扣分原因 WHERE 部门='宿管部'";

    }
    protected void CHOOSE_DO(object sender, EventArgs e)
    {
        LinkButton lb = new LinkButton();
        lb = (LinkButton)sender;
        if (lb.ID == "通过选班级赋分")
        {
            CHOOSE.Visible = false;
            宿管部.Visible = false;
            按班级.Visible = true;
            确定表格.Visible = true;
            按班级Bool = true;
            SqlDataSource1.SelectCommand = "SELECT 原因 FROM 扣分原因 WHERE 部门='宿管部'";
            Session["宿管输分方式"] = "班级";
        }
        else
        {
            Session["宿管输分方式"] = "宿舍";
            CHOOSE.Visible = false;
            宿管部.Visible = true;
            按班级.Visible = false;
            确定表格.Visible = true;
            if (Session["部门名"].ToString() == "男宿部")
            {
                CheckBox cb = new CheckBox();
                for (int i = 1; i <= 5; i++)
                {
                    for (int b = 7; b <= 10; b++)
                    {
                        cb = (CheckBox)this.FindControl("全部" + i.ToString() + b.ToString());
                        cb.Visible = false;
                    }
                }
            }
        }
    }
    protected void 子全部_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox checkbox = new CheckBox();
        checkbox = (CheckBox)this.FindControl(((CheckBox)sender).ID.Substring(0, 3));
        int a = 0;
        CheckBox x = new CheckBox();
        for (int i = 1; i <= 10; i++)
        {
            x = (CheckBox)this.FindControl(checkbox.ID + i.ToString());
            if (x.Checked)
                a++;
        }
        if (a == 10)
            checkbox.Checked = true;
        else
            checkbox.Checked = false;

    }
    protected void 全部_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cb = new CheckBox();
        CheckBox cb1 = new CheckBox();
        cb = (CheckBox)sender;
        for (int i = 1; i <= 10; i++)
        {
            cb1 = (CheckBox)this.FindControl(cb.ID + i.ToString());
            if (cb1.Visible)
                cb1.Checked = cb.Checked;
        }
    }
    protected void 全部重置_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.ToString());
        if (按班级Bool)
        {
            按班级.Visible = true;
            CHOOSE.Visible = false;
            宿管部.Visible = false;
            确定表格.Visible = true;
        }
        else
        {
            按班级.Visible = false;
            CHOOSE.Visible = false;
            宿管部.Visible = true;
            确定表格.Visible = true;
        }
    }
    protected void 全部提交_Click(object sender, EventArgs e)

    {
        string 分数str = "";
        string 备注 = "", 原因 = "";
        float 分数=0;
        bool ok = false;
        if (按班级.Visible)
        {
            原因 = 按班级原因DDL.SelectedValue;
            备注 = 按班级备注.Text;
            string Class="";
            string 相关学生姓名 = "";
            string FailClass = "";
            for (int i = 1; i <= 5; i++)
            {
                Class=((DropDownList)this.FindControl("按班级班级" + i.ToString())).SelectedValue;
                分数str = ((TextBox)this.FindControl("按班级扣分" + i.ToString())).Text;//把分数读出来
                相关学生姓名 = ((TextBox)this.FindControl("按班级学生" + i.ToString())).Text;
                //!!! 看数据库监察SQL
                if (分数str == "" && 相关学生姓名 == "")
                {
                    continue;
                }
                else
                {
                    try
                    {
                        分数 = Convert.ToSingle(分数str);
                    }
                    catch
                    {
                        ok = false;
                        FailClass += Class + ",";
                    }
                }
                SQL = "INSERT INTO 扣分(班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,备注)VALUES('"
                   + Class + "','"
                 + Session["usersname"].ToString() + "','"
               + 原因 + "','"
                   + 分数.ToString() +"','"
                   + DateTime.Now + "','"
                  + Session["名字"].ToString() + "','"
                  + Session["部门名"].ToString() + "','"
                + Session["部门"].ToString() + "','"
                   + Session["年级名"].ToString() + "','" + 备注 + "')";

                if(METHOD.WriteDate(SQL) != -1) {
                    ok = true;
                    SQL = "";
                    } 
                else {
                    ok = false;
                    FailClass += Class + ",";
                    break;
                    }

            }            if (ok)
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='../FunctionScores/piliangfufen.aspx';alert('输入成功~');</script>");
                //下面是之前的码：
                //content.InnerHtml = "<iframe width=\"100%\" height=\"100%\" id=\"ifr\" runat=\"server\"  src=\"Piliangfufen.aspx\"  frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling-y=\"no\" allowtransparency=\"yes\"></iframe>";   
                //location.reflesh()
                //location='../mainfunc.aspx?id=piliang'
                //Response.Write(" <script language='javascript'+>location.reload();alert('输入成功~');</script>");
                Response.Flush();
                Response.End();
               
                

                }
                         else 
                {

            
                Response.Clear();
                Response.Write(" <script language='javascript'+>location='../FunctionScores/piliangfufen.aspx';alert('输入失败!!!!~');</script>");
                Response.Flush();
                Response.End();
                
                

            }
        }
            /*
        else
        {
            ok = false;
            bool 混宿 = false;
            string 单元 = 选择单元DDL.SelectedValue;
            string 宿舍号 = "";
            string 床号 = "";
            原因 = 宿管部原因DDL.SelectedValue;
            备注 = 宿管部备注.Text;
            string 班级 = "", 宿舍编号 = "";
            int number = 0;
            float 分数2 = 0;
            string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();

            SqlConnection con = new SqlConnection(Main1ConnectionString);
            //CONNECTION
            SqlCommand cons = new SqlCommand();
            con.Open();

            cons.Connection = con;
             SqlConnection conss = new SqlConnection(Main1ConnectionString);
             SqlCommand command2 = new SqlCommand();
             command2.Connection = con;


            for (int i = 1; i <= 5; i++)
            {
                
                分数str = ((TextBox)this.FindControl("宿舍扣分" + i.ToString())).Text;//把分数读出来
                if (分数str == "")
                {
                    continue;
                }
                else{
                try
                {
                    分数 =Convert.ToSingle(分数str);    
              }
                catch(FormatException)
               {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>alert('请输入正确的分数!"+分数.ToString()+i.ToString()+"');location.reload();</script>");
                    Response.Flush();
                    Response.End();
                }//转换分数
                }
                for (int y = 1; y <= 10; y++)
                {
                    if (((CheckBox)this.FindControl("全部" + i.ToString() + y.ToString())).Checked)
                        number++;
                }//选了几个
                分数2 = 分数;
                分数 = 分数 / ((float)number);
                //单条分数数值
                number = 0;
                //床数目归零
                宿舍号 = ((TextBox)this.FindControl("宿舍" + i.ToString())).Text;
                if (宿舍号 == "")
                {
                    continue;
                }
                cons.CommandText = "SELECT 班级,混宿,编号 FROM 宿舍 Where 单元 ='" + 单元 + "' AND 宿舍名='" + 宿舍号 + "'";
                cons.CommandType = CommandType.Text;
                //SqlDataReader conda = cons.ExecuteReader();
                //COMMAND
                SqlDataReader reader = cons.ExecuteReader();
                //READER
                if (reader.Read())
                {
                    班级 = reader.GetString(0);
                    混宿 = reader.GetBoolean(1);
                    宿舍编号 = reader.GetString(2);
                }
                else
                {
                    Response.Clear();
                    Response.Write(" <script language='javascript'+>location.reload();alert('宿舍对应不到班级！');</script>");
                    Response.Flush();
                    Response.End();
                    break;
                } //对应班级如果对应不到，全部停止输入。
                reader.Close();
                //READER---CLOSE


                if (混宿)
                {
                   
                    for (int t = 1; t <= 10; t++)
                    {
                        if (((CheckBox)this.FindControl("全部" + i.ToString() + t.ToString())).Checked)
                        {
                            cons.CommandText = "select 班级编号 FROM 混宿 where 宿舍编号='" + 宿舍编号 + "' AND 床号='" + t.ToString() + "'";
                            cons.CommandType = CommandType.Text;
                            SqlDataReader conda22 = cons.ExecuteReader();
                            if (conda22.Read())
                            {
                                班级 = conda22.GetString(0);
                                
                               班级 = METHOD.GETSTRING("SELECT 班级 FROM 班级 WHERE 编号='" + 班级 + "'");
                            }
                            else
                            {
                                Response.Clear();
                                Response.Write(" <script language='javascript'+>location.reload();alert('宿舍" + 宿舍号 + "的床号" + t.ToString() + "对应班级有缺失！请联系信息技术部补全数据');</script>");
                                Response.Flush();
                                Response.End();
                                break;
                            }
                            conda22.Close();

                            SQL = "INSERT INTO 扣分(扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,备注,宿舍编号,班级)VALUES('"
                                               + Session["usersname"].ToString() + "','" + 原因 + "','" + 分数.ToString() + "','" + DateTime.Now + "','" + Session["名字"].ToString() + "','"
                                               + Session["部门名"].ToString() + "','" + Session["部门"] + "','" + Session["年级名"] + "','" + 单元 + "[" + 宿舍号 + "]" + t.ToString() + ".备注：" + 备注 + "','" + 宿舍号 + "','" + 班级 + "')";
                            if (METHOD.WriteDate(SQL) != -1)
                                ok = true;
                            else { ok = false; break; }
                        }
                    }
                }//混宿和非混宿输入方式不同
                else
                {
                    cons.CommandText = "SELECT 班级 FROM 班级 WHERE 编号='" + 班级 + "'";
                    cons.CommandType = CommandType.Text;
                    SqlDataReader conda2 = cons.ExecuteReader();

                    while (conda2.Read())
                    {
                        班级 = conda2.GetString(0);
                    }
                    conda2.Close();


                    for (int t = 1; t <= 10; t++)
                    {
                        if (((CheckBox)this.FindControl("全部" + i.ToString() + t.ToString())).Checked == true)
                        {
                            床号 += t.ToString() +",";
                        }
                    }
                    SQL = "INSERT INTO 扣分(扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,备注,宿舍编号,班级)VALUES('"
                       + Session["usersname"].ToString() + "','" + 原因 + "','" + 分数2.ToString() + "','" + DateTime.Now + "','" + Session["名字"].ToString() + "','"
                       + Session["部门名"].ToString() + "','" + Session["部门"] + "','" + Session["年级名"] + "','" + 单元 + "[" + 宿舍号 + "]" +床号 + ".备注：" + 备注 + "','" + 宿舍号 + "','" + 班级 + "')";
                            if (METHOD.WriteDate(SQL) != -1)
                                ok = true;
                            else { ok = false; break; }
                    // for (int t = 1;t <= 10; t++)
                      //{
                        //  if (((CheckBox)this.FindControl("全部"+i.ToString() + t.ToString())).Checked == true)
                          //    床号 += t.ToString() + ",";
                     // }
                     
                }
            }
            con.Close();
            if (ok)
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location.reload();alert('输入成功~');</script>");
                Response.Flush();
                Response.End();
            }
            else
            {
                Response.Clear();
                Response.Write(" <script language='javascript'+>location.reload();alert('输入失败');</script>");
                Response.Flush();
                Response.End();

            }

        }
*/
            
       
    }
    protected void 宿管部原因DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["批量原因"] = 宿管部原因DDL.SelectedValue.ToString();
    }
    protected void 按班级原因DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["批量原因"] = 按班级原因DDL.SelectedValue.ToString();
    }
}

public class METHOD
{
    static string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
    static SqlConnection con = new SqlConnection(Main1ConnectionString);
    public static SqlDataReader SQLREADER(string sql)
    {
        // if(con.State == System.Data.ConnectionState.Closed)
        con.Open();
        SqlCommand cons = new SqlCommand(sql, con);
        SqlDataReader conda = cons.ExecuteReader();
        return conda;
    }
    public static void Close()
    {
        con.Close();
    }
    public static int WriteDate(string SQL)
    {
        int i = 0;
        string Main1ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(Main1ConnectionString);
        connection.Open();
        SqlCommand command = new SqlCommand(SQL, connection);
        i = command.ExecuteNonQuery();
        connection.Close();
        return i;

    }
    public static string GETSTRING(string str) 
    {
        string str2="";
        SqlConnection conss = new SqlConnection(Main1ConnectionString);
        SqlCommand command2 = new SqlCommand();
        conss.Open();
        command2.Connection = con;
        command2.CommandText = str;
        command2.CommandType = CommandType.Text;
        SqlDataReader conda2 = command2.ExecuteReader();
        while (conda2.Read())
        {
            str2 = conda2.GetString(0);
        }
       
        conss.Close();
        return str2;
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionScores_InputScores_ifr : System.Web.UI.Page
{
    public bool 班级量化管理Bol = false, 宿舍量化管理Bol = false, 个人量化Bol = false, 本部门量化Bol = false, 全年级量化Bol = false, 本年级量化Bol = false;
    public void MsgBox(string strMsg)//======================对话框模块======================
    {
        string StrScript;
        StrScript = ("<script language=javascript>");
        StrScript += ("alert('" + strMsg + "');");
        StrScript += ("</script>");
        System.Web.HttpContext.Current.Response.Write(StrScript);
    }
    public string 查找床号班级(int x)
    {
        string consql = "SELECT 班级编号 FROM 混宿 WHERE 宿舍编号 ='" + Session["年级ID"].ToString() + "-" + 宿舍DDL.SelectedValue + "' AND 床号 = "+ x.ToString();
        SqlConnection con0 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con0.Open();

        string y="";

        SqlCommand cons = new SqlCommand(consql, con0);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            y=conda.GetString(0);
           
        }
        conda.Close();
        cons = new SqlCommand("SELECT 班级 FROM 班级 WHERE 编号 ='" + y + "'", con0);
        conda = cons.ExecuteReader();
        while (conda.Read())
        {
            y = conda.GetString(0);
        }
        con0.Close();
        return y;
    }
    public void 写入分数(string y, string x, string z)
    {

        string upclubdata = "INSERT INTO 扣分 (班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,宿舍编号,备注) VALUES ('" + y + "','" + Session["usersname"] + "','" + 原因.SelectedValue.ToString() + "'," + x + ",'" + DateTime.Now + "','" + Session["名字"] + "','" + Session["部门名"] + "','" + Session["部门"] + "','" + Session["年级名"] + "','" + 宿舍DDL.SelectedValue + "','" + z + "')";
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
            
        }
        catch (Exception ex)
        {
            if (upclubdata == "")
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
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (部门显示label.Text == "部门")
        {
            输入详情Panel.Visible = false;
        }
        else
        {
            输入详情Panel.Visible = true;
            选择部门Panel.Visible = 选择年级Panel.Visible = false;
        }
        //====================================================================================================
        #region//读权限
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con1.Open();
        string addsql1 = "SELECT 班级量化管理,宿舍量化管理,本部门量化,全年级量化,本年级量化 FROM 权限表 WHERE 职务 LIKE '" + Session["职务"] + "'";
        SqlCommand addins1 = new SqlCommand(addsql1, con1);
        SqlDataReader addda1 = addins1.ExecuteReader();
        while (addda1.Read())
        {
            班级量化管理Bol = addda1.GetBoolean(0);
            宿舍量化管理Bol = addda1.GetBoolean(1);
            本部门量化Bol = addda1.GetBoolean(2);
            全年级量化Bol = addda1.GetBoolean(3);
            本年级量化Bol = addda1.GetBoolean(4);
        }
        addda1.Close();
        #endregion
        if (班级量化管理Bol == false && 宿舍量化管理Bol == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有量化操作权限!');</script>");
            Response.Flush();
            Response.End();
        }//班主任不能量化!
        if (全年级量化Bol && 部门显示label.Text == "部门")
        {
            选择部门Panel.Visible = false;
        }
        if (本年级量化Bol && 部门显示label.Text == "部门")
        {
            选择年级Panel.Visible = false;
            年级Label.Text = Session["年级名"].ToString();
            选择年级.SelectCommand = "SELECT [年级], [部门名], [部门代号] FROM [部门] WHERE [年级] = '" + Session["年级ID"].ToString() + "' ORDER BY [ID]";
        }
        if (本部门量化Bol && 部门显示label.Text == "部门")
        {
            选择年级Panel.Visible = false;
            选择部门Panel.Visible = false;
            输入详情Panel.Visible = true;
        }
        if (本部门量化Bol && 全年级量化Bol == false && 本年级量化Bol == false)
        {
            班级下拉框.SelectCommand = "SELECT 班级 FROM 班级 WHERE 年级='" + Session["年级ID"].ToString() + "' AND 班级<>'级部'";
          部门显示label.Text = Session["部门名"].ToString();
          if (Session["部门名"].ToString() != "男宿部" && Session["部门名"].ToString() != "女宿部")
          {
              班级行.Visible = true;
              宿舍行.Visible = false;
              宿舍楼.Visible = false;
              原因行.Visible = true;
              备注行.Visible = true;
              相关学号tr.Visible = true;
              床号.Visible = false;
              输入分数行.Visible = true;
              提交行.Visible = true;
              选择输入模式.Visible = false;
              床号.Visible = false;
              宿舍行.Visible = false;
              宿舍楼行.Visible = false;
          }
          else
          {
              选择输入模式.Visible = true;
              相关学号tr.Visible = false;
              班级行.Visible = false;
              宿舍行.Visible = false;
              原因行.Visible = false;
              备注行.Visible = false;
              相关学号tr.Visible = false;
              床号.Visible = false;
              输入分数行.Visible = false;
              提交行.Visible = false;
              if (Session["部门名"] == "男宿部")
              {
                  seventh.Visible = false;
                  eighth.Visible = false;
                  ninth.Visible = false;
                  tenth.Visible = false;
              }
          }
          扣分原因.SelectCommand = "SELECT 原因 FROM 扣分原因 where 部门='" + ((Session["部门名"].ToString() == "女宿部" || Session["部门名"].ToString() == "男宿部")? "宿管部" : Session["部门名"].ToString()) + "'";
          
        }
          
    }
    protected void 提交_Click(object sender, EventArgs e)
    {
        string upclubdata="", InputValue = 扣分数.Text;
        bool 是否混宿 = false;
        if (扣分数.Text == "")
        {
            Response.Write(" <script language='javascript'+>alert('对不起,请输入正确的分数!');location.reload();</script>");
        }




        if (班级量化管理Bol == true)
        {
            upclubdata = "INSERT INTO 扣分 (班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,备注) VALUES ('" + 班级.SelectedValue.ToString() + "','" + Session["usersname"] + "','" + 原因.SelectedValue.ToString() + "'," + 扣分数.Text + ",'" + DateTime.Now + "','" + Session["名字"] + "','" + Session["部门名"] + "','" + Session["部门"] + "','" + Session["年级名"] + "','" + 备注.Text + "')";
           
        }
        else if (宿舍量化管理Bol == true)
        {
            if (RadioButton2.Checked == true && RadioButton1.Checked == false)
            {
                upclubdata = "INSERT INTO 扣分 (班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,备注) VALUES ('" + 班级.SelectedValue.ToString() + "','" + Session["usersname"] + "','" + 原因.SelectedValue.ToString() + "'," + 扣分数.Text + ",'" + DateTime.Now + "','" + Session["名字"] + "','" + Session["部门名"] + "','" + Session["部门"] + "','" + Session["年级名"] + "','" + 备注.Text + "')";
              
            }

            else if (RadioButton1.Checked == true && RadioButton2.Checked == false)
            {
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
                con1.Open();
                string classvalue = "";
                string addsql1 = "SELECT 班级,混宿 FROM 宿舍 WHERE 宿舍名 LIKE '" + 宿舍DDL.SelectedValue + "' AND 年级=" + Session["年级ID"].ToString();
                SqlCommand addins1 = new SqlCommand(addsql1, con1);
                SqlDataReader addda1 = addins1.ExecuteReader();
                while (addda1.Read())
                {
                    classvalue = addda1.GetString(0);
                    是否混宿 = addda1.GetBoolean(1);
                }   
                addda1.Close();
                string 备注string = 宿舍楼.SelectedValue.ToString()+"[" + 宿舍DDL.SelectedValue + "] ";
                if (是否混宿 == false)
                {
                    #region 备注string字符串合成

                    if (first.Checked == true)
                        备注string = 备注string + "1";
                    if (second.Checked == true)
                        备注string = 备注string + ",2";
                    if (third.Checked == true)
                        备注string = 备注string + ",3";
                    if (fourth.Checked == true)
                        备注string = 备注string + ",4";
                    if (fifth.Checked == true)
                        备注string = 备注string + ",5";
                    if (sixth.Checked == true)
                        备注string = 备注string + ",6";
                    if (seventh.Checked == true)
                        备注string = 备注string + ",7";
                    if (eighth.Checked == true)
                        备注string = 备注string + ",8";
                    if (ninth.Checked == true)
                        备注string = 备注string + ",9";
                    if (tenth.Checked == true)
                        备注string = 备注string + ",10";

                    备注string = 备注string +" "+ 备注.Text;

                    #endregion
                    upclubdata = "INSERT INTO 扣分 (班级,扣分人,扣分原因,扣分数,扣分时间,扣分人姓名,扣分部门,扣分部门代号,年级,宿舍编号,备注) VALUES ('" + classvalue.ToString() + "','" + Session["usersname"] + "','" + 原因.SelectedValue.ToString() + "'," + 扣分数.Text + ",'" + DateTime.Now + "','" + Session["名字"] + "','" + Session["部门名"] + "','" + Session["部门"] + "','" + Session["年级名"] + "','" + 宿舍DDL.SelectedValue + "','" + 备注string + "')";
                  
                }
                else if (是否混宿 == true)
                {
                    //int sum = 0;
                 #region sum合成
 /*  
                    if (first.Checked == true)
                        sum++;
                    if (second.Checked == true)
                        sum++;
                    if (third.Checked == true)
                        sum++;
                    if (fourth.Checked == true)
                        sum++;
                    if (fifth.Checked == true)
                        sum++;
                    if (sixth.Checked == true)
                        sum++;
                    if (seventh.Checked == true)
                        sum++;
                    if (eighth.Checked == true)
                        sum++;
                    if (ninth.Checked == true)
                        sum++;
                    if (tenth.Checked == true)
                        sum++;
                    
                    */
                  

                    #endregion

                    double i = 0;
                    try
                    {
                        i = Convert.ToDouble(扣分数.Text.ToString());                       
                    }
                    catch
                    {
                        Response.Clear();
                        Response.Write(" <script language='javascript'+>alert('对不起,请输入正确的分数!');location.reload();</script>");
                        Response.Flush();
                        Response.End();
                        
                    }
                    string _class = "";
                    #region 加分时
                    if (i < 0)               
                    {
                        string 加分数 = "-0.1";
                   
                        if (first.Checked == true)
                        {
                           _class =  查找床号班级(1);
                           写入分数(_class, 加分数, 备注string + " 1 "  + 备注.Text);
                                                      
                        }
                        if (second.Checked == true)
                        {
                            _class = 查找床号班级(2);
                            写入分数(_class, 加分数, 备注string + " 2 " + 备注.Text);
                            
                        }
                        if (third.Checked == true)
                        {
                            _class = 查找床号班级(3);
                            写入分数(_class, 加分数, 备注string + " 3 " + 备注.Text);
                           
                        }
                        if (fourth.Checked == true)
                        {
                            _class = 查找床号班级(4);
                            写入分数(_class, 加分数, 备注string + " 4 " + 备注.Text);   
                        }
                        if (fifth.Checked == true)
                        {
                            _class = 查找床号班级(5);
                            写入分数(_class, 加分数, 备注string + " 5 " + 备注.Text); 
                        }
                        if (sixth.Checked == true)
                        {
                            _class = 查找床号班级(6);
                            写入分数(_class, 加分数, 备注string + " 6 " + 备注.Text);
                        }
                        if (seventh.Checked == true)
                        {
                            _class = 查找床号班级(7);
                            写入分数(_class, 加分数, 备注string + " 7 " + 备注.Text);
                          
                        }
                        if (eighth.Checked == true)
                        {
                            _class = 查找床号班级(8);
                            写入分数(_class, 加分数, 备注string + " 8 " + 备注.Text);
                         
                        }
                        if (ninth.Checked == true)
                        {
                            _class = 查找床号班级(9);
                            写入分数(_class, 加分数, 备注string + " 9 " + 备注.Text);
                        
                        }
                        if (tenth.Checked == true)
                        {
                            _class = 查找床号班级(10);
                            写入分数(_class, 加分数, 备注string + " 10 " + 备注.Text);
                         
                        }
#endregion
                    #region 扣分时
                        else if (i > 0)
                        {
                           
                            if (first.Checked == true)
                            {
                                _class = 查找床号班级(1);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 1 " + 备注.Text);

                            }
                            if (second.Checked == true)
                            {
                                _class = 查找床号班级(2);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 2 " + 备注.Text);

                            }
                            if (third.Checked == true)
                            {
                                _class = 查找床号班级(3);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 3 " + 备注.Text);

                            }
                            if (fourth.Checked == true)
                            {
                                _class = 查找床号班级(4);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 4 " + 备注.Text);
                            }
                            if (fifth.Checked == true)
                            {
                                _class = 查找床号班级(5);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 5 " + 备注.Text);
                            }
                            if (sixth.Checked == true)
                            {
                                _class = 查找床号班级(6);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 6 " + 备注.Text);
                            }
                            if (seventh.Checked == true)
                            {
                                _class = 查找床号班级(7);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 7 " + 备注.Text);

                            }
                            if (eighth.Checked == true)
                            {
                                _class = 查找床号班级(8);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 8 " + 备注.Text);

                            }
                            if (ninth.Checked == true)
                            {
                                _class = 查找床号班级(9);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 9 " + 备注.Text);

                            }
                            if (tenth.Checked == true)
                            {
                                _class = 查找床号班级(10);
                                写入分数(_class, 扣分数.Text.ToString(), 备注string + " 10 " + 备注.Text);

                            }
                        }
                        #endregion
                    }
                   
                }
                }
            }
        if (是否混宿 == false)
        {
            string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ClubConnectionString);
            con.Open();
            try
            {
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con;
                Command1.CommandText = upclubdata;
                Command1.CommandType = CommandType.Text;
                Command1.ExecuteNonQuery();
               
            }
            catch (Exception ex)
            {
                if (upclubdata == "")
                {
                    Response.Write(" <script language='javascript'+>alert('请重新输入！');location.reload();</script>");
                }
                throw ex;
            }
            finally
            {
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }

        }
        Response.Clear();
        Response.Write(" <script language='javascript'+>alert('操作成功!');location.reload();</script>");
        Response.Flush();
        Response.End();
        }
    protected void 年级DList_SelectedIndexChanged(object sender, EventArgs e)
    {
        选择年级Panel.Visible = false;
        输入详情Panel.Visible = false;
        选择部门Panel.Visible = true;
        年级Label.Text = 年级DList.SelectedValue;
    }
    protected void 选择部门DList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int Year=0;
        班级下拉框.SelectCommand = "SELECT [班级], [年级] FROM [班级] WHERE [年级] = " + Session["年级ID"].ToString();
        扣分原因.SelectCommand = "SELECT [原因] FROM [扣分原因] WHERE [部门] ='" + Session["部门名"].ToString() + "' ORDER BY [部门]";

        选择年级Panel.Visible = false;
        输入详情Panel.Visible = true;
        选择部门Panel.Visible = false;
        部门显示label.Text = 选择部门DList.SelectedValue;
        扣分原因.SelectCommand = "SELECT [原因] FROM [扣分原因] WHERE [部门] ='" + 选择部门DList.SelectedValue.ToString() + "'";
        if (选择部门DList.SelectedValue != "男宿部" && 选择部门DList.SelectedValue != "女宿部")
        {
            班级行.Visible = true;
            宿舍行.Visible = false;
            宿舍楼.Visible = false;
            原因行.Visible = true;
            备注行.Visible = true;
            相关学号tr.Visible = true;
            床号.Visible = false;
            输入分数行.Visible = true;
            提交行.Visible = true;
            选择输入模式.Visible = false;
            床号.Visible = false;
            宿舍行.Visible = false;
            宿舍楼行.Visible = false;
        }
        else 
        {
            选择输入模式.Visible = true;
            相关学号tr.Visible = false;
            班级行.Visible = false;
            宿舍行.Visible = false;
            原因行.Visible = false;
            备注行.Visible = false;
            相关学号tr.Visible = false;
            床号.Visible = false;
            输入分数行.Visible = false;
            提交行.Visible = false; 
            if (选择部门DList.SelectedValue == "男宿部")
            {
                seventh.Visible = false;
                eighth.Visible = false;
                ninth.Visible = false;
                tenth.Visible = false;
            }
        }
        /*
        switch(年级DList.SelectedItem.Text)
        {
            case "高一":
                Year=1;
                break;
            case "高二":
                Year=2;
                break;
            case "高三":
                Year=3;
                break;
            default:
                Year=4;
                break;
        }
        班级下拉框.SelectCommand = "SELECT 班级 FROM 班级 WHERE 年级='" + Year.ToString()+"'";
         * */
}
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
       // if (RadioButton1.Checked == true)
      //  {
            //RadioButton1.Checked = true;
        RadioButton2.Checked =false;
            班级行.Visible = false;
            宿舍行.Visible = false;
            原因行.Visible = false;
            备注行.Visible = false;
            相关学号tr.Visible = false;
            床号.Visible = false;
            输入分数行.Visible = false;
            提交行.Visible = false;
            宿舍楼行.Visible = true;
        //}
        //else if (RadioButton1.Checked == false )
       // {
            
       //     床号.Visible = false;
       //     宿舍DDL.Visible = false;
        //    宿舍楼行.Visible = false;
        //    选择输入模式.Visible = false;
      //  }
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
          //if (RadioButton1.Checked == true)
          //  {
            RadioButton1.Checked = false;  
        //RadioButton2.Checked = true;
            班级行.Visible = true;
            宿舍行.Visible = false;
            原因行.Visible = false;
            备注行.Visible = false;
            相关学号tr.Visible = false;
            床号.Visible = false;
            输入分数行.Visible = false;
            提交行.Visible = false;
            宿舍楼行.Visible = false;
       // }
       // else
      //  if (RadioButton1.Checked == false  )
     //   {
          
     //       床号.Visible = false;
     //       宿舍DDL.Visible = false;
      //      宿舍楼行.Visible = false;
      //      选择输入模式.Visible = false;
      //  }
    }
    protected void 宿舍楼_SelectedIndexChanged(object sender, EventArgs e)
    {
        宿舍行.Visible = true;
        选择宿舍.SelectCommand = "SELECT [宿舍名] FROM [宿舍] WHERE [单元] = '" + 宿舍楼.SelectedValue.ToString() + "' ORDER BY [单元]";
        原因行.Visible = true;
        备注行.Visible = true;
        床号.Visible = true;
        输入分数行.Visible = true;
        提交行.Visible = true;
        选择宿舍.SelectCommand = "SELECT [宿舍名] FROM [宿舍] WHERE 单元='"+宿舍楼.SelectedValue+"'";

    }
    protected void 全部_CheckedChanged(object sender, EventArgs e)
    {
        if (部门显示label.Text == "女宿部")
        {
            if (全部.Checked)
            {
                first.Checked = true;
                second.Checked = true;
                third.Checked = true;
                fourth.Checked = true;
                fifth.Checked = true;
                sixth.Checked = true;
                seventh.Checked = true;
                eighth.Checked = true;
                ninth.Checked = true;
                tenth.Checked = true;
            }
            else if (!全部.Checked)
            {
                first.Checked = false;
                second.Checked = false;
                third.Checked = false;
                fourth.Checked = false;
                fifth.Checked = false;
                sixth.Checked = false;
                seventh.Checked = false;
                eighth.Checked = false;
                ninth.Checked = false;
                tenth.Checked = false;
            }
        }
        else if (部门显示label.Text == "男宿部")
        {
            if (全部.Checked == true)
            {
                first.Checked = true;
                second.Checked = true;
                third.Checked = true;
                fourth.Checked = true;
                fifth.Checked = true;
                sixth.Checked = true;


            }
            else if (全部.Checked == false)
            {
                first.Checked = false;
                second.Checked = false;
                third.Checked = false;
                fourth.Checked = false;
                fifth.Checked = false;
                sixth.Checked = false;
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {



    }
    protected void 班级_SelectedIndexChanged(object sender, EventArgs e)
    {

            班级行.Visible = true;
            原因行.Visible = true;
            备注行.Visible = true;
            相关学号tr.Visible = true;
            输入分数行.Visible = true;
            提交行.Visible = true;
    }
    protected void 重置_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.ToString());
    }
}
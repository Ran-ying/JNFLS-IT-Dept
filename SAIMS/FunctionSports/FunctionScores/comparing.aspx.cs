using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.EnterpriseServices;

public partial class FunctionScores_comparing : System.Web.UI.Page
{
    public void MsgBox(string strMsg)//======================对话框模块======================
    {
        string StrScript;
        StrScript = ("<script language=javascript>");
        StrScript += ("alert('" + strMsg + "');");
        StrScript += ("</script>");
        System.Web.HttpContext.Current.Response.Write(StrScript);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "OK")
        {
            MsgBox("您未登录");
            Response.Redirect("login.aspx");
        }
        string MainConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(MainConnectionString);
        con1.Open();

        string addsql1;
        addsql1 = "SELECT 量化查询 FROM 权限表 WHERE 职务 LIKE '" + Session["职务"] + "'";
        SqlCommand addins1 = new SqlCommand(addsql1, con1);
        SqlDataReader addda1 = addins1.ExecuteReader();
        while (addda1.Read())
        {

            Session["量化查询"] = addda1.GetValue(0);
        }
        addda1.Close();


        if (Session["量化查询"].ToString() == "false")
        {
            MsgBox("对不起！您无此权限！");
            Response.Redirect("login.aspx");
        }
        


        con1.Close();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string MainConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(MainConnectionString);
        con1.Open();


        string comsql3;

        int i = 0, j = 0;


        comsql3 = "SELECT 部门代号,折合比例,部门名 FROM 部门 WHERE 参与量化 = 'true' AND 年级 = '" + DropDownList1.SelectedValue + "'";
        //========获取部门===========================
        SqlCommand comins3 = new SqlCommand(comsql3, con1);
        SqlDataReader comda3 = comins3.ExecuteReader();

        while (comda3.Read())
        {
            i++;
        }
        comda3.Close();
        int[] dep = new int[i];
        float[] bili = new float[i];
        string[] depname = new string[i];
        i = 0;
        SqlDataReader comda33 = comins3.ExecuteReader();

        while (comda33.Read())
        {
            dep[i] = Convert.ToInt32(comda33.GetValue(0));
            bili[i] = Convert.ToSingle(comda33.GetValue(1));
            depname[i] = Convert.ToString(comda33.GetValue(2));
            i++;
        }
        comda33.Close();

        //===========================

        string comsql1, comsql2;
        int cla = 0;

        comsql1 = "SELECT 编号,班级,ID FROM 班级 WHERE 年级 LIKE '" + DropDownList1.SelectedValue + "'AND 班级 <> '级部'";
        //=================班级
        SqlCommand comins1 = new SqlCommand(comsql1, con1);
        SqlDataReader comda1 = comins1.ExecuteReader();
        while (comda1.Read())
        {
            cla++;
        }
        comda1.Close();
        SqlDataReader comda11 = comins1.ExecuteReader();
        string[] clas = new string[cla];
        string[] clasname = new string[cla];
        int[] clasid = new int[cla];
        cla = 0;
        while (comda11.Read())
        {
            clas[cla] = comda11.GetValue(0).ToString();
            clasname[cla] = comda11.GetValue(1).ToString();
            clasid[cla] = comda11.GetInt32(2);
            cla++;
        }
        comda11.Close();

        string nam;
        int p = 0;
        int q = 0;
        int tt = 0;
        for (p = 0; p < cla; p++)
        {
            for (q = p + 1; q < cla; q++)
            {
                if (clasid[p] > clasid[q])
                {
                    nam = clas[p];
                    clas[p] = clas[q];
                    clas[q] = nam;
                    nam = clasname[p];
                    clasname[p] = clasname[q];
                    clasname[q] = nam;
                    tt = clasid[p];
                    clasid[p] = clasid[q];
                    clasid[q] = tt;
                }
            }
        }


        float[,] lh = new float[cla, i];
        float[] lhzong = new float[cla];
        int t = 0;
        float scores = 0;
        for (j = 0; j < i; j++)
        {
            for (t = 0; t < cla; t++)
            {

                comsql2 = "SELECT 扣分数 FROM 扣分 WHERE 班级 LIKE'" + clas[t] + "' AND 扣分部门代号 LIKE '" + dep[j] + "' AND 扣分时间 BETWEEN '" + Calendar1.SelectedDate.ToString() + "' AND '" + Calendar2.SelectedDate.ToString() + "'";//===================
                //=================量化

                SqlCommand comins2 = new SqlCommand(comsql2, con1);
                SqlDataReader comda2 = comins2.ExecuteReader();
                while (comda2.Read())
                {
                    scores = comda2.GetFloat(0);
                    lh[t, j] = lh[t, j] + scores;
                }
                comda2.Close();

            }
            t = t - 1;
            lh[t, j] = lh[t, j] * bili[j]*-1;
        }
        con1.Close();

        for (j = 0; j < i; j++)
        {
            for (t = 0; t < cla; t++)
            {
                lhzong[t] = lhzong[t] + lh[t, j];
            }
        }
        int m, n;
        StringBuilder sb = new StringBuilder();//=============输出成绩表格
        sb.Append("<table width=80%>");//开始填充表格标签
        for (m = 0; m < cla + 1; m++)
        {
            sb.Append("<tr>");//开始填充行标签
            if (m == 0)
            {
                sb.Append("<td>");
                sb.Append("班级");
                sb.Append("</td>");
                for (n = 0; n < i; n++)
                {
                    sb.Append("<td>");
                    sb.Append(depname[n]);
                    sb.Append("</td>");
                }
                sb.Append("<td>");
                sb.Append("总分");
                sb.Append("</td>");
            }
            else
            {
                sb.Append("<td>");
                sb.Append(clasname[m - 1].ToString());
                sb.Append("</td>");
                for (n = 0; n < i; n++)
                {
                    sb.Append("<td>");
                    sb.Append(lh[m - 1, n ].ToString());
                    sb.Append("</td>");
                }

                sb.Append("<td>");
                sb.Append(lhzong[m - 1].ToString());
                sb.Append("</td>");
            }

            sb.Append("</tr>");
        }
        sb.Append("</table>");

        tablediv.InnerHtml = sb.ToString();
    }
 
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class FunctionAnouncement_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /**
         * 
         * 
         * */
        string apart = Session["部门名"].ToString();
        string username = Session["名字"].ToString();
        DateTime createDate = DateTime.Now;
        string consql = "SELECT 公告发布 FROM 权限表 WHERE 职务 ='" + Session["职务"] + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString());
        con.Open();

        bool 公告发布 = false;

        SqlCommand cons = new SqlCommand(consql, con);
        SqlDataReader conda = cons.ExecuteReader();
        while (conda.Read())
        {
            公告发布 = conda.GetBoolean(0);
        }

        con.Close();
        if (公告发布 == false)
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>top.location='../index.aspx';alert('对不起,您没有操作权限！');</script>");
            Response.Flush();
            Response.End();  
        }

        publishDateTime.Text = DateTime.Now.ToString();
        string id1 = Request.QueryString["ID"] == null ? "" : Request.QueryString["ID"].ToString();
        string flag = Request.QueryString["flag"] == null ? "" : Request.QueryString["flag"].ToString();

        if (flag == "add")
        {
            annouceFlag.Value = "add";
        }
        else if (flag == "modify")
        {
            annouceFlag.Value = "modify";
        }

        if (id1 != null && id1 != "" && saveFlag.Value != "true")
        {
            string MessageConnectionString = "";

            announceID.Text = id1;

            MessageConnectionString = ConfigurationManager.ConnectionStrings["MessageConnectionString"].ToString();
            SqlConnection con1 = new SqlConnection(MessageConnectionString);

            try
            {
                con1.Open();

                string selectSQL;
                selectSQL = "select 日期,标题,内容 from 公告 where id='" + id1 + "'";
                SqlCommand selectNotes = new SqlCommand(selectSQL, con1);


                SqlDataReader noteReader = selectNotes.ExecuteReader();
                while (noteReader.Read())
                {

                    DateTime date = noteReader.GetDateTime(0);

                    string title = noteReader.GetString(1);
                    string content = noteReader.GetString(2);
                    titleTextBox.Text = title;
                    CKEditor1.Text = content;
                    publishDateTime.Text = date.ToLongDateString() + "  " + date.ToLongTimeString();

                }

                saveFlag.Value = "true";
            }

            finally
            {

                if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
                {
                    con1.Close();
                }
            }
        }


    }

    protected void msgSaveBtn_Click(object sender, EventArgs e)
    {
        string MessageConnectionString = "";

        saveFlag.Value = "true";


        MessageConnectionString = ConfigurationManager.ConnectionStrings["MessageConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(MessageConnectionString);
        SqlTransaction Trans = null;
        try
        {
            con1.Open();
            Trans = con1.BeginTransaction();
            if (annouceFlag.Value == "add")
            {


                string insertNoteSql;
                insertNoteSql = "insert into 公告(部门,名字,日期,标题) values(@apart,@username,@createDate,@title)";
                SqlParameter[] insertParams = { new SqlParameter("@apart", SqlDbType.NVarChar), 
                                                  new SqlParameter("@username", SqlDbType.NVarChar), 
                                                  new SqlParameter("@createDate", SqlDbType.DateTime), 
                                                  new SqlParameter("@title", SqlDbType.NVarChar), };
                int k = 0;
                insertParams[k++].Value = Session["部门名"];//部门名称;可以取Session[""]中的值，应该是当前维护用户的部门
                insertParams[k++].Value = Session["名字"];//用户名称;可以取Session[""]中的值，应该是当前用户的名称
                insertParams[k++].Value = DateTime.Now;
                insertParams[k++].Value = titleTextBox.Text;
                SqlCommand Command1 = new SqlCommand();
                Command1.Connection = con1;
                Command1.Transaction = Trans;
                Command1.CommandText = insertNoteSql;
                Command1.CommandType = CommandType.Text;
                if (insertParams != null)
                {
                    for (int j = 0; j < insertParams.Length; j++)
                    {
                        Command1.Parameters.Add(insertParams[j]);
                    }
                }
                Command1.ExecuteNonQuery();

                string selectidSql = "select DISTINCT @@IDENTITY as iden from 公告";

                SqlCommand comm2 = new SqlCommand(selectidSql, con1, Trans);
                object o = comm2.ExecuteScalar();
                string iden = null;
                if (o != null)
                {
                    iden = o.ToString();
                }


                string updateContents = "UPDATE 公告 SET 内容 = @Contents where id = @id";
                SqlParameter[] sqlParameter = { new SqlParameter("@Contents", SqlDbType.NText),
                                                  new SqlParameter("@id", SqlDbType.NVarChar), };
                //为参数传值
                int i = 0;
                sqlParameter[i++].Value = CKEditor1.Text;
                sqlParameter[i++].Value = iden;

                SqlCommand Command = new SqlCommand();
                Command.Connection = con1;
                Command.Transaction = Trans;
                Command.CommandText = updateContents;
                Command.CommandType = CommandType.Text;

                if (sqlParameter != null)
                {
                    for (int j = 0; j < sqlParameter.Length; j++)
                    {
                        Command.Parameters.Add(sqlParameter[j]);
                    }
                }
                Command.ExecuteNonQuery();




            }
            else
            {
                //修改
                string updateContents = "UPDATE 公告 SET 内容 = @Contents,部门 = @apart,名字=@username,日期=@createDate,标题=@title  where id=@id";

                SqlParameter[] insertParams = {  new SqlParameter("@Contents", SqlDbType.NText), 
                                                  new SqlParameter("@apart", SqlDbType.NVarChar), 
                                                  new SqlParameter("@username", SqlDbType.NVarChar), 
                                                  new SqlParameter("@createDate", SqlDbType.DateTime), 
                                                  new SqlParameter("@title", SqlDbType.NVarChar),
                                              new SqlParameter("@id", SqlDbType.NVarChar), };

                int k = 0;
                insertParams[k++].Value = CKEditor1.Text;
                insertParams[k++].Value = Session["部门名"];//部门名称;可以取Session[""]中的值，应该是当前维护用户的部门
                insertParams[k++].Value = Session["名字"];//用户名称;可以取Session[""]中的值，应该是当前用户的名称
                DateTime dt = DateTime.Now;
                insertParams[k++].Value = DateTime.Now;

                publishDateTime.Text = dt.ToLongDateString() + "  " + dt.ToLongTimeString();

                insertParams[k++].Value = titleTextBox.Text;
                insertParams[k++].Value = announceID.Text;



                SqlCommand Command = new SqlCommand();
                Command.Connection = con1;
                Command.Transaction = Trans;
                Command.CommandText = updateContents;
                Command.CommandType = CommandType.Text;

                if (insertParams != null)
                {
                    for (int j = 0; j < insertParams.Length; j++)
                    {
                        Command.Parameters.Add(insertParams[j]);
                    }
                }
                Command.ExecuteNonQuery();

            }

            Trans.Commit();

        }
        catch (Exception ex)
        {
            if (Trans != null)
            {
                Trans.Rollback();
            }
            throw ex;
        }
        finally
        {

            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
        }

        Response.Clear();
        Response.Write(" <script language='javascript'+>location='announcementList.aspx';alert('发布成功！');</script>");
        Response.Flush();
        Response.End();
        
    }
}
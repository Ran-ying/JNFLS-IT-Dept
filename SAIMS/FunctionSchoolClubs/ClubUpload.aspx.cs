using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionSchoolClubs_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        String folderPath = @"\FunctionSchoolClubs\icons\";
        string rootPath = Request.PhysicalApplicationPath;
        string savePath = rootPath + folderPath;
        if (FileUpload1.HasFile)
        {
            String fileName = FileUpload1.FileName;
            savePath += fileName;
            string ext = System.IO.Path.GetExtension(fileName);

            if (ext == ".png" || ext == ".jpg")
            {
                FileUpload1.SaveAs(savePath);
                iconFileName.Value = @".\icons\" + fileName;
                string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
                SqlConnection con1 = new SqlConnection(ClubConnectionString);
                con1.Open();
                try
                {
                    string verifyurlstr;
                    string upimgurl;
                    verifyurlstr = "SELECT 社徽 FROM 社团 WHERE 社长 = '" + Session["名字"] + "'";
                    SqlCommand Command2 = new SqlCommand(verifyurlstr, con1);
                    string verifyurl = (string)Command2.ExecuteScalar();
                    if (verifyurl == null || verifyurl == "")
                    {

                        upimgurl = "INSERT INTO 社团(社徽) VALUES ('" + iconFileName.Value.ToString() + "')";
                        SqlCommand Command3 = new SqlCommand();
                        Command3.Connection = con1;
                        Command3.CommandText = upimgurl;
                        Command3.CommandType = CommandType.Text;
                        Command3.ExecuteNonQuery();
                    }
                    else
                    {
                        upimgurl = "UPDATE 社团 SET 社徽 = '" + iconFileName.Value.ToString() + "'";
                        SqlCommand Command4 = new SqlCommand();
                        Command4.Connection = con1;
                        Command4.CommandText = upimgurl;
                        Command4.CommandType = CommandType.Text;
                        Command4.ExecuteNonQuery();
                    }
                    con1.Close();
                }
                finally
                {
                    if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
                    {
                        con1.Close();
                    }
                }

            }
            else
            {
                UploadStatusLabel.Text = "只允许上传*.png及*.jpg文件。";
            }
        }
        else
        {
            UploadStatusLabel.Text = "请指定待上传的文件。";
        }

    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        try
        {
            string upclubdata;
            string ClubManagerNameSql;
            ClubManagerNameSql = "SELECT 社团名 FROM 社团 WHERE 社长 = '" + Session["名字"] + "'";
            SqlCommand NameCommand = new SqlCommand();
            NameCommand.Connection = con;
            NameCommand.CommandText = ClubManagerNameSql;
            NameCommand.CommandType = CommandType.Text;
            string clubName = (string)NameCommand.ExecuteScalar();
            upclubdata = "INSERT INTO 社团信息 (社团名,标题,日期,内容) VALUES ('" + clubName + "', '" + clubName + "', '" + DateTime.Now + "', '" + CKEditor1.Text + "')";
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = upclubdata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
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
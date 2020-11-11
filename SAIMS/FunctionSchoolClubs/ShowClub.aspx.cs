using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class FunctionSchoolClubs_Default : System.Web.UI.Page
{
    ArrayList ClubIcon;
    ArrayList ClubName;
    ArrayList ImageName;
    ArrayList LabelName;//定义数组
    int number;//有多少社团存在这个变量里
    int sum;//用了多少社团存在这个变量里
    int PageNumber;//显示当前是第几页
    bool ShenPiQuanXian;
    protected void Page_Load(object sender, EventArgs e)
    {
        sum = 12;
        string ShenPiQuanXianSql;


        //读取社团信息
        string ClubsConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubsConnectionString);
        con.Open();
        string sql;
        sql = "SELECT 社团名,社徽 FROM 社团,年级 WHERE 社团.年级=年级.ID and  年级.年级 = '" + Session["年级名"] + "' ORDER BY 社团.ID";
        SqlCommand command = new SqlCommand(sql, con);
        SqlDataReader notereader = command.ExecuteReader();
        ClubName = new ArrayList();
        ClubIcon = new ArrayList();
        ImageName = new ArrayList();
        LabelName = new ArrayList();
        while (notereader.Read())
        {

            ClubName.Add(notereader.GetString(0));
            //往数组中添加数据
            ClubIcon.Add(notereader.GetString(1));

        }

        con.Close();        //读取社团信息完毕

        PageNumber = sum / 12;
        number = ClubName.Count;//有多少社团



        ImageName.Add(ImageButton1);
        ImageName.Add(ImageButton3);
        ImageName.Add(ImageButton5);
        ImageName.Add(ImageButton7);
        ImageName.Add(ImageButton9);
        ImageName.Add(ImageButton11);
        ImageName.Add(ImageButton13);
        ImageName.Add(ImageButton15);
        ImageName.Add(ImageButton17);
        ImageName.Add(ImageButton19);
        ImageName.Add(ImageButton21);
        ImageName.Add(ImageButton23);
        LabelName.Add(Label2);
        LabelName.Add(Label3);
        LabelName.Add(Label4);
        LabelName.Add(Label5);
        LabelName.Add(Label6);
        LabelName.Add(Label7);
        LabelName.Add(Label8);
        LabelName.Add(Label9);
        LabelName.Add(Label10);
        LabelName.Add(Label11);
        LabelName.Add(Label12);
        LabelName.Add(Label13);       //载入数组数据
        ArrayList joinBtnList = new ArrayList();
        joinBtnList.Add(joinBtn1);
        joinBtnList.Add(joinBtn2);
        joinBtnList.Add(joinBtn3);
        joinBtnList.Add(joinBtn4);
        joinBtnList.Add(joinBtn5);
        joinBtnList.Add(joinBtn6);
        joinBtnList.Add(joinBtn7);
        joinBtnList.Add(joinBtn8);
        joinBtnList.Add(joinBtn9);
        joinBtnList.Add(joinBtn10);
        joinBtnList.Add(joinBtn11);
        joinBtnList.Add(joinBtn12);






        int i = 0;

        foreach (ImageButton Name in ImageName)
        {
            int tempIndex = (PageNumber - 1) * 12 + i;
            if (tempIndex < number)
            {
                if (ClubIcon[tempIndex] != null)
                {
                    Name.ImageUrl = ClubIcon[tempIndex].ToString();
                }
            }





            i++;
        }
        i = 0;
        foreach (Label Name in LabelName)
        {
            int tempIndex = (PageNumber - 1) * 12 + i;
            if (tempIndex < number)
            {
                Name.Text = ClubName[tempIndex].ToString();
            }
            else
            {
                ((ImageButton)joinBtnList[i]).Visible = false;
            }

            i++;

        }
        //设置
        PageNum.Text = "第" + PageNumber + "页";   //不确定
        if (sum > 12)
        {
            downpage.Visible = true;
        }
        else
        {
            downpage.Visible = false;
        }

        if (number - sum <= 12)
        {
            uppage.Visible = false;
        }
        else
        {
            uppage.Visible = true;
        }


        SqlConnection con1 = new SqlConnection(ClubsConnectionString);
        con1.Open();

        ShenPiQuanXianSql = "SELECT 社团场地审批 FROM 权限表,用户 WHERE 用户.名字 = '" + Session["名字"] + "' AND 用户.用户组 = 权限表.职务";
        SqlCommand ShenPiQuanXianCommand = new SqlCommand();
        ShenPiQuanXianCommand.Connection = con1;
        ShenPiQuanXianCommand.CommandText = ShenPiQuanXianSql;
        ShenPiQuanXianCommand.CommandType = CommandType.Text;
        ShenPiQuanXian = (bool)ShenPiQuanXianCommand.ExecuteScalar();
        if (ShenPiQuanXian == true)
        {
            joinBtn1.Visible = false;
            joinBtn2.Visible = false;
            joinBtn3.Visible = false;
            joinBtn4.Visible = false;
            joinBtn5.Visible = false;
            joinBtn7.Visible = false;
            joinBtn8.Visible = false;
            joinBtn9.Visible = false;
            joinBtn10.Visible = false;
            joinBtn11.Visible = false;
            joinBtn12.Visible = false;
        }
        con1.Close();
    }

    protected void downpage_Click(object sender, EventArgs e)
    {
        sum = sum + 12;
    }
    protected void uppage_Click(object sender, EventArgs e)
    {
        sum = sum - 12;
    }


    private void JoinClub(string clubname)
    {

        string ClubConnectionString = "";



        ClubConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(ClubConnectionString);

        try
        {
            con1.Open();
            //判断该用户是否合法用户
            string selectSQL;
            selectSQL = "select count(*) from 用户 where 名字='" + Session["名字"] + "'";
            SqlCommand selectNotes = new SqlCommand(selectSQL, con1);


            int count = (int)selectNotes.ExecuteScalar();
            if (count <= 0)
            {

                errorMsgLable.Text = "当前用户不是系统中的用户！请修改。";
                return;
            }
            string select1SQL;
            select1SQL = "select count(*) from 社团成员 where 社团成员='" + Session["名字"] + "'";
            SqlCommand selectClubMemberReplicate = new SqlCommand(select1SQL, con1);


            int count1 = (int)selectClubMemberReplicate.ExecuteScalar();
            if (count1 > 0)
            {
                errorMsgLable.Text = "您已经是当前社团用户，不允许重复加入！请修改。";
                return;
            }


            string insertClubMemberSql;
            insertClubMemberSql = "insert into 社团成员(社团成员,社团名) values (@username,@clubname)";
            SqlParameter[] insertParams = { new SqlParameter("@username", SqlDbType.NVarChar), 
                                                  new SqlParameter("@clubname", SqlDbType.NVarChar), 
                                                  };
            int k = 0;
            insertParams[k++].Value = Session["名字"];//
            insertParams[k++].Value = clubname;//

            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con1;

            Command1.CommandText = insertClubMemberSql;
            Command1.CommandType = CommandType.Text;
            if (insertParams != null)
            {
                for (int j = 0; j < insertParams.Length; j++)
                {
                    Command1.Parameters.Add(insertParams[j]);
                }
            }
            Command1.ExecuteNonQuery();
            errorMsgLable.Text = "加入成功.";


        }

        finally
        {

            if (con1 != null && con1.State != System.Data.ConnectionState.Closed)
            {
                con1.Close();
            }
        }
    }
    protected void joinBtn1_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label2.Text);
        joinBtn1.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn2_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label3.Text);
        joinBtn2.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn3_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label4.Text);
        joinBtn3.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn4_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label5.Text);
        joinBtn4.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn5_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label6.Text);
        joinBtn5.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn6_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label7.Text);
        joinBtn6.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn7_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label8.Text);
        joinBtn7.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn8_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label9.Text);
        joinBtn8.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn9_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label10.Text);
        joinBtn9.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn10_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label11.Text);
        joinBtn10.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn11_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label12.Text);
        joinBtn11.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void joinBtn12_Click(object sender, ImageClickEventArgs e)
    {
        JoinClub(Label13.Text);
        joinBtn12.ImageUrl = "~/Images/buttons/JoinUsOnClick.png";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("./clubinfo.aspx?id=" + Label2.Text);
    }
}
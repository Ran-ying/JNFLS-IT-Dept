using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class FunctionLyric_Setting : System.Web.UI.Page
{
    public double PrstOffset = 0;
    


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["职务"].ToString() != "45" && Session["职务"].ToString() != "46" && Session["职务"].ToString() != "47" && Session["职务"].ToString() != "48")
        {
            Response.Clear();
            Response.Write(" <script language='javascript'+>location='../FunctionLyric/Lyric.html';</script>");
            Response.Flush();
            Response.End();
        }
        ReadOffset();
        //Offset_Now.Text = PrstOffset.ToString();
    }

    protected void LinkButton1_Save(object sender, EventArgs e)
    {
        string Lyric = TextBoxLrc.Text;
        string ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
            string updata="";
            updata = "UPDATE [MainSQL].[dbo].[歌词表] SET [歌词]='" + Lyric + "' WHERE ID=1"; ; ; ; ; ; ; //
            SqlCommand Command1 = new SqlCommand();
            Command1.Connection = con;
            Command1.CommandText = updata;
            Command1.CommandType = CommandType.Text;
            Command1.ExecuteNonQuery();
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
    }
    protected void UpdateBackground(int bgvalue)
    {
        string Lyric = TextBoxLrc.Text;
        string ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string updata;
        updata = "UPDATE  [MainSQL].[dbo].[歌词表] SET [背景]='" + bgvalue + "' WHERE ID='1'";
        SqlCommand Command1 = new SqlCommand();
        Command1.Connection = con;
        Command1.CommandText = updata;
        Command1.CommandType = CommandType.Text;
        Command1.ExecuteNonQuery();
        if (con != null && con.State != System.Data.ConnectionState.Closed)
        {
            con.Close();
        }
    }
    protected void ReadOffset()
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
           
            string ClearanceSql = "SELECT [偏移量] FROM [MainSQL].[dbo].[歌词表] WHERE ID='1'";
            SqlCommand ClearanceCommand = new SqlCommand();
            ClearanceCommand.Connection = con;
            ClearanceCommand.CommandText = ClearanceSql;
            ClearanceCommand.CommandType = CommandType.Text;
            PrstOffset = (double)ClearanceCommand.ExecuteScalar();
            if (con != null && con.State != System.Data.ConnectionState.Closed)
            {
                con.Close();
            }
    }

    protected void SetBackground(int backgroundid)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string updata;
        updata = "UPDATE  [MainSQL].[dbo].[歌词表] SET [背景]='" + backgroundid + "' WHERE ID='1'";
        SqlCommand Command1 = new SqlCommand();
        Command1.Connection = con;
        Command1.CommandText = updata;
        Command1.CommandType = CommandType.Text;
        Command1.ExecuteNonQuery();
        if (con != null && con.State != System.Data.ConnectionState.Closed)
        {
            con.Close();
        }
    }
    protected void SetOffset(double offset)
    {
        double NewOffset = PrstOffset + offset;
        //string Lyric = TextBoxLrc.Text;
        string ConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string updata;
        updata = "UPDATE  [MainSQL].[dbo].[歌词表] SET [偏移量]='" + NewOffset + "' WHERE ID='1'";
        SqlCommand Command1 = new SqlCommand();
        Command1.Connection = con;
        Command1.CommandText = updata;
        Command1.CommandType = CommandType.Text;
        Command1.ExecuteNonQuery();
        if (con != null && con.State != System.Data.ConnectionState.Closed)
        {
            con.Close();
        }
    }

    protected void Plus1s_Click(object sender, EventArgs e)
    {
        SetOffset(1);
    }
    protected void PlusM1s_Click(object sender, EventArgs e)
    {
        SetOffset(-1);
    }
    protected void PlusM100ms_Click(object sender, EventArgs e)
    {
        SetOffset(-0.1);
    }
    protected void Plus100ms_Click(object sender, EventArgs e)
    {
        SetOffset(0.1);
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        SetBackground(2);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        SetBackground(1);
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        SetBackground(4);
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        SetBackground(3);
    }
}

/*

 * 
 * [00:09.00]起来 饥寒交迫的奴隶
[00:15.00]起来 全世界受苦的人
[00:19.00]满腔的热血已经沸腾 要为真理而斗争
[00:29.00]旧世界打个落花流水 奴隶们起来 起来
[00:39.00]不要说我们一无所有 我们要做天下的主人
[00:48.00]这是最後的斗争团结起来到明天
[00:58.00]英特纳雄耐尔就一定要实现
[01:08.00]这是最後的斗争团结起来到明天
[01:18.00]英特纳雄耐尔就一定要实现
[01:28.00]从来就没有什麽救世主 也不靠神仙皇帝
[01:37.00]要创造人类的幸福 全靠我们自己
[01:47.00]我们要夺回劳动果实 让思想冲破牢笼
[01:57.00]快把那炉火烧得通红 趁热打铁才能成功
[02:06.00]这是最後的斗争团结起来到明天
[02:16.00]英特纳雄耐尔就一定要实现
[02:26.00]这是最後的斗争团结起来到明天
[02:35.00]英特纳雄耐尔就一定要实现
[03:05.00]最可恨那些毒蛇猛兽吃尽了我们的血肉
[03:15.00]一旦把他们消灭乾净鲜红的太阳照遍全球
[03:24.00]这是最後的斗争团结起来到明天
[03:34.00]英特纳雄耐尔就一定要实现
[03:44.00]这是最後的斗争团结起来到明天
[03:53.00]英特纳雄耐尔就一定要实现
 * 
 * 
 * 
 * [00:01.07]咴~~~~~~
[00:04.09]吁
[00:05.38]哎~~~来~~~~
[00:10.85]O BO ~草泥马
[00:12.86]噢噢噢~~哎哎哎~~~
[00:15.82]宽广的马勒戈壁 景色多壮丽
[00:21.92]勇敢的朝尼族人民 歌颂著你 
[00:27.27]俊健的草泥马 多么的美丽 
[00:32.39]一直不停的奔跑 向着那日出的方向
[00:38.58]嘿~在马背上 弹奏一曲 动听的旋律
[00:48.44]迷人的姑娘 她心醉神迷
[00:53.62]醉在这玛勒戈壁
[00:57.69]噢~~~呦
[00:58.71]我今天特意 应邀来到马勒戈壁
[01:01.02]传说有一种美丽的神兽它们生存这里
[01:03.69]生活在山坡 就在朝尼家的隔壁
[01:06.35]它们忧郁的眼神 好像生活总不乐意
[01:09.00]在这里一年四季不变都吃沃草
[01:11.68]干旱的环境决定这里雨水没有多少
[01:14.32]但是坚强的草泥马 群居这里
[01:16.95]一群群妆点这美丽的马勒戈壁
[01:19.69]这里的草泥马其实分为三种
[01:22.55]成年还不不会骑马的那是饭桶
[01:24.98]朝尼两次的那匹叫做狂草泥马
[01:27.63]只有部族最厉害的骑手才能骑它
[01:30.32]热情好客的朝尼两次 接待了我
[01:33.01]来到了牧场大家围着篝火 欢迎着我
[01:35.67]甘甜的草泥马奶 美丽的姑娘
[01:38.44]英俊的朝尼两次 弹琴对我歌唱
[01:41.32]哎~~~~
[01:43.89]在马背上 弹奏一曲 美妙的旋律
[01:52.34]远方的客人 我们祝福你
[01:57.77]欢迎来马勒戈壁
[02:00.57]嘿~~嘿~~嘿嘿嘿~~~
[02:02.63]远方来的客人请您听我说
[02:04.96]对您的祝福来自于我的心田
[02:07.57]为您献上美酒 还有马奶的甘甜
[02:10.27]请您随着我的歌声一起 游览这平原
[02:12.94]这里到处长满茂盛的沃草
[02:15.62]甜美多汁玛勒戈壁的骄傲
[02:18.48]只有它 才能抚育草泥马长大
[02:20.94]因为它 这的风景才能更胜一幅画
[02:23.59]点燃篝火 朝尼大爷他弹着马头琴
[02:26.28]能歌善舞的朝尼姑娘 奔放又热情
[02:28.92]一起狂欢吧 一起狂欢吧
[02:31.60]让我们一起打着手鼓唱着歌
[02:34.26]希望你会开始喜欢上这里
[02:36.90]喜欢上这壮丽的玛勒戈壁
[02:39.56]用沃草编成草环献给您
[02:42.26]当您离去的时候别忘了骑上
[02:44.23]草泥马
[02:47.05]对话
[02:49.71](朝尼哥,哎,草泥马为什么越来越少了?)
[02:53.89](哎哟,那草泥马吃沃草才能活的是不?)
[02:57.09](那沃草都被河蟹给吃光喽!) 
[03:00.13](河蟹是嘛玩意儿?)
[03:01.91](你想知道?小伙子,听我接着唱呗,来勒!)
[03:07.19]听说它本来应该生长的地方
[03:12.12]是在那银迹岸的咪子河
[03:17.49]也不知道为什么 来到了这里
[03:22.84]来到这玛勒戈壁
[03:28.53]它根本就不通人性 见草就拔光
[03:33.65]有着坚硬的外壳 也没办法杀完
[03:38.81]沃草在变少 草泥马该怎么办
[03:44.40]美丽的它 该怎么办
[03:49.43]嘿~~~在马背上 我在烦恼
[03:54.88]美丽的草泥马 该怎么办
[04:05.69]LRC BY:彪悍的淫僧
*/
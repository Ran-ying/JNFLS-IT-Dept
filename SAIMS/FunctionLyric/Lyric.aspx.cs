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

public partial class Lyric : System.Web.UI.Page {
    public string[] LyricSentence;
    public string[] LyricTime;
    public double[] Time;
    public bool play = false;
    int LyricStartHour = 13, LyricStartMin = 40, LyricStartSec = 0;
    double LyricLength = 0;
    public double PrstOffset = 0;

    public double CountTime() {
        double PastSec = (DateTime.Now.Hour - LyricStartHour) * 3600 + (DateTime.Now.Minute - LyricStartMin) * 60 + (DateTime.Now.Second - LyricStartSec) + (DateTime.Now.Millisecond * 0.001) + PrstOffset;
        double SEC = PastSec % LyricLength;
        return SEC;
        }
    public bool playornot() {
        if((DateTime.Now.Hour == LyricStartHour) && (DateTime.Now.Minute == LyricStartMin || DateTime.Now.Minute > LyricStartMin))
            play = true;
        else
            play = false;
        return play;
        }
    protected void Page_Load(object sender, EventArgs e) {

        DUQU();
        ReadOffset();
        Label1.Text = CountTime().ToString();
        DisplayLyric();
        }
    public void DUQU() {
        string ClubConnectionString = ConfigurationManager.ConnectionStrings["Main1ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ClubConnectionString);
        con.Open();
        SqlCommand Command1 = new SqlCommand("SELECT [歌词] FROM [MainSQL].[dbo].[歌词表]", con);
        Command1.CommandType = CommandType.Text;
        SqlDataReader conda = Command1.ExecuteReader();
        string Lyrics = "";
        if(conda.Read())
            Lyrics = conda.GetString(0);
        string[] 歌词和时间们 = Lyrics.Split(new char[2] { '[', ']' });
        LyricSentence = new String[歌词和时间们.Length / 2];
        LyricTime = new String[歌词和时间们.Length / 2];
        Time = new double[LyricTime.Length];
        int a = 0, b = 0;
        for(int i = 1; i < 歌词和时间们.Length; i++) {
            if(i % 2 != 0)
                LyricTime[a++] = 歌词和时间们[i];
            else
                LyricSentence[b++] = 歌词和时间们[i];
            }
        TurntoSecond();
        if(con != null && con.State != System.Data.ConnectionState.Closed) {
            con.Close();
            }
        }
    public void TurntoSecond() {
        char[] check = new char[10];
        int fendemiao = 0, miao = 0;
        double haomiao = 0, time = 0;
        int k = 0;
        while(k < LyricTime.Length) {
            check = LyricTime[k].ToCharArray();
            fendemiao = ((check[0] - 48) * 10 + (check[1]) - 48) * 60;
            miao = (check[3] - 48) * 10 + (check[4] - 48);
            haomiao = (check[6] - 48) * 0.1 + (check[7] - 48) * 0.01;
            time = fendemiao + miao + haomiao;
            Time[k] = time;
            k++;
            LyricLength = time;
            }
        }
    public void DisplayLyric() {
        for(int n = 0; n <= Time.Length - 1; n++) {

            if(CountTime() > Time[n] && CountTime() < Time[n + 1]) {
                prev.Text = LyricSentence[(n == 0 ? 0 : n - 1)];
                prst.Text = LyricSentence[n];
                next.Text = LyricSentence[n + 1];
                }

            }
        }
    public void ReadOffset() {
        string ConnectionString = ConfigurationManager.ConnectionStrings["ClubConnectionString"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string ClearanceSql;
        ClearanceSql = "SELECT [偏移量] FROM [MainSQL].[dbo].[歌词表] WHERE ID='1'";
        SqlCommand ClearanceCommand = new SqlCommand();
        ClearanceCommand.Connection = con;
        ClearanceCommand.CommandText = ClearanceSql;
        ClearanceCommand.CommandType = CommandType.Text;
        PrstOffset = (double)ClearanceCommand.ExecuteScalar();
        if(con != null && con.State != System.Data.ConnectionState.Closed) {
            con.Close();
            }
        }
    }
/*
 
[00:02.00]最炫民族风 
[00:06.10]词曲：张超 编曲：张超 
[00:10.10]演唱：凤凰传奇 
[00:14.10] 
[00:16.10] 
[00:20.20] 
[00:22.30]苍茫的天涯是我的爱 
[00:26.07]绵绵的青山脚下花正开 
[00:29.82]什么样的节奏是最呀最摇摆 
[00:33.58]什么样的歌声才是最开怀 
[00:37.50]弯弯的河水从天上来 
[00:41.12]流向那万紫千红一片海 
[00:44.95]火辣辣的歌谣是我们的期待 
[00:48.68]一路边走边唱才是最自在 
[00:52.51]我们要唱就要唱得最痛快 
[00:56.29]你是我天边 最美的云彩 
[01:00.06]让我用心把你留下来（留下来） 
[01:03.86]悠悠的唱着最炫的民族风 
[01:07.61]让爱卷走所有的尘埃 
[01:10.81]（我知道）你是我心中 最美的云彩 
[01:15.24]斟满美酒让你留下来（留下来） 
[01:18.96]永远都唱着 最炫的民族风 
[01:22.59]是整片天空最美的姿态（留下来） 
[01:26.58]（哟啦啦呵啦呗） 
[01:28.57]（伊啦嗦啦呵啦呗呀） 
[01:30.50]我听见你心中动人的天籁 
[01:33.97]登上天外云霄的舞台 
[01:37.60] 
[01:53.00]苍茫的天涯是我的爱 
[01:56.66]绵绵的青山脚下花正开 
[02:00.55]什么样的节奏是最呀最摇摆 
[02:04.26]什么样的歌声才是最开怀 
[02:08.13]弯弯的河水从天上来 
[02:11.81]流向那万紫千红一片海 
[02:15.69]火辣辣的歌谣是我们的期待 
[02:19.44]一路边走边唱才是最自在 
[02:23.29]我们要唱就要唱得最痛快 
[02:27.27]你是我天边 最美的云彩 
[02:30.91]让我用心把你留下来（留下来） 
[02:34.59]悠悠的唱着最炫的民族风 
[02:38.32]让爱卷走所有的尘埃 
[02:41.32]（我知道）你是我心中 最美的云彩 
[02:45.83]斟满美酒让你留下来（留下来） 
[02:49.56]永远都唱着 最炫的民族风 
[02:53.32]是整片天空最美的姿态 
[02:57.40] 
[03:03.90] 
[03:11.41] 
[03:17.96]你是我天边 最美的云彩 
[03:21.69]让我用心把你留下来（留下来） 
[03:25.64]悠悠的唱着 最炫的民族风 
[03:29.25]让爱卷走所有的尘埃 
[03:32.40]（我知道）你是我心中 最美的云彩 
[03:36.83]斟满美酒让你留下来（留下来） 
[03:40.68]永远都唱着 最炫的民族风 
[03:44.33]是整片天空最美的姿态 
[03:48.48] 
[03:50.04]rap：我听见你心中那动人的天籁 
[03:53.68]就忽如一夜春风袭来满面桃花开 
[03:57.70]我忍不住去采 我忍不住去摘 
[04:01.38]我敞开胸怀为你等待 
[04:04.28] 
[04:05.46]你是我天边 最美的云彩 
[04:08.96]让我用心把你留下来 
[04:12.75]悠悠的唱着 最炫的民族风 
[04:16.62]让爱卷走所有的尘埃 
[04:19.53]（我知道）你是我心中 最美的云彩 
[04:24.04]斟满美酒让你留下来（留下来） 
[04:27.94]永远都唱着 最炫的民族风 
[04:31.65]是整片天空最美的姿态 
[04:35.82]  */
/*
 * 
using System;   
using System.Collections.Generic;   
using System.Text;   
using System.Threading;    
namespace Foxer_Player_1._1   
{   
    class lrc_show   
    {   
        private static string musicPath;   
        private static string lrcPath;   
        private static string[] lrcString;   
        private static string listItem;   
        private static string  listItemUnAdd ="XX#ooX#X";   
        private static bool isHasLrc=false;   
        public static bool unClict=true;   
        private static string[] clear;   
        //main   
        public static string get_lrc(string musicPath1,string geciIs1)   
        {   
               
            musicPath = musicPath1;   
            getGeci_str();   
            string listAdd=getList_add_geci(geciIs1);   
            return listAdd;   
              
        }   
        public static void getGeci_str()   
        {   
            try  
            {   
            //FileInfo fi = new FileInfo(musicPath);   
            foreach (string gecifile in Directory.GetFiles(Application.StartupPath + "\\Lrc\\"))   
            {   
                FileInfo fi2 = new FileInfo(gecifile);   
                lrcPath = fi.Name.Remove(fi.Name.LastIndexOf('.'));   
                try  
                {   
                    if (fi2.Name.Substring(0, fi2.Name.Length - 4) == fi.Name.Substring(0, fi.Name.Length - 4))   
                    {   
                        lrcString = File.ReadAllLines(gecifile, Encoding.Default);   
                        isHasLrc = true;   
                        return;   
                    }   
                    lrcString = clear;   
                    if (unClict)   
                    {   
                        Thread t2 = new Thread(new ThreadStart(fangfa));   
                        t2.IsBackground = true;   
                        t2.Start();   
                        unClict = false;   
                        isHasLrc = true;   
                    }   
                }   
                catch  
                {   
                }   
            }   
            }   
            catch  
            {   
            }   
              
            
        }   
        private static void fangfa()   
        {   
            lrc_down.gecixia(lrcPath);   
        }   
        private static string  getList_add_geci(string currentPos)   
        {   
               
            try  
            {   
                for (int i = 0; i < lrcString.Length; i++)   
                {   
                    int l = lrcString[i].LastIndexOf("]");   
                    if(l == 9)   
                    {   
                        if (getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 8, 5))   
                        {   
                            listItem = lrcString[i].Substring(l + 1, lrcString[i].Length - l - 1);   
                            return listItem;   
                        }   
                         
                    }   
                    else  
                        if (l == 19)   
                        {   
                            if (getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 8, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 18, 5))   
                            {   
                                listItem = lrcString[i].Substring(l + 1, lrcString[i].Length - l - 1);   
                                return listItem;   
                            }   
                             
                        }   
                        else  
                            if (l == 29)   
                            {   
                                if (getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 8, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 18, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 28, 5))   
                                {   
                                    listItem = lrcString[i].Substring(l + 1, lrcString[i].Length - l - 1);   
                                    return listItem;   
                                }   
                                 
                            }   
                            else  
                                if (l == 39)   
                                {   
                                    if (getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 8, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 18, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 28, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 38, 5))   
                                    {   
                                        listItem = lrcString[i].Substring(l + 1, lrcString[i].Length - l - 1);   
                                        return listItem;   
                                    }   
                                     
                                }   
                                else  
                                    if (l == 49)   
                                    {   
                                        if (getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 8, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 18, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 28, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 38, 5) || getLengthWithFormat2(currentPos) == lrcString[i].Substring(l - 48, 5))   
                                        {   
                                            listItem = lrcString[i].Substring(l + 1, lrcString[i].Length - l - 1);   
                                            return listItem;   
                                        }   
                                         
                                    }   
                      
                }   
                return listItemUnAdd;   
            }   
            catch  
            {   
                return listItemUnAdd;   
            }   
        }   
        private static string getLengthWithFormat2(string mm)   
        {   
            string ccds = mm.Replace("00:", "");   
            if (ccds.Length < 5)   
            {   
                ccds = "00:" + ccds;   
            }   
            return ccds;   
        }   
    }   
}  
*/
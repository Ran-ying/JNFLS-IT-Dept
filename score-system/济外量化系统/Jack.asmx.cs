using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

namespace 济外量化系统
{
    /// <summary>
    /// Jack 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    // [System.Web.Script.Services.ScriptService]
    public class Jack : System.Web.Services.WebService
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AConnectionString"].ToString());

        [WebMethod]
        public string[] HelloWorld(int tryconnection)//测试数据库连接和首页轮播图片
        {
            if (tryconnection == 1)
            {
                try
                {
                    con.Open();
                    string[] picture = { "www.goodjack.top/1.png", "www.goodjack.top/2.png", "www.goodjack.top/3.png" };
                    return picture;
                }
                catch
                {
                    string[] con = { "false" };
                    return con;
                }
            }
            else
            {
                string[] con = { "false" };
                return con;
            }
        }

        public string[] wxuserlogin(string wxnumber)//微信登陆
        {
            con.Open();
            string[] userinfo = {""};//身份，年级，姓名，区域
            return userinfo;
        }

        public string[] qrcodeuserlogin(string wxnumber)//扫码登陆
        {
            con.Open();
            string[] userinfo = { "" };//身份，年级，姓名，区域
            return userinfo;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FunctionRecommendedSM_list : System.Web.UI.Page
{
    private void Not(GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                string state = e.Row.Cells[4].Text;//取出来的单元格的文本带有RMB字符串，如：<font color=red>RMB</font>50.47
           
                if (state == "false")
                {
                    e.Row.BackColor = System.Drawing.Color.Yellow;//使用预设颜色来设置行的背景色
                    e.Row.ForeColor = System.Drawing.Color.FromName("#ff0000");//使用十六进制的颜色，设置前景色
                }
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
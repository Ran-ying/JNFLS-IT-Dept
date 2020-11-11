<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommandScores.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style type="text/css">
        body {
            background-image: url(../Images/microicons/lianghua1.png);
            font-family: 微软雅黑,黑体;
        }
          </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label4" runat="server" style="color:Red;" 
            Text="使用说明（男宿部+女宿部）:输入量化先选择原因和宿舍楼 ，然后输入量化按照格式：“ 宿舍号+扣分加分数+床号”。一行分输入完成后按Enter输入下一行分数，不设上限但要确保正确。床号输入请如实输入。！！！！！床号禁止输入-a的格式！！！！！全选可不打床号 " 
            Font-Bold="True"></asp:Label>
        <asp:Label ID="Label5" runat="server" style="color:Yellow"  Font-Bold="True" Text="输入框可以拖大或者拖小哦亲~"></asp:Label>
            <hr />
        <asp:Label ID="Label1" runat="server" Text="原因："></asp:Label>
        <asp:DropDownList ID="原因" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="原因" DataValueField="原因">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
            SelectCommand="SELECT [原因] FROM [扣分原因]"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="宿舍楼："></asp:Label>
        <asp:DropDownList ID="宿舍楼" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="宿舍楼" DataValueField="宿舍楼">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Main1ConnectionString %>" 
            SelectCommand="SELECT [宿舍楼] FROM [宿舍单元]"></asp:SqlDataSource>
        <asp:Label ID="Label3" runat="server" Text="备注："></asp:Label>
        <asp:TextBox ID="备注" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="命令" runat="server" TextMode=MultiLine Height="189px" 
            Width="188px"></asp:TextBox>
        <asp:Button ID="确定" runat="server" Text="YES!" onclick="确定_Click" />
        

    </div>
    <p>
        </p>
    
    </form>
    
</body>
</html>

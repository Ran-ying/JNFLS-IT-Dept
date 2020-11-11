<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClubPosition.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>
<script runat="server">

    protected void insertDataID_ValueChanged(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;background-image:url(../Images/microicons/shetuan1.png);}
</style>
    </head>
<body>
    <form id="form1" runat="server">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%">
            <tr runat="server" id="first"><td style="font-family: 微软雅黑,黑体; text-align: center;" >
               
                    选择场地<br />
                    <asp:DropDownList runat="server" DataTextField="场地名" DataValueField="场地名" DataSourceID="SqlDataSource1" Height="48px" Width="190px" ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>请选择场地</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ClubConnectionString %>" SelectCommand="SELECT [场地名] FROM [场地] ORDER BY [ID]" ID="SqlDataSource1"></asp:SqlDataSource>
                
               
                    <br />
                </td></tr>
           <tr  runat="server" id="second"><td style="font-family: 微软雅黑,黑体; text-align: center;">选择日期<asp:Calendar runat="server" BackColor="White" BorderColor="#3366CC" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="100%" ID="Calendar1" OnSelectionChanged="Calendar1_SelectionChanged" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest">
                    <DayHeaderStyle ForeColor="#336666" Height="1px" BackColor="#99CCCC"></DayHeaderStyle>
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"></NextPrevStyle>
                    <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
                    <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True"></SelectedDayStyle>
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" BorderColor="#3366CC" BorderWidth="1px"></TitleStyle>
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White"></TodayDayStyle>
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
                </td></tr>
            <tr runat="server" id="fourth"><td style="font-family: 微软雅黑,黑体; text-align: center;">
                <br />
                <asp:TextBox ID="CKEditor1" runat="server" Height="160px" TextMode="MultiLine" Width="601px" style="margin-left: 0px; margin-right: 0px;"></asp:TextBox>
                <br />
                <asp:Button ID="Button2" runat="server" Text="完成" Width="63px" OnClick="Button2_Click" />
                <br />
                <asp:HiddenField runat="server" ID="selectedDateField"></asp:HiddenField>
                <asp:HiddenField runat="server" ID="insertDataID"></asp:HiddenField>
                </td></tr>
             </table>
    </form>
</body>
</html>

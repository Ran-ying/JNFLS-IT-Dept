<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="SportsAddClassScore.aspx.cs" Inherits="FunctionSports_SportsAddClassScore" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-family: 微软雅黑,黑体;
            font-size: xx-large;
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <div style ="width:500px;text-align: center;">
    


        <br />
<table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>精神文明班级量化提交</td></tr></table>        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="选择年级"></asp:Label>
        <asp:DropDownList ID="grade" runat="server" AutoPostBack="True" 
            DataSourceID="gradesource" DataTextField="年级" DataValueField="ID">
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" Text="选择班级"></asp:Label>
        <asp:DropDownList ID="clas" runat="server" AutoPostBack="True" 
            DataSourceID="classsource" DataTextField="班级" DataValueField="编号">
        </asp:DropDownList>
    


        <asp:SqlDataSource ID="gradesource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            SelectCommand="SELECT [年级], [ID] FROM [年级] WHERE ([ID] &lt;&gt; @ID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="classsource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            SelectCommand="SELECT [编号], [班级] FROM [班级] WHERE (([年级] = @年级) AND ([班级] &lt;&gt; @班级)) ORDER BY [ID]">
            <SelectParameters>
                <asp:ControlParameter ControlID="grade" Name="年级" PropertyName="SelectedValue" 
                    Type="Int32" />
                <asp:Parameter DefaultValue="级部" Name="班级" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        

        <asp:RadioButtonList ID="jianchazu" runat="server" AutoPostBack="True">
            <asp:ListItem>考勤</asp:ListItem>
            <asp:ListItem>纪律</asp:ListItem>
            <asp:ListItem>卫生</asp:ListItem>
            <asp:ListItem>场务</asp:ListItem>
            <asp:ListItem>宣传</asp:ListItem>
        </asp:RadioButtonList>
    


        <asp:Label ID="Label4" runat="server" Text="量化赋分"></asp:Label>
        <asp:TextBox ID="score" runat="server" ></asp:TextBox>
    


        <br />
        <br />
        <asp:Button ID="Click" runat="server" BorderStyle="Solid" Height="53px" 
             Text="确定" Width="153px" onclick="Click_Click" />
    


        <br />
        <br />
        <asp:Label ID="Info" runat="server"></asp:Label>
    


    </div>

    <br />
</asp:Content>


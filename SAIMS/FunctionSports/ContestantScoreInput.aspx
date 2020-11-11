<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="ContestantScoreInput.aspx.cs" Inherits="FunctionSports_Addgrades" %>

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
 

    <div style ="  text-align: center;">
    


        <br />
<table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>运动会竞赛成绩添加</td></tr></table>        <br />
        <asp:Label ID="Label1" runat="server" Text="年级"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="GradeSource" DataTextField="年级" DataValueField="ID">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="项目"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="ItemSource" DataTextField="项目名称" DataValueField="项目代码" 
            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" DataSourceID="SporterSource" 
            AutoGenerateColumns="False" DataKeyNames="ID" 
            onrowcommand="GridView1_RowCommand" onrowupdating="GridView1_RowUpdating1" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" >
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                    ReadOnly="True" />
                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="号码" HeaderText="号码" SortExpression="号码" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="项目名称" HeaderText="项目名称" SortExpression="项目名称" />
                <asp:BoundField DataField="赛程" HeaderText="赛程" SortExpression="赛程" />
                <asp:BoundField DataField="计分方式" HeaderText="计分方式" SortExpression="计分方式" />
                <asp:TemplateField HeaderText="成绩">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="提交 ">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="AddGrades" CommandArgument=<%#Eval("ID")%>>提交</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
    
        <asp:Label ID="Info" runat="server">请注意不要重复提交数据！</asp:Label>
        <br />
        <asp:SqlDataSource ID="ItemSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            
            
            SelectCommand="SELECT [项目代码], [项目名称], [参赛年级], [计分方式] FROM [运动会项目] WHERE ([参赛年级] = @参赛年级)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="参赛年级" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SporterSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            
            
            
            SelectCommand="SELECT [ID], [年级], [班级], [号码], [姓名], [赛程], [项目名称], [计分方式] FROM [运动会运动员View] WHERE (([年级] = @年级) AND ([项目] = @项目))">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="项目" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="GradeSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            SelectCommand="SELECT [年级], [ID] FROM [年级]"></asp:SqlDataSource>
        <br />

    </div>

    <br />

</asp:Content>


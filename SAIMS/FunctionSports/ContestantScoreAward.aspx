<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="ContestantScoreAward.aspx.cs" Inherits="FunctionSports_award" %>

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
    

    <div style =" text-align: center;">
    


        <br />
<table  width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>运动会竞赛发奖</td></tr></table>        <br />
        <asp:Label ID="Label1" runat="server" Text="年级"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="GradeSource" DataTextField="年级" DataValueField="ID">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="班级"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="classSource" DataTextField="班级" DataValueField="编号" 
            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="SporterSource" onrowcommand="GridView1_RowCommand" >
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="年级" HeaderText="年级" 
                    SortExpression="年级" />
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="号码" HeaderText="号码" SortExpression="号码" />
                <asp:BoundField DataField="项目" HeaderText="项目" SortExpression="项目" />
                <asp:CheckBoxField DataField="已发奖" HeaderText="已发奖" SortExpression="已发奖" />
                <asp:TemplateField HeaderText="确认发奖">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="award" CommandArgument=<%#Eval("ID")%>>确认发奖</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
    
        <asp:Label ID="Info" runat="server"></asp:Label>
        <br />
        <asp:SqlDataSource ID="classSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            
            SelectCommand="SELECT [班级], [编号] FROM [班级] WHERE ([年级] = @年级)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="年级" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SporterSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            
            
            
            
            SelectCommand="SELECT [ID], [年级], [班级], [姓名], [项目], [号码], [已发奖] FROM [运动会决赛发奖] WHERE ([班级] = @班级)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="班级" 
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

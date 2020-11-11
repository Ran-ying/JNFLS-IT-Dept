<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Sports.master" AutoEventWireup="true" CodeFile="ContestantScoreAdvancement.aspx.cs" Inherits="FunctionSports_upgrade" %>

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
<td>运动会竞赛晋级</td></tr></table>        <br />
        <asp:Label ID="Label1" runat="server" Text="年级"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="GradeSource" DataTextField="年级" DataValueField="ID">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="项目"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
            <asp:ListItem>预赛</asp:ListItem>
            <asp:ListItem>决赛</asp:ListItem>
            <asp:ListItem>预决赛</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="ItemSource" DataTextField="项目名称" DataValueField="项目代码" 
            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
            DataSourceID="SporterSource" onrowcommand="GridView1_RowCommand" 
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="711px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                    ReadOnly="True" />
                <asp:BoundField DataField="年级" HeaderText="年级" 
                    SortExpression="年级" />
                <asp:BoundField DataField="班级" HeaderText="班级" SortExpression="班级" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="号码" HeaderText="号码" SortExpression="号码" />
                <asp:BoundField DataField="项目名称" HeaderText="项目名称" SortExpression="项目名称" />
                <asp:BoundField DataField="成绩计数" HeaderText="成绩计数" SortExpression="成绩计数" />
                <asp:BoundField DataField="成绩距离" HeaderText="成绩距离" SortExpression="成绩距离" />
                <asp:BoundField DataField="成绩时间" HeaderText="成绩时间" SortExpression="成绩时间" />
                <asp:TemplateField HeaderText="晋级">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="up" CommandArgument=<%#Eval("ID")%>>晋级</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <br />
    
        <asp:Label ID="Info" runat="server"></asp:Label>
        <br />
        <asp:SqlDataSource ID="ItemSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            
            
            SelectCommand="SELECT [项目代码], [项目名称], [参赛年级] FROM [运动会项目] WHERE ([参赛年级] = @参赛年级)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="参赛年级" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SporterSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SportConnectionString %>" 
            
            
            
            
            SelectCommand="SELECT [ID], [年级], [班级], [姓名], [号码], [项目名称], [成绩计数], [成绩距离], [成绩时间] FROM [运动会运动员View] WHERE ([赛程] = @赛程)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="赛程" 
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


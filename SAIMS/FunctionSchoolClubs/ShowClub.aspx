<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowClub.aspx.cs" Inherits="FunctionSchoolClubs_Default" %>

<%@ Register Src="~/viewinfo.ascx" TagName= "viewinfo"  TagPrefix="view"%>
<%@ Register Src="~/JudgeLogin.ascx" TagName= "JudgeLogin"  TagPrefix="Judge"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body {font-family: 微软雅黑,黑体;}
    .style2
        {
            height: 82px;
            font-family: 微软雅黑,黑体;
            font-size: xx-large;
            text-align: center;
            color: #FFFFFF;
        }
        </style>
    </head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <Judge:JudgeLogin ID="JudgeLogin1"  runat="server"/>
        <table width="100%">
            <tr><td style="text-align: center; background-color: #CCCCFF;">

    

     


        <table class="style1" width="100%" align="center" style=" filter: Alpha(Opacity=60)">
            <tr>
                <td class="style2" colspan="4">
                    <table width="100%" height="100%">
<tr style=" font-size: xx-large; font-weight: 700; color: #FFFFFF; font-family: 微软雅黑,黑体; right: 16px; text-align: center; background-color: #6699FF;">
<td>济南外国语学校社团列表
<td>济南外国语学校社团列表</td></tr></table></td>
            </tr>
            <tr>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="100px" Width="100px" 
                        AlternateText=" " onclick="ImageButton1_Click"/>
                    &nbsp;<asp:ImageButton ID="joinBtn1" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn1_Click" />
                    <br />
                <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="100px" Width="100px" 
                        AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn2" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn2_Click" />
                    <br />
                <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton5" runat="server" Height="100px" Width="100px" 
                        AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn3" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn3_Click" />
                    <br />
                <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
                <td class="style14">
                    <asp:ImageButton ID="ImageButton7" runat="server" Height="100px" Width="100px" 
                        AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn4" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn4_Click" />
                    <br />
                <asp:Label ID="Label5" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton9" runat="server" Height="100px" Width="100px" 
                        AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn5" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn5_Click" />
                    <br />
                <asp:Label ID="Label6" runat="server"></asp:Label>
                </td>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton11" runat="server" Height="100px" 
                        Width="100px" AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn6" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn6_Click" />
                    <br />
                <asp:Label ID="Label7" runat="server"></asp:Label>
                </td>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton13" runat="server" Height="100px" 
                        Width="100px" AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn7" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn7_Click" />
                    <br />
                <asp:Label ID="Label8" runat="server"></asp:Label>
                </td>
                <td class="style16">
                    <asp:ImageButton ID="ImageButton15" runat="server" Height="100px" 
                        Width="100px" AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn8" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn8_Click" />
                    <br />
                <asp:Label ID="Label9" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton17" runat="server" Height="100px" 
                        Width="100px" AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn9" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn9_Click" />
                    <br />
                <asp:Label ID="Label10" runat="server"></asp:Label>
                    </td>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton19" runat="server" Height="100px" 
                        Width="100px" AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn10" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn10_Click" />
                    <br />
                <asp:Label ID="Label11" runat="server"></asp:Label>
                    </td>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton21" runat="server" Height="100px" 
                        Width="100px" AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn11" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn11_Click" />
                    <br />
                <asp:Label ID="Label12" runat="server"></asp:Label>
                    </td>
                <td class="style16">
                    <asp:ImageButton ID="ImageButton23" runat="server" Height="100px" 
                        Width="100px" AlternateText=" "/>
                    &nbsp;<asp:ImageButton ID="joinBtn12" runat="server" Height="97px" 
                        Width="30px"  ImageUrl="~/Images/buttons/JoinUs.png" 
                        onclick="joinBtn12_Click" />
                    <br />
                <asp:Label ID="Label13" runat="server"></asp:Label>
                    </td>
            </tr>
        </table>
        <div class="style5">
            <br />
        <asp:button runat="server" id="uppage" Text="[上一页]" BorderColor="#3333FF" 
                BorderStyle="Groove" onclick="uppage_Click" Visible="False"></asp:button>   
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                ID="PageNum" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
        <asp:button runat="server" id="downpage" Text="[下一页]" BorderColor="#3333FF" 
                BorderStyle="Groove" onclick="downpage_Click"></asp:button> 
         </div>
  
                </td></tr>
            <tr><td style="text-align: center">



                <br />
                <asp:Label ID="errorMsgLable" runat="server" style="color: #FF0000; font-weight: 700; font-size: x-large"></asp:Label>



                <br />

  

                </td></tr>
            
             </table>
    </form>
</body>
</html>

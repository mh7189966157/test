                            <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .main {
            background-color:#0ff;
            width:1024px;
            height:768px;
            margin:auto;
            direction:rtl;
            border:3px solid;
        }
        .header {
            background-color:#0ff;
            text-align:center;
            height:150px;
            border:3px solid;
            
        }
        .sidbar {
        background-color:#0ff;
        float:right;
        width:250px;
        height:500px;
        border:3px solid;
        }
        .diactive1{
        background-color:#0ff;
        float:right;
        height:50px;
        width:500px;
        margin-right:150px;
        margin-top:4px;
        border:3px solid;
        
        }
        .diactive2{
        background-color:#0ff;
        float:right;
        height:50px;
        width:500px;
        margin-right:150px;
        margin-top:3px;
        border:3px solid;
       
        }
         .active1{
        background-color:#0ff;
        float:right;
        height:50px;
        width:500px;
        margin-right:150px;
        
        border:3px solid;
        
        }
        .active2{
        background-color:#0ff;
        float:right;
        height:50px;
        width:500px;
        margin-right:150px;
        margin-top:3px;
        border:3px solid;
       
        }
        p {
        background-color:#fff;
        font-size:14px;
        text-align:center;
     
        }
        .name {
        background-color:#000;
        float:right;
        height:50px;
        width:400px;
        margin-right:200px;
        border:3px solid;
        }
        .nn {
        background-color:#0ff;
        float:right;
        height:50px;
        width:200px;
        margin-right:150px;
      
        }
        .headdeactive {
        
        float:right;
        height:30px;
        width:200px;
        margin-right:145px;
        margin-top:40px;
        
        }

    </style>
    <title>به شبکه آموزشي نوانديشان خوش آمديد </title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
    <div class="header">
       
        <h1>شبکه آموزشي نوانديشان </h1>
    </div>
        <div class="sidbar" id="btnprofile">
            <asp:Button ID="Button3" runat="server" Text="پروفايل" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" /><br />
            <asp:Button ID="Button4" runat="server" Text="مقررات" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" />
            <asp:Button ID="Button5" runat="server" Text="صندوق پيغام" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" />
            <asp:Button ID="Button6" runat="server" Text="برنامه کلاسي" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" />
            <asp:Button ID="Button7" runat="server" Text="شارژ حساب" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" />
            <asp:Button ID="Button8" runat="server" Text="دوره هاي آموزشي" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" />
            <asp:Button ID="Button9" runat="server" Text="خروج از سايت " Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" /><br><br />
            <br />
            <asp:Button ID="Button10" runat="server" Text="درخواست تدريس" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" />
            <asp:Button ID="Button11" runat="server" Text="درخواست مشاوره" Height="33px" OnClick="Button3_Click" Width="234px" BackColor="Aqua" /><br />


        </div>
        <div class="contenet">
            <div class="name">
                <p>نويد جليلي خوش آمديد <p>
            </div>
            <div class="headdeactive">
                <p>دوره هاي آموزشي در حال تعليق</p>  
            </div>
            <div class="diactive1">
                <asp:Table ID="Table1" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>دوره آموزشي سي شارپ</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>نام استاد :مهندس موسوي</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
              <div class="diactive2">
                <asp:Table ID="Table2" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>دوره آموزشي جاوا </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                     <asp:TableRow>
                        <asp:TableCell>نام استاد :مهندس زارع</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>

            
                 
            <div class="nn">
                <p>ليست دروس </p>
            </div>
            <div class="active1">
                 
                <asp:Table ID="Table3" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>دوره آموزشي پايگاه داده </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>نام استاد :دکتر فخر احمد </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
              <div class="active2">
                <asp:Table ID="Table4" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>دوره آموزشي مديريت سيستم هاي اطلاعاتي  </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                     <asp:TableRow>
                        <asp:TableCell>نام استاد :دکتر مصلح </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div class="active2">
                <asp:Table ID="Table5" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>دوره آموزشي پايگاه دانش  </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                     <asp:TableRow>
                        <asp:TableCell>نام استاد :دکتر ساکت  </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
        <div class="footer"></div>
    </div>
    </form>
</body>
</html>

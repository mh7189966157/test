<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Virtual.aspx.cs" Inherits="Virtual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .body {
            width: 600px;
            font-size: 14px;
            margin: 0 auto;
            direction: rtl;
        }

        .Address {
            background-color: #0ff;
        }
    </style>
    <script src="js.js"></script>
    <script>
        $(function () {

            $("#recaptcha").click(function () {
                var RANDOM = Math.random();
                $("#captcha").attr("src", "Captcha.ashx?alaki=" + RANDOM);
                return false;
            });
        });
    </script>

</head>


<body>
    <form id="form1" runat="server">
        <div class="body">
            <asp:Label ID="showMessage" Visible="false" runat="server"></asp:Label><br />
            <asp:BulletedList ID="BulletedList1" runat="server"></asp:BulletedList>
            <asp:Label ID="Lname" runat="server" Text="Label">نام </asp:Label><br />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
            <asp:Label ID="Lfamily" runat="server" Text="Label">نام خانوادگی </asp:Label><br />
            <asp:TextBox ID="txtFamily" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Lsex" runat="server" Text="Label">جنسیت  </asp:Label><br />

            <asp:RadioButtonList ID="txtsex" runat="server">
                <asp:ListItem Value="True" Selected="True">مرد </asp:ListItem>
                <asp:ListItem Value="False">زن </asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="LEmail" runat="server" Text="Label"> ایمیل </asp:Label><br />
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
            <asp:Label ID="LtxtNN" runat="server" Text="Label">کدملی  </asp:Label><br />
            <asp:TextBox ID="txtNN" runat="server"></asp:TextBox><br />
            <asp:Label ID="Lpassword" runat="server" Text="Label">پسورد  </asp:Label><br />
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label">تکرار پسورد </asp:Label><br />
            <asp:TextBox ID="txtreturnpass" runat="server"></asp:TextBox><br />
            <asp:Label ID="Lidentificatin" runat="server" Text="Label">شماره شناسنامه </asp:Label><br />
            <asp:TextBox ID="txtidn" runat="server"></asp:TextBox><br />
            <asp:Label ID="Limage" runat="server" Text="Label">آپلود عکس  </asp:Label><br />
            <asp:FileUpload ID="txtImage" runat="server" /><br />
            <asp:Label ID="LNNs" runat="server" Text="Label">آپلود اسکن کدملی </asp:Label><br />
            <asp:FileUpload ID="txtNNS" runat="server" /><br />
            <asp:Label ID="Lcellphonenumber" runat="server" Text="Label">شماره تلفن همراه   </asp:Label><br />
            <asp:TextBox ID="txtCellPhoneNumber" runat="server"></asp:TextBox><br />
            <asp:Label ID="Lpre" runat="server" Text="Label">پیش شماره </asp:Label>
            <asp:DropDownList ID="txtpre" runat="server">
                <asp:ListItem Value="1">0711</asp:ListItem>
                <asp:ListItem Value="2"></asp:ListItem>
                <asp:ListItem Value="3"> </asp:ListItem>
                <asp:ListItem Value="4"></asp:ListItem>
            </asp:DropDownList><br />
            <asp:Label ID="Lphonenumber" runat="server" Text="Label">شماره تلفن  ثابت   </asp:Label><br />
            <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox><br />

            <asp:Label ID="LState" runat="server" Text="Label">استان
            </asp:Label><br />
            <asp:DropDownList ID="txtState" runat="server">
                <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                <asp:ListItem Value="3"> اردبیل</asp:ListItem>
                <asp:ListItem Value="4"> اصفهان</asp:ListItem>
                <asp:ListItem Value="31">البرز </asp:ListItem>
                <asp:ListItem Value="5">ایلام </asp:ListItem>
                <asp:ListItem Value="6">بوشهر </asp:ListItem>
                <asp:ListItem Value="7">تهران </asp:ListItem>
                <asp:ListItem Value="8"> چهارمحال و بختیاری</asp:ListItem>
                <asp:ListItem Value="9">خراسان جنوبی </asp:ListItem>
                <asp:ListItem Value="10"> خراسان رضوی</asp:ListItem>
                <asp:ListItem Value="11"> خراسان شمالی</asp:ListItem>
                <asp:ListItem Value="12"> خوزستان</asp:ListItem>
                <asp:ListItem Value="13">زنجان </asp:ListItem>
                <asp:ListItem Value="14">سمنان </asp:ListItem>
                <asp:ListItem Value="15"> سیستان و بلوچستان</asp:ListItem>
                <asp:ListItem Value="16"> فارس</asp:ListItem>
                <asp:ListItem Value="17"> قزوین</asp:ListItem>
                <asp:ListItem Value="18"> قم</asp:ListItem>
                <asp:ListItem Value="19"> کردستان</asp:ListItem>
                <asp:ListItem Value="20"> کرمان</asp:ListItem>
                <asp:ListItem Value="21">کرمانشاه </asp:ListItem>
                <asp:ListItem Value="22">کهگیلویه و بویراحمد </asp:ListItem>
                <asp:ListItem Value="23"> گلستان</asp:ListItem>
                <asp:ListItem Value="24"> گیلان</asp:ListItem>
                <asp:ListItem Value="25"> لرستان</asp:ListItem>
                <asp:ListItem Value="26"> مازندران</asp:ListItem>
                <asp:ListItem Value="27"> مرکزی</asp:ListItem>
                <asp:ListItem Value="28"> هرمزگان</asp:ListItem>
                <asp:ListItem Value="29"> همدان</asp:ListItem>
                <asp:ListItem Value="30">یزد</asp:ListItem>
                <asp:ListItem Value="32"> غیره</asp:ListItem>


            </asp:DropDownList><br />

            <asp:Label ID="LCity" runat="server" Text="Label">شهر  </asp:Label><br />
            <asp:DropDownList ID="txtCity" runat="server" OnSelectedIndexChanged="txtCity_SelectedIndexChanged">
                <asp:ListItem>شیراز</asp:ListItem>
                <asp:ListItem>اصفهان </asp:ListItem>

            </asp:DropDownList><br />

            <asp:Label ID="LAddress" runat="server" Text="Label">آدرس   </asp:Label><br />
            <asp:TextBox ID="txtAddress" runat="server" Height="16px" Width="455px"></asp:TextBox><br />
            <asp:Label ID="LZipCode" runat="server" Text="Label"> کد پستی </asp:Label><br />
            <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox><br />
                <img id="captcha" src="Captcha.ashx" />
                <br />
                Type letters from the image:<asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
                <br />
                <asp:TextBox ID="txtcaptcha" runat="server"></asp:TextBox>
                <asp:Label ID="errorcaptcha" runat="server" ForeColor="Red" Visible="false"></asp:Label><br />
                <a id="recaptcha" href="#">generate new captcha</a>
                <br />
            <asp:Button ID="btncaptcha" runat="server" Text="Button" OnClick="Button1_Click" />


        </div>
    </form>
</body>
</html>

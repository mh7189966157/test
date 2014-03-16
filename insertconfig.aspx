<%@ Page Language="C#" AutoEventWireup="true" CodeFile="insertconfig.aspx.cs" Inherits="insertconfig" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        key<asp:TextBox ID="txtKey" runat="server"></asp:TextBox>

        value<asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
        
        <asp:Button ID="insert" runat="server" Text="Insert" OnClick="insert_Click" />
    </div>
    </form>
</body>
</html>

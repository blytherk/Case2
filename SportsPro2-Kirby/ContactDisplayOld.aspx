<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactDisplayOld.aspx.cs" Inherits="ContactDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="CRMPic.jpg">
    
    <form id="form1" runat="server">
    <div class="container">
        <div class="jubotron">
    
        <h1>SportsPro</h1>
        <h2>Sports management software for the sports enthusiast</h2>
    </div>
    </div>
        <p>
            <asp:SqlDataSource ID="dsCustomers" runat="server"></asp:SqlDataSource>
        </p>
        <p>
            Contact List:</p>
        <p>
            <asp:ListBox ID="lboxContact" runat="server" DataSourceID="dsCustomers" Height="142px" Width="469px" SelectionMode="Multiple"></asp:ListBox>
            <asp:Button ID="btnRemoveContact" runat="server" OnClick="btnRemoveContact_Click" Text="Remove Contact" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnEmptyList" runat="server" OnClick="btnEmptyList_Click" Text="EmptyList" />
        </p>
        <p>
            <asp:Button ID="btnAddCustomrs" runat="server" PostBackUrl="~/CustomerDisplay.aspx" Text="Select Additional Customers" />
        </p>
    </form>
</body>
</html>

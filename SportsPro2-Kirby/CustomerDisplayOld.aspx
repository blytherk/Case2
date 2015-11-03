<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerDisplayOld.aspx.cs" Inherits="CustomerDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body >
    <form id="form1" runat="server">
        <div class="container">
    <div class="jumbotron">
    
        <h1 >SportsPro</h1>
        <h2>Sports management software for the sports enthusiast</h2>
        
        
     
    
    </div>
            <div class="container-fluid">
            <asp:SqlDataSource ID="dsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                <div class="row">
                    <p>Customer:&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="dsCustomers" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
                    </asp:DropDownList></p>

                </div>
                    </div>
            <p>Address:&nbsp;&nbsp;&nbsp; <asp:Label ID="lStreet" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp; 
        </p>
        <p style="margin-left: 40px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lCityStateZip" runat="server"></asp:Label>
        </p>
        <p>
            Phone:&nbsp;&nbsp;&nbsp; <asp:Label ID="lPhone" runat="server"></asp:Label>
        </p>
        <p>
            Email:&nbsp;&nbsp;&nbsp; <asp:Label ID="lEmail" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnAddCust" runat="server" OnClick="btnAddCust_Click" Text="Add to Customer List" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/ContactDisplay.aspx" Text="Display Contact List" />
        </p>
    </div>

            </div>
    </form>
</body>
</html>

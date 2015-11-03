<%@ Page Title="Display Customers" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">
    <div class="container ">
        <br />
        <div class="row">
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-2">Customer:</div>
                    <div class="col-sm-6">
                        <asp:SqlDataSource ID="dsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="dsCustomers" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
                    </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2">Address:</div>
                    <div class="col-sm-6">
                        <asp:Label ID="lStreet" runat="server"></asp:Label>
                        <br /><asp:Label ID="lCityStateZip" runat="server"></asp:Label>
                    
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2">Phone:</div>
                    <div class="col-sm-6">
                    <asp:Label ID="lPhone" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2">Email:</div>
                    <div class="col-sm-6">
                    <asp:Label ID="lEmail" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2">
                        <asp:Button ID="btnAddCust" runat="server" OnClick="btnAddCust_Click" Text="Add to Customer List" />
                        
                        
                    </div>
                    <div class="col-sm-6">
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/ContactDisplay.aspx" Text="Display Contact List" />
                    
                    </div>
                    <div class="col-xs-8">
                        Contacts in list:
                        <asp:Label ID="lbCustListCount" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" Runat="Server">
</asp:Content>


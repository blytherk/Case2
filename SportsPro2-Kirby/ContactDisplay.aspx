<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactDisplay.aspx.cs" Inherits="ContactDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="container ">
        <div class="row">
            <div class="col-xs-12">
                <h3>Customer List</h3>

                <div class="row">
                    <div class="col-xs-5">
                        <asp:SqlDataSource ID="dsCustomers" runat="server"></asp:SqlDataSource>
                        <asp:ListBox ID="lboxContact" runat="server" DataSourceID="dsCustomers" Height="150px" Width="400" SelectionMode="Multiple"></asp:ListBox>
                    </div>
                    <div class="col-xs-6">
                        <asp:Button ID="btnRemoveContact" runat="server" OnClick="btnRemoveContact_Click" Text="Remove Contact" />
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <br />
                        <br />
                            <asp:Button ID="btnEmptyList" runat="server" OnClick="btnEmptyList_Click" Text="EmptyList" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5">
                <asp:Button ID="btnAddCustomrs" runat="server" PostBackUrl="~/CustomerDisplay.aspx" Text="Select Additional Customers" />
                </div>
                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>


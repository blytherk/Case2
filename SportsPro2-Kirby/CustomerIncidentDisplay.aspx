<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerIncidentDisplay.aspx.cs" Inherits="CustomerIncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="container">
        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="dsCustomers" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="dsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        <br />
        <div class="container col-xs-12">
            <asp:DataList ID="dlIncidents" runat="server" DataSourceID="dsDataList" RepeatLayout="Flow" BorderColor="Blue">
                <HeaderTemplate>
                    <table class="table ">
                        <thead>
                            <tr>
                                <th class="col-xs-1">Product</th>
                                <th class="col-xs-1">Tech name</th>
                                <th class="col-xs-1">Data opened</th>
                                <th class="col-xs-1">Date Closed</th>
                                <tr>
                                    <th colspan="4">Incident</th>
                                </tr>
                            </tr>

                        </thead>
                </HeaderTemplate>

                <FooterTemplate>
                    
                  
                    </table>
                    <asp:Label ID="Label1" runat="server" Text="*No incidents for this customer.*" Visible='<%#bool.Parse((dlIncidents.Items.Count==0).ToString()) %>' ForeColor="Red" Font-Bold="True"></asp:Label>
                </FooterTemplate>

                <ItemTemplate>
                    <tbody class="table table-striped">
                        <tr>
                            <td>
                                <asp:Label ID="ProdNameLabel" runat="server" Text='<%# Eval("ProdName") %>' /></td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></td>
                            <td>
                                <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' /></td>
                            <td>
                                <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' /></td>
                            <tr>
                                <td colspan="4">
                                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' /></td>
                            </tr>
                        </tr>

                    </tbody>
                </ItemTemplate>
                 

            </asp:DataList>
        </div>
        <br />
        <asp:SqlDataSource ID="dsDataList" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Incidents.Description, Technicians.Name, Incidents.DateOpened, Incidents.DateClosed, Products.Name AS ProdName FROM Incidents INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode WHERE (Incidents.CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

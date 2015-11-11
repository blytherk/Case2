<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductMaintenance.aspx.cs" Inherits="ProductMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="container">
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductCode" DataSourceID="dsGridView" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowDeleted="gvProducts_RowDeleted" OnRowUpdated="gvProducts_RowUpdated">

            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" />
                <%--<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />--%>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridName" runat="server" Text='<%#Bind("Name") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator"
                            runat="server"
                            ControlToValidate="txtGridName"
                            ValidationGroup="Edit">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />--%>
                <asp:TemplateField HeaderText="Version">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridVersion" runat="server" Text='<%#Bind("Version") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ErrorMessage="Version field is required"
                            ValidationGroup="Edit"
                            ControlToValidate="txtGridVersion">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator
                            ID="CompareValidator1"
                            runat="server"
                            Type="Double"
                            ControlToValidate="txtGridVersion"
                            ErrorMessage="Version must be a double"
                            Operator="DataTypeCheck">
                        </asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridVersion" runat="server" Text='<%#Bind("Version") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />--%>
                <asp:TemplateField HeaderText="Release Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridReleaseDate" runat="server" Text='<%#Bind("ReleaseDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="txtGridReleaseDate"
                            ErrorMessage="RequiredFieldValidator"
                            ValidationGroup="Edit">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            runat="server"
                            ErrorMessage="Date must be in mm/dd/yyyy format"
                            ControlToValidate="txtGridReleaseDate"
                            Text="*"
                            ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$">
                        </asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridReleaseDate" runat="server" Text='<%#Bind("ReleaseDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField
                    ShowEditButton="True"
                    CancelImageUrl="~/Images/cancel.png"
                    EditImageUrl="~/Images/edit.png"
                    UpdateImageUrl="~/Images/update.png"
                    ButtonType="Image" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="DeleteButton" ImageUrl="~/Images/delete.png" runat="server"
                            CausesValidation="False"
                            CommandName="Delete"
                            OnClientClick='<%# Eval("Name", "return confirm(\"Are you sure you want to delete the following product? {0}\");") %>'
                            Text="delete" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsGridView" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
            <DeleteParameters>
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:"
            ValidationGroup="Edit" CssClass="error" />
        <p>To create a new category, enter the category information and click Add New Category.</p>
        <p>
            <asp:Label ID="lblError" runat="server" EnableViewState="False" CssClass="error"></asp:Label>
        </p>
        <label>ProductCode:</label>
        <asp:TextBox ID="txtProductCode" runat="server" MaxLength="10" CssClass="entry">
        </asp:TextBox>&nbsp; &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                runat="server" ControlToValidate="txtProductCode" CssClass="validator"
                ErrorMessage="Product Code is a required field." ValidationGroup="New">
            </asp:RequiredFieldValidator><br />
        <label>Name:</label>
        <asp:TextBox ID="txtName" runat="server" MaxLength="15" CssClass="entry">
        </asp:TextBox>&nbsp; &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                runat="server" ControlToValidate="txtName" CssClass="validator"
                ErrorMessage="Name is a required field." ValidationGroup="New">
            </asp:RequiredFieldValidator><br />
        <label>Version</label>
        <asp:TextBox ID="txtVersion" runat="server" MaxLength="50" CssClass="entry">
        </asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                runat="server" ControlToValidate="txtVersion" CssClass="validator"
                ErrorMessage="Version is a required field." ValidationGroup="New">
            </asp:RequiredFieldValidator><br />
        <label>Release Date:</label>
        <asp:TextBox ID="txtReleaseDate" runat="server" MaxLength="15" CssClass="entry">
        </asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                runat="server" ControlToValidate="txtReleaseDate" CssClass="validator"
                ErrorMessage="Release Date is a required field." ValidationGroup="New">
            </asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator1"
            runat="server"
            ErrorMessage="Please enter date in mm/dd/yyyy format"
            ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"
            ControlToValidate="txtReleaseDate"></asp:RegularExpressionValidator>
        <asp:Button ID="btnAdd" runat="server" Text="Add New Category"
            OnClick="btnAdd_Click" ValidationGroup="New" />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

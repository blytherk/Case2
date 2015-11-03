<%@ Page Title="File a customer survey" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerSurvey.aspx.cs" Inherits="CustomerSurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="container">
        <div class="row">
            <div class="row">
                <div class="col-xs-12">
                    Enter your customerID: 
                    <asp:TextBox ID="tbEnterCustID" runat="server"></asp:TextBox>
                    
                    <asp:Button ID="btnGetIncidents" runat="server" Text="Get Incidents" OnClick="btnGetIncidents_Click" ValidationGroup="valGroupCustID" />
                    <br />
                    <asp:RequiredFieldValidator ID="ReqFieldCustID" runat="server" ControlToValidate="tbEnterCustID" ErrorMessage="*You must enter your CustomerID to do a survey." ForeColor="Red" ValidationGroup="valGroupCustID"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="cvForInt" runat="server" ErrorMessage="*Please enter an integer" 
                        ControlToValidate="tbEnterCustID" 
                        ForeColor="Red" 
                        ValidationGroup="valGroupCustID" 
                        Operator="DataTypeCheck"
                        Type="Integer">
                    </asp:CompareValidator>
                    <br />
                </div>
                <%--<asp:CompareValidator ID="compareToCustID" runat="server" ControlToValidate="tbEnterCustID" ErrorMessage="Please enter your customer ID"></asp:CompareValidator>--%>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <asp:ListBox ID="lbIncident" runat="server" Width="500px"></asp:ListBox>
                    <asp:SqlDataSource ID="dsCustIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [IncidentID], [Title], [DateClosed], [DateOpened], [TechID], [ProductCode], [CustomerID] FROM [Incidents] WHERE (([CustomerID] = @CustomerID) AND ([DateClosed] IS NOT NULL)) ORDER BY [DateClosed]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="tbEnterCustID" Name="CustomerID" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredValFieldIncidentList" runat="server" ErrorMessage="*Please select an incident" ValidationGroup="valGroupSelectIncident" ControlToValidate="lbIncident" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                   
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-12">
                 Please rate this incident by the following categories:
                    
                    </div>
                <div class="col-xs-2">
                    
                    Response time:
                </div>
                <div class="col-xs-10">
                    <asp:RadioButtonList ID="rbResponse" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Not Satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat Satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely Satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2">
                    Technician efficiency:
                </div>
                <div class="col-xs-10">
                    <asp:RadioButtonList ID="rbTechEfficiency" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Not Satisfied</asp:ListItem>
                        <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                        <asp:ListItem>Satisfied</asp:ListItem>
                        <asp:ListItem>Completely Satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2">
                    Problem resolution:
                </div>
                <div class="col-xs-10">
                    <asp:RadioButtonList ID="rbResolution" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem> Not Satisfied </asp:ListItem>
                        <asp:ListItem> Somewhat Satisfied </asp:ListItem>
                        <asp:ListItem> Satisfied </asp:ListItem>
                        <asp:ListItem> Completely Satisfied </asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2">
                    Additional Comments:
                </div>
                <div class="col-xs-10">
                    <asp:TextBox ID="tbComments" runat="server" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sx-2">
                    <asp:CheckBox ID="cbContact" runat="server" Text="Please contact me to discuss this incident" />
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3">
                    <asp:RadioButton ID="rbEmail" runat="server" Text="Contact by email" />
                    <br />
                    <asp:RadioButton ID="rbPhone" runat="server" Text="Contact by Phone" />
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2">
                    <asp:Button ID="btnSubmitSurvey" runat="server" Text="Submit" OnClick="btnSubmitSurvey_Click" ValidationGroup="valGroupSelectIncident" />
                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SurveyComplete.aspx.cs" Inherits="SurveyComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="container">
        <h3>Thank you for your feed back!</h3>
        <h4>Below is a record of your survey results:</h4>
        <div class="col-xs-12">
            <asp:TextBox ID="tbSurveyResults" runat="server" TextMode="MultiLine" Enabled="False"></asp:TextBox>
        </div>
        <div class="col-xs-12">
            <asp:Button ID="btReturnToSurvey" runat="server" Text="Return to Survey" PostBackUrl="~/CustomerSurvey.aspx" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

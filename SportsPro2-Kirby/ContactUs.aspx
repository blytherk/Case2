<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h2>How to contact us</h2>
                <p>If you have any questions or comments about our products, please be sure to contact us in whatever way is most convenient for you.</p>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Phone:</label>
                        <div class="col-sm-10">
                            1-800-555-0400
                        <br />
                            Weekdays, 8 to 5 Pacific Time
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">E-mail:</label>
                        <div class="col-sm-10">
                            <a href="mailto:sportspro@sportsprosoftware.com">sportspro@sportsprosoftware.com</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Fax:</label>
                        <div class="col-sm-10">
                             1-559-555-2732
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Address:</label>
                        <div class="col-sm-10">
                            SportsProSoftware, Inc.
                            <br />1500 N Main Street
                            <br />Fresno, California 93710
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</asp:Content>



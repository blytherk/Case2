using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    { 
        dsGridView.InsertParameters["ProductCode"].DefaultValue
            = txtProductCode.Text;
        dsGridView.InsertParameters["Name"].DefaultValue
            = txtName.Text;
        dsGridView.InsertParameters["Version"].DefaultValue
            = txtVersion.Text;
        dsGridView.InsertParameters["ReleaseDate"].DefaultValue = txtReleaseDate.Text;

        try
        {
            dsGridView.Insert();
            txtProductCode.Text = "";
            txtName.Text = "";
            txtVersion.Text = "";
            txtReleaseDate.Text = "";
        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + ex.Message;
        }
    }
    protected void gvProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
              e.Exception.ToString();
        }
    }
    protected void gvProducts_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
              e.Exception.ToString();
        }
    }
}
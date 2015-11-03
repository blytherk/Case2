using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CustomerDisplay : System.Web.UI.Page
{
    Customer selectedCust;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)

            ddlCustomers.DataBind();
        selectedCust = this.GetSelectedCustomer();
        lStreet.Text = selectedCust.Address;
        lCityStateZip.Text = selectedCust.City + " " + selectedCust.State + " " + selectedCust.ZipCode;
        lPhone.Text = selectedCust.Phone;
        lEmail.Text = selectedCust.Email;


    }

    public Customer GetSelectedCustomer()
    {
        DataView customersTable = (DataView)dsCustomers.Select(DataSourceSelectArguments.Empty);
        customersTable.RowFilter = string.Format("CustomerID = '{0}'", ddlCustomers.SelectedValue);
        DataRowView row = (DataRowView)customersTable[0];

        Customer c = new Customer();
        c.CustomerID = row["CustomerID"].ToString();
        c.Name = row["Name"].ToString();
        c.Address = row["Address"].ToString();
        c.City = row["City"].ToString();
        c.State = row["State"].ToString();
        c.ZipCode = row["ZipCode"].ToString();
        c.Phone = row["Phone"].ToString();
        c.Email = row["Email"].ToString();
        return c;
    }

    protected void btnAddCust_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            CustomerList custList = CustomerList.GetCustomers();
            custList.AddCust(selectedCust);
        }
    }
}
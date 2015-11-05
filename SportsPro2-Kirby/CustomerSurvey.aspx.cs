using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CustomerSurvey : System.Web.UI.Page
{
    List<Incident> incidentList;

    protected void Page_Load(object sender, EventArgs e)
    {
        SetFocus(tbEnterCustID);
        //if (IsPostBack)
        //{
        //    lbIncident.Items.Clear();
        //}
    }
    public List<Incident> GetCustomerIncidents()
    {
        incidentList = new List<Incident>();
        int custID = Int32.Parse(tbEnterCustID.Text);
        DataView incidentTable = (DataView)dsCustIncidents.Select(DataSourceSelectArguments.Empty);
        incidentTable.RowFilter = string.Format("DateClosed is not NULL and CustomerID = {0}", Int32.Parse(tbEnterCustID.Text));

        //iterate through the rows of the DataView
        foreach (DataRowView row in incidentTable)
        {
            Incident rowIncident = new Incident();
            rowIncident.IncidentID = (int)row["IncidentID"];
            rowIncident.CustomerID = (int)row["CustomerID"];
            rowIncident.ProductCode = row["ProductCode"].ToString();
            rowIncident.TechID = (int)row["TechID"];
            rowIncident.DateOpened = (DateTime)row["DateOpened"];
            rowIncident.DateClosed = (DateTime)row["DateClosed"];
            rowIncident.Title = row["Title"].ToString();

            incidentList.Add(rowIncident);
        }
        return incidentList;
    }
    protected void btnGetIncidents_Click(object sender, EventArgs e)
    {


        if (Page.IsValid)
        {
            incidentList = GetCustomerIncidents();
            if (incidentList.Count > 0)
            {
                lbIncident.Items.Add(new ListItem("--Select an Incident--", "0"));
                foreach (Incident i in incidentList)
                {
                    lbIncident.Items.Add(new ListItem(i.CustomerIncidentDisplay(), i.IncidentID.ToString()));
                }
                lbIncident.Enabled = true;
                rbResponse.Enabled = true;
                rbResolution.Enabled = true;
                rbTechEfficiency.Enabled = true;
                tbComments.Enabled = true;
                cbContact.Enabled = true;
                rbEmail.Enabled = true;
                rbPhone.Enabled = true;
                btnSubmitSurvey.Enabled = true;
            }
            else
            {
                lbIncident.Items.Add(new ListItem("--No Incidents for Customer--", "0"));
            }

            SetFocus(lbIncident);
        }
        


    }
    protected void btnSubmitSurvey_Click(object sender, EventArgs e)
    {
        if (Int32.Parse(lbIncident.SelectedValue) > 0)
        {
            Survey survey = new Survey();

            Label1.Text = lbIncident.SelectedValue;
            survey.IncidentID = Int32.Parse(lbIncident.SelectedValue);
            survey.CustomerID = Int32.Parse(tbEnterCustID.Text);

            Session.Clear();
            Session["Survey"] = survey;
            Response.Redirect("~/SurveyComplete.aspx");
        }
        //else
        //{
        //    RequiredValFieldIncidentList.
        //}

    }

}
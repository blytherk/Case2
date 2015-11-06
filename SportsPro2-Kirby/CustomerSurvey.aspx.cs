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
        //if (!IsPostBack)
        //{
        //    SetFocus(tbEnterCustID);
        //}      
    }
    public List<Incident> GetCustomerIncidents()
    {
        incidentList = new List<Incident>();//should clear the list
        int custID = Int32.Parse(tbEnterCustID.Text);
        //this line keeps throwing an exception due the database???
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
            lbIncident.Items.Clear();
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
                btnSubmitSurvey.Enabled = true;
                SetFocus(lbIncident);
            }
            else
            {
                //Response.Redirect(Request.RawUrl); this just reload the whole page may have to just disable controls individually

                lbIncident.Items.Add(new ListItem("--No Incidents for Customer--", "0"));
                tbEnterCustID.Focus();
                //error can't figure out how to get page to default back to controls 
                
            }
        }
    }
    protected void btnSubmitSurvey_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //if incident selected not "--select incident--"
            if (lbIncident.SelectedIndex > 0)
            {
                Survey survey = new Survey();

                Label1.Text = lbIncident.SelectedValue;
                survey.IncidentID = Int32.Parse(lbIncident.SelectedValue);
                survey.CustomerID = Int32.Parse(tbEnterCustID.Text);
                survey.ResponseTime = Convert.ToInt32(rbResponse.SelectedValue);
           
                survey.Resolution = Convert.ToInt32(rbResolution.SelectedValue);
                survey.TechEfficiency = Convert.ToInt32(rbTechEfficiency.SelectedValue);
                survey.Contact = cbContact.Checked;
                if (cbContact.Checked)
                {
                        survey.ContactBy = rbContactBy.Text; 
                }
                survey.Comments = tbComments.Text;
                
                Session["Survey"] = survey;
                Response.Redirect("~/SurveyComplete.aspx");
            }
            //else
            //{
            //    RequiredValFieldIncidentList.
            //}
            Response.Redirect("~/SurveyComplete.aspx");
        }

    }

    protected void cbContact_CheckedChanged(object sender, EventArgs e)
    {
        if (cbContact.Checked)
        {
            rbContactBy.Enabled = true;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var survey = (Survey)Session["Survey"];
        tbSurveyResults.Text = survey.IncidentID.ToString() + " " + survey.CustomerID.ToString();
        //if (IsPostBack)
        //{
        //    tbSurveyResults.Text = "";
        //}
    }
}
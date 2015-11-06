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
        tbSurveyResults.Text = "CustomerID: " + survey.CustomerID + "\r\n" +
            "IncidentID: " + survey.IncidentID + "\r\n" +
            "Response Time: " + survey.ResponseTime + "\r\n" +
            "Technician Efficiency: " + survey.TechEfficiency + "\r\n" +
            "Problem Resolution: " + survey.Resolution + "\r\n" +
            "Comments: " + survey.Comments;
        
    }
}
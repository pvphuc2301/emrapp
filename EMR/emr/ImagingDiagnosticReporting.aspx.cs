using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Report
{
    public partial class ImagingDiagnosticReporting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string jsonStr = WebHelpers.GetAPI("api/patient/menu-rad-report/264DA951-33C8-4230-5DE0-0000040FD063");//f076907a-ecf6-475a-4315-0000219f339b
            dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonStr);

            lbl_findings.InnerHtml = jsonObject.region_3;
            lbl_addendum.InnerHtml = jsonObject.addendum;
        }

    }
}
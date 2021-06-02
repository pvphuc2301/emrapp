using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class ImagingReport : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string varReportID = (string)Session["radid"]; //Request.QueryString["radid"];
            //   varReportID = "f076907a-ecf6-475a-4315-0000219f339b";
            if (!string.IsNullOrEmpty(varReportID))
            {
                dynamic response = WebHelpers.GetAPI("api/patient/menu-rad-report/" + varReportID);//f076907a-ecf6-475a-4315-0000219f339b
                dynamic jsonObject;
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(response.Data);
                    lbl_findings.InnerHtml = jsonObject.region_1;
                    lbl_addendum.InnerHtml = jsonObject.addendum;
                }
                Session["radid"] = "";
            }
        }
    }
}
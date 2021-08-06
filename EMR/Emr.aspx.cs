using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class Emr : System.Web.UI.Page
    {
        public string loc; string UserID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            loc = (string)Session["company_code"];

            if (!WebHelpers.CheckSession(this, $"./login.aspx?loc={loc}&ReturnUrl=", false)) return;
            
            if (!IsPostBack)
            {
                DemographicSearch.ContentUrl = $"~/Other/DemographicSearch.aspx?loc={loc}";
                BindLocation();

                if ((string)Session["group_access"] == "ADM")
                {
                    WebHelpers.VisibleControl(true, RadTabStrip2.Tabs[1], RadTabStrip2.Tabs[2]);
                }
                else
                {
                    WebHelpers.VisibleControl(false, RadTabStrip2.Tabs[1], RadTabStrip2.Tabs[2]);
                }
            }
            lblUserName.Text = (string)Session["UserName"];
            PostBackEvent(sender, e);

        }

        private void PostBackEvent(object sender, EventArgs e)
        {

            switch (Request["__EVENTTARGET"])
            {
                case "location_Change":
                    //DataHelpers._LOCATION = Request["__EVENTARGUMENT"];
                    Response.Redirect(Request.RawUrl);
                    break;
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();// Session["UserID"] = "";
            Response.Redirect("./login.aspx");
        }

        private void BindLocation()
        {
            lbl_location.Text = Request.QueryString["loc"];
            //switch (DataHelpers._LOCATION)
            //{
            //    case "AIH":
            //        location_cli.Visible = true;
            //        location_aih.Visible = false;
            //        break;
            //    case "CLI":
            //        location_cli.Visible = false;
            //        location_aih.Visible = true;
            //        break;
            //}
        }
    }
}
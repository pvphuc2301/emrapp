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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this, "./login.aspx?ReturnUrl=", false)) return;
            if (!IsPostBack)
            {
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
                    DataHelpers._LOCATION = Request["__EVENTARGUMENT"];
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
            lbl_location.Text = DataHelpers._LOCATION;
            switch (DataHelpers._LOCATION)
            {
                case "AIH":
                    location_cli.Visible = true;
                    location_aih.Visible = false;
                    break;
                case "CLI":
                    location_cli.Visible = false;
                    location_aih.Visible = true;
                    break;
            }
        }
    }
}
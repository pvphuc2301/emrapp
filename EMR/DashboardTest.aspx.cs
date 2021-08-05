using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class DashboardTest : System.Web.UI.Page
    {
        public string loc { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLocation();
            }
            lblUserName.Text = (string)Session["UserName"];
            PostBackEvent(sender, e);
        }

        private void PostBackEvent(object sender, EventArgs e)
        {

            switch (Request["__EVENTTARGET"])
            {
                case "location_Change":
                    loc = Request["__EVENTARGUMENT"];
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
            lbl_location.Text = loc;
            switch (loc)
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
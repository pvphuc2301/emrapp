using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Other
{
    public partial class PageNotFound : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dynamic response = (dynamic)Session["PageNotFound"];
            lbl_Status.Text = Convert.ToString(response.Status);
            lbl_Data.Text = Convert.ToString(response.Data);

            //gridView1.DataSource = response.Details;
        }
    }
}
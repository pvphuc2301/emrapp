using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Phar
{
    public partial class ordertab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadPageView3.ContentUrl = "opdpreslist.aspx?vbid=" + Request.QueryString["vbid"];
        }
    }
}
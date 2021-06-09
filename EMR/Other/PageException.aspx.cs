using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Other
{
    public partial class PageException : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dynamic response = (dynamic)Session["ExceptionDetails"];
            

            if (WebHelpers.IsPropertyExist(response, "Details"))
            {
                
            }
        }
    }
}
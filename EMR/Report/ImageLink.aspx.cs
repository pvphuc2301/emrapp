using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Newtonsoft.Json.Linq;
using System.Data;
using System.Data.SqlClient;

namespace EMR.Report
{
    public partial class ImageLink : System.Web.UI.Page
    {
        protected void Page_Init(object sender, System.EventArgs e)
        {
            string pe = Request.QueryString["pe"];
            string script = string.Format("function f(){{ rwndviewimage(\"" + pe + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "rwndviewimage", script, true);
        }
    }
}
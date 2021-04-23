using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class AmendReasonBox : System.Web.UI.UserControl
    {
        public string temp;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblAmendReasonError.InnerText = temp;
            }
            
        }

        protected void close_ServerClick(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>this.window.opener = null;window.open('','_self'); window.close();   </script>");
        }
    }
}
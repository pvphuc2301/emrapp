using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls
{
    public partial class Spinner1 : System.Web.UI.UserControl
    {
        public string AssociatedUpdatePanelID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateProgress1.AssociatedUpdatePanelID = AssociatedUpdatePanelID;
        }
    }
}
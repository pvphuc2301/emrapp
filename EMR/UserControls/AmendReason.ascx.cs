using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class AmendReason : System.Web.UI.UserControl
    {
        #region Properties
        public string value { get; set; }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtAmendReason.Value = value;
            }
        }

        public void Load(ControlCollection controls)
        {
            controls.Add(this);
        }

        public void Load(Control control)
        {
            control.Controls.Add(this);
        }
    }
}
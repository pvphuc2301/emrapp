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
        public string Value {
            get
            {
                return txtAmendReason.Value;
            }
            set
            {
                txtAmendReason.Value = value;
            }
        }

        #endregion
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
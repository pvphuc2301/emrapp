using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EMR
{
    public partial class TextField : System.Web.UI.UserControl
    {
        public string Value
        {
            get
            {
                return InputControl.Value;
            }
            set
            {
                InputControl.Value = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
    }
}
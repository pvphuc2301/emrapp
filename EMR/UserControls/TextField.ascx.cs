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
                DisplayControl.InnerHtml = value;
            }
        }
        /// <summary>
        /// false -> edit
        /// true -> not edit
        /// </summary>
        public bool Disabled {
            get
            {
                return DisplayControl.Disabled;
            }
            set
            {
                DisplayControl.Disabled = value;
                DisplayControl.Attributes["contenteditable"] = (!value).ToString().ToLower();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}
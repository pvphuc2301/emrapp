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
        public string Width
        {
            get { return Width; }
            set
            {
                DisplayControl.Style.Add("width", value);
            }
        }
        public string Title
        {
            get
            {
                return DisplayControl.Attributes["title"];
            }
            set
            {
                DisplayControl.Attributes["title"] = value;
            }
        }
        public override string ID
        {
            get
            {
                return InputControl.ID;
            }
        }

        public string Type { 
            get { 
                return DisplayControl.Attributes["type"]; 
            } set {
                DisplayControl.Attributes["type"] = value;
            } 
        }

        public string DataKey
        {
            get
            {
                return DisplayControl.Attributes["data-key"];
            }
            set
            {
                DisplayControl.Attributes["data-key"] = value;
            }
        }

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

        public string Tooltip {
            get
            {
                return DisplayControl.Attributes["type"];
            }
            set
            {
                DisplayControl.Attributes["rel"] = "tooltip";
                DisplayControl.Attributes["data-original-title"] = value;

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayControl.InnerHtml = InputControl.Value;
            DisplayControl.Attributes.Add("onblur", string.Format("changeValue('{0}', '{1}')", DisplayControl.ClientID, InputControl.ClientID));

            
        }
    }
}
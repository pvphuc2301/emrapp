using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class Message : System.Web.UI.UserControl
    {
        #region Properties
        public string text { get; set; }
        public int timeout { get; set; }
        public string type { get; set; }

        public static class TYPE {
            public static string PRIMARY = "alert-primary";
            public static string SECONDARY = "alert-success";
            public static string SUCCESS = "alert-success";
            public static string DANGER = "alert-danger";
            public static string WARNING = "alert-warning";
            public static string INFO = "alert-info";
            public static string LIGHT = "alert-light";
            public static string DARK = "alert-dark";
        }
        #endregion

        public void Load(Page page, string text = "", int timeout = 1000, string type = "alert-primary")
        {
            this.text = text;
            this.timeout = timeout;
            this.type = type;
            page.Controls.Add(this);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            messageContent.InnerText = text;
            
            alertType.Attributes["class"] = "alert alert-success mb-0 " + type;
        }
    }
}
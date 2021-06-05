using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.icons
{
    public partial class ExclamationTriangle : System.Web.UI.UserControl
    {
        public int Size { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ExclamationTriangleIcon.Attributes["style"] = "width: " + Size + "px; height: " + Size + "px";
        }
    }
}
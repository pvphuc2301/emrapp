using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls
{
    public partial class PopupException : System.Web.UI.UserControl
    {
        public string Text { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_msg.Text = Text;
        }
    }
}
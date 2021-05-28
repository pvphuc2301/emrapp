using System;
using System.Collections.Generic;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class PromptButton : System.Web.UI.UserControl
    {
        public delegate void OnClickHandler(object sender, EventArgs data);
        public event OnClickHandler onClicked;
        protected void onClick(object sender, EventArgs data)
        {
            if(onClicked != null)
            {
                onClick(this, data);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
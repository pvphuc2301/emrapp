using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class Signature1 : System.Web.UI.UserControl
    {
        public string CssClass { get; set; }

        public string Title { get; set; }
        public string  SubTitle { get; set; }
        public string FullName { get; set; }
        public string DateTime { get; set; }
        public string Content { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            prt_fullname.InnerHtml = FullName;
            prt_content.InnerHtml = Content;
            prt_supTitle.InnerHtml = SubTitle;
        }
    }
}
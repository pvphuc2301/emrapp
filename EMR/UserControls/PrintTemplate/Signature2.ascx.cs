using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class Signature2 : System.Web.UI.UserControl
    {
        public string CssClass { get; set; }

        public string Title { get; set; }
        public string SubTitle { get; set; }
        public string FullName { get; set; }
        public string dateTime { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            prt_date.dateTime = dateTime;
            signature.CssClass = CssClass + " text-center";
            prt_title.InnerHtml = Title;
            prt_supTitle.InnerHtml = SubTitle;
            prt_fullname.Text = FullName;
        }
    }
}
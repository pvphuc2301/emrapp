using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class PrtRowS3 : System.Web.UI.UserControl
    {
        public string Order { get; set; }
        public string Title { get; set; }
        public string SubTitle { get; set; }
        public string Value { get; set; }
        public int FixedLeft { get; set; }
        public int FixedWidth { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Order)) { prt_order.Text = Order; prt_order.Width = 30; }

            prt_title.Text = Title;
            prt_subtitle.Text = SubTitle;
            prt_value.Text = Value;
            prtRowS3Wraper.Attributes["style"] = string.Format("margin-left: {0}px", FixedLeft);
            if (FixedWidth > 0) { prt_content.Width = FixedWidth; }
        }
    }
}
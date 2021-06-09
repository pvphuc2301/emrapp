using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class PrtGender : System.Web.UI.UserControl
    {
        public string Title { get; set; }
        public string SubTitle { get; set; }
        public bool Gender { get; set; }
        public int FixedLeft { get; set; }
        public int FixedWidth { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            prt_title.Text = Title;
            prt_subtitle.Text = SubTitle;
            prtGenderWraper.Attributes["style"] = string.Format("margin-left: {0}px", FixedLeft);
            prt_title.Width = FixedWidth;
            if (Gender != null)
            {
                if (Gender)
                {
                    prt_male.Text = "☒";
                }
                else
                {
                    prt_female.Text = "☒";
                }
            }
        }
    }
}
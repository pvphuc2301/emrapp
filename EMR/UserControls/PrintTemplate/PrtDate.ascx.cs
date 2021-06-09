using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class PrtDate : System.Web.UI.UserControl
    {
        public string Date { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            System.DateTime dateTime;
            if(Date != null)
            {
                dateTime = System.DateTime.Parse(Date);
                prt_date.Text = string.Format("{0}/{1}/{2}", dateTime.Day, dateTime.Month, dateTime.Year);
            }
        }
    }
}
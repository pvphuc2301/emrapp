using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class DateTime : System.Web.UI.UserControl
    {
        public string CssClass { get; set; }
        public string dateTime { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(dateTime))
            {
                //prt_hour.Text = System.DateTime.Parse(dateTime.ToString()).Hour.ToString();
                //prt_minute.Text = System.DateTime.Parse(dateTime.ToString()).Minute.ToString();
                //prt_day.Text = System.DateTime.Parse(dateTime.ToString()).Day.ToString();
                //prt_month.Text = System.DateTime.Parse(dateTime.ToString()).Month.ToString();
                //prt_year.Text = System.DateTime.Parse(dateTime.ToString()).Year.ToString();
            }

        }
    }
}
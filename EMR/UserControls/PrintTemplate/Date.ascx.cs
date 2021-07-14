using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class Date : System.Web.UI.UserControl
    {
        public string dateTime { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(dateTime))
            {
                string day = System.DateTime.Parse(dateTime.ToString()).Day.ToString();
                string month = System.DateTime.Parse(dateTime.ToString()).Month.ToString();
                string year = System.DateTime.Parse(dateTime.ToString()).Year.ToString();
                
                prt_day.Text = (day.Length <= 1 ? "0" : "") + day;
                prt_month.Text = (month.Length <= 1 ? "0" : "") + month;
                prt_year.Text = year;
            }
        }
    }
}
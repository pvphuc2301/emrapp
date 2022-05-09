using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Test
{
    public partial class CalculateAge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            DateTime dob = new DateTime(2020, 10, 29);

            string AgeStr = string.Empty;
            int age = DataHelpers.CalculateAge(dob);

            int days = (now.Date - dob.Date).Days;
            int month = ((now.Year - dob.Year) * 12) + now.Month - dob.Month;
            int year = now.Year - dob.Year;

            lblRawAge.Text = age.ToString();
            lblDay.Text = days.ToString();
            lblMonth.Text = month.ToString();
            lblYear.Text = year.ToString();
            
            if(age <= 5)
            {
                if(days <= 30)
                {
                    AgeStr = days.ToString() + " Ngày/Days";
                }
                else
                {
                    AgeStr = month.ToString() + " Tháng/Months";
                }
            }
            else
            {
                AgeStr = age.ToString();
            }

            lblAge.Text = AgeStr;
        }
    }
}
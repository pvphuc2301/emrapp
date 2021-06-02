using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class PatientLabel1 : System.Web.UI.UserControl
    {
        public string PID { get; set; }
        public string FullName { get; set; }
        public string DOB { get; set; }
        public string Gender { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_vpid.Text = PID;
            lbl_fullname.Text = FullName;
            Barcode.Text = PID;
            lbl_gender.Text = Gender;
            lbl_DOB.Text = DOB;
        }
    }
}
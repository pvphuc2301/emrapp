using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls
{
    public partial class UserControlPatientInfo : System.Web.UI.UserControl
    {
        public PatientInfo Patient { get; set; }
        public PatientVisitInfo PatientVisit { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Patient != null)
                {
                    lblFirstName.Text = Patient.first_name_l;
                    lblLastName.Text = Patient.last_name_l;
                    lblGender.Text = Patient.gender_l;

                    WebHelpers.ConvertDateTime(Patient.DOB, out bool isValid, out string DOB, "dd-MM-yyyy");
                    lblDoB.Text = DOB + " (" + Patient.Age + "t)";

                    lblPatientAddress.Text = Patient.Address;
                    lblContactPerson.Text = Patient.Contact;
                    lblRelationship.Text = Patient.Relationship;
                }
                if(PatientVisit != null)
                {
                    lblVisitCode.Text = PatientVisit.VisitCode;

                    WebHelpers.ConvertDateTime(PatientVisit.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
                    lblVisitDate.Text = ActualVisitDateTime;
                }
            }
        }
    }
}
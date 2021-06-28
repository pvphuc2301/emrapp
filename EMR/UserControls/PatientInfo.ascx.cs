using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls
{
    public partial class PatientInfo : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadPatientInfo(true); // Patient Info Vietnamese
            LoadPatientVisitInfo(true); // Patient Visit Info
        }

        public void LoadPatientInfo(bool vi_laganue)
        {
            Patient patient = Patient.Instance();
            try
            {
                if (vi_laganue) //Language = Vietnamese ( Default)
                {
                    lblFirstName.InnerText = patient.first_name_l;
                    lblLastName.InnerText = patient.last_name_l;
                    lblGender.InnerText = patient.gender_l;
                    lblDoB.InnerText = WebHelpers.FormatDateTime(patient.date_of_birth) + " (" + DataHelpers.CalculateAge(patient.date_of_birth) + "t)";
                    lblPatientAddress.InnerText = patient.address_line_l;
                    lblContactPerson.InnerText = patient.contact_name_l;
                }
                else
                {
                    lblFirstName.InnerText = patient.first_name_e;
                    lblLastName.InnerText = patient.last_name_e;
                    lblGender.InnerText = patient.gender_e;
                    lblDoB.InnerText = WebHelpers.FormatDateTime(patient.date_of_birth) + " (" + DataHelpers.CalculateAge(patient.date_of_birth) + "y)";
                    lblPatientAddress.InnerText = patient.address_line_e;
                    lblContactPerson.InnerText = patient.contact_name_e;
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        public void LoadPatientVisitInfo(bool vi_laganue)
        {
            try {
                lblVisitCode.InnerText = PatientVisit.Instance().visit_code;
                lblVisitDate.InnerText = WebHelpers.FormatDateTime(PatientVisit.Instance().actual_visit_date_time, "dd/MM/yyyy HH:mm:ss");
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
    }
}
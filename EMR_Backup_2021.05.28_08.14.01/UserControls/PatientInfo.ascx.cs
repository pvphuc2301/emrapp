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
            try
            {
                if (vi_laganue) //Language = Vietnamese ( Default)
                {
                    lblFirstName.InnerText = DataHelpers.patient.first_name_l;
                    lblLastName.InnerText = DataHelpers.patient.last_name_l;
                    lblGender.InnerText = DataHelpers.patient.gender_l;
                    lblDoB.InnerText = DateTime.Parse(DataHelpers.patient.date_of_birth).ToString("dd/MM/yyyy") + " (" + DataHelpers.CalculateAge(DateTime.Parse(DataHelpers.patient.date_of_birth)) + "t)";
                    lblPatientAddress.InnerText = DataHelpers.patient.address_line_l;
                    lblContactPerson.InnerText = DataHelpers.patient.contact_name_l;
                }
                else
                {
                    lblFirstName.InnerText = DataHelpers.patient.first_name_e;
                    lblLastName.InnerText = DataHelpers.patient.last_name_e;
                    lblGender.InnerText = DataHelpers.patient.gender_l;
                    lblDoB.InnerText = DateTime.Parse(DataHelpers.patient.date_of_birth).ToString("dd/MM/yyyy") + " (" + DataHelpers.CalculateAge(DateTime.Parse(DataHelpers.patient.date_of_birth)) + "y)";
                    lblPatientAddress.InnerText = DataHelpers.patient.address_line_e;
                    lblContactPerson.InnerText = DataHelpers.patient.contact_name_e;
                }
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }

        public void LoadPatientVisitInfo(bool vi_laganue)
        {
            try { 
                lblVisitCode.InnerText = DataHelpers.patientVisit.visit_code;
                lblVisitDate.InnerText = DateTime.Parse(DataHelpers.patientVisit.actual_visit_date_time).ToString("dd/MM/yyyy HH:mm:ss");

                //if (vi_laganue) //Language = Vietnamese ( Default)
                //{
                //    lblVisitCode.InnerText = DataHelpers.patientVisit.visit_code;
                //    lblVisitDate.InnerText = DataHelpers.patientVisit.actual_visit_date_time;
                //}
                //else
                //{
                //    lblVisitCode.InnerText = DataHelpers.patientVisit.visit_code;
                //    lblVisitDate.InnerText = DataHelpers.patientVisit.actual_visit_date_time;
                //}
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
    }
}
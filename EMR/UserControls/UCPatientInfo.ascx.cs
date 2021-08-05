using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls
{
    public partial class UCPatientInfo : System.Web.UI.UserControl
    {
        public PatientInfo patientInfo { get; set; }
        public PatientVisitInfo patientVisitInfo { get; set; }
        public void LoadData(PlaceHolder container, PatientInfo patientInfo, PatientVisitInfo patientVisitInfo)
        {
            container.Controls.Add(this);
            patientInfo = patientInfo;
            patientVisitInfo = patientVisitInfo;
            LoadPatientInfo(true); // Patient Info Vietnamese
            LoadPatientVisitInfo(true); // Patient Visit Info
        }
        /// <summary>
        /// 0: PatientInfo
        /// 1: PatientVisitInfo
        /// </summary>
        public void Initial(PlaceHolder container, params object[] args)
        {
            patientInfo = (PatientInfo)args[0];
            patientVisitInfo = (PatientVisitInfo)args[1];
            container.Controls.Add(this);
            
            BindingData();
        }

        protected void BindingData()
        {
            lblFirstName.Text = patientInfo.first_name_l;
            lblLastName.Text = patientInfo.last_name_l;
            lblGender.Text = patientInfo.gender_l;
            lblDoB.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth) + " (" + patientInfo.GetAge() + "t)";
            lblPatientAddress.Text = patientInfo.Address;
            lblContactPerson.Text = patientInfo.contact_name_l;

            lblVisitCode.Text = patientVisitInfo.visit_code;
            lblVisitDate.Text = WebHelpers.FormatDateTime(patientVisitInfo.actual_visit_date_time);
        }

        protected void LoadPatientInfo(bool vi_laganue)
        {
            try
            {
                if (vi_laganue) //Language = Vietnamese ( Default)
                {
                    lblFirstName.Text = patientInfo.first_name_l;
                    lblLastName.Text = patientInfo.last_name_l;
                    lblGender.Text = patientInfo.gender_l;
                    lblDoB.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth) + " (" + patientInfo.GetAge() + "t)";
                    lblPatientAddress.Text = patientInfo.Address;
                    lblContactPerson.Text = patientInfo.contact_name_l;
                }
                else
                {
                    lblFirstName.Text = patientInfo.first_name_e;
                    lblLastName.Text = patientInfo.last_name_e;
                    lblGender.Text = patientInfo.gender_e;
                    lblDoB.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth) + " (" + patientInfo.GetAge() + "y)";
                    lblPatientAddress.Text = patientInfo.Address;
                    lblContactPerson.Text = patientInfo.contact_name_e;
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        public void LoadPatientVisitInfo(bool vi_laganue)
        {
            try
            {
                lblVisitCode.Text = patientVisitInfo.visit_code;
                lblVisitDate.Text = WebHelpers.FormatDateTime(patientVisitInfo.actual_visit_date_time);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
    }
}
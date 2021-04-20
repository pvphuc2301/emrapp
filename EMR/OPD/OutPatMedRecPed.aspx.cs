using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class PediatricOutpatientMedicalRecord : System.Web.UI.Page
    {
        public POMR pomr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initial();
            }
        }

        public void Initial()
        {
            if(Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            pomr = new POMR(DataHelpers.varDocId);

            loadDataToOMRControls(pomr);
        }

        public void loadDataToOMRControls(POMR pomr)
        {
            //I.
            txtChiefComplaint.Value = pomr.chief_complaint;
            //II.
            //1.
            txtMedicalHistory.Value = pomr.medical_history;
            txtCurrentMedication.Value = pomr.current_medication;
            //2.
            txtPersonal.Value = pomr.personal;
            txtFamily.Value = pomr.family;
            //
            txtTemperature.Value = pomr.vs_temperature;
            txtHeartRate.Value = pomr.vs_heart_rate;
            txtWeight.Value = pomr.vs_weight;
            txtRespiratoryRate.Value = pomr.vs_respiratory_rate;
            txtHeight.Value = pomr.vs_height;
            txtBloodPressure.Value = pomr.vs_blood_pressure;
            txtBmi.Value = pomr.vs_BMI;
            txtSpo2.Value = pomr.vs_spO2;
            txtPulse.Value = pomr.vs_pulse;

            //allergy
            if (bool.Parse(pomr.allergy))
            {
                radAllergy2.Checked = true;
                txtAllergy.Value = pomr.allergy_note;
            }
            else
            {
                radAllergy1.Checked = true;
                txtAllergy.Attributes["data-status"] = ControlStatus.Hidden;
            }
            
            txtPhysicalExamination.Value = DataHelpers.FormatPhysicalExamination(pomr.physical_examination);

            txtLIAR.Value = pomr.laboratory_indications_results;
            txtInitDiagnosis.Value = pomr.initial_diagnosis;
            txtDiffDiagnosis.Value = pomr.differential_diagnosis;
            txtAssociatedCon.Value = pomr.associated_conditions;

            if(pomr.treatment_code == "OPD")
            {
                radTreatment1.Checked = true;
            } else if(pomr.treatment_code == "IPD")
            {
                radTreatment2.Checked = true;
            }
            else if(pomr.treatment_code == "TRF")
            {
                radTreatment3.Checked = true;
            }

            txtTemperature.Value = pomr.vs_temperature;
            
            txtHeartRate.Value = pomr.vs_heart_rate;
            txtWeight.Value = pomr.vs_weight;
            txtRespiratoryRate.Value = pomr.vs_respiratory_rate;
            txtHeight.Value = pomr.vs_height;
            txtBloodPressure.Value = pomr.vs_blood_pressure;
            txtBmi.Value = pomr.vs_BMI;
            txtSpo2.Value = pomr.vs_spO2;

            txtPulse.Value = pomr.vs_pulse;

            if (bool.Parse(pomr.spec_opinion_requested))
            {
                rad_spec_opinion_requested2.Checked = true;
                txt_spec_opinion_requested_note.Value = pomr.spec_opinion_requested_note;
            }
            else
            {
                rad_spec_opinion_requested2.Checked = true;
            }

            if (bool.Parse(pomr.bool_next_appointment))
            {
                try
                {
                    rad_next_appointment1.Checked = true;
                    txt_date_next_appointment.SelectedDate = DateTime.Parse(pomr.date_next_appointment);
                    txt_time_next_appointment.SelectedTime = TimeSpan.Parse(DateTime.Parse(pomr.date_next_appointment).ToString("HH:mm:ss"));
                }catch(Exception ex) { }
            }
            else
            {
                rad_next_appointment2.Checked = true;
                txt_next_appointment.Value = pomr.txt_next_appointment;
            }

            btnCancel.Visible = false;
            amendReasonBox.Visible = false;

            if (pomr.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;

                WebHelpers.DisabledControl(this.form1, true);
                
            }

            else if (pomr.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            pomr = new POMR(DataHelpers.varDocId);
            pomr.status = DocumentStatus.DRAFT;
            pomr.user_name = "phut.phan";
            
            pomr.chief_complaint = txtChiefComplaint.Value;
            pomr.medical_history = txtMedicalHistory.Value;
            pomr.current_medication = txtCurrentMedication.Value;
            pomr.personal = txtPersonal.Value;
            pomr.family = txtFamily.Value;
            pomr.allergy = radAllergy2.Checked;
            if(radAllergy2.Checked) { pomr.allergy_note = txtAllergy.Value; }
            pomr.physical_examination = txtPhysicalExamination.Value;
            pomr.laboratory_indications_results = txtLIAR.Value;
            pomr.initial_diagnosis = txtInitDiagnosis.Value;
            pomr.differential_diagnosis = txtDiffDiagnosis.Value;
            pomr.associated_conditions = txtAssociatedCon.Value;
            if (radTreatment1.Checked) { pomr.treatment_code = "OPD"; }
            else if (radTreatment2.Checked) { pomr.treatment_code = "IPD"; }
            else if (radTreatment3.Checked) { pomr.treatment_code = "TRF"; }
            pomr.spec_opinion_requested = rad_spec_opinion_requested2.Checked;
            if(rad_spec_opinion_requested2.Checked) { pomr.spec_opinion_requested_note = txt_spec_opinion_requested_note.Value; }

            if (rad_next_appointment1.Checked)
            {
                pomr.bool_next_appointment = true;
                if(txt_date_next_appointment.SelectedDate != null && txt_time_next_appointment.SelectedTime != null)
                {
                    string date = DateTime.Parse(txt_date_next_appointment.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(txt_time_next_appointment.SelectedTime.ToString()).ToString("HH:mm:ss");
                    pomr.txt_next_appointment = null;
                    pomr.date_next_appointment = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }

            }
            else
            {
                pomr.bool_next_appointment = false;
                pomr.txt_next_appointment = txt_next_appointment.Value;
            }

            if (pomr.Update()[0] == "OK")
            {
                Console.WriteLine("Save successful!");

                Initial();
            }
        }

        protected void btnComplete_ServerClick(object sender, EventArgs e)
        {
            pomr = new POMR(DataHelpers.varDocId);
            pomr.status = DocumentStatus.FINAL;
            pomr.user_name = "phut.phan";

            pomr.amend_reason = txtAmendReason.Value;
            pomr.chief_complaint = txtChiefComplaint.Value;
            pomr.medical_history = txtMedicalHistory.Value;
            pomr.current_medication = txtCurrentMedication.Value;
            pomr.personal = txtPersonal.Value;
            pomr.family = txtFamily.Value;
            pomr.allergy = radAllergy2.Checked;
            if (radAllergy2.Checked) { pomr.allergy_note = txtAllergy.Value; }
            pomr.physical_examination = txtPhysicalExamination.Value;
            pomr.laboratory_indications_results = txtLIAR.Value;
            pomr.initial_diagnosis = txtInitDiagnosis.Value;
            pomr.differential_diagnosis = txtDiffDiagnosis.Value;
            pomr.associated_conditions = txtAssociatedCon.Value;
            if (radTreatment1.Checked) { pomr.treatment_code = "OPD"; }
            else if (radTreatment2.Checked) { pomr.treatment_code = "IPD"; }
            else if (radTreatment3.Checked) { pomr.treatment_code = "TRF"; }
            pomr.spec_opinion_requested = rad_spec_opinion_requested2.Checked;
            if (rad_spec_opinion_requested2.Checked) { pomr.spec_opinion_requested_note = txt_spec_opinion_requested_note.Value; }

            if (rad_next_appointment1.Checked) { 
                pomr.bool_next_appointment = true;

                if (txt_date_next_appointment.SelectedDate != null && txt_time_next_appointment.SelectedTime != null)
                {
                    string date = DateTime.Parse(txt_date_next_appointment.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(txt_time_next_appointment.SelectedTime.ToString()).ToString("HH:mm:ss");
                    pomr.txt_next_appointment = null;
                    pomr.date_next_appointment = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }

            }
            else {
                pomr.bool_next_appointment = false;
                pomr.txt_next_appointment = txt_next_appointment.Value;
            }

            if (pomr.Update()[0] == "OK")
            {
                Console.WriteLine("Save successful!");

                Initial();
            }
        }

        protected void btnAmend_ServerClick(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnComplete.Disabled = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            amendReasonBox.Visible = true;

            WebHelpers.DisabledControl(form1, false);

            txtTemperature.Disabled = true;
            txtHeartRate.Disabled = true;
            txtWeight.Disabled = true;
            txtRespiratoryRate.Disabled = true;
            txtHeight.Disabled = true;
            txtBloodPressure.Disabled = true;
            txtBmi.Disabled = true;
            txtSpo2.Disabled = true;
            txtPulse.Disabled = true;

        }

        protected void btnCancel_ServerClick(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            amendReasonBox.Visible = false;

            WebHelpers.DisabledControl(form1, true);
        }
    }
}
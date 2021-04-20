using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class OutPathIniNurAss : System.Web.UI.Page
    {
        public OutPatientInitialNursingAssement oina;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
                if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
                if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

                Initial();
            }
        }

        public void Initial()
        {
            oina = new OutPatientInitialNursingAssement(DataHelpers.varDocId);

            loadDataToOMRControls(oina);

            
        }
        public void loadDataToOMRControls(OutPatientInitialNursingAssement outPatientInitialNursingAssement)
        {
            txtTemperature.Value = outPatientInitialNursingAssement.vs_temperature;
            txtHeartRate.Value = outPatientInitialNursingAssement.vs_heart_rate;
            txtWeight.Value = outPatientInitialNursingAssement.vs_weight;
            txtRespiratoryRate.Value = outPatientInitialNursingAssement.vs_respiratory_rate;
            txtHeight.Value = outPatientInitialNursingAssement.vs_height;
            txtBloodPressure.Value = outPatientInitialNursingAssement.vs_blood_pressure;
            txtBmi.Value = outPatientInitialNursingAssement.vs_BMI;
            txtSpo2.Value = outPatientInitialNursingAssement.vs_spO2;

            txtHeadCircumference.Value = outPatientInitialNursingAssement.pulse;

            txtChiefComplaint.Value = outPatientInitialNursingAssement.chief_complaint;

            //allergy
            if (bool.Parse(outPatientInitialNursingAssement.allergy))
            {
                radAllergy2.Checked = true;
                txtAllergy.Value = outPatientInitialNursingAssement.allergy_note;
            }
            else
            {
                radAllergy1.Checked = true;
            }

            // Mental Status
            if (bool.Parse(outPatientInitialNursingAssement.mental_status))
            {
                radMentalStatus1.Checked = true;
                txtMentalStatus.Value = outPatientInitialNursingAssement.mental_status_note;
            }
            else
            {
                radMentalStatus2.Checked = true;
                txtMentalStatus.Value = outPatientInitialNursingAssement.mental_status_note;
            }

            // Fall risk MORSE SCALE
            if (bool.Parse(outPatientInitialNursingAssement.fall_risk))
            {
                radFrms2.Checked = true;
                txtFrms.Value = outPatientInitialNursingAssement.fall_risk_assistance;
            }
            else
            {
                radFrms1.Checked = true;
            }

            //mental status
            txtPainCore.Value = outPatientInitialNursingAssement.paint_score_code;

            if (outPatientInitialNursingAssement.nutrition_status_code == "N") { radNss2.Checked = true; }
            else if (outPatientInitialNursingAssement.nutrition_status_code == "O") { radNss3.Checked = true; }
            else if (outPatientInitialNursingAssement.nutrition_status_code == "U") { radNss1.Checked = true; }

            if (outPatientInitialNursingAssement.housing_code == "ALN") { radHousing1.Checked = true; }
            else if (outPatientInitialNursingAssement.housing_code == "REL") { radHousing2.Checked = true; }

            if (outPatientInitialNursingAssement.prioritization_code == "IM") { radPrior1.Checked = true; }
            else if (outPatientInitialNursingAssement.prioritization_code == "WA") { radPrior2.Checked = true; }

            btnCancel.Visible = false;
            amendReasonBox.Visible = false;

            if (oina.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                btnCancel.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;
                WebHelpers.DisabledControl(form1, true);
            }

            else if (oina.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }

        }
        
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnComplete.Disabled = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            amendReasonBox.Visible = true;

            WebHelpers.DisabledControl(form1, false);
            txtBmi.Disabled = true;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            oina = new OutPatientInitialNursingAssement(DataHelpers.varDocId);
            oina.status = DocumentStatus.FINAL;

            oina.vs_temperature = txtTemperature.Value;
            oina.vs_heart_rate = txtHeartRate.Value;
            oina.vs_weight = txtWeight.Value;
            oina.vs_respiratory_rate = txtRespiratoryRate.Value;
            oina.vs_height = txtHeight.Value;
            oina.vs_blood_pressure = txtBloodPressure.Value;
            oina.vs_BMI = txtBmi.Value;
            oina.vs_spO2 = txtSpo2.Value;
            oina.pulse = txtHeadCircumference.Value;
            oina.chief_complaint = txtChiefComplaint.Value;
                
            oina.allergy = radAllergy2.Checked;
            if(radAllergy2.Checked) { oina.allergy_note = txtAllergy.Value; }
                
            oina.mental_status = radMentalStatus1.Checked;
            if (radMentalStatus2.Checked) { oina.mental_status_note = txtMentalStatus.Value; }

            oina.paint_score_code = txtPainCore.Value;
            oina.amend_reason = txtAmendReason.Value;

            oina.fall_risk = radFrms2.Checked; 
            if(radFrms2.Checked) { oina.fall_risk_assistance = txtFrms.Value; }

            if (radNss1.Checked) { oina.nutrition_status_code = "U"; }
            else if (radNss2.Checked) { oina.nutrition_status_code = "N"; }
            else if (radNss3.Checked) { oina.nutrition_status_code = "O"; }

            if (radHousing1.Checked) { oina.housing_code = "ALN"; }
            else { oina.housing_code = "REL"; }
                
            if (radPrior1.Checked) { oina.prioritization_code = "IM"; }
            else if (radPrior2.Checked) { oina.prioritization_code = "WA"; }

            oina.assessment_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(oina.assessment_date_time));

            oina.user_name = "my.nguyen";

            if (oina.Update()[0] == "OK")
            {
                Console.WriteLine("Save successful!");

                Initial();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            oina = new OutPatientInitialNursingAssement(DataHelpers.varDocId);

            oina.status = DocumentStatus.DRAFT;
            
            oina.vs_temperature = txtTemperature.Value;
            
            oina.vs_heart_rate = txtHeartRate.Value;
            oina.vs_weight = txtWeight.Value;
            oina.vs_respiratory_rate = txtRespiratoryRate.Value;
            oina.vs_height = txtHeight.Value;
            oina.vs_blood_pressure = txtBloodPressure.Value;
            oina.vs_BMI = txtBmi.Value;
            oina.vs_spO2 = txtSpo2.Value;
            oina.pulse = txtHeadCircumference.Value;

            oina.chief_complaint = txtChiefComplaint.Value;
            oina.allergy = radAllergy2.Checked;
            oina.mental_status = radMentalStatus1.Checked;
            oina.fall_risk = radFrms2.Checked;
            oina.paint_score_code = txtPainCore.Value;

            oina.allergy = radAllergy2.Checked;
            if (radAllergy2.Checked) { oina.allergy_note = txtAllergy.Value; }

            oina.mental_status = radMentalStatus1.Checked;
            if (radMentalStatus2.Checked) { oina.mental_status_note = txtMentalStatus.Value; }

            oina.fall_risk = radFrms2.Checked;
            if (radFrms2.Checked) { oina.fall_risk_assistance = txtFrms.Value; }

            if (radNss1.Checked) { oina.nutrition_status_code = "U"; }
            else if (radNss2.Checked) { oina.nutrition_status_code = "N"; }
            else if (radNss3.Checked) { oina.nutrition_status_code = "O"; }

            if (radHousing1.Checked) { oina.housing_code = "ALN"; }
            else { oina.housing_code = "REL"; }

            if (radPrior1.Checked) { oina.prioritization_code = "IM"; }
            else if (radPrior2.Checked) { oina.prioritization_code = "WA"; }

            oina.assessment_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(oina.assessment_date_time));

            oina.user_name = "my.nguyen";

            if(oina.Update()[0] == "OK")
            {
                Console.WriteLine("Save successful!");

                Initial();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            amendReasonBox.Visible = false;

            WebHelpers.DisabledControl(form1, true);
        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {
            oina = new OutPatientInitialNursingAssement(DataHelpers.varDocId);
            if (oina.Delete("phut.phan")[0] == WebHelpers.ResponseStatus.OK)
            {
                Console.WriteLine("Success");
            }
        }
    }
}
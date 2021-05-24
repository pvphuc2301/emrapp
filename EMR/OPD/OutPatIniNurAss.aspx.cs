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

            txtPluse.Value = outPatientInitialNursingAssement.pulse;

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
            txt_amendReason.Visible = false;

            if (oina.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDeleteModal.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);
            }

            else if (oina.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }

        }
        protected void DisabledControl(bool disabled)
        {
            txtTemperature.Disabled = disabled;
            txtWeight.Disabled = disabled;
            txtHeight.Disabled = disabled;
            txtHeartRate.Disabled = disabled;
            txtRespiratoryRate.Disabled = disabled;
            txtBloodPressure.Disabled = disabled;
            txtSpo2.Disabled = disabled;
            txtPluse.Disabled = disabled;
            txtBmi.Disabled = true;

            txtChiefComplaint.Disabled = disabled;

            radAllergy1.Disabled = disabled;
            radAllergy2.Disabled = disabled;
            txtAllergy.Disabled = disabled;

            radMentalStatus1.Disabled = disabled;
            radMentalStatus2.Disabled = disabled;
            txtMentalStatus.Disabled = disabled;

            txtPainCore.Disabled = disabled;

            radFrms1.Disabled = disabled;
            radFrms2.Disabled = disabled;
            txtFrms.Disabled = disabled;

            radNss1.Disabled = disabled;
            radNss2.Disabled = disabled;
            radNss3.Disabled = disabled;

            radHousing1.Disabled = disabled;
            radHousing2.Disabled = disabled;

            radPrior1.Disabled = disabled;
            radPrior2.Disabled = disabled;

        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            txt_amendReason.Visible = true;

            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
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
            oina.pulse = txtPluse.Value;
            oina.chief_complaint = txtChiefComplaint.Value;
                
            oina.allergy = radAllergy2.Checked;
            if(radAllergy2.Checked) { oina.allergy_note = txtAllergy.Value; }
                
            oina.mental_status = radMentalStatus1.Checked;
            if (radMentalStatus2.Checked) { oina.mental_status_note = txtMentalStatus.Value; }

            oina.paint_score_code = txtPainCore.Value;
            //oina.amend_reason = txtAmendReason.Value;

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

            oina.user_name = (string)Session["UserID"];

            if (oina.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

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
            oina.pulse = txtPluse.Value;

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

            oina.user_name = (string)Session["UserID"];

            if(oina.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {
            if (OutPatientInitialNursingAssement.Delete((string)Session["UserID"])[0] == WebHelpers.ResponseStatus.OK)
            {

            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
    }
}
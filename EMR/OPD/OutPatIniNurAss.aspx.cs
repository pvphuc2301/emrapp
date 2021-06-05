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
        public void loadDataToOMRControls(OutPatientInitialNursingAssement oina)
        {
            txtTemperature.Value = oina.vs_temperature;
            txtHeartRate.Value = oina.vs_heart_rate;
            txtWeight.Value = oina.vs_weight;
            txtRespiratoryRate.Value = oina.vs_respiratory_rate;
            txtHeight.Value = oina.vs_height;
            txtBloodPressure.Value = oina.vs_blood_pressure;
            txtBmi.Value = oina.vs_BMI;
            txtSpo2.Value = oina.vs_spO2;

            txtPluse.Value = oina.pulse;

            txtChiefComplaint.Value = oina.chief_complaint;

            //allergy
            BindRadioButton("rad_allergy_" + oina.allergy);
            txt_allergy_note.Value = oina.allergy_note;

            // Mental Status
            BindRadioButton("rad_mental_status_" + oina.mental_status);
            txt_mental_status_note.Value = oina.mental_status_note;

            // Fall risk MORSE SCALE
            BindRadioButton("rad_fall_risk_" + oina.fall_risk);
            txt_fall_risk_assistance.Value = oina.fall_risk_assistance;

            //mental status
            //txt_paint_score_code.Value = oina.paint_score_code;

            BindRadioButton("rad_nutrition_status_code_" + oina.nutrition_status_code);

            BindRadioButton("rad_housing_code_" + oina.housing_code);

            BindRadioButton("rad_prioritization_code_" + oina.prioritization_code);

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

            rad_allergy_true.Disabled = disabled;
            rad_allergy_false.Disabled = disabled;
            txt_allergy_note.Disabled = disabled;

            rad_mental_status_true.Disabled = disabled;
            rad_mental_status_false.Disabled = disabled;
            txt_mental_status_note.Disabled = disabled;

            DisabledRadioButton("rad_paint_score_code_", OutPatientInitialNursingAssement.PAINT_SCORE_CODE, disabled);

            rad_fall_risk_false.Disabled = disabled;
            rad_fall_risk_true.Disabled = disabled;
            txt_fall_risk_assistance.Disabled = disabled;

            DisabledRadioButton("rad_nutrition_status_code_", OutPatientInitialNursingAssement.NUTRITION_STATUS_CODE, disabled);

            DisabledRadioButton("rad_housing_code_", OutPatientInitialNursingAssement.HOUSING_CODE, disabled);

            DisabledRadioButton("rad_prioritization_code_", OutPatientInitialNursingAssement.PRIORITIZATION_CODE, disabled);

        }
        public void BindRadioButton(dynamic value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputRadioButton)FindControl(value)).Checked = true;
            }
        }
        private dynamic GetRadioButton(string radio_name)
        {
            if (((HtmlInputRadioButton)FindControl(radio_name + "True")).Checked)
            {
                return true;
            }
            else if (((HtmlInputRadioButton)FindControl(radio_name + "False")).Checked)
            {
                return false;
            }
            else { return null; }
        }

        private void DisabledRadioButton(string radioButtonName, Dictionary<string, string> value, bool disabled)
        {
            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl(radioButtonName + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }
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
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                oina = new OutPatientInitialNursingAssement(DataHelpers.varDocId);
                oina.status = DocumentStatus.FINAL;

                oina.user_name = (string)Session["UserID"];

                UpdateData(oina);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);
            }
        }

        private string GetRadioButton(string radio_name, Dictionary<string, string> value)
        {
            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    if (((HtmlInputRadioButton)FindControl(radio_name + code.Key)).Checked)
                    {
                        return code.Key;
                        break;
                    }
                }
                catch (Exception ex) { }
            }
            return null;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                oina = new OutPatientInitialNursingAssement(DataHelpers.varDocId);

                oina.user_name = (string)Session["UserID"];
                oina.status = DocumentStatus.DRAFT;

                UpdateData(oina);
            }
            else
            {
                RequiredFieldValidator.Value = errors;

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private string checkValidField()
        {
            string error = "";
            return error;
        }

        private void UpdateData(OutPatientInitialNursingAssement oina)
        {
            oina.amend_reason = txt_amendReason.Value;
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

            oina.allergy = GetRadioButton("rad_allergy_");
            oina.allergy_note = txt_allergy_note.Value;

            oina.mental_status = GetRadioButton("rad_mental_status_");
            oina.mental_status_note = txt_mental_status_note.Value;

            oina.paint_score_code = GetRadioButton("rad_paint_score_code_", OutPatientInitialNursingAssement.PAINT_SCORE_CODE);
            if (oina.paint_score_code != null) oina.paint_score_description = OutPatientInitialNursingAssement.PAINT_SCORE_CODE[oina.paint_score_code];

            oina.fall_risk = GetRadioButton("rad_fall_risk_");

            oina.fall_risk_assistance = txt_fall_risk_assistance.Value;

            oina.nutrition_status_code = GetRadioButton("rad_nutrition_status_code_", OutPatientInitialNursingAssement.NUTRITION_STATUS_CODE);
            if (oina.nutrition_status_code != null) oina.nutrition_status_description = OutPatientInitialNursingAssement.NUTRITION_STATUS_CODE[oina.nutrition_status_code];

            oina.housing_code = GetRadioButton("rad_housing_code_", OutPatientInitialNursingAssement.HOUSING_CODE);
            if (oina.housing_code != null) oina.housing_description = OutPatientInitialNursingAssement.HOUSING_CODE[oina.housing_code];

            oina.prioritization_code = GetRadioButton("rad_prioritization_code_", OutPatientInitialNursingAssement.PRIORITIZATION_CODE);
            if (oina.prioritization_code != null) oina.prioritization_description = OutPatientInitialNursingAssement.PRIORITIZATION_CODE[oina.prioritization_code];

            oina.assessment_date_time = DataHelpers.ConvertSQLDateTime(oina.assessment_date_time);

            oina.user_name = (string)Session["UserID"];

            dynamic result = oina.Update();

            if (result[0].Status == System.Net.HttpStatusCode.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                Initial();
            }
            else
            {
                Session["PageNotFound"] = result[0];
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"]);

            if (result[0].Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result[0];
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
    }
}
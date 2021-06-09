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
        public Oina oina;

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
            oina = new Oina(DataHelpers.varDocId);

            loadDataToControls(oina);
        }

        public void loadDataToControls(Oina oina)
        {
            try
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
                    loadDataToPrint(oina);
                }

                else if (oina.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Session["PageNotFound"] = ex;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }

        }

        private void loadDataToPrint(Oina oina)
        {
            prt_patient_label.FullName = string.Format("{0} {1}", DataHelpers.patient.first_name_l, DataHelpers.patient.last_name_l);
            prt_patient_label.DOB = string.Format("{0} | {1}", DataHelpers.patient.date_of_birth.ToString("dd-MM-yyyy"), DataHelpers.patient.gender_l);
            prt_patient_label.PID = DataHelpers.patient.visible_patient_id;

            prt_vs_temperature.Text = oina.vs_temperature;
            prt_vs_weight.Text = oina.vs_weight;
            prt_vs_height.Text = oina.vs_height;
            prt_vs_BMI.Text = oina.vs_BMI;
            prt_pulse.Text = oina.pulse;
            prt_vs_respiratory_rate.Text = oina.vs_respiratory_rate;
            prt_vs_blood_pressure.Text = oina.vs_blood_pressure;
            prt_vs_spO2.Text = oina.vs_spO2;

            prt_chief_complaint.Value = oina.chief_complaint;
            prt_allergy.Value = oina.allergy ? string.Format("Có, ghi rõ/ Yes, specify: {0}", oina.allergy_note) : "Không";

            if(oina.mental_status != null)
            {
                string mental_status = "";

                if (oina.mental_status == false)
                {
                    mental_status = oina.mental_status_note;
                }

                prt_mental_status.Options = WebHelpers.CreateOptions(new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true, FixWidth = 162 }, new Option { Text = "No, ghi rõ/ <span class='text-primary'>No, specify</span>:" + mental_status, Value = false });
                prt_mental_status.SelectedValue = oina.mental_status;
            }

            prt_paint_score_code.Value = oina.paint_score_code;

            prt_fall_risk.Value = oina.fall_risk ? "Không có nguy cơ/ No risk" : "Nếu có, cung cấp phương tiện hỗ trợ/ If yes, provide assistance {0}" + oina.fall_risk_assistance;

            prt_nutrition_status_code.Value = oina.nutrition_status_description;

            Option[] housings = new Option[2];
            for(int i = 0; i < Oina.HOUSING_CODE.Count; i++)
            {
                var item = Oina.HOUSING_CODE.ElementAt(i);
                housings[i] = new Option { Text = item.Value, Value = item.Key };
            }

            prt_housing_code.Options = WebHelpers.CreateOptions(housings);
            prt_housing_code.SelectedValue = oina.housing_code;

            prt_prioritization_code.Value = oina.prioritization_description;

            prt_signature1.Content = WebHelpers.GetSignatureTemplate1("<div>Ngày <span class='text-primary'>Date:</span></div>", "ĐIỀU DƯỠNG ĐÁNH GIÁ", "Assessment done by Nurse", "", "","");
            
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

            DisabledRadioButton("rad_paint_score_code_", Oina.PAINT_SCORE_CODE, disabled);

            rad_fall_risk_false.Disabled = disabled;
            rad_fall_risk_true.Disabled = disabled;
            txt_fall_risk_assistance.Disabled = disabled;

            DisabledRadioButton("rad_nutrition_status_code_", Oina.NUTRITION_STATUS_CODE, disabled);

            DisabledRadioButton("rad_housing_code_", Oina.HOUSING_CODE, disabled);

            DisabledRadioButton("rad_prioritization_code_", Oina.PRIORITIZATION_CODE, disabled);
            
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
                oina = new Oina(DataHelpers.varDocId);
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
                oina = new Oina(DataHelpers.varDocId);

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

        private void UpdateData(Oina oina)
        {
            try
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
                //1.
                oina.chief_complaint = txtChiefComplaint.Value;
                //2.
                oina.allergy = GetRadioButton("rad_allergy_");
                if(oina.allergy != null)
                {
                    if (oina.allergy)
                    {
                        oina.allergy_note = txt_allergy_note.Value;
                    }
                }
                //3.
                oina.mental_status = GetRadioButton("rad_mental_status_");
                oina.mental_status_note = txt_mental_status_note.Value;
                //4.
                oina.paint_score_code = GetRadioButton("rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                if (oina.paint_score_code != null) oina.paint_score_description = Oina.PAINT_SCORE_CODE[oina.paint_score_code];
                //5.
                oina.fall_risk = GetRadioButton("rad_fall_risk_");
                if(oina.fall_risk != null)
                {
                    if (oina.fall_risk)
                    {
                        oina.fall_risk_assistance = txt_fall_risk_assistance.Value;
                    }
                }

                oina.nutrition_status_code = GetRadioButton("rad_nutrition_status_code_", Oina.NUTRITION_STATUS_CODE);
                if (oina.nutrition_status_code != null) oina.nutrition_status_description = Oina.NUTRITION_STATUS_CODE[oina.nutrition_status_code];

                oina.housing_code = GetRadioButton("rad_housing_code_", Oina.HOUSING_CODE);
                if (oina.housing_code != null) oina.housing_description = Oina.HOUSING_CODE[oina.housing_code];

                oina.prioritization_code = GetRadioButton("rad_prioritization_code_", Oina.PRIORITIZATION_CODE);
                if (oina.prioritization_code != null) oina.prioritization_description = Oina.PRIORITIZATION_CODE[oina.prioritization_code];

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
            catch(Exception ex)
            {
                Session["ExceptionDetails"] = ex;
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
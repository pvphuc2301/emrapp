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
        #region Variables
        public Oina oina; 
        string UserID = "";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserID();

            if (!IsPostBack)
            {
                Initial();
            }
        }

        private void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            oina = new Oina(Request.QueryString["docId"]);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;
            prt_barcode.Text = Patient.Instance().visible_patient_id;

            if (oina.status == DocumentStatus.FINAL)
            {
                loadFormView();
            }
            else if (oina.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(oina);
            }
        }

        #region Load Forms
        private void LoadFormEdit(Oina oina)
        {
            try
            {
                //I.
                txt_vs_temperature.Value = oina.vs_temperature;
                txt_vs_heart_rate.Value = oina.vs_heart_rate;
                txt_vs_weight.Value = oina.vs_weight;
                txt_vs_respiratory_rate.Value = oina.vs_respiratory_rate;
                txt_vs_height.Value = oina.vs_height;
                txt_vs_blood_pressure.Value = oina.vs_blood_pressure;
                txt_vs_bmi.Value = oina.vs_BMI;
                txt_vs_spo2.Value = oina.vs_spO2;
                txt_pulse.Value = oina.pulse;

                //II.
                //1.
                txt_chief_complaint.Value = oina.chief_complaint;
                //2.
                BindRadioButton("rad_allergy_" + oina.allergy);
                txt_allergy_note.Value = oina.allergy_note;
                //3.
                BindRadioButton("rad_mental_status_" + oina.mental_status);
                txt_mental_status_note.Value = oina.mental_status_note;
                //4
                BindRadioButton("rad_paint_score_code_" + oina.paint_score_code);
                //5
                BindRadioButton("rad_fall_risk_" + oina.fall_risk);
                txt_fall_risk_assistance.Value = oina.fall_risk_assistance;
                //6.
                BindRadioButton("rad_nutrition_status_code_" + oina.nutrition_status_code);
                //III.
                BindRadioButton("rad_housing_code_" + oina.housing_code);
                //IV.
                BindRadioButton("rad_prioritization_code_" + oina.prioritization_code);

                WebHelpers.BindDateTimePicker(dtpk_assessment_date_time, oina.assessment_date_time);

                LoadFormControl(false);

                btnAmend.Visible = false;
                btnPrint.Visible = false;

            }
            catch (Exception ex)
            {
                Session["PageNotFound"] = ex;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }

            
        }
        private void loadFormView()
        {
            lbl_fall_risk.Text = oina.fall_risk ? "Có, cung cấp phương tiện hỗ trợ/ Yes, provide assistance: " + WebHelpers.GetValue(oina.fall_risk_assistance) : "Không có nguy cơ/ No risk";
            lbl_mental_status.Text = oina.mental_status ? "Có/ Yes" : "Không, ghi rõ/ No, specify:";
            lbl_paint_score_description.Text = WebHelpers.GetValue(oina.paint_score_description);
            lbl_chief_complaint.Text = WebHelpers.GetValue(oina.chief_complaint);
            
            if (oina.allergy != null)
            {
                lbl_allergy.Text = oina.allergy ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(oina.allergy_note) : "Không/ No";
            }

            if (oina.mental_status != null)
            {
                lbl_mental_status.Text = oina.mental_status ? "Có/ Yes" : "Không, ghi rõ/ No, specify: " + WebHelpers.GetValue(oina.mental_status_note);
            }

            lbl_nutrition_status_description.Text = WebHelpers.GetValue(oina.nutrition_status_description);
            lbl_housing_description.Text = WebHelpers.GetValue(oina.housing_description);
            lbl_prioritization_description.Text = WebHelpers.GetValue(oina.prioritization_description);

            lbl_vs_temperature.Text = WebHelpers.GetValue(oina.vs_temperature) + " °C";
            lbl_vs_heart_rate.Text = WebHelpers.GetValue(oina.vs_heart_rate) + " / phút (m)";
            lbl_vs_weight.Text = WebHelpers.GetValue(oina.vs_weight) + " kg";
            lbl_vs_height.Text = WebHelpers.GetValue(oina.vs_height) + " cm";
            lbl_vs_respiratory_rate.Text = WebHelpers.GetValue(oina.vs_respiratory_rate) + " / phút (min)";
            txt_vs_bmi.Value = WebHelpers.GetValue(oina.vs_BMI);
            lbl_vs_blood_pressure.Text = WebHelpers.GetValue(oina.vs_blood_pressure) + " mmHg";
            lbl_pulse.Text = WebHelpers.GetValue(oina.pulse) + " cm";
            lbl_vs_spo2.Text = WebHelpers.GetValue(oina.vs_spO2) + " %";
            lbl_assessment_date_time.Text = WebHelpers.FormatDateTime(oina.assessment_date_time, "dd-MM-yyyy HH:mm");

            //
            LoadFormControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void loadFormPrint(Oina oina)
        {
            Patient patient = Patient.Instance();
            prt_fullname.Text = $"{patient.GetFullName()} ({patient.GetTitle()})";
            prt_DOB.Text = $"{WebHelpers.FormatDateTime(patient.date_of_birth)} | {patient.GetGender()}";
            prt_barcode.Text = prt_vpid.Text = patient.visible_patient_id;

            prt_vs_temperature.Text = oina.vs_temperature;
            prt_vs_weight.Text = oina.vs_weight;
            prt_vs_height.Text = oina.vs_height;
            prt_vs_BMI.Text = oina.vs_BMI;
            prt_pulse.Text = oina.vs_heart_rate;
            prt_vs_respiratory_rate.Text = oina.vs_respiratory_rate;
            prt_vs_blood_pressure.Text = oina.vs_blood_pressure;
            prt_vs_spO2.Text = oina.vs_spO2;

            prt_chief_complaint.Text = oina.chief_complaint;
            prt_allergy.Text = oina.allergy ? "Có, ghi rõ/ Yes, specify: " + oina.allergy_note : "Không";

            prt_mental_status.Text = WebHelpers.CreateOptions(new Option { Text= "Có/ Yes", Value = true }, new Option { Text = "Không, ghi rõ/ No, specify: " + oina.mental_status_note, Value = false }, oina.mental_status, "display: grid; grid-template-columns: 80px 1fr");

            prt_paint_score_code.Value = oina.paint_score_code;

            prt_fall_risk.Value = oina.fall_risk ? "Nếu có, cung cấp phương tiện hỗ trợ/ If yes, provide assistance: " + oina.fall_risk_assistance : "Không có nguy cơ/ No risk";

            prt_nutrition_status_code.Value = oina.nutrition_status_description;

            prt_housing.Text = WebHelpers.CreateOptions(Oina.HOUSING_CODE, (string)oina.housing_code, "display: grid; grid-template-columns: 1fr 1fr");
            
            prt_prioritization_code.Value = oina.prioritization_description;
            
        }
        #endregion

        #region Events
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            amendReasonWraper.Visible = true;
            oina = new Oina(Request["docid"]);
            LoadFormEdit(oina);

            btnComplete.Visible = true;
            btnCancel.Visible = true;

            btnPrint.Visible = false;
            btnAmend.Visible = false;
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                oina = new Oina(DataHelpers.varDocId);
                oina.status = DocumentStatus.FINAL;

                oina.user_name = (string)Session["UserID"];

                UpdateData(oina);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                oina = new Oina(DataHelpers.varDocId);

                oina.user_name = (string)Session["UserID"];
                oina.status = DocumentStatus.DRAFT;

                UpdateData(oina);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            oina = new Oina(Request["docid"]);
            loadFormPrint(oina);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Oina.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        #endregion

        #region SESSION
        private void CheckUserID()
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);
        }
        #endregion

        #region METHODS
        private void UpdateData(Oina oina)
        {
            try
            {
                oina.amend_reason = txt_amendReason.Text;

                oina.vs_temperature = txt_vs_temperature.Value;
                oina.vs_heart_rate = txt_vs_heart_rate.Value;
                oina.vs_weight = txt_vs_weight.Value;
                oina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                oina.vs_height = txt_vs_height.Value;
                oina.vs_blood_pressure = txt_vs_blood_pressure.Value;
                oina.vs_BMI = txt_vs_bmi.Value;
                oina.vs_spO2 = txt_vs_spo2.Value;
                oina.vs_heart_rate = txt_pulse.Value;
                //1.
                oina.chief_complaint = txt_chief_complaint.Value;
                //2.
                oina.allergy = GetRadioButton("rad_allergy_");
                if (oina.allergy != null)
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
                if (oina.fall_risk != null)
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

                dynamic result = oina.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
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
            catch (Exception ex)
            {
                Session["ExceptionDetails"] = ex;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in oina.GetType().GetProperties())
            {
                var control1 = FindControl(prop.Name + "_wrapper");
                var control2 = FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = !disabled;
                }
                if (control2 != null)
                {
                    control2.Visible = disabled;
                }
            }
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
        #endregion

        #region Validation
        protected void CustomValidatorAllergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_allergy_true.Checked || rad_allergy_false.Checked;
        }

        protected void CustomValidatorMentalStatus_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_mental_status_true.Checked || rad_mental_status_false.Checked;
        }
        protected void CustomValidatorFallRisk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_fall_risk_true.Checked || rad_fall_risk_false.Checked;
        }
        #endregion

    }
}
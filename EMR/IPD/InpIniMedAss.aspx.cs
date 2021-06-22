using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class InpIniMedAss : Page
    {
        #region Variables
        Iima iima;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);
            if (!IsPostBack)
            {
                Initial();
            }
        }

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            iima = new Iima(Request.QueryString["docId"]);

            WebHelpers.VisibleControl(false, amendReasonWraper, btnCancel);
            //prt_barcode.Text = Patient.Instance().visible_patient_id;
            if (iima.status == DocumentStatus.FINAL)
            {
                BindingDataFormView(iima);

                WebHelpers.VisibleControl(true, btnAmend, btnPrint);
                WebHelpers.VisibleControl(false, btnUpdateVitalSign, btnComplete, btnSave, btnDeleteModal);

                WebHelpers.LoadFormControl(form1, iima, ControlState.View);
            }
            else if (iima.status == DocumentStatus.DRAFT)
            {
                BindingDataFormEdit(iima);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnSave, btnDeleteModal);
                WebHelpers.LoadFormControl(form1, iima, ControlState.Edit);
            }
        }

        #region Binding Data
        private void BindingDataFormEdit(Iima iima)
        {
            try
            {
                txt_amend_reason.Text = "";
                txt_chief_complaint.Value = iima.chief_complaint;
                txt_cur_med_history.Value = iima.cur_med_history;
                txt_cur_medication.Value = iima.cur_medication;
                txt_personal.Value = iima.personal;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_smoking_{iima.habits_smoking}");
                txt_habits_smoking_pack.Value = WebHelpers.GetValue(iima.habits_smoking_pack);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_alcohol_{iima.habits_alcohol}");
                txt_habits_alcohol_note.Value = WebHelpers.GetValue(iima.habits_alcohol_note);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_drugs_{iima.habits_drugs}");
                txt_habits_drugs_note.Value = WebHelpers.GetValue(iima.habits_drugs_note);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_physical_exercise_{iima.habits_physical_exercise}");
                txt_habits_phy_exer_note.Value = WebHelpers.GetValue(iima.habits_phy_exer_note);

                txt_habits_other.Value = WebHelpers.GetValue(iima.habits_other);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_allergy_{iima.allergy}");
                txt_allergy_note.Value = WebHelpers.GetValue(iima.allergy_note);

                txt_family.Value = iima.family;
                txt_immunization.Value = iima.immunization;
                vs_temperature.Text = iima.vs_temperature;
                vs_heart_rate.Text = iima.vs_heart_rate;
                vs_weight.Text = iima.vs_weight;
                vs_height.Text = iima.vs_height;
                vs_respiratory_rate.Text = iima.vs_respiratory_rate;
                vs_bmi.Text = iima.vs_BMI;
                vs_blood_pressure.Text = iima.vs_blood_pressure;
                vs_spo2.Text = iima.vs_spO2;
                vs_pulse.Text = iima.vs_pulse;
                txt_physical_exam.Value = iima.physical_exam;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_psy_consul_required_{iima.psy_consul_required}");
                
                txt_laboratory_result.Value = iima.laboratory_result;
                txt_add_investigation.Value = iima.add_investigation;
                txt_initial_diagnosis.Value = iima.initial_diagnosis;
                txt_diagnosis.Value = iima.diagnosis;
                txt_diff_diagnosis.Value = iima.diff_diagnosis;
                txt_associated_conditions.Value = iima.associated_conditions;
                txt_treatment_plan.Value = iima.treatment_plan;
                txt_discharge_plan.Value = iima.discharge_plan;

                //WebHelpers.LoadFormControl(form1, iima, false);
            }
            catch (Exception ex)
            {
                Session["PageNotFound"] = ex;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        private void BindingDataFormView(Iima iima)
        {
            //I
            lbl_chief_complaint.Text = WebHelpers.GetValue(iima.chief_complaint);
            //II
            //1
            lbl_cur_med_history.Text = WebHelpers.GetValue(iima.cur_med_history);
            lbl_cur_medication.Text = WebHelpers.GetValue(iima.cur_medication);
            //2
            lbl_personal.Text = WebHelpers.GetValue(iima.personal);
            lbl_habits_smoking.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_smoking,$"Có, ghi số gói trong năm/ Yes, specify pack years: {iima.habits_smoking_pack}"));
            lbl_habits_alcohol.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_alcohol, $"Có, ghi rõ/ Yes, specify {iima.habits_alcohol_note}"));
            lbl_habits_drugs.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_drugs, $"Có, ghi rõ/ Yes, specify {iima.habits_drugs_note}"));
            lbl_habits_physical_exercise.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_physical_exercise, $"Có, ghi rõ/ Yes, specify {iima.habits_phy_exer_note}"));
            lbl_habits_other.Text = WebHelpers.GetValue(iima.habits_other);
            lbl_allergy.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.allergy, $"Có, ghi rõ/ Yes, specify: {iima.allergy_note}"));
            lbl_family.Text = WebHelpers.GetValue(iima.family);
            lbl_immunization.Text = WebHelpers.GetValue(iima.immunization);
            lbl_physical_exam.Text = WebHelpers.GetValue(iima.physical_exam);
            lbl_psy_consul_required.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.psy_consul_required));
            lbl_laboratory_result.Text = WebHelpers.GetValue(iima.laboratory_result);
            lbl_add_investigation.Text = WebHelpers.GetValue(iima.add_investigation);
            lbl_initial_diagnosis.Text = WebHelpers.GetValue(iima.initial_diagnosis);
            lbl_diagnosis.Text = WebHelpers.GetValue(iima.diagnosis);
            lbl_diff_diagnosis.Text = WebHelpers.GetValue(iima.diff_diagnosis);
            lbl_associated_conditions.Text = WebHelpers.GetValue(iima.associated_conditions);
            lbl_treatment_plan.Text = WebHelpers.GetValue(iima.treatment_plan);
            lbl_discharge_plan.Text = WebHelpers.GetValue(iima.discharge_plan);

            //WebHelpers.LoadFormControl(form1, iima, true);
        }
        private void BindingDataFormPrint(Iima iima)
        {
            //Patient patient = Patient.Instance();
            //prt_fullname.Text = $"{patient.GetFullName()} ({patient.GetTitle()})";
            //prt_DOB.Text = $"{WebHelpers.FormatDateTime(patient.date_of_birth)} | {patient.GetGender()}";
            //prt_barcode.Text = prt_vpid.Text = patient.visible_patient_id;

            //prt_vs_temperature.Text = oina.vs_temperature;
            //prt_vs_weight.Text = oina.vs_weight;
            //prt_vs_height.Text = oina.vs_height;
            //prt_vs_BMI.Text = oina.vs_BMI;
            //prt_pulse.Text = oina.vs_heart_rate;
            //prt_vs_respiratory_rate.Text = oina.vs_respiratory_rate;
            //prt_vs_blood_pressure.Text = oina.vs_blood_pressure;
            //prt_vs_spO2.Text = oina.vs_spO2;

            //prt_chief_complaint.Text = oina.chief_complaint;
            //prt_allergy.Text = oina.allergy ? "Có, ghi rõ/ Yes, specify: " + oina.allergy_note : "Không";

            //prt_mental_status.Text = WebHelpers.CreateOptions(new Option { Text = "Có/ Yes", Value = true }, new Option { Text = "Không, ghi rõ/ No, specify: " + oina.mental_status_note, Value = false }, oina.mental_status, "display: grid; grid-template-columns: 80px 1fr");

            //prt_paint_score_code.Value = oina.paint_score_code;

            //prt_fall_risk.Value = oina.fall_risk ? "Nếu có, cung cấp phương tiện hỗ trợ/ If yes, provide assistance: " + oina.fall_risk_assistance : "Không có nguy cơ/ No risk";

            //prt_nutrition_status_code.Value = oina.nutrition_status_description;

            //prt_housing.Text = WebHelpers.CreateOptions(Oina.HOUSING_CODE, (string)oina.housing_code, "display: grid; grid-template-columns: 1fr 1fr");

            //prt_prioritization_code.Value = oina.prioritization_description;

        }
        #endregion

        #region Events
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            iima = new Iima(Request["docid"]);
            BindingDataFormEdit(iima);

            WebHelpers.VisibleControl(false, btnAmend, btnPrint);
            WebHelpers.VisibleControl(true, btnUpdateVitalSign, amendReasonWraper, btnComplete, btnCancel);
            WebHelpers.LoadFormControl(form1, iima, ControlState.Edit);
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                iima = new Iima(DataHelpers.varDocId);
                iima.status = DocumentStatus.FINAL;

                iima.user_name = (string)Session["UserID"];
                iima.amend_reason = txt_amend_reason.Text;
                UpdateData(iima);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                iima = new Iima(DataHelpers.varDocId);

                iima.user_name = (string)Session["UserID"];
                iima.status = DocumentStatus.DRAFT;

                UpdateData(iima);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            iima = new Iima(Request["docid"]);
            BindingDataFormPrint(iima);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Iima.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

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
        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Đang chờ anh Long up api 😂')", true);

            //dynamic response = Iima.UpdateVitalSign(Request.QueryString["docId"]);
            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    Initial();
            //}
        }
        #endregion

        #region METHOD
        public void UpdateData(Iima iima)
        {
            try { 

                iima.amend_reason = txt_amend_reason.Text;
                iima.chief_complaint = txt_chief_complaint.Value;
                iima.cur_med_history = txt_cur_med_history.Value;
                iima.cur_medication = txt_cur_medication.Value;
                iima.personal = txt_personal.Value;

                iima.habits_smoking = WebHelpers.getRadioButton(form1, "rad_habits_smoking_");
                iima.habits_smoking_pack = txt_habits_smoking_pack.Value;

                iima.habits_alcohol = WebHelpers.getRadioButton(form1, "rad_habits_alcohol_");
                iima.habits_alcohol_note = txt_habits_alcohol_note.Value;

                iima.habits_drugs = WebHelpers.getRadioButton(form1, "rad_habits_drugs_");
                iima.habits_drugs_note = txt_habits_drugs_note.Value;

                iima.habits_physical_exercise = WebHelpers.getRadioButton(form1, "rad_habits_physical_exercise_");
                iima.habits_phy_exer_note = txt_habits_phy_exer_note.Value;

                iima.habits_other = txt_habits_other.Value;

                iima.allergy = WebHelpers.getRadioButton(form1, "rad_allergy_");
                iima.allergy_note = txt_allergy_note.Value;

                iima.family = txt_family.Value;
                iima.immunization = txt_immunization.Value;
                iima.vs_temperature = vs_temperature.Text;
                iima.vs_heart_rate = vs_heart_rate.Text;
                iima.vs_weight = vs_weight.Text;
                iima.vs_height = vs_height.Text;
                iima.vs_respiratory_rate = vs_respiratory_rate.Text;
                iima.vs_BMI = vs_bmi.Text;
                iima.vs_blood_pressure = vs_blood_pressure.Text;
                iima.vs_spO2 = vs_spo2.Text;
                iima.vs_pulse = vs_pulse.Text;
                iima.physical_exam = txt_physical_exam.Value;

                iima.psy_consul_required = WebHelpers.getRadioButton(form1, "rad_psy_consul_required_");

                iima.laboratory_result = txt_laboratory_result.Value;
                iima.add_investigation = txt_add_investigation.Value;
                iima.initial_diagnosis = txt_initial_diagnosis.Value;
                iima.diagnosis = txt_diagnosis.Value;
                iima.diff_diagnosis = txt_diff_diagnosis.Value;
                iima.associated_conditions = txt_associated_conditions.Value;
                iima.treatment_plan = txt_treatment_plan.Value;
                iima.discharge_plan = txt_discharge_plan.Value;

                dynamic result = iima.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                    Initial();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg_error", "alert(\"" + result.Message + "\");", true);

                    //Session["PageNotFound"] = result[0];
                    //Response.Redirect("../Other/PageNotFound.aspx", false);
                }
            }
            catch (Exception ex)
            {
                string message = string.Format("Message: {0}\\n\\n", ex.Message);
                message += string.Format("StackTrace: {0}\\n\\n", ex.StackTrace.Replace(Environment.NewLine, string.Empty));
                message += string.Format("Source: {0}\\n\\n", ex.Source.Replace(Environment.NewLine, string.Empty));
                message += string.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, string.Empty));
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg_error", "alert(\"" + message + "\");", true);

                //Session["ExceptionDetails"] = ex;
                //Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        #endregion
    }
}
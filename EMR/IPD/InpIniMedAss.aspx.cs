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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!WebHelpers.CheckSession(this)) return;
            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Iima iima, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(iima);
            }
            else
            {
                BindingDataFormView(iima);
            }
        }
        private void BindingDataFormEdit(Iima iima)
        {
            try
            {
                txt_amend_reason.Text = "";
                txt_chief_complaint.Value = iima.chief_complaint;
                txt_cur_med_history.Value = iima.cur_med_history;
                txt_cur_medication.Value = iima.cur_medication;
                txt_personal.Value = iima.personal;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_smoking_" + iima.habits_smoking);
                txt_habits_smoking_pack.Value = iima.habits_smoking_pack;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_alcohol_" + iima.habits_alcohol);
                txt_habits_alcohol_note.Value = iima.habits_alcohol_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_drugs_" + iima.habits_drugs);
                txt_habits_drugs_note.Value = iima.habits_drugs_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_physical_exercise_" + iima.habits_physical_exercise);
                txt_habits_phy_exer_note.Value = iima.habits_phy_exer_note;

                txt_habits_other.Value = iima.habits_other;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_allergy_" + iima.allergy);
                txt_allergy_note.Value = iima.allergy_note;

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

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_psy_consul_required_" + iima.psy_consul_required);
                
                txt_laboratory_result.Value = iima.laboratory_result;
                txt_add_investigation.Value = iima.add_investigation;
                txt_initial_diagnosis.Value = iima.initial_diagnosis;
                txt_diagnosis.Value = iima.diagnosis;
                txt_diff_diagnosis.Value = iima.diff_diagnosis;
                txt_associated_conditions.Value = iima.associated_conditions;
                txt_treatment_plan.Value = iima.treatment_plan;
                txt_discharge_plan.Value = iima.discharge_plan;

                WebHelpers.AddScriptFormEdit(Page, iima);
            }
            catch (Exception ex)
            {
                Session["PageNotFound"] = ex;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        private void BindingDataFormView(Iima iima)
        {
            try
            {
                //I
                lbl_chief_complaint.Text = WebHelpers.GetValue(iima.chief_complaint);
                //II
                //1
                lbl_cur_med_history.Text = WebHelpers.GetValue(iima.cur_med_history);
                lbl_cur_medication.Text = WebHelpers.GetValue(iima.cur_medication);
                //2
                lbl_personal.Text = WebHelpers.GetValue(iima.personal);
                lbl_habits_smoking.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_smoking, $"Có, ghi số gói trong năm/ Yes, specify pack years: {iima.habits_smoking_pack}"));
                lbl_habits_alcohol.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_alcohol, $"Có, ghi rõ/ Yes, specify {iima.habits_alcohol_note}"));
                lbl_habits_drugs.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_drugs, $"Có, ghi rõ/ Yes, specify {iima.habits_drugs_note}"));
                lbl_habits_physical_exercise.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.habits_physical_exercise, $"Có, ghi rõ/ Yes, specify {iima.habits_phy_exer_note}"));
                lbl_habits_other.Text = WebHelpers.GetValue(iima.habits_other);
                lbl_allergy.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.allergy, $"Có, ghi rõ/ Yes, specify: {iima.allergy_note}"));
                lbl_family.Text = WebHelpers.GetValue(iima.family);
                lbl_immunization.Text = WebHelpers.GetValue(iima.immunization);
                //
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);
                vs_temperature.Text = WebHelpers.FormatString(iima.vs_temperature);
                vs_heart_rate.Text = WebHelpers.FormatString(iima.vs_heart_rate);
                vs_weight.Text = WebHelpers.FormatString(iima.vs_weight);
                vs_respiratory_rate.Text = WebHelpers.FormatString(iima.vs_respiratory_rate);
                vs_height.Text = WebHelpers.FormatString(iima.vs_height);
                vs_blood_pressure.Text = WebHelpers.FormatString(iima.vs_blood_pressure);
                vs_bmi.Text = WebHelpers.FormatString(iima.vs_BMI);
                vs_spo2.Text = WebHelpers.FormatString(iima.vs_spO2);
                vs_pulse.Text = WebHelpers.FormatString(iima.vs_pulse);
                lbl_physical_exam.Text = WebHelpers.GetValue(iima.physical_exam);
                lbl_psy_consul_required.Text = WebHelpers.GetValue(WebHelpers.GetBool(iima.psy_consul_required));
                //IV
                lbl_laboratory_result.Text = WebHelpers.GetValue(iima.laboratory_result);
                lbl_add_investigation.Text = WebHelpers.GetValue(iima.add_investigation);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.GetValue(iima.initial_diagnosis);
                lbl_diagnosis.Text = WebHelpers.GetValue(iima.diagnosis);
                lbl_diff_diagnosis.Text = WebHelpers.GetValue(iima.diff_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.GetValue(iima.associated_conditions);
                lbl_treatment_plan.Text = WebHelpers.GetValue(iima.treatment_plan);
                lbl_discharge_plan.Text = WebHelpers.GetValue(iima.discharge_plan);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(Iima iima)
        {
            try
            {
                prt_chief_complaint.Text = iima.chief_complaint;
                prt_cur_med_history.Text = iima.cur_med_history;
                prt_cur_medication.Text = iima.cur_medication;
                prt_personal.Text = iima.personal;
                if (iima.habits_smoking != null)
                {
                    if (iima.habits_smoking = true)
                    {
                        prt_habits_smoking_True.Text = "☒";
                        prt_habits_smoking_False.Text = "❏";
                    }
                    if (iima.habits_smoking = false)
                    {
                        prt_habits_smoking_True.Text = "❏";
                        prt_habits_smoking_False.Text = "☒";
                    }
                }
                if (iima.habits_smoking == null)
                {
                    prt_habits_smoking_True.Text = "❏";
                    prt_habits_smoking_False.Text = "❏";
                }
                lbl_habits_smoking_pack.Text = iima.habits_smoking_pack;
                if (iima.habits_alcohol != null)
                {
                    if (iima.habits_alcohol = true)
                    {
                        prt_habits_alcohol_True.Text = "☒";
                        prt_habits_alcohol_False.Text = "❏";
                    }
                    if (iima.habits_alcohol = false)
                    {
                        prt_habits_alcohol_True.Text = "❏";
                        prt_habits_alcohol_False.Text = "☒";
                    }
                }
                if (iima.habits_alcohol == null)
                {
                    prt_habits_alcohol_True.Text = "❏";
                    prt_habits_alcohol_False.Text = "❏";
                }
                prt_habits_alcohol_note.Text = iima.habits_alcohol_note;
                if (iima.habits_drugs != null)
                {
                    if (iima.habits_drugs = true)
                    {
                        prt_habits_drugs_True.Text = "☒";
                        prt_habits_drugs_False.Text = "❏";
                    }
                    if (iima.habits_drugs = false)
                    {
                        prt_habits_drugs_True.Text = "❏";
                        prt_habits_drugs_False.Text = "☒";
                    }
                }
                if (iima.habits_drugs == null)
                {
                    prt_habits_drugs_True.Text = "❏";
                    prt_habits_drugs_False.Text = "❏";
                }
                prt_habits_drugs_note.Text = iima.habits_drugs_note;
                if (iima.habits_physical_exercise != null)
                {
                    if (iima.habits_physical_exercise = true)
                    {
                        prt_habits_physical_exercise_True.Text = "☒";
                        prt_habits_physical_exercise_False.Text = "❏";
                    }
                    if (iima.habits_drugs = false)
                    {
                        prt_habits_physical_exercise_True.Text = "❏";
                        prt_habits_physical_exercise_False.Text = "☒";
                    }
                }
                if (iima.habits_drugs == null)
                {
                    prt_habits_physical_exercise_True.Text = "❏";
                    prt_habits_physical_exercise_False.Text = "❏";
                }
                prt_habits_phy_exer_note.Text = iima.habits_phy_exer_note;
                prt_habits_other.Text = iima.habits_other;
                if (iima.allergy != null)
                {
                    if (iima.allergy = true)
                    {
                        prt_allergy_True.Text = "☒";
                        prt_allergy_False.Text = "❏";
                    }
                    if (iima.allergy = false)
                    {
                        prt_allergy_True.Text = "❏";
                        prt_allergy_False.Text = "☒";
                    }
                }
                if (iima.allergy == null)
                {
                    prt_allergy_True.Text = "❏";
                    prt_allergy_False.Text = "❏";
                }
                prt_allergy_note.Text = iima.allergy_note;
                prt_family.Text = iima.family;
                prt_immunization.Text = iima.immunization;
                prt_vs_temperature.Text = iima.vs_temperature;
                prt_vs_heart_rate.Text = iima.vs_heart_rate;
                prt_vs_weight.Text = iima.vs_weight;
                prt_vs_height.Text = iima.vs_height;
                prt_vs_respiratory_rate.Text = iima.vs_respiratory_rate;
                prt_vs_BMI.Text = iima.vs_BMI;
                prt_vs_blood_pressure.Text = iima.vs_blood_pressure;
                prt_vs_spO2.Text = iima.vs_spO2;
                //prt_vs_pulse.Text = iima.vs_pulse;
                prt_physical_exam.Text = iima.physical_exam;
                if (iima.psy_consul_required != null)
                {
                    if (iima.psy_consul_required = true)
                    {
                        prt_psy_consul_required_True.Text = "☒";
                        prt_psy_consul_required_False.Text = "❏";
                    }
                    if (iima.psy_consul_required = false)
                    {
                        prt_psy_consul_required_True.Text = "❏";
                        prt_psy_consul_required_False.Text = "☒";
                    }
                }
                if (iima.psy_consul_required == null)
                {
                    prt_psy_consul_required_True.Text = "❏";
                    prt_psy_consul_required_False.Text = "❏";
                }
                prt_laboratory_result.Text = iima.laboratory_result;
                //prt_add_investigation.Text = iima.add_investigation;
                prt_initial_diagnosis.Text = iima.initial_diagnosis;
                //prt_diagnosis.Text = iima.diagnosis;
                prt_diff_diagnosis.Text = iima.diff_diagnosis;
                prt_associated_conditions.Text = iima.associated_conditions;
                prt_treatment_plan.Text = iima.treatment_plan;
                prt_discharge_plan.Text = iima.discharge_plan;
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                Iima iima = new Iima(DataHelpers.varDocId);
                iima.status = DocumentStatus.FINAL;
                iima.user_name = (string)Session["UserID"];

                UpdateData(iima);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Iima iima = new Iima(DataHelpers.varDocId);

                iima.user_name = (string)Session["UserID"];
                iima.status = DocumentStatus.DRAFT;

                UpdateData(iima);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Iima.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    string pid = Request["pid"];
                    string vpid = Request["vpid"];

                    Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request["docid"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Iima iima = new Iima(Request["docid"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, iima, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(iima);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try { 
                Iima iima = new Iima(Request["docid"]);
                BindingDataFormPrint(iima);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
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
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                Iima iima = new Iima(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                //prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (iima.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(iima, WebHelpers.LoadFormControl(form1, iima, ControlState.View, (string)Session["location"]));

                }
                else if (iima.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(iima, WebHelpers.LoadFormControl(form1, iima, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, iima.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
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
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion
    }
}
using EMR.Classes;
using EMR.DBP;
using EMR.Model;
using EMR.UserControls;
using Microsoft.SqlServer.Server;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public abstract class EmrPage : Page
    {
        protected PatientInfo Patient { get; set; }
        protected PatientVisitInfo PatientVisit { get; set; }
        public abstract string visit_type { get; set; }
        public string PAGE_URL { get => $"/{visit_type}/{GetType().Name}.aspx?loc={Location}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}"; }
        public string Location { get => (string)Session["company_code"]; }
        public string LocationChanged { get => (string)Session["const_company_code"]; }
        public string varDocID { get => Request.QueryString["docId"] ?? throw new ArgumentNullException("document id cannot be null."); }
        public string varDocIdLog { get => Request.QueryString["docIdLog"]; }
        public string varModelID { get => Request.QueryString["modelId"] ?? throw new ArgumentNullException("Model id cannot be null."); }
        public string varPVID { get => Request.QueryString["pvId"] ?? throw new ArgumentNullException("Patient visit id cannot be null."); }
        public string varVPID { get => Request.QueryString["vpId"] ?? throw new ArgumentNullException("Visible patient id cannot be null."); }
        public string varPID { get => Request.QueryString["pId"] ?? throw new ArgumentNullException("Patient id cannot be null."); }
        public string signature_date { get; set; }
        public string signature_name { get; set; }
        public string AccessAuthorize { get => (string)Session["access_authorize"]; }
        public string GroupAccess { get => (string)Session["group_access"]; }
        public bool IsLocationChanged { get => Location != LocationChanged; }
        public string EmpId { get => (string)Session["emp_id"]; }
        public string UserId { get => (string)Session["UserId"]; }
        public bool IsViewLog => varDocIdLog != null;
        public void BindingDataForm(HtmlForm form, object Model, ControlState state)
        {
            if (WebHelpers.LoadFormControl(form, Model, state, IsViewLog, !IsLocationChanged, AccessAuthorize))
            {
                BindingDataFormEdit();
            }
            else
            {
                BindingDataFormView();
            }
        }
        public abstract void BindingDataFormEdit();
        public abstract void BindingDataFormPrint();
        public abstract void BindingDataFormView();
        public abstract void Init_Page();
        public abstract void PostBackEventHandler();
        public abstract void UpdateModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }
            if (!IsPostBack) { Init_Page(); }
            PostBackEventHandler();
        }
        protected DataTable FindHtmlInputCheckBox(HtmlForm HtmlForm, string CheckBoxId, Dictionary<string, string> DataSource, string prefix = "cb", string code = "code")
        {
            DataTable table = new DataTable();
            table.Columns.Add(code);
            table.Columns.Add("desc");
            foreach (KeyValuePair<string, string> dictionary in DataSource)
            {
                try
                {
                    if (((HtmlInputCheckBox)HtmlForm.FindControl(prefix + "_" + CheckBoxId + "_" + dictionary.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();
                        dtRow = table.NewRow();
                        dtRow[code] = dictionary.Key;
                        dtRow["desc"] = dictionary.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex) 
                {
                    Console.WriteLine(ex.Message);
                }
            }
            if (table.Rows.Count > 0)
            {
                return table;
            }
            return null;
        }
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - Find Checkbox in HtmlForm <br/>
        /// - rad_ControlID_true <br/>
        /// - rad_ControlID_false <br/>
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="HtmlForm"></param>
        /// <param name="ControlID"></param>
        /// <param name="Prefix"></param>
        /// <returns></returns>
        protected bool? FindHtmlInputRadioButton(HtmlForm HtmlForm, string ControlID, string Prefix = "rad")
        {
            dynamic returnTrue = HtmlForm.FindControl(Prefix + "_" + ControlID + "_true");
            dynamic returnFalse = HtmlForm.FindControl(Prefix + "_" + ControlID + "_false");

            if (returnTrue != null)
            {
                if (returnTrue.Checked)
                {
                    return true;
                }
            }
            if (returnFalse != null)
            {
                if (returnFalse.Checked)
                {
                    return false;
                }
            }

            return null;
        }
        protected string FindHtmlInputRadioButton(HtmlForm HtmlForm, string ControlID, Dictionary<string, string> DataSource, string Prefix = "rad")
        {
            foreach (KeyValuePair<string, string> code in DataSource)
            {
                if (((HtmlInputRadioButton)HtmlForm.FindControl(Prefix + "_" + ControlID + "_" + code.Key)).Checked)
                {
                    return code.Key;
                }
            }
            return null;
        }
    }
    public class NUTRITION_SCREENING
    {
        public dynamic previous_weight { get; set; }
        public dynamic weight_change { get; set; }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
    public class NUTRITION_STATUS
    {
        public dynamic ns_code { get; set; }
        public dynamic ns_score { get; set; }
        public dynamic loss_weight { get; set; }
        public dynamic food_intake { get; set; }
        public dynamic total_score { get; set; }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }                  
    public class FLACC 
    {
        public int? face { get; set; }
        public int? legs { get; set; }
        public int? activity { get; set; }
        public int? cry { get; set; }
        public int? consolability { get; set; }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
    public class COMMUNICABLE_DISEASE_SCREENING
    {
        public bool? high_fever { get; set; }
        public bool? contact_infectious_disease { get; set; }
        public bool? close_contact { get; set; }
        public bool? injectious_risk { get; set; }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
    public class FALL_RISK_QUESTION
    {
        public bool? fallen { get; set; }
        public bool? feel_unsteady { get; set; }
        public bool? worry_about_falling { get; set; }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
    public class BARRIER_TO_CARE
    {
        public bool? btc_language { get; set; }
        public string btc_language_note { get; set; }
        public bool? btc_cognitive { get; set; }
        public string btc_cognitive_note { get; set; }
        public bool? btc_sensory { get; set; }
        public string btc_sensory_note { get; set; }
        public bool? btc_religious { get; set; }
        public string btc_religious_note { get; set; }
        public bool? btc_cultural { get; set; }
        public string btc_cultural_note { get; set; }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
    public partial class OutPatIniNurAssRV03 : EmrPage, IEmrFormModel<OinaRv03>
    {
        public override string visit_type { get; set; } = "OPD";
        public OinaRv03 Model { get; set; }
        public override void Init_Page()
        {
            try
            {
                Patient = new PatientInfo(varPID);
                PatientVisit = new PatientVisitInfo(varPVID, Location);

                Model = new OinaRv03(varDocID, Location, varDocIdLog);
                currentLog.Visible = !string.IsNullOrEmpty(varDocIdLog);
                uc_patientInfo.Patient = Patient;
                uc_patientInfo.PatientVisit = PatientVisit;

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Model.Logs(Location), out string signature_date, out string signature_name);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (Model.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(form1, Model, ControlState.View);
                    BindingDataFormPrint();
                }
                else if (Model.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(form1, Model, ControlState.Edit);
                }

                WebHelpers.getAccessButtons(new AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = Model.status,
                    AccessGroup = GroupAccess,
                    AccessAuthorize = AccessAuthorize,
                    IsSameCompanyCode = !IsLocationChanged,
                    IsViewLog = IsViewLog
                });
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void PostBackEventHandler()
        {
            string EVENTTARGET = Request["__EVENTTARGET"];

            switch (EVENTTARGET)
            {
                case "flacc_change":
                    flacc_change();
                    break;
                case "npass_change":
                    npass_change();
                    break;
                case "vs_height_change":
                    vs_bmi_change();
                    break;
                case "previous_weight_changed":
                    vs_weight_change();
                    break;
                case "vs_weight_change":
                    vs_bmi_change();
                    vs_weight_change();
                    break;
                case "patient_education_need_oth_change":
                    field_patient_edu_need_oth.Visible = cb_patient_education_needs_oth.Checked;
                    break;

                case "allergy_change":
                    field_allergy_true.Visible = false;
                    btc_change("field_allergy", Request["__EVENTARGUMENT"]);
                    break;

                case "mental_status_change":
                    mental_status_change(Request["__EVENTARGUMENT"]);
                    break;

                case "pain_assessment_change":
                    field_npass.Visible
                        = field_naf.Visible
                        = field_flacc.Visible
                        = field_nonv.Visible
                        = false;
                    var control = FindControl(Request["__EVENTARGUMENT"]);
                    if (control != null)
                    {
                        control.Visible = true;
                    }
                    UpdatePanel18.Update();
                    break;

                case "btc_language_change":
                    field_btc_language_true.Visible = false;
                    btc_change("field_btc_language", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_cognitive_change":
                    field_btc_cognitive_true.Visible = false;
                    btc_change("field_btc_cognitive", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_sensory_change":
                    field_btc_sensory_true.Visible = false;
                    btc_change("field_btc_sensory", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_religious_change":
                    field_btc_religious_true.Visible = false;
                    btc_change("field_btc_religious", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_cultural_change":
                    field_btc_cultural_true.Visible = false;
                    btc_change("field_btc_cultural", Request["__EVENTARGUMENT"]);
                    break;

                case "no_fall_risks_change":
                    no_fall_risks_change();
                    break;

                case "nutrition_status_age_change":
                    field_nutrition_status_l.Visible
                        = field_nutrition_status_g.Visible
                        = field_nutrition_status_a.Visible = false;

                    rad_ns_l_2.Checked
                        = rad_ns_l_1.Checked
                        = rad_ns_l_0.Checked
                        = rad_ns_g_2.Checked
                        = rad_ns_g_1.Checked
                        = rad_ns_g_0.Checked
                        = rad_ns_a_2.Checked
                        = rad_ns_a_1.Checked
                        = rad_ns_a_0.Checked
                        = false;
                    ns_age_score.Value = "";

                    btc_change("field_nutrition_status", Request["__EVENTARGUMENT"]);
                    NutritionStatusScoreChange();
                    break;
                case "nutrition_status_change":
                    ns_age_score.Value = Request["__EVENTARGUMENT"];
                    NutritionStatusScoreChange();
                    break;
                case "ns_loss_weight_change":
                    ns_loss_weight_score.Value = Request["__EVENTARGUMENT"];
                    NutritionStatusScoreChange();
                    break;
                case "ns_food_intake_change":
                    ns_food_intake_score.Value = Request["__EVENTARGUMENT"];
                    NutritionStatusScoreChange();
                    break;
                case "prioritization_change":
                    prioritization_change();
                    break;
                case "im_consul_req_oth_change":
                    field_im_consul_req_oth.Visible = cb_im_consul_req_oth.Checked;
                    break;


            }
        }
        private void npass_change()
        {
            int? npass_total_score = CalculateNPASS();
            string npass_conclude = string.Empty;
            switch (npass_total_score)
            {
                case 0:
                    npass_conclude = "Không đau/ No pain";
                    break;
                case 1:
                case 2:
                case 3:
                    npass_conclude = "Đau nhẹ/ Slight pain (1 - 3)";
                    break;
                default:
                    npass_conclude = "Đau vừa - nhiều/ Considerable - Serious pain";
                    break;
            }
            d_npass_conclude.Text = npass_conclude;
            d_npass_total_score.Text = Convert.ToString(npass_total_score);
            up_npass_total_score.Update();
            up_npass_conclude.Update();
        }
        private void flacc_change()
        {
            int? flacc_total_score = CalculateFLACC();
            string flacc_conclude = string.Empty;
            switch (flacc_total_score)
            {
                case 0:
                    flacc_conclude = "Không đau/ No pain (0)";
                    break;
                case 1:
                case 2:
                case 3:
                    flacc_conclude = "Đau nhẹ/ Slight pain (1 - 3)";
                    break;
                case 4:
                case 5:
                case 6:
                    flacc_conclude = "Đau vừa/ Considerable pain (4 - 6)";
                    break;
                case 7:
                case 8:
                case 9:
                case 10:
                    flacc_conclude = "Rất đau/ Worst pain (7 - 10)";
                    break;
            }
            d_flacc_conclude.Text = flacc_conclude;
            d_flacc_total_score.Text = Convert.ToString(flacc_total_score);
            up_flacc_total_score.Update();
            up_flacc_conclude.Update();
        }
        private void vs_bmi_change()
        {
            string bmi = string.Empty;

            if (!string.IsNullOrEmpty(txt_vs_weight.Value) && !string.IsNullOrEmpty(txt_vs_height.Value)) { 
                double vs_weight = Convert.ToDouble(txt_vs_weight.Value);
                double vs_height = Convert.ToDouble(txt_vs_height.Value);
                bmi = Convert.ToString(OinaRv03.BmiCal(vs_weight, vs_height));
            }
            d_bmi.Text = bmi;
            up_nutrition_screening.Update();
        }
        private void vs_weight_change()
        {
            string weight_change = string.Empty;
            if (!string.IsNullOrEmpty(txt_previous_weight.Value) && !string.IsNullOrEmpty(txt_vs_weight.Value)) 
            {
                double previous_weight = Convert.ToDouble(txt_previous_weight.Value);
                double vs_weight = Convert.ToDouble(txt_vs_weight.Value);
                weight_change = Convert.ToString(OinaRv03.WeightChangeCal(previous_weight, vs_weight));
            }
            d_weight_change.Text = weight_change;
        }

        #region Binding Data
        public override void BindingDataFormEdit()
        {
            try
            {
                txt_flacc_face.Visible
                    = txt_flacc_legs.Visible
                    = txt_flacc_activity.Visible
                    = txt_flacc_cry.Visible
                    = txt_flacc_consolability.Visible
                    = txt_npass_crying.Visible
                    = txt_npass_behavior.Visible
                    = txt_npass_facial_expression.Visible
                    = txt_npass_extremities_tone.Visible
                    = txt_npass_vital_signs.Visible
                    = txt_npass_gestation_3.Visible
                    = txt_npass_gestation_2.Visible
                    = txt_npass_gestation_1.Visible
                    = true;

                lbl_flacc_face.Visible
                    = lbl_flacc_legs.Visible
                    = lbl_flacc_activity.Visible
                    = lbl_flacc_cry.Visible
                    = lbl_flacc_consolability.Visible
                    = lbl_npass_crying.Visible
                    = lbl_npass_behavior.Visible
                    = lbl_npass_facial_expression.Visible
                    = lbl_npass_extremities_tone.Visible
                    = lbl_npass_vital_signs.Visible
                    = lbl_npass_gestation_3.Visible
                    = lbl_npass_gestation_2.Visible
                    = lbl_npass_gestation_1.Visible
                    = false;

                txt_amend_reason.Text = "";
                #region I. DẤU HIỆU SINH TỒN VÀ CÁC CHỈ SỐ ĐO LƯỜNG/ VITAL SIGNS AND PHYSICAL MEASUREMENTS
                txt_vs_temperature.Value = Model.vs_temperature;
                txt_vs_weight.Value = Model.vs_weight;
                txt_vs_height.Value = Model.vs_height;
                txt_vs_heart_rate.Value = Model.vs_heart_rate;
                txt_vs_bmi.Value = Model.vs_BMI;
                txt_pulse.Value = Model.pulse;
                txt_vs_respiratory_rate.Value = Model.vs_respiratory_rate;
                txt_vs_blood_pressure.Value = Model.vs_blood_pressure;
                txt_vs_spo2.Value = Model.vs_spO2;
                #endregion

                #region II. ĐÁNH GIÁ/ ASSESSMENT

                #region 1. Lý do đến khám/ Chief complaint
                txt_chief_complaint.Value = Model.chief_complaint.ConvertToHtml();
                #endregion

                #region 2. Dị ứng/ Allergy
                form1.BindingInputRadioButton($"{nameof(Model.allergy)}_{Model.allergy}");
                txt_allergy_note.Value = EMRHelpers.ConvertBooleanToString(Model.allergy, Model.allergy_note, string.Empty); //Model.allergy_note.ConvertToHtml();
                                                                                                      //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + Model.allergy);
                                                                                                      //if (rad_allergy_true.Checked)
                                                                                                      //{
                                                                                                      //    txt_allergy_note.Value = Model.allergy_note.ConvertToHtml();
                                                                                                      //}
                #endregion

                #region 3. Trạng thái tinh thần/ Mental status
                form1.BindingInputRadioButton($"{nameof(Model.mental_status)}_{Model.mental_status}");
                mental_status_change(Convert.ToString(Model.mental_status));
                txt_mental_status_note.Value = EMRHelpers.ConvertBooleanToString(Model.mental_status, string.Empty, Model.mental_status_note.ConvertToHtml());
                #endregion

                #region 4. Tầm soát bệnh lây nhiễm/ Communicable disease screening
                rad_high_fever_true.Disabled
                    = rad_high_fever_false.Disabled
                    = rad_contact_infectious_disease_true.Disabled
                    = rad_contact_infectious_disease_false.Disabled
                    = rad_close_contact_true.Disabled
                    = rad_close_contact_false.Disabled
                    = rad_injectious_risk_true.Disabled
                    = rad_injectious_risk_false.Disabled
                    = false;

                if (Model.communicable_disease_screening != null)
                {
                    COMMUNICABLE_DISEASE_SCREENING communicable_disease_screening = Model.COMMUNICABLE_DISEASE_SCREENING();
                    form1.BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.high_fever)}_{communicable_disease_screening.high_fever}");
                    form1.BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.contact_infectious_disease)}_{communicable_disease_screening.contact_infectious_disease}");
                    form1.BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.close_contact)}_{communicable_disease_screening.close_contact}");
                    form1.BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.injectious_risk)}_{communicable_disease_screening.injectious_risk}");
                }
                #endregion

                #region 5. Đánh giá đau/ Pain assessment

                pain_assessment_scale_wrapper.Visible = true;

                LoadPainAssessmentScale(Model.pain_assessment_type);
                #endregion

                #region 6. Trở ngại chăm sóc/ Barrier to care
                lbl_btc_language.Visible
                    = lbl_btc_cognitive.Visible
                    = lbl_btc_sensory.Visible
                    = lbl_btc_religious.Visible
                    = lbl_btc_cultural.Visible
                    = false;

                btc_language_wrapper.Visible
                    = btc_cognitive_wrapper.Visible
                    = btc_sensory_wrapper.Visible
                    = btc_religious_wrapper.Visible
                    = btc_cultural_wrapper.Visible
                    = true;

                if (Model.barrier_to_care != null)
                {

                    BARRIER_TO_CARE barrier_to_care = Model.BARRIER_TO_CARE();
                    //btc_language
                    form1.BindingInputRadioButton($"{nameof(BARRIER_TO_CARE.btc_language)}_{barrier_to_care.btc_language}");
                    field_btc_language_true.Visible = barrier_to_care.btc_language == true;
                    txt_btc_language_note.Value = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_language, Convert.ToString(barrier_to_care.btc_language_note), string.Empty);//  Bool.TryParse(btc_language, barrier_to_care.btc_language_note, string.Empty); //Boolean.TryParse(barrier_to_care.btc_language, barrier_to_care.btc_language_note, string.Empty); // bool.TryParse(barrier_to_care.btc_language, barrier_to_care.btc_language_note, string.Empty);
                    //btc_cognitive
                    form1.BindingInputRadioButton($"{nameof(BARRIER_TO_CARE.btc_cognitive)}_{barrier_to_care.btc_cognitive}");
                    field_btc_cognitive_true.Visible = barrier_to_care.btc_cognitive == true;
                    txt_btc_cognitive_note.Value = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_cognitive, Convert.ToString(barrier_to_care.btc_cognitive_note), string.Empty);
                    //btc_sensory
                    form1.BindingInputRadioButton($"{nameof(BARRIER_TO_CARE.btc_sensory)}_{barrier_to_care.btc_sensory}");
                    field_btc_sensory_true.Visible = barrier_to_care.btc_sensory == true;
                    txt_btc_sensory_note.Value = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_sensory, Convert.ToString(barrier_to_care.btc_sensory_note), string.Empty);
                    //Religious Barriers
                    form1.BindingInputRadioButton($"{nameof(BARRIER_TO_CARE.btc_religious)}_{barrier_to_care.btc_religious}");
                    field_btc_religious_true.Visible = barrier_to_care.btc_religious == true;
                    txt_btc_religious_note.Value = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_religious, Convert.ToString(barrier_to_care.btc_religious_note), string.Empty);
                    //Cultural Barriers
                    form1.BindingInputRadioButton($"{nameof(BARRIER_TO_CARE.btc_cultural)}_{barrier_to_care.btc_cultural}");
                    field_btc_cultural_true.Visible = barrier_to_care.btc_cultural == true;
                    txt_btc_cultural_note.Value = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_cultural, Convert.ToString(barrier_to_care.btc_cultural_note), string.Empty);
                }
                else
                {
                    field_btc_language_true.Visible = false;
                    field_btc_cognitive_true.Visible = false;
                    field_btc_sensory_true.Visible = false;
                    field_btc_religious_true.Visible = false;
                    field_btc_cultural_true.Visible = false;
                }
                #endregion

                #region 7. Tầm soát nguy cơ té ngã/ Fall risk morse scale:
                //- Các yếu tố nguy cơ/ Fall risk factors:
                lbl_no_fall_risk.Visible
                    = lbl_fallen.Visible
                    = lbl_feel_unsteady.Visible
                    = lbl_worry_about_falling.Visible
                    = false;

                no_fall_risk_wrapper.Visible
                    = fallen_field.Visible
                    = feel_unsteady_field.Visible
                    = worry_about_falling_field.Visible
                    = intervention_field.Visible
                = true;

                if (!string.IsNullOrEmpty(Model.fall_risk_factors))
                {
                    form1.BindingInputCheckBox("fall_risk_factors", Model.fall_risk_factors.ConvertToDataTable());
                    form1.BindingInputRadioButton($"no_fall_risks_{cb_fall_risk_factors_nfr.Checked}");
                    fall_risk_factors_field.Visible = true;
                    field_no_fall_risks_false.Visible = !cb_fall_risk_factors_nfr.Checked;
                    rad_fallen_false.Checked = cb_fall_risk_factors_nfr.Checked;

                    if (!cb_fall_risk_factors_nfr.Checked)
                    {
                        //-	Câu hỏi sàng lọc / The fall risk screen questions:
                        dynamic fall_risk_questions = Model.fall_risk_questions?.ConvertToObject();
                        form1.BindingInputRadioButton($"fallen_{fall_risk_questions.fallen}");
                        form1.BindingInputRadioButton($"feel_unsteady{fall_risk_questions.feel_unsteady}");
                        form1.BindingInputRadioButton($"worry_about_falling_{fall_risk_questions.worry_about_falling}");
                        form1.BindingInputCheckBox($"intervention", Model.intervention.ConvertToDataTable());
                    }
                }

                d_bmi.Text = Model.vs_BMI;
                #endregion

                #region 8. Sàng lọc dinh dưỡng/ Nutrition screening
                lbl_previous_weight.Visible = false;
                previous_weight_wrapper.Visible = true;

                if (Model.nutritional_status_screening != null)
                {
                    dynamic nutritional_status_screening = Model.nutritional_status_screening?.ConvertToObject();
                    txt_previous_weight.Value = nutritional_status_screening.previous_weight;
                    d_weight_change.Text = nutritional_status_screening.weight_change;
                }

                #region - Tình trạng dinh dưỡng/ Nutrition status
                rad_ns_g.Disabled
                    = rad_ns_g_0.Disabled
                    = rad_ns_g_1.Disabled
                    = rad_ns_g_2.Disabled
                    = rad_ns_l.Disabled
                    = rad_ns_l_0.Disabled
                    = rad_ns_l_1.Disabled
                    = rad_ns_l_2.Disabled
                    = rad_ns_a.Disabled
                    = rad_ns_a_0.Disabled
                    = rad_ns_a_1.Disabled
                    = rad_ns_a_2.Disabled
                    = rad_ns_loss_weight_0.Disabled
                    = rad_ns_loss_weight_1.Disabled
                    = rad_ns_loss_weight_2.Disabled
                    = rad_ns_food_intake_0.Disabled
                    = rad_ns_food_intake_2.Disabled
                    = false;

                field_nutrition_status_l.Visible
                    = field_nutrition_status_g.Visible
                    = field_nutrition_status_a.Visible
                    = false;

                if (Model.nutritional_status != null)
                {
                    dynamic nutritional_status = Model.nutritional_status?.ConvertToObject();

                    //
                    form1.BindingInputRadioButton($"ns_{nutritional_status.ns_code}");
                    btc_change("field_nutrition_status", Convert.ToString(nutritional_status.ns_code));

                    form1.BindingInputRadioButton($"ns_{nutritional_status.ns_code}_{nutritional_status.ns_score}");
                    ns_age_score.Value = nutritional_status.ns_score;

                    #region - Sụt cân không chủ ý trong 3 tháng gần đây / Unintentional weight loss in the last 3 months
                    form1.BindingInputRadioButton($"ns_loss_weight_{nutritional_status.loss_weight}");
                    ns_loss_weight_score.Value = nutritional_status.loss_weight;
                    #endregion

                    #region - Khả năng ăn uống/ Food intake
                    form1.BindingInputRadioButton($"ns_food_intake_{nutritional_status.food_intake}");
                    ns_food_intake_score.Value = nutritional_status.food_intake;
                    #endregion

                    lbl_ns_total_score.Text = nutritional_status.total_score;

                    d_nutritional_conclude.Text = Model.nutritional_conclude;
                }
                #endregion
                #endregion
                #endregion

                #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT:
                form1.BindingInputRadioButton($"{nameof(Model.housing_code)}_{Model.housing_code}");
                #endregion

                #region IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
                form1.BindingInputRadioButton($"{nameof(Model.prioritization_code)}_{Model.prioritization_code}");

                if (Model.prioritization_code == PRIORITIZATION_CODE.IMMEDIATE_CONSULTING_REQUIREMENT)
                {
                    immediate_consulting_requirement.Visible = true;

                    form1.BindingInputCheckBox("im_consul_req", Model.immediate_consulting_requirement.ConvertToDataTable(), (KeyValuePair<string,object> item) => {
                        if(item.Key == "oth")
                        {
                            txt_im_consul_req_oth.Value = Convert.ToString(item.Value);
                        }
                        return 0;
                    });
                    field_im_consul_req_oth.Visible = cb_im_consul_req_oth.Checked;
                }
                else if (Model.prioritization_code == PRIORITIZATION_CODE.BE_ABLE_TO_WAIT_FOR_CONSULTATION_AT_A_SPECIFIC_TIME)
                {
                    immediate_consulting_requirement.Visible = false;
                }
                #endregion

                #region V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
                form1.BindingInputCheckBox("patient_education_needs", Model.patient_education_needs.ConvertToDataTable(), (KeyValuePair<string,object> item) =>
                {
                    if (item.Key == "oth")
                    {
                        txt_patient_edu_need_oth.Value = Convert.ToString(item.Value);
                    }
                    return 0;
                });
                #endregion

                #region 
                //form1.BindingInputRadioButton($"nutrition_status_code_{Model.nutrition_status_code}");
                #endregion
                
                DataObj.Value = JsonConvert.SerializeObject(Model);
                Session["docid"] = Model.document_id;
                WebHelpers.AddScriptFormEdit(Page, Model, (string)Session["emp_id"], Location);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormView()
        {
            try
            {
                txt_flacc_face.Visible
                    = txt_flacc_legs.Visible
                    = txt_flacc_activity.Visible
                    = txt_flacc_cry.Visible
                    = txt_flacc_consolability.Visible
                    = txt_npass_crying.Visible
                    = txt_npass_behavior.Visible
                    = txt_npass_facial_expression.Visible
                    = txt_npass_extremities_tone.Visible
                    = txt_npass_vital_signs.Visible
                    = txt_npass_gestation_3.Visible
                    = txt_npass_gestation_2.Visible
                    = txt_npass_gestation_1.Visible
                    = false;

                lbl_flacc_face.Visible
                    = lbl_flacc_legs.Visible
                    = lbl_flacc_activity.Visible
                    = lbl_flacc_cry.Visible
                    = lbl_flacc_consolability.Visible
                    = lbl_npass_crying.Visible
                    = lbl_npass_behavior.Visible
                    = lbl_npass_facial_expression.Visible
                    = lbl_npass_extremities_tone.Visible
                    = lbl_npass_vital_signs.Visible
                    = lbl_npass_gestation_3.Visible
                    = lbl_npass_gestation_2.Visible
                    = lbl_npass_gestation_1.Visible
                    = true;

                #region I. DẤU HIỆU SINH TỒN VÀ CÁC CHỈ SỐ ĐO LƯỜNG/ VITAL SIGNS AND PHYSICAL MEASUREMENTS
                lbl_vs_temperature.Text = Model.vs_temperature;
                lbl_vs_heart_rate.Text = Model.vs_heart_rate;
                lbl_vs_weight.Text = Model.vs_weight;
                lbl_vs_height.Text = Model.vs_height;
                lbl_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
                lbl_vs_bmi.Text = Model.vs_BMI;
                lbl_vs_blood_pressure.Text = Model.vs_blood_pressure;
                lbl_pulse.Text = Model.pulse;
                lbl_vs_spo2.Text = Model.vs_spO2;
                //lbl_assessment_date_time.Text = WebHelpers.FormatDateTime(Model.assessment_date_time, "dd-MM-yyyy HH:mm");
                #endregion

                #region II. ĐÁNH GIÁ/ ASSESSMENT

                #region 1. Lý do đến khám/ Chief complaint
                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                #endregion

                #region 2. Dị ứng/ Allergy
                lbl_allergy.Text = WebHelpers.GetBool(Model.allergy, $"Có, ghi rõ/ Yes, specify: {Model.allergy_note.ConvertToHtml()}");
                #endregion

                #region 3. Trạng thái tinh thần/ Mental status
                lbl_mental_status.Text = WebHelpers.GetBool(Model.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {Model.mental_status_note.ConvertToHtml()}");
                #endregion

                #region 4. Tầm soát bệnh lây nhiễm/ Communicable disease screening
                rad_high_fever_false.Disabled
                    = rad_high_fever_true.Disabled
                    = rad_contact_infectious_disease_false.Disabled
                    = rad_contact_infectious_disease_true.Disabled
                    = rad_close_contact_false.Disabled
                    = rad_close_contact_true.Disabled
                    = rad_injectious_risk_false.Disabled
                    = rad_injectious_risk_true.Disabled
                    = true;

                if (Model.communicable_disease_screening != null)
                {
                    dynamic communicable_disease_screening = JsonConvert.DeserializeObject(Model.communicable_disease_screening);

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_high_fever_" + communicable_disease_screening.high_fever);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_contact_infectious_disease_" + communicable_disease_screening.contact_infectious_disease);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_close_contact_" + communicable_disease_screening.close_contact);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_injectious_risk_" + communicable_disease_screening.injectious_risk);
                }
                #endregion

                #region 5. Đánh giá đau/ Pain assessment
                switch (Model.pain_assessment_type)
                {
                    case PAIN_ASSESSMENT_TYPE.NumericAndFaces:
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_paint_score_code_" + oina.paint_score_code);
                        rad_naf_true.Checked = true;
                        pain_assessment_change("field_naf");
                        lbl_paint_score_description.Text = WebHelpers.TextToHtmlTag(Model.paint_score_description);
                        break;
                    case PAIN_ASSESSMENT_TYPE.FLACC:
                        if (Model.flacc != null)
                        {
                            FLACC flacc = Model.FLACC();

                            lbl_flacc_face.Text = Convert.ToString(flacc.face);
                            lbl_flacc_legs.Text = Convert.ToString(flacc.legs);
                            lbl_flacc_activity.Text = Convert.ToString(flacc.activity);
                            lbl_flacc_cry.Text = Convert.ToString(flacc.cry);
                            lbl_flacc_consolability.Text = Convert.ToString(flacc.consolability);

                            d_flacc_total_score.Text = (flacc.face + flacc.legs + flacc.activity + flacc.cry + flacc.consolability).ToString();
                            d_flacc_conclude.Text = Model.flacc_conclude;
                        }
                        rad_flacc_true.Checked = true;
                        pain_assessment_change("field_flacc");
                        break;
                    case PAIN_ASSESSMENT_TYPE.N_PASS:
                        if (Model.npass != null)
                        {
                            dynamic npass = JsonConvert.DeserializeObject(Model.npass);
                            lbl_npass_crying.Text = npass.crying;
                            lbl_npass_behavior.Text = npass.behavior;
                            lbl_npass_facial_expression.Text = npass.facial_expression;
                            lbl_npass_extremities_tone.Text = npass.extremities_tone;
                            lbl_npass_vital_signs.Text = npass.vital_signs;
                            lbl_npass_gestation_3.Text = npass.gestation_3;
                            lbl_npass_gestation_2.Text = npass.gestation_2;
                            lbl_npass_gestation_1.Text = npass.gestation_1;

                            d_npass_total_score.Text = Convert.ToString(npass.total_score);
                            d_npass_conclude.Text = Model.npass_conclude;
                        }
                        rad_npass_true.Checked = true;
                        pain_assessment_change("field_npass");
                        break;
                    case PAIN_ASSESSMENT_TYPE.Non_Verbal:
                        rad_nonv_true.Checked = true;
                        break;
                }
                pain_assessment_scale_wrapper.Visible = false;
                #endregion

                #region 6. Trở ngại chăm sóc/ Barrier to care
                lbl_btc_language.Visible
                    = lbl_btc_cognitive.Visible
                    = lbl_btc_sensory.Visible
                    = lbl_btc_religious.Visible
                    = lbl_btc_cultural.Visible
                    = true;
                dynamic barrier_to_care = JsonConvert.DeserializeObject(Model.barrier_to_care);

                btc_language_wrapper.Visible = false;

                lbl_btc_language.Text = barrier_to_care.btc_language != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_language)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_language_note)}")) : "";

                btc_cognitive_wrapper.Visible = false;
                lbl_btc_cognitive.Text = barrier_to_care.btc_cognitive != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_cognitive)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_cognitive_note)}")) : "";

                btc_sensory_wrapper.Visible = false;
                lbl_btc_sensory.Text = barrier_to_care.btc_sensory != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_sensory)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_sensory_note)}")) : "";

                btc_religious_wrapper.Visible = false;
                lbl_btc_religious.Text = barrier_to_care.btc_religious != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_religious)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_religious_note)}")) : "";

                btc_cultural_wrapper.Visible = false;
                lbl_btc_cultural.Text = barrier_to_care.btc_cultural != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_cultural)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_cultural_note)}")) : "";
                
                #endregion

                #region 7. Tầm soát nguy cơ té ngã/ Fall risk screening
                lbl_no_fall_risk.Visible
                    = lbl_fallen.Visible
                    = lbl_feel_unsteady.Visible
                    = lbl_worry_about_falling.Visible
                    = true;

                no_fall_risk_wrapper.Visible = false;
                if (!string.IsNullOrEmpty(Model.fall_risk_factors))
                {
                    #region - Các yếu tố nguy cơ/ Fall risk factors
                    lbl_no_fall_risk.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.fall_risk_factors));

                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_fall_risk_factors_", WebHelpers.GetJSONToDataTable(Model.fall_risk_factors));

                    var cb_FallRiskFactors_nfr = FindControl("rad_no_fall_risks_" + cb_fall_risk_factors_nfr.Checked);

                    if (cb_FallRiskFactors_nfr != null)
                    {
                        //btc_change("field_nutrition_status", Convert.ToString(nutritional_status.ns_code));
                        ((HtmlInputRadioButton)cb_FallRiskFactors_nfr).Checked = true;
                    }

                    rad_fallen_false.Checked = cb_fall_risk_factors_nfr.Checked;

                    field_no_fall_risks_false.Visible = !cb_fall_risk_factors_nfr.Checked;
                    #endregion

                    if (!cb_fall_risk_factors_nfr.Checked)
                    {
                        fall_risk_factors_field.Visible
                            = fallen_field.Visible
                            = feel_unsteady_field.Visible
                            = worry_about_falling_field.Visible
                            = intervention_field.Visible
                            = false;

                        #region - Câu hỏi sàng lọc/ The fall risk screen question
                        if (Model.fall_risk_questions != null)
                        {
                            dynamic fall_risk_questions = JsonConvert.DeserializeObject(Model.fall_risk_questions);

                            lbl_fallen.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(fall_risk_questions.fallen))));
                            lbl_feel_unsteady.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(fall_risk_questions.feel_unsteady))));
                            lbl_worry_about_falling.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(fall_risk_questions.worry_about_falling))));
                        }
                        #endregion
                        //
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fallen_" + fall_risk_questions.fallen);
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_feel_unsteady_" + fall_risk_questions.feel_unsteady);
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_worry_about_falling_" + fall_risk_questions.worry_about_falling);
                        #region - Can thiệp/ Intervention
                        lbl_intervention.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.intervention));
                        #endregion
                        //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_intervention_", WebHelpers.GetJSONToDataTable(oina.intervention));
                    }
                }
                #endregion

                #region 8. Sàng lọc dinh dưỡng/ Nutrition screening
                d_bmi.Text = Model.vs_BMI;
                previous_weight_wrapper.Visible = false;
                lbl_previous_weight.Visible = true;
                if (Model.nutritional_status_screening != null)
                {
                    dynamic nutritional_status_screening = JsonConvert.DeserializeObject(Model.nutritional_status_screening);

                    lbl_previous_weight.Text = nutritional_status_screening.previous_weight;
                    d_weight_change.Text = nutritional_status_screening.weight_change;
                }

                #region - Tình trạng dinh dưỡng/ Nutrition status:
                field_nutrition_status_l.Visible
                    = field_nutrition_status_g.Visible
                    = field_nutrition_status_a.Visible
                    = false;

                rad_ns_g.Disabled
                    = rad_ns_g_0.Disabled
                    = rad_ns_g_1.Disabled
                    = rad_ns_g_2.Disabled
                    = rad_ns_l.Disabled
                    = rad_ns_l_0.Disabled
                    = rad_ns_l_1.Disabled
                    = rad_ns_l_2.Disabled
                    = rad_ns_a.Disabled
                    = rad_ns_a_0.Disabled
                    = rad_ns_a_1.Disabled
                    = rad_ns_a_2.Disabled
                    = rad_ns_loss_weight_0.Disabled
                    = rad_ns_loss_weight_1.Disabled
                    = rad_ns_loss_weight_2.Disabled
                    = rad_ns_food_intake_0.Disabled
                    = rad_ns_food_intake_2.Disabled
                    = true;

                if (Model.nutritional_status != null)
                {
                    dynamic nutritional_status = JsonConvert.DeserializeObject(Model.nutritional_status);

                    //
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + nutritional_status.ns_code);
                    btc_change("field_nutrition_status", Convert.ToString(nutritional_status.ns_code));

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + nutritional_status.ns_code + "_" + nutritional_status.ns_score);
                    ns_age_score.Value = nutritional_status.ns_score;

                    #region - Sụt cân không chủ ý trong 3 tháng gần đây/ Unintentional weight loss in the last 3 months:
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_loss_weight_" + nutritional_status.loss_weight);
                    ns_loss_weight_score.Value = nutritional_status.loss_weight;
                    #endregion

                    #region - Khả năng ăn uống/ Food intake
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_food_intake_" + nutritional_status.food_intake);
                    ns_food_intake_score.Value = nutritional_status.food_intake;
                    #endregion

                    lbl_ns_total_score.Text = nutritional_status.total_score;

                    d_nutritional_conclude.Text = Model.nutritional_conclude;
                }
                #endregion
                #endregion
                
                #endregion

                #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT
                lbl_housing_description.Text = Model.housing_description.ConvertToHtml();
                #endregion

                #region IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
                immediate_consulting_requirement.Visible = false;
                lbl_prioritization_description.Text = Model.prioritization_description.ConvertToHtml();
                lbl_immediate_consulting_requirement.Text = EMRHelpers.JSON_STR_SEPARATION(Model.immediate_consulting_requirement);
                #endregion

                #region V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
                lbl_patient_education_needs.Text = EMRHelpers.JSON_STR_SEPARATION(Model.patient_education_needs);
                #endregion
                //lbl_assessment_date_time.Text = WebHelpers.FormatDateTime(oina.assessment_date_time, "dd-MM-yyyy HH:mm");
                
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormPrint()
        {
            //try
            //{
            //    prt_fullname.Text = $"{patientInfo.FullName} ({patientInfo.Title})";
            //    prt_DOB.Text = $"{WebHelpers.FormatDateTime(patientInfo.DOB)} | {patientInfo.Gender}";
            //    prt_vpid.Text = patientInfo.visible_patient_id;

            //    WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);

            //    prt_vs_temperature.Text = oina.vs_temperature;
            //    prt_vs_weight.Text = oina.vs_weight;
            //    prt_vs_height.Text = oina.vs_height;
            //    prt_vs_BMI.Text = oina.vs_BMI;
            //    prt_pulse.Text = oina.vs_heart_rate;
            //    prt_vs_respiratory_rate.Text = oina.vs_respiratory_rate;
            //    prt_vs_blood_pressure.Text = oina.vs_blood_pressure;
            //    prt_vs_spO2.Text = oina.vs_spO2;

            //    prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(oina.chief_complaint);

            //    prt_allergy.Text = WebHelpers.GetBool(oina.allergy, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(oina.allergy_note));

            //    prt_mental_status.Text = WebHelpers.CreateOptions(new Option { Text = "Có/ Yes", Value = true }, new Option { Text = "Không, ghi rõ/ No, specify: " + WebHelpers.TextToHtmlTag(oina.mental_status_note), Value = false }, oina.mental_status, "display: grid; grid-template-columns: 80px 1fr");

            //    prt_paint_score_code.Text = oina.paint_score_code;

            //    prt_fall_risk.Text = WebHelpers.GetBool(oina.fall_risk, "Có, cung cấp phương tiện hỗ trợ/ Yes, provide assistance: " + WebHelpers.TextToHtmlTag(oina.fall_risk_assistance), "Không có nguy cơ/ No risk");

            //    prt_nutrition_status_code.Text = oina.nutrition_status_description;

            //    prt_housing.Text = WebHelpers.CreateOptions(Oina.HOUSING_CODE, (string)oina.housing_code, "display: grid; grid-template-columns: 1fr 1fr");

            //    string signature_date = WebHelpers.FormatDateTime(SignatureDate, "dd-MM-yyyy HH:mm", "");

            //    prt_prioritization_code.Text = WebHelpers.TextToHtmlTag(oina.prioritization_description);

            //    prt_signature_date.Text = "Ngày/ Date: " + signature_date;
            //    prt_signature_name.Text = SignatureName;

            //}
            //catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion
    
        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Model = new OinaRv03(varDocID, Location);
                Model.status = DocumentStatus.FINAL;

                UpdateModel();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Model = new OinaRv03(varDocID, Location);
                Model.status = DocumentStatus.DRAFT;

                UpdateModel();
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Model = new OinaRv03(varDocID, Location);
                
                dynamic result = Model.Delete(UserId, Location)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, Location);
                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={Location}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, EmpId, Location, LocationChanged, AccessAuthorize))
            {
                Model = new OinaRv03(varDocID, Location);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                WebHelpers.LoadFormControl(form1, Model, ControlState.Edit, IsViewLog, !IsLocationChanged, AccessAuthorize);
                BindingDataFormEdit();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, Location);
            Init_Page();
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={Location}");
        }
        #endregion

        #region METHODS
        
        public override void UpdateModel()
        {
            try
            {
                #region I. DẤU HIỆU SINH TỒN VÀ CÁC CHỈ SỐ ĐO LƯỜNG/ VITAL SIGNS AND PHYSICAL MEASUREMENTS
                Model.vs_temperature = txt_vs_temperature.Value;
                Model.vs_heart_rate = txt_vs_heart_rate.Value;
                Model.vs_weight = txt_vs_weight.Value;
                Model.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                Model.vs_height = txt_vs_height.Value;
                Model.vs_blood_pressure = txt_vs_blood_pressure.Value;
                Model.vs_BMI = txt_vs_bmi.Value;
                Model.vs_spO2 = txt_vs_spo2.Value;
                Model.pulse = txt_pulse.Value;
                #endregion

                #region II. ĐÁNH GIÁ/ ASSESSMENT

                #region 1. Lý do đến khám/ Chief complaint
                Model.chief_complaint = txt_chief_complaint.Value;
                #endregion

                #region 2. Dị ứng/ Allergy
                Model.allergy = FindHtmlInputRadioButton(form1, nameof(Model.allergy));
                Model.allergy_note = EMRHelpers.ConvertBooleanToString(Model.allergy, txt_allergy_note.Value, string.Empty);
                #endregion

                #region 3. Trạng thái tinh thần/ Mental status
                Model.mental_status = FindHtmlInputRadioButton(form1, nameof(Model.mental_status));
                Model.mental_status_note = EMRHelpers.ConvertBooleanToString(Model.mental_status, string.Empty, txt_mental_status_note.Value);
                #endregion

                #region 4. Tầm soát bệnh lây nhiễm (dành cho những bệnh tạo thành dịch)/ Communicable disease screening (for diseases that cause epidemics)
                COMMUNICABLE_DISEASE_SCREENING communicable_disease_screening = new COMMUNICABLE_DISEASE_SCREENING()
                {
                    high_fever = FindHtmlInputRadioButton(form1, nameof(COMMUNICABLE_DISEASE_SCREENING.high_fever)),
                    contact_infectious_disease = FindHtmlInputRadioButton(form1, nameof(COMMUNICABLE_DISEASE_SCREENING.contact_infectious_disease)),
                    close_contact = FindHtmlInputRadioButton(form1, nameof(COMMUNICABLE_DISEASE_SCREENING.close_contact)),
                    injectious_risk = FindHtmlInputRadioButton(form1, nameof(COMMUNICABLE_DISEASE_SCREENING.injectious_risk))
                };
                Model.communicable_disease_screening = JsonConvert.SerializeObject(communicable_disease_screening);
                #endregion

                #region 5. Đánh giá đau/ Pain assessment
                Model.paint_score_code = null;
                Model.paint_score_description = null;
                Model.flacc = null;
                Model.flacc_conclude = null;
                Model.npass = null;
                Model.npass_conclude = null;
                
                if (rad_naf_true.Checked)
                {
                    Model.pain_assessment_type = PAIN_ASSESSMENT_TYPE.NumericAndFaces;
                    Model.paint_score_code = form1.HtmlInputRadioButton(nameof(Model.paint_score_code), EmrDictionary.PAINT_SCORE_CODE); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                    Model.paint_score_description = WebHelpers.GetDicDesc(Model.paint_score_code, Oina.PAINT_SCORE_CODE);
                }
                else if (rad_flacc_true.Checked)
                {
                    Model.pain_assessment_type = PAIN_ASSESSMENT_TYPE.FLACC;
                    dynamic flacc = new System.Dynamic.ExpandoObject();

                    flacc.face = txt_flacc_face.Value;
                    flacc.legs = txt_flacc_legs.Value;
                    flacc.activity = txt_flacc_activity.Value;
                    flacc.cry = txt_flacc_cry.Value;
                    flacc.consolability = txt_flacc_consolability.Value;
                    flacc.total_score = CalculateFLACC();

                    Model.flacc = JsonConvert.SerializeObject(flacc);
                    Model.flacc_conclude = d_flacc_conclude.Text;
                }
                else if (rad_npass_true.Checked)
                {
                    Model.pain_assessment_type = PAIN_ASSESSMENT_TYPE.N_PASS;
                    dynamic npass = new System.Dynamic.ExpandoObject();

                    npass.crying = txt_npass_crying.Value;
                    npass.behavior = txt_npass_behavior.Value;
                    npass.facial_expression = txt_npass_facial_expression.Value;
                    npass.extremities_tone = txt_npass_extremities_tone.Value;
                    npass.vital_signs = txt_npass_vital_signs.Value;
                    npass.gestation_3 = txt_npass_gestation_3.Value;
                    npass.gestation_2 = txt_npass_gestation_2.Value;
                    npass.gestation_1 = txt_npass_gestation_1.Value;
                    npass.total_score = CalculateNPASS();

                    Model.npass = JsonConvert.SerializeObject(npass);
                    Model.npass_conclude = d_npass_conclude.Text;
                }
                else if (rad_nonv_true.Checked)
                {
                    Model.pain_assessment_type = PAIN_ASSESSMENT_TYPE.Non_Verbal;
                }
                #endregion

                #region 6. Trở ngại chăm sóc/ Barrier to care
                BARRIER_TO_CARE barrier_to_care = new BARRIER_TO_CARE();
                barrier_to_care.btc_language = FindHtmlInputRadioButton(form1, nameof(BARRIER_TO_CARE.btc_language));
                barrier_to_care.btc_cognitive = FindHtmlInputRadioButton(form1, nameof(BARRIER_TO_CARE.btc_cognitive));
                barrier_to_care.btc_sensory = FindHtmlInputRadioButton(form1, nameof(BARRIER_TO_CARE.btc_sensory));
                barrier_to_care.btc_religious = FindHtmlInputRadioButton(form1, nameof(BARRIER_TO_CARE.btc_religious));
                barrier_to_care.btc_cultural = FindHtmlInputRadioButton(form1, nameof(BARRIER_TO_CARE.btc_cultural));
                barrier_to_care.btc_language_note = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_language, txt_btc_language_note.Value, string.Empty);
                barrier_to_care.btc_cognitive_note = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_cognitive, txt_btc_cognitive_note.Value, string.Empty);
                barrier_to_care.btc_sensory_note = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_sensory, txt_btc_sensory_note.Value, string.Empty);
                barrier_to_care.btc_religious_note = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_religious, txt_btc_religious_note.Value, string.Empty);
                barrier_to_care.btc_cultural_note = EMRHelpers.ConvertBooleanToString(barrier_to_care.btc_cultural, txt_btc_cultural_note.Value, string.Empty);
                Model.barrier_to_care = barrier_to_care.ToString();
                #endregion

                #region 7. Tầm soát nguy cơ té ngã/ Fall risk screening
                //- Các yếu tố nguy cơ/ Fall risk factors:

                string fall_risk_questions_result = null;
                string intervention_result = null;

                if (rad_no_fall_risks_false.Checked)
                {
                    //- Câu hỏi sàng lọc/ The fall risk screen question:
                    FALL_RISK_QUESTION fall_risk_questions = new FALL_RISK_QUESTION();
                    fall_risk_questions.fallen = FindHtmlInputRadioButton(form1, nameof(FALL_RISK_QUESTION.fallen));
                    fall_risk_questions.feel_unsteady = FindHtmlInputRadioButton(form1, nameof(FALL_RISK_QUESTION.feel_unsteady));
                    fall_risk_questions.worry_about_falling = FindHtmlInputRadioButton(form1, nameof(FALL_RISK_QUESTION.worry_about_falling));
                    fall_risk_questions_result = fall_risk_questions.ToString();

                    //- Can thiệp/ Intervention:
                    intervention_result = JsonConvert.SerializeObject(FindHtmlInputCheckBox(form1, nameof(Model.intervention), EmrDictionary.INTERVENTION));
                }

                Model.fall_risk_questions = fall_risk_questions_result;
                Model.intervention = intervention_result;
                Model.fall_risk_factors = JsonConvert.SerializeObject(FindHtmlInputCheckBox(form1, nameof(Model.fall_risk_factors), EmrDictionary.FALL_RISK_FACTORS));
                #endregion

                #region 8. Đánh giá tình trạng dinh dưỡng/ Nutritional status screening

                NUTRITION_SCREENING nutrition_screening = new NUTRITION_SCREENING();
                if (!string.IsNullOrEmpty(txt_previous_weight.Value))
                {
                    nutrition_screening.previous_weight = Convert.ToDouble(txt_previous_weight.Value);
                }
                if (!string.IsNullOrEmpty(d_weight_change.Text))
                {
                    nutrition_screening.weight_change = Convert.ToDouble(d_weight_change.Text);
                }
                Model.nutritional_status_screening = nutrition_screening.ToString();

                //- Tình trạng dinh dưỡng/ Nutrition status:
                NUTRITION_STATUS nutrition_status = new NUTRITION_STATUS();

                nutrition_status.ns_code = "";
                nutrition_status.ns_score = "";

                string[] nutrition_status_code = new string[] { "l", "g", "a" };
                int[] nutrition_status_score = new int[] { 2, 1, 0 };

                foreach (string code in nutrition_status_code)
                {
                    var control = FindControl("rad_ns_" + code);
                    int? ScoreTemp = null;
                    if (control != null && ((HtmlInputRadioButton)control).Checked)
                    {
                        foreach (int score in nutrition_status_score)
                        {
                            var control1 = FindControl("rad_ns_" + code + "_" + score.ToString());

                            if (control1 != null && ((HtmlInputRadioButton)control1).Checked)
                            {
                                ScoreTemp = score;
                                break;
                            }

                        }
                        nutrition_status.ns_code = code;
                        nutrition_status.ns_score = ScoreTemp;
                        break;
                    }
                }

                #region - Sụt cân không chủ ý trong 3 tháng gần đây/Unintentional weight loss in the last 3 months:
                int? LossWeight = null;
                for (int i = 0; i <= 2; i++)
                {
                    var control1 = FindControl("rad_ns_loss_weight_" + i);

                    if (control1 != null && ((HtmlInputRadioButton)control1).Checked)
                    {
                        LossWeight = i;
                        break;
                    }
                }
                #endregion

                nutrition_status.loss_weight = LossWeight;

                #region - Khả năng ăn uống/ Food intake:
                int? FoodIntake = null;

                if (rad_ns_food_intake_0.Checked) FoodIntake = 0;
                else if (rad_ns_food_intake_2.Checked) FoodIntake = 2;
                nutrition_status.food_intake = FoodIntake;
                #endregion

                nutrition_status.total_score = nutrition_status.ns_score + LossWeight + FoodIntake;

                Model.nutritional_status = nutrition_status.ToString();

                Model.nutritional_conclude = d_nutritional_conclude.Text;
                #endregion

                #endregion

                #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT
                Model.housing_code = FindHtmlInputRadioButton(form1, nameof(Model.housing_code), EmrDictionary.HOUSING_CODE); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", );
                Model.housing_description = WebHelpers.GetDicDesc(Model.housing_code, EmrDictionary.HOUSING_CODE);
                #endregion

                #region
                //dynamic communicable_disease_screening = new System.Dynamic.ExpandoObject();
                //communicable_disease_screening.high_fever = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_high_fever_");
                //communicable_disease_screening.contact_infectious_disease = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_contact_infectious_disease_");
                //communicable_disease_screening.close_contact = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_close_contact_");
                //communicable_disease_screening.injectious_risk = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_injectious_risk_");

                //Model.communicable_disease_screening = JsonConvert.SerializeObject(communicable_disease_screening);

                ////5. Đánh giá đau/ Pain assessment:

                //string[] PainAsessmentTypes = new string[] { "NAF", "FLACC", "NPASS", "NONV" };

                ////
                //Model.paint_score_code = null;
                //Model.paint_score_description = null;
                //Model.flacc = null;
                //Model.flacc_conclude = null;
                //Model.npass = null;
                //Model.npass_conclude = null;

                //if (rad_naf_true.Checked)
                //{
                //    Model.paint_score_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                //    Model.paint_score_description = WebHelpers.GetDicDesc(Model.paint_score_code, Oina.PAINT_SCORE_CODE);
                //}
                //else if (rad_flacc_true.Checked)
                //{
                //    dynamic flacc = new System.Dynamic.ExpandoObject();

                //    flacc.face = txt_flacc_face.Text;
                //    flacc.legs = txt_flacc_legs.Text;
                //    flacc.activity = txt_flacc_activity.Text;
                //    flacc.cry = txt_flacc_cry.Text;
                //    flacc.consolability = txt_flacc_consolability.Text;
                //    flacc.total_score = CalculateFLACC();

                //    Model.flacc = JsonConvert.SerializeObject(flacc);
                //    Model.flacc_conclude = lbl_flacc_conclude1.Text;
                //}
                //else if (rad_npass_true.Checked)
                //{
                //    dynamic npass = new System.Dynamic.ExpandoObject();

                //    npass.crying = txt_npass_crying.Text;
                //    npass.behavior = txt_npass_behavior.Text;
                //    npass.facial_expression = txt_npass_facial_expression.Text;
                //    npass.extremities_tone = txt_npass_extremities_tone.Text;
                //    npass.vital_signs = txt_npass_vital_signs.Text;
                //    npass.gestation_3 = txt_npass_gestation_3.Text;
                //    npass.gestation_2 = txt_npass_gestation_2.Text;
                //    npass.gestation_1 = txt_npass_gestation_1.Text;
                //    npass.total_score = CalculateNPASS();

                //    Model.npass = JsonConvert.SerializeObject(npass);
                //    Model.npass_conclude = lbl_npass_conclude1.Text;
                //}
                ////:



                #endregion



                ////IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION


                //if (Model.prioritization_code == "IM")
                //{
                //    WebHelpers.GetCheckBox(form1, "cb_im_consul_req_", IM_CONSUL_REQ, out DataTable dtb_im_consul_req);
                //    string dtb_im_consul_req_result = null;
                //    if (cb_im_consul_req_oth.Checked)
                //    {
                //        foreach (DataRow dtRow in dtb_im_consul_req.Rows)
                //        {
                //            if (Convert.ToString(dtRow["code"]) == "OTH")
                //            {
                //                dtRow["desc"] = txt_im_consul_req_oth.Value;
                //            }
                //        }
                //    }

                //    if (dtb_im_consul_req.Rows.Count > 0)
                //    {
                //        dtb_im_consul_req_result = JsonConvert.SerializeObject(dtb_im_consul_req);
                //    }

                //    Model.immediate_consulting_requirement = dtb_im_consul_req_result;
                //}
                ////V. NHU CẦU GIÁO DỤC SỨC KHỎE/PATIENT EDUCATION NEEDS
                ////dynamic p_edu_needs = new System.Dynamic.ExpandoObject();

                //WebHelpers.GetCheckBox(form1, "cb_patient_education_need_", PATIENT_EDUCATION_NEEDS, out DataTable dtb_patient_edu_need);
                //string dtb_patient_edu_need_result = null;
                //if (cb_patient_education_need_oth.Checked)
                //{
                //    foreach (DataRow dtRow in dtb_patient_edu_need.Rows)
                //    {
                //        if (Convert.ToString(dtRow["code"]) == "OTH")
                //        {
                //            dtRow["desc"] = txt_patient_edu_need_oth.Value;
                //        }
                //    }
                //}

                //if (dtb_patient_edu_need.Rows.Count > 0)
                //{
                //    dtb_patient_edu_need_result = JsonConvert.SerializeObject(dtb_patient_edu_need);
                //}

                //Model.patient_education_needs = dtb_patient_edu_need_result; ;

                ////oina.paint_score_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                ////oina.paint_score_description = WebHelpers.GetDicDesc(oina.paint_score_code, Oina.PAINT_SCORE_CODE);
                //////5.
                ////oina.fall_risk = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_risk_");
                //////oina.fall_risk_assistance = WebHelpers.GetBool(oina.fall_risk, txt_fall_risk_assistance.Value, null);

                ////oina.nutrition_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_", Oina.NUTRITION_STATUS_CODE);
                ////oina.nutrition_status_description = WebHelpers.GetDicDesc(oina.nutrition_status_code, Oina.NUTRITION_STATUS_CODE);

                //Model.housing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_housing_code_", Oina.HOUSING_CODE);
                //Model.housing_description = WebHelpers.GetDicDesc(Model.housing_code, Oina.HOUSING_CODE);

                ////oina.prioritization_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", Oina.PRIORITIZATION_CODE);
                ////oina.prioritization_description = WebHelpers.GetDicDesc(oina.prioritization_code, Oina.PRIORITIZATION_CODE);

                //Model.assessment_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Now);

                ////if (JsonConvert.SerializeObject(oina) == DataObj.Value)
                ////{
                ////    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                ////}

                ////

                //Model.amend_reason = txt_amend_reason.Text;
                //Model.user_name = (string)Session["UserID"];

                //dynamic result = Model.Update(Location)[0];
                //if (result.Status == System.Net.HttpStatusCode.OK)
                //{
                //    WebHelpers.Notification(Page, CONST_MESSAGE.MESSAGE_SAVE_SUCCESS);
                //    Initial();
                //}
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = PAGE_URL + $"&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        private void btc_change(string field, string value)
        {
            var control = FindControl($"{field}_{value}");
            if (control != null)
            {
                control.Visible = true;
            }
        }
        private void pain_assessment_change(string value)
        {
            var control = FindControl($"{value}");

            if (control != null)
            {
                control.Visible = true;
            }
        }
        private void mental_status_change(string value)
        {
            field_mental_status_false.Visible = false;
            btc_change("field_mental_status", value);
        }
        private void LoadPainAssessmentScale(string scale)
        {
            field_naf.Visible
                = field_flacc.Visible
                = field_npass.Visible
                = field_nonv.Visible
                = false;
            switch (scale)
            {
                case PAIN_ASSESSMENT_TYPE.NumericAndFaces:
                    form1.BindingInputRadioButton("paint_score_code_" + Model.paint_score_code);
                    rad_naf_true.Checked = true;
                    pain_assessment_change("field_naf");
                    break;
                case PAIN_ASSESSMENT_TYPE.FLACC:
                    if (Model.flacc != null)
                    {
                        FLACC flacc = Model.FLACC();

                        txt_flacc_face.Value = Convert.ToString(flacc.face);
                        txt_flacc_legs.Value = Convert.ToString(flacc.legs);
                        txt_flacc_activity.Value = Convert.ToString(flacc.activity);
                        txt_flacc_cry.Value = Convert.ToString(flacc.cry);
                        txt_flacc_consolability.Value = Convert.ToString(flacc.consolability);

                        d_flacc_total_score.Text = (flacc.face + flacc.legs + flacc.activity + flacc.cry + flacc.consolability).ToString();
                        d_flacc_conclude.Text = Model.flacc_conclude;
                    }
                    rad_flacc_true.Checked = true;
                    pain_assessment_change("field_flacc");
                    break;
                case PAIN_ASSESSMENT_TYPE.N_PASS:
                    if (Model.npass != null)
                    {
                        dynamic npass = JsonConvert.DeserializeObject(Model.npass);
                        txt_npass_crying.Value = npass.crying;
                        txt_npass_behavior.Value = npass.behavior;
                        txt_npass_facial_expression.Value = npass.facial_expression;
                        txt_npass_extremities_tone.Value = npass.extremities_tone;
                        txt_npass_vital_signs.Value = npass.vital_signs;
                        txt_npass_gestation_3.Value = npass.gestation_3;
                        txt_npass_gestation_2.Value = npass.gestation_2;
                        txt_npass_gestation_1.Value = npass.gestation_1;

                        d_npass_total_score.Text = Convert.ToString(npass.total_score);
                        d_npass_conclude.Text = Model.npass_conclude;
                    }
                    rad_npass_true.Checked = true;
                    pain_assessment_change("field_npass");
                    break;
                case PAIN_ASSESSMENT_TYPE.Non_Verbal:
                    rad_nonv_true.Checked = true;
                    break;
            }
        }
        private void no_fall_risks_change()
        {
            foreach(KeyValuePair<string, string> dictionary in EmrDictionary.FALL_RISK_FACTORS)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl($"cb_fall_risk_factors_{dictionary.Key}")).Checked = false;
                }
                catch(Exception ex) 
                { 
                    Console.WriteLine(ex.Message);
                }
            }

            rad_fallen_false.Checked
                    = rad_feel_unsteady_false.Checked
                    = rad_worry_about_falling_false.Checked
                    = true;

            foreach (KeyValuePair<string, string> dictionary in EmrDictionary.INTERVENTION)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl($"cb_intervention_{dictionary.Key}")).Checked = false;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }

            if (rad_no_fall_risks_true.Checked)
            {
                cb_fall_risk_factors_nfr.Checked = true;
            }
            else
            {
                cb_fall_risk_factors_nfr.Checked = false;
            }

            field_no_fall_risks_false.Visible = false;

            btc_change("field_no_fall_risks", Request["__EVENTARGUMENT"]);
        }
        private void prioritization_change()
        {
            immediate_consulting_requirement.Visible = rad_prioritization_code_im.Checked;
        }
        private void NutritionStatusScoreChange()
        {
            int? NSTotalScore = null;
            int NSAgeScore = !string.IsNullOrEmpty(ns_age_score.Value) ? Convert.ToInt32(ns_age_score.Value) : 0;
            int NSLossWeightScore = !string.IsNullOrEmpty(ns_loss_weight_score.Value) ? Convert.ToInt32(ns_loss_weight_score.Value) : 0;
            int NSFoodIntakeScore = !string.IsNullOrEmpty(ns_food_intake_score.Value) ? Convert.ToInt32(ns_food_intake_score.Value) : 0;

            if (!string.IsNullOrEmpty(ns_age_score.Value)
                || !string.IsNullOrEmpty(ns_loss_weight_score.Value)
                || !string.IsNullOrEmpty(ns_loss_weight_score.Value))
            {
                NSTotalScore = NSAgeScore + NSLossWeightScore + NSFoodIntakeScore;
                lbl_ns_total_score.Text = NSTotalScore.ToString();

                switch (NSTotalScore)
                {
                    case 0:
                        d_nutritional_conclude.Text = "Không có nguy cơ thiếu dinh dưỡng/ No risk of malnutrition (0)";
                        break;
                    case 1:
                        d_nutritional_conclude.Text = "Nguy cơ thiếu dinh dưỡng thấp/ Low risk of malnutrition (1)";
                        break;
                    default:
                        d_nutritional_conclude.Text = "Nguy cơ thiếu dinh dưỡng cao/ High risk of malnutrition (≥ 2)";
                        break;
                }
            }
        }
        private int? CalculateNutritionStatusScore()
        {
            int? NSTotalScore = null;
            int NSAgeScore = !string.IsNullOrEmpty(ns_age_score.Value) ? Convert.ToInt32(ns_age_score.Value) : 0;
            int NSLossWeightScore = !string.IsNullOrEmpty(ns_loss_weight_score.Value) ? Convert.ToInt32(ns_loss_weight_score.Value) : 0;
            int NSFoodIntakeScore = !string.IsNullOrEmpty(ns_food_intake_score.Value) ? Convert.ToInt32(ns_food_intake_score.Value) : 0;
            if (!string.IsNullOrEmpty(ns_age_score.Value)
                || !string.IsNullOrEmpty(ns_loss_weight_score.Value)
                || !string.IsNullOrEmpty(ns_loss_weight_score.Value))
            {
                NSTotalScore = NSAgeScore + NSLossWeightScore + NSFoodIntakeScore;
            }
            return NSTotalScore;
        }
        private int CalculateFLACC()
        {
            int face = string.IsNullOrEmpty(txt_flacc_face.Value) ? 0 : Convert.ToInt32(txt_flacc_face.Value);
            int legs = string.IsNullOrEmpty(txt_flacc_legs.Value) ? 0 : Convert.ToInt32(txt_flacc_legs.Value);
            int activity = string.IsNullOrEmpty(txt_flacc_activity.Value) ? 0 : Convert.ToInt32(txt_flacc_activity.Value);
            int cry = string.IsNullOrEmpty(txt_flacc_cry.Value) ? 0 : Convert.ToInt32(txt_flacc_cry.Value);
            int consolability = string.IsNullOrEmpty(txt_flacc_consolability.Value) ? 0 : Convert.ToInt32(txt_flacc_consolability.Value);
            int FLACCTotalScore = face + legs + activity + cry + consolability;

            return FLACCTotalScore;
        }
        private int CalculateNPASS()
        {
            int NpassCrying = string.IsNullOrEmpty(txt_npass_crying.Value) ? 0 : Convert.ToInt32(txt_npass_crying.Value);
            int NpassBehavior = string.IsNullOrEmpty(txt_npass_behavior.Value) ? 0 : Convert.ToInt32(txt_npass_behavior.Value);
            int NpassFacialExpression = string.IsNullOrEmpty(txt_npass_facial_expression.Value) ? 0 : Convert.ToInt32(txt_npass_facial_expression.Value);
            int NpassExtremitiesTone = string.IsNullOrEmpty(txt_npass_extremities_tone.Value) ? 0 : Convert.ToInt32(txt_npass_extremities_tone.Value);
            int NpassVitalSigns = string.IsNullOrEmpty(txt_npass_vital_signs.Value) ? 0 : Convert.ToInt32(txt_npass_vital_signs.Value);
            int NpassGestation3 = string.IsNullOrEmpty(txt_npass_gestation_3.Value) ? 0 : Convert.ToInt32(txt_npass_gestation_3.Value);
            int NpassGestation2 = string.IsNullOrEmpty(txt_npass_gestation_2.Value) ? 0 : Convert.ToInt32(txt_npass_gestation_2.Value);
            int NpassGestation1 = string.IsNullOrEmpty(txt_npass_gestation_1.Value) ? 0 : Convert.ToInt32(txt_npass_gestation_1.Value);

            int NPASSTotalScore = NpassCrying + NpassBehavior + NpassFacialExpression + NpassExtremitiesTone + NpassVitalSigns + NpassGestation3 + NpassGestation2 + NpassGestation1;
            return NPASSTotalScore;
        }
        #endregion

        #region Validation
        protected void CustomValidatorAllergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_allergy_note.Value.Length <= 256;
        }
        protected void CustomValidatorMentalStatusNote_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_mental_status_note.Value.Length <= 256;
        }
        protected void CustomValidatorFallRiskAssistance_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //args.IsValid = txt_fall_risk_assistance.Value.Length <= 256;
        }
        
        protected void CustomValidatorMentalStatus_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_mental_status_true.Checked || rad_mental_status_false.Checked;
        }

        protected void CustomValidatorFallRisk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //args.IsValid = rad_fall_risk_true.Checked || rad_fall_risk_false.Checked;
        }

        public void Initial()
        {
            throw new NotImplementedException();
        }

        public void BindingDataForm(bool state)
        {
            throw new NotImplementedException();
        }
        #endregion

    }
}
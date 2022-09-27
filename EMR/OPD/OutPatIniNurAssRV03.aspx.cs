using EMR.Classes;
using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class OutPatIniNurAssRV03 : EmrPage, IEmrFormModel<OinaRv03>
    {
        public override string form_url { get; set; } = "OPD/OutPatIniNurAssRV03";
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

                HideControl(btnCancel, amendReasonWraper);

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
                    allergy_change(Request["__EVENTARGUMENT"]);
                    break;

                case "mental_status_change":
                    mental_status_change(Request["__EVENTARGUMENT"]);
                    break;

                case "pain_assessment_change":
                    HideControl(field_npass, field_naf, field_flacc, field_nonv);

                    var control = FindControl(Request["__EVENTARGUMENT"]);
                    if (control != null)
                    {
                        ShowControl(control);
                    }
                    UpdatePanel18.Update();
                    break;

                case "btc_language_change":
                    HideControl(field_btc_language_true);
                    btc_change("field_btc_language", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_cognitive_change":
                    HideControl(field_btc_cognitive_true);
                    btc_change("field_btc_cognitive", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_sensory_change":
                    HideControl(field_btc_sensory_true);
                    btc_change("field_btc_sensory", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_religious_change":
                    HideControl(field_btc_religious_true);
                    btc_change("field_btc_religious", Request["__EVENTARGUMENT"]);
                    break;

                case "btc_cultural_change":
                    HideControl(field_btc_cultural_true);
                    btc_change("field_btc_cultural", Request["__EVENTARGUMENT"]);
                    break;

                case "no_fall_risks_change":
                    no_fall_risks_change();
                    break;

                case "nutrition_status_age_change":
                    HideControl(field_nutrition_status_l, field_nutrition_status_g, field_nutrition_status_a);
                    
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
        private void allergy_change(string value)
        {
            field_allergy_true.Visible = false;
            btc_change("field_allergy", value);
        }
        private void npass_change()  
        {
            int? npass_total_score = NPASS.CalculateTotalScore(txt_npass_crying.Value, txt_npass_behavior.Value, txt_npass_facial_expression.Value, txt_npass_extremities_tone.Value, txt_npass_vital_signs.Value, txt_npass_gestation_3.Value, txt_npass_gestation_2.Value, txt_npass_gestation_1.Value);
            d_npass_total_score.Text = Convert.ToString(npass_total_score);
            d_npass_conclude.Text = NPASS.GetConclude(npass_total_score);
            up_npass_total_score.Update();
            up_npass_conclude.Update();
        }
        private void flacc_change()
        {
            int? flacc_total_score = FLACC.CalculateTotalScore(txt_flacc_face.Value, txt_flacc_legs.Value, txt_flacc_activity.Value, txt_flacc_cry.Value, txt_flacc_consolability.Value);
            d_flacc_conclude.Text = FLACC.GetConclude(flacc_total_score);
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
                ShowControl(txt_flacc_face,
                    txt_flacc_legs,
                    txt_flacc_activity,
                    txt_flacc_cry,
                    txt_flacc_consolability,
                    txt_npass_crying,
                    txt_npass_behavior,
                    txt_npass_facial_expression,
                    txt_npass_extremities_tone,
                    txt_npass_vital_signs,
                    txt_npass_gestation_3,
                    txt_npass_gestation_2,
                    txt_npass_gestation_1);

                HideControl(lbl_flacc_face, 
                    lbl_flacc_legs, 
                    lbl_flacc_activity, 
                    lbl_flacc_cry, 
                    lbl_flacc_consolability, 
                    lbl_npass_crying, 
                    lbl_npass_behavior, 
                    lbl_npass_facial_expression, 
                    lbl_npass_extremities_tone,
                    lbl_npass_vital_signs,
                    lbl_npass_gestation_3,
                    lbl_npass_gestation_2,
                    lbl_npass_gestation_1);

                txt_amend_reason.Text = string.Empty;
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
                txt_chief_complaint.Value = EMRHelpers.ConvertToHtml(Model.chief_complaint);
                #endregion

                #region 2. Dị ứng/ Allergy
                BindingInputRadioButton($"{nameof(Model.allergy)}_{Model.allergy}");
                allergy_change(Convert.ToString(Model.allergy));
                txt_allergy_note.Value = EMRHelpers.ConvertBooleanToString(Model.allergy, Model.allergy_note, string.Empty);
                #endregion

                #region 3. Trạng thái tinh thần/ Mental status
                BindingInputRadioButton($"{nameof(Model.mental_status)}_{Model.mental_status}");
                mental_status_change(Convert.ToString(Model.mental_status));
                txt_mental_status_note.Value = EMRHelpers.ConvertBooleanToString(Model.mental_status, string.Empty, EMRHelpers.ConvertToHtml(Model.mental_status_note));
                #endregion

                #region 4. Tầm soát bệnh lây nhiễm/ Communicable disease screening
                
                Disabled(rad_high_fever_true,
                    rad_high_fever_false,
                    rad_contact_infectious_disease_true,
                    rad_contact_infectious_disease_false,
                    rad_close_contact_true,
                    rad_close_contact_false,
                    rad_injectious_risk_true,
                    rad_injectious_risk_false);

                if (Model.communicable_disease_screening != null)
                {
                    COMMUNICABLE_DISEASE_SCREENING communicable_disease_screening = new COMMUNICABLE_DISEASE_SCREENING(Model.communicable_disease_screening);
                    BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.high_fever)}_{communicable_disease_screening.high_fever}");
                    BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.contact_infectious_disease)}_{communicable_disease_screening.contact_infectious_disease}");
                    BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.close_contact)}_{communicable_disease_screening.close_contact}");
                    BindingInputRadioButton($"{nameof(COMMUNICABLE_DISEASE_SCREENING.injectious_risk)}_{communicable_disease_screening.injectious_risk}");
                }
                #endregion

                #region 5. Đánh giá đau/ Pain assessment

                ShowControl(pain_assessment_scale_wrapper);

                LoadPainAssessmentScale(Model.pain_assessment_type);
                #endregion

                #region 6. Trở ngại chăm sóc/ Barrier to care
                
                HideControl(lbl_btc_language,
                    lbl_btc_cognitive,
                    lbl_btc_sensory,
                    lbl_btc_religious,
                    lbl_btc_cultural);

                ShowControl(btc_language_wrapper,
                    btc_cognitive_wrapper,
                    btc_sensory_wrapper,
                    btc_religious_wrapper,
                    btc_cultural_wrapper);

                if (Model.barrier_to_care != null)
                {
                    BARRIER_TO_CARE barrier_to_care = new BARRIER_TO_CARE(Model.barrier_to_care);
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
                    HideControl(field_btc_language_true,
                        field_btc_cognitive_true,
                        field_btc_sensory_true,
                        field_btc_religious_true,
                        field_btc_cultural_true);
                }
                #endregion

                #region 7. Tầm soát nguy cơ té ngã/ Fall risk morse scale:
                //- Các yếu tố nguy cơ/ Fall risk factors:
                HideControl(lbl_no_fall_risk,
                    lbl_fallen,
                    lbl_feel_unsteady,
                    lbl_worry_about_falling,
                    field_no_fall_risks_false);

                ShowControl(no_fall_risk_wrapper,
                    fallen_field,
                    feel_unsteady_field,
                    worry_about_falling_field,
                    intervention_field);
                
                if (!string.IsNullOrEmpty(Model.fall_risk_factors))
                {
                    try
                    {
                        DataTable fall_risk_factors = EMRHelpers.ConvertToDataTable(Model.fall_risk_factors);
                        if (fall_risk_factors != null)
                        {
                            BindingInputCheckBox(nameof(fall_risk_factors), fall_risk_factors);

                            BindingInputRadioButton($"no_fall_risks_{cb_fall_risk_factors_nfr.Checked}");
                            ShowControl(fall_risk_factors_field);

                            rad_fallen_false.Checked = cb_fall_risk_factors_nfr.Checked;

                            if (!cb_fall_risk_factors_nfr.Checked)
                            {
                                ShowControl(field_no_fall_risks_false);
                                //-	Câu hỏi sàng lọc / The fall risk screen questions:
                                try
                                {
                                    if (!string.IsNullOrEmpty(Model.fall_risk_questions))
                                    {
                                        FALL_RISK_QUESTION frq = new FALL_RISK_QUESTION(Model.fall_risk_questions);
                                        BindingInputRadioButton($"{nameof(frq.fallen)}_{frq.fallen}");
                                        BindingInputRadioButton($"{nameof(frq.feel_unsteady)}_{frq.feel_unsteady}");
                                        BindingInputRadioButton($"{nameof(frq.worry_about_falling)}_{frq.worry_about_falling}");
                                    }
                                }
                                catch (Exception ex)
                                {
                                    ErrorMessage += ex.Message;
                                }

                                DataTable intervention = EMRHelpers.ConvertToDataTable(Model.intervention);
                                if (intervention != null)
                                {
                                    BindingInputCheckBox(nameof(Model.intervention), intervention);
                                }
                            }
                        }
                    }
                    catch(Exception ex)
                    {
                        ErrorMessage += ex.Message;
                    }
                }

                d_bmi.Text = Model.vs_BMI;
                #endregion

                #region 8. Sàng lọc dinh dưỡng/ Nutrition screening
                HideControl(lbl_previous_weight);
                ShowControl(previous_weight_wrapper);
                if (!string.IsNullOrEmpty(Model.nutritional_status_screening))
                {
                    try
                    {
                        NUTRITION_SCREENING ns = new NUTRITION_SCREENING(Model.nutritional_status_screening);
                        txt_previous_weight.Value = ns.previous_weight;
                        d_weight_change.Text = ns.weight_change;
                    } 
                    catch(Exception ex)
                    {
                        ErrorMessage += ex.Message;
                    }
                }
                #region - Tình trạng dinh dưỡng/ Nutrition status
                Disabled(rad_ns_g, rad_ns_g_0, rad_ns_g_1, rad_ns_g_2,
                    rad_ns_l, rad_ns_l_0, rad_ns_l_1, rad_ns_l_2,
                    rad_ns_a, rad_ns_a_0, rad_ns_a_1, rad_ns_a_2,
                    rad_ns_loss_weight_0, rad_ns_loss_weight_1, rad_ns_loss_weight_2, 
                    rad_ns_food_intake_0, rad_ns_food_intake_2);

                HideControl(field_nutrition_status_l, field_nutrition_status_g, field_nutrition_status_a);
                
                if (Model.nutritional_status != null)
                {
                    NUTRITION_STATUS ns = new NUTRITION_STATUS(Model.nutritional_status);

                    BindingInputRadioButton($"{nameof(ns)}_{ns.ns_code}");
                    btc_change("field_nutrition_status", Convert.ToString(ns.ns_code));

                    BindingInputRadioButton($"{nameof(ns)}_{ns.ns_code}_{ns.ns_score}");
                    ns_age_score.Value = ns.ns_score;

                    #region - Sụt cân không chủ ý trong 3 tháng gần đây / Unintentional weight loss in the last 3 months
                    BindingInputRadioButton($"{nameof(ns)}_{nameof(ns.loss_weight)}_{ns.loss_weight}");
                    ns_loss_weight_score.Value = ns.loss_weight;
                    #endregion

                    #region - Khả năng ăn uống/ Food intake
                    BindingInputRadioButton($"{nameof(ns)}_{nameof(ns.food_intake)}_{ns.food_intake}");
                    ns_food_intake_score.Value = ns.food_intake;
                    #endregion

                    d_ns_total_score.Text = ns.total_score;
                    d_nutritional_conclude.Text = Model.nutritional_conclude;
                }
                #endregion

                #endregion

                #endregion

                #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT:
                BindingInputRadioButton($"{nameof(Model.housing_code)}_{Model.housing_code}");
                #endregion

                #region IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
                HideControl(immediate_consulting_requirement, field_im_consul_req_oth);
                BindingInputRadioButton($"{nameof(Model.prioritization_code)}_{Model.prioritization_code}");

                if (Model.prioritization_code == PRIORITIZATION_CODE.IMMEDIATE_CONSULTING_REQUIREMENT)
                {
                    ShowControl(immediate_consulting_requirement);
                    DataTable im_consul_req = EMRHelpers.ConvertToDataTable(Model.immediate_consulting_requirement);
                    if(im_consul_req != null)
                    {
                        BindingInputCheckBox(nameof(im_consul_req), im_consul_req, (KeyValuePair<string,object> item) => {
                            if(item.Key == "oth")
                            {
                                ShowControl(field_im_consul_req_oth);
                                txt_im_consul_req_oth.Value = Convert.ToString(item.Value);
                            }
                            return 0;
                        });
                    }
                }
                #endregion

                #region V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
                DataTable patient_education_needs = EMRHelpers.ConvertToDataTable(Model.patient_education_needs);
                HideControl(field_patient_edu_need_oth);
                if(patient_education_needs != null)
                {
                    BindingInputCheckBox(nameof(patient_education_needs), patient_education_needs, (KeyValuePair<string,object> item) =>
                    {
                        if (item.Key == "oth")
                        {
                            ShowControl(field_patient_edu_need_oth);
                            txt_patient_edu_need_oth.Value = Convert.ToString(item.Value);
                        }
                        return 0;
                    });
                }
                #endregion

                Session["docid"] = Model.document_id;
                //WebHelpers.AddScriptFormEdit(Page, Model, (string)Session["emp_id"], Location);

                if (!string.IsNullOrEmpty(ErrorMessage))
                {
                    ErrorMessageId.Text = ErrorMessage;
                    LogErrors();
                }
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
                HideControl(txt_flacc_face,
                    txt_flacc_legs,
                    txt_flacc_activity,
                    txt_flacc_cry,
                    txt_flacc_consolability,
                    txt_npass_crying,
                    txt_npass_behavior,
                    txt_npass_facial_expression,
                    txt_npass_extremities_tone,
                    txt_npass_vital_signs,
                    txt_npass_gestation_3,
                    txt_npass_gestation_2,
                    txt_npass_gestation_1);

                ShowControl(lbl_flacc_face,
                    lbl_flacc_legs,
                    lbl_flacc_activity,
                    lbl_flacc_cry,
                    lbl_flacc_consolability,
                    lbl_npass_crying,
                    lbl_npass_behavior,
                    lbl_npass_facial_expression,
                    lbl_npass_extremities_tone,
                    lbl_npass_vital_signs,
                    lbl_npass_gestation_3,
                    lbl_npass_gestation_2,
                    lbl_npass_gestation_1);

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
                lbl_chief_complaint.Text = EMRHelpers.ConvertToHtml(Model.chief_complaint);
                #endregion

                #region 2. Dị ứng/ Allergy
                lbl_allergy.Text = WebHelpers.GetBool(Model.allergy, $"Có, ghi rõ/ Yes, specify: { EMRHelpers.ConvertToHtml(Model.allergy_note)}");
                #endregion

                #region 3. Trạng thái tinh thần/ Mental status
                lbl_mental_status.Text = WebHelpers.GetBool(Model.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {EMRHelpers.ConvertToHtml(Model.mental_status_note)}");
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
                    COMMUNICABLE_DISEASE_SCREENING communicable_disease_screening = new COMMUNICABLE_DISEASE_SCREENING(Model.communicable_disease_screening);

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_high_fever_" + communicable_disease_screening.high_fever);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_contact_infectious_disease_" + communicable_disease_screening.contact_infectious_disease);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_close_contact_" + communicable_disease_screening.close_contact);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_injectious_risk_" + communicable_disease_screening.injectious_risk);
                }
                #endregion

                #region 5. Đánh giá đau/ Pain assessment
                HideControl(field_naf, field_flacc, field_npass, field_nonv);
                switch (Model.pain_assessment_type)
                {
                    case PAIN_ASSESSMENT_TYPE.NumericAndFaces:
                        rad_naf_true.Checked = true;
                        pain_assessment_change(nameof(field_naf));
                        lbl_paint_score_description.Text = EMRHelpers.ConvertToHtml(Model.paint_score_description);
                        break;
                    case PAIN_ASSESSMENT_TYPE.FLACC:
                        if (Model.flacc != null)
                        {
                            FLACC flacc = new FLACC(Model.flacc);

                            lbl_flacc_face.Text = Convert.ToString(flacc.face);
                            lbl_flacc_legs.Text = Convert.ToString(flacc.legs);
                            lbl_flacc_activity.Text = Convert.ToString(flacc.activity);
                            lbl_flacc_cry.Text = Convert.ToString(flacc.cry);
                            lbl_flacc_consolability.Text = Convert.ToString(flacc.consolability);
                            d_flacc_total_score.Text = Convert.ToString(flacc.total_score);
                            d_flacc_conclude.Text = Model.flacc_conclude;
                        }
                        rad_flacc_true.Checked = true;
                        pain_assessment_change(nameof(field_flacc));
                        break;
                    case PAIN_ASSESSMENT_TYPE.N_PASS:
                        if (Model.npass != null)
                        {
                            NPASS npass = new NPASS(Model.npass);
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
                        pain_assessment_change(nameof(field_npass));
                        break;
                    case PAIN_ASSESSMENT_TYPE.Non_Verbal:
                        rad_nonv_true.Checked = true;
                        pain_assessment_change(nameof(field_nonv));
                        break;
                }
                HideControl(pain_assessment_scale_wrapper);
                #endregion

                #region 6. Trở ngại chăm sóc/ Barrier to care
                ShowControl(lbl_btc_language, lbl_btc_cognitive, lbl_btc_sensory, lbl_btc_religious, lbl_btc_cultural);
                HideControl(btc_language_wrapper, btc_cognitive_wrapper, btc_sensory_wrapper, btc_religious_wrapper, btc_cultural_wrapper);

                if(Model.barrier_to_care != null)
                {
                    BARRIER_TO_CARE barrier_to_care = new BARRIER_TO_CARE(Model.barrier_to_care);
                
                    lbl_btc_language.Text = barrier_to_care.btc_language != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_language)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_language_note)}")) : "";
                    lbl_btc_cognitive.Text = barrier_to_care.btc_cognitive != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_cognitive)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_cognitive_note)}")) : "";
                    lbl_btc_sensory.Text = barrier_to_care.btc_sensory != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_sensory)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_sensory_note)}")) : "";
                    lbl_btc_religious.Text = barrier_to_care.btc_religious != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_religious)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_religious_note)}")) : "";
                    lbl_btc_cultural.Text = barrier_to_care.btc_cultural != null ? WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(barrier_to_care.btc_cultural)), $"Có, Giải thích/Yes Explain: {WebHelpers.FormatString(barrier_to_care.btc_cultural_note)}")) : "";
                }
                #endregion

                #region 7. Tầm soát nguy cơ té ngã/ Fall risk screening
                ShowControl(lbl_no_fall_risk, lbl_fallen, lbl_feel_unsteady, lbl_worry_about_falling);
                HideControl(field_no_fall_risks_false, no_fall_risk_wrapper);
                
                DataTable fall_risk_factors = EMRHelpers.ConvertToDataTable(Model.fall_risk_factors);
                
                if (fall_risk_factors != null)
                {
                    #region - Các yếu tố nguy cơ/ Fall risk factors
                    
                    lbl_no_fall_risk.Text = WebHelpers.FormatString(DisplayCheckBox(fall_risk_factors));

                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_fall_risk_factors_", fall_risk_factors);
                    
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
                        HideControl(fall_risk_factors_field, fallen_field, feel_unsteady_field, worry_about_falling_field, intervention_field);

                        #region - Câu hỏi sàng lọc/ The fall risk screen question
                        if (Model.fall_risk_questions != null)
                        {
                            try
                            {
                                FALL_RISK_QUESTION frq = new FALL_RISK_QUESTION(Model.fall_risk_questions);

                                lbl_fallen.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(frq.fallen))));
                                lbl_feel_unsteady.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(frq.feel_unsteady))));
                                lbl_worry_about_falling.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(frq.worry_about_falling))));
                            }
                            catch(Exception ex)
                            {

                            }
                        }
                        #endregion
                        //
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fallen_" + fall_risk_questions.fallen);
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_feel_unsteady_" + fall_risk_questions.feel_unsteady);
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_worry_about_falling_" + fall_risk_questions.worry_about_falling);
                        #region - Can thiệp/ Intervention
                        DataTable intervention = EMRHelpers.ConvertToDataTable(Model.intervention);
                        if(intervention != null)
                        {
                            lbl_intervention.Text = WebHelpers.FormatString(DisplayCheckBox(intervention));
                        }
                        #endregion
                        //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_intervention_", WebHelpers.GetJSONToDataTable(oina.intervention));
                    }
                }
                #endregion

                #region 8. Sàng lọc dinh dưỡng/ Nutrition screening
                d_bmi.Text = Model.vs_BMI;
                HideControl(previous_weight_wrapper);
                ShowControl(lbl_previous_weight);
                if (Model.nutritional_status_screening != null)
                {
                    NUTRITION_SCREENING ns = new NUTRITION_SCREENING(Model.nutritional_status_screening);
                    
                    lbl_previous_weight.Text = ns.previous_weight;
                    d_weight_change.Text = ns.weight_change;
                }

                #region - Tình trạng dinh dưỡng/ Nutrition status

                HideControl(field_nutrition_status_l, field_nutrition_status_g, field_nutrition_status_a);
                
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
                    NUTRITION_STATUS ns = new NUTRITION_STATUS(Model.nutritional_status);
                    
                    //
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + ns.ns_code);
                    btc_change("field_nutrition_status", Convert.ToString(ns.ns_code));

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + ns.ns_code + "_" + ns.ns_score);
                    ns_age_score.Value = ns.ns_score;

                    #region - Sụt cân không chủ ý trong 3 tháng gần đây/ Unintentional weight loss in the last 3 months:
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_loss_weight_" + ns.loss_weight);
                    ns_loss_weight_score.Value = ns.loss_weight;
                    #endregion

                    #region - Khả năng ăn uống/ Food intake
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_food_intake_" + ns.food_intake);
                    ns_food_intake_score.Value = ns.food_intake;
                    #endregion

                    d_ns_total_score.Text = ns.total_score;

                    d_nutritional_conclude.Text = Model.nutritional_conclude;
                }
                #endregion

                #endregion
                
                #endregion

                #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT
                lbl_housing_description.Text = EMRHelpers.ConvertToHtml(Model.housing_description);
                #endregion

                #region IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
                immediate_consulting_requirement.Visible = false;
                lbl_prioritization_description.Text = EMRHelpers.ConvertToHtml(Model.prioritization_description);
                DataTable immediate_consulting_requirement_tb = EMRHelpers.ConvertToDataTable(Model.immediate_consulting_requirement);
                if(immediate_consulting_requirement_tb != null)
                {
                    lbl_immediate_consulting_requirement.Text = EMRHelpers.JSON_STR_SEPARATION(immediate_consulting_requirement_tb);
                }
                #endregion

                #region V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
                DataTable patient_education_needs_tb = EMRHelpers.ConvertToDataTable(Model.patient_education_needs);
                if(patient_education_needs_tb != null)
                {
                    lbl_patient_education_needs.Text = EMRHelpers.JSON_STR_SEPARATION(patient_education_needs_tb);
                }
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
            prt_fullname.Text = $"{Patient.FullName}";
            prt_dob.Text = $"{WebHelpers.FormatDateTime(Patient.DOB)}";
            prt_gender.Text = Patient.Gender;
            prt_pid.Text = Patient.visible_patient_id;

            prt_date_of_assessment.Text = Model.assessment_date_time.ToString("dd/MM/yyyy");
            prt_time_of_assessment.Text = Model.assessment_date_time.ToString("HH:mm");

            prt_vs_temperature.Text = Model.vs_temperature;
            prt_vs_weight.Text = Model.vs_weight;
            prt_vs_height.Text = Model.vs_height;
            prt_pulse.Text = Model.pulse;
            prt_vs_heart_rate.Text = Model.vs_heart_rate;
            prt_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
            prt_vs_blood_pressure.Text = Model.vs_blood_pressure;
            prt_vs_spO2.Text = Model.vs_spO2;
            prt_chief_complaint.Text = Model.chief_complaint;

            #region 2. Dị ứng/ Allergy
            prt_allergy_false.Text
                = prt_allergy_true.Text
                = "❏";
            BindingLabel($"{nameof(Model.allergy)}_{Model.allergy}", "☒");
            prt_allergy_note.Text = Model.allergy_note;
            #endregion

            #region 3. Trạng thái tinh thần/ Mental status
            prt_mental_status_false.Text
                = prt_mental_status_true.Text
                = "❏";
            BindingLabel($"{nameof(Model.mental_status)}_{Model.mental_status}", "☒");
            prt_mental_status_note.Text = Model.mental_status_note;
            #endregion

            #region 4. Tầm soát bệnh lây nhiễm (dành cho những bệnh tạo thành dịch)/ Communicable disease screening (for diseases that cause epidemics)
            prt_high_fever_false.Text
                = prt_high_fever_true.Text
                = prt_contact_infectious_disease_false.Text
                = prt_contact_infectious_disease_true.Text
                = prt_close_contact_false.Text
                = prt_close_contact_true.Text
                = prt_injectious_risk_false.Text
                = prt_injectious_risk_true.Text
                = string.Empty;
            try
            {
                if(Model.communicable_disease_screening != null)
                {
                    COMMUNICABLE_DISEASE_SCREENING communicable_disease_screening = Model.COMMUNICABLE_DISEASE_SCREENING();
                    BindingLabel($"{nameof(communicable_disease_screening.high_fever)}_{communicable_disease_screening.high_fever}","x");
                    BindingLabel($"{nameof(communicable_disease_screening.contact_infectious_disease)}_{communicable_disease_screening.contact_infectious_disease}", "x");
                    BindingLabel($"{nameof(communicable_disease_screening.close_contact)}_{communicable_disease_screening.close_contact}", "x");
                    BindingLabel($"{nameof(communicable_disease_screening.injectious_risk)}_{communicable_disease_screening.injectious_risk}", "x");
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region 5. Đánh giá đau/ Pain assessment
            HideControl(prt_naf_wrapper, prt_flacc_wrapper, prt_npass_wrapper, prt_nonv_wrapper);

            switch (Model.pain_assessment_type)
            {
                case PAIN_ASSESSMENT_TYPE.NumericAndFaces:
                    prt_paint_score_code_0.Text
                        = prt_paint_score_code_1.Text
                        = prt_paint_score_code_2.Text
                        = prt_paint_score_code_3.Text
                        = prt_paint_score_code_4.Text
                        = prt_paint_score_code_5.Text
                        = "❏";
                    ShowControl(prt_naf_wrapper);
                    BindingLabel($"{nameof(Model.paint_score_code)}_{Model.paint_score_code}", "☒");
                    break;
                case PAIN_ASSESSMENT_TYPE.FLACC:
                    prt_flacc_conclude_0.Text
                        = prt_flacc_conclude_1.Text
                        = prt_flacc_conclude_2.Text
                        = prt_flacc_conclude_3.Text
                        = "❏";
                    ShowControl(prt_flacc_wrapper);
                    if (Model.flacc != null)
                    {
                        FLACC flacc = new FLACC(Model.flacc);

                        prt_flacc_face.Text = Convert.ToString(flacc.face);
                        prt_flacc_legs.Text = Convert.ToString(flacc.legs);
                        prt_flacc_activity.Text = Convert.ToString(flacc.activity);
                        prt_flacc_cry.Text = Convert.ToString(flacc.cry);
                        prt_flacc_consolability.Text = Convert.ToString(flacc.consolability);

                        prt_flacc_total_score.Text = Convert.ToString(flacc.total_score);

                        if (flacc.total_score >= 7)
                        {
                            prt_flacc_conclude_3.Text = "☒";
                        }
                        else if (flacc.total_score >= 4)
                        {
                            prt_flacc_conclude_2.Text = "☒";
                        }
                        else if (flacc.total_score >= 1)
                        {
                            prt_flacc_conclude_1.Text = "☒";
                        }
                        else if (flacc.total_score == 0)
                        {
                            prt_flacc_conclude_0.Text = "☒";
                        }
                    }
                    break;
                case PAIN_ASSESSMENT_TYPE.N_PASS:
                    prt_npass_conclude_0.Text
                        = prt_npass_conclude_1.Text
                        = prt_npass_conclude_2.Text
                        = "❏";
                    ShowControl(prt_npass_wrapper);
                    if (Model.npass != null)
                    {
                        dynamic npass = JsonConvert.DeserializeObject(Model.npass);
                        
                        prt_npass_crying.Text = Convert.ToString(npass.crying);
                        prt_npass_behavior.Text = Convert.ToString(npass.behavior);
                        prt_npass_facial_expression.Text = Convert.ToString(npass.facial_expression);
                        prt_npass_extremities_tone.Text = Convert.ToString(npass.extremities_tone);
                        prt_npass_vital_signs.Text = Convert.ToString(npass.vital_signs);
                        prt_npass_gestation_3.Text = Convert.ToString(npass.gestation_3);
                        prt_npass_gestation_2.Text = Convert.ToString(npass.gestation_2);
                        prt_npass_gestation_1.Text = Convert.ToString(npass.gestation_1);

                        prt_npass_total_score.Text = Convert.ToString(npass.total_score);

                        if (npass.total_score > 3)
                        {
                            prt_npass_conclude_2.Text = "☒";
                        }
                        else if (npass.total_score >= 1)
                        {
                            prt_npass_conclude_1.Text = "☒";
                        }
                        else if (npass.total_score == 0)
                        {
                            prt_npass_conclude_0.Text = "☒";
                        }
                    }
                    break;
                case PAIN_ASSESSMENT_TYPE.Non_Verbal:
                    ShowControl(prt_nonv_wrapper);
                    break;
            }
            #endregion

            #region 6. Trở ngại chăm sóc/ Barrier to care
            prt_btc_language_true.Text
                = prt_btc_language_false.Text
                = prt_btc_cognitive_true.Text
                = prt_btc_cognitive_false.Text
                = prt_btc_cultural_true.Text
                = prt_btc_cultural_false.Text
                = prt_btc_religious_true.Text
                = prt_btc_religious_false.Text
                = prt_btc_sensory_true.Text
                = prt_btc_sensory_false.Text
                = "❏";
            if (Model.barrier_to_care != null)
            {
                BARRIER_TO_CARE barrier_to_care = Model.BARRIER_TO_CARE();

                BindingLabel($"{nameof(barrier_to_care.btc_language)}_{barrier_to_care.btc_language}", "☒");
                prt_btc_language_note.Text = barrier_to_care.btc_language_note;

                BindingLabel($"{nameof(barrier_to_care.btc_cognitive)}_{barrier_to_care.btc_cognitive}", "☒");
                prt_btc_cognitive_note.Text = barrier_to_care.btc_cognitive_note;

                BindingLabel($"{nameof(barrier_to_care.btc_sensory)}_{barrier_to_care.btc_sensory}", "☒");
                prt_btc_sensory_note.Text = barrier_to_care.btc_sensory_note;

                BindingLabel($"{nameof(barrier_to_care.btc_religious)}_{barrier_to_care.btc_religious}", "☒");
                prt_btc_religious_note.Text = barrier_to_care.btc_religious_note;

                BindingLabel($"{nameof(barrier_to_care.btc_cultural)}_{barrier_to_care.btc_cultural}", "☒");
                prt_btc_cultural_note.Text = barrier_to_care.btc_cultural_note;
            }
            #endregion

            #region 7. Tầm soát nguy cơ té ngã/ Fall risk screening
            prt_fall_risk_factors_agr.Text
                = prt_fall_risk_factors_pre.Text
                = prt_fall_risk_factors_ina.Text
                = prt_fall_risk_factors_pod.Text
                = prt_fall_risk_factors_ear.Text
                = prt_fall_risk_factors_ale.Text
                = prt_fall_risk_factors_amb.Text
                = prt_fall_risk_factors_pat.Text
                = prt_fall_risk_factors_imp.Text
                = "❏";
            HideControl(prt_fall_risk_factor_nfr_wrapper, prt_fall_risk_factor_nfr);
            if (Model.fall_risk_factors != null)
            {
                if (Model.fall_risk_factors.Contains("\"code\":\"NFR\""))
                {
                    ShowControl(prt_fall_risk_factor_nfr);
                }
                else
                {
                    ShowControl(prt_fall_risk_factor_nfr_wrapper);
                    DataTable fall_risk_factors = EMRHelpers.ConvertToDataTable(Model.fall_risk_factors);
                    if(fall_risk_factors != null)
                    {
                        foreach (DataRow row in fall_risk_factors.Rows)
                        {
                            string code = Convert.ToString(row["code"]);
                            BindingLabel($"{nameof(Model.fall_risk_factors)}_{code}", "☒");
                        }
                    }
                }
            }
            prt_fallen_true.Text
                = prt_fallen_false.Text
                = prt_feel_unsteady_true.Text
                = prt_feel_unsteady_false.Text
                = prt_worry_about_falling_true.Text
                = prt_worry_about_falling_false.Text
                = "❏";
            if (Model.fall_risk_questions != null)
            {
                FALL_RISK_QUESTION fall_risk_questions = Model.FALL_RISK_QUESTION();
                BindingLabel($"{nameof(fall_risk_questions.fallen)}_{fall_risk_questions.fallen}", "☒");
                BindingLabel($"{nameof(fall_risk_questions.feel_unsteady)}_{fall_risk_questions.feel_unsteady}", "☒");
                BindingLabel($"{nameof(fall_risk_questions.worry_about_falling)}_{fall_risk_questions.worry_about_falling}", "☒");
            }

            prt_intervention_uni.Text
                = prt_intervention_sti.Text
                = prt_intervention_edu.Text
                = prt_intervention_ass.Text
                = prt_intervention_str.Text
                = prt_intervention_epa.Text
                = prt_intervention_ins.Text
                = prt_intervention_enc.Text
                = prt_intervention_pfr.Text
                = "❏";
            DataTable intervention = EMRHelpers.ConvertToDataTable(Model.intervention);
            if (intervention != null)
            {
                foreach (DataRow row in intervention.Rows)
                {
                    string code = Convert.ToString(row["code"]);
                    BindingLabel($"{nameof(Model.intervention)}_{code}", "☒");
                }
            }
            #endregion

            #region 8. Sàng lọc dinh dưỡng/ Nutrition screening
            
            prt_bmi.Text = Model.vs_BMI;
            if(Model.nutritional_status_screening != null)
            {
                NUTRITION_SCREENING nutrition_screening = Model.NUTRITION_SCREENING();
                prt_previous_weight.Text = nutrition_screening.previous_weight;
                prt_weight_change.Text = nutrition_screening.weight_change;
            }

            prt_ns_a_0.CssClass = "";
            prt_ns_a_1.CssClass = "";
            prt_ns_a_2.CssClass = "";

            prt_ns_l_0.CssClass = "";
            prt_ns_l_1.CssClass = "";
            prt_ns_l_2.CssClass = "";

            prt_ns_g_0.CssClass = "";
            prt_ns_g_1.CssClass = "";
            prt_ns_g_2.CssClass = "";

            prt_ns_loss_weight_0.CssClass = "";
            prt_ns_loss_weight_1.CssClass = "";
            prt_ns_loss_weight_2.CssClass = "";

            prt_ns_food_intake_0.CssClass = "";
            prt_ns_food_intake_2.CssClass = "";
            //
            dynamic nutritional_status = JsonConvert.DeserializeObject(Model.nutritional_status);
            if (nutritional_status != null)
            {
                if (nutritional_status.ns_code != null && nutritional_status.ns_score != null)
                {
                    var ns_score = FindControl($"prt_ns_{nutritional_status.ns_code}_{nutritional_status.ns_score}");
                    if (ns_score != null) ((Label)ns_score).CssClass = "circle";
                }

                if (nutritional_status.loss_weight != null)
                {
                    var loss_weight = FindControl($"prt_ns_loss_weight_{nutritional_status.loss_weight}");
                    if (loss_weight != null) ((Label)loss_weight).CssClass = "circle";
                }

                if (nutritional_status.food_intake != null)
                {
                    var food_intake = FindControl($"prt_ns_food_intake_{nutritional_status.food_intake}");
                    if (food_intake != null) ((Label)food_intake).CssClass = "circle";
                }

                prt_nutritional_conclude_0.Text
                    = prt_nutritional_conclude_2.Text
                    = "❏";
                if (nutritional_status.total_score != null)
                {
                    prt_ns_total_score.Text = nutritional_status.total_score;
                    try
                    {
                        if(Convert.ToInt32(nutritional_status.total_score) >= 2)
                        {
                            prt_nutritional_conclude_2.Text = "☒";
                        }
                        else
                        {
                            prt_nutritional_conclude_0.Text = "☒";
                        }
                    }
                    catch (Exception ex) 
                    { 
                        Console.WriteLine(ex.Message); 
                        Console.WriteLine(nutritional_status.total_score + " can not convert to Integer"); 
                    }
                }
            }
            #endregion

            #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT
            prt_housing_code_aln.Text
                = prt_housing_code_rel.Text
                = "❏";
            BindingLabel($"{nameof(Model.housing_code)}_{Model.housing_code}", "☒");
            #endregion

            #region IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
            prt_im_consul_req_eme.Text
                = prt_im_consul_req_chi.Text
                = prt_im_consul_req_ser.Text
                = prt_im_consul_req_pat.Text
                = prt_im_consul_req_pre.Text
                = prt_im_consul_req_boo.Text
                = prt_im_consul_req_oth.Text
                = "❏";
            HideControl(ph_prt_im_consul_req);
            switch (Model.prioritization_code)
            {
                case PRIORITIZATION_CODE.BE_ABLE_TO_WAIT_FOR_CONSULTATION_AT_A_SPECIFIC_TIME:
                    prt_prioritization_code.Text = "<span style=\"font-weight:bold\">- Có thể chờ khám trong khoảng thời gian xác định/ Be able to wait for consultation at a specific time</span>";
                    break;
                case PRIORITIZATION_CODE.IMMEDIATE_CONSULTING_REQUIREMENT:
                    ShowControl(ph_prt_im_consul_req);
                    prt_prioritization_code.Text = "<span style=\"font-weight:bold\">- Cần được khám ngay/ Immediate consulting requirement</span>";

                    DataTable immediate_consulting_requirement = EMRHelpers.ConvertToDataTable(Model.immediate_consulting_requirement);
                    if (immediate_consulting_requirement != null)
                    {
                        foreach (DataRow row in immediate_consulting_requirement.Rows)
                        {
                            string code = Convert.ToString(row["code"]);
                            BindingLabel($"im_consul_req_{code}", "☒");
                            if(code == "OTH")
                            {
                                prt_im_consul_req_oth_note.Text = Convert.ToString(row["desc"]);
                            }
                        }
                    }

                    break;
            }
            #endregion

            #region V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
            prt_patient_education_need_fal.Text
                = prt_patient_education_need_wou.Text
                = prt_patient_education_need_die.Text
                = prt_patient_education_need_pai.Text
                = prt_patient_education_need_oth.Text
                = "❏";
            DataTable patient_education_needs = EMRHelpers.ConvertToDataTable(Model.patient_education_needs);
            if (patient_education_needs != null)
            {
                foreach (DataRow row in patient_education_needs.Rows)
                {
                    string code = Convert.ToString(row["code"]);
                    BindingLabel($"patient_education_need_{code}", "☒");
                    if (code == "OTH")
                    {
                        prt_patient_education_need_oth_note.Text = Convert.ToString(row["desc"]);
                    }
                }
            }
            #endregion

            prt_signature_date.Text = $"Ngày/ <i>Date: </i> {DateTime.Now.ToString("dd/MM/yyyy")} Giờ/<i>Time: </i> {DateTime.Now.ToString("HH:mm")}";
        }
        #endregion
        #region Events
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (CheckOpenForm)
            {
                Model = new OinaRv03(varDocID, Location);
                HideControl(btnAmend, btnPrint);
                ShowControl(btnComplete, btnCancel, amendReasonWraper);
                LoadFormControl(form1, Model, ControlState.Edit);
                BindingDataFormEdit();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, Location);
            Init_Page();
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
        #endregion
        #region METHODS
        public override void UpdateModel(string status)
        {
            try
            {
                Model = new OinaRv03(varDocID, Location);
                Model.status = status;

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
                Model.allergy = FindHtmlInputRadioButton(nameof(Model.allergy));
                Model.allergy_note = EMRHelpers.ConvertBooleanToString(Model.allergy, txt_allergy_note.Value, string.Empty);
                #endregion

                #region 3. Trạng thái tinh thần/ Mental status
                Model.mental_status = FindHtmlInputRadioButton(nameof(Model.mental_status));
                Model.mental_status_note = EMRHelpers.ConvertBooleanToString(Model.mental_status, string.Empty, txt_mental_status_note.Value);
                #endregion

                #region 4. Tầm soát bệnh lây nhiễm (dành cho những bệnh tạo thành dịch)/ Communicable disease screening (for diseases that cause epidemics)
                COMMUNICABLE_DISEASE_SCREENING communicable_disease_screening = new COMMUNICABLE_DISEASE_SCREENING();
                communicable_disease_screening.high_fever = FindHtmlInputRadioButton(nameof(COMMUNICABLE_DISEASE_SCREENING.high_fever));
                communicable_disease_screening.contact_infectious_disease = FindHtmlInputRadioButton(nameof(COMMUNICABLE_DISEASE_SCREENING.contact_infectious_disease));
                communicable_disease_screening.close_contact = FindHtmlInputRadioButton(nameof(COMMUNICABLE_DISEASE_SCREENING.close_contact));
                communicable_disease_screening.injectious_risk = FindHtmlInputRadioButton(nameof(COMMUNICABLE_DISEASE_SCREENING.injectious_risk));
                Model.communicable_disease_screening = communicable_disease_screening.ToString();
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
                    Model.paint_score_code = form1.HtmlInputRadioButton(nameof(Model.paint_score_code), EmrDictionary.PAINT_SCORE_CODE);
                    Model.paint_score_description = WebHelpers.GetDicDesc(Model.paint_score_code, EmrDictionary.PAINT_SCORE_CODE);
                }
                else if (rad_flacc_true.Checked)
                {
                    Model.pain_assessment_type = PAIN_ASSESSMENT_TYPE.FLACC;

                    FLACC flacc = new FLACC();

                    flacc.face = txt_flacc_face.Value;
                    flacc.legs = txt_flacc_legs.Value;
                    flacc.activity = txt_flacc_activity.Value;
                    flacc.cry = txt_flacc_cry.Value;
                    flacc.consolability = txt_flacc_consolability.Value;
                    flacc.total_score = d_flacc_total_score.Text;

                    Model.flacc = flacc.ToString();
                    Model.flacc_conclude = d_flacc_conclude.Text;
                }
                else if (rad_npass_true.Checked)
                {
                    Model.pain_assessment_type = PAIN_ASSESSMENT_TYPE.N_PASS;

                    NPASS npass = new NPASS();

                    npass.crying = txt_npass_crying.Value;
                    npass.behavior = txt_npass_behavior.Value;
                    npass.facial_expression = txt_npass_facial_expression.Value;
                    npass.extremities_tone = txt_npass_extremities_tone.Value;
                    npass.vital_signs = txt_npass_vital_signs.Value;
                    npass.gestation_3 = txt_npass_gestation_3.Value;
                    npass.gestation_2 = txt_npass_gestation_2.Value;
                    npass.gestation_1 = txt_npass_gestation_1.Value;
                    npass.total_score = d_npass_total_score.Text;

                    Model.npass = npass.ToString();
                    Model.npass_conclude = d_npass_conclude.Text;
                }
                else if (rad_nonv_true.Checked)
                {
                    Model.pain_assessment_type = PAIN_ASSESSMENT_TYPE.Non_Verbal;
                }
                #endregion

                #region 6. Trở ngại chăm sóc/ Barrier to care
                BARRIER_TO_CARE barrier_to_care = new BARRIER_TO_CARE();
                barrier_to_care.btc_language = FindHtmlInputRadioButton(nameof(BARRIER_TO_CARE.btc_language));
                barrier_to_care.btc_cognitive = FindHtmlInputRadioButton(nameof(BARRIER_TO_CARE.btc_cognitive));
                barrier_to_care.btc_sensory = FindHtmlInputRadioButton(nameof(BARRIER_TO_CARE.btc_sensory));
                barrier_to_care.btc_religious = FindHtmlInputRadioButton(nameof(BARRIER_TO_CARE.btc_religious));
                barrier_to_care.btc_cultural = FindHtmlInputRadioButton(nameof(BARRIER_TO_CARE.btc_cultural));
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
                    fall_risk_questions.fallen = FindHtmlInputRadioButton(nameof(FALL_RISK_QUESTION.fallen));
                    fall_risk_questions.feel_unsteady = FindHtmlInputRadioButton(nameof(FALL_RISK_QUESTION.feel_unsteady));
                    fall_risk_questions.worry_about_falling = FindHtmlInputRadioButton(nameof(FALL_RISK_QUESTION.worry_about_falling));
                    fall_risk_questions_result = fall_risk_questions.ToString();

                    //- Can thiệp/ Intervention:
                    DataTable intervention_tb = FindHtmlInputCheckBox(nameof(Model.intervention), EmrDictionary.INTERVENTION);
                    if(intervention_tb != null)
                    {
                        intervention_result = JsonConvert.SerializeObject(intervention_tb);
                    }
                }

                Model.fall_risk_questions = fall_risk_questions_result;
                Model.intervention = intervention_result;
                DataTable dtFallRiskFactors = FindHtmlInputCheckBox(nameof(Model.fall_risk_factors), EmrDictionary.FALL_RISK_FACTORS);
                string fall_risk_factors = null;
                if (dtFallRiskFactors != null)
                {
                    fall_risk_factors = JsonConvert.SerializeObject(dtFallRiskFactors);
                }
                Model.fall_risk_factors = fall_risk_factors;
                #endregion

                #region 8. Đánh giá tình trạng dinh dưỡng/ Nutritional status screening
                Model.vs_BMI = d_bmi.Text;
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

                nutrition_status.total_score = NUTRITION_STATUS.CalculateTotalScore(nutrition_status.ns_score, LossWeight, FoodIntake);

                Model.nutritional_status = nutrition_status.ToString();

                Model.nutritional_conclude = d_nutritional_conclude.Text;
                #endregion

                #endregion

                #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT
                Model.housing_code = FindHtmlInputRadioButton(form1, nameof(Model.housing_code), EmrDictionary.HOUSING_CODE); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", );
                Model.housing_description = WebHelpers.GetDicDesc(Model.housing_code, EmrDictionary.HOUSING_CODE);
                #endregion

                #region IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
                Model.prioritization_code = FindHtmlInputRadioButton(form1, nameof(Model.prioritization_code), EmrDictionary.PRIORITIZATION_CODE);
                string im_consul_req_result = string.Empty;
                if (Model.prioritization_code == PRIORITIZATION_CODE.IMMEDIATE_CONSULTING_REQUIREMENT)
                {
                    DataTable im_consul_req = FindHtmlInputCheckBox(form1, "im_consul_req", EmrDictionary.IM_CONSUL_REQ, (KeyValuePair<string, object> dictionary) =>
                    {
                        if (Convert.ToString(dictionary.Key) == "OTH")
                        {
                            return txt_im_consul_req_oth.Value;
                        }
                        return null;
                    });
                    if (im_consul_req.Rows.Count > 0)
                    {
                        im_consul_req_result = JsonConvert.SerializeObject(im_consul_req);
                    }
                }
                Model.prioritization_description = WebHelpers.GetDicDesc(Model.prioritization_code, EmrDictionary.PRIORITIZATION_CODE);
                Model.immediate_consulting_requirement = im_consul_req_result;
                #endregion

                #region V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
                string patient_education_needs_result = string.Empty;
                DataTable patient_education_needs = FindHtmlInputCheckBox(form1, "patient_education_needs", EmrDictionary.PATIENT_EDUCATION_NEEDS, (KeyValuePair<string, object> dictionary) =>
                {
                    if (Convert.ToString(dictionary.Key) == "OTH")
                    {
                        return txt_patient_edu_need_oth.Value;
                    }
                    return null;
                });
                if (patient_education_needs?.Rows.Count > 0)
                {
                    patient_education_needs_result = JsonConvert.SerializeObject(patient_education_needs);
                }
                Model.patient_education_needs = patient_education_needs_result;
                #endregion

                if(Model.assessment_date_time == null)
                {
                    Model.assessment_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Now);
                }
                else
                {
                    Model.assessment_date_time = DataHelpers.ConvertSQLDateTime(Model.assessment_date_time);
                }

                Model.amend_reason = txt_amend_reason.Text;
                Model.user_name = UserId;

                dynamic result = Model.Update(Location)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.MESSAGE_SAVE_SUCCESS);
                    Init_Page();
                }
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
            HideControl(field_naf, field_flacc, field_npass, field_nonv);
            switch (scale)
            {
                case PAIN_ASSESSMENT_TYPE.NumericAndFaces:
                    BindingInputRadioButton($"{nameof(Model.paint_score_code)}_{Model.paint_score_code}");
                    rad_naf_true.Checked = true;
                    pain_assessment_change(nameof(field_naf));
                    break;
                case PAIN_ASSESSMENT_TYPE.FLACC:
                    if (Model.flacc != null)
                    {
                        FLACC flacc = new FLACC(Model.flacc);

                        txt_flacc_face.Value = Convert.ToString(flacc.face);
                        txt_flacc_legs.Value = Convert.ToString(flacc.legs);
                        txt_flacc_activity.Value = Convert.ToString(flacc.activity);
                        txt_flacc_cry.Value = Convert.ToString(flacc.cry);
                        txt_flacc_consolability.Value = Convert.ToString(flacc.consolability);

                        d_flacc_total_score.Text = Convert.ToString(flacc.total_score);
                        d_flacc_conclude.Text = Model.flacc_conclude;
                    }
                    rad_flacc_true.Checked = true;
                    pain_assessment_change(nameof(field_flacc));
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
                    pain_assessment_change(nameof(field_npass));
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
                d_ns_total_score.Text = NSTotalScore.ToString();

                if(NSTotalScore >= 2)
                {
                    d_nutritional_conclude.Text = "Có nguy cơ thiếu dinh dưỡng (≥2)/ Risk of malnutrition";
                }
                else
                {
                    d_nutritional_conclude.Text = "Không có nguy cơ thiếu dinh dưỡng (<2)/ No risk of malnutrition";
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
        #endregion

    }
}
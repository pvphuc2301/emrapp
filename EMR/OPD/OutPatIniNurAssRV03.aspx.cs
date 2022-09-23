using EMR.Classes;
using EMR.DBP;
using EMR.Model;
using Microsoft.SqlServer.Server;
using Newtonsoft.Json;
using System;
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

        public void PostBackEventHandler()
        {
            throw new NotImplementedException();
        }

        public void SetDefaultValue()
        {
            throw new NotImplementedException();
        }

        public abstract void UpdateModel();
    }
    public partial class OutPatIniNurAssRV03 : EmrPage, IEmrFormModel<OinaRv03>
    {
        public override string visit_type { get; set; } = "OPD";
        public OinaRv03 Model { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            if (!IsPostBack)
            {
                Init_Page();
            }

            PostBackEvent();
        }
        public override void Init_Page()
        {
            try
            {
                Patient = new PatientInfo(varPID);
                PatientVisit = new PatientVisitInfo(varPVID, Location);

                Model = new OinaRv03(varDocID, Location, varDocIdLog);
                currentLog.Visible = !string.IsNullOrEmpty(varDocIdLog);
                LoadPatientInfo();

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
        private void LoadPatientInfo()
        {
            lblFirstName.Text = Patient.first_name_l;
            lblLastName.Text = Patient.last_name_l;
            lblGender.Text = Patient.gender_l;

            WebHelpers.ConvertDateTime(Patient.DOB, out bool isValid, out string DOB, "dd-MM-yyyy");
            lblDoB.Text = DOB + " (" + Patient.Age + "t)";

            lblPatientAddress.Text = Patient.Address;
            lblContactPerson.Text = Patient.Contact;
            lblRelationship.Text = Patient.Relationship;
            lblVisitCode.Text = PatientVisit.VisitCode;

            WebHelpers.ConvertDateTime(PatientVisit.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
        }
        private void PostBackEvent()
        {
            switch (Request["__EVENTTARGET"])
            {
                //case "clearSession":
                //    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
                //    break;

            }
        }

        #region Binding Data
        public override void BindingDataFormEdit()
        {
            //try
            //{
            //    txt_amend_reason.Text = "";
            //    //I.
            //    txt_vs_temperature.Value = oina.vs_temperature;
            //    txt_vs_heart_rate.Value = oina.vs_heart_rate;
            //    txt_vs_weight.Value = oina.vs_weight;
            //    txt_vs_respiratory_rate.Value = oina.vs_respiratory_rate;
            //    txt_vs_height.Value = oina.vs_height;
            //    txt_vs_blood_pressure.Value = oina.vs_blood_pressure;
            //    txt_vs_bmi.Value = oina.vs_BMI;
            //    txt_vs_spo2.Value = oina.vs_spO2;
            //    txt_pulse.Value = oina.pulse;

            //    //II.
            //    //1.
            //    txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(oina.chief_complaint);
            //    //2.
            //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + oina.allergy);
            //    if (rad_allergy_true.Checked)
            //    {
            //        txt_allergy_note.Value = WebHelpers.TextToHtmlTag(oina.allergy_note);
            //    }
            //    //3.
            //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_mental_status_" + oina.mental_status);
            //    if (rad_mental_status_true.Checked)
            //    {
            //        txt_mental_status_note.Value = WebHelpers.TextToHtmlTag(oina.mental_status_note);
            //    }
            //    //4
            //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_paint_score_code_" + oina.paint_score_code);
            //    //5
            //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fall_risk_" + oina.fall_risk);
            //    if (rad_fall_risk_true.Checked)
            //    {
            //        txt_fall_risk_assistance.Value = WebHelpers.TextToHtmlTag(oina.fall_risk_assistance);
            //    }
            //    //6.
            //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_" + oina.nutrition_status_code);
            //    //III.
            //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_housing_code_" + oina.housing_code, "aln");
            //    //IV.
            //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_prioritization_code_" + oina.prioritization_code, "wa");

            //    WebHelpers.BindDateTimePicker(dtpk_assessment_date_time, oina.assessment_date_time);

            //    DataObj.Value = JsonConvert.SerializeObject(oina);
            //    Session["docid"] = oina.document_id;
            //    WebHelpers.AddScriptFormEdit(Page, oina, (string)Session["emp_id"], loc);

            //}
            //catch (Exception ex)
            //{
            //    WebHelpers.SendError(Page, ex);
            //}
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

                #region 4. Tầm soát bệnh lây nhiễm/ Communicable disease screening:
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
                            dynamic flacc = JsonConvert.DeserializeObject(Model.flacc);
                            int flaccFace = flacc.face != null ? flacc.face : 0;
                            int flaccLegs = flacc.legs != null ? flacc.legs : 0;
                            int flaccActivity = flacc.activity != null ? flacc.activity : 0;
                            int flaccCry = flacc.cry != null ? flacc.cry : 0;
                            int flaccConsolability = flacc.consolability != null ? flacc.consolability : 0;

                            lbl_flacc_face.Text = flacc.face;
                            lbl_flacc_legs.Text = flacc.legs;
                            lbl_flacc_activity.Text = flacc.activity;
                            lbl_flacc_cry.Text = flacc.cry;
                            lbl_flacc_consolability.Text = flacc.consolability;

                            flacc_total_score.Text = (flaccFace + flaccLegs + flaccActivity + flaccCry + flaccConsolability).ToString();
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

                            lbl_npass_total_score.Text = Convert.ToString(npass.total_score);
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

                #region 7. Tầm soát nguy cơ té ngã/ Fall risk screening:
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
                lbl_bmi.Text = Model.vs_BMI;
                previous_weight_wrapper.Visible = false;
                lbl_previous_weight.Visible = true;
                if (Model.nutritional_status_screening != null)
                {
                    dynamic nutritional_status_screening = JsonConvert.DeserializeObject(Model.nutritional_status_screening);

                    lbl_previous_weight.Text = nutritional_status_screening.previous_weight;
                    lbl_weight_change.Text = nutritional_status_screening.weight_change;
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

                #region III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT:
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
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

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
            //try
            //{
            //    oina.vs_temperature = txt_vs_temperature.Value;
            //    oina.vs_heart_rate = txt_vs_heart_rate.Value;
            //    oina.vs_weight = txt_vs_weight.Value;
            //    oina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            //    oina.vs_height = txt_vs_height.Value;
            //    oina.vs_blood_pressure = txt_vs_blood_pressure.Value;
            //    oina.vs_BMI = txt_vs_bmi.Value;
            //    oina.vs_spO2 = txt_vs_spo2.Value;
            //    oina.pulse = txt_pulse.Value;
            //    //1.
            //    oina.chief_complaint = txt_chief_complaint.Value;
            //    //2.
            //    oina.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(),"rad_allergy_");
            //    oina.allergy_note = WebHelpers.GetBool(oina.allergy, txt_allergy_note.Value, null);
            //    //3.
            //    oina.mental_status = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_mental_status_");
            //    oina.mental_status_note = WebHelpers.GetBool(oina.mental_status, null, txt_mental_status_note.Value);
            //    //4.
            //    oina.paint_score_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
            //    oina.paint_score_description = WebHelpers.GetDicDesc(oina.paint_score_code, Oina.PAINT_SCORE_CODE);
            //    //5.
            //    oina.fall_risk = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_risk_");
            //    oina.fall_risk_assistance = WebHelpers.GetBool(oina.fall_risk, txt_fall_risk_assistance.Value, null);

            //    oina.nutrition_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_", Oina.NUTRITION_STATUS_CODE);
            //    oina.nutrition_status_description = WebHelpers.GetDicDesc(oina.nutrition_status_code, Oina.NUTRITION_STATUS_CODE);

            //    oina.housing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_housing_code_", Oina.HOUSING_CODE);
            //    oina.housing_description = WebHelpers.GetDicDesc(oina.housing_code, Oina.HOUSING_CODE);

            //    oina.prioritization_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", Oina.PRIORITIZATION_CODE);
            //    oina.prioritization_description = WebHelpers.GetDicDesc(oina.prioritization_code, Oina.PRIORITIZATION_CODE);

            //    oina.assessment_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assessment_date_time.SelectedDate);

            //    if (JsonConvert.SerializeObject(oina) == DataObj.Value)
            //    {
            //        WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
            //    }

            //    //
            //    oina.amend_reason = txt_amend_reason.Text;
            //    oina.user_name = (string)Session["UserID"];

            //    dynamic result = oina.Update(loc)[0];

            //    if (result.Status == System.Net.HttpStatusCode.OK)
            //    {
            //        WebHelpers.Notification(Page, CONST_MESSAGE.MESSAGE_SAVE_SUCCESS);
            //        Initial();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    WebHelpers.SendError(Page, ex);
            //}
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
            field_naf.Visible
                = field_flacc.Visible
                = field_npass.Visible
                = field_nonv.Visible
                = false;

            //var control = FindControl($"{value}_field");
            var control = FindControl($"{value}");

            if (control != null)
            {
                control.Visible = true;
            }
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
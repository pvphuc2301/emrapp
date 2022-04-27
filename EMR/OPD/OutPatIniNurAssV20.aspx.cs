using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.OPD
{
    public partial class OutPatIniNurAssV20 : System.Web.UI.Page
    {
        Oina oina;
        PatientInfo patientInfo;
        PatientVisitInfo patientVisitInfo;
        public string PAGE_URL { get; set; }
        public string loc { get; set; }
        public string locChanged { get; set; }
        public string varDocID { get; set; }
        public string varDocIdLog { get; set; }
        public string varModelID { get; set; }
        public string varPVID { get; set; }
        public string varVPID { get; set; }
        public string varPID { get; set; }

        public string SignatureDate { get; set; }
        public string SignatureName { get; set; }
        //public string[] PATIENT_EDUCATION_NEEDS_CODE { get; set; } 
        //    = new string[] { "fall_risk_prevention", "wound_care", "diet", "pain", "oth" };
        public static Dictionary<string, string> PATIENT_EDUCATION_NEEDS = new Dictionary<string, string>()
        {
            { "FAL", "Phòng ngừa té ngã/ Fall risk prevention" },
            { "WOU", "Chăm sóc vết thương/ Wound care" },
            { "DIE", "Chế độ ăn uống/ Diet" },
            { "PAI", "Đau/ Pain" },
            { "OTH", "" },
        };

        public static Dictionary<string, string> IM_CONSUL_REQ = new Dictionary<string, string>()
        {
            { "EME", "Tình trạng nặng cần xử lí ngay/ Emergency cases" },
            { "CHI", "Trẻ em dưới 6 tuổi/ Children are under 6 years of age" },
            { "SER", "Người khuyết tật nặng/ Servere disabilities" },
            { "PAT", "Người bệnh trên 80 tuổi/ Patient are over 80 years of age" },
            { "PRE", "Phụ nữ có thai trên 24 tuần/ Prenancy is over 24 weeks" },
            { "BOO", "Người bệnh có hẹn/ Booked appointment patients" },
            { "OTH", "" },
        };

        public static Dictionary<string, string> FALL_RISK_FACTORS = new Dictionary<string, string>()
        {
            { "AGR", "Tuổi > 65/ Age > 65" },
            { "ALE", "Tuổi < 3/ Age < 3" },
            { "PRE", "Phụ nữ có thai/ Pregnant women" },
            { "AMB", "Sử dụng phương tiện hỗ trợ đi lại (gậy/nạng/khung tập đi)/ Ambulatory devices (canes, crutches, and walkers)" },
            { "INA", "Không có khả năng đứng lên từ ghế/ Inability to rise from a chair." },
            { "PAT", "Dáng đi yếu hoặc mất thăng bằng/ Patients with gait or balance disturbances" },
            { "POD", "Mất trí nhớ/ Presence of dementia" },
            { "IMP", "Giảm/ Mất thị lực/ Patients with visual impairments" },
            { "EAR", "Bệnh nhân có vấn đề về tai có triệu chứng chóng mặt/ Patients have ear problems with complaints of dizziness and/or vertigo." },
            { "NFR", "Không có yếu tố nguy cơ/ No fall risk." },
        };

        public static Dictionary<string, string> INTERVENTION = new Dictionary<string, string>()
        {
            { "STI", "Dán sticker nguy cơ ngã/ Stick fall-risk on patient's shirt" },
            { "EDU", "Thông báo nguy cơ té ngã cho người bệnh/ người nhà/ Educate the fall risk to patient/ Relatives" },
            { "ASS", "Trợ giúp người bệnh di chuyển, đi lại/ Assist patient with transfer/ ambulation" },
            { "STR", "Cung cấp dụng cụ hỗ trợ di chuyển (Băng ca, xe đẩy...)/ Assist patient with transfer/ ambulation (Stretcher, wheelchair)" },
            { "EPA", "Hướng dẫn ba mẹ/ người thân bệnh nhi luôn quan sát bé cẩn thận và luôn ở cùng bé/ Educate Parents to keep an eye on their children closely and never let him/her alone" },
            { "INS", "Hướng dẫn ba mẹ/ người thân bệnh nhi hạn chế cho bé chạy nhảy/ Instruct Parents/ accompanying family members limit the child to run." },
            { "ENC", "Khuyến khích di chuyển bằng nôi/ xe nôi đối với trẻ sơ sinh và nhủ nhi/ Encourage parents/ Caregivers to use cribs for newborn/ neonatal in moving" },
            { "PFR", "Đeo vòng tay nguy cơ ngã khi/ Place Fall Risk ID bracelet on patient in cases of" },
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            string url = Request.RawUrl.Split('.')[0];
            var urlArr = url.Split('/');
            url = urlArr[urlArr.Length - 1];

            PAGE_URL = $"/OPD/{url}.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
                SetDefaultValue();
            }

            PostBackEvent();
        }
        private void SetDefaultValue()
        {
            if (RadGrid1.Items.Count <= 1)
            {
                //3. 
                rad_mental_status_true.Checked = true;
                //4.
                rad_high_fever_false.Checked 
                    = rad_contact_infectious_disease_false.Checked
                    = rad_close_contact_false.Checked
                    = rad_injectious_risk_false.Checked
                    = true;
                //5. 
                rad_naf_true.Checked 
                    = rad_paint_score_code_0.Checked
                    = true;
                LoadPainAssessmentScale("NaF");
                //6.
                rad_btc_language_false.Checked
                    = rad_btc_cognitive_false.Checked
                    = rad_btc_sensory_false.Checked
                    = rad_btc_religious_false.Checked
                    = rad_btc_cultural_false.Checked
                    = true;
                //7.
                rad_no_fall_risks_true.Checked = true;
                no_fall_risks_change();
                //IV.
                rad_prioritization_code_wa.Checked = true;
                prioritization_change();
            }
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Oina oina = new Oina(varDocID, loc);
                oina.status = DocumentStatus.FINAL;
                //WebHelpers.RefreshMenu(Page);
                UpdateData(oina);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Oina oina = new Oina(varDocID, loc);
                oina.status = DocumentStatus.DRAFT;
                //WebHelpers.RefreshMenu(Page);
                UpdateData(oina);
            }
        }
        private void UpdateData(Oina oina)
        {
            try
            {
                oina.vs_temperature = txt_vs_temperature.Value;
                oina.vs_heart_rate = txt_vs_heart_rate.Value;
                oina.vs_weight = txt_vs_weight.Value;
                oina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                oina.vs_height = txt_vs_height.Value;
                oina.vs_blood_pressure = txt_vs_blood_pressure.Value;
                oina.vs_BMI = txt_vs_bmi.Value;
                oina.vs_spO2 = txt_vs_spo2.Value;
                oina.pulse = txt_pulse.Value;
                //1.
                oina.chief_complaint = txt_chief_complaint.Value;
                //2.
                oina.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                oina.allergy_note = WebHelpers.GetBool(oina.allergy, txt_allergy_note.Value, null);
                //3.
                oina.mental_status = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_mental_status_");
                oina.mental_status_note = WebHelpers.GetBool(oina.mental_status, null, txt_mental_status_note.Value);
                //4.

                dynamic communicable_disease_screening = new System.Dynamic.ExpandoObject();
                communicable_disease_screening.high_fever = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_high_fever_");
                communicable_disease_screening.contact_infectious_disease = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_contact_infectious_disease_");
                communicable_disease_screening.close_contact = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_close_contact_");
                communicable_disease_screening.injectious_risk = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_injectious_risk_");

                oina.communicable_disease_screening = JsonConvert.SerializeObject(communicable_disease_screening);

                //5. Đánh giá đau/ Pain assessment:

                string[] PainAsessmentTypes = new string[] { "NAF", "FLACC", "NPASS", "NONV" };

                //
                oina.paint_score_code = null;
                oina.paint_score_description = null;
                oina.flacc = null;
                oina.flacc_conclude = null;
                oina.npass = null;
                oina.npass_conclude = null;

                if (rad_naf_true.Checked)
                {
                    oina.paint_score_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                    oina.paint_score_description = WebHelpers.GetDicDesc(oina.paint_score_code, Oina.PAINT_SCORE_CODE);
                }
                else if (rad_flacc_true.Checked)
                {
                    dynamic flacc = new System.Dynamic.ExpandoObject();

                    flacc.face = txt_flacc_face.Text;
                    flacc.legs = txt_flacc_legs.Text;
                    flacc.activity = txt_flacc_activity.Text;
                    flacc.cry = txt_flacc_cry.Text;
                    flacc.consolability = txt_flacc_consolability.Text;

                    flacc.total_score = CalculateFLACC();

                    oina.flacc = JsonConvert.SerializeObject(flacc);
                    oina.flacc_conclude = lbl_flacc_conclude1.Text;
                }
                else if (rad_npass_true.Checked)
                {
                    dynamic npass = new System.Dynamic.ExpandoObject();

                    npass.crying = txt_npass_crying.Text;
                    npass.behavior = txt_npass_behavior.Text;
                    npass.facial_expression = txt_npass_facial_expression.Text;
                    npass.extremities_tone = txt_npass_extremities_tone.Text;
                    npass.vital_signs = txt_npass_vital_signs.Text;
                    npass.gestation_3 = txt_npass_gestation_3.Text;
                    npass.gestation_2 = txt_npass_gestation_2.Text;
                    npass.gestation_1 = txt_npass_gestation_1.Text;
                    npass.total_score = CalculateNPASS();

                    oina.npass = JsonConvert.SerializeObject(npass);
                    oina.npass_conclude = lbl_npass_conclude1.Text;
                }

                //6. Trở ngại chăm sóc/ Barrier to care:
                dynamic barrier_to_care = new System.Dynamic.ExpandoObject();
                barrier_to_care.btc_language = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_btc_language_");
                barrier_to_care.btc_language_note = txt_btc_language_note.Value;
                barrier_to_care.btc_cognitive = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_btc_cognitive_");
                barrier_to_care.btc_cognitive_note = txt_btc_cognitive_note.Value;
                barrier_to_care.btc_sensory = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_btc_sensory_");
                barrier_to_care.btc_sensory_note = txt_btc_sensory_note.Value;
                barrier_to_care.btc_religious = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_btc_religious_");
                barrier_to_care.btc_religious_note = txt_btc_religious_note.Value;
                barrier_to_care.btc_cultural = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_btc_cultural_");
                barrier_to_care.btc_cultural_note = txt_btc_cultural_note.Value;

                oina.barrier_to_care = JsonConvert.SerializeObject(barrier_to_care);
                //7. Tầm soát nguy cơ té ngã/ Fall risk morse scale:
                //- Các yếu tố nguy cơ/ Fall risk factors:

                string fall_risk_questions_result = null;
                string intervention_result = null;

                if (rad_no_fall_risks_false.Checked)
                {
                    //- Câu hỏi sàng lọc/ The fall risk screen question:
                    dynamic fall_risk_questions = new System.Dynamic.ExpandoObject();
                    fall_risk_questions.fallen = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fallen_");
                    fall_risk_questions.feel_unsteady = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_feel_unsteady_");
                    fall_risk_questions.worry_about_falling = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_worry_about_falling_");
                    fall_risk_questions_result = JsonConvert.SerializeObject(fall_risk_questions);

                    //- Can thiệp/ Intervention:
                    intervention_result = WebHelpers.GetCheckBox(form1, "cb_intervention_", INTERVENTION, out DataTable dtb_intervention);
                }


                oina.fall_risk_questions = fall_risk_questions_result;
                oina.intervention = intervention_result;
                oina.fall_risk_factors = WebHelpers.GetCheckBox(form1, "cb_fall_risk_factors_", FALL_RISK_FACTORS, out DataTable dtb_fall_risk_factors);


                //dynamic fall_risk_factors = new System.Dynamic.ExpandoObject();
                //fall_risk_factors.age_65 = cb_age_65_true.Checked;
                //fall_risk_factors.pregnant_women = cb_pregnant_women_true.Checked;
                //fall_risk_factors.inability_rise_from_chair = cb_inability_rise_from_chair_true.Checked;
                //fall_risk_factors.presence_dementia = cb_presence_dementia_true.Checked;
                //fall_risk_factors.ear_problems = cb_ear_problems_true.Checked;
                //fall_risk_factors.age_3 = cb_age_3_true.Checked;
                //fall_risk_factors.ambulatory_devices = cb_ambulatory_devices_true.Checked;
                //fall_risk_factors.balance_disturbances = cb_balance_disturbances_true.Checked;
                //fall_risk_factors.visual_impairments = cb_visual_impairments_true.Checked;
                //fall_risk_factors.no_fall_risks = rad_no_fall_risks_true.Checked;



                //oina.fall_risk_factors = JsonConvert.SerializeObject(fall_risk_factors);

                //8. Đánh giá tình trạng dinh dưỡng/ Nutritional status screening:
                dynamic nutritional_status_screening = new System.Dynamic.ExpandoObject();
                nutritional_status_screening.previous_weight = txt_previous_weight.Value;
                nutritional_status_screening.weight_change = lbl_weight_change.Text;
                oina.nutritional_status_screening = JsonConvert.SerializeObject(nutritional_status_screening);

                //- Tình trạng dinh dưỡng/ Nutrition status:
                dynamic nutritional_status = new System.Dynamic.ExpandoObject();

                nutritional_status.ns_code = "";
                nutritional_status.ns_score = "";

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

                        nutritional_status.ns_code = code;
                        nutritional_status.ns_score = ScoreTemp;

                        break;
                    }
                }

                //-	Sụt cân không chủ ý trong 3 tháng gần đây/Unintentional weight loss in the last 3 months:
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

                nutritional_status.loss_weight = LossWeight;

                //- Khả năng ăn uống/ Food intake:
                int? FoodIntake = null;

                if (rad_ns_food_intake_0.Checked) FoodIntake = 0;
                else if (rad_ns_food_intake_2.Checked) FoodIntake = 2;
                nutritional_status.food_intake = FoodIntake;

                nutritional_status.total_score = nutritional_status.ns_score + LossWeight + FoodIntake;

                oina.nutritional_status = JsonConvert.SerializeObject(nutritional_status);

                oina.nutritional_conclude = lbl_nutritional_conclude1.Text;

                //IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION

                oina.prioritization_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", Oina.PRIORITIZATION_CODE);
                oina.prioritization_description = WebHelpers.GetDicDesc(oina.prioritization_code, Oina.PRIORITIZATION_CODE);
                if (oina.prioritization_code == "IM")
                {
                    WebHelpers.GetCheckBox(form1, "cb_im_consul_req_", IM_CONSUL_REQ, out DataTable dtb_im_consul_req);
                    string dtb_im_consul_req_result = null;
                    if (cb_im_consul_req_oth.Checked)
                    {
                        foreach (DataRow dtRow in dtb_im_consul_req.Rows)
                        {
                            if (Convert.ToString(dtRow["code"]) == "OTH")
                            {
                                dtRow["desc"] = txt_im_consul_req_oth.Value;
                            }
                        }
                    }

                    if(dtb_im_consul_req.Rows.Count > 0)
                    {
                        dtb_im_consul_req_result = JsonConvert.SerializeObject(dtb_im_consul_req);
                    }

                    oina.immediate_consulting_requirement = dtb_im_consul_req_result; 
                }
                //V. NHU CẦU GIÁO DỤC SỨC KHỎE/PATIENT EDUCATION NEEDS
                //dynamic p_edu_needs = new System.Dynamic.ExpandoObject();

                WebHelpers.GetCheckBox(form1, "cb_patient_education_need_", PATIENT_EDUCATION_NEEDS, out DataTable dtb_patient_edu_need);
                string dtb_patient_edu_need_result = null;
                if (cb_patient_education_need_oth.Checked)
                {
                    foreach (DataRow dtRow in dtb_patient_edu_need.Rows)
                    {
                        if (Convert.ToString(dtRow["code"]) == "OTH")
                        {
                            dtRow["desc"] = txt_patient_edu_need_oth.Value;
                        }
                    }
                }

                if(dtb_patient_edu_need.Rows.Count > 0)
                {
                    dtb_patient_edu_need_result = JsonConvert.SerializeObject(dtb_patient_edu_need);
                }

                oina.patient_education_needs = dtb_patient_edu_need_result; ;

                //oina.paint_score_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                //oina.paint_score_description = WebHelpers.GetDicDesc(oina.paint_score_code, Oina.PAINT_SCORE_CODE);
                ////5.
                //oina.fall_risk = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_risk_");
                ////oina.fall_risk_assistance = WebHelpers.GetBool(oina.fall_risk, txt_fall_risk_assistance.Value, null);

                //oina.nutrition_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_", Oina.NUTRITION_STATUS_CODE);
                //oina.nutrition_status_description = WebHelpers.GetDicDesc(oina.nutrition_status_code, Oina.NUTRITION_STATUS_CODE);

                oina.housing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_housing_code_", Oina.HOUSING_CODE);
                oina.housing_description = WebHelpers.GetDicDesc(oina.housing_code, Oina.HOUSING_CODE);

                //oina.prioritization_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", Oina.PRIORITIZATION_CODE);
                //oina.prioritization_description = WebHelpers.GetDicDesc(oina.prioritization_code, Oina.PRIORITIZATION_CODE);

                oina.assessment_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Now);

                //if (JsonConvert.SerializeObject(oina) == DataObj.Value)
                //{
                //    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                //}

                //

                oina.amend_reason = txt_amend_reason.Text;
                oina.user_name = (string)Session["UserID"];

                dynamic result = oina.Update(loc)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.MESSAGE_SAVE_SUCCESS);
                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Oina.Delete((string)Session["UserId"], varDocID, loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);

                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                oina = new Oina(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, oina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(oina);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);

            Initial();
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        private void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    oina = new Oina(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    oina = new Oina(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Oina.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.setBmi(bmiStr, oina.vs_BMI);
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (oina.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(oina, WebHelpers.LoadFormControl(form1, oina, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(oina);
                }
                else if (oina.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(oina, WebHelpers.LoadFormControl(form1, oina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }
                
                //WebHelpers.getAccessButtons(form1, oina.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = oina.status,
                    AccessGroup = (string)Session["group_access"],
                    AccessAuthorize = (string)Session["access_authorize"],
                    IsSameCompanyCode = loc == locChanged,
                    IsViewLog = varDocIdLog != null
                });
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void LoadPatientInfo()
        {
            lblFirstName.Text = patientInfo.first_name_l;
            lblLastName.Text = patientInfo.last_name_l;
            lblGender.Text = patientInfo.gender_l;

            WebHelpers.ConvertDateTime(patientInfo.DOB, out bool isValid, out string DOB, "dd-MM-yyyy");
            lblDoB.Text = DOB + " (" + patientInfo.Age + "t)";

            lblPatientAddress.Text = patientInfo.Address;
            lblContactPerson.Text = patientInfo.Contact;
            lblRelationship.Text = patientInfo.Relationship;
            lblVisitCode.Text = patientVisitInfo.VisitCode;

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
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

        private void PostBackEvent()
        {
            string EVENTTARGET = Request["__EVENTTARGET"];

            switch (EVENTTARGET)
            {
                case "patient_education_need_oth_change":
                    field_patient_edu_need_oth.Visible = cb_patient_education_need_oth.Checked;
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
                case "weight_of_last_month_change":
                    CalculateWeightChange();
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

        private void mental_status_change(string value)
        {
            field_mental_status_false.Visible = false;
            btc_change("field_mental_status", value);
        }

        private void prioritization_change()
        {
            immediate_consulting_requirement.Visible = rad_prioritization_code_im.Checked;
        }

        private void no_fall_risks_change()
        {
            cb_fall_risk_factors_agr.Checked
                    = cb_fall_risk_factors_ale.Checked
                    = cb_fall_risk_factors_amb.Checked
                    = cb_fall_risk_factors_ear.Checked
                    = cb_fall_risk_factors_imp.Checked
                    = cb_fall_risk_factors_ina.Checked
                    = cb_fall_risk_factors_pat.Checked
                    = cb_fall_risk_factors_pod.Checked
                    = cb_fall_risk_factors_pre.Checked
                    = false;

            rad_fallen_false.Checked
                    = rad_feel_unsteady_false.Checked
                    = rad_worry_about_falling_false.Checked
                    = true;

            cb_intervention_sti.Checked
                    = cb_intervention_ass.Checked
                    = cb_intervention_edu.Checked
                    = cb_intervention_enc.Checked
                    = cb_intervention_epa.Checked
                    = cb_intervention_ins.Checked
                    = cb_intervention_pfr.Checked
                    = cb_intervention_str.Checked
                    = false;

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
        private void BindingDataFormPrint(Oina oina)
        {
            prt_allergy_false.Text
                = prt_allergy_true.Text
                = prt_mental_status_false.Text
                = prt_mental_status_true.Text
                = prt_pain_score_code_0.Text
                = prt_pain_score_code_1.Text
                = prt_pain_score_code_2.Text
                = prt_pain_score_code_3.Text
                = prt_pain_score_code_4.Text
                = prt_pain_score_code_5.Text
                = prt_btc_language_true.Text
                = prt_btc_language_false.Text
                = prt_btc_cognitive_true.Text
                = prt_btc_cognitive_false.Text
                = prt_btc_cultural_true.Text
                = prt_btc_cultural_false.Text
                = prt_btc_religious_true.Text
                = prt_btc_religious_false.Text
                = prt_btc_sensory_true.Text
                = prt_btc_sensory_false.Text
                = prt_fall_risk_factor_agr.Text
                = prt_fall_risk_factor_pre.Text
                = prt_fall_risk_factor_ina.Text
                = prt_fall_risk_factor_pod.Text
                = prt_fall_risk_factor_ear.Text
                = prt_fall_risk_factor_ale.Text
                = prt_fall_risk_factor_amb.Text
                = prt_fall_risk_factor_pat.Text
                = prt_fall_risk_factor_imp.Text
                //= prt_fall_risk_factor_nfr.Text

                = prt_fallen_true.Text
                = prt_fallen_false.Text
                = prt_feel_unsteady_true.Text
                = prt_feel_unsteady_false.Text
                = prt_worry_about_falling_true.Text
                = prt_worry_about_falling_false.Text

                = prt_intervention_sti.Text
                = prt_intervention_edu.Text
                = prt_intervention_ass.Text
                = prt_intervention_str.Text
                = prt_intervention_epa.Text
                = prt_intervention_ins.Text
                = prt_intervention_enc.Text
                = prt_intervention_pfr.Text

                = prt_flacc_conclude_0.Text
                = prt_flacc_conclude_1.Text
                = prt_flacc_conclude_2.Text
                = prt_flacc_conclude_3.Text

                = prt_npass_conclude_0.Text
                = prt_npass_conclude_1.Text
                = prt_npass_conclude_2.Text

                = prt_nutritional_conclude_0.Text
                = prt_nutritional_conclude_1.Text
                = prt_nutritional_conclude_2.Text

                = prt_housing_code_aln.Text
                = prt_housing_code_rel.Text

                = prt_im_consul_req_eme.Text
                = prt_im_consul_req_chi.Text
                = prt_im_consul_req_ser.Text
                = prt_im_consul_req_pat.Text
                = prt_im_consul_req_pre.Text
                = prt_im_consul_req_boo.Text
                = prt_im_consul_req_oth.Text

                = prt_patient_education_need_fal.Text
                = prt_patient_education_need_wou.Text
                = prt_patient_education_need_die.Text
                = prt_patient_education_need_pai.Text
                = prt_patient_education_need_oth.Text
                = "❏";

            prt_fullname.Text = $"{patientInfo.FullName} ({patientInfo.Title})";
            prt_DOB.Text = $"{WebHelpers.FormatDateTime(patientInfo.DOB)} | {patientInfo.Gender}";
            prt_vpid.Text = patientInfo.visible_patient_id;

            WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);

            prt_vs_temperature.Text = oina.vs_temperature;
            prt_vs_weight.Text = oina.vs_weight;
            prt_vs_height.Text = oina.vs_height;
            prt_vs_BMI.Text = oina.vs_BMI;
            prt_pulse.Text = oina.vs_heart_rate;
            prt_vs_respiratory_rate.Text = oina.vs_respiratory_rate;
            prt_vs_blood_pressure.Text = oina.vs_blood_pressure;
            prt_vs_spO2.Text = oina.vs_spO2;
            prt_chief_complaint.Text = oina.chief_complaint;

            if(oina.allergy != null)
            {
               var allergy =  FindControl($"prt_allergy_{oina.allergy}");
                ((Label)allergy).Text = "☒";
                if (oina.allergy)
                {
                    prt_allergy_note.Text = oina.allergy_note;
                }
            }

            //3.
            if (oina.mental_status != null)
            {
                var mental_status = FindControl($"prt_mental_status_{oina.mental_status}");
                ((Label)mental_status).Text = "☒";
                if (oina.mental_status)
                {
                    prt_mental_status_note.Text = oina.mental_status_note;
                }
            }

            //4

            dynamic communicable_disease_screening = JsonConvert.DeserializeObject(oina.communicable_disease_screening);

            if (communicable_disease_screening.high_fever != null)
            {
                var high_fever = FindControl($"prt_high_fever_{communicable_disease_screening.high_fever}");
                if(high_fever != null) ((Label)high_fever).Text = "x";
            }

            if (communicable_disease_screening.contact_infectious_disease != null)
            {
                var contact_infectious_disease = FindControl($"prt_contact_infectious_disease_{communicable_disease_screening.contact_infectious_disease}");
                if(contact_infectious_disease != null) ((Label)contact_infectious_disease).Text = "x";
            }

            if (communicable_disease_screening.close_contact != null)
            {
                var close_contact = FindControl($"prt_close_contact_{communicable_disease_screening.close_contact}");
                if(close_contact != null) ((Label)close_contact).Text = "x";
            }

            if (communicable_disease_screening.injectious_risk != null)
            {
                var injectious_risk = FindControl($"prt_injectious_risk_{communicable_disease_screening.injectious_risk}");
                if(injectious_risk != null) ((Label)injectious_risk).Text = "x";
            }

            //5
            
            string PainAssessmentScale = GetPainAssessmentScale(oina);
            
            prt_naf_wrapper.Visible
                = prt_flacc_wrapper.Visible
                = prt_npass_wrapper.Visible
                = prt_nonv_wrapper.Visible
                = false;

            switch (PainAssessmentScale)
            {
                case "NaF":
                    prt_naf_wrapper.Visible = true;
                    if (oina.paint_score_code != null)
                    {
                        var paint_score_code = FindControl($"prt_pain_score_code_{oina.paint_score_code}");
                        if (paint_score_code != null) ((Label)paint_score_code).Text = "☒";
                    }
                    break;
                case "FLACC": //FLACC
                    prt_flacc_wrapper.Visible = true;
                    if (oina.flacc != null)
                    {
                        dynamic flacc = JsonConvert.DeserializeObject(oina.flacc);
                        
                        prt_flacc_face.Text = flacc.face;
                        prt_flacc_legs.Text = flacc.legs;
                        prt_flacc_activity.Text = flacc.activity;
                        prt_flacc_cry.Text = flacc.cry;
                        prt_flacc_consolability.Text = flacc.consolability;

                        prt_flacc_total_score.Text = flacc.total_score;
                        
                        if(flacc.total_score >= 7)
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
                case "NPASS": //N-PASS
                    prt_npass_wrapper.Visible = true;
                    if (oina.npass != null)
                    {
                        dynamic npass = JsonConvert.DeserializeObject(oina.npass);
                        prt_npass_crying.Text = npass.crying;
                        prt_npass_behavior.Text = npass.behavior;
                        prt_npass_facial_expression.Text = npass.facial_expression;
                        prt_npass_extremities_tone.Text = npass.extremities_tone;
                        prt_npass_vital_signs.Text = npass.vital_signs;
                        prt_npass_gestation_3.Text = npass.gestation_3;
                        prt_npass_gestation_2.Text = npass.gestation_2;
                        prt_npass_gestation_1.Text = npass.gestation_1;

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
                case "NONV"://Non-verbal
                    prt_nonv_wrapper.Visible = false;
                    break;
            }

            //6
            dynamic barrier_to_care = JsonConvert.DeserializeObject(oina.barrier_to_care);

            if (barrier_to_care != null)
            {
                if(barrier_to_care.btc_language != null)
                {
                    var btc_language = FindControl($"prt_btc_language_{barrier_to_care.btc_language}");
                    if(btc_language != null) ((Label)btc_language).Text = "☒";
                    if (Convert.ToBoolean(barrier_to_care.btc_language))
                    {
                        prt_btc_language_note.Text = barrier_to_care.btc_language_note;
                    }
                }

                if (barrier_to_care.btc_cognitive != null)
                {
                    var btc_cognitive = FindControl($"prt_btc_cognitive_{barrier_to_care.btc_cognitive}");
                    if(btc_cognitive != null) ((Label)btc_cognitive).Text = "☒";
                    if (Convert.ToBoolean(barrier_to_care.btc_cognitive))
                    {
                        prt_btc_cognitive_note.Text = barrier_to_care.btc_cognitive_note;
                    }
                }

                if (barrier_to_care.btc_sensory != null)
                {
                    var btc_sensory = FindControl($"prt_btc_sensory_{barrier_to_care.btc_sensory}");
                    if(btc_sensory != null) ((Label)btc_sensory).Text = "☒";
                    if (Convert.ToBoolean(barrier_to_care.btc_sensory))
                    {
                        prt_btc_sensory_note.Text = barrier_to_care.btc_sensory_note;
                    }

                }

                if (barrier_to_care.btc_religious != null)
                {
                    var btc_religious = FindControl($"prt_btc_religious_{barrier_to_care.btc_religious}");
                    if(btc_religious != null) ((Label)btc_religious).Text = "☒";
                    if (Convert.ToBoolean(barrier_to_care.btc_religious))
                    {
                        prt_btc_religious_note.Text = barrier_to_care.btc_religious_note;
                    }

                }

                if (barrier_to_care.btc_cultural != null)
                {
                    var btc_cultural = FindControl($"prt_btc_cultural_{barrier_to_care.btc_cultural}");
                    if(btc_cultural != null) ((Label)btc_cultural).Text = "☒";
                    if (Convert.ToBoolean(barrier_to_care.btc_cultural))
                    {
                        prt_btc_cultural_note.Text = barrier_to_care.btc_cultural_note;
                    }

                }
            }

            //7
            DataTable fall_risk_factors = WebHelpers.GetJSONToDataTable(oina.fall_risk_factors);
            prt_fall_risk_factor_nfr.Visible = prt_fall_risk_factor.Visible = false;
            if (fall_risk_factors != null)
            {
                if (oina.fall_risk_factors.Contains("\"code\":\"NFR\""))
                {
                    prt_fall_risk_factor_nfr.Visible = true;
                }
                else
                {
                    prt_fall_risk_factor.Visible = true;
                    foreach (DataRow row in fall_risk_factors.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_fall_risk_factor_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }
            }

            
            
            prt_fall_risk_factor_nfr_wrapper.Visible = !cb_fall_risk_factors_nfr.Checked;

            if (oina.fall_risk_questions != null)
            {
                dynamic fall_risk_questions = JsonConvert.DeserializeObject(oina.fall_risk_questions);

                if (fall_risk_questions.fallen != null)
                {
                    var fallen = FindControl($"prt_fallen_{fall_risk_questions.fallen}");
                    if (fallen != null) ((Label)fallen).Text = "☒";
                }

                if (fall_risk_questions.feel_unsteady != null)
                {
                    var feel_unsteady = FindControl($"prt_feel_unsteady_{fall_risk_questions.feel_unsteady}");
                    if (feel_unsteady != null) ((Label)feel_unsteady).Text = "☒";
                }

                if (fall_risk_questions.worry_about_falling != null)
                {
                    var worry_about_falling = FindControl($"prt_worry_about_falling_{fall_risk_questions.worry_about_falling}");
                    if (worry_about_falling != null) ((Label)worry_about_falling).Text = "☒";
                }
            }

            DataTable intervention = WebHelpers.GetJSONToDataTable(oina.intervention);
            if (intervention != null)
            {
                foreach (DataRow row in intervention.Rows)
                {
                    string code = Convert.ToString(row["code"]);
                    Control control = FindControl("prt_intervention_" + code);
                    if (control != null)
                    {
                        (control as Label).Text = "☒";
                    }
                }
            }

            //8
            dynamic nutritional_status_screening = JsonConvert.DeserializeObject(oina.nutritional_status_screening);
            prt_bmi.Text = oina.vs_BMI;
            prt_previous_weight.Text = nutritional_status_screening.previous_weight;
            prt_weight_change.Text = nutritional_status_screening.weight_change;

            //
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
            dynamic nutritional_status = JsonConvert.DeserializeObject(oina.nutritional_status);
            if(nutritional_status != null)
            {
                if (nutritional_status.ns_code != null && nutritional_status.ns_score != null)
                {
                    var ns_score = FindControl($"prt_ns_{nutritional_status.ns_code}_{nutritional_status.ns_score}");
                    if(ns_score != null) ((Label)ns_score).CssClass = "circle";
                }

                if (nutritional_status.loss_weight != null)
                {
                    var loss_weight = FindControl($"prt_ns_loss_weight_{nutritional_status.loss_weight}");
                    if(loss_weight != null) ((Label)loss_weight).CssClass = "circle";
                }

                if (nutritional_status.food_intake != null)
                {
                    var food_intake = FindControl($"prt_ns_food_intake_{nutritional_status.food_intake}");
                    if(food_intake != null) ((Label)food_intake).CssClass = "circle";
                }

                if (nutritional_status.total_score != null)
                {
                    prt_ns_total_score.Text = nutritional_status.total_score;

                    switch (Convert.ToInt32(nutritional_status.total_score))
                    {
                        case 0:
                            prt_nutritional_conclude_0.Text = "☒";
                            break;
                        case 1:
                            prt_nutritional_conclude_1.Text = "☒";
                            break;
                        default:
                            prt_nutritional_conclude_2.Text = "☒";
                            break;
                    }
                }
            }

            //III
            var housing_code = FindControl($"prt_housing_code_{oina.housing_code}");
            if(housing_code != null) ((Label)housing_code).Text = "☒";

            //IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
            ph_prt_im_consul_req.Visible = false;
            switch (oina.prioritization_code)
            {
                case "WA":
                    prt_prioritization_code.Text = "- Có thể chờ khám trong khoảng thời gian xác định/ Be able to wait for consultation at a specific time";
                    break;
                case "IM":
                    ph_prt_im_consul_req.Visible = true;
                    prt_prioritization_code.Text = "- Cần được khám ngay/ Immediate consulting requirement";
                    
                    break;
            }

            DataTable immediate_consulting_requirement = WebHelpers.GetJSONToDataTable(oina.immediate_consulting_requirement);
            if (immediate_consulting_requirement != null)
            {
                foreach (DataRow row in immediate_consulting_requirement.Rows)
                {
                    string code = Convert.ToString(row["code"]);
                    Control control = FindControl("prt_im_consul_req_" + code);
                    if (control != null)
                    {
                        (control as Label).Text = "☒";
                        if (code == "OTH")
                        {
                            prt_im_consul_req_oth_note.Text = Convert.ToString(row["desc"]);
                        }
                    }
                }
            }

            //V.
            DataTable patient_education_needs = WebHelpers.GetJSONToDataTable(oina.patient_education_needs);
            if (patient_education_needs != null)
            {
                foreach (DataRow row in patient_education_needs.Rows)
                {
                    string code = Convert.ToString(row["code"]);
                    Control control = FindControl("prt_patient_education_need_" + code);
                    if (control != null)
                    {
                        (control as Label).Text = "☒";
                        if(code == "OTH")
                        {
                            prt_patient_education_need_oth_note.Text = Convert.ToString(row["desc"]);
                        }
                    }
                }
            }

            //prt_chief_complaint.InnerText = WebHelpers.TextToHtmlTag(oina.chief_complaint);
        }

        private void FIELD_COLLAPSE(string v1, string v2)
        {
            throw new NotImplementedException();
        }

        private int CalculateFLACC()
        {
            int face = string.IsNullOrEmpty(txt_flacc_face.Text) ? 0 : Convert.ToInt32(txt_flacc_face.Text);
            int legs = string.IsNullOrEmpty(txt_flacc_legs.Text) ? 0 : Convert.ToInt32(txt_flacc_legs.Text);
            int activity = string.IsNullOrEmpty(txt_flacc_activity.Text) ? 0 : Convert.ToInt32(txt_flacc_activity.Text);
            int cry = string.IsNullOrEmpty(txt_flacc_cry.Text) ? 0 : Convert.ToInt32(txt_flacc_cry.Text);
            int consolability = string.IsNullOrEmpty(txt_flacc_consolability.Text) ? 0 : Convert.ToInt32(txt_flacc_consolability.Text);
            int FLACCTotalScore = face + legs + activity + cry + consolability;
            
            return FLACCTotalScore;
        }

        private int CalculateNPASS()
        {
            int NpassCrying = string.IsNullOrEmpty(txt_npass_crying.Text) ? 0 : Convert.ToInt32(txt_npass_crying.Text);
            int NpassBehavior = string.IsNullOrEmpty(txt_npass_behavior.Text) ? 0 : Convert.ToInt32(txt_npass_behavior.Text);
            int NpassFacialExpression = string.IsNullOrEmpty(txt_npass_facial_expression.Text) ? 0 : Convert.ToInt32(txt_npass_facial_expression.Text);
            int NpassExtremitiesTone = string.IsNullOrEmpty(txt_npass_extremities_tone.Text) ? 0 : Convert.ToInt32(txt_npass_extremities_tone.Text);
            int NpassVitalSigns = string.IsNullOrEmpty(txt_npass_vital_signs.Text) ? 0 : Convert.ToInt32(txt_npass_vital_signs.Text);
            int NpassGestation3 = string.IsNullOrEmpty(txt_npass_gestation_3.Text) ? 0 : Convert.ToInt32(txt_npass_gestation_3.Text);
            int NpassGestation2 = string.IsNullOrEmpty(txt_npass_gestation_2.Text) ? 0 : Convert.ToInt32(txt_npass_gestation_2.Text);
            int NpassGestation1 = string.IsNullOrEmpty(txt_npass_gestation_1.Text) ? 0 : Convert.ToInt32(txt_npass_gestation_1.Text);
            
            int NPASSTotalScore = NpassCrying + NpassBehavior + NpassFacialExpression + NpassExtremitiesTone + NpassVitalSigns + NpassGestation3 + NpassGestation2 + NpassGestation1;
            
            string NPASSTotalScoreStr = "";

            lbl_npass_total_score.Text = NPASSTotalScore.ToString();

            switch (NPASSTotalScore)
            {
                case 0:
                    NPASSTotalScoreStr = "Không đau/ No pain";
                    break;
                case 1:
                case 2:
                case 3:
                    NPASSTotalScoreStr = "Đau nhẹ/ Slight pain (1 - 3)";
                    break;
                default:
                    NPASSTotalScoreStr = "Đau vừa - nhiều/ Considerable - Serious pain";
                    break;
            }

            lbl_npass_conclude1.Text = NPASSTotalScoreStr;
            return NPASSTotalScore;
        }

        private void NutritionStatusScoreChange()
        {
            int? NSTotalScore = null;
            int NSAgeScore = !string.IsNullOrEmpty(ns_age_score.Value) ? Convert.ToInt32(ns_age_score.Value) : 0;
            int NSLossWeightScore = !string.IsNullOrEmpty(ns_loss_weight_score.Value) ? Convert.ToInt32(ns_loss_weight_score.Value) : 0;
            int NSFoodIntakeScore = !string.IsNullOrEmpty(ns_food_intake_score.Value) ? Convert.ToInt32(ns_food_intake_score.Value) : 0;
            
            if (!string.IsNullOrEmpty(ns_age_score.Value)
                ||!string.IsNullOrEmpty(ns_loss_weight_score.Value)
                ||!string.IsNullOrEmpty(ns_loss_weight_score.Value))
            {
                NSTotalScore = NSAgeScore + NSLossWeightScore + NSFoodIntakeScore;
                lbl_ns_total_score.Text = NSTotalScore.ToString();

                switch (NSTotalScore)
                {
                    case 0:
                        lbl_nutritional_conclude1.Text = "Không có nguy cơ thiếu dinh dưỡng/ <span class=\"text-primary\">No risk of malnutrition (0)</span>";
                        break;
                    case 1:
                        lbl_nutritional_conclude1.Text = "Nguy cơ thiếu dinh dưỡng thấp/ <span class=\"text-primary\">Low risk of malnutrition (1)</span>";
                        break;
                    default:
                        lbl_nutritional_conclude1.Text = "Nguy cơ thiếu dinh dưỡng cao/ <span class=\"text-primary\">High risk of malnutrition (≥ 2)</span>";
                        break;
                }
            }
        }

        private void CalculateWeightChange()
        {
            if (txt_vs_weight.Value == null && txt_previous_weight.Value == null) return;
            lbl_bmi.Text = txt_vs_bmi.Value;
            int CurrentWeight = int.Parse(txt_vs_weight.Value);
            int PreviousWeight = int.Parse(txt_previous_weight.Value);

            lbl_weight_change.Text = (((CurrentWeight - PreviousWeight) * 100) / CurrentWeight).ToString();
        }

        private void BindingDataForm(Oina oina, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(oina);
            }
            else
            {
                BindingDataFormView(oina);
            }
        }
        private void BindingDataFormView(Oina oina)
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


                //lbl_fall_risk.Text = WebHelpers.GetBool(oina.fall_risk, $"Có, cung cấp phương tiện hỗ trợ/ Yes, provide assistance: {WebHelpers.TextToHtmlTag(oina.fall_risk_assistance)}", "Không có nguy cơ/ No risk");

                lbl_mental_status.Text = WebHelpers.GetBool(oina.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {WebHelpers.TextToHtmlTag(oina.mental_status_note)}");

                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(oina.chief_complaint);

                lbl_allergy.Text = WebHelpers.GetBool(oina.allergy, $"Có, ghi rõ/ Yes, specify: {WebHelpers.TextToHtmlTag(oina.allergy_note)}");

                //lbl_mental_status.Text = WebHelpers.GetBool(oina.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {WebHelpers.TextToHtmlTag(oina.mental_status_note)}");

                //lbl_nutrition_status_description.Text = WebHelpers.TextToHtmlTag(oina.nutrition_status_description);

                ////
                lbl_vs_temperature.Text = oina.vs_temperature + " °C";
                lbl_vs_heart_rate.Text = oina.vs_heart_rate + " /phút (m)";
                lbl_vs_weight.Text = oina.vs_weight + " kg";
                lbl_vs_height.Text = oina.vs_height + " cm";
                lbl_vs_respiratory_rate.Text = oina.vs_respiratory_rate + " / phút (min)";
                lbl_vs_bmi.Text = oina.vs_BMI + " (Kg/m <sup>2</sup>)";
                lbl_vs_blood_pressure.Text = oina.vs_blood_pressure + " mmHg";
                lbl_pulse.Text = oina.pulse + " cm";
                lbl_vs_spo2.Text = oina.vs_spO2 + " %";

                //4. Tầm soát bệnh lây nhiễm/ Communicable disease screening:
                rad_high_fever_false.Disabled
                    = rad_high_fever_true.Disabled
                    = rad_contact_infectious_disease_false.Disabled
                    = rad_contact_infectious_disease_true.Disabled
                    = rad_close_contact_false.Disabled
                    = rad_close_contact_true.Disabled
                    = rad_injectious_risk_false.Disabled
                    = rad_injectious_risk_true.Disabled
                    = true;

                if (oina.communicable_disease_screening != null)
                {
                    dynamic communicable_disease_screening = JsonConvert.DeserializeObject(oina.communicable_disease_screening);

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_high_fever_" + communicable_disease_screening.high_fever);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_contact_infectious_disease_" + communicable_disease_screening.contact_infectious_disease);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_close_contact_" + communicable_disease_screening.close_contact);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_injectious_risk_" + communicable_disease_screening.injectious_risk);
                }

                //5. Đánh giá đau/ Pain assessment:

                string PainAssessmentScale = GetPainAssessmentScale(oina);

                switch (PainAssessmentScale)
                {
                    case "NaF": 
                        //Numeric and Faces
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_paint_score_code_" + oina.paint_score_code);
                        rad_naf_true.Checked = true;
                        pain_assessment_change("field_naf");
                        lbl_paint_score_description.Text = WebHelpers.TextToHtmlTag(oina.paint_score_description);
                        break;
                    case "FLACC": //FLACC
                        if (oina.flacc != null)
                        {
                            dynamic flacc = JsonConvert.DeserializeObject(oina.flacc);
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
                            lbl_flacc_conclude1.Text = oina.flacc_conclude;
                        }
                        rad_flacc_true.Checked = true;
                        pain_assessment_change("field_flacc");
                        break;
                    case "NPASS": //N-PASS
                        if (oina.npass != null)
                        {
                            dynamic npass = JsonConvert.DeserializeObject(oina.npass);
                            lbl_npass_crying.Text = npass.crying;
                            lbl_npass_behavior.Text = npass.behavior;
                            lbl_npass_facial_expression.Text = npass.facial_expression;
                            lbl_npass_extremities_tone.Text = npass.extremities_tone;
                            lbl_npass_vital_signs.Text = npass.vital_signs;
                            lbl_npass_gestation_3.Text = npass.gestation_3;
                            lbl_npass_gestation_2.Text = npass.gestation_2;
                            lbl_npass_gestation_1.Text = npass.gestation_1;

                            lbl_npass_total_score.Text = Convert.ToString(npass.total_score);
                            lbl_npass_conclude1.Text = oina.npass_conclude;
                        }
                        rad_npass_true.Checked = true;
                        pain_assessment_change("field_npass");
                        break;
                    case "NONV"://Non-verbal
                        rad_nonv_true.Checked = true;
                        break;
                }
                pain_assessment_scale_wrapper.Visible = false;
                //6.Trở ngại chăm sóc / Barrier to care:
                lbl_btc_language.Visible 
                    = lbl_btc_cognitive.Visible
                    = lbl_btc_sensory.Visible
                    = lbl_btc_religious.Visible
                    = lbl_btc_cultural.Visible
                    = true;

                dynamic barrier_to_care = JsonConvert.DeserializeObject(oina.barrier_to_care);
                
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

                //7. Tầm soát nguy cơ té ngã/ Fall risk morse scale:
                lbl_no_fall_risk.Visible 
                    = lbl_fallen.Visible
                    = lbl_feel_unsteady.Visible
                    = lbl_worry_about_falling.Visible
                    = true;

                no_fall_risk_wrapper.Visible = false;
                if (!string.IsNullOrEmpty(oina.fall_risk_factors))
                {
                    lbl_no_fall_risk.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(oina.fall_risk_factors));

                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_fall_risk_factors_", WebHelpers.GetJSONToDataTable(oina.fall_risk_factors));

                    var cb_FallRiskFactors_nfr = FindControl("rad_no_fall_risks_" + cb_fall_risk_factors_nfr.Checked);

                    if (cb_FallRiskFactors_nfr != null)
                    {
                        //btc_change("field_nutrition_status", Convert.ToString(nutritional_status.ns_code));
                        ((HtmlInputRadioButton)cb_FallRiskFactors_nfr).Checked = true;
                    }

                    rad_fallen_false.Checked = cb_fall_risk_factors_nfr.Checked;

                    field_no_fall_risks_false.Visible = !cb_fall_risk_factors_nfr.Checked;

                    if (!cb_fall_risk_factors_nfr.Checked)
                    {
                        fall_risk_factors_field.Visible 
                            = fallen_field.Visible
                            = feel_unsteady_field.Visible
                            = worry_about_falling_field.Visible
                            = intervention_field.Visible
                            = false;

                        //-	Câu hỏi sàng lọc / The fall risk screen questions:
                        if(oina.fall_risk_questions != null)
                        {
                            dynamic fall_risk_questions = JsonConvert.DeserializeObject(oina.fall_risk_questions);

                            lbl_fallen.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(fall_risk_questions.fallen))));
                            lbl_feel_unsteady.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(fall_risk_questions.feel_unsteady))));
                            lbl_worry_about_falling.Text = WebHelpers.FormatString(WebHelpers.GetBool(Convert.ToBoolean(Convert.ToString(fall_risk_questions.worry_about_falling))));
                        }
                        //
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fallen_" + fall_risk_questions.fallen);
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_feel_unsteady_" + fall_risk_questions.feel_unsteady);
                        //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_worry_about_falling_" + fall_risk_questions.worry_about_falling);

                        lbl_intervention.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(oina.intervention));
                        //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_intervention_", WebHelpers.GetJSONToDataTable(oina.intervention));
                    }
                }

                //8. Đánh giá tình trạng dinh dưỡng/ Nutritional status screening:
                lbl_bmi.Text = oina.vs_BMI;
                previous_weight_wrapper.Visible = false;
                lbl_previous_weight.Visible = true;
                if (oina.nutritional_status_screening != null)
                {
                    dynamic nutritional_status_screening = JsonConvert.DeserializeObject(oina.nutritional_status_screening);
                    
                    lbl_previous_weight.Text = nutritional_status_screening.previous_weight + " Kg";
                    lbl_weight_change.Text = nutritional_status_screening.weight_change + " %";
                }

                //-	Tình trạng dinh dưỡng/ Nutrition status:
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

                if (oina.nutritional_status != null)
                {
                    dynamic nutritional_status = JsonConvert.DeserializeObject(oina.nutritional_status);
                    
                    //
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + nutritional_status.ns_code);
                    btc_change("field_nutrition_status", Convert.ToString(nutritional_status.ns_code));

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + nutritional_status.ns_code + "_" + nutritional_status.ns_score);
                    ns_age_score.Value = nutritional_status.ns_score;

                    //- Sụt cân không chủ ý trong 3 tháng gần đây/ Unintentional weight loss in the last 3 months:
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_loss_weight_" + nutritional_status.loss_weight);
                    ns_loss_weight_score.Value = nutritional_status.loss_weight;

                    //- Sụt cân không chủ ý trong 3 tháng gần đây/ Unintentional weight loss in the last 3 months:
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_food_intake_" + nutritional_status.food_intake);
                    ns_food_intake_score.Value = nutritional_status.food_intake;

                    lbl_ns_total_score.Text = nutritional_status.total_score;

                    lbl_nutritional_conclude1.Text = oina.nutritional_conclude;
                }

                //III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT:
                lbl_housing_description.Text = WebHelpers.TextToHtmlTag(oina.housing_description);

                //IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION
                immediate_consulting_requirement.Visible = false;
                lbl_prioritization_description.Text = WebHelpers.TextToHtmlTag(oina.prioritization_description);
                lbl_immediate_consulting_requirement.Text = JSON_STR_SEPARATION(oina.immediate_consulting_requirement);

                //V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
                //patient_education_needs_wrapper.Visible = false;
                lbl_patient_education_needs.Text = JSON_STR_SEPARATION(oina.patient_education_needs);

                //lbl_assessment_date_time.Text = WebHelpers.FormatDateTime(oina.assessment_date_time, "dd-MM-yyyy HH:mm");

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }

        private string JSON_STR_SEPARATION(dynamic json_str)
        {
            if (json_str == null) return null;
            DataTable dt = WebHelpers.GetJSONToDataTable(json_str);
            string value = "";
            foreach (DataRow dr in dt.Rows)
            {
                if (Convert.ToString(dr["code"]) == "OTH")
                    value += $"Trường hợp khác/ Other: ";
                value += $"{dr["desc"]}<br>";
            }
            return value;
        }

        private void BindingDataFormEdit(Oina oina)
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

                //II. ĐÁNH GIÁ/ ASSESSMENT
                //1. Lý do đến khám/ Chief complaint:
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(oina.chief_complaint);
                //2. Dị ứng/ Allergy:
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + oina.allergy);
                if (rad_allergy_true.Checked)
                {
                    txt_allergy_note.Value = WebHelpers.TextToHtmlTag(oina.allergy_note);
                }
                //3. Trạng thái tinh thần/ Mental status:
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_mental_status_" + oina.mental_status);

                mental_status_change(Convert.ToString(oina.mental_status));
                //field_mental_status_false.Visible = false;
                //btc_change("field_mental_status_note", Convert.ToString(oina.mental_status));

                if (rad_mental_status_true.Checked)
                {
                    txt_mental_status_note.Value = WebHelpers.TextToHtmlTag(oina.mental_status_note);
                }

                //4. Tầm soát bệnh lây nhiễm/ Communicable disease screening:
                rad_high_fever_true.Disabled
                    = rad_high_fever_false.Disabled
                    = rad_contact_infectious_disease_true.Disabled
                    = rad_contact_infectious_disease_false.Disabled
                    = rad_close_contact_true.Disabled
                    = rad_close_contact_false.Disabled
                    = rad_injectious_risk_true.Disabled
                    = rad_injectious_risk_false.Disabled
                    = false;

                if (oina.communicable_disease_screening != null)
                {
                    dynamic communicable_disease_screening = JsonConvert.DeserializeObject(oina.communicable_disease_screening);

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_high_fever_" + communicable_disease_screening.high_fever);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_contact_infectious_disease_" + communicable_disease_screening.contact_infectious_disease);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_close_contact_" + communicable_disease_screening.close_contact);
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_injectious_risk_" + communicable_disease_screening.injectious_risk);
                }

                //5. Đánh giá đau/ Pain assessment:

                pain_assessment_scale_wrapper.Visible = true;

                string PainAssessmentScale = GetPainAssessmentScale(oina);

                LoadPainAssessmentScale(PainAssessmentScale);

                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fall_risk_" + oina.fall_risk);

                //6. Trở ngại chăm sóc/ Barrier to care:
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

                if (oina.barrier_to_care != null)
                {
                    dynamic barrier_to_care = JsonConvert.DeserializeObject(oina.barrier_to_care);

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_language_" + barrier_to_care.btc_language);
                    field_btc_language_true.Visible = barrier_to_care.btc_language == true;
                    txt_btc_language_note.Value = barrier_to_care.btc_language_note;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_cognitive_" + barrier_to_care.btc_cognitive);
                    field_btc_cognitive_true.Visible = barrier_to_care.btc_cognitive == true;
                    txt_btc_cognitive_note.Value = barrier_to_care.btc_cognitive_note;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_sensory_" + barrier_to_care.btc_sensory);
                    field_btc_sensory_true.Visible = barrier_to_care.btc_sensory == true;
                    txt_btc_sensory_note.Value = barrier_to_care.btc_sensory_note;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_religious_" + barrier_to_care.btc_religious);
                    field_btc_religious_true.Visible = barrier_to_care.btc_religious == true;
                    txt_btc_religious_note.Value = barrier_to_care.btc_religious_note;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_cultural_" + barrier_to_care.btc_cultural);
                    field_btc_cultural_true.Visible = barrier_to_care.btc_cultural == true;
                    txt_btc_cultural_note.Value = barrier_to_care.btc_cultural_note;
                }
                else
                {
                    field_btc_language_true.Visible = false;
                    field_btc_cognitive_true.Visible = false;
                    field_btc_sensory_true.Visible = false;
                    field_btc_religious_true.Visible = false;
                    field_btc_cultural_true.Visible = false;
                }

                //7. Tầm soát nguy cơ té ngã/ Fall risk morse scale:
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

                if (!string.IsNullOrEmpty(oina.fall_risk_factors))
                {
                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_fall_risk_factors_", WebHelpers.GetJSONToDataTable(oina.fall_risk_factors));

                    var cb_FallRiskFactors_nfr = FindControl("rad_no_fall_risks_" + cb_fall_risk_factors_nfr.Checked);

                    if (cb_FallRiskFactors_nfr != null)
                    {
                        //btc_change("field_nutrition_status", Convert.ToString(nutritional_status.ns_code));
                        ((HtmlInputRadioButton)cb_FallRiskFactors_nfr).Checked = true;
                    }

                    fall_risk_factors_field.Visible = true;

                    field_no_fall_risks_false.Visible = !cb_fall_risk_factors_nfr.Checked;
                    
                    rad_fallen_false.Checked = cb_fall_risk_factors_nfr.Checked;

                    if (!cb_fall_risk_factors_nfr.Checked)
                    {
                        //-	Câu hỏi sàng lọc / The fall risk screen questions:
                        dynamic fall_risk_questions = JsonConvert.DeserializeObject(oina.fall_risk_questions);
                        WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fallen_" + fall_risk_questions.fallen);
                        WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_feel_unsteady_" + fall_risk_questions.feel_unsteady);
                        WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_worry_about_falling_" + fall_risk_questions.worry_about_falling);

                        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_intervention_", WebHelpers.GetJSONToDataTable(oina.intervention));
                    }
                }    

                //if (oina.fall_risk_factors != null)
                //{
                //    dynamic fall_risk_factors = JsonConvert.DeserializeObject(oina.fall_risk_factors);

                //    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_no_fall_risks_" + fall_risk_factors.no_fall_risks);

                //    if (!bool.Parse(Convert.ToString(fall_risk_factors.no_fall_risks)))
                //    {
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_age_65_" + fall_risk_factors.age_65);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_pregnant_women_true" + fall_risk_factors.pregnant_women);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_inability_rise_from_chair_" + fall_risk_factors.inability_rise_from_chair);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_presence_dementia_" + fall_risk_factors.presence_dementia);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_ear_problems_" + fall_risk_factors.ear_problems);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_age_3_" + fall_risk_factors.age_3);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_ambulatory_devices_" + fall_risk_factors.ambulatory_devices);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_balance_disturbances_" + fall_risk_factors.balance_disturbances);
                //        WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_visual_impairments_" + fall_risk_factors.visual_impairments);

                //        if(oina.fall_risk_questions != null)
                //        {
                //            //-	Câu hỏi sàng lọc / The fall risk screen questions:
                //            dynamic fall_risk_questions = JsonConvert.DeserializeObject(oina.fall_risk_questions);
                //            WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fallen_" + fall_risk_questions.fallen);
                //            WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_feel_unsteady_" + fall_risk_questions.feel_unsteady);
                //            WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_worry_about_falling_" + fall_risk_questions.worry_about_falling);

                //        }

                //        if (oina.intervention != null)
                //        {
                //            //- Can thiệp/ Intervention:
                //            dynamic intervention = JsonConvert.DeserializeObject(oina.intervention);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_stick_fall_risk_" + intervention.stick_fall_risk);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_educate_fall_risk_" + intervention.educate_fall_risk);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_assist_transfer_" + intervention.assist_transfer);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_assist_transfer_wheelchair_" + intervention.assist_transfer_wheelchair);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_keep_an_eye_on_children_" + intervention.keep_an_eye_on_children);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_limit_run_" + intervention.limit_run);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_encourage_use_cribs_" + intervention.encourage_use_cribs);
                //            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_place_fall_risk_id_bracelet_" + intervention.place_fall_risk_id_bracelet);

                //        }
                //    }
                //}

                //
                lbl_bmi.Text = oina.vs_BMI;
                //8. Đánh giá tình trạng dinh dưỡng/ Nutritional status screening: 
                lbl_previous_weight.Visible = false;
                previous_weight_wrapper.Visible = true;

                if (oina.nutritional_status_screening != null)
                {
                    dynamic nutritional_status_screening = JsonConvert.DeserializeObject(oina.nutritional_status_screening);
                    txt_previous_weight.Value = nutritional_status_screening.previous_weight;
                    lbl_weight_change.Text = nutritional_status_screening.weight_change;
                }

                //-	Tình trạng dinh dưỡng/ Nutrition status:
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

                if (oina.nutritional_status != null)
                {
                    dynamic nutritional_status = JsonConvert.DeserializeObject(oina.nutritional_status);

                    //
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + nutritional_status.ns_code);
                    btc_change("field_nutrition_status", Convert.ToString(nutritional_status.ns_code));

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_" + nutritional_status.ns_code + "_" + nutritional_status.ns_score);
                    ns_age_score.Value = nutritional_status.ns_score;

                    //- Sụt cân không chủ ý trong 3 tháng gần đây/ Unintentional weight loss in the last 3 months:
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_loss_weight_" + nutritional_status.loss_weight);
                    ns_loss_weight_score.Value = nutritional_status.loss_weight;

                    //- Sụt cân không chủ ý trong 3 tháng gần đây/ Unintentional weight loss in the last 3 months:
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ns_food_intake_" + nutritional_status.food_intake);
                    ns_food_intake_score.Value = nutritional_status.food_intake;

                    lbl_ns_total_score.Text = nutritional_status.total_score;

                    lbl_nutritional_conclude1.Text = oina.nutritional_conclude;
                }

                //III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT:
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_housing_code_" + oina.housing_code, "aln");

                //IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_prioritization_code_" + oina.prioritization_code, "wa");
                
                if(oina.prioritization_code == "IM")
                {
                    immediate_consulting_requirement.Visible = true;
                    
                    DataTable im_consul_req = WebHelpers.GetJSONToDataTable(oina.immediate_consulting_requirement);
                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_im_consul_req_", im_consul_req, out int oth_index, "code");

                    if (oth_index != -1)
                    {
                        txt_im_consul_req_oth.Value = im_consul_req.Rows[oth_index].Field<string>("desc").ToString();
                        //txt_respiratory_oth.Value = respiratory.Rows[oth_index].Field<string>("desc").ToString();
                    }

                    field_im_consul_req_oth.Visible = cb_im_consul_req_oth.Checked;
                }
                else if (oina.prioritization_code == "WA")
                {
                    immediate_consulting_requirement.Visible = false;
                }
                
                //V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS
                DataTable patient_education_needs = WebHelpers.GetJSONToDataTable(oina.patient_education_needs);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_patient_education_need_", patient_education_needs, out int oth_index1, "code");

                if (oth_index1 != -1)
                {
                    txt_patient_edu_need_oth.Value  = patient_education_needs.Rows[oth_index1].Field<string>("desc").ToString();
                    //txt_respiratory_oth.Value = respiratory.Rows[oth_index1].Field<string>("desc").ToString();
                }

                //if (oina.patient_education_needs != null)
                //{
                //    dynamic patient_education_needs = JsonConvert.DeserializeObject(oina.patient_education_needs);

                //    var control = FindControl($"cb_fall_risk_prevention_{patient_education_needs.fall_risk_prevention}");

                //    if (control != null)
                //    {
                //        ((HtmlInputRadioButton)control).Checked = true;
                //    }

                //    control = FindControl($"cb_wound_care_{patient_education_needs.wound_care}");

                //    if (control != null)
                //    {
                //        ((HtmlInputRadioButton)control).Checked = true;
                //    }

                //    control = FindControl($"cb_diet_{patient_education_needs.diet}");

                //    if (control != null)
                //    {
                //        ((HtmlInputRadioButton)control).Checked = true;
                //    }

                //    control = FindControl($"cb_pain_{patient_education_needs.pain}");

                //    if (control != null)
                //    {
                //        ((HtmlInputRadioButton)control).Checked = true;
                //    }

                //    control = FindControl($"cb_others_{patient_education_needs.others}");

                //    if (control != null)
                //    {
                //        ((HtmlInputRadioButton)control).Checked = true;
                //        txt_patient_education_need_oth.Value = patient_education_needs.others_note;
                //    }
                //}

                //6.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_" + oina.nutrition_status_code);
                //III.
                
                //WebHelpers.BindDateTimePicker(dtpk_assessment_date_time, oina.assessment_date_time);

                DataObj.Value = JsonConvert.SerializeObject(oina);
                Session["docid"] = oina.document_id;
                WebHelpers.AddScriptFormEdit(Page, oina, (string)Session["emp_id"], loc);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        private void LoadPainAssessmentScale(string scale)
        {
            switch (scale)
            {
                case "NaF": //Numeric and Faces
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_paint_score_code_" + oina.paint_score_code);
                    rad_naf_true.Checked = true;
                    pain_assessment_change("field_naf");
                    break;
                case "FLACC": //FLACC
                    if (oina.flacc != null)
                    {
                        dynamic flacc = JsonConvert.DeserializeObject(oina.flacc);
                        int flaccFace = flacc.face != null ? flacc.face : 0;
                        int flaccLegs = flacc.legs != null ? flacc.legs : 0;
                        int flaccActivity = flacc.activity != null ? flacc.activity : 0;
                        int flaccCry = flacc.cry != null ? flacc.cry : 0;
                        int flaccConsolability = flacc.consolability != null ? flacc.consolability : 0;

                        txt_flacc_face.Text = flacc.face;
                        txt_flacc_legs.Text = flacc.legs;
                        txt_flacc_activity.Text = flacc.activity;
                        txt_flacc_cry.Text = flacc.cry;
                        txt_flacc_consolability.Text = flacc.consolability;

                        flacc_total_score.Text = (flaccFace + flaccLegs + flaccActivity + flaccCry + flaccConsolability).ToString();
                        lbl_flacc_conclude1.Text = oina.flacc_conclude;
                    }
                    rad_flacc_true.Checked = true;
                    pain_assessment_change("field_flacc");
                    break;
                case "NPASS": //N-PASS
                    if (oina.npass != null)
                    {
                        dynamic npass = JsonConvert.DeserializeObject(oina.npass);
                        txt_npass_crying.Text = npass.crying;
                        txt_npass_behavior.Text = npass.behavior;
                        txt_npass_facial_expression.Text = npass.facial_expression;
                        txt_npass_extremities_tone.Text = npass.extremities_tone;
                        txt_npass_vital_signs.Text = npass.vital_signs;
                        txt_npass_gestation_3.Text = npass.gestation_3;
                        txt_npass_gestation_2.Text = npass.gestation_2;
                        txt_npass_gestation_1.Text = npass.gestation_1;

                        lbl_npass_total_score.Text = Convert.ToString(npass.total_score);
                        lbl_npass_conclude1.Text = oina.npass_conclude;
                    }
                    rad_npass_true.Checked = true;
                    pain_assessment_change("field_npass");
                    break;
                case "NONV"://Non-verbal
                    rad_nonv_true.Checked = true;
                    break;
            }
        }

        private string GetPainAssessmentScale(Oina oina)
        {
            string ReturnValue = ""; //"NaF", "FLACC", "NPASS", "NONV"
            if (!string.IsNullOrEmpty(oina.paint_score_code))
            {
                ReturnValue = "NaF";
            }
            else if (!string.IsNullOrEmpty(oina.flacc))
            {
                ReturnValue = "FLACC";
            }
            else if (!string.IsNullOrEmpty(oina.npass))
            {
                ReturnValue = "NPASS";
            }
            //else if (!string.IsNullOrEmpty(oina.))
            //{
            //    ReturnValue = "NONV";
            //}

            return ReturnValue;
        }

        private void btc_change(string field,string value)
        {
            var control = FindControl($"{field}_{value}");
            if(control != null)
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

        //protected void flacc_score_TextChanged(object sender, EventArgs e)
        //{
        //    int FLACCTotalScore = CalculateFLACC();

        //    string flacc_conclude_str = "";

        //    flacc_total_score.Text = FLACCTotalScore.ToString();

        //    switch (FLACCTotalScore)
        //    {
        //        case 0:
        //            flacc_conclude_str = "Không đau/ No pain (0)";
        //            break;
        //        case 1:
        //        case 2:
        //        case 3:
        //            flacc_conclude_str = "Đau nhẹ/ Slight pain (1 - 3)";
        //            break;
        //        case 4:
        //        case 5:
        //        case 6:
        //            flacc_conclude_str = "Đau vừa/ Considerable pain (4 - 6)";
        //            break;
        //        case 7:
        //        case 8:
        //        case 9:
        //        case 10:
        //            flacc_conclude_str = "Rất đau/ Worst pain (7 - 10)";
        //            break;
        //    }
        //    lbl_flacc_conclude1.Text = flacc_conclude_str;
        //}

        //protected void npass_crying_TextChanged(object sender, EventArgs e)
        //{
        //    CalculateNPASS();
        //}
    }
}
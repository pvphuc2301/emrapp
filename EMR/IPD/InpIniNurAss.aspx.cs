using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class InpIniNurAss : System.Web.UI.Page
    {
        Iina iina;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!WebHelpers.CheckSession(this)) return;

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = Request.QueryString["loc"];

            PAGE_URL = $"/IPD/InpIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }

            PostBackEvent();
        }

        #region Load Forms
        private void BindingDataForm(Iina iina, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(iina);
            }
            else
            {
                BindingDataFormView(iina);
            }
        }
        private void BindingDataFormEdit(Iina iina)
        {
            try
            {


                txt_amend_reason.Text = "";

                pain_annotation_base64.Value = JsonConvert.DeserializeObject(iina.pain_annotation).dataURI;
                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(iina.skin_anno_data).dataURI;

                //residence
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_residence_code_" + iina.residence_code);
                txt_residence_other.Value = iina.residence_other;
                //language
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_language_code_" + iina.language_code);
                txt_language_other.Value = iina.language_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_interpreter_" + iina.req_interpreter);
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_religion_code_" + iina.religion_code);
                txt_religion_other.Value = iina.religion_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spiritual_couns_" + iina.spiritual_couns);
                txt_occupation.Value = iina.occupation;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_living_status_code_" + iina.living_status_code);
                txt_living_status_note.Value = iina.living_status_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hospital_concern_code_" + iina.hospital_concern_code);
                txt_hospital_concern_other.Value = iina.hospital_concern_other;
                //
                txt_accompanied.Value = iina.accompanied;
                //
                txt_relationship.Value = iina.relationship;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_admit_from_code_" + iina.admit_from_code);
                txt_admit_from_other.Value = iina.admit_from_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_arrived_code_", WebHelpers.GetJSONToDataTable(iina.arrived));
                //
                txt_admission_reason.Value = iina.admission_reason;
                //
                lbl_previous_admission.Text = iina.previous_admission;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_past_med_history_" + iina.past_med_history);
                txt_past_med_history_note.Value = iina.past_med_history_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_past_sur_history_" + iina.past_sur_history);
                txt_past_sur_history_note.Value = iina.past_sur_history_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_substance_abuse_", WebHelpers.GetJSONToDataTable(iina.substance_abuse));
                txt_substance_abuse_other.Value = iina.substance_abuse_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_previous_document_" + iina.previous_document);
                txt_previous_document_note.Value = iina.previous_document_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cur_home_medication_" + iina.cur_home_medication);
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + iina.allergy);
                txt_allergy_note.Value = iina.allergy_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_high_risk_patient_", WebHelpers.GetJSONToDataTable(iina.high_risk_patient));
                //
                txt_vs_temperature.Value = iina.vs_temperature;
                txt_vs_heart_rate.Value = iina.vs_heart_rate;
                txt_vs_weight.Value = iina.vs_weight;
                txt_vs_respiratory_rate.Value = iina.vs_respiratory_rate;
                txt_vs_height.Value = iina.vs_height;
                txt_vs_blood_pressure.Value = iina.vs_blood_pressure;
                txt_vs_bmi.Value = iina.vs_BMI;
                txt_vs_spO2.Value = iina.vs_spO2;
                txt_vs_pulse.Value = iina.vs_pulse;

                //2.
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_respiratory_system_", WebHelpers.GetJSONToDataTable(iina.respiratory_system));
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cough_" + iina.cough);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_pro_cough_" + iina.pro_cough);
                txt_pro_cough_note.Value = iina.pro_cough_note;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_pulse_code_" + iina.pulse_code);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_presence_", WebHelpers.GetJSONToDataTable(iina.presence));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_extremities_", WebHelpers.GetJSONToDataTable(iina.extremities));
                //4.
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_oriented_", WebHelpers.GetJSONToDataTable(iina.oriented));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_mental_status_", WebHelpers.GetJSONToDataTable(iina.mental_status));
                txt_mental_status_other.Value = iina.mental_status_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hearing_code_" + iina.hearing_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_vision_code_" + iina.vision_code);
                txt_vision_other.Value = iina.vision_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_speech_code_" + iina.speech_code);
                //5.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_diet_code_" + iina.diet_code);
                txt_diet_other.Value = iina.diet_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_diet_pre_code_" + iina.diet_pre_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ng_tube_" + iina.ng_tube);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_gastrostomy_" + iina.gastrostomy);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_size_" + iina.size);
                cb_size_true.Disabled = cb_gastrostomy_true.Disabled = false;
                txt_size_note.Value = iina.size_note;
                WebHelpers.BindDateTimePicker(dpk_last_date_changed, iina.last_date_changed);
                txt_food_dislike.Value = iina.food_dislike;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bowel_elimination_code_" + iina.bowel_elimination_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_stool_consistency_code_" + iina.stool_consistency_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gas_presence_code_" + iina.gas_presence_code);
                //6.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bmi_out_range_" + iina.bmi_out_range);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_loss_weight_" + iina.loss_weight);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_reduce_dietary_" + iina.loss_weight);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_severely_ill_" + iina.severely_ill);

                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_normal_" + iina.nutrition_normal);
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_" + iina.nutrition_score1);

                if(iina.nutrition_normal != null)
                {
                    cb_nutrition_normal_true.Checked = iina.nutrition_normal;
                }
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_", WebHelpers.GetJSONToDataTable(iina.nutrition_score1));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score2_", WebHelpers.GetJSONToDataTable(iina.nutrition_score2));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score3_", WebHelpers.GetJSONToDataTable(iina.nutrition_score3));
                nutrition_score.Text = iina.nutrition_score;
                
                if (iina.normal_nutrition_req != null)
                {
                    cb_normal_nutrition_req_true.Checked = (bool)iina.normal_nutrition_req;
                }
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score1_", WebHelpers.GetJSONToDataTable(iina.severity_score1));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score2_", WebHelpers.GetJSONToDataTable(iina.severity_score2));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score3_", WebHelpers.GetJSONToDataTable(iina.severity_score3));
                severity_score.Text = Convert.ToString(iina.severity_score);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_younger_70_" + iina.younger_70);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_older_70_" + iina.older_70);
                age_score.Text = Convert.ToString(iina.age_score);

                total_nutri_score.Text = Convert.ToString(iina.total_nutri_score);

                //7
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_urination_", WebHelpers.GetJSONToDataTable(iina.urination));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_inter_catheter_" + iina.inter_catheter);
                txt_inter_catheter_note.Value = iina.inter_catheter_note;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_ind_catheter_" + iina.ind_catheter);
                txt_ind_catheter_size.Value = iina.ind_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_ind_catheter_date, iina.ind_catheter_date);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_sup_catheter_" + iina.sup_catheter);
                txt_sup_catheter_size.Value = iina.sup_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_last_sup_catheter_date, iina.last_sup_catheter_date);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_menstruation_code_" + iina.menstruation_code);
                txt_cycle_day.Value = Convert.ToString(iina.cycle_day);

                txt_last_mens_period.Value = iina.last_mens_period;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_pregnancy_" + iina.not_pregnancy);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_pre_pregnancy_" + iina.pre_pregnancy);
                txt_para.Value = iina.para;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_cur_pregnancy_" + iina.cur_pregnancy);
                txt_pregnancy_week.Value = iina.pregnancy_week;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_contraception_code_" + iina.contraception_code);
                txt_contraception_other.Value = iina.contraception_other;

                //8
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_mus_history_", WebHelpers.GetJSONToDataTable(iina.mus_history));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_paralysis_" + iina.paralysis);
                txt_paralysis_note.Value = iina.paralysis_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_amputation_" + iina.amputation);
                txt_amputation_note.Value = iina.amputation_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_contracture_" + iina.contracture);
                txt_contracture_note.Value = iina.contracture_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_prosthesis_" + iina.prosthesis);
                txt_prosthesis_note.Value = iina.prosthesis_note;

                //9
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cur_in_pain_" + iina.cur_in_pain);
                txt_p_location_1.Value = iina.p_location_1;
                txt_p_location_2.Value = iina.p_location_2;
                txt_p_location_3.Value = iina.p_location_3;

                txt_q_location_1.Value = iina.q_location_1;
                txt_q_location_2.Value = iina.q_location_2;
                txt_q_location_3.Value = iina.q_location_3;

                txt_r_location_1.Value = iina.r_location_1;
                txt_r_location_2.Value = iina.r_location_2;
                txt_r_location_3.Value = iina.r_location_3;

                txt_s_location_1.Value = iina.s_location_1;
                txt_s_location_2.Value = iina.s_location_2;
                txt_s_location_3.Value = iina.s_location_3;

                txt_t_location_1.Value = iina.t_location_1;
                txt_t_location_2.Value = iina.t_location_2;
                txt_t_location_3.Value = iina.t_location_3;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_using_pain_killer_" + iina.using_pain_killer);

                WebHelpers.VisibleControl(true, pain_annotation_undo, pain_annotation_redo, pain_annotation_pencilWrapper);

                txt_pain_killer_name.Value = iina.pain_killer_name;
                txt_pa_comment.Value = iina.pa_comment;

                //10
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_condition_", WebHelpers.GetJSONToDataTable(iina.condition));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_wounds_", WebHelpers.GetJSONToDataTable(iina.wounds));

                ViewState[grid_skin_anno.ID] = WebHelpers.BindingDataGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(iina.skin_anno), Iina.SKIN_ANNO, btn_grid_skin_anno_add);

                WebHelpers.DataBind(form1, select_sensory_code, Iina.SENSORY_CODE, iina.sensory_code);
                WebHelpers.DataBind(form1, select_moisture_code, Iina.MOISTURE_CODE, iina.moisture_code);
                WebHelpers.DataBind(form1, select_activity_code, Iina.ACTIVITY_CODE, iina.activity_code);
                WebHelpers.DataBind(form1, select_mobility_code, Iina.MOBILITY_CODE, iina.mobility_code);
                WebHelpers.DataBind(form1, select_nutrition_code, Iina.NUTRITION_CODE, iina.nutrition_code);
                WebHelpers.DataBind(form1, select_friction_code, Iina.FRICTION_CODE, iina.friction_code);

                total_score.Text = iina.total_score;

                pres_sore_risk_desc.Text = iina.pres_sore_risk_desc;
                txt_preven_action.Value = iina.preven_action;

                //11

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bathing_code_" + iina.bathing_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_oral_care_code_" + iina.oral_care_code);
                txt_oral_care_note.Value = iina.oral_care_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_dentures_code_" + iina.dentures_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_toilet_use_code_" + iina.toilet_use_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_dressing_code_" + iina.dressing_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_eating_code_" + iina.eating_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_turning_bed_code_" + iina.turning_bed_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ambulation_code_" + iina.ambulation_code);
                if (rad_ambulation_code_na.Checked) { txt_ambulation_note.Value = iina.ambulation_note; }
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_sleep_code_" + iina.sleep_code);

                txt_medication_used.Value = iina.medication_used;

                //12
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fall_history_code_" + iina.fall_history_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_secon_diagnosis_code_" + iina.secon_diagnosis_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ambula_aids_code_" + iina.ambula_aids_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_intra_therapy_code_" + iina.intra_therapy_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gait_trans_code_" + iina.gait_trans_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fr_mental_status_code_" + iina.fr_mental_status_code);

                fr_total_score.Text = Convert.ToString(iina.fr_total_score);

                //D
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_involvement_" + iina.involvement);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_med_equipment_" + iina.req_med_equipment);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_foll_care_" + iina.req_foll_care);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_suicidal_referral_" + iina.suicidal_referral);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_alone_reduce_functional_" + iina.alone_reduce_functional);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_physiotherapist_" + iina.ref_physiotherapist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_speech_therapist_" + iina.ref_speech_therapist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_dietician_" + iina.ref_dietician);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_psychologist_" + iina.ref_psychologist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_other_hospital_" + iina.ref_other_hospital);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_support_at_home_" + iina.support_at_home);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_transportation_" + iina.req_transportation);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_stairs_climb_home_" + iina.stairs_climb_home);

                //E
                txt_dis_planning.Value = iina.dis_planning;
                //F
                txt_dis_management.Value = iina.dis_management;

                WebHelpers.BindDateTimePicker(dtpk_assess_date_time, iina.assess_date_time);

                pain_annotation_img.Src = JObject.Parse(iina.pain_annotation).dataURI;

                skin_anno_data_img.Src = JObject.Parse(iina.skin_anno_data).dataURI;

                WebHelpers.VisibleControl(true, pain_annotation_undo, skin_anno_data_undo, pain_annotation_redo, skin_anno_data_redo, pain_annotation_pencilWrapper, skin_anno_data_pencil_wrapper, cb_older_70_true, cb_younger_70_true);

                DataObj.Value = JsonConvert.SerializeObject(iina);

                Session["docid"] = iina.document_id;
                WebHelpers.AddScriptFormEdit(Page, iina, (string)Session["emp_id"], loc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Iina iina)
        {
            try
            {
                pain_annotation_base64.Value = JsonConvert.DeserializeObject(iina.pain_annotation).dataURI;
                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(iina.skin_anno_data).dataURI;

                lbl_residence_desc.Text = WebHelpers.FormatString(iina.residence_desc) + (iina.residence_code == "OTH" ? WebHelpers.FormatString(iina.residence_other) : "");
                lbl_language_desc.Text = WebHelpers.FormatString(iina.language_desc) + (iina.language_code == "OTH" ? WebHelpers.FormatString(iina.language_other) : "");
                lbl_req_interpreter.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.req_interpreter));
                lbl_religion_code.Text = WebHelpers.FormatString(iina.religion_desc) + (iina.religion_code == "OTH" ? WebHelpers.FormatString(iina.religion_other) : "");
                lbl_spiritual_couns.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.spiritual_couns));
                lbl_occupation.Text = WebHelpers.FormatString(iina.occupation);
                lbl_living_status_desc.Text = WebHelpers.FormatString(iina.living_status_desc) + (iina.living_status_code == "OTH" ? WebHelpers.FormatString(iina.living_status_note) : "");
                lbl_hospital_concern_desc.Text = WebHelpers.FormatString(iina.hospital_concern_desc) + (iina.hospital_concern_code == "OTH" ? WebHelpers.FormatString(iina.hospital_concern_other) : "");
                lbl_accompanied.Text = WebHelpers.FormatString(iina.accompanied);
                lbl_relationship.Text = WebHelpers.FormatString(iina.relationship);
                //B
                lbl_admit_from_desc.Text = WebHelpers.FormatString(iina.admit_from_desc) + ": " + (iina.admit_from_code == "OTH" ? WebHelpers.FormatString(iina.admit_from_other) : "");
                lbl_arrived.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.arrived));
                lbl_admission_reason.Text = WebHelpers.FormatString(iina.admission_reason);
                lbl_previous_admission.Text = WebHelpers.FormatString(iina.previous_admission);
                lbl_past_med_history.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.past_med_history));
                lbl_past_sur_history.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.past_sur_history));

                lbl_substance_abuse.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.substance_abuse));

                lbl_previous_document.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.previous_document, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(iina.previous_document_note)));
                lbl_cur_home_medication.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.cur_home_medication, "Có/ Yes (Tham khảo đơn thuốc đính kèm)/ If, yes please refer to the prescription attached"));
                lbl_allergy.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.allergy, "Có (ghi rõ)/ Yes (specify): " + iina.allergy_note));
                lbl_high_risk_patient.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.high_risk_patient));
                //C
                //1
                lbl_vs_temperature.Text = WebHelpers.FormatString(iina.vs_temperature) + " °C";
                lbl_vs_weight.Text = WebHelpers.FormatString(iina.vs_weight) + " Kg";
                lbl_vs_height.Text = WebHelpers.FormatString(iina.vs_height) + " cm";
                lbl_vs_BMI.Text = WebHelpers.FormatString(iina.vs_BMI) + " Kg/m <sup>2</sup>";
                lbl_vs_heart_rate.Text = WebHelpers.FormatString(iina.vs_heart_rate) + " /phút (m)";
                lbl_vs_respiratory_rate.Text = WebHelpers.FormatString(iina.vs_respiratory_rate) + " /phút (m)";
                lbl_vs_blood_pressure.Text = WebHelpers.FormatString(iina.vs_blood_pressure) + " mmHg";
                lbl_vs_spO2.Text = WebHelpers.FormatString(iina.vs_spO2) + " %";
                lbl_vs_pulse.Text = WebHelpers.FormatString(iina.vs_pulse) + " cm";
                //2
                lbl_respiratory_system.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.respiratory_system));
                lbl_cough.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.cough));
                lbl_pro_cough.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.cough, "Có đờm/ Productive (ghi rõ màu/ tính chất/ số lượng)/ (Specify color/ nature/ amount)" + iina.pro_cough_note, "Không có đờm/ Unproductive cough"));

                //3
                lbl_pulse_desc.Text = WebHelpers.FormatString(iina.pulse_desc);
                lbl_presence.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.presence));
                lbl_extremities.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.extremities));
                //4
                lbl_oriented.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.oriented));
                lbl_mental_status.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.mental_status));
                lbl_hearing_code.Text = WebHelpers.FormatString(iina.hearing_desc);

                lbl_vision_code.Text = WebHelpers.FormatString(iina.vision_desc) + (iina.vision_code == "OTH" ? WebHelpers.FormatString(iina.vision_other) : "");
                lbl_speech_code.Text = WebHelpers.FormatString(iina.speech_desc);
                //5
                lbl_diet_desc.Text = WebHelpers.FormatString(iina.diet_desc);
                lbl_diet_pre_desc.Text = WebHelpers.FormatString(iina.diet_pre_desc);
                lbl_ng_tube.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.ng_tube, "Ống thông/ NG Tube"));
                cb_gastrostomy_true.Disabled = true;
                if (iina.gastrostomy != null) cb_gastrostomy_true.Checked = iina.gastrostomy;
                cb_size_true.Disabled = true;
                if (iina.size != null) cb_size_true.Checked = iina.size;
                lbl_size_note.Text = WebHelpers.FormatString(iina.size_note);
                lbl_food_dislike.Text = WebHelpers.FormatString(iina.food_dislike);
                lbl_last_date_changed.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(iina.last_date_changed));

                lbl_bowel_elimination_desc.Text = WebHelpers.FormatString(iina.bowel_elimination_desc);
                lbl_stool_consistency_desc.Text = WebHelpers.FormatString(iina.stool_consistency_desc);
                lbl_gas_presence_desc.Text = WebHelpers.FormatString(iina.gas_presence_desc);
                //6
                lbl_bmi_out_range.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.bmi_out_range));
                lbl_loss_weight.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.loss_weight));
                lbl_reduce_dietary.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.reduce_dietary));
                lbl_severely_ill.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.severely_ill));
                //table 2
                if (ShowFinalScreening(iina))
                {
                    //Nutrition status
                    //
                    cb_nutrition_normal_true.Visible = false;
                    if (iina.nutrition_normal != null) cb_nutrition_normal_true.Checked = iina.nutrition_normal;
                    lbl_nutrition_score1.Text = WebHelpers.DisplayCheckBox(iina.nutrition_score1);
                    lbl_nutrition_score2.Text = WebHelpers.DisplayCheckBox(iina.nutrition_score2);
                    lbl_nutrition_score3.Text = WebHelpers.DisplayCheckBox(iina.nutrition_score3);
                    nutrition_score.Text = WebHelpers.FormatString(Convert.ToString(iina.nutrition_score));
                    //
                    //Severity of disease
                    cb_normal_nutrition_req_true.Visible = false;
                    //if (iina.nutrition_normal != null) cb_nutrition_normal_true.Checked = iina.nutrition_normal;
                    lbl_severity_score1.Text = WebHelpers.DisplayCheckBox(iina.severity_score1);
                    lbl_severity_score2.Text = WebHelpers.DisplayCheckBox(iina.severity_score2);
                    lbl_severity_score3.Text = WebHelpers.DisplayCheckBox(iina.severity_score3);
                    severity_score.Text = WebHelpers.FormatString(Convert.ToString(iina.severity_score));
                    //
                    //Age
                    //
                    WebHelpers.VisibleControl(false, cb_younger_70_true, cb_older_70_true);
                    if (iina.younger_70 != null) cb_younger_70_true.Checked = iina.younger_70;
                    if (iina.older_70 != null) cb_older_70_true.Checked = iina.older_70;
                    age_score.Text = WebHelpers.FormatString(Convert.ToString(iina.age_score));
                    //
                    //Total score
                    //
                    total_score.Text = WebHelpers.FormatString(iina.total_score);
                }
                //
                //7
                lbl_urination.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.urination));
                WebHelpers.VisibleControl(false, cb_inter_catheter_true, cb_ind_catheter_true, cb_sup_catheter_true);
                if (iina.inter_catheter != null) { cb_inter_catheter_true.Checked = iina.inter_catheter; }
                if (iina.ind_catheter != null) { cb_ind_catheter_true.Checked = iina.ind_catheter; }
                lbl_ind_catheter_size.Text = WebHelpers.FormatString(iina.ind_catheter_size);
                lbl_ind_catheter_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(iina.ind_catheter_date));
                if (iina.sup_catheter != null) { cb_sup_catheter_true.Checked = iina.sup_catheter; }
                lbl_sup_catheter_size.Text = WebHelpers.FormatString(iina.sup_catheter_size);
                lbl_last_sup_catheter_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(iina.last_sup_catheter_date));
                //
                lbl_menstruation_code.Text = $"{WebHelpers.FormatString(iina.menstruation_desc)} {WebHelpers.FormatString(iina.cycle_day)} Ngày đầu của kỳ kinh cuối/ Last menstrual period started {WebHelpers.FormatString(iina.last_mens_period)}";

                lbl_not_pregnancy.Text = $"{WebHelpers.FormatString(WebHelpers.GetBool(iina.not_pregnancy))} Đã từng mang thai trước đây/ Previous pregnancy: {WebHelpers.FormatString(WebHelpers.GetBool(iina.pre_pregnancy))} PARA {WebHelpers.FormatString(iina.para)} Hiện đang mang thai/ Current pregnancy: {WebHelpers.FormatString(WebHelpers.GetBool(iina.cur_pregnancy))} {WebHelpers.FormatString(iina.pregnancy_week)} tuần/ week";

                lbl_contraception_code.Text = $"{WebHelpers.FormatString(iina.contraception_desc)} {WebHelpers.FormatString(iina.contraception_other)}";

                //8
                lbl_mus_history.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.mus_history));
                lbl_paralysis.Text = "Liệt/ (1/2 người/2 chi/4 chi)/ Paralysis (Hemi/Para/Tetra): " + WebHelpers.FormatString(WebHelpers.GetBool(iina.paralysis)) + WebHelpers.FormatString(iina.paralysis_note);
                lbl_amputation.Text = $"Đoạn chi/ Amputation: {WebHelpers.FormatString(WebHelpers.GetBool(iina.amputation))} {WebHelpers.FormatString(iina.ambulation_note)}";
                lbl_contracture.Text = $"Cơ bắp co rút/ Contracture: {WebHelpers.FormatString(WebHelpers.GetBool(iina.contracture))} {WebHelpers.FormatString(iina.contracture_note)}";
                lbl_prosthesis.Text = $"Lắp bộ phận giả/ Prosthesis: {WebHelpers.FormatString(WebHelpers.GetBool(iina.prosthesis))} {WebHelpers.FormatString(iina.prosthesis_note)}";
                //9
                lbl_cur_in_pain.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.cur_in_pain));
                lbl_p_location_1.Text = WebHelpers.FormatString(iina.p_location_1);
                lbl_p_location_2.Text = WebHelpers.FormatString(iina.p_location_2);
                lbl_p_location_3.Text = WebHelpers.FormatString(iina.p_location_3);

                lbl_q_location_1.Text = WebHelpers.FormatString(iina.q_location_1);
                lbl_q_location_2.Text = WebHelpers.FormatString(iina.q_location_2);
                lbl_q_location_3.Text = WebHelpers.FormatString(iina.q_location_3);

                lbl_r_location_1.Text = WebHelpers.FormatString(iina.r_location_1);
                lbl_r_location_2.Text = WebHelpers.FormatString(iina.r_location_2);
                lbl_r_location_3.Text = WebHelpers.FormatString(iina.r_location_3);

                lbl_s_location_1.Text = WebHelpers.FormatString(iina.s_location_1);
                lbl_s_location_2.Text = WebHelpers.FormatString(iina.s_location_2);
                lbl_s_location_3.Text = WebHelpers.FormatString(iina.s_location_3);

                lbl_t_location_1.Text = WebHelpers.FormatString(iina.t_location_1);
                lbl_t_location_2.Text = WebHelpers.FormatString(iina.t_location_2);
                lbl_t_location_3.Text = WebHelpers.FormatString(iina.t_location_3);

                lbl_using_pain_killer.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.using_pain_killer));
                lbl_pain_killer_name.Text = WebHelpers.FormatString(iina.pain_killer_name);
                lbl_pa_comment.Text = WebHelpers.FormatString(iina.pa_comment);

                //10

                lbl_condition.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.condition));

                lbl_wounds.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(iina.wounds));

                WebHelpers.LoadDataGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(iina.skin_anno), Iina.SKIN_ANNO, btn_grid_skin_anno_add);

                lbl_sensory_code.Text = WebHelpers.FormatString(iina.sensory_desc);
                lbl_moisture_code.Text = WebHelpers.FormatString(iina.moisture_desc);
                lbl_activity_code.Text = WebHelpers.FormatString(iina.activity_desc);
                lbl_mobility_code.Text = WebHelpers.FormatString(iina.mobility_desc);
                lbl_nutrition_code.Text = WebHelpers.FormatString(iina.nutrition_desc);
                lbl_friction_code.Text = WebHelpers.FormatString(iina.friction_desc);

                total_score.Text = WebHelpers.FormatString(iina.total_score);
                pres_sore_risk_desc.Text = WebHelpers.FormatString(iina.pres_sore_risk_desc);
                lbl_preven_action.Text = WebHelpers.FormatString(iina.preven_action);

                //11 - Checked
                lbl_bathing_desc.Text = WebHelpers.FormatString(iina.bathing_desc);
                lbl_oral_care_desc.Text = WebHelpers.FormatString(iina.oral_care_desc);
                lbl_dentures_desc.Text = WebHelpers.FormatString(iina.dentures_desc);
                lbl_toilet_use_desc.Text = WebHelpers.FormatString(iina.toilet_use_desc);
                lbl_dressing_desc.Text = WebHelpers.FormatString(iina.dressing_desc);
                lbl_eating_desc.Text = WebHelpers.FormatString(iina.eating_desc);
                lbl_turning_bed_desc.Text = WebHelpers.FormatString(iina.turning_bed_desc);
                lbl_ambulation_desc.Text = WebHelpers.FormatString(iina.ambulation_desc);
                lbl_sleep_desc.Text = WebHelpers.FormatString(iina.sleep_desc);
                lbl_medication_used.Text = WebHelpers.FormatString(iina.medication_used);
                //12 - Checked
                lbl_fall_history_desc.Text = WebHelpers.FormatString(iina.fall_history_desc);
                lbl_secon_diagnosis_desc.Text = WebHelpers.FormatString(iina.secon_diagnosis_desc);
                lbl_ambula_aids_desc.Text = WebHelpers.FormatString(iina.ambula_aids_desc);
                lbl_intra_therapy_desc.Text = WebHelpers.FormatString(iina.intra_therapy_desc);
                lbl_gait_trans_desc.Text = WebHelpers.FormatString(iina.gait_trans_desc);
                lbl_fr_mental_status_desc.Text = WebHelpers.FormatString(iina.fr_mental_status_desc);
                fr_total_score.Text = WebHelpers.FormatString(iina.fr_total_score);
                //D.
                lbl_involvement.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.involvement));
                lbl_req_med_equipment.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.req_med_equipment));
                lbl_req_foll_care.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.req_foll_care));
                lbl_suicidal_referral.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.suicidal_referral));
                lbl_ref_physiotherapist.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.ref_physiotherapist));
                lbl_ref_speech_therapist.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.ref_speech_therapist));
                lbl_ref_dietician.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.ref_dietician));
                lbl_ref_psychologist.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.ref_psychologist));
                lbl_ref_other_hospital.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.ref_other_hospital));
                lbl_support_at_home.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.support_at_home));
                lbl_req_transportation.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.req_transportation));
                lbl_stairs_climb_home.Text = WebHelpers.FormatString(WebHelpers.GetBool(iina.stairs_climb_home));
                //E
                lbl_dis_planning.Text = WebHelpers.FormatString(iina.dis_planning);
                //F
                lbl_dis_management.Text = WebHelpers.FormatString(iina.dis_management);
                lbl_assess_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(iina.assess_date_time, "dd-MM-yyyy HH:mm"));


                pain_annotation_img.Src = JObject.Parse(iina.pain_annotation).dataURI;

                skin_anno_data_img.Src = JObject.Parse(iina.skin_anno_data).dataURI;

                WebHelpers.VisibleControl(false, pain_annotation_undo, skin_anno_data_undo, pain_annotation_redo, skin_anno_data_redo, pain_annotation_pencilWrapper, skin_anno_data_pencil_wrapper);

                //final_screening_field.Visible = iina.bmi_out_range || iina.loss_weight || iina.reduce_dietary || iina.severely_ill;

                final_screening_field.Visible = ShowFinalScreening(iina);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormPrint(Iina iina)
        {
            try
            {

            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            //Patient patient = Patient.Instance();
            //prt_fullname.Text = $"{patient.FullName} ({patient.GetTitle()})";
            //prt_DOB.Text = $"{WebHelpers.FormatDateTime(patient.date_of_birth)} | {patient.Gender}";
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
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                Iina iina = new Iina(varDocID, loc);
                iina.status = DocumentStatus.FINAL;
                
                UpdateData(iina);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Iina iina = new Iina(varDocID, loc);
                iina.status = DocumentStatus.DRAFT;

                UpdateData(iina);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Iina.Delete((string)Session["UserId"], varDocID, loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);

                    Response.Redirect($"index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {

            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc))
            {
                Iina iina = new Iina(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, iina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(iina);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Iina iina = new Iina(varDocID, loc);
            BindingDataFormPrint(iina);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        protected void btn_grid_skin_anno_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_skin_anno.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_skin_anno.ID], grid_skin_anno, Iina.SKIN_ANNO);
        }
        protected void grid_skin_anno_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        #endregion

        #region METHODS
        public void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    iina = new Iina(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    iina = new Iina(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                loadRadGridHistoryLog();
                
                WebHelpers.setBmi(bmiStr, iina.vs_BMI);

                iina.pain_annotation = WebHelpers.getPainAnnotation(iina.pain_annotation);

                iina.skin_anno_data = WebHelpers.getSkinAnnoData(iina.skin_anno_data);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (iina.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(iina, WebHelpers.LoadFormControl(form1, iina, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    lblPid.Text = varVPID;
                    BindingDataFormPrint(iina);
                }
                else if (iina.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(iina, WebHelpers.LoadFormControl(form1, iina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, iina.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                final_screening_field.Visible = ShowFinalScreening(iina);
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

            lblVisitCode.Text = patientVisitInfo.VisitCode;

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Iina.Logs(varDocID, loc);
            RadGrid1.DataSource = dt;
            string last_updated_date_time = "";
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_e");

                WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("created_date_time"), out bool isValid, out last_updated_date_time);

                if (isValid)
                {
                    SignatureDate = last_updated_date_time;
                }
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("submited_name_e");
                WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("created_date_time"), out bool isValid, out last_updated_date_time);

                if (isValid)
                {
                    SignatureDate = last_updated_date_time;
                }
            }

            SignatureDate = last_updated_date_time;
            SignatureName = last_updated_doctor;
            RadLabel1.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{Convert.ToDateTime(last_updated_date_time).ToString("dd-MMM-yyyy HH:mm tt")}</i></b>";
            RadGrid1.DataBind();
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended";
            object name = "";
            object time = "";

            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                name = created_name;
                time = created_date_time;
            }
            else
            {
                name = modified_name;
                time = created_date_time;
            }

            WebHelpers.ConvertDateTime(time, out bool isValid, out string dateTime, "dd-MMM-yyyy HH:mm tt");

            return $"{result} by <i>{name}</i> on <i>{dateTime}</i>";
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/IPD/InpIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/InpIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";
            Response.Redirect(url);
        }
        private bool ShowFinalScreening(Iina iina)
        {
            if(iina.loss_weight != null) { if (iina.loss_weight) return true; }
            else if(iina.reduce_dietary != null) { if (iina.reduce_dietary) return true; }
            else if (iina.severely_ill != null) { if (iina.severely_ill) return true; }
            return false;
        }
        private string GetPresSoreRiskCode(int score)
        {
            if (score <= 10)
            {
                return "V";
            }
            else if (score <= 17)
            {
                return "H";
            }
            else
            {
                return "L";
            }
        }
        private int GetTotalScore()
        {
            int totalScore = 0;

            if (!string.IsNullOrEmpty(select_sensory_code.Value))
            {
                totalScore += int.Parse(select_sensory_code.Value);
            }
            if (!string.IsNullOrEmpty(select_moisture_code.Value))
            {
                totalScore += int.Parse(select_moisture_code.Value);
            }
            if (!string.IsNullOrEmpty(select_activity_code.Value))
            {
                totalScore += int.Parse(select_activity_code.Value);
            }
            if (!string.IsNullOrEmpty(select_mobility_code.Value))
            {
                totalScore += int.Parse(select_mobility_code.Value);
            }
            if (!string.IsNullOrEmpty(select_nutrition_code.Value))
            {
                totalScore += int.Parse(select_nutrition_code.Value);
            }
            if (!string.IsNullOrEmpty(select_friction_code.Value))
            {
                totalScore += int.Parse(select_friction_code.Value);
            }
            return totalScore;
        }
        private void update_total_nutri_score()
        {
            total_nutri_score.Text = Convert.ToString(int.Parse(nutrition_score.Text) + int.Parse(severity_score.Text) + int.Parse(age_score.Text));
        }
        private void UpdateData(Iina iina)
        {
            try
            {
                iina.residence_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_residence_code_", Iina.RESIDENCE_CODE);
                iina.residence_desc = WebHelpers.GetDicDesc(iina.residence_code, Iina.RESIDENCE_CODE);
                
                iina.residence_other = txt_residence_other.Value;
                //
                iina.language_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_language_code_", Iina.LANGUAGE_CODE);
                iina.language_desc = WebHelpers.GetDicDesc(iina.language_code, Iina.LANGUAGE_CODE);
                iina.language_other = txt_language_other.Value;
                //
                iina.req_interpreter = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_interpreter_");
                //
                iina.religion_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_religion_code_", Iina.RELIGION_CODE);
                iina.religion_desc = WebHelpers.GetDicDesc(iina.religion_code, Iina.RELIGION_CODE);
                iina.religion_other = txt_religion_other.Value;
                //
                iina.spiritual_couns = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spiritual_couns_");
                //
                iina.occupation = txt_occupation.Value;
                //
                iina.living_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_living_status_code_", Iina.LIVING_STATUS_CODE);
                iina.living_status_desc = WebHelpers.GetDicDesc(iina.living_status_code, Iina.LIVING_STATUS_CODE);
                iina.living_status_note = txt_living_status_note.Value;
                //
                iina.hospital_concern_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_hospital_concern_code_", Iina.HOSPITAL_CONCERN_CODE);
                iina.hospital_concern_desc = WebHelpers.GetDicDesc(iina.hospital_concern_code, Iina.HOSPITAL_CONCERN_CODE);
                iina.hospital_concern_other = txt_hospital_concern_other.Value;
                //
                iina.accompanied = txt_accompanied.Value;
                //
                iina.relationship = txt_relationship.Value;
                //checked
                //B. BỆNH SỬ/ MEDICAL HISTORY
                iina.admit_from_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_admit_from_code_", Iina.ADMIT_FROM_CODE);
                iina.admit_from_desc = WebHelpers.GetDicDesc(iina.admit_from_code, Iina.ADMIT_FROM_CODE);
                
                if(iina.admit_from_code == "OTH") iina.admit_from_other = txt_admit_from_other.Value;

                iina.arrived = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_arrived_code_", Iina.ARRIVED);
                //
                iina.admission_reason = txt_admission_reason.Value;
                //
                //iina.previous_admission = txt_previous_admission.Value;
                //
                iina.past_med_history = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_past_med_history_");
                iina.past_med_history_note = txt_past_med_history_note.Value;
                //
                iina.past_sur_history = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_past_sur_history_");
                iina.past_sur_history_note = txt_past_sur_history_note.Value;
                //
                iina.substance_abuse = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_substance_abuse_", Iina.SUBSTANCE_ABUSE);
                iina.substance_abuse_other = txt_substance_abuse_other.Value;
                //
                iina.previous_document = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_previous_document_");
                iina.previous_document_note = txt_previous_document_note.Value;
                //
                iina.cur_home_medication = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cur_home_medication_");
                //
                iina.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                iina.allergy_note = txt_allergy_note.Value;
                //
                iina.high_risk_patient = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_high_risk_patient_", Iina.HIGH_RISK_PATIENT_CODE);
                //C
                //1
                iina.vs_temperature = txt_vs_temperature.Value;
                iina.vs_heart_rate = txt_vs_heart_rate.Value;
                iina.vs_weight = txt_vs_weight.Value;
                iina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                iina.vs_height = txt_vs_height.Value;
                iina.vs_blood_pressure = txt_vs_blood_pressure.Value;
                iina.vs_BMI = txt_vs_bmi.Value;
                iina.vs_spO2 = txt_vs_spO2.Value;
                iina.vs_pulse = txt_vs_pulse.Value;
                //2
                iina.respiratory_system = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_respiratory_system_", Iina.RESPIRATORY_SYSTEM_CODE);
                iina.cough = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cough_");
                iina.pro_cough = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_pro_cough_");
                iina.pro_cough_note = txt_pro_cough_note.Value;
                //3
                iina.pulse_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_pulse_code_", Iina.PULSE_CODE);
                iina.pulse_desc = WebHelpers.GetDicDesc(iina.pulse_code, Iina.PULSE_CODE);

                iina.presence = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_presence_", Iina.PRESENCE_CODE);
                iina.extremities = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_extremities_", Iina.EXTREMITIES_CODE);
                //4 - passed
                iina.oriented = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_oriented_", Iina.ORIENTED_CODE);
                iina.mental_status = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_mental_status_", Iina.MENTAL_STATUS_CODE);
                iina.mental_status_other = txt_mental_status_other.Value;

                iina.hearing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_hearing_code_", Iina.HEARING_CODE);
                iina.hearing_desc = WebHelpers.GetDicDesc(iina.hearing_code, Iina.HEARING_CODE);

                iina.vision_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_vision_code_", Iina.VISION_CODE);
                iina.vision_desc = WebHelpers.GetDicDesc(iina.vision_code, Iina.VISION_CODE);
                iina.vision_other = txt_vision_other.Value;

                iina.speech_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_speech_code_", Iina.SPEECH_CODE);
                iina.speech_desc = WebHelpers.GetDicDesc(iina.speech_code, Iina.SPEECH_CODE);
                //5 - passed
                iina.diet_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_diet_code_", Iina.DIET_CODE);
                iina.diet_desc = WebHelpers.GetDicDesc(iina.diet_code, Iina.DIET_CODE);
                iina.diet_other = txt_diet_other.Value;
                iina.diet_pre_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_diet_pre_code_", Iina.DIET_PRE_CODE);
                iina.diet_pre_desc = WebHelpers.GetDicDesc(iina.diet_pre_code, Iina.DIET_PRE_CODE);

                iina.ng_tube = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ng_tube_");
                iina.gastrostomy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_gastrostomy_", true);
                iina.size = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_size_", true);
                iina.size_note = txt_size_note.Value;
                iina.last_date_changed = DataHelpers.ConvertSQLDateTime(dpk_last_date_changed.SelectedDate);
                iina.food_dislike = txt_food_dislike.Value;

                iina.bowel_elimination_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bowel_elimination_code_", Iina.BOWEL_ELIMINATION_CODE);
                iina.bowel_elimination_desc = WebHelpers.GetDicDesc(iina.bowel_elimination_code, Iina.BOWEL_ELIMINATION_CODE);

                iina.stool_consistency_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_stool_consistency_code_", Iina.STOOL_CONSISTENCY_CODE);
                if (iina.stool_consistency_code != null) iina.stool_consistency_desc = Iina.STOOL_CONSISTENCY_CODE[iina.stool_consistency_code];

                iina.gas_presence_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gas_presence_code_", Iina.GAS_PRESENCE_CODE);
                iina.gas_presence_desc = WebHelpers.GetDicDesc(iina.gas_presence_code, Iina.GAS_PRESENCE_CODE);
                //6
                iina.bmi_out_range = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bmi_out_range_");
                iina.loss_weight = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_loss_weight_");
                iina.reduce_dietary = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_reduce_dietary_");
                iina.severely_ill = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_severely_ill_");
                //table 2
                iina.nutrition_normal = cb_nutrition_normal_true.Checked;
                iina.nutrition_score1 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);
                iina.nutrition_score1 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);
                iina.nutrition_score2 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score2_", Iina.NUTRITION_SCORE2_CODE);
                iina.nutrition_score3 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score3_", Iina.NUTRITION_SCORE3_CODE);
                iina.nutrition_score = nutrition_score.Text;
                //
                // mising Điểm = 0 / Score = 0
                iina.normal_nutrition_req = cb_normal_nutrition_req_true.Checked;
                iina.severity_score1 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score1_", Iina.SEVERITY_SCORE1_CODE);
                iina.severity_score2 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score2_", Iina.SEVERITY_SCORE2_CODE);
                iina.severity_score3 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score3_", Iina.SEVERITY_SCORE3_CODE);
                iina.severity_score = severity_score.Text;
                //Age
                iina.younger_70 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_younger_70_", true);
                iina.older_70 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_older_70_", true);
                iina.age_score = age_score.Text;
                iina.total_nutri_score = total_nutri_score.Text;

                //7
                iina.urination = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_urination_", Iina.URINATION_CODE);
                iina.inter_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_inter_catheter_", true);
                iina.inter_catheter_note = txt_inter_catheter_note.Value;

                iina.ind_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_ind_catheter_", true);
                iina.ind_catheter_size = txt_ind_catheter_size.Value;
                iina.ind_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_ind_catheter_date.SelectedDate);

                iina.sup_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_sup_catheter_", true);
                iina.sup_catheter_size = txt_sup_catheter_size.Value;
                iina.last_sup_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_last_sup_catheter_date.SelectedDate);

                iina.menstruation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_menstruation_code_", Iina.MENSTRUATION_CODE);
                iina.menstruation_desc = WebHelpers.GetDicDesc(iina.menstruation_code, Iina.MENSTRUATION_CODE); 

                iina.cycle_day = txt_cycle_day.Value;
                iina.last_mens_period = txt_last_mens_period.Value;

                iina.not_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_not_pregnancy_", true);
                iina.pre_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_pre_pregnancy_", true);
                iina.para = txt_para.Value;
                iina.cur_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_cur_pregnancy_", true);
                iina.pregnancy_week = txt_pregnancy_week.Value;

                iina.contraception_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_contraception_code_", Iina.CONTRACEPTION_CODE);
                iina.contraception_desc = WebHelpers.GetDicDesc(iina.contraception_code, Iina.CONTRACEPTION_CODE);
                iina.contraception_other = txt_contraception_other.Value;

                //8 - Passed
                iina.mus_history = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_mus_history_", Iina.MUS_HISTORY);

                iina.paralysis = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_paralysis_", true);
                iina.paralysis_note = txt_paralysis_note.Value;

                iina.amputation = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_amputation_", true);
                iina.amputation_note = txt_amputation_note.Value;

                iina.contracture = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_contracture_", true);
                iina.contracture_note = txt_contracture_note.Value;

                iina.prosthesis = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_prosthesis_", true);
                iina.prosthesis_note = txt_prosthesis_note.Value;

                //9 - Passed
                iina.cur_in_pain = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cur_in_pain_");
                iina.p_location_1 = txt_p_location_1.Value;
                iina.p_location_2 = txt_p_location_2.Value;
                iina.p_location_3 = txt_p_location_3.Value;

                iina.q_location_1 = txt_q_location_1.Value;
                iina.q_location_2 = txt_q_location_2.Value;
                iina.q_location_3 = txt_q_location_3.Value;

                iina.r_location_1 = txt_r_location_1.Value;
                iina.r_location_2 = txt_r_location_2.Value;
                iina.r_location_3 = txt_r_location_3.Value;

                iina.s_location_1 = txt_s_location_1.Value;
                iina.s_location_2 = txt_s_location_2.Value;
                iina.s_location_3 = txt_s_location_3.Value;

                iina.t_location_1 = txt_t_location_1.Value;
                iina.t_location_2 = txt_t_location_2.Value;
                iina.t_location_3 = txt_t_location_3.Value;

                iina.using_pain_killer = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_using_pain_killer_");
                iina.pain_killer_name = txt_pain_killer_name.Value;
                iina.pa_comment = txt_pa_comment.Value;
                //10 - Passed
                iina.condition = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_condition_", Iina.CONDITION_CODE);

                iina.wounds = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_wounds_", Iina.WOUNDS_CODE);

                iina.skin_anno = WebHelpers.GetDataGridView(grid_skin_anno, Iina.SKIN_ANNO);

                iina.sensory_code = Request.Form.Get("select_sensory_code");
                iina.sensory_desc = WebHelpers.GetDicDesc(iina.sensory_code, Iina.SENSORY_CODE);

                iina.moisture_code = Request.Form.Get("select_moisture_code");
                iina.moisture_desc = WebHelpers.GetDicDesc(iina.moisture_code, Iina.MOISTURE_CODE);

                iina.activity_code = Request.Form.Get("select_activity_code");
                iina.activity_desc = WebHelpers.GetDicDesc(iina.activity_code, Iina.ACTIVITY_CODE);

                iina.mobility_code = Request.Form.Get("select_mobility_code");
                iina.mobility_desc = WebHelpers.GetDicDesc(iina.mobility_code, Iina.MOBILITY_CODE);

                iina.nutrition_code = Request.Form.Get("select_nutrition_code");
                iina.nutrition_desc = WebHelpers.GetDicDesc(iina.nutrition_code, Iina.NUTRITION_CODE);

                iina.friction_code = Request.Form.Get("select_friction_code");
                iina.friction_desc = WebHelpers.GetDicDesc(iina.friction_code, Iina.FRICTION_CODE);

                iina.total_score = Convert.ToString(GetTotalScore());

                //
                iina.pres_sore_risk_code = GetPresSoreRiskCode(int.Parse(iina.total_score));
                iina.pres_sore_risk_desc = WebHelpers.GetDicDesc(iina.pres_sore_risk_code, Iina.PRES_SORE_RISK_CODE);

                iina.preven_action = txt_preven_action.Value;
                //11 - Passed
                iina.bathing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bathing_code_", Iina.BATHING_CODE);
                iina.bathing_desc = WebHelpers.GetDicDesc(iina.bathing_code, Iina.BATHING_CODE);

                iina.oral_care_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_oral_care_code_", Iina.ORAL_CARE_CODE);
                iina.oral_care_desc = WebHelpers.GetDicDesc(iina.oral_care_code, Iina.ORAL_CARE_CODE);
                iina.oral_care_note = txt_oral_care_note.Value;

                iina.dentures_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_dentures_code_", Iina.DENTURES_CODE);
                iina.dentures_desc = WebHelpers.GetDicDesc(iina.dentures_code, Iina.DENTURES_CODE);

                iina.toilet_use_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_toilet_use_code_", Iina.TOILET_USE_CODE);
                iina.toilet_use_desc = WebHelpers.GetDicDesc(iina.toilet_use_code, Iina.TOILET_USE_CODE);

                iina.dressing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_dressing_code_", Iina.DRESSING_CODE);
                iina.dressing_desc = WebHelpers.GetDicDesc(iina.dressing_code, Iina.DRESSING_CODE);

                iina.eating_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_eating_code_", Iina.EATING_CODE);
                iina.eating_desc = WebHelpers.GetDicDesc(iina.eating_code, Iina.EATING_CODE);

                iina.turning_bed_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_turning_bed_code_", Iina.TURNING_BED_CODE);
                iina.turning_bed_desc = WebHelpers.GetDicDesc(iina.turning_bed_code, Iina.TURNING_BED_CODE);

                iina.ambulation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ambulation_code_", Iina.AMBULATION_CODE);
                iina.ambulation_desc = WebHelpers.GetDicDesc(iina.ambulation_code, Iina.AMBULATION_CODE);

                iina.ambulation_note = txt_ambulation_note.Value;

                iina.sleep_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_sleep_code_", Iina.SLEEP_CODE);
                iina.sleep_desc = WebHelpers.GetDicDesc(iina.sleep_code, Iina.SLEEP_CODE);

                iina.medication_used = txt_medication_used.Value;
                //12
                iina.fall_history_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_history_code_", Iina.FALL_HISTORY_CODE);
                iina.fall_history_desc = WebHelpers.GetDicDesc(iina.fall_history_code, Iina.FALL_HISTORY_CODE);

                iina.secon_diagnosis_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_secon_diagnosis_code_", Iina.SECON_DIAGNOSIS_CODE);
                iina.secon_diagnosis_desc = WebHelpers.GetDicDesc(iina.secon_diagnosis_code, Iina.SECON_DIAGNOSIS_CODE);

                iina.ambula_aids_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ambula_aids_code_", Iina.AMBULA_AIDS_CODE);
                iina.ambula_aids_desc = WebHelpers.GetDicDesc(iina.ambula_aids_code, Iina.AMBULA_AIDS_CODE);

                iina.intra_therapy_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_intra_therapy_code_", Iina.INTRA_THERAPY_CODE);
                iina.intra_therapy_desc = WebHelpers.GetDicDesc(iina.intra_therapy_code, Iina.INTRA_THERAPY_CODE);

                iina.gait_trans_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gait_trans_code_", Iina.GAIT_TRANS_CODE);
                iina.gait_trans_desc = WebHelpers.GetDicDesc(iina.gait_trans_code, Iina.GAIT_TRANS_CODE);

                iina.fr_mental_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fr_mental_status_code_", Iina.FR_MENTAL_STATUS_CODE);
                iina.fr_mental_status_desc = WebHelpers.GetDicDesc(iina.fr_mental_status_code, Iina.FR_MENTAL_STATUS_CODE);

                iina.fr_total_score = fr_total_score.Text;
                //D
                iina.involvement = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_involvement_");
                iina.req_med_equipment = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_med_equipment_");
                iina.req_foll_care = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_foll_care_");
                iina.suicidal_referral = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_suicidal_referral_");
                iina.alone_reduce_functional = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_alone_reduce_functional_");
                iina.ref_physiotherapist = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_physiotherapist_");
                iina.ref_speech_therapist = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_speech_therapist_");
                iina.ref_dietician = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_dietician_");
                iina.ref_psychologist = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_psychologist_");
                iina.ref_other_hospital = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_other_hospital_");
                iina.support_at_home = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_support_at_home_");
                iina.req_transportation = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_transportation_");
                iina.stairs_climb_home = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_stairs_climb_home_");
                iina.dis_planning = txt_dis_planning.Value;
                iina.dis_management = txt_dis_management.Value;
                iina.assess_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assess_date_time.SelectedDate);

                iina.pain_annotation = "{\"dataURI\":\"" + pain_annotation_base64.Value + "\"}";

                iina.skin_anno_data = "{\"dataURI\":\"" + skin_anno_data_base64.Value + "\"}";

                if (JsonConvert.SerializeObject(iina) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                iina.amend_reason = txt_amend_reason.Text;
                iina.user_name = (string)Session["UserID"];

                dynamic result = iina.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void PostBackEvent()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "initial_screening_change":
                    initial_screening_change(Request["__EVENTARGUMENT"]);
                    break;
                case "nutrition_status_change":
                    nutrition_status_change(Request["__EVENTARGUMENT"]);
                    break;
                case "severity_of_disease_change":
                    severity_of_disease_change(Request["__EVENTARGUMENT"]);
                    break;
                case "age_change":
                    age_change(Request["__EVENTARGUMENT"]);
                    break;
                case "total_score_change":
                    total_score_change(Request["__EVENTARGUMENT"]);
                    break;
                case "fr_total_score_change":
                    fr_total_score_change(Request["__EVENTARGUMENT"]);
                    break;
            }
        }
        private void fr_total_score_change(string v)
        {
            int frTotalScore = 0;

            if (rad_fall_history_code_25.Checked) frTotalScore += 25;

            if (rad_secon_diagnosis_code_15.Checked) frTotalScore += 15;

            if (rad_ambula_aids_code_15.Checked) frTotalScore += 15;
            else if (rad_ambula_aids_code_30.Checked) frTotalScore += 30;

            if (rad_intra_therapy_code_20.Checked) frTotalScore += 20;

            if (rad_gait_trans_code_10.Checked) frTotalScore += 10;
            else if (rad_gait_trans_code_20.Checked) frTotalScore += 20;

            if (rad_fr_mental_status_code_15.Checked) frTotalScore += 15;

            fr_total_score.Text = Convert.ToString(frTotalScore);
        }
        private void total_score_change(string v)
        {
            int totalScore = GetTotalScore();

            pres_sore_risk_desc.Text = Iina.PRES_SORE_RISK_CODE[GetPresSoreRiskCode(totalScore)];

            total_score.Text = Convert.ToString(totalScore);
        }
        protected void age_change(string v)
        {
            try
            {
                age_score.Text = cb_older_70_true.Checked ? "1" : "0";
                update_total_nutri_score();
            }
            catch (Exception ex)
            {

            }
        }
        protected void severity_of_disease_change(string v)
        {
            int score = 0;

            try
            {
                if (cb_severity_score1_1.Checked || cb_severity_score1_1.Checked || cb_severity_score1_3.Checked || cb_severity_score1_4.Checked)
                {
                    score += 1;
                }
                if (cb_severity_score2_1.Checked || cb_severity_score2_2.Checked || cb_severity_score2_3.Checked || cb_severity_score2_4.Checked || cb_severity_score2_5.Checked)
                {
                    score += 2;
                }
                if (cb_severity_score3_1.Checked || cb_severity_score3_2.Checked || cb_severity_score3_3.Checked)
                {
                    score += 3;
                }
                severity_score.Text = Convert.ToString(score);
                update_total_nutri_score();
            }
            catch (Exception ex)
            {
                WebHelpers.Notification(Page, "function severity_of_disease_change catched error" + ex.Message);
            }
        }
        protected void nutrition_status_change(string v)
        {
            int score = 0;

            try
            {
                if (cb_nutrition_score1_1.Checked || cb_nutrition_score1_2.Checked)
                {
                    score += 1;
                }
                if (cb_nutrition_score2_1.Checked || cb_nutrition_score2_2.Checked || cb_nutrition_score2_3.Checked)
                {
                    score += 2;
                }
                if (cb_nutrition_score3_1.Checked || cb_nutrition_score3_2.Checked || cb_nutrition_score3_3.Checked)
                {
                    score += 3;
                }
                nutrition_score.Text = Convert.ToString(score);
                update_total_nutri_score();
            }
            catch (Exception ex)
            {

            }
        }
        protected void initial_screening_change(string v)
        {
            if (rad_bmi_out_range_true.Checked || rad_loss_weight_true.Checked || rad_reduce_dietary_true.Checked || rad_severely_ill_true.Checked)
            {
                final_screening_field.Visible = true;
            }
            else
            {
                final_screening_field.Visible = false;
            }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Validations
        protected void allergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_allergy_true.Checked || rad_allergy_false.Checked;
        }
        protected void alone_reduce_functional_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_alone_reduce_functional_true.Checked || rad_alone_reduce_functional_false.Checked;
        }
        protected void bmi_out_range_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_bmi_out_range_true.Checked || rad_bmi_out_range_false.Checked;
        }
        protected void rad_cough_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_cough_true.Checked || rad_cough_false.Checked;
        }
        protected void cur_home_medication_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_cur_home_medication_true.Checked || rad_cur_home_medication_false.Checked;
        }
        protected void cur_in_pain_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_cur_in_pain_true.Checked || rad_cur_in_pain_false.Checked;
        }
        protected void involvement_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_involvement_true.Checked || rad_involvement_false.Checked;
        }
        protected void loss_weight_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_loss_weight_true.Checked || rad_loss_weight_false.Checked;
        }
        protected void ng_tube_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_ng_tube_true.Checked || rad_ng_tube_false.Checked;
        }
        protected void past_sur_history_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_past_sur_history_true.Checked || rad_past_sur_history_false.Checked;
        }
        protected void past_med_history_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_past_med_history_true.Checked || rad_past_med_history_false.Checked;
        }
        protected void previous_document_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_previous_document_true.Checked || rad_previous_document_false.Checked;
        }
        protected void pro_cough_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_pro_cough_true.Checked || rad_pro_cough_false.Checked;
        }
        protected void rad_ref_other_hospital_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_ref_other_hospital_true.Checked || rad_ref_other_hospital_false.Checked;
        }
        protected void using_pain_killer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_using_pain_killer_true.Checked || rad_using_pain_killer_false.Checked;
        }

        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
    }
}
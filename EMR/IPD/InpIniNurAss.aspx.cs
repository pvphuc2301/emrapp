using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class InpIniNurAss : System.Web.UI.Page
    {
        #region Variables
        Iina iina;
        string UserID = "";
        #endregion
        
        #region Page Lifecycle
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserID();
            if (!IsPostBack)
            {
                Initial();
            }

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
        #endregion

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

            fr_total_score.Text = frTotalScore.ToString();
        }
        private void total_score_change(string v)
        {
            int totalScore = GetTotalScore();

            pres_sore_risk_desc.Text = Iina.PRES_SORE_RISK_CODE[GetPresSoreRiskCode(totalScore)];

            total_score.Text = totalScore.ToString();
        }
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            iina = new Iina(Request.QueryString["docId"]);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;
            //prt_barcode.Text = Patient.Instance().visible_patient_id;
            if (iina.status == DocumentStatus.FINAL)
            {
                loadFormView(iina);
            }
            else if (iina.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(iina);
            }

            final_screening_field.Visible = iina.bmi_out_range || iina.loss_weight || iina.reduce_dietary || iina.severely_ill;
        }

        #region Load Forms
        private void LoadFormEdit(Iina iina)
        {
            try
            {
                //residence
                BindRadioButton("rad_residence_code_" + iina.residence_code);
                txt_residence_other.Value = iina.residence_other;
                //language
                BindRadioButton("rad_language_code_" + iina.language_code);
                txt_language_other.Value = iina.language_other;
                //
                BindRadioButton("rad_req_interpreter_" + iina.req_interpreter);
                //
                BindRadioButton("rad_religion_code_" + iina.religion_code);
                //
                BindRadioButton("rad_spiritual_couns_" + iina.spiritual_couns);
                txt_occupation.Value = iina.occupation;
                //
                BindRadioButton("rad_living_status_code_" + iina.living_status_code);
                txt_living_status_note.Value = iina.living_status_note;
                //
                BindRadioButton("rad_hospital_concern_code_" + iina.hospital_concern_code);
                txt_hospital_concern_other.Value = iina.hospital_concern_other;
                //
                txt_accompanied.Value = iina.accompanied;
                //
                txt_relationship.Value = iina.relationship;
                //
                BindRadioButton("rad_admit_from_code_" + iina.admit_from_code);
                //
                BindCheckBox("cb_arrived_code_", iina.arrived);
                //
                txt_admission_reason.Value = iina.admission_reason;
                //
                lbl_previous_admission.Text = iina.previous_admission;
                //
                BindRadioButton("rad_past_med_history_" + iina.past_med_history);
                txt_past_med_history_note.Value = iina.past_med_history_note;
                //
                BindRadioButton("rad_past_sur_history_" + iina.past_sur_history);
                txt_past_sur_history_note.Value = iina.past_sur_history_note;
                //
                BindCheckBox("cb_substance_abuse_", iina.substance_abuse);
                txt_substance_abuse_other.Value = iina.substance_abuse_other;
                //
                BindRadioButton("rad_previous_document_" + iina.previous_document);
                txt_previous_document_note.Value = iina.previous_document_note;
                //
                BindRadioButton("rad_cur_home_medication_" + iina.cur_home_medication);
                //
                BindRadioButton("rad_allergy_" + iina.allergy);
                txt_allergy_note.Value = iina.allergy_note;
                //
                BindCheckBox("cb_high_risk_patient_", iina.high_risk_patient);
                //
                txt_vs_temperature.Value = iina.vs_temperature;
                txt_vs_heart_rate.Value = iina.vs_heart_rate;
                txt_vs_weight.Value = iina.vs_weight;
                txt_vs_respiratory_rate.Value = iina.vs_respiratory_rate;
                txt_vs_height.Value = iina.vs_height;
                txt_vs_blood_pressure.Value = iina.vs_blood_pressure;
                txt_vs_BMI.Value = iina.vs_BMI;
                txt_vs_spO2.Value = iina.vs_spO2;
                txt_vs_pulse.Value = iina.vs_pulse;

                //2.
                BindCheckBox("cb_respiratory_system_", iina.respiratory_system);
                BindRadioButton("rad_cough_" + iina.cough);
                BindRadioButton("rad_pro_cough_note_" + iina.pro_cough);
                txt_pro_cough_note.Value = iina.pro_cough_note;
                BindRadioButton("rad_pulse_code_" + iina.pulse_code);
                BindCheckBox("cb_presence_", iina.presence);
                BindCheckBox("cb_extremities_", iina.extremities);
                //4.
                BindCheckBox("cb_oriented_", iina.oriented);
                BindCheckBox("cb_mental_status_", iina.mental_status);
                txt_mental_status_other.Value = iina.mental_status_other;
                BindRadioButton("rad_hearing_code_" + iina.hearing_code);
                BindRadioButton("rad_vision_code_" + iina.vision_code);
                txt_vision_other.Value = iina.vision_other;
                BindRadioButton("rad_speech_code_" + iina.speech_code);
                //5.
                BindRadioButton("rad_diet_code_" + iina.diet_code);
                txt_diet_other.Value = iina.diet_other;
                BindRadioButton("rad_diet_pre_code_" + iina.diet_pre_code);
                BindRadioButton("rad_ng_tube_" + iina.ng_tube);
                BindCheckBox("cb_gastrostomy_" + iina.gastrostomy);
                BindCheckBox("cb_size_" + iina.size);
                cb_size_true.Disabled = cb_gastrostomy_true.Disabled = false;
                txt_size_note.Value = iina.size_note;
                WebHelpers.BindDateTimePicker(dpk_last_date_changed, iina.last_date_changed);
                txt_food_dislike.Value = iina.food_dislike;
                BindRadioButton("rad_bowel_elimination_code_" + iina.bowel_elimination_code);
                BindRadioButton("rad_stool_consistency_code_" + iina.stool_consistency_code);
                BindRadioButton("rad_gas_presence_code_" + iina.gas_presence_code);
                //6.
                BindRadioButton("rad_bmi_out_range_" + iina.bmi_out_range);
                BindRadioButton("rad_loss_weight_" + iina.loss_weight);
                BindRadioButton("rad_reduce_dietary_" + iina.loss_weight);
                BindRadioButton("rad_severely_ill_" + iina.severely_ill);

                //BindCheckBox("cb_nutrition_normal_" + iina.nutrition_normal);
                //BindCheckBox("cb_nutrition_score1_" + iina.nutrition_score1);

                BindCheckBox("cb_nutrition_score1_", iina.nutrition_score1);
                BindCheckBox("cb_nutrition_score2_", iina.nutrition_score2);
                BindCheckBox("cb_nutrition_score3_", iina.nutrition_score3);
                nutrition_score.Text = iina.nutrition_score;

                BindCheckBox("cb_severity_score1_", iina.severity_score1);
                BindCheckBox("cb_severity_score2_", iina.severity_score2);
                BindCheckBox("cb_severity_score3_", iina.severity_score3);
                severity_score.Text = iina.severity_score;

                BindCheckBox("cb_younger_70_" + iina.younger_70);
                BindCheckBox("cb_older_70_" + iina.older_70);
                age_score.Text = iina.age_score;

                total_nutri_score.Text = iina.total_nutri_score;

                //7
                BindCheckBox("cb_urination_", iina.urination);

                BindCheckBox("cb_inter_catheter_" + iina.inter_catheter);
                txt_inter_catheter_note.Value = iina.inter_catheter_note;

                BindCheckBox("cb_ind_catheter_" + iina.ind_catheter);
                txt_ind_catheter_size.Value = iina.ind_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_ind_catheter_date, iina.ind_catheter_date);

                BindCheckBox("cb_sup_catheter_" + iina.sup_catheter);
                txt_sup_catheter_size.Value = iina.sup_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_last_sup_catheter_date, iina.last_sup_catheter_date);

                BindRadioButton("rad_menstruation_code_" + iina.menstruation_code);
                txt_cycle_day.Value = iina.cycle_day;

                txt_last_mens_period.Value = iina.last_mens_period;

                BindCheckBox("cb_not_pregnancy_" + iina.not_pregnancy);
                BindCheckBox("cb_pre_pregnancy_" + iina.pre_pregnancy);
                txt_para.Value = iina.para;
                BindCheckBox("cb_cur_pregnancy_" + iina.cur_pregnancy);
                txt_pregnancy_week.Value = iina.pregnancy_week;

                BindRadioButton("rad_contraception_" + iina.contraception_code);
                txt_contraception_other.Value = iina.contraception_other;

                //8
                BindCheckBox("cb_mus_history_" + iina.mus_history);

                BindCheckBox("cb_paralysis_" + iina.paralysis);
                txt_paralysis_note.Value = iina.paralysis_note;
                BindCheckBox("cb_amputation_" + iina.amputation);
                txt_amputation_note.Value = iina.amputation_note;
                BindCheckBox("cb_contracture_" + iina.contracture);
                txt_contracture_note.Value = iina.contracture_note;
                BindCheckBox("cb_prosthesis_" + iina.prosthesis);
                txt_prosthesis_note.Value = iina.prosthesis_note;

                //9
                BindRadioButton("rad_cur_in_pain_" + iina.cur_in_pain);
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

                BindRadioButton("rad_using_pain_killer_" + iina.using_pain_killer);

                txt_pain_killer_name.Value = iina.pain_killer_name;
                txt_pa_comment.Value = iina.pa_comment;

                //10
                BindCheckBox("cb_condition_" + iina.condition);

                BindCheckBox("cb_wounds_" + iina.wounds);

                _BindGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(iina.skin_anno));

                BindSelect(select_sensory_code, Iina.SENSORY_CODE);
                BindSelect(select_moisture_code, Iina.MOISTURE_CODE);
                BindSelect(select_activity_code, Iina.ACTIVITY_CODE);
                BindSelect(select_mobility_code, Iina.MOBILITY_CODE);
                BindSelect(select_nutrition_code, Iina.NUTRITION_CODE);
                BindSelect(select_friction_code, Iina.FRICTION_CODE);

                BindSelectOption(select_sensory_code, iina.sensory_code);
                BindSelectOption(select_moisture_code, iina.moisture_code);
                BindSelectOption(select_activity_code, iina.activity_code);
                BindSelectOption(select_mobility_code, iina.mobility_code);
                BindSelectOption(select_nutrition_code, iina.nutrition_code);
                BindSelectOption(select_friction_code, iina.friction_code);
                total_score.Text = iina.total_score;

                pres_sore_risk_desc.Text = iina.pres_sore_risk_desc;
                txt_preven_action.Value = iina.preven_action;

                //11

                BindRadioButton("rad_bathing_code_" + iina.bathing_code);
                BindRadioButton("rad_oral_care_code_" + iina.oral_care_code);
                BindRadioButton("rad_dentures_code_" + iina.dentures_code);
                BindRadioButton("rad_toilet_use_code_" + iina.toilet_use_code);
                BindRadioButton("rad_dressing_code_" + iina.dressing_code);
                BindRadioButton("rad_eating_code_" + iina.eating_code);
                BindRadioButton("rad_turning_bed_code_" + iina.turning_bed_code);
                BindRadioButton("rad_ambulation_code_" + iina.ambulation_code);
                BindRadioButton("rad_sleep_code_" + iina.sleep_code);

                txt_medication_used.Value = iina.medication_used;

                BindRadioButton("rad_fall_history_code_" + iina.fall_history_code);
                BindRadioButton("rad_secon_diagnosis_code_" + iina.secon_diagnosis_code);
                BindRadioButton("rad_ambulation_code_" + iina.ambulation_code);
                BindRadioButton("rad_intra_therapy_code_" + iina.intra_therapy_code);
                BindRadioButton("rad_gait_trans_code_" + iina.gait_trans_code);
                BindRadioButton("rad_fr_mental_status_code_" + iina.fr_mental_status_code);

                //lbl_fr_total_score = iina.fr_total_score;

                BindRadioButton("rad_involvement_" + iina.involvement);
                BindRadioButton("rad_req_med_equipment_" + iina.req_med_equipment);
                BindRadioButton("rad_req_foll_care_" + iina.req_foll_care);
                BindRadioButton("rad_suicidal_referral_" + iina.suicidal_referral);
                BindRadioButton("rad_alone_reduce_functional_" + iina.alone_reduce_functional);
                BindRadioButton("rad_ref_physiotherapist_" + iina.ref_physiotherapist);
                BindRadioButton("rad_ref_speech_therapist_" + iina.ref_speech_therapist);
                BindRadioButton("rad_ref_dietician_" + iina.ref_dietician);
                BindRadioButton("rad_ref_psychologist_" + iina.ref_psychologist);
                BindRadioButton("rad_ref_other_hospital_" + iina.ref_other_hospital);
                BindRadioButton("rad_support_at_home_" + iina.support_at_home);
                BindRadioButton("rad_req_transportation_" + iina.req_transportation);
                BindRadioButton("rad_stairs_climb_home_" + iina.stairs_climb_home);

                txt_dis_planning.Value = iina.dis_planning;
                txt_dis_management.Value = iina.dis_management;

                WebHelpers.BindDateTimePicker(dtpk_assess_date_time, iina.assess_date_time);

                LoadFormControl(false);

                btn_grid_skin_anno_add.Visible = true;
                grid_skin_anno.Columns[grid_skin_anno.Columns.Count - 1].Visible = true;

                btnAmend.Visible = false;
                btnPrint.Visible = false;

            }
            catch (Exception ex)
            {
                Session["PageNotFound"] = ex;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        private void loadFormView(Iina iina)
        {
            lbl_residence_desc.Text = WebHelpers.GetValue(iina.residence_desc) + (iina.residence_code == "OTH" ? WebHelpers.GetValue(iina.residence_other) : "");
            lbl_language_desc.Text = WebHelpers.GetValue(iina.language_desc) + (iina.language_code == "OTH" ? WebHelpers.GetValue(iina.language_other) : "");
            lbl_req_interpreter.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.req_interpreter));
            lbl_religion_code.Text = WebHelpers.GetValue(iina.religion_desc) + (iina.religion_code == "OTH" ? WebHelpers.GetValue(iina.religion_other) : "");
            lbl_spiritual_couns.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.spiritual_couns));
            lbl_occupation.Text = WebHelpers.GetValue(iina.occupation);
            lbl_living_status_desc.Text = WebHelpers.GetValue(iina.living_status_desc) + (iina.living_status_code == "OTH" ? WebHelpers.GetValue(iina.living_status_note) : "");
            lbl_hospital_concern_desc.Text = WebHelpers.GetValue(iina.hospital_concern_desc) + (iina.hospital_concern_code == "OTH" ? WebHelpers.GetValue(iina.hospital_concern_other) : "");
            lbl_accompanied.Text = WebHelpers.GetValue(iina.accompanied);
            lbl_relationship.Text = WebHelpers.GetValue(iina.relationship);
            //B
            lbl_admit_from_desc.Text = WebHelpers.GetValue(iina.admit_from_desc) + (iina.admit_from_code == "OTH" ? WebHelpers.GetValue(iina.admit_from_other) : "");
            lbl_arrived.Text = WebHelpers.GetValue(DisplayCheckBox(iina.arrived));
            lbl_admission_reason.Text = WebHelpers.GetValue(iina.admission_reason);
            lbl_previous_admission.Text = WebHelpers.GetValue(iina.previous_admission);
            lbl_past_med_history.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.past_med_history));
            lbl_past_sur_history.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.past_sur_history));
            
            lbl_substance_abuse.Text = WebHelpers.GetValue(DisplayCheckBox(iina.substance_abuse));

            lbl_previous_document.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.previous_document, "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(iina.previous_document_note)));
            lbl_cur_home_medication.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.cur_home_medication, "Có/ Yes (Tham khảo đơn thuốc đính kèm)/ If, yes please refer to the prescription attached"));
            lbl_allergy.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.allergy, "Có (ghi rõ)/ Yes (specify): " + iina.allergy_note));
            lbl_high_risk_patient.Text = WebHelpers.GetValue(DisplayCheckBox(iina.high_risk_patient));
            //C
            //1
            lbl_vs_temperature.Text = WebHelpers.GetValue(iina.vs_temperature) + "";
            lbl_vs_weight.Text = WebHelpers.GetValue(iina.vs_weight);
            lbl_vs_height.Text = WebHelpers.GetValue(iina.vs_height);
            lbl_vs_BMI.Text = WebHelpers.GetValue(iina.vs_BMI);
            lbl_vs_heart_rate.Text = WebHelpers.GetValue(iina.vs_heart_rate);
            lbl_vs_respiratory_rate.Text = WebHelpers.GetValue(iina.vs_respiratory_rate);
            lbl_vs_blood_pressure.Text = WebHelpers.GetValue(iina.vs_blood_pressure);
            lbl_vs_spO2.Text = WebHelpers.GetValue(iina.vs_spO2);
            lbl_vs_pulse.Text = WebHelpers.GetValue(iina.vs_pulse);
            //2
            lbl_cough.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.cough));
            lbl_pro_cough.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.cough, "Có đờm/ Productive (ghi rõ màu/ tính chất/ số lượng)/ (Specify color/ nature/ amount)" + iina.pro_cough_note, "Không có đờm/ Unproductive cough"));
            
            //3
            lbl_pulse_desc.Text = WebHelpers.GetValue(iina.pulse_desc);
            lbl_presence.Text = WebHelpers.GetValue(DisplayCheckBox(iina.presence));
            lbl_extremities.Text = WebHelpers.GetValue(DisplayCheckBox(iina.extremities));
            //4
            lbl_oriented.Text = WebHelpers.GetValue(DisplayCheckBox(iina.oriented));
            lbl_mental_status.Text = WebHelpers.GetValue(DisplayCheckBox(iina.mental_status));
            lbl_hearing_code.Text = WebHelpers.GetValue(iina.hearing_desc);

            lbl_vision_code.Text = WebHelpers.GetValue(iina.vision_desc) + (iina.vision_code == "OTH" ? WebHelpers.GetValue(iina.vision_other) : "");
            lbl_speech_code.Text = WebHelpers.GetValue(iina.speech_desc);
            //5
            lbl_diet_desc.Text = WebHelpers.GetValue(iina.diet_desc);
            lbl_diet_pre_desc.Text = WebHelpers.GetValue(iina.diet_pre_desc);
            lbl_ng_tube.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.ng_tube, "Ống thông/ NG Tube"));
            cb_gastrostomy_true.Disabled = true;
            if (iina.gastrostomy != null) cb_gastrostomy_true.Checked = iina.gastrostomy;
            cb_size_true.Disabled = true;
            if (iina.size != null) cb_size_true.Checked = iina.size;
            lbl_size_note.Text = WebHelpers.GetValue(iina.size_note);
            lbl_food_dislike.Text = WebHelpers.GetValue(iina.food_dislike);
            lbl_last_date_changed.Text = WebHelpers.FormatDateTime(iina.last_date_changed);

            lbl_bowel_elimination_desc.Text = WebHelpers.GetValue(iina.bowel_elimination_desc);
            lbl_stool_consistency_desc.Text = WebHelpers.GetValue(iina.stool_consistency_desc);
            lbl_gas_presence_desc.Text = WebHelpers.GetValue(iina.gas_presence_desc);
            //6
            lbl_bmi_out_range.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.bmi_out_range));
            lbl_loss_weight.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.loss_weight));
            lbl_reduce_dietary.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.reduce_dietary));
            lbl_severely_ill.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.severely_ill));
            //table 2
            if(iina.bmi_out_range || iina.loss_weight || iina.reduce_dietary || iina.severely_ill)
            {
                //Nutrition status
                //
                if (iina.nutrition_normal != null) cb_nutrition_normal_true.Checked = iina.nutrition_normal;
                lbl_nutrition_score1.Text = DisplayCheckBox(iina.nutrition_score1);
                lbl_nutrition_score2.Text = DisplayCheckBox(iina.nutrition_score2);
                lbl_nutrition_score3.Text = DisplayCheckBox(iina.nutrition_score3);
                nutrition_score.Text = iina.nutrition_score.ToString();
                //
                //Severity of disease
                //if (iina.nutrition_normal != null) cb_nutrition_normal_true.Checked = iina.nutrition_normal;
                lbl_severity_score1.Text = DisplayCheckBox(iina.severity_score1);
                lbl_severity_score2.Text = DisplayCheckBox(iina.severity_score2);
                lbl_severity_score3.Text = DisplayCheckBox(iina.severity_score3);
                severity_score.Text = iina.severity_score.ToString();
                //
                //Age
                //
                if (iina.younger_70 != null) cb_younger_70_true.Checked = iina.younger_70;
                if (iina.older_70 != null) cb_older_70_true.Checked = iina.older_70;
                age_score.Text = iina.age_score.ToString();
                //
                //Total score
                //
                total_score.Text = iina.total_score;
            }
            //
            //7
            lbl_urination.Text = DisplayCheckBox(iina.urination);
            
            //
            lbl_menstruation_code.Text = $"{WebHelpers.GetValue(iina.menstruation_desc)} {WebHelpers.GetValue(iina.cycle_day)} Ngày đầu của kỳ kinh cuối/ Last menstrual period started {WebHelpers.GetValue(iina.last_mens_period)}";

            lbl_not_pregnancy.Text = $"{WebHelpers.GetValue(WebHelpers.GetBool(iina.not_pregnancy))} Đã từng mang thai trước đây/ Previous pregnancy: {WebHelpers.GetValue(WebHelpers.GetBool(iina.pre_pregnancy))} PARA {WebHelpers.GetValue(iina.para)} Hiện đang mang thai/ Current pregnancy: {WebHelpers.GetValue(WebHelpers.GetBool(iina.cur_pregnancy))} {WebHelpers.GetValue(iina.pregnancy_week)} tuần/ week";

            lbl_contraception_code.Text = $"{WebHelpers.GetValue(iina.contraception_desc)} {WebHelpers.GetValue(iina.contraception_other)}";

            //8
            lbl_mus_history.Text = DisplayCheckBox(iina.mus_history);
            lbl_paralysis.Text = "Liệt/ (1/2 người/2 chi/4 chi)/ Paralysis (Hemi/Para/Tetra): " + WebHelpers.GetValue(WebHelpers.GetBool(iina.paralysis)) + WebHelpers.GetValue(iina.paralysis_note);
            lbl_amputation.Text = $"Đoạn chi/ Amputation: {WebHelpers.GetValue(WebHelpers.GetBool(iina.amputation))} {WebHelpers.GetValue(iina.ambulation_note)}";
            lbl_contracture.Text = $"Cơ bắp co rút/ Contracture: {WebHelpers.GetValue(WebHelpers.GetBool(iina.contracture))} {WebHelpers.GetValue(iina.contracture_note)}";
            lbl_prosthesis.Text = $"Lắp bộ phận giả/ Prosthesis: {WebHelpers.GetValue(WebHelpers.GetBool(iina.prosthesis))} {WebHelpers.GetValue(iina.prosthesis_note)}";
            //9
            lbl_cur_in_pain.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.cur_in_pain));
            lbl_p_location_1.Text = WebHelpers.GetValue(iina.p_location_1);
            lbl_p_location_2.Text = WebHelpers.GetValue(iina.p_location_2);
            lbl_p_location_3.Text = WebHelpers.GetValue(iina.p_location_3);

            lbl_q_location_1.Text = WebHelpers.GetValue(iina.q_location_1);
            lbl_q_location_2.Text = WebHelpers.GetValue(iina.q_location_2);
            lbl_q_location_3.Text = WebHelpers.GetValue(iina.q_location_3);

            lbl_r_location_1.Text = WebHelpers.GetValue(iina.r_location_1);
            lbl_r_location_2.Text = WebHelpers.GetValue(iina.r_location_2);
            lbl_r_location_3.Text = WebHelpers.GetValue(iina.r_location_3);

            lbl_s_location_1.Text = WebHelpers.GetValue(iina.s_location_1);
            lbl_s_location_2.Text = WebHelpers.GetValue(iina.s_location_2);
            lbl_s_location_3.Text = WebHelpers.GetValue(iina.s_location_3);

            lbl_t_location_1.Text = WebHelpers.GetValue(iina.t_location_1);
            lbl_t_location_2.Text = WebHelpers.GetValue(iina.t_location_2);
            lbl_t_location_3.Text = WebHelpers.GetValue(iina.t_location_3);

            lbl_using_pain_killer.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.using_pain_killer));
            lbl_pain_killer_name.Text = WebHelpers.GetValue(iina.pain_killer_name);
            lbl_pa_comment.Text = WebHelpers.GetValue(iina.pa_comment);

            //10

            lbl_condition.Text = DisplayCheckBox(iina.condition);
            
            lbl_wounds.Text = DisplayCheckBox(iina.wounds);

            _BindGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(iina.skin_anno));
            WebHelpers.DisabledGridView(grid_skin_anno, true);
            grid_skin_anno.Columns[grid_skin_anno.Columns.Count - 1].Visible = false;


            lbl_sensory_code.Text = WebHelpers.GetValue(iina.sensory_desc);
            lbl_moisture_code.Text = WebHelpers.GetValue(iina.moisture_desc);
            lbl_activity_code.Text = WebHelpers.GetValue(iina.activity_desc);
            lbl_mobility_code.Text = WebHelpers.GetValue(iina.mobility_desc);
            lbl_nutrition_code.Text = WebHelpers.GetValue(iina.nutrition_desc);
            lbl_friction_code.Text = WebHelpers.GetValue(iina.friction_desc);

            total_score.Text = iina.total_score;
            pres_sore_risk_desc.Text = WebHelpers.GetValue(iina.pres_sore_risk_desc);
            lbl_preven_action.Text = WebHelpers.GetValue(iina.preven_action);

            //11 - Checked
            lbl_bathing_desc.Text = WebHelpers.GetValue(iina.bathing_desc);
            lbl_oral_care_desc.Text = WebHelpers.GetValue(iina.oral_care_desc);
            lbl_dentures_desc.Text = WebHelpers.GetValue(iina.dentures_desc);
            lbl_toilet_use_desc.Text = WebHelpers.GetValue(iina.toilet_use_desc);
            lbl_dressing_desc.Text = WebHelpers.GetValue(iina.dressing_desc);
            lbl_eating_desc.Text = WebHelpers.GetValue(iina.eating_desc);
            lbl_turning_bed_desc.Text = WebHelpers.GetValue(iina.turning_bed_desc);
            lbl_ambulation_desc.Text = WebHelpers.GetValue(iina.ambulation_desc);
            lbl_sleep_desc.Text = WebHelpers.GetValue(iina.sleep_desc);
            lbl_medication_used.Text = WebHelpers.GetValue(iina.medication_used);
            //12 - Checked
            lbl_fall_history_desc.Text = WebHelpers.GetValue(iina.fall_history_desc);
            lbl_secon_diagnosis_desc.Text = WebHelpers.GetValue(iina.secon_diagnosis_desc);
            lbl_ambula_aids_desc.Text = WebHelpers.GetValue(iina.ambula_aids_desc);
            lbl_intra_therapy_desc.Text = WebHelpers.GetValue(iina.intra_therapy_desc);
            lbl_gait_trans_desc.Text = WebHelpers.GetValue(iina.gait_trans_desc);
            lbl_fr_mental_status_desc.Text = WebHelpers.GetValue(iina.fr_mental_status_desc);
            fr_total_score.Text = WebHelpers.GetValue(iina.fr_total_score);
            //D.
            lbl_involvement.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.involvement));
            lbl_req_med_equipment.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.req_med_equipment));
            lbl_req_foll_care.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.req_foll_care));
            lbl_suicidal_referral.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.suicidal_referral));
            lbl_ref_physiotherapist.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.ref_physiotherapist));
            lbl_ref_speech_therapist.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.ref_speech_therapist));
            lbl_ref_dietician.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.ref_dietician));
            lbl_ref_psychologist.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.ref_psychologist));
            lbl_ref_other_hospital.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.ref_other_hospital));
            lbl_support_at_home.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.support_at_home));
            lbl_req_transportation.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.req_transportation));
            lbl_stairs_climb_home.Text = WebHelpers.GetValue(WebHelpers.GetBool(iina.stairs_climb_home));
            //E
            lbl_dis_planning.Text = WebHelpers.GetValue(iina.dis_planning);
            //F
            lbl_dis_management.Text = WebHelpers.GetValue(iina.dis_management);
            lbl_assess_date_time.Text = WebHelpers.FormatDateTime(iina.assess_date_time, "dd-MM-yyyy HH:mm");

            LoadFormControl(true);

            if (iina.bmi_out_range || iina.loss_weight || iina.reduce_dietary || iina.severely_ill)
            {
                final_screening_field.Visible = true;
            }

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;
            btn_grid_skin_anno_add.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void loadFormPrint(Iina iina)
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
            amendReasonWraper.Visible = true;
            txt_amend_reason.Text = "";
            iina = new Iina(Request["docid"]);
            LoadFormEdit(iina);

            btnComplete.Visible = true;
            btnCancel.Visible = true;

            btnPrint.Visible = false;
            btnAmend.Visible = false;
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                iina = new Iina(DataHelpers.varDocId);
                iina.status = DocumentStatus.FINAL;

                iina.user_name = (string)Session["UserID"];
                iina.amend_reason = txt_amend_reason.Text;
                UpdateData(iina);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                iina = new Iina(DataHelpers.varDocId);

                iina.user_name = (string)Session["UserID"];
                iina.status = DocumentStatus.DRAFT;

                UpdateData(iina);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            iina = new Iina(Request["docid"]);
            loadFormPrint(iina);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Iina.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

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
                severity_score.Text = score.ToString();
                update_total_nutri_score();
            }
            catch (Exception ex)
            {

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
                nutrition_score.Text = score.ToString();
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
        private void BindSelect(HtmlSelect _select, Dictionary<string, string> _dictionary)
        {
            _select.Items.Clear();
            foreach (KeyValuePair<string, string> code in _dictionary)
            {
                try
                {
                    ListItem item = new ListItem();
                    item.Value = code.Key.ToString();
                    item.Text = code.Value;

                    _select.Items.Add(item);
                }
                catch (Exception ex) { }
            }
        }
        private string DisplayCheckBox(dynamic source, string gap = "<br>")
        {
            DataTable dt = WebHelpers.GetJSONToDataTable(source);
            string result = "";
            foreach (DataRow dr in dt.Rows)
            {
                result += $"{dr["desc"]}{gap}";
            }
            return result;
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
            total_nutri_score.Text = (int.Parse(nutrition_score.Text) + int.Parse(severity_score.Text) + int.Parse(age_score.Text)).ToString();
        }
        private dynamic GetCheckBox(string id, bool required = false)
        {
            bool flag = false;
            if ((HtmlInputCheckBox)FindControl(id + "true") != null)
            {
                if (((HtmlInputCheckBox)FindControl(id + "true")).Checked)
                {
                    flag = true;
                }
            }
            else if ((HtmlInputCheckBox)FindControl(id + "false") != null)
            {
                if (((HtmlInputCheckBox)FindControl(id + "false")).Checked)
                {
                    flag = false;
                }
            }
            else
            {
                if (required) { return false; }
                return null;
            }

            return flag;
        }
        private void UpdateLastRow(GridView gridView, Dictionary<string, string> cols)
        {
            DataTable table = (DataTable)ViewState[gridView.ID];

            if (table.Rows.Count <= 0)
            {
                foreach (KeyValuePair<string, string> col in cols)
                {
                    table.Columns.Add(col.Key);
                }
            }

            for (int i = 0; i < gridView.Rows[gridView.Rows.Count - 1].Cells.Count; i++)
            {
                try
                {
                    if (gridView.Rows[gridView.Rows.Count - 1].Cells[i].Controls[1] is TextField)
                    {
                        TextField text2 = gridView.Rows[gridView.Rows.Count - 1].Cells[i].Controls[1] as TextField;

                        table.Rows[gridView.Rows.Count - 1][text2.DataKey] = text2.Value;
                    }
                }
                catch (Exception ex) { }
            }

            ViewState[gridView.ID] = table;
        }
        private void UpdateData(Iina iina)
        {
            try
            {
                iina.residence_code = GetRadioButton("rad_residence_code_", Iina.RESIDENCE_CODE);
                if (iina.residence_code != null) iina.residence_desc = Iina.RESIDENCE_CODE[iina.residence_code];
                iina.residence_other = txt_residence_other.Value;
                //
                iina.language_code = GetRadioButton("rad_language_code_", Iina.LANGUAGE_CODE);
                if (iina.language_code != null) iina.language_desc = Iina.LANGUAGE_CODE[iina.language_code];
                iina.language_other = txt_language_other.Value;
                //
                iina.req_interpreter = GetRadioButton("rad_req_interpreter_");
                //
                iina.religion_code = GetRadioButton("rad_religion_code_", Iina.RELIGION_CODE);
                if (iina.religion_code != null) iina.religion_desc = Iina.RELIGION_CODE[iina.religion_code];
                //iina.religion_other =
                //
                iina.spiritual_couns = GetRadioButton("rad_spiritual_couns_");
                //
                iina.occupation = txt_occupation.Value;
                //
                iina.living_status_code = GetRadioButton("rad_living_status_code_", Iina.LIVING_STATUS_CODE);
                if (iina.living_status_code != null) iina.living_status_desc = Iina.LIVING_STATUS_CODE[iina.living_status_code];
                iina.living_status_note = txt_living_status_note.Value;
                //
                iina.hospital_concern_code = GetRadioButton("rad_hospital_concern_code_", Iina.HOSPITAL_CONCERN_CODE);
                if (iina.hospital_concern_code != null) iina.hospital_concern_desc = Iina.HOSPITAL_CONCERN_CODE[iina.hospital_concern_code];
                iina.hospital_concern_other = txt_hospital_concern_other.Value;
                //
                iina.accompanied = txt_accompanied.Value;
                //
                iina.relationship = txt_relationship.Value;
                //checked
                //B. BỆNH SỬ/ MEDICAL HISTORY
                iina.admit_from_code = GetRadioButton("rad_admit_from_code_", Iina.ADMIT_FROM_CODE);
                if (iina.admit_from_code != null) iina.admit_from_desc = Iina.ADMIT_FROM_CODE[iina.admit_from_code];
                if(iina.admit_from_code == "OTH") iina.admit_from_other = txt_admit_from_other.Value;

                iina.arrived = GetCheckBox("cb_arrived_code_", Iina.ARRIVED);
                //
                iina.admission_reason = txt_admission_reason.Value;
                //
                //iina.previous_admission = txt_previous_admission.Value;
                //
                iina.past_med_history = GetRadioButton("rad_past_med_history_");
                iina.past_med_history_note = txt_past_med_history_note.Value;
                //
                iina.past_sur_history = GetRadioButton("rad_past_sur_history_");
                iina.past_sur_history_note = txt_past_sur_history_note.Value;
                //
                iina.substance_abuse = GetCheckBox("cb_substance_abuse_", Iina.SUBSTANCE_ABUSE);
                iina.substance_abuse_other = txt_substance_abuse_other.Value;
                //
                iina.previous_document = GetRadioButton("rad_previous_document_");
                iina.previous_document_note = txt_previous_document_note.Value;
                //
                iina.cur_home_medication = GetRadioButton("rad_cur_home_medication_");
                //
                iina.allergy = GetRadioButton("rad_allergy_");
                iina.allergy_note = txt_allergy_note.Value;
                //
                iina.high_risk_patient = GetCheckBox("cb_high_risk_patient_", Iina.HIGH_RISK_PATIENT_CODE);
                //C
                //1
                iina.vs_temperature = txt_vs_temperature.Value;
                iina.vs_heart_rate = txt_vs_heart_rate.Value;
                iina.vs_weight = txt_vs_weight.Value;
                iina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                iina.vs_height = txt_vs_height.Value;
                iina.vs_blood_pressure = txt_vs_blood_pressure.Value;
                iina.vs_BMI = txt_vs_BMI.Value;
                iina.vs_spO2 = txt_vs_spO2.Value;
                iina.vs_pulse = txt_vs_pulse.Value;
                //2
                iina.respiratory_system = GetCheckBox("cb_respiratory_system_", Iina.RESPIRATORY_SYSTEM_CODE);
                iina.cough = GetRadioButton("rad_cough_");
                iina.pro_cough = GetRadioButton("rad_pro_cough_");
                iina.pro_cough_note = txt_pro_cough_note.Value;
                //3
                iina.pulse_code = GetRadioButton("rad_pulse_code_", Iina.PULSE_CODE);
                if (iina.pulse_code != null) { iina.pulse_desc = Iina.PULSE_CODE[iina.pulse_code]; }
                iina.presence = GetCheckBox("cb_presence_", Iina.PRESENCE_CODE);
                iina.extremities = GetCheckBox("cb_extremities_", Iina.EXTREMITIES_CODE);
                //4 - passed
                iina.oriented = GetCheckBox("cb_oriented_", Iina.ORIENTED_CODE);
                iina.mental_status = GetCheckBox("cb_mental_status_", Iina.MENTAL_STATUS_CODE);
                iina.mental_status_other = txt_mental_status_other.Value;

                iina.hearing_code = GetRadioButton("rad_hearing_code_", Iina.HEARING_CODE);
                if (iina.hearing_code != null) iina.hearing_desc = Iina.HEARING_CODE[iina.hearing_code];

                iina.vision_code = GetRadioButton("rad_vision_code_", Iina.VISION_CODE);
                if (iina.vision_code != null) iina.vision_desc = Iina.VISION_CODE[iina.vision_code];

                iina.speech_code = GetRadioButton("rad_speech_code_", Iina.SPEECH_CODE);
                if (iina.speech_code != null) iina.speech_desc = Iina.SPEECH_CODE[iina.speech_code];
                //5 - passed
                iina.diet_code = GetRadioButton("rad_diet_code_", Iina.DIET_CODE);
                if (iina.diet_code != null) iina.diet_desc = Iina.DIET_CODE[iina.diet_code];
                iina.diet_other = txt_diet_other.Value;
                iina.diet_pre_code = GetRadioButton("rad_diet_pre_code_", Iina.DIET_PRE_CODE);
                if (iina.diet_pre_code != null) iina.diet_pre_desc = Iina.DIET_PRE_CODE[iina.diet_pre_code];

                iina.ng_tube = GetRadioButton("rad_ng_tube_");
                iina.gastrostomy = GetCheckBox("cb_gastrostomy_", true);
                iina.size = GetCheckBox("cb_size_");
                iina.size_note = txt_size_note.Value;
                iina.last_date_changed = DataHelpers.ConvertSQLDateTime(dpk_last_date_changed.SelectedDate);
                iina.food_dislike = txt_food_dislike.Value;

                iina.bowel_elimination_code = GetRadioButton("rad_bowel_elimination_code_", Iina.BOWEL_ELIMINATION_CODE);
                if (iina.bowel_elimination_code != null) iina.bowel_elimination_desc = Iina.BOWEL_ELIMINATION_CODE[iina.bowel_elimination_code];

                iina.stool_consistency_code = GetRadioButton("rad_stool_consistency_code_", Iina.STOOL_CONSISTENCY_CODE);
                if (iina.stool_consistency_code != null) iina.stool_consistency_desc = Iina.STOOL_CONSISTENCY_CODE[iina.stool_consistency_code];

                iina.gas_presence_code = GetRadioButton("rad_gas_presence_code_", Iina.GAS_PRESENCE_CODE);
                if (iina.gas_presence_code != null) iina.gas_presence_desc = Iina.GAS_PRESENCE_CODE[iina.gas_presence_code];
                //6
                iina.bmi_out_range = GetRadioButton("rad_bmi_out_range_");
                iina.loss_weight = GetRadioButton("rad_loss_weight_");
                iina.reduce_dietary = GetRadioButton("rad_reduce_dietary_");
                iina.severely_ill = GetRadioButton("rad_severely_ill_");
                //table 2
                iina.nutrition_normal = GetCheckBox("cb_nutrition_normal_", true);
                iina.nutrition_score1 = GetCheckBox("cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);
                iina.nutrition_score1 = GetCheckBox("cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);
                iina.nutrition_score2 = GetCheckBox("cb_nutrition_score2_", Iina.NUTRITION_SCORE2_CODE);
                iina.nutrition_score3 = GetCheckBox("cb_nutrition_score3_", Iina.NUTRITION_SCORE3_CODE);
                iina.nutrition_score = nutrition_score.Text;
                //
                // mising Điểm = 0 / Score = 0
                iina.severity_score1 = GetCheckBox("cb_severity_score1_", Iina.SEVERITY_SCORE1_CODE);
                iina.severity_score2 = GetCheckBox("cb_severity_score2_", Iina.SEVERITY_SCORE2_CODE);
                iina.severity_score3 = GetCheckBox("cb_severity_score3_", Iina.SEVERITY_SCORE3_CODE);
                iina.severity_score = severity_score.Text;
                //Age
                iina.younger_70 = GetCheckBox("cb_younger_70_", true);
                iina.older_70 = GetCheckBox("cb_older_70_", true);
                iina.age_score = age_score.Text;
                iina.total_nutri_score = total_nutri_score.Text;

                //7
                iina.urination = GetCheckBox("cb_urination_", Iina.URINATION_CODE);
                iina.inter_catheter = GetCheckBox("cb_inter_catheter_", true);
                iina.inter_catheter_note = txt_inter_catheter_note.Value;

                iina.ind_catheter = GetCheckBox("cb_ind_catheter_", true);
                iina.ind_catheter_size = txt_ind_catheter_size.Value;
                iina.ind_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_ind_catheter_date.SelectedDate);

                iina.sup_catheter = GetCheckBox("cb_sup_catheter_");
                iina.sup_catheter_size = txt_sup_catheter_size.Value;
                iina.last_sup_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_last_sup_catheter_date.SelectedDate);

                iina.menstruation_code = GetRadioButton("rad_menstruation_code_", Iina.MENSTRUATION_CODE);
                if (iina.menstruation_code != null) { iina.menstruation_code = Iina.MENSTRUATION_CODE[iina.menstruation_code]; }
                iina.cycle_day = txt_cycle_day.Value;
                iina.last_mens_period = txt_last_mens_period.Value;

                iina.not_pregnancy = GetCheckBox("cb_not_pregnancy_", true);
                iina.pre_pregnancy = GetCheckBox("cb_pre_pregnancy_", true);
                iina.para = txt_para.Value;
                iina.cur_pregnancy = GetCheckBox("cb_cur_pregnancy_", true);
                iina.pregnancy_week = txt_pregnancy_week.Value;

                iina.contraception_code = GetRadioButton("cb_contraception_code_", Iina.CONTRACEPTION_CODE);
                iina.contraception_other = txt_contraception_other.Value;

                //8 - Passed
                iina.mus_history = GetCheckBox("cb_mus_history_", Iina.MUS_HISTORY);

                iina.paralysis = GetCheckBox("cb_paralysis_", true);
                iina.paralysis_note = txt_paralysis_note.Value;

                iina.amputation = GetCheckBox("cb_amputation_", true);
                iina.amputation_note = txt_amputation_note.Value;

                iina.contracture = GetCheckBox("cb_contracture_", true);
                iina.contracture_note = txt_contracture_note.Value;

                iina.prosthesis = GetCheckBox("cb_prosthesis_", true);
                iina.prosthesis_note = txt_prosthesis_note.Value;

                //9 - Passed
                iina.cur_in_pain = GetRadioButton("rad_cur_in_pain_");
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

                iina.using_pain_killer = GetRadioButton("rad_using_pain_killer_");
                iina.pain_killer_name = txt_pain_killer_name.Value;
                iina.pa_comment = txt_pa_comment.Value;
                //10 - Passed
                iina.condition = GetCheckBox("cb_condition_", Iina.CONDITION_CODE);

                iina.wounds = GetCheckBox("cb_wounds_", Iina.WOUNDS_CODE);

                iina.skin_anno = WebHelpers.GetDataGridView(grid_skin_anno, Iina.SKIN_ANNO);

                iina.sensory_code = Request.Form.Get("select_sensory_code");
                if (!string.IsNullOrEmpty(iina.sensory_code)) iina.sensory_desc = Iina.SENSORY_CODE[iina.sensory_code];

                iina.moisture_code = Request.Form.Get("select_moisture_code");
                if (!string.IsNullOrEmpty(iina.moisture_code)) iina.moisture_desc = Iina.MOISTURE_CODE[iina.moisture_code];

                iina.activity_code = Request.Form.Get("select_activity_code");
                if (!string.IsNullOrEmpty(iina.activity_code)) iina.activity_desc = Iina.ACTIVITY_CODE[iina.activity_code];

                iina.mobility_code = Request.Form.Get("select_mobility_code");
                if (!string.IsNullOrEmpty(iina.mobility_code)) iina.mobility_desc = Iina.MOBILITY_CODE[iina.mobility_code];

                iina.nutrition_code = Request.Form.Get("select_nutrition_code");
                if (!string.IsNullOrEmpty(iina.nutrition_code)) iina.nutrition_desc = Iina.NUTRITION_CODE[iina.nutrition_code];

                iina.friction_code = Request.Form.Get("select_friction_code");
                if (!string.IsNullOrEmpty(iina.friction_code)) iina.friction_desc = Iina.FRICTION_CODE[iina.friction_code];

                iina.total_score = GetTotalScore().ToString();

                //
                iina.pres_sore_risk_code = GetPresSoreRiskCode(int.Parse(iina.total_score));
                if (iina.pres_sore_risk_code != null) { iina.pres_sore_risk_desc = Iina.PRES_SORE_RISK_CODE[iina.pres_sore_risk_code]; }

                iina.preven_action = txt_preven_action.Value;
                //11 - Passed
                iina.bathing_code = GetRadioButton("rad_bathing_code_", Iina.BATHING_CODE);
                if (iina.bathing_code != null) iina.bathing_desc = Iina.BATHING_CODE[iina.bathing_code];

                iina.oral_care_code = GetRadioButton("rad_oral_care_code_", Iina.ORAL_CARE_CODE);
                if (iina.oral_care_code != null) iina.oral_care_desc = Iina.ORAL_CARE_CODE[iina.oral_care_code];

                iina.dentures_code = GetRadioButton("rad_dentures_code_", Iina.DENTURES_CODE);
                if (iina.dentures_code != null) iina.dentures_desc = Iina.DENTURES_CODE[iina.dentures_code];

                iina.toilet_use_code = GetRadioButton("rad_toilet_use_code_", Iina.TOILET_USE_CODE);
                if (iina.toilet_use_code != null) iina.toilet_use_desc = Iina.TOILET_USE_CODE[iina.toilet_use_code];

                iina.dressing_code = GetRadioButton("rad_dressing_code_", Iina.DRESSING_CODE);
                if (iina.dressing_code != null) iina.dressing_desc = Iina.DRESSING_CODE[iina.dressing_code];

                iina.eating_code = GetRadioButton("rad_eating_code_", Iina.EATING_CODE);
                if (iina.eating_code != null) iina.eating_desc = Iina.EATING_CODE[iina.eating_code];

                iina.turning_bed_code = GetRadioButton("rad_turning_bed_code_", Iina.TURNING_BED_CODE);
                if (iina.turning_bed_code != null) iina.turning_bed_desc = Iina.TURNING_BED_CODE[iina.turning_bed_code];

                iina.ambulation_code = GetRadioButton("rad_ambulation_code_", Iina.AMBULATION_CODE);
                if (iina.ambulation_code != null) iina.ambulation_desc = Iina.AMBULATION_CODE[iina.ambulation_code];

                iina.sleep_code = GetRadioButton("rad_sleep_code_", Iina.SLEEP_CODE);
                if (iina.sleep_code != null) iina.sleep_desc = Iina.SLEEP_CODE[iina.sleep_code];

                iina.medication_used = txt_medication_used.Value;
                //12
                iina.fall_history_code = GetRadioButton("rad_fall_history_code_", Iina.FALL_HISTORY_CODE);
                if (iina.fall_history_code != null) iina.fall_history_desc = Iina.FALL_HISTORY_CODE[iina.fall_history_code];

                iina.secon_diagnosis_code = GetRadioButton("rad_secon_diagnosis_code_", Iina.SECON_DIAGNOSIS_CODE);
                if (iina.secon_diagnosis_code != null) iina.secon_diagnosis_desc = Iina.SECON_DIAGNOSIS_CODE[iina.secon_diagnosis_code];

                iina.ambula_aids_code = GetRadioButton("rad_ambula_aids_code_", Iina.AMBULA_AIDS_CODE);
                if (iina.ambula_aids_code != null) iina.ambula_aids_desc = Iina.AMBULA_AIDS_CODE[iina.ambula_aids_code];

                iina.intra_therapy_code = GetRadioButton("rad_intra_therapy_code_", Iina.INTRA_THERAPY_CODE);
                if (iina.intra_therapy_code != null) iina.intra_therapy_desc = Iina.INTRA_THERAPY_CODE[iina.intra_therapy_code];

                iina.gait_trans_code = GetRadioButton("rad_gait_trans_code_", Iina.GAIT_TRANS_CODE);
                if (iina.gait_trans_code != null) iina.gait_trans_desc = Iina.GAIT_TRANS_CODE[iina.gait_trans_code];

                iina.fr_mental_status_code = GetRadioButton("rad_fr_mental_status_code_", Iina.FR_MENTAL_STATUS_CODE);
                if (iina.fr_mental_status_code != null) iina.fr_mental_status_desc = Iina.FR_MENTAL_STATUS_CODE[iina.fr_mental_status_code];

                iina.fr_total_score = fr_total_score.Text;
                //D
                iina.involvement = GetRadioButton("rad_involvement_");
                iina.req_med_equipment = GetRadioButton("rad_req_med_equipment_");
                iina.req_foll_care = GetRadioButton("rad_req_foll_care_");
                iina.suicidal_referral = GetRadioButton("rad_suicidal_referral_");
                iina.alone_reduce_functional = GetRadioButton("rad_alone_reduce_functional_");
                iina.ref_physiotherapist = GetRadioButton("rad_ref_physiotherapist_");
                iina.ref_speech_therapist = GetRadioButton("rad_ref_speech_therapist_");
                iina.ref_dietician = GetRadioButton("rad_ref_dietician_");
                iina.ref_psychologist = GetRadioButton("rad_ref_psychologist_");
                iina.ref_other_hospital = GetRadioButton("rad_ref_other_hospital_");
                iina.support_at_home = GetRadioButton("rad_support_at_home_");
                iina.req_transportation = GetRadioButton("rad_req_transportation_");
                iina.stairs_climb_home = GetRadioButton("rad_stairs_climb_home_");
                iina.dis_planning = txt_dis_planning.Value;
                iina.dis_management = txt_dis_management.Value;
                iina.assess_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assess_date_time.SelectedDate);

                dynamic result = iina.Update()[0];

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
            foreach (var prop in iina.GetType().GetProperties())
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
        private void DeleteGridViewRow(GridView gridView, int rowIndex)
        {
            UpdateLastRow(grid_skin_anno, Iina.SKIN_ANNO);

            DataTable dt = ViewState[gridView.ID] as DataTable;
            dt.Rows[rowIndex].Delete();

            _BindGridView(gridView, dt);
        }
        private dynamic GetCheckBox(string checkbox, Dictionary<string, string> value)
        {
            DataTable table = new DataTable();
            table.Columns.Add("code");
            table.Columns.Add("desc");

            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    if (((HtmlInputCheckBox)FindControl(checkbox + code.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();

                        dtRow = table.NewRow();
                        dtRow["code"] = code.Key;
                        dtRow["desc"] = code.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex) { }
            }
            if(table.Rows.Count > 0) return JsonConvert.SerializeObject(table);
            return null;
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
        
        #endregion
        private void _BindGridView(GridView gridView, DataTable dataSource)
        {
            try
            {
                if(dataSource != null)
                {
                    ViewState[gridView.ID] = dataSource;
                    gridView.DataSource = (DataTable)ViewState[gridView.ID];
                    gridView.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void BindSelectOption(HtmlSelect htmlSelect, string value)
        {
            var item = htmlSelect.Items.FindByValue(value);
            if (item != null)
            {
                item.Selected = true;
            }
        }

        public void BindCheckBox(string cb_name, string value, string key = "code")
        {
            if(value != null && cb_name != null)
            {
                foreach (DataRow row in WebHelpers.GetJSONToDataTable(value).Rows)
                {
                    try
                    {
                        ((HtmlInputCheckBox)FindControl(cb_name + row.Field<dynamic>(key).ToLower())).Checked = true;
                    }
                    catch(Exception ex)
                    {
                    }
                }
            }
        }

        public void BindCheckBox(string value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputCheckBox)FindControl(value)).Checked = true;
            }
        }

        protected void btn_grid_skin_anno_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[grid_skin_anno.ID];
                //new object
                if (table == null)
                {
                    table = new DataTable();
                }
                //create header
                for(int i = 0; i < Iina.SKIN_ANNO.Count; i++)
                {
                    var col = Iina.SKIN_ANNO.ElementAt(i);
                    if(!table.Columns.Contains(col.Key))
                    {
                        table.Columns.Add(col.Key);
                    }
                }
                //get current data
                for (int r = 0; r < grid_skin_anno.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_skin_anno.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (grid_skin_anno.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_skin_anno.Rows[r].Cells[i].Controls[1] as TextField;
                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                        }
                        catch { }
                    }
                }
                //add new row
                DataRow dtRow = table.NewRow();

                dtRow = table.NewRow();
                table.Rows.Add(dtRow);

                _BindGridView(grid_skin_anno, table);
            }
            catch (Exception ex)
            {

            }
        }

        protected void grid_skin_anno_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }

        


    }
}
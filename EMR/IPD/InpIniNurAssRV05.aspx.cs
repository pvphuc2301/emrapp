using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Model;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Data;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class InpIniNurAssRV05 : EmrPage, IEmrFormModel<IinaRV05>
    {
        public override string form_url { get; set; } = "IPD/InpIniNurAssRV05";
        public IinaRV05 Model { get; set; }
        public override dynamic InitModel()
        {
            return Model = new IinaRV05(varDocID, Location, varDocIdLog);
        }
        public override void BindingDataFormEdit()
        {
            try
            {
                txt_amend_reason.Text = "";

                pain_annotation_base64.Value = JsonConvert.DeserializeObject(Model.pain_annotation).dataURI;
                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(Model.skin_anno_data).dataURI;

                //residence
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_residence_code_" + Model.residence_code);
                txt_residence_other.Value = Model.residence_other;
                //language
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_language_code_" + Model.language_code);
                txt_language_other.Value = Model.language_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_interpreter_" + Model.req_interpreter);
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_religion_code_" + Model.religion_code);
                txt_religion_other.Value = Model.religion_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spiritual_couns_" + Model.spiritual_couns);
                txt_occupation.Value = Model.occupation;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_living_status_code_" + Model.living_status_code);
                txt_living_status_note.Value = Model.living_status_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hospital_concern_code_" + Model.hospital_concern_code);
                txt_hospital_concern_other.Value = Model.hospital_concern_other;
                //
                txt_accompanied.Value = Model.accompanied;
                //
                txt_relationship.Value = Model.relationship;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_admit_from_code_" + Model.admit_from_code);
                txt_admit_from_other.Value = Model.admit_from_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_arrived_code_", WebHelpers.GetJSONToDataTable(Model.arrived));
                //
                txt_admission_reason.Value = Model.admission_reason;
                //
                lbl_previous_admission.Text = Model.previous_admission;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_past_med_history_" + Model.past_med_history);
                txt_past_med_history_note.Value = Model.past_med_history_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_past_sur_history_" + Model.past_sur_history);
                txt_past_sur_history_note.Value = Model.past_sur_history_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_substance_abuse_", WebHelpers.GetJSONToDataTable(Model.substance_abuse));
                txt_substance_abuse_other.Value = Model.substance_abuse_other;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_previous_document_" + Model.previous_document);
                txt_previous_document_note.Value = Model.previous_document_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cur_home_medication_" + Model.cur_home_medication);
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + Model.allergy);
                txt_allergy_note.Value = Model.allergy_note;
                
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_high_risk_patient_", WebHelpers.GetJSONToDataTable(Model.high_risk_patient));
                //
                txt_vs_temperature.Value = Model.vs_temperature;
                txt_vs_heart_rate.Value = Model.vs_heart_rate;
                txt_vs_weight.Value = Model.vs_weight;
                txt_vs_respiratory_rate.Value = Model.vs_respiratory_rate;
                txt_vs_height.Value = Model.vs_height;
                txt_vs_blood_pressure.Value = Model.vs_blood_pressure;
                txt_vs_bmi.Value = Model.vs_BMI;
                txt_vs_spO2.Value = Model.vs_spO2;
                //txt_vs_pulse.Value = Model.vs_pulse;

                //2.
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_respiratory_system_", WebHelpers.GetJSONToDataTable(Model.respiratory_system));
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cough_" + Model.cough);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_pro_cough_" + Model.pro_cough);
                txt_pro_cough_note.Value = Model.pro_cough_note;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_pulse_code_" + Model.pulse_code);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_presence_", WebHelpers.GetJSONToDataTable(Model.presence));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_extremities_", WebHelpers.GetJSONToDataTable(Model.extremities));
                //4.
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_oriented_", WebHelpers.GetJSONToDataTable(Model.oriented));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_mental_status_", WebHelpers.GetJSONToDataTable(Model.mental_status));
                txt_mental_status_other.Value = Model.mental_status_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hearing_code_" + Model.hearing_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_vision_code_" + Model.vision_code);
                txt_vision_other.Value = Model.vision_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_speech_code_" + Model.speech_code);
                //5.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_diet_code_" + Model.diet_code);
                txt_diet_other.Value = Model.diet_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_diet_pre_code_" + Model.diet_pre_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ng_tube_" + Model.ng_tube);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_gastrostomy_" + Model.gastrostomy);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_size_" + Model.size);
                cb_size_true.Disabled = cb_gastrostomy_true.Disabled = false;
                txt_size_note.Value = Model.size_note;
                WebHelpers.BindDateTimePicker(dpk_last_date_changed, Model.last_date_changed);
                txt_food_dislike.Value = Model.food_dislike;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bowel_elimination_code_" + Model.bowel_elimination_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_stool_consistency_code_" + Model.stool_consistency_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gas_presence_code_" + Model.gas_presence_code);
                //6.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bmi_out_range_" + Model.bmi_out_range);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_loss_weight_" + Model.loss_weight);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_reduce_dietary_" + Model.loss_weight);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_severely_ill_" + Model.severely_ill);

                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_normal_" + Model.nutrition_normal);
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_" + Model.nutrition_score1);

                if (Model.nutrition_normal != null)
                {
                    cb_nutrition_normal_true.Checked = Model.nutrition_normal;
                }
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_", WebHelpers.GetJSONToDataTable(Model.nutrition_score1));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score2_", WebHelpers.GetJSONToDataTable(Model.nutrition_score2));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score3_", WebHelpers.GetJSONToDataTable(Model.nutrition_score3));
                nutrition_score.Text = Model.nutrition_score;

                if (Model.normal_nutrition_req != null)
                {
                    cb_normal_nutrition_req_true.Checked = (bool)Model.normal_nutrition_req;
                }
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score1_", WebHelpers.GetJSONToDataTable(Model.severity_score1));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score2_", WebHelpers.GetJSONToDataTable(Model.severity_score2));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score3_", WebHelpers.GetJSONToDataTable(Model.severity_score3));
                severity_score.Text = Convert.ToString(Model.severity_score);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_younger_70_" + Model.younger_70);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_older_70_" + Model.older_70);
                age_score.Text = Convert.ToString(Model.age_score);

                total_nutri_score.Text = Convert.ToString(Model.total_nutri_score);

                //7
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_urination_", WebHelpers.GetJSONToDataTable(Model.urination));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_inter_catheter_" + Model.inter_catheter);
                txt_inter_catheter_note.Value = Model.inter_catheter_note;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_ind_catheter_" + Model.ind_catheter);
                txt_ind_catheter_size.Value = Model.ind_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_ind_catheter_date, Model.ind_catheter_date);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_sup_catheter_" + Model.sup_catheter);
                txt_sup_catheter_size.Value = Model.sup_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_last_sup_catheter_date, Model.last_sup_catheter_date);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_menstruation_code_" + Model.menstruation_code);
                txt_cycle_day.Value = Convert.ToString(Model.cycle_day);

                txt_last_mens_period.Value = Model.last_mens_period;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_pregnancy_" + Model.not_pregnancy);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_pre_pregnancy_" + Model.pre_pregnancy);
                txt_para.Value = Model.para;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_cur_pregnancy_" + Model.cur_pregnancy);
                txt_pregnancy_week.Value = Model.pregnancy_week;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_contraception_code_" + Model.contraception_code);
                txt_contraception_other.Value = Model.contraception_other;

                //8
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_mus_history_", WebHelpers.GetJSONToDataTable(Model.mus_history));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_paralysis_" + Model.paralysis);
                txt_paralysis_note.Value = Model.paralysis_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_amputation_" + Model.amputation);
                txt_amputation_note.Value = Model.amputation_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_contracture_" + Model.contracture);
                txt_contracture_note.Value = Model.contracture_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_prosthesis_" + Model.prosthesis);
                txt_prosthesis_note.Value = Model.prosthesis_note;

                //9
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cur_in_pain_" + Model.cur_in_pain);
                txt_p_location_1.Value = Model.p_location_1;
                txt_p_location_2.Value = Model.p_location_2;
                txt_p_location_3.Value = Model.p_location_3;

                txt_q_location_1.Value = Model.q_location_1;
                txt_q_location_2.Value = Model.q_location_2;
                txt_q_location_3.Value = Model.q_location_3;

                txt_r_location_1.Value = Model.r_location_1;
                txt_r_location_2.Value = Model.r_location_2;
                txt_r_location_3.Value = Model.r_location_3;

                txt_s_location_1.Value = Model.s_location_1;
                txt_s_location_2.Value = Model.s_location_2;
                txt_s_location_3.Value = Model.s_location_3;

                txt_t_location_1.Value = Model.t_location_1;
                txt_t_location_2.Value = Model.t_location_2;
                txt_t_location_3.Value = Model.t_location_3;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_using_pain_killer_" + Model.using_pain_killer);

                WebHelpers.VisibleControl(true, pain_annotation_undo, pain_annotation_redo, pain_annotation_pencilWrapper);

                txt_pain_killer_name.Value = Model.pain_killer_name;
                txt_pa_comment.Value = Model.pa_comment;

                //10
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_condition_", WebHelpers.GetJSONToDataTable(Model.condition));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_wounds_", WebHelpers.GetJSONToDataTable(Model.wounds));

                ViewState[grid_skin_anno.ID] = WebHelpers.BindingDataGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(Model.skin_anno), IinaDictionary.SKIN_ANNO, btn_grid_skin_anno_add);

                WebHelpers.DataBind(form1, select_sensory_code, IinaDictionary.SENSORY_CODE, Model.sensory_code);
                WebHelpers.DataBind(form1, select_moisture_code, IinaDictionary.MOISTURE_CODE, Model.moisture_code);
                WebHelpers.DataBind(form1, select_activity_code, IinaDictionary.ACTIVITY_CODE, Model.activity_code);
                WebHelpers.DataBind(form1, select_mobility_code, IinaDictionary.MOBILITY_CODE, Model.mobility_code);
                WebHelpers.DataBind(form1, select_nutrition_code, IinaDictionary.NUTRITION_CODE, Model.nutrition_code);
                WebHelpers.DataBind(form1, select_friction_code, IinaDictionary.FRICTION_CODE, Model.friction_code);

                total_score.Text = Model.total_score;

                pres_sore_risk_desc.Text = Model.pres_sore_risk_desc;
                txt_preven_action.Value = Model.preven_action;

                //11

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bathing_code_" + Model.bathing_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_oral_care_code_" + Model.oral_care_code);
                txt_oral_care_note.Value = Model.oral_care_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_dentures_code_" + Model.dentures_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_toilet_use_code_" + Model.toilet_use_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_dressing_code_" + Model.dressing_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_eating_code_" + Model.eating_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_turning_bed_code_" + Model.turning_bed_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ambulation_code_" + Model.ambulation_code);
                if (rad_ambulation_code_na.Checked) { txt_ambulation_note.Value = Model.ambulation_note; }
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_sleep_code_" + Model.sleep_code);

                txt_medication_used.Value = Model.medication_used;

                //12
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fall_history_code_" + Model.fall_history_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_secon_diagnosis_code_" + Model.secon_diagnosis_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ambula_aids_code_" + Model.ambula_aids_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_intra_therapy_code_" + Model.intra_therapy_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gait_trans_code_" + Model.gait_trans_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fr_mental_status_code_" + Model.fr_mental_status_code);

                fr_total_score.Text = Convert.ToString(Model.fr_total_score);

                //D
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_involvement_" + Model.involvement);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_med_equipment_" + Model.req_med_equipment);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_foll_care_" + Model.req_foll_care);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_suicidal_referral_" + Model.suicidal_referral);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_alone_reduce_functional_" + Model.alone_reduce_functional);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_physiotherapist_" + Model.ref_physiotherapist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_speech_therapist_" + Model.ref_speech_therapist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_dietician_" + Model.ref_dietician);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_psychologist_" + Model.ref_psychologist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_other_hospital_" + Model.ref_other_hospital);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_support_at_home_" + Model.support_at_home);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_transportation_" + Model.req_transportation);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_stairs_climb_home_" + Model.stairs_climb_home);

                //E
                txt_dis_planning.Value = Model.dis_planning;
                //F
                txt_dis_management.Value = Model.dis_management;

                WebHelpers.BindDateTimePicker(dtpk_assess_date_time, Model.assess_date_time);

                pain_annotation_img.Src = JObject.Parse(Model.pain_annotation).dataURI;

                skin_anno_data_img.Src = JObject.Parse(Model.skin_anno_data).dataURI;

                WebHelpers.VisibleControl(true, pain_annotation_undo, skin_anno_data_undo, pain_annotation_redo, skin_anno_data_redo, pain_annotation_pencilWrapper, skin_anno_data_pencil_wrapper, cb_older_70_true, cb_younger_70_true, cb_normal_nutrition_req_true, cb_nutrition_normal_true);

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
                pain_annotation_base64.Value = JsonConvert.DeserializeObject(Model.pain_annotation).dataURI;
                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(Model.skin_anno_data).dataURI;

                lbl_residence_desc.Text = WebHelpers.FormatString(Model.residence_desc) + (Model.residence_code == "OTH" ? WebHelpers.FormatString(Model.residence_other) : "");
                lbl_language_desc.Text = WebHelpers.FormatString(Model.language_desc) + (Model.language_code == "OTH" ? WebHelpers.FormatString(Model.language_other) : "");
                lbl_req_interpreter.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_interpreter));
                lbl_religion_code.Text = WebHelpers.FormatString(Model.religion_desc) + (Model.religion_code == "OTH" ? WebHelpers.FormatString(Model.religion_other) : "");
                lbl_spiritual_couns.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.spiritual_couns));
                lbl_occupation.Text = WebHelpers.FormatString(Model.occupation);
                lbl_living_status_desc.Text = WebHelpers.FormatString(Model.living_status_desc) + (Model.living_status_code == "OTH" ? WebHelpers.FormatString(Model.living_status_note) : "");
                lbl_hospital_concern_desc.Text = WebHelpers.FormatString(Model.hospital_concern_desc) + (Model.hospital_concern_code == "OTH" ? WebHelpers.FormatString(Model.hospital_concern_other) : "");
                lbl_accompanied.Text = WebHelpers.FormatString(Model.accompanied);
                lbl_relationship.Text = WebHelpers.FormatString(Model.relationship);
                //B
                lbl_admit_from_desc.Text = WebHelpers.FormatString(Model.admit_from_desc) + ": " + (Model.admit_from_code == "OTH" ? WebHelpers.FormatString(Model.admit_from_other) : "");
                lbl_arrived.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.arrived));
                lbl_admission_reason.Text = WebHelpers.FormatString(Model.admission_reason);
                lbl_previous_admission.Text = WebHelpers.FormatString(Model.previous_admission);
                lbl_past_med_history.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.past_med_history));
                lbl_past_sur_history.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.past_sur_history));

                DataTable substance_abuse = WebHelpers.GetJSONToDataTable(Model.substance_abuse);
                lbl_substance_abuse.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(substance_abuse, out int oth_index));

                if (oth_index != -1)
                {
                    lbl_substance_abuse.Text += "&nbsp;" + Model.substance_abuse_other;
                }

                lbl_previous_document.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.previous_document, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(Model.previous_document_note)));

                lbl_cur_home_medication.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cur_home_medication, "Có/ Yes (Tham khảo đơn thuốc đính kèm)/ If, yes please refer to the prescription attached"));
                lbl_allergy.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.allergy, "Có (ghi rõ)/ Yes (specify): " + Model.allergy_note));
                lbl_high_risk_patient.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.high_risk_patient));
                //C
                //1
                lbl_vs_temperature.Text = WebHelpers.FormatString(Model.vs_temperature) + " °C";
                lbl_vs_weight.Text = WebHelpers.FormatString(Model.vs_weight) + " Kg";
                lbl_vs_height.Text = WebHelpers.FormatString(Model.vs_height) + " cm";
                lbl_vs_BMI.Text = WebHelpers.FormatString(Model.vs_BMI) + " Kg/m <sup>2</sup>";
                lbl_vs_heart_rate.Text = WebHelpers.FormatString(Model.vs_heart_rate) + " /phút (m)";
                lbl_vs_respiratory_rate.Text = WebHelpers.FormatString(Model.vs_respiratory_rate) + " /phút (m)";
                lbl_vs_blood_pressure.Text = WebHelpers.FormatString(Model.vs_blood_pressure) + " mmHg";
                lbl_vs_spO2.Text = WebHelpers.FormatString(Model.vs_spO2) + " %";
                //lbl_vs_pulse.Text = WebHelpers.FormatString(Model.vs_pulse) + " cm";
                //2
                lbl_respiratory_system.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.respiratory_system));
                lbl_cough.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cough));
                lbl_pro_cough.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cough, "Có đờm/ Productive (ghi rõ màu/ tính chất/ số lượng)/ (Specify color/ nature/ amount)" + Model.pro_cough_note, "Không có đờm/ Unproductive cough"));

                //3
                lbl_pulse_desc.Text = WebHelpers.FormatString(Model.pulse_desc);
                lbl_presence.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.presence));
                lbl_extremities.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.extremities));
                //4
                lbl_oriented.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.oriented));
                lbl_mental_status.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.mental_status));
                lbl_hearing_code.Text = WebHelpers.FormatString(Model.hearing_desc);

                lbl_vision_code.Text = WebHelpers.FormatString(Model.vision_desc) + (Model.vision_code == "OTH" ? WebHelpers.FormatString(Model.vision_other) : "");
                lbl_speech_code.Text = WebHelpers.FormatString(Model.speech_desc);
                //5
                lbl_diet_desc.Text = WebHelpers.FormatString(Model.diet_desc);
                lbl_diet_pre_desc.Text = WebHelpers.FormatString(Model.diet_pre_desc);
                lbl_ng_tube.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ng_tube, "Ống thông/ NG Tube"));
                cb_gastrostomy_true.Disabled = true;
                if (Model.gastrostomy != null) cb_gastrostomy_true.Checked = Model.gastrostomy;
                cb_size_true.Disabled = true;
                if (Model.size != null) cb_size_true.Checked = Model.size;
                lbl_size_note.Text = WebHelpers.FormatString(Model.size_note);
                lbl_food_dislike.Text = WebHelpers.FormatString(Model.food_dislike);
                lbl_last_date_changed.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.last_date_changed));

                lbl_bowel_elimination_desc.Text = WebHelpers.FormatString(Model.bowel_elimination_desc);
                lbl_stool_consistency_desc.Text = WebHelpers.FormatString(Model.stool_consistency_desc);
                lbl_gas_presence_desc.Text = WebHelpers.FormatString(Model.gas_presence_desc);
                //6
                lbl_bmi_out_range.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.bmi_out_range));
                lbl_loss_weight.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.loss_weight));
                lbl_reduce_dietary.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.reduce_dietary));
                lbl_severely_ill.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.severely_ill));
                //table 2
                if (ShowFinalScreening(Model))
                {
                    //Nutrition status
                    //
                    cb_nutrition_normal_true.Visible = false;
                    if (Model.nutrition_normal != null) cb_nutrition_normal_true.Checked = Model.nutrition_normal;
                    lbl_nutrition_score1.Text = WebHelpers.DisplayCheckBox(Model.nutrition_score1);
                    lbl_nutrition_score2.Text = WebHelpers.DisplayCheckBox(Model.nutrition_score2);
                    lbl_nutrition_score3.Text = WebHelpers.DisplayCheckBox(Model.nutrition_score3);
                    nutrition_score.Text = WebHelpers.FormatString(Convert.ToString(Model.nutrition_score));
                    //
                    //Severity of disease
                    cb_normal_nutrition_req_true.Visible = false;
                    //if (Model.nutrition_normal != null) cb_nutrition_normal_true.Checked = Model.nutrition_normal;
                    lbl_severity_score1.Text = WebHelpers.DisplayCheckBox(Model.severity_score1);
                    lbl_severity_score2.Text = WebHelpers.DisplayCheckBox(Model.severity_score2);
                    lbl_severity_score3.Text = WebHelpers.DisplayCheckBox(Model.severity_score3);
                    severity_score.Text = WebHelpers.FormatString(Convert.ToString(Model.severity_score));
                    //
                    //Age
                    //
                    WebHelpers.VisibleControl(false, cb_younger_70_true, cb_older_70_true);
                    if (Model.younger_70 != null) cb_younger_70_true.Checked = Model.younger_70;
                    if (Model.older_70 != null) cb_older_70_true.Checked = Model.older_70;
                    age_score.Text = WebHelpers.FormatString(Convert.ToString(Model.age_score));
                    //
                    //Total score
                    //

                    total_nutri_score.Text = WebHelpers.FormatString(Model.total_nutri_score);
                }
                //
                //7
                lbl_urination.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.urination));
                WebHelpers.VisibleControl(false, cb_inter_catheter_true, cb_ind_catheter_true, cb_sup_catheter_true);
                if (Model.inter_catheter != null) { cb_inter_catheter_true.Checked = Model.inter_catheter; }
                if (Model.ind_catheter != null) { cb_ind_catheter_true.Checked = Model.ind_catheter; }
                lbl_ind_catheter_size.Text = WebHelpers.FormatString(Model.ind_catheter_size);
                lbl_ind_catheter_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.ind_catheter_date));
                if (Model.sup_catheter != null) { cb_sup_catheter_true.Checked = Model.sup_catheter; }
                lbl_sup_catheter_size.Text = WebHelpers.FormatString(Model.sup_catheter_size);
                lbl_last_sup_catheter_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.last_sup_catheter_date));
                //
                lbl_menstruation_code.Text = $"{WebHelpers.FormatString(Model.menstruation_desc)} {WebHelpers.FormatString(Model.cycle_day)} Ngày đầu của kỳ kinh cuối/ Last menstrual period started {WebHelpers.FormatString(Model.last_mens_period)}";

                lbl_not_pregnancy.Text = $"{WebHelpers.FormatString(WebHelpers.GetBool(Model.not_pregnancy))} Đã từng mang thai trước đây/ Previous pregnancy: {WebHelpers.FormatString(WebHelpers.GetBool(Model.pre_pregnancy))} PARA {WebHelpers.FormatString(Model.para)} Hiện đang mang thai/ Current pregnancy: {WebHelpers.FormatString(WebHelpers.GetBool(Model.cur_pregnancy))} {WebHelpers.FormatString(Model.pregnancy_week)} tuần/ week";

                lbl_contraception_code.Text = $"{WebHelpers.FormatString(Model.contraception_desc)} {WebHelpers.FormatString(Model.contraception_other)}";

                //8
                lbl_mus_history.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.mus_history));
                lbl_paralysis.Text = "Liệt/ (1/2 người/2 chi/4 chi)/ Paralysis (Hemi/Para/Tetra): " + WebHelpers.FormatString(WebHelpers.GetBool(Model.paralysis)) + WebHelpers.FormatString(Model.paralysis_note);
                lbl_amputation.Text = $"Đoạn chi/ Amputation: {WebHelpers.FormatString(WebHelpers.GetBool(Model.amputation))} {WebHelpers.FormatString(Model.ambulation_note)}";
                lbl_contracture.Text = $"Cơ bắp co rút/ Contracture: {WebHelpers.FormatString(WebHelpers.GetBool(Model.contracture))} {WebHelpers.FormatString(Model.contracture_note)}";
                lbl_prosthesis.Text = $"Lắp bộ phận giả/ Prosthesis: {WebHelpers.FormatString(WebHelpers.GetBool(Model.prosthesis))} {WebHelpers.FormatString(Model.prosthesis_note)}";
                //9
                lbl_cur_in_pain.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cur_in_pain));
                lbl_p_location_1.Text = WebHelpers.FormatString(Model.p_location_1);
                lbl_p_location_2.Text = WebHelpers.FormatString(Model.p_location_2);
                lbl_p_location_3.Text = WebHelpers.FormatString(Model.p_location_3);

                lbl_q_location_1.Text = WebHelpers.FormatString(Model.q_location_1);
                lbl_q_location_2.Text = WebHelpers.FormatString(Model.q_location_2);
                lbl_q_location_3.Text = WebHelpers.FormatString(Model.q_location_3);

                lbl_r_location_1.Text = WebHelpers.FormatString(Model.r_location_1);
                lbl_r_location_2.Text = WebHelpers.FormatString(Model.r_location_2);
                lbl_r_location_3.Text = WebHelpers.FormatString(Model.r_location_3);

                lbl_s_location_1.Text = WebHelpers.FormatString(Model.s_location_1);
                lbl_s_location_2.Text = WebHelpers.FormatString(Model.s_location_2);
                lbl_s_location_3.Text = WebHelpers.FormatString(Model.s_location_3);

                lbl_t_location_1.Text = WebHelpers.FormatString(Model.t_location_1);
                lbl_t_location_2.Text = WebHelpers.FormatString(Model.t_location_2);
                lbl_t_location_3.Text = WebHelpers.FormatString(Model.t_location_3);

                lbl_using_pain_killer.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.using_pain_killer));
                lbl_pain_killer_name.Text = WebHelpers.FormatString(Model.pain_killer_name);
                lbl_pa_comment.Text = WebHelpers.FormatString(Model.pa_comment);

                //10

                lbl_condition.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.condition));

                lbl_wounds.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.wounds));

                WebHelpers.LoadDataGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(Model.skin_anno), IinaDictionary.SKIN_ANNO, btn_grid_skin_anno_add);

                lbl_sensory_code.Text = WebHelpers.FormatString(Model.sensory_desc);
                lbl_moisture_code.Text = WebHelpers.FormatString(Model.moisture_desc);
                lbl_activity_code.Text = WebHelpers.FormatString(Model.activity_desc);
                lbl_mobility_code.Text = WebHelpers.FormatString(Model.mobility_desc);
                lbl_nutrition_code.Text = WebHelpers.FormatString(Model.nutrition_desc);
                lbl_friction_code.Text = WebHelpers.FormatString(Model.friction_desc);

                total_score.Text = WebHelpers.FormatString(Model.total_score);
                pres_sore_risk_desc.Text = WebHelpers.FormatString(Model.pres_sore_risk_desc);
                lbl_preven_action.Text = WebHelpers.FormatString(Model.preven_action);

                //11 - Checked
                lbl_bathing_desc.Text = WebHelpers.FormatString(Model.bathing_desc);
                lbl_oral_care_desc.Text = WebHelpers.FormatString(Model.oral_care_desc);
                lbl_dentures_desc.Text = WebHelpers.FormatString(Model.dentures_desc);
                lbl_toilet_use_desc.Text = WebHelpers.FormatString(Model.toilet_use_desc);
                lbl_dressing_desc.Text = WebHelpers.FormatString(Model.dressing_desc);
                lbl_eating_desc.Text = WebHelpers.FormatString(Model.eating_desc);
                lbl_turning_bed_desc.Text = WebHelpers.FormatString(Model.turning_bed_desc);
                lbl_ambulation_desc.Text = WebHelpers.FormatString(Model.ambulation_desc);
                lbl_sleep_desc.Text = WebHelpers.FormatString(Model.sleep_desc);
                lbl_medication_used.Text = WebHelpers.FormatString(Model.medication_used);
                //12 - Checked
                lbl_fall_history_desc.Text = WebHelpers.FormatString(Model.fall_history_desc);
                lbl_secon_diagnosis_desc.Text = WebHelpers.FormatString(Model.secon_diagnosis_desc);
                lbl_ambula_aids_desc.Text = WebHelpers.FormatString(Model.ambula_aids_desc);
                lbl_intra_therapy_desc.Text = WebHelpers.FormatString(Model.intra_therapy_desc);
                lbl_gait_trans_desc.Text = WebHelpers.FormatString(Model.gait_trans_desc);
                lbl_fr_mental_status_desc.Text = WebHelpers.FormatString(Model.fr_mental_status_desc);
                fr_total_score.Text = WebHelpers.FormatString(Model.fr_total_score);
                //D.
                lbl_involvement.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.involvement));
                lbl_req_med_equipment.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_med_equipment));
                lbl_req_foll_care.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_foll_care));
                lbl_suicidal_referral.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.suicidal_referral));
                lbl_ref_physiotherapist.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_physiotherapist));
                lbl_ref_speech_therapist.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_speech_therapist));
                lbl_ref_dietician.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_dietician));
                lbl_ref_psychologist.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_psychologist));
                lbl_ref_other_hospital.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_other_hospital));
                lbl_support_at_home.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.support_at_home));
                lbl_req_transportation.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_transportation));
                lbl_stairs_climb_home.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.stairs_climb_home));
                //E
                lbl_dis_planning.Text = WebHelpers.FormatString(Model.dis_planning);
                //F
                lbl_dis_management.Text = WebHelpers.FormatString(Model.dis_management);
                lbl_assess_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.assess_date_time, "dd-MMM-yyyy HH:mm"));

                pain_annotation_img.Src = JObject.Parse(Model.pain_annotation).dataURI;

                skin_anno_data_img.Src = JObject.Parse(Model.skin_anno_data).dataURI;

                WebHelpers.VisibleControl(false, pain_annotation_undo, skin_anno_data_undo, pain_annotation_redo, skin_anno_data_redo, pain_annotation_pencilWrapper, skin_anno_data_pencil_wrapper);

                //final_screening_field.Visible = iina.bmi_out_range || iina.loss_weight || iina.reduce_dietary || iina.severely_ill;

                final_screening_field.Visible = ShowFinalScreening(Model);

                PrintDocument(null, null);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        public override void BindingDataFormPrint()
        {
            //try
            //{
                

                prt_fullname.Text = Patient.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(Patient.DOB, "dd/MM/yyyy");
                prt_gender.Text = Patient.Gender;
                prt_pid.Text = Patient.visible_patient_id;

                prt_date_of_admission.Text = WebHelpers.FormatDateTime(PatientVisit.ActualVisitDateTime, "dd/MM/yyyy");
                prt_time_of_admission.Text = WebHelpers.FormatDateTime(PatientVisit.ActualVisitDateTime, "HH:mm");
            prt_assess_date.Text = WebHelpers.FormatDateTime(Model.assess_date_time, "dd/MM/yyyy");
            prt_assess_time.Text = WebHelpers.FormatDateTime(Model.assess_date_time, "HH:mm");

            residence_code_set();
            prt_residence_code_binding();
            language_code_set();
            prt_language_code_binding();
            req_interpreter_set();//test
            if(Model.req_interpreter != null)
                prt_binding("prt_" + nameof(Model.req_interpreter) + "_" + Model.req_interpreter);
            religion_code_set();
            if(Model.religion_code != null)
            {
                prt_religion_code_binding();
            }
            prt_occupation.Text = Model.occupation;
            prt_living_status_code_binding();
                //{
                //    var control = FindControl("prt_religion_code_" + Model.religion_code);
                //    if (control != null)
                //    {
                //        (control as Label).Text = "☑";
                //        if (Model.religion_code == "OTH")
                //        {
                //            prt_religion_code_oth.Text = Model.religion_other;
                //        }
                //    }
                //}

                {
                    var control = FindControl("prt_spiritual_couns_" + Model.spiritual_couns);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_occupation.Text = Model.occupation;

                {
                    var control = FindControl("prt_living_status_code_" + Model.living_status_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.living_status_code == "OTH")
                        {
                            prt_living_status_note.Text = Model.living_status_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_hospital_concern_code_" + Model.hospital_concern_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.hospital_concern_code == "OTH")
                        {
                            prt_hospital_concern_other.Text = Model.hospital_concern_other;
                        }
                    }
                }

                prt_contact_name.Text = Patient.Contact;
                prt_relationship_type_rcd.Text = Patient.Relationship;

                prt_accompanied.Text = Model.accompanied;
                prt_relationship.Text = Model.relationship;

            //Model.accompanied

            //II. Bệnh sử/ medical history

            prt_admit_from_code_binding();

            

            var admit_from_code = FindControl("prt_admit_from_code_" + Model.admit_from_code);
            if (admit_from_code != null)
            {
                (admit_from_code as Label).Text = "☑";
                if (Model.admit_from_code == "OTH")
                {
                    prt_admit_from_other.Text = Model.admit_from_other;
                }
            }
            #region...

            prt_arrived_setup(); //test
            DataTable arrived = WebHelpers.GetJSONToDataTable(Model.arrived);
            if (arrived != null)
            {
                foreach (DataRow row in arrived.Rows)
                {
                    string code = Convert.ToString(row["code"]);
                    Control control = FindControl("prt_arrived_" + code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }
            }
            prt_arrived_assert(); //test

            prt_admission_reason.Text = Model.admission_reason;

                {
                    var control = FindControl("prt_previous_admission_" + !string.IsNullOrEmpty(Model.previous_admission));
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        prt_previous_admission.Text = Model.previous_admission;
                    }
                }

                {
                    var control = FindControl("prt_past_med_history_" + Model.past_med_history);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.past_med_history)
                        {
                            prt_past_med_history_note.Text = Model.past_med_history_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_past_sur_history_" + Model.past_sur_history);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.past_sur_history)
                        {
                            prt_past_sur_history_note.Text = Model.past_sur_history_note;
                        }
                    }
                }

                DataTable substance_abuse = WebHelpers.GetJSONToDataTable(Model.substance_abuse);
                if (substance_abuse != null)
                {
                    foreach (DataRow row in substance_abuse.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_substance_abuse_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                            if (code == "OTH")
                            {
                                prt_substance_abuse_other.Text = Model.substance_abuse_other;
                            }
                        }
                    }
                }

                {
                    var control = FindControl("prt_previous_document_" + Model.previous_document);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.previous_document)
                        {
                            prt_previous_document_note.Text = Model.previous_document_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_cur_home_medication_" + Model.cur_home_medication);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_allergy_" + Model.allergy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.allergy)
                        {
                            prt_allergy_note.Text = Model.allergy_note;
                        }
                    }
                }

                DataTable high_risk_patient = WebHelpers.GetJSONToDataTable(Model.high_risk_patient);
                if (high_risk_patient != null)
                {
                    foreach (DataRow row in high_risk_patient.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_high_risk_patient_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                #endregion

                //C. Đánh giá của điều dưỡng/ Nursing assessment

                #region 1. Dấu hiệu sinh tồn và các chỉ số đo lường/ Vital signs and standard measurements

                prt_vs_temperature.Text = Model.vs_temperature;
                prt_vs_heart_rate.Text = Model.vs_heart_rate;
                prt_vs_blood_pressure.Text = Model.vs_blood_pressure;
                prt_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
                prt_vs_weight.Text = Model.vs_weight;
                prt_vs_height.Text = Model.vs_height;
                prt_vs_BMI.Text = Model.vs_BMI;

                #endregion

                #region 2. Hệ hô hấp/ Respiratory system

                DataTable respiratory_system = WebHelpers.GetJSONToDataTable(Model.respiratory_system);
                if (respiratory_system != null)
                {
                    foreach (DataRow row in respiratory_system.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_respiratory_system_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                {
                    var control = FindControl("prt_cough_" + Model.cough);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_pro_cough_" + Model.pro_cough);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.pro_cough)
                        {
                            prt_pro_cough_note.Text = Model.pro_cough_note;
                        }
                    }
                }

                #endregion

                #region 3. Hệ tim mạch/ Cardiovascular system

                {
                    var control = FindControl("prt_pulse_code_" + Model.pulse_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                DataTable presence = WebHelpers.GetJSONToDataTable(Model.presence);
                if (presence != null)
                {
                    foreach (DataRow row in presence.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_presence_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable extremities = WebHelpers.GetJSONToDataTable(Model.extremities);
                if (extremities != null)
                {
                    foreach (DataRow row in extremities.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_extremities_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                #endregion

                #region 4. Hệ thần kinh cảm giác/ Neurosensory system

                DataTable oriented = WebHelpers.GetJSONToDataTable(Model.oriented);
                if (oriented != null)
                {
                    foreach (DataRow row in oriented.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_oriented_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable mental_status = WebHelpers.GetJSONToDataTable(Model.mental_status);
                if (mental_status != null)
                {
                    foreach (DataRow row in mental_status.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_mental_status_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                            if (code == "OTH")
                            {
                                prt_mental_status_other.Text = Model.mental_status_other;
                            }
                        }
                    }
                }

                {
                    var control = FindControl("prt_hearing_code_" + Model.hearing_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_vision_code_" + Model.vision_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_speech_code_" + Model.speech_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                #endregion

                #region 5. Hệ tiêu hóa/ Gastrointestinal system

                {
                    var control = FindControl("prt_diet_code_" + Model.diet_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.diet_code == "OTH")
                        {
                            prt_diet_other.Text = Model.diet_other;
                        }
                    }
                }

                {
                    var control = FindControl("prt_diet_pre_code_" + Model.diet_pre_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    if (Model.ng_tube != null)
                    {
                        if (!Model.ng_tube)
                        {
                            prt_ng_tube_false.Text = "☑";
                        }
                    }
                }

                {
                    var control = FindControl("prt_gastrostomy_" + Model.gastrostomy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    if (Model.size != null)
                    {
                        if (Model.size)
                        {
                            prt_size_true.Text = "☑";
                        }
                    }
                }

                prt_size_note.Text = WebHelpers.FormatString(Model.size_note, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_last_date_changed.Text = WebHelpers.FormatDateTime(Model.last_date_changed, "dd/MM/yyyy");
                prt_food_dislike.Text = Model.food_dislike;

                {
                    var control = FindControl("prt_bowel_elimination_code_" + Model.bowel_elimination_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_stool_consistency_code_" + Model.stool_consistency_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_gas_presence_code_" + Model.gas_presence_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                #endregion

                #region 6. Đánh giá dinh dưỡng ban đầu/ Initial Nutrition Assessment

                string[] initialTemp = new string[4]
                {
                    "prt_bmi_out_range_" + Model.bmi_out_range,
                    "prt_loss_weight_" + Model.loss_weight,
                    "prt_reduce_dietary_" + Model.reduce_dietary,
                    "prt_severely_ill_" + Model.severely_ill

                };

                foreach (var i in initialTemp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "✓";
                    }
                }

                string[] finalTemp = new string[3]
                {
                    "prt_nutrition_normal_" + Model.nutrition_normal,
                    "prt_normal_nutrition_req_" + Model.normal_nutrition_req,
                    "prt_younger_70_" + Model.younger_70

                };

                foreach (var i in finalTemp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }
            
                DataTable nutrition_score1 = WebHelpers.GetJSONToDataTable(Model.nutrition_score1);
                if (nutrition_score1 != null)
                {
                    foreach (DataRow row in nutrition_score1.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_nutrition_score1_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

            

            DataTable nutrition_score2 = WebHelpers.GetJSONToDataTable(Model.nutrition_score2);
                if (nutrition_score2 != null)
                {
                    foreach (DataRow row in nutrition_score2.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_nutrition_score2_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable nutrition_score3 = WebHelpers.GetJSONToDataTable(Model.nutrition_score3);
                if (nutrition_score3 != null)
                {
                    foreach (DataRow row in nutrition_score3.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_nutrition_score3_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable severity_score1 = WebHelpers.GetJSONToDataTable(Model.severity_score1);
                if (severity_score1 != null)
                {
                    foreach (DataRow row in severity_score1.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_severity_score1_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable severity_score2 = WebHelpers.GetJSONToDataTable(Model.severity_score2);
                if (severity_score2 != null)
                {
                    foreach (DataRow row in severity_score2.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_severity_score2_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable severity_score3 = WebHelpers.GetJSONToDataTable(Model.severity_score3);
                if (severity_score3 != null)
                {
                    foreach (DataRow row in severity_score3.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_severity_score3_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                {
                    var control = FindControl("prt_older_70_" + Model.older_70);
                    if (control != null)
                    {
                        (control as Label).Text = "x";
                    }
                }

                prt_nutrition_score.Text = Model.nutrition_score;
                prt_severity_score.Text = Model.severity_score;
                prt_age_score.Text = Model.age_score;

                prt_total_nutri_score.Text = Model.total_nutri_score;

                #endregion

                #region 7. Hệ tiết niệu sinh dục/ Genitourinary system

                DataTable urination = WebHelpers.GetJSONToDataTable(Model.urination);
                if (urination != null)
                {
                    foreach (DataRow row in urination.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_urination_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                {
                    var control = FindControl("prt_inter_catheter_" + Model.inter_catheter);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.ind_catheter)
                        {
                            prt_inter_catheter_note.Text = Model.inter_catheter_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_ind_catheter_" + Model.ind_catheter);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_ind_catheter_size.Text = Convert.ToString(Model.ind_catheter_size);
                    prt_ind_catheter_date.Text = WebHelpers.FormatDateTime(Model.ind_catheter_date, "dd/MM/yyyy");
                }

                {
                    var control = FindControl("prt_sup_catheter_" + Model.sup_catheter);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_sup_catheter_size.Text = Convert.ToString(Model.sup_catheter_size);
                    prt_last_sup_catheter_date.Text = WebHelpers.FormatDateTime(Model.last_sup_catheter_date, "dd/MM/yyyy");
                }

                {
                    var control = FindControl("prt_menstruation_code_" + Model.menstruation_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_cycle_day.Text = Model.cycle_day;
                }

                {

                    dynamic datetime = WebHelpers.ConvertDateTime(Model.last_mens_period, out bool isValid);
                    if (isValid)
                    {
                        prt_last_mens_period.Text = WebHelpers.FormatDateTime(datetime, "dd/MM/yyyy");
                    }
                    else
                    {
                        prt_last_mens_period.Text = datetime;
                    }
                }

                {
                    var control = FindControl("prt_not_pregnancy_" + Model.not_pregnancy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_pre_pregnancy_" + Model.pre_pregnancy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_para.Text = Model.para;

                {
                    var control = FindControl("prt_cur_pregnancy_" + Model.cur_pregnancy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_pregnancy_week.Text = Model.pregnancy_week;
                }

                {
                    var control = FindControl("prt_contraception_code_" + Model.contraception_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.contraception_code == "OTH")
                        {
                            prt_contraception_other.Text = Model.contraception_other;
                        }
                    }
                }

                #endregion

                #region 8. Hệ cơ - xương khớp/ Musculoskeletal system

                DataTable mus_history = WebHelpers.GetJSONToDataTable(Model.mus_history);
                if (mus_history != null)
                {
                    foreach (DataRow row in mus_history.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_mus_history_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                string[] musTemp = new string[4]
                {
                    "prt_paralysis_" + Model.paralysis,
                    "prt_amputation_" + Model.amputation,
                    "prt_contracture_" + Model.contracture,
                    "prt_prosthesis_" + Model.prosthesis
                };

                foreach (var i in musTemp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_paralysis_note.Text = Model.paralysis_note;

                prt_amputation_note.Text = Model.amputation_note;

                prt_contracture_note.Text = Model.contracture_note;

                prosthesis_note.Text = Model.prosthesis_note;

                #endregion

                #region 9. Đau/ Pain

                //9

                {
                    var control = FindControl("prt_cur_in_pain_" + Model.cur_in_pain);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_p_location_1.Text = Model.p_location_1;
                prt_p_location_2.Text = Model.p_location_2;
                prt_p_location_3.Text = Model.p_location_3;

                prt_q_location_1.Text = Model.q_location_1;
                prt_q_location_2.Text = Model.q_location_2;
                prt_q_location_3.Text = Model.q_location_3;

                prt_r_location_1.Text = Model.r_location_1;
                prt_r_location_2.Text = Model.r_location_2;
                prt_r_location_3.Text = Model.r_location_3;

                prt_s_location_1.Text = Model.s_location_1;
                prt_s_location_2.Text = Model.s_location_2;
                prt_s_location_3.Text = Model.s_location_3;

                prt_t_location_1.Text = Model.t_location_1;
                prt_t_location_2.Text = Model.t_location_2;
                prt_t_location_3.Text = Model.t_location_3;

                imageTemp.Src = JObject.Parse(Model.pain_annotation).dataURI;

                {
                    var control = FindControl("prt_using_pain_killer_" + Model.using_pain_killer);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_pain_killer_name.Text = Model.pain_killer_name;
                prt_pa_comment.Text = Model.pa_comment;

                #endregion

                #region 10. Da & Nguy cơ loét tỳ đè/ Skin & Pressure Sore Risk

                DataTable condition = WebHelpers.GetJSONToDataTable(Model.condition);
                if (condition != null)
                {
                    foreach (DataRow row in condition.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_condition_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable wounds = WebHelpers.GetJSONToDataTable(Model.wounds);
                if (wounds != null)
                {
                    foreach (DataRow row in wounds.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_wounds_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable skin_anno = WebHelpers.GetJSONToDataTable(Model.skin_anno);

                if (skin_anno != null)
                {
                    HtmlTableRow tr1 = new HtmlTableRow();
                    HtmlTableCell td1;
                    HtmlGenericControl p;

                    string location = "";
                    string type = "";

                    if (skin_anno.Rows.Count > 0)
                    {
                        location = Convert.ToString(skin_anno.Rows[0]["location"]);
                        type = Convert.ToString(skin_anno.Rows[0]["type"]);
                    }

                    //
                    td1 = new HtmlTableCell();
                    p = new HtmlGenericControl("lable") { InnerHtml = location };
                    td1.Controls.Add(p);
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);
                    //
                    td1 = new HtmlTableCell();
                    p = new HtmlGenericControl("lable") { InnerHtml = type };
                    td1.Controls.Add(p);
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);

                    td1 = new HtmlTableCell();
                    td1.InnerHtml = "<img style='width: 250px' src='" + JObject.Parse(Model.skin_anno_data).dataURI + "'>";
                    td1.Width = "300px";
                    td1.RowSpan = skin_anno.Rows.Count;
                    tr1.Cells.Add(td1);

                    prt_skin_anno.Rows.Add(tr1);

                    for (int i = 1; i < skin_anno.Rows.Count; i++)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;

                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(skin_anno.Rows[i]["location"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(skin_anno.Rows[i]["type"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);

                        prt_skin_anno.Rows.Add(tr);
                    }

                }
                else
                {
                    HtmlTableRow tr1 = new HtmlTableRow();
                    HtmlTableCell td1;
                    //
                    td1 = new HtmlTableCell();
                    td1.InnerText = "";
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);
                    //
                    td1 = new HtmlTableCell();
                    td1.InnerText = "";
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);

                    td1 = new HtmlTableCell();
                    td1.InnerHtml = "<img style='width: 300px' src='" + JObject.Parse(Model.skin_anno_data).dataURI + "'>";
                    td1.Width = "300px";
                    tr1.Cells.Add(td1);

                    prt_skin_anno.Rows.Add(tr1);
                }

                prt_sensory_code.Text = Model.sensory_code;
                prt_moisture_code.Text = Model.moisture_code;
                prt_activity_code.Text = Model.activity_code;
                prt_mobility_code.Text = Model.mobility_code;
                prt_nutrition_code.Text = Model.nutrition_code;
                prt_friction_code.Text = Model.friction_code;
                prt_total_score.Text = Model.total_score;

                prt_preven_action.Text = Model.preven_action;

                #endregion

                #region 11. Khả năng thực hiện những sinh hoạt hàng ngày/ Ability to perform daily activities.

                prt_medication_used.Text = Model.medication_used;

                #endregion
                
                //12
                prt_fall_history_code.Text = Model.fall_history_code;
                prt_secon_diagnosis_code.Text = Model.secon_diagnosis_code;
                prt_ambula_aids_code.Text = Model.ambula_aids_code;
                prt_intra_therapy_code.Text = Model.intra_therapy_code;
                prt_gait_trans_code.Text = Model.gait_trans_code;
                prt_fr_mental_status_code.Text = Model.fr_mental_status_code;
                prt_fr_total_score.Text = Model.fr_total_score;
                
                string[] temp = new string[17] {
                    //11
                    "prt_pres_sore_risk_code_" + Model.pres_sore_risk_code,
                    "prt_bathing_code_" + Model.bathing_code,
                    "prt_oral_care_code_" + Model.oral_care_code,
                    "prt_dentures_code_" + Model.dentures_code,
                    "prt_toilet_use_code_" + Model.toilet_use_code,
                    "prt_dressing_code_" + Model.dressing_code,
                    "prt_eating_code_" + Model.eating_code,
                    "prt_turning_bed_code_" + Model.turning_bed_code,
                    "prt_ambulation_code_" + Model.ambulation_code,
                    "prt_sleep_code_" + Model.sleep_code,
                    "prt_medication_used_" + Model.medication_used,
                    //12
                    "prt_fall_history_code_" + Model.fall_history_code,
                    "prt_secon_diagnosis_code_" + Model.secon_diagnosis_code,
                    "prt_ambula_aids_code_" + Model.ambula_aids_code,
                    "prt_intra_therapy_code_" + Model.intra_therapy_code,
                    "prt_gait_trans_code_" + Model.gait_trans_code,
                    "prt_fr_mental_status_code_" + Model.fr_mental_status_code
                };

                foreach (var i in temp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

            

            bathing_code_binding_to_print();

            prt_oral_care_code_binding();

            prt_dentures_code_binding();

            prt_toilet_use_code_binding();

            prt_dressing_code_binding();

            prt_eating_code_binding();

            prt_turning_bed_code_binding();

            prt_ambulation_code_binding();

            prt_sleep_code_binding();

            prt_medication_used_binding();
            //D
            string[] dischargePlanTemp = new string[13] {
                    "prt_involvement_" + Model.involvement,
                    "prt_req_med_equipment_" + Model.req_med_equipment,
                    "prt_req_foll_care_" + Model.req_foll_care,
                    "prt_suicidal_referral_" + Model.suicidal_referral,
                    "prt_alone_reduce_functional_" + Model.alone_reduce_functional,
                    "prt_ref_physiotherapist_" + Model.ref_physiotherapist,
                    "prt_ref_speech_therapist_" + Model.ref_speech_therapist,
                    "prt_ref_dietician_" + Model.ref_dietician,
                    "prt_ref_psychologist_" + Model.ref_psychologist,
                    "prt_ref_other_hospital_" + Model.ref_other_hospital,
                    "prt_support_at_home_" + Model.support_at_home,
                    "prt_req_transportation_" + Model.req_transportation,
                    "prt_stairs_climb_home_" + Model.stairs_climb_home
                };

                foreach (var i in dischargePlanTemp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "✓";
                    }
                }

                //E
                //E
                prt_dis_planning.Text = Model.dis_planning;
                //F
                prt_dis_management.Text = Model.dis_management;

            //}
            //catch (Exception ex)
            //{
            //    WebHelpers.SendError(Page, ex);
            //}

        }

        private void prt_living_status_code_binding()
        {
            prt_binding("prt_" + nameof(Model.living_status_code) + "_" + Model.living_status_code);
            //prt_living_status_code
            if (prt_religion_code_oth.Text == "☑")
            {
                prt_religion_other.Text = Model.religion_other;
            }
        }

        private void religion_code_set()
        {
            Model.religion_code = "CH";
            Model.religion_code = "BH";
            Model.religion_code = "OTH";
            Model.religion_desc = Iina.RELIGION_CODE[Model.religion_code];
            if (Model.religion_code == "OTH")
            {
                Model.religion_other = "Unknown";
            }
        }

        private void prt_religion_code_binding()
        {
            prt_binding("prt_" + nameof(Model.religion_code) + "_" + Model.religion_code);
            if(prt_religion_code_oth.Text == "☑")
            {
                prt_religion_other.Text = Model.religion_other;
            }
        }

        private void req_interpreter_set()
        {
            Model.req_interpreter = null;
            Model.req_interpreter = true;
            Model.req_interpreter = false;
        }

        private void language_code_set()
        {
            Model.language_code = "OTH";
            Model.language_desc = IinaDictionary.LANGUAGE_CODE[Model.language_code];
            if(Model.language_code == "OTH")
            {
                Model.language_other = "Tiếng Trung";
            }
        }
        private void prt_binding(string controlId)
        {
            try
            {
                ((Label)FindControl(controlId)).Text = "☑";
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void prt_language_code_binding()
        {
            try
            {
                prt_binding("prt_language_code_" + Model.language_code);
                if (prt_language_code_oth.Text == "☑")
                {
                    prt_language_other.Text = Model.language_other;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void residence_code_set()
        {
            Model.residence_code = "OTH";
            Model.residence_desc = IinaDictionary.RESIDENCE_CODE[Model.residence_code];
            Model.residence_other = "Trung Quốc";
        }

        private void prt_residence_code_binding()
        {
            var control = FindControl("prt_residence_code_" + Model.residence_code);
            if (control != null)
            {
                (control as Label).Text = "☑";
            }
            if(prt_residence_code_oth.Text == "☑")
            {
                prt_residence_other.Text = Model.residence_other;
            }
        }

        private void prt_arrived_assert()
        {
            DataTable arrived = WebHelpers.GetJSONToDataTable(Model.arrived);
            foreach (DataRow i in arrived.Rows)
            {
                switch (i["code"])
                {
                    case "W":
                        if (((Label)FindControl("prt_arrived_w")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "WC":
                        if (((Label)FindControl("prt_arrived_wc")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "S":
                        if (((Label)FindControl("prt_arrived_s")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_arrived_setup()
        {
            //Set value
            DataTable table = new DataTable();
            table.Columns.Add("code");
            table.Columns.Add("desc");
            DataRow dtRow = table.NewRow();
            dtRow["code"] = "W";
            dtRow["desc"] = "Tự đi được/ Walking";
            table.Rows.Add(dtRow);
            //
            DataRow dtRow1 = table.NewRow();
            dtRow1["code"] = "WC";
            dtRow1["desc"] = "Bằng xe lăn/ Wheelchair";
            table.Rows.Add(dtRow1);

            Model.arrived = JsonConvert.SerializeObject(table);
        }

        private void prt_admit_from_code_binding()
        {
            foreach (var i in IinaDictionary.ADMIT_FROM_CODE)
            {
                Model.admit_from_code = i.Key;
                var control = FindControl("prt_admit_from_code_" + i.Key);
                (control as Label).Text = "☑";

                if(Model.admit_from_code == "OTH")
                {
                    Model.admit_from_other = "none";
                    prt_admit_from_other.Text = Model.admit_from_other;
                }

                switch (Model.admit_from_code)
                {
                    case "OTH":
                        if (((Label)FindControl("prt_admit_from_code_oth")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        if (((Label)FindControl("prt_admit_from_other")).Text != Model.admit_from_other)
                        {
                            throw new Exception();
                        }
                        break;
                    case "ER":
                        if (((Label)FindControl("prt_admit_from_code_er")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "OPD":
                        if (((Label)FindControl("prt_admit_from_code_opd")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "VD":
                        if (((Label)FindControl("prt_admit_from_code_vd")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_medication_used_binding()
        {
            Model.medication_used = "None";

            prt_medication_used.Text = Model.medication_used;
        }
        private void prt_sleep_code_binding()
        {
            foreach (var i in IinaDictionary.SLEEP_CODE)
            {
                Model.sleep_code = i.Key;
                var control = FindControl("prt_sleep_code_" + i.Key);
                (control as Label).Text = "☑";
                switch (Model.sleep_code)
                {
                    case "PFA":
                        if (((Label)FindControl("prt_sleep_code_pfa")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "PST":
                        if (((Label)FindControl("prt_sleep_code_pst")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "NM":
                        if (((Label)FindControl("prt_sleep_code_nm")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "AE":
                        if (((Label)FindControl("prt_sleep_code_ae")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_ambulation_code_binding()
        {
            foreach (var i in IinaDictionary.AMBULATION_CODE)
            {
                Model.ambulation_code = i.Key;
                var control = FindControl("prt_ambulation_code_" + i.Key);
                (control as Label).Text = "☑";

                if (Model.ambulation_code == "NA")
                {
                    Model.ambulation_note = "Cần 1 điều dưỡng hỗ trợ";
                }
                prt_ambulation_note.Text = Model.ambulation_note;



                switch (Model.ambulation_code)
                {
                    case "BF":
                        if (((Label)FindControl("prt_ambulation_code_bf")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "NA":
                        if (((Label)FindControl("prt_ambulation_code_na")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        if (((Label)FindControl("prt_ambulation_note")).Text != Model.ambulation_note)
                        {
                            throw new Exception();
                        }
                        break;
                    case "IN":
                        if (((Label)FindControl("prt_ambulation_code_in")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_turning_bed_code_binding()
        {
            foreach (var i in IinaDictionary.TURNING_BED_CODE)
            {
                Model.turning_bed_code = i.Key;
                var control = FindControl("prt_turning_bed_code_" + i.Key);
                (control as Label).Text = "☑";
                switch (Model.turning_bed_code)
                {
                    case "IN":
                        if (((Label)FindControl("prt_turning_bed_code_in")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "DN":
                        if (((Label)FindControl("prt_turning_bed_code_dn")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_eating_code_binding()
        {
            foreach (var i in IinaDictionary.EATING_CODE)
            {
                Model.eating_code = i.Key;
                var control = FindControl("prt_eating_code_" + i.Key);
                (control as Label).Text = "☑";
                switch (Model.eating_code)
                {
                    case "DP":
                        if (((Label)FindControl("prt_eating_code_dp")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "TU":
                        if (((Label)FindControl("prt_eating_code_tu")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "DA":
                        if (((Label)FindControl("prt_eating_code_da")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "IN":
                        if (((Label)FindControl("prt_eating_code_in")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_dressing_code_binding()
        {
            foreach (var i in IinaDictionary.DRESSING_CODE)
            {
                Model.oral_care_code = i.Key;
                var control = FindControl("prt_dressing_code_" + i.Key);
                (control as Label).Text = "☑";
                switch (Model.dressing_code)
                {
                    case "wa":
                        if (((Label)FindControl("prt_dressing_code_wa")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "in":
                        if (((Label)FindControl("prt_dressing_code_in")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_toilet_use_code_binding()
        {
            foreach (var i in IinaDictionary.TOILET_USE_CODE)
            {
                Model.oral_care_code = i.Key;
                var control = FindControl("prt_toilet_use_code_" + i.Key);
                (control as Label).Text = "☑";
                switch (Model.oral_care_code)
                {
                    case "AC":
                        if (((Label)FindControl("prt_toilet_use_code_ac")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "AT":
                        if (((Label)FindControl("prt_toilet_use_code_at")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "BU":
                        if (((Label)FindControl("prt_toilet_use_code_bu")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "CA":
                        if (((Label)FindControl("prt_toilet_use_code_ca")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "DI":
                        if (((Label)FindControl("prt_toilet_use_code_di")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "IN":
                        if (((Label)FindControl("prt_toilet_use_code_in")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "UC":
                        if (((Label)FindControl("prt_toilet_use_code_uc")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_dentures_code_binding()
        {
            foreach (var i in IinaDictionary.DENTURES_CODE)
            {
                Model.oral_care_code = i.Key;
                var control = FindControl("prt_dentures_code_" + i.Key);
                (control as Label).Text = "☑";

                switch (Model.oral_care_code)
                {
                    case "P":
                        if (((Label)FindControl("prt_dentures_code_p")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "L":
                        if (((Label)FindControl("prt_dentures_code_l")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "N":
                        if (((Label)FindControl("prt_dentures_code_n")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "U":
                        if (((Label)FindControl("prt_dentures_code_u")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void prt_oral_care_code_binding()
        {
            foreach (var i in IinaDictionary.ORAL_CARE_CODE)
            {
                Model.oral_care_code = i.Key;

                var control = FindControl("prt_oral_care_code_" + i.Key);
                if (control != null)
                {
                    (control as Label).Text = "☑";
                }

                if(i.Key == "OTH")
                {
                    Model.oral_care_note = 3;
                }

                prt_oral_care_note.Text = Convert.ToString(Model.oral_care_note);

                switch (Model.oral_care_code)
                {
                    case "AB":
                        if (((Label)FindControl("prt_oral_care_code_ab")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "PU":
                        if (((Label)FindControl("prt_oral_care_code_pu")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "OC":
                        if (((Label)FindControl("prt_oral_care_code_oc")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        break;
                    case "OTH":
                        if (((Label)FindControl("prt_oral_care_code_oth")).Text != "☑")
                        {
                            throw new Exception();
                        }
                        if(((Label)FindControl("prt_oral_care_note")).Text != Convert.ToString(Model.oral_care_note))
                        {
                            throw new Exception();
                        }
                        break;
                }
            }
        }

        private void bathing_code_binding_to_print()
        {
            foreach (var i in IinaDictionary.BATHING_CODE)
            {
                bathing_code_set_value(i.Key);

                var control = FindControl("prt_bathing_code_" + i.Key);
                if (control != null)
                {
                    (control as Label).Text = "☑";
                }

                bathing_code_set_value_result();
            }
        }

        private void bathing_code_set_value(string code)
        {
            Model.bathing_code = code;
        }
        private void bathing_code_set_value_result()
        {
            switch (Model.bathing_code)
            {
                case "IN":
                    if(((Label)FindControl("prt_bathing_code_in")).Text != "☑")
                    {
                        //throw new Exception();
                    }
                    break;
                case "AS":
                    if (((Label)FindControl("prt_bathing_code_as")).Text != "☑")
                    {
                        //throw new Exception();
                    }
                    break;
                case "DB":
                    if (((Label)FindControl("prt_bathing_code_db")).Text != "☑")
                    {
                        //throw new Exception();
                    }
                    break;
                case "AB":
                    if (((Label)FindControl("prt_bathing_code_ab")).Text != "☑")
                    {
                        //throw new Exception();
                    }
                    break;
            }
            
        }

        #region Events
        //protected void btnComplete_Click(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {

        //        Iina iina = new Iina(varDocID, loc);
        //        iina.status = DocumentStatus.FINAL;

        //        UpdateData(iina);
        //        WebHelpers.clearSessionDoc(Page, varDocID, loc);
        //    }
        //}
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        Iina iina = new Iina(varDocID, loc);
        //        iina.status = DocumentStatus.DRAFT;

        //        UpdateData(iina);
        //    }
        //}
        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        dynamic result = Iina.Delete((string)Session["UserId"], varDocID, loc)[0];

        //        if (result.Status == System.Net.HttpStatusCode.OK)
        //        {
        //            WebHelpers.clearSessionDoc(Page, varDocID, loc);

        //            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}
        //protected void btnAmend_Click(object sender, EventArgs e)
        //{

        //    if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
        //    {
        //        Iina iina = new Iina(varDocID, loc);

        //        WebHelpers.VisibleControl(false, btnAmend, btnPrint);
        //        WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

        //        //load form control
        //        WebHelpers.LoadFormControl(form1, iina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
        //        //binding data
        //        BindingDataFormEdit(iina);
        //        //get access button
        //    }
        //}
        //protected void btnCancel_Click(object sender, EventArgs e)
        //{
        //    Initial();
        //    WebHelpers.clearSessionDoc(Page, varDocID, loc);
        //}
        //protected void btnPrint_Click(object sender, EventArgs e)
        //{
        //    Iina iina = new Iina(varDocID, loc);
        //    BindingDataFormPrint(iina);
        //    WebHelpers.AddJS(Page, "btnPrint_Click()");
        //}
        #endregion
        protected void btn_grid_skin_anno_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_skin_anno.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_skin_anno.ID], grid_skin_anno, IinaDictionary.SKIN_ANNO);
        }
        protected void grid_skin_anno_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        public override void BindingControlToModel()
        {
            Model.residence_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_residence_code_", IinaDictionary.RESIDENCE_CODE);
            Model.residence_desc = WebHelpers.GetDicDesc(Model.residence_code, IinaDictionary.RESIDENCE_CODE);

            Model.residence_other = txt_residence_other.Value;
            //
            Model.language_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_language_code_", IinaDictionary.LANGUAGE_CODE);
            Model.language_desc = WebHelpers.GetDicDesc(Model.language_code, IinaDictionary.LANGUAGE_CODE);
            Model.language_other = txt_language_other.Value;
            //
            Model.req_interpreter = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_interpreter_");
            //
            Model.religion_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_religion_code_", IinaDictionary.RELIGION_CODE);
            Model.religion_desc = WebHelpers.GetDicDesc(Model.religion_code, IinaDictionary.RELIGION_CODE);
            Model.religion_other = txt_religion_other.Value;
            //
            Model.spiritual_couns = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spiritual_couns_");
            //
            Model.occupation = txt_occupation.Value;
            //
            Model.living_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_living_status_code_", IinaDictionary.LIVING_STATUS_CODE);
            Model.living_status_desc = WebHelpers.GetDicDesc(Model.living_status_code, IinaDictionary.LIVING_STATUS_CODE);
            Model.living_status_note = txt_living_status_note.Value;
            //
            Model.hospital_concern_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_hospital_concern_code_", IinaDictionary.HOSPITAL_CONCERN_CODE);
            Model.hospital_concern_desc = WebHelpers.GetDicDesc(Model.hospital_concern_code, IinaDictionary.HOSPITAL_CONCERN_CODE);
            Model.hospital_concern_other = txt_hospital_concern_other.Value;
            //
            Model.accompanied = txt_accompanied.Value;
            //
            Model.relationship = txt_relationship.Value;
            //checked
            //B. BỆNH SỬ/ MEDICAL HISTORY
            Model.admit_from_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_admit_from_code_", IinaDictionary.ADMIT_FROM_CODE);
            Model.admit_from_desc = WebHelpers.GetDicDesc(Model.admit_from_code, IinaDictionary.ADMIT_FROM_CODE);

            if (Model.admit_from_code == "OTH") Model.admit_from_other = txt_admit_from_other.Value;

            Model.arrived = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_arrived_code_", IinaDictionary.ARRIVED);
            //
            Model.admission_reason = txt_admission_reason.Value;
            //
            //Model.previous_admission = txt_previous_admission.Value;
            //
            Model.past_med_history = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_past_med_history_");
            Model.past_med_history_note = txt_past_med_history_note.Value;
            //
            Model.past_sur_history = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_past_sur_history_");
            Model.past_sur_history_note = txt_past_sur_history_note.Value;
            //
            Model.substance_abuse = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_substance_abuse_", IinaDictionary.SUBSTANCE_ABUSE);
            Model.substance_abuse_other = txt_substance_abuse_other.Value;
            //
            Model.previous_document = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_previous_document_");
            Model.previous_document_note = txt_previous_document_note.Value;
            //
            Model.cur_home_medication = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cur_home_medication_");
            //
            Model.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
            Model.allergy_note = txt_allergy_note.Value;
            //
            Model.high_risk_patient = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_high_risk_patient_", IinaDictionary.HIGH_RISK_PATIENT_CODE);
            //C
            //1
            Model.vs_temperature = txt_vs_temperature.Value;
            Model.vs_heart_rate = txt_vs_heart_rate.Value;
            Model.vs_weight = txt_vs_weight.Value;
            Model.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            Model.vs_height = txt_vs_height.Value;
            Model.vs_blood_pressure = txt_vs_blood_pressure.Value;
            Model.vs_BMI = txt_vs_bmi.Value;
            Model.vs_spO2 = txt_vs_spO2.Value;
            //Model.vs_pulse = txt_vs_pulse.Value;
            //2
            Model.respiratory_system = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_respiratory_system_", IinaDictionary.RESPIRATORY_SYSTEM_CODE);
            Model.cough = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cough_");
            Model.pro_cough = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_pro_cough_");
            Model.pro_cough_note = txt_pro_cough_note.Value;
            //3
            Model.pulse_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_pulse_code_", IinaDictionary.PULSE_CODE);
            Model.pulse_desc = WebHelpers.GetDicDesc(Model.pulse_code, IinaDictionary.PULSE_CODE);

            Model.presence = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_presence_", IinaDictionary.PRESENCE_CODE);
            Model.extremities = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_extremities_", IinaDictionary.EXTREMITIES_CODE);
            //4 - passed
            Model.oriented = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_oriented_", IinaDictionary.ORIENTED_CODE);
            Model.mental_status = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_mental_status_", IinaDictionary.MENTAL_STATUS_CODE);
            Model.mental_status_other = txt_mental_status_other.Value;

            Model.hearing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_hearing_code_", IinaDictionary.HEARING_CODE);
            Model.hearing_desc = WebHelpers.GetDicDesc(Model.hearing_code, IinaDictionary.HEARING_CODE);

            Model.vision_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_vision_code_", IinaDictionary.VISION_CODE);
            Model.vision_desc = WebHelpers.GetDicDesc(Model.vision_code, IinaDictionary.VISION_CODE);
            Model.vision_other = txt_vision_other.Value;

            Model.speech_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_speech_code_", IinaDictionary.SPEECH_CODE);
            Model.speech_desc = WebHelpers.GetDicDesc(Model.speech_code, IinaDictionary.SPEECH_CODE);
            //5 - passed
            Model.diet_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_diet_code_", IinaDictionary.DIET_CODE);
            Model.diet_desc = WebHelpers.GetDicDesc(Model.diet_code, IinaDictionary.DIET_CODE);
            Model.diet_other = txt_diet_other.Value;
            Model.diet_pre_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_diet_pre_code_", IinaDictionary.DIET_PRE_CODE);
            Model.diet_pre_desc = WebHelpers.GetDicDesc(Model.diet_pre_code, IinaDictionary.DIET_PRE_CODE);

            Model.ng_tube = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ng_tube_");
            Model.gastrostomy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_gastrostomy_", true);
            Model.size = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_size_", true);
            Model.size_note = txt_size_note.Value;
            Model.last_date_changed = DataHelpers.ConvertSQLDateTime(dpk_last_date_changed.SelectedDate);
            Model.food_dislike = txt_food_dislike.Value;

            Model.bowel_elimination_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bowel_elimination_code_", IinaDictionary.BOWEL_ELIMINATION_CODE);
            Model.bowel_elimination_desc = WebHelpers.GetDicDesc(Model.bowel_elimination_code, IinaDictionary.BOWEL_ELIMINATION_CODE);

            Model.stool_consistency_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_stool_consistency_code_", IinaDictionary.STOOL_CONSISTENCY_CODE);
            if (Model.stool_consistency_code != null) Model.stool_consistency_desc = IinaDictionary.STOOL_CONSISTENCY_CODE[Model.stool_consistency_code];

            Model.gas_presence_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gas_presence_code_", IinaDictionary.GAS_PRESENCE_CODE);
            Model.gas_presence_desc = WebHelpers.GetDicDesc(Model.gas_presence_code, IinaDictionary.GAS_PRESENCE_CODE);
            //6
            Model.bmi_out_range = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bmi_out_range_");
            Model.loss_weight = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_loss_weight_");
            Model.reduce_dietary = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_reduce_dietary_");
            Model.severely_ill = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_severely_ill_");
            //table 2
            Model.nutrition_normal = cb_nutrition_normal_true.Checked;
            Model.nutrition_score1 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_", IinaDictionary.NUTRITION_SCORE1_CODE);
            Model.nutrition_score2 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score2_", IinaDictionary.NUTRITION_SCORE2_CODE);
            Model.nutrition_score3 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score3_", IinaDictionary.NUTRITION_SCORE3_CODE);
            Model.nutrition_score = nutrition_score.Text;
            //
            // mising Điểm = 0 / Score = 0
            Model.normal_nutrition_req = cb_normal_nutrition_req_true.Checked;
            Model.severity_score1 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score1_", IinaDictionary.SEVERITY_SCORE1_CODE);
            Model.severity_score2 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score2_", IinaDictionary.SEVERITY_SCORE2_CODE);
            Model.severity_score3 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score3_", IinaDictionary.SEVERITY_SCORE3_CODE);
            Model.severity_score = severity_score.Text;
            //Age
            Model.younger_70 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_younger_70_", true);
            Model.older_70 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_older_70_", true);
            Model.age_score = age_score.Text;
            Model.total_nutri_score = total_nutri_score.Text;

            //7
            Model.urination = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_urination_", IinaDictionary.URINATION_CODE);
            Model.inter_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_inter_catheter_", true);
            Model.inter_catheter_note = txt_inter_catheter_note.Value;

            Model.ind_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_ind_catheter_", true);
            Model.ind_catheter_size = txt_ind_catheter_size.Value;
            Model.ind_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_ind_catheter_date.SelectedDate);

            Model.sup_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_sup_catheter_", true);
            Model.sup_catheter_size = txt_sup_catheter_size.Value;
            Model.last_sup_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_last_sup_catheter_date.SelectedDate);

            Model.menstruation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_menstruation_code_", IinaDictionary.MENSTRUATION_CODE);
            Model.menstruation_desc = WebHelpers.GetDicDesc(Model.menstruation_code, IinaDictionary.MENSTRUATION_CODE);

            Model.cycle_day = txt_cycle_day.Value;
            Model.last_mens_period = txt_last_mens_period.Value;

            Model.not_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_not_pregnancy_", true);
            Model.pre_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_pre_pregnancy_", true);
            Model.para = txt_para.Value;
            Model.cur_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_cur_pregnancy_", true);
            Model.pregnancy_week = txt_pregnancy_week.Value;

            Model.contraception_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_contraception_code_", IinaDictionary.CONTRACEPTION_CODE);
            Model.contraception_desc = WebHelpers.GetDicDesc(Model.contraception_code, IinaDictionary.CONTRACEPTION_CODE);
            Model.contraception_other = txt_contraception_other.Value;

            //8 - Passed
            Model.mus_history = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_mus_history_", IinaDictionary.MUS_HISTORY);

            Model.paralysis = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_paralysis_", true);
            Model.paralysis_note = txt_paralysis_note.Value;

            Model.amputation = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_amputation_", true);
            Model.amputation_note = txt_amputation_note.Value;

            Model.contracture = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_contracture_", true);
            Model.contracture_note = txt_contracture_note.Value;

            Model.prosthesis = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_prosthesis_", true);
            Model.prosthesis_note = txt_prosthesis_note.Value;

            //9 - Passed
            Model.cur_in_pain = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cur_in_pain_");
            Model.p_location_1 = txt_p_location_1.Value;
            Model.p_location_2 = txt_p_location_2.Value;
            Model.p_location_3 = txt_p_location_3.Value;

            Model.q_location_1 = txt_q_location_1.Value;
            Model.q_location_2 = txt_q_location_2.Value;
            Model.q_location_3 = txt_q_location_3.Value;

            Model.r_location_1 = txt_r_location_1.Value;
            Model.r_location_2 = txt_r_location_2.Value;
            Model.r_location_3 = txt_r_location_3.Value;

            Model.s_location_1 = txt_s_location_1.Value;
            Model.s_location_2 = txt_s_location_2.Value;
            Model.s_location_3 = txt_s_location_3.Value;

            Model.t_location_1 = txt_t_location_1.Value;
            Model.t_location_2 = txt_t_location_2.Value;
            Model.t_location_3 = txt_t_location_3.Value;

            Model.using_pain_killer = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_using_pain_killer_");
            Model.pain_killer_name = txt_pain_killer_name.Value;
            Model.pa_comment = txt_pa_comment.Value;
            //10 - Passed
            Model.condition = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_condition_", IinaDictionary.CONDITION_CODE);

            Model.wounds = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_wounds_", IinaDictionary.WOUNDS_CODE);

            Model.skin_anno = WebHelpers.GetDataGridView(grid_skin_anno, IinaDictionary.SKIN_ANNO);

            Model.sensory_code = Request.Form.Get("select_sensory_code");
            Model.sensory_desc = WebHelpers.GetDicDesc(Model.sensory_code, IinaDictionary.SENSORY_CODE);

            Model.moisture_code = Request.Form.Get("select_moisture_code");
            Model.moisture_desc = WebHelpers.GetDicDesc(Model.moisture_code, IinaDictionary.MOISTURE_CODE);

            Model.activity_code = Request.Form.Get("select_activity_code");
            Model.activity_desc = WebHelpers.GetDicDesc(Model.activity_code, IinaDictionary.ACTIVITY_CODE);

            Model.mobility_code = Request.Form.Get("select_mobility_code");
            Model.mobility_desc = WebHelpers.GetDicDesc(Model.mobility_code, IinaDictionary.MOBILITY_CODE);

            Model.nutrition_code = Request.Form.Get("select_nutrition_code");
            Model.nutrition_desc = WebHelpers.GetDicDesc(Model.nutrition_code, IinaDictionary.NUTRITION_CODE);

            Model.friction_code = Request.Form.Get("select_friction_code");
            Model.friction_desc = WebHelpers.GetDicDesc(Model.friction_code, IinaDictionary.FRICTION_CODE);

            Model.total_score = Convert.ToString(GetTotalScore());

            //
            Model.pres_sore_risk_code = GetPresSoreRiskCode(int.Parse(Model.total_score));
            Model.pres_sore_risk_desc = WebHelpers.GetDicDesc(Model.pres_sore_risk_code, IinaDictionary.PRES_SORE_RISK_CODE);

            Model.preven_action = txt_preven_action.Value;
            //11 - Passed
            Model.bathing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bathing_code_", IinaDictionary.BATHING_CODE);
            Model.bathing_desc = WebHelpers.GetDicDesc(Model.bathing_code, IinaDictionary.BATHING_CODE);

            Model.oral_care_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_oral_care_code_", IinaDictionary.ORAL_CARE_CODE);
            Model.oral_care_desc = WebHelpers.GetDicDesc(Model.oral_care_code, IinaDictionary.ORAL_CARE_CODE);
            Model.oral_care_note = txt_oral_care_note.Value;

            Model.dentures_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_dentures_code_", IinaDictionary.DENTURES_CODE);
            Model.dentures_desc = WebHelpers.GetDicDesc(Model.dentures_code, IinaDictionary.DENTURES_CODE);

            Model.toilet_use_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_toilet_use_code_", IinaDictionary.TOILET_USE_CODE);
            Model.toilet_use_desc = WebHelpers.GetDicDesc(Model.toilet_use_code, IinaDictionary.TOILET_USE_CODE);

            Model.dressing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_dressing_code_", IinaDictionary.DRESSING_CODE);
            Model.dressing_desc = WebHelpers.GetDicDesc(Model.dressing_code, IinaDictionary.DRESSING_CODE);

            Model.eating_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_eating_code_", IinaDictionary.EATING_CODE);
            Model.eating_desc = WebHelpers.GetDicDesc(Model.eating_code, IinaDictionary.EATING_CODE);

            Model.turning_bed_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_turning_bed_code_", IinaDictionary.TURNING_BED_CODE);
            Model.turning_bed_desc = WebHelpers.GetDicDesc(Model.turning_bed_code, IinaDictionary.TURNING_BED_CODE);

            Model.ambulation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ambulation_code_", IinaDictionary.AMBULATION_CODE);
            Model.ambulation_desc = WebHelpers.GetDicDesc(Model.ambulation_code, IinaDictionary.AMBULATION_CODE);

            Model.ambulation_note = txt_ambulation_note.Value;

            Model.sleep_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_sleep_code_", IinaDictionary.SLEEP_CODE);
            Model.sleep_desc = WebHelpers.GetDicDesc(Model.sleep_code, IinaDictionary.SLEEP_CODE);

            Model.medication_used = txt_medication_used.Value;
            //12
            Model.fall_history_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_history_code_", IinaDictionary.FALL_HISTORY_CODE);
            Model.fall_history_desc = WebHelpers.GetDicDesc(Model.fall_history_code, IinaDictionary.FALL_HISTORY_CODE);

            Model.secon_diagnosis_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_secon_diagnosis_code_", IinaDictionary.SECON_DIAGNOSIS_CODE);
            Model.secon_diagnosis_desc = WebHelpers.GetDicDesc(Model.secon_diagnosis_code, IinaDictionary.SECON_DIAGNOSIS_CODE);

            Model.ambula_aids_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ambula_aids_code_", IinaDictionary.AMBULA_AIDS_CODE);
            Model.ambula_aids_desc = WebHelpers.GetDicDesc(Model.ambula_aids_code, IinaDictionary.AMBULA_AIDS_CODE);

            Model.intra_therapy_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_intra_therapy_code_", IinaDictionary.INTRA_THERAPY_CODE);
            Model.intra_therapy_desc = WebHelpers.GetDicDesc(Model.intra_therapy_code, IinaDictionary.INTRA_THERAPY_CODE);

            Model.gait_trans_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gait_trans_code_", IinaDictionary.GAIT_TRANS_CODE);
            Model.gait_trans_desc = WebHelpers.GetDicDesc(Model.gait_trans_code, IinaDictionary.GAIT_TRANS_CODE);

            Model.fr_mental_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fr_mental_status_code_", IinaDictionary.FR_MENTAL_STATUS_CODE);
            Model.fr_mental_status_desc = WebHelpers.GetDicDesc(Model.fr_mental_status_code, IinaDictionary.FR_MENTAL_STATUS_CODE);

            Model.fr_total_score = fr_total_score.Text;
            //D
            Model.involvement = FindHtmlInputRadioButton(nameof(Model.involvement)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_involvement_");
            Model.req_med_equipment = FindHtmlInputRadioButton(nameof(Model.req_med_equipment)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_med_equipment_");
            Model.req_foll_care = FindHtmlInputRadioButton(nameof(Model.req_foll_care)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_foll_care_");
            Model.suicidal_referral = FindHtmlInputRadioButton(nameof(Model.suicidal_referral)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_suicidal_referral_");
            Model.alone_reduce_functional = FindHtmlInputRadioButton(nameof(Model.alone_reduce_functional)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_alone_reduce_functional_");
            Model.ref_physiotherapist = FindHtmlInputRadioButton(nameof(Model.ref_physiotherapist)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_physiotherapist_");
            Model.ref_speech_therapist = FindHtmlInputRadioButton(nameof(Model.ref_speech_therapist)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_speech_therapist_");
            Model.ref_dietician = FindHtmlInputRadioButton(nameof(Model.ref_dietician)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_dietician_");
            Model.ref_psychologist = FindHtmlInputRadioButton(nameof(Model.ref_psychologist)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_psychologist_");
            Model.ref_other_hospital = FindHtmlInputRadioButton(nameof(Model.ref_other_hospital)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_other_hospital_");
            Model.support_at_home = FindHtmlInputRadioButton(nameof(Model.support_at_home)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_support_at_home_");
            Model.req_transportation = FindHtmlInputRadioButton(nameof(Model.req_transportation)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_transportation_");
            Model.stairs_climb_home = FindHtmlInputRadioButton(nameof(Model.stairs_climb_home)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_stairs_climb_home_");
            Model.dis_planning = txt_dis_planning.Value;
            Model.dis_management = txt_dis_management.Value;
            Model.assess_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assess_date_time.SelectedDate);

            Model.pain_annotation = "{\"dataURI\":\"" + pain_annotation_base64.Value + "\"}";

            Model.skin_anno_data = "{\"dataURI\":\"" + skin_anno_data_base64.Value + "\"}";

            //if (JsonConvert.SerializeObject(iina) == DataObj.Value)
            //{
            //    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
            //}

            Model.amend_reason = txt_amend_reason.Text;
        }
        #region METHODS
        //public void Initial()
        //{
        //    try
        //    {
        //        patientInfo = new PatientInfo(varPID);
        //        patientVisitInfo = new PatientVisitInfo(varPVID, loc);

        //        if (varDocIdLog != null)
        //        {
        //            iina = new Iina(varDocIdLog, true, loc);
        //            currentLog.Visible = true;
        //        }
        //        else
        //        {
        //            iina = new Iina(varDocID, loc);
        //            currentLog.Visible = false;
        //        }

        //        LoadPatientInfo();
        //        //loadRadGridHistoryLog();

        //        RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Iina.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
        //        SignatureDate = _SignatureDate;
        //        SignatureName = _SignatureName;

        //        WebHelpers.setBmi(bmiStr, iina.vs_BMI);

        //        iina.pain_annotation = WebHelpers.getPainAnnotation(iina.pain_annotation);

        //        iina.skin_anno_data = WebHelpers.getSkinAnnoData(iina.skin_anno_data);

        //        WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

        //        if (iina.status == DocumentStatus.FINAL)
        //        {
        //            BindingDataForm(iina, WebHelpers.LoadFormControl(form1, iina, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
        //            lblPid.Text = varVPID;
        //        }
        //        else if (iina.status == DocumentStatus.DRAFT)
        //        {
        //            BindingDataForm(iina, WebHelpers.LoadFormControl(form1, iina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
        //        }

        //        //WebHelpers.getAccessButtons(form1, iina.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

        //        final_screening_field.Visible = ShowFinalScreening(iina);

        //        WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
        //        {
        //            Form = form1,
        //            DocStatus = iina.status,
        //            AccessGroup = (string)Session["group_access"],
        //            AccessAuthorize = (string)Session["access_authorize"],
        //            IsSameCompanyCode = loc == locChanged,
        //            IsViewLog = varDocIdLog != null
        //        });
        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}
        //private void LoadPatientInfo()
        //{
        //    lblFirstName.Text = patientInfo.first_name_l;
        //    lblLastName.Text = patientInfo.last_name_l;
        //    lblGender.Text = patientInfo.gender_l;

        //    WebHelpers.ConvertDateTime(patientInfo.DOB, out bool isValid, out string DOB, "dd-MM-yyyy");
        //    lblDoB.Text = DOB + " (" + patientInfo.Age + "t)";

        //    lblPatientAddress.Text = patientInfo.Address;
        //    lblContactPerson.Text = patientInfo.Contact;

        //    lblVisitCode.Text = patientVisitInfo.VisitCode;

        //    WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
        //    lblVisitDate.Text = ActualVisitDateTime;
        //}

        //protected string GetLogUrl(object doc_log_id)
        //{
        //    return PAGE_URL + $"&docIdLog={doc_log_id}";
        //}
        //protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        //{
        //    (sender as HyperLink).NavigateUrl = PAGE_URL;
        //}
        //protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        //{
        //    string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
        //    return result;
        //}
        //protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        //{
        //    GridDataItem item = (e.Item as GridDataItem);
        //    if (e.CommandName.Equals("Open"))
        //    {
        //        string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

        //        string url = $"/IPD/InpIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&docIdLog={doc_log_id}";

        //        Response.Redirect(url);
        //    }
        //}
        //protected void RadButton1_Click(object sender, EventArgs e)
        //{
        //    string url = $"/IPD/InpIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";
        //    Response.Redirect(url);
        //}
        private bool ShowFinalScreening(IinaRV05 iina)
        {
            if (iina.bmi_out_range != null) { if (iina.bmi_out_range) return true; }
            if (iina.loss_weight != null) { if (iina.loss_weight) return true; }
            if (iina.reduce_dietary != null) { if (iina.reduce_dietary) return true; }
            if (iina.severely_ill != null) { if (iina.severely_ill) return true; }
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
            int nutritionScore = string.IsNullOrEmpty(nutrition_score.Text) ? 0 : int.Parse(nutrition_score.Text);
            int severityScore = string.IsNullOrEmpty(severity_score.Text) ? 0 : int.Parse(severity_score.Text);
            int ageScore = string.IsNullOrEmpty(age_score.Text) ? 0 : int.Parse(age_score.Text);
            int total = nutritionScore + severityScore + ageScore;
            total_nutri_score.Text = Convert.ToString(total);
        }
        public override void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "initial_screening_change":
                    initial_screening_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                    break;
                case "nutrition_status_change":
                    nutrition_status_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                    break;
                case "severity_of_disease_change":
                    severity_of_disease_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                    break;
                case "age_change":
                    age_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                    break;
                case "total_score_change":
                    total_score_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                    break;
                case "fr_total_score_change":
                    fr_total_score_change(Convert.ToString(Request["__EVENTARGUMENT"]));
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

            pres_sore_risk_desc.Text = IinaDictionary.PRES_SORE_RISK_CODE[GetPresSoreRiskCode(totalScore)];

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
                Console.WriteLine(ex.Message);
            }
        }
        protected void severity_of_disease_change(string v)
        {
            int score = 0;

            try
            {
                if (cb_severity_score1_1.Checked || cb_severity_score1_2.Checked || cb_severity_score1_3.Checked || cb_severity_score1_4.Checked)
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
                Console.WriteLine(ex.Message);
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

    }
}
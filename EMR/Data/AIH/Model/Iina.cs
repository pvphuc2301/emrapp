using EMR.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Model
{
    public class IinaRV05 : EmrDocument
    {
        public IinaRV05()
        {
        }
        public IinaRV05(string document_id, string location) : base(document_id, location)
        {
        }
        public IinaRV05(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }
        #region Properties
        public dynamic residence_code { get; set; }
        public dynamic residence_desc { get; set; }
        public dynamic residence_other { get; set; }
        public dynamic language_code { get; set; }
        public dynamic language_desc { get; set; }
        public dynamic language_other { get; set; }
        public bool? req_interpreter { get; set; }
        public dynamic religion_code { get; set; }
        public dynamic religion_desc { get; set; }
        public dynamic religion_other { get; set; }
        public dynamic spiritual_couns { get; set; }
        public dynamic occupation { get; set; }
        public dynamic living_status_code { get; set; }
        public dynamic living_status_desc { get; set; }
        public dynamic living_status_note { get; set; }
        public dynamic hospital_concern_code { get; set; }
        public dynamic hospital_concern_desc { get; set; }
        public dynamic hospital_concern_other { get; set; }
        public dynamic accompanied { get; set; }
        public dynamic relationship { get; set; }
        public dynamic admit_from_code { get; set; }
        public dynamic admit_from_desc { get; set; }
        public dynamic admit_from_other { get; set; }
        public dynamic arrived { get; set; }
        public dynamic admission_reason { get; set; }
        public dynamic previous_admission { get; set; }
        public dynamic past_med_history { get; set; }
        public dynamic past_med_history_note { get; set; }
        public dynamic past_sur_history { get; set; }
        public dynamic past_sur_history_note { get; set; }
        public dynamic substance_abuse { get; set; }
        public dynamic substance_abuse_other { get; set; }
        public dynamic previous_document { get; set; }
        public dynamic previous_document_note { get; set; }
        public dynamic cur_home_medication { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_note { get; set; }
        public dynamic high_risk_patient { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic respiratory_system { get; set; }
        public dynamic cough { get; set; }
        public dynamic pro_cough { get; set; }
        public dynamic pro_cough_note { get; set; }
        public dynamic pulse_code { get; set; }
        public dynamic pulse_desc { get; set; }
        public dynamic presence { get; set; }
        public dynamic extremities { get; set; }
        public dynamic oriented { get; set; }
        public dynamic mental_status { get; set; }
        public dynamic mental_status_other { get; set; }
        public dynamic hearing_code { get; set; }
        public dynamic hearing_desc { get; set; }
        public dynamic vision_code { get; set; }
        public dynamic vision_desc { get; set; }
        public dynamic vision_other { get; set; }
        public dynamic speech_code { get; set; }
        public dynamic speech_desc { get; set; }
        public dynamic diet_code { get; set; }
        public dynamic diet_desc { get; set; }
        public dynamic diet_other { get; set; }
        public dynamic diet_pre_code { get; set; }
        public dynamic diet_pre_desc { get; set; }
        public dynamic ng_tube { get; set; }
        public dynamic gastrostomy { get; set; }
        public dynamic size { get; set; }
        public dynamic size_note { get; set; }
        public dynamic last_date_changed { get; set; }
        public dynamic food_dislike { get; set; }
        public dynamic bowel_elimination_code { get; set; }
        public dynamic bowel_elimination_desc { get; set; }
        public dynamic stool_consistency_code { get; set; }
        public dynamic stool_consistency_desc { get; set; }
        public dynamic gas_presence_code { get; set; }
        public dynamic gas_presence_desc { get; set; }
        public dynamic bmi_out_range { get; set; }
        public dynamic loss_weight { get; set; }
        public dynamic reduce_dietary { get; set; }
        public dynamic severely_ill { get; set; }
        public dynamic nutrition_normal { get; set; }
        public dynamic nutrition_score1 { get; set; }
        public dynamic nutrition_score2 { get; set; }
        public dynamic nutrition_score3 { get; set; }
        public dynamic nutrition_score { get; set; }
        public bool? normal_nutrition_req { get; set; }
        public dynamic severity_score1 { get; set; }
        public dynamic severity_score2 { get; set; }
        public dynamic severity_score3 { get; set; }
        public dynamic severity_score { get; set; }
        public dynamic younger_70 { get; set; }
        public dynamic older_70 { get; set; }
        public dynamic age_score { get; set; }
        public dynamic total_nutri_score { get; set; }
        public dynamic urination { get; set; }
        public dynamic inter_catheter { get; set; }
        public dynamic inter_catheter_note { get; set; }
        public dynamic ind_catheter { get; set; }
        public dynamic ind_catheter_size { get; set; }
        public dynamic ind_catheter_date { get; set; }
        public dynamic sup_catheter { get; set; }
        public dynamic sup_catheter_size { get; set; }
        public dynamic last_sup_catheter_date { get; set; }
        public dynamic menstruation_code { get; set; }
        public dynamic menstruation_desc { get; set; }
        public dynamic cycle_day { get; set; }
        public dynamic last_mens_period { get; set; }
        public dynamic not_pregnancy { get; set; }
        public dynamic pre_pregnancy { get; set; }
        public dynamic para { get; set; }
        public dynamic cur_pregnancy { get; set; }
        public dynamic pregnancy_week { get; set; }
        public dynamic contraception_code { get; set; }
        public dynamic contraception_desc { get; set; }
        public dynamic contraception_other { get; set; }
        public dynamic mus_history { get; set; }
        public dynamic paralysis { get; set; }
        public dynamic paralysis_note { get; set; }
        public dynamic amputation { get; set; }
        public dynamic amputation_note { get; set; }
        public dynamic contracture { get; set; }
        public dynamic contracture_note { get; set; }
        public dynamic prosthesis { get; set; }
        public dynamic prosthesis_note { get; set; }
        public dynamic cur_in_pain { get; set; }
        public dynamic p_location_1 { get; set; }
        public dynamic p_location_2 { get; set; }
        public dynamic p_location_3 { get; set; }
        public dynamic q_location_1 { get; set; }
        public dynamic q_location_2 { get; set; }
        public dynamic q_location_3 { get; set; }
        public dynamic r_location_1 { get; set; }
        public dynamic r_location_2 { get; set; }
        public dynamic r_location_3 { get; set; }
        public dynamic s_location_1 { get; set; }
        public dynamic s_location_2 { get; set; }
        public dynamic s_location_3 { get; set; }
        public dynamic t_location_1 { get; set; }
        public dynamic t_location_2 { get; set; }
        public dynamic t_location_3 { get; set; }
        public dynamic pain_annotation { get; set; }
        public dynamic using_pain_killer { get; set; }
        public dynamic pain_killer_name { get; set; }
        public dynamic pa_comment { get; set; }
        public dynamic condition { get; set; }
        public dynamic wounds { get; set; }
        public dynamic skin_anno { get; set; }
        public dynamic skin_anno_data { get; set; }
        public dynamic sensory_code { get; set; }
        public dynamic sensory_desc { get; set; }
        public dynamic moisture_code { get; set; }
        public dynamic moisture_desc { get; set; }
        public dynamic activity_code { get; set; }
        public dynamic activity_desc { get; set; }
        public dynamic mobility_code { get; set; }
        public dynamic mobility_desc { get; set; }
        public dynamic nutrition_code { get; set; }
        public dynamic nutrition_desc { get; set; }
        public dynamic friction_code { get; set; }
        public dynamic friction_desc { get; set; }
        public dynamic total_score { get; set; }
        public dynamic pres_sore_risk_code { get; set; }
        public dynamic pres_sore_risk_desc { get; set; }
        public dynamic preven_action { get; set; }
        public dynamic bathing_code { get; set; }
        public dynamic bathing_desc { get; set; }
        public dynamic oral_care_code { get; set; }
        public dynamic oral_care_desc { get; set; }
        public dynamic oral_care_note { get; set; }
        public dynamic dentures_code { get; set; }
        public dynamic dentures_desc { get; set; }
        public dynamic toilet_use_code { get; set; }
        public dynamic toilet_use_desc { get; set; }
        public dynamic dressing_code { get; set; }
        public dynamic dressing_desc { get; set; }
        public dynamic eating_code { get; set; }
        public dynamic eating_desc { get; set; }
        public dynamic turning_bed_code { get; set; }
        public dynamic turning_bed_desc { get; set; }
        public dynamic ambulation_code { get; set; }
        public dynamic ambulation_desc { get; set; }
        public dynamic ambulation_note { get; set; }
        public dynamic sleep_code { get; set; }
        public dynamic sleep_desc { get; set; }
        public dynamic medication_used { get; set; }
        public dynamic fall_history_code { get; set; }
        public dynamic fall_history_desc { get; set; }
        public dynamic secon_diagnosis_code { get; set; }
        public dynamic secon_diagnosis_desc { get; set; }
        public dynamic ambula_aids_code { get; set; }
        public dynamic ambula_aids_desc { get; set; }
        public dynamic intra_therapy_code { get; set; }
        public dynamic intra_therapy_desc { get; set; }
        public dynamic gait_trans_code { get; set; }
        public dynamic gait_trans_desc { get; set; }
        public dynamic fr_mental_status_code { get; set; }
        public dynamic fr_mental_status_desc { get; set; }
        public dynamic fr_total_score { get; set; }
        public dynamic involvement { get; set; }
        public dynamic req_med_equipment { get; set; }
        public dynamic req_foll_care { get; set; }
        public dynamic suicidal_referral { get; set; }
        public dynamic alone_reduce_functional { get; set; }
        public dynamic ref_physiotherapist { get; set; }
        public dynamic ref_speech_therapist { get; set; }
        public dynamic ref_dietician { get; set; }
        public dynamic ref_psychologist { get; set; }
        public dynamic ref_other_hospital { get; set; }
        public dynamic support_at_home { get; set; }
        public dynamic req_transportation { get; set; }
        public dynamic stairs_climb_home { get; set; }
        public dynamic dis_planning { get; set; }
        public dynamic dis_management { get; set; }
        public dynamic assess_date_time { get; set; }
        public override string api => "api/iina";

        protected override void DefaultDocument()
        {
        }
        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace EMR
{

    public class EMRClass
    {
    }

    public static class ControlStatus
    {
        public static string Hidden = "hidden";
        public static string View = "view";
        public static string Edit = "edit";
    }

    public static class ControlType
    {
        public static string HtmlInputText = "HtmlInputText";
        public static string HtmlInputRadioButton = "HtmlInputRadioButton";
        public static string HtmlButton = "HtmlButton";
        public static string RadDatePicker = "RadDatePicker";
        public static string RadTimePicker = "RadTimePicker";
        
    }

    public static class DocumentStatus
    {
        public static string DRAFT = "DRAFT";
        public static string FINAL = "FINAL";
    }

    public static class DocumentCode
    {
        public class LocAVPU
        {
            public static class A { public static string code = "A"; public static string desc = "Tỉnh/A-Alert"; }
            public static class P { public static string code = "P"; public static string desc = "Đau/P-Pain"; }
            public static class U { public static string code = "U"; public static string desc = "Không đáp ứng/U- Unresponsive"; }
            public static class V { public static string code = "V"; public static string desc = "Lời nói/V-Verbal"; }
        }
        public static Dictionary<string, string> GeneralAppearance = new Dictionary<string, string>()
        {
            { "P", "Hồng hào/ Pink" },
            { "T", "Tái/ Pallor" },
            { "C", "Tím/ Cyanosis" },
        };
        public static Dictionary<string, string> SkinIntegrity = new Dictionary<string, string>()
        {
            { "A", "Trầy xước/Abrasion (A)" },
            { "B", "Bỏng/Burn (B)" },
            { "D", "Biến dạng/Deformity (D)" },
            { "H", "Loét/ Ulceration (U)" },
            { "L", "Rách da/Laceration (L)" },
            { "S", "Bong gân Sprain/ Căng cơ Strain (S)" },
        };
        public static Dictionary<string, string> ComDisSrc = new Dictionary<string, string>()
        {
            { "F", "Sốt/Fever" },
            { "R", "Nổi mẩn/Rash" },
            { "T", "Đi khỏi Việt Nam trong vòng 15 ngày gần đây/Travel outside Vietnam in recent 15 days" },
            { "S", "Đau họng/ Sore throat" },
            { "C", "Ho/Cough" },
        };
        public static Dictionary<string, string> DischargePlan = new Dictionary<string, string>()
        {
            { "RA", "Cần trợ  giúp sinh hoạt hàng ngày/ Require assistance with daily living" },
            { "LA", "Sống một mình/ Live alone" },
            { "HF", "Nguy cơ ngã cao/ High falling risk" },
        };
        public static Dictionary<string, string> TriageCode = new Dictionary<string, string>()
        {
            { "1", "1-Hồi sức/ Resuscitation" },
            { "2", "2-Cấp cứu/ Emergent" },
            { "3", "3-Khẩn trương/ Urgent" },
            { "4", "4- Trì hoãn/ Less urgent" },
            { "5", "5- Không cấp cứu/ Nonurgent" },
        };
        public static Dictionary<string, string> Respiratory = new Dictionary<string, string>()
        {
            { "REG", "Thở đều/Regular" },
            { "NRE", "Thở không đều/Regular" },
            { "TAC", "Thở nhanh/Tachypneic" },
            { "COU", "Ho/Cough" },
            { "SPU", "Có đàm/Sputum" },
            { "LAB", "Thở gắng sức/Labored" },
            { "SHA", "Thở nông/Shallow" },
            { "RET", "Co kéo/Retractions" },
        };
    }

    public static class EMRTable
    {
        public static Dictionary<string, string> assessmentSystem = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "" },
            { "rrlp", "" },
            { "o2sat", "" },
            { "hr", "" },
            { "bp", "" },
            { "temp", "" },
            { "gcs", "" },
            { "pain", "" },
            { "ats", "" },
            { "intervention", "" },
            { "initial", "" },
        };
        public static Dictionary<string, string> directMedication = new Dictionary<string, string>()
        {
            { "id", "" },
            { "dir_med_time", "" },
            { "dir_medication", "" },
            { "dir_med_dose", "" },
            { "dir_med_route", "" },
            { "dir_med_rate", "" },
            { "dir_med_doctor", "" },
            { "dir_med_comment", "" },
            { "dir_med_time2", "" },
            { "dir_med_initial", "" },
        };
        public static Dictionary<string, string> nursingNote = new Dictionary<string, string>()
        {
            { "id", "" },
            { "date_time", "" },
            { "patient_condition", "" },
            { "signature_name", "" },
        };
        
    }

    //public class PatientInfo
    //{
    //    public dynamic patient_id { get; set; }
    //    public dynamic visible_patient_id { get; set; }
    //    public dynamic first_name_l { get; set; }
    //    public dynamic last_name_l { get; set; }
    //    public dynamic date_of_birth { get; set; }
    //    public dynamic gender_l { get; set; }
    //    public dynamic address_line_l { get; set; }
    //    public dynamic address_subregion_l { get; set; }
    //    public dynamic address_region_l { get; set; }
    //    public dynamic address_country_l { get; set; }
    //    public dynamic contact_name_l { get; set; }
    //    public dynamic relationship_type_rcd { get; set; }
    //    public dynamic contact_phone_number { get; set; }
    //    public dynamic title_l { get; set; }

    //    //      "patient_id": "c248e0fc-39b6-493f-a197-6cf2a96b37ad",
    //    //"hospital_code": "AIH",
    //    //"visible_patient_id": "900005754",
    //    //"primary_patient_id": "c248e0fc-39b6-493f-a197-6cf2a96b37ad",
    //    //"primary_hospital_code": "AIH",
    //    //"primary_visible_patient_id": "900005754",
    //    //"title_e": "Ms.",
    //    //"title_l": "Bà",
    //    //"first_name_e": "Patient for",
    //    //"first_name_l": "Patient for",
    //    //"last_name_e": "Test",
    //    //"last_name_l": "Test",
    //    //"date_of_birth": "2017-10-18T00:00:00",
    //    //"gender_e": "Female",
    //    //"gender_l": "Nữ",
    //    //"national_id": "079187006681 ( m? )",
    //    //"passport": null,
    //    //"home_email": null,
    //    //"business_email": "",
    //    //"occupation_e": "White-collar worker",
    //    //"occupation_l": "Nhân viên văn phòng",
    //    //"nationality_e": "Atlantic Ocean (East)",
    //    //"nationality_l": "Atlantic Ocean (East)",
    //    //"religion_e": "Unknown",
    //    //"religion_l": "Không có thông tin",
    //    //"address_line_e": "19/1 Phan Tây Hồ,P.7",
    //    //"address_line_l": "19/1 Phan Tây Hồ,P.7",
    //    //"address_subregion_e": "Phu Nhuan District",
    //    //"address_subregion_l": "Quận Phú Nhuận",
    //    //"address_region_e": "Ho Chi Minh",
    //    //"address_region_l": "Tp. HCM",
    //    //"address_country_e": "Vietnam",
    //    //"address_country_l": "Việt Nam",
    //    //"contact_name_e": "Ms. Le Hoang Thao",
    //    //"contact_name_l": "Bà Lê Hoàng Thảo",
    //    //"relationship_type_rcd": "Mẹ",
    //    //"contact_phone_number": null,
    //    //"lu_updated": "2021-01-20T09:00:23.563"
    //}

    public partial class Ena
    {
        #region Properties
        public dynamic document_id { get; set; }
        public dynamic triage_time { get; set; }
        public dynamic triage_area { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic triage_code { get; set; }
        public dynamic triage_desc { get; set; }
        public dynamic arrival_mode_code { get; set; }
        public dynamic arrival_mode_desc { get; set; }
        public dynamic arrival_mode_note { get; set; }
        public dynamic past_medical_history { get; set; }
        public dynamic narrative { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_bmi { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spo2 { get; set; }
        public dynamic vs_head_circum { get; set; }
        public dynamic loc_avpu { get; set; }
        public dynamic pain_score { get; set; }
        public dynamic pain_onset { get; set; }
        public dynamic pain_location { get; set; }
        public dynamic pain_duration { get; set; }
        public dynamic pain_radiation { get; set; }
        public dynamic allergy { get; set; }
        public dynamic current_medication { get; set; }
        public dynamic skin_integrity { get; set; }
        public dynamic com_dis_src { get; set; }
        public dynamic discharge_plan { get; set; }
        public dynamic dis_after_discharge_code { get; set; }
        public dynamic dis_after_discharge_desc { get; set; }
        public dynamic caregiver_after_discharge { get; set; }
        public dynamic btc_language { get; set; }
        public dynamic btc_language_note { get; set; }
        public dynamic btc_cognitive { get; set; }
        public dynamic btc_cognitive_note { get; set; }
        public dynamic btc_sensory { get; set; }
        public dynamic btc_sensory_note { get; set; }
        public dynamic btc_religious { get; set; }
        public dynamic btc_religious_note { get; set; }
        public dynamic btc_cultural { get; set; }
        public dynamic btc_cultural_note { get; set; }
        public dynamic general_appearance { get; set; }
        public dynamic eye { get; set; }
        public dynamic voice { get; set; }
        public dynamic motion { get; set; }
        public dynamic alert { get; set; }
        public dynamic coma { get; set; }
        public dynamic others { get; set; }
        public dynamic str_others { get; set; }
        public dynamic respiratory { get; set; }
        public dynamic rhythm_regular { get; set; }
        public dynamic rhythm_inregular { get; set; }
        public dynamic rhythm_others { get; set; }
        public dynamic rhythm_str_others { get; set; }
        public dynamic psychosocial { get; set; }
        public dynamic psychosocial_others { get; set; }
        public dynamic psychosocial_str_others { get; set; }
        public dynamic other_systems_normal { get; set; }
        public dynamic other_systems_abnormal { get; set; }
        public dynamic others_systems_str { get; set; }
        public dynamic lmp { get; set; }
        public dynamic lmP_note { get; set; }
        public dynamic para { get; set; }
        public dynamic abortions { get; set; }
        public dynamic blood_glucose_date_time { get; set; }
        public dynamic blood_glucose_note { get; set; }
        public dynamic ecg_date_time { get; set; }
        public dynamic ecg_note { get; set; }
        public dynamic urine_cath_date_time { get; set; }
        public dynamic urine_cath_note { get; set; }
        public dynamic splint_cast_dressing_date_time { get; set; }
        public dynamic splint_cast_dressing_note { get; set; }
        public dynamic procedure_other_date_time { get; set; }
        public dynamic procedure_other_note { get; set; }
        public dynamic discharge_date_time { get; set; }
        public dynamic discharge_by { get; set; }
        public dynamic admited_date_time { get; set; }
        public dynamic admited_by { get; set; }
        public dynamic receiving_unit { get; set; }
        public dynamic transfer_to { get; set; }
        public dynamic transfer_by { get; set; }
        public dynamic noticed_time { get; set; }
        public dynamic direct_medication { get; set; }
        public dynamic assessment_system { get; set; }
        public dynamic nursing_note { get; set; }
        public dynamic status { get; set; }
        public dynamic user_name { get; set; }

        #endregion

        Ena() { }

        public Ena(dynamic document_id)
        {
            string _jsonData = WebHelpers.GetAPI("api/ena/" + document_id);

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }
        public Ena(dynamic document_id, dynamic user_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }

        // Constructor for API Inssert
        public Ena(
  dynamic document_id,
  dynamic user_name,
  dynamic status,
  dynamic amend_reason,
  dynamic triage_time,
  dynamic triage_area,
  dynamic chief_complaint,
  dynamic triage_code,
  dynamic triage_desc,
  dynamic arrival_mode_code,
  dynamic arrival_mode_desc,
  dynamic arrival_mode_note,
  dynamic past_medical_history,
  dynamic narrative,
  dynamic vs_temperature,
  dynamic vs_weight,
  dynamic vs_height,
  dynamic vs_bmi,
  dynamic vs_heart_rate,
  dynamic vs_respiratory_rate,
  dynamic vs_blood_pressure,
  dynamic vs_spo2,
  dynamic vs_head_circum,
  dynamic loc_avpu,
  dynamic pain_score,
  dynamic pain_onset,
  dynamic pain_location,
  dynamic pain_duration,
  dynamic pain_radiation,
  dynamic allergy,
  dynamic current_medication,
  dynamic skin_integrity,
  dynamic com_dis_src,
  dynamic discharge_plan,
  dynamic dis_after_discharge_code,
  dynamic dis_after_discharge_desc,
  dynamic caregiver_after_discharge,
  dynamic btc_language,
  dynamic btc_language_note,
  dynamic btc_cognitive,
  dynamic btc_cognitive_note,
  dynamic btc_sensory,
  dynamic btc_sensory_note,
  dynamic btc_religious,
  dynamic btc_religious_note,
  dynamic btc_cultural,
  dynamic btc_cultural_note,
  dynamic general_appearance,
  dynamic eye,
  dynamic voice,
  dynamic motion,
  dynamic alert,
  dynamic coma,
  dynamic others,
  dynamic str_others,
  dynamic respiratory,
  dynamic rhythm_regular,
  dynamic rhythm_inregular,
  dynamic rhythm_others,
  dynamic rhythm_str_others,
  dynamic psychosocial,
  dynamic psychosocial_others,
  dynamic psychosocial_str_others,
  dynamic other_systems_normal,
  dynamic other_systems_abnormal,
  dynamic others_systems_str,
  dynamic lmp,
  dynamic lmP_note,
  dynamic para,
  dynamic abortions,
  dynamic blood_glucose_date_time,
  dynamic blood_glucose_note,
  dynamic ecg_date_time,
  dynamic ecg_note,
  dynamic urine_cath_date_time,
  dynamic urine_cath_note,
  dynamic splint_cast_dressing_date_time,
  dynamic splint_cast_dressing_note,
  dynamic procedure_other_date_time,
  dynamic procedure_other_note,
  dynamic discharge_date_time,
  dynamic discharge_by,
  dynamic admited_date_time,
  dynamic admited_by,
  dynamic receiving_unit,
  dynamic transfer_to,
  dynamic transfer_by,
  dynamic noticed_time,
  dynamic direct_medication,
  dynamic assessment_system,
  dynamic nursing_note
        )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.triage_time = triage_time;
            this.triage_area = triage_area;
            this.chief_complaint = chief_complaint;
            this.triage_code = triage_code;
            this.triage_desc = triage_desc;
            this.arrival_mode_code = arrival_mode_code;
            this.arrival_mode_desc = arrival_mode_desc;
            this.arrival_mode_note = arrival_mode_note;
            this.past_medical_history = past_medical_history;
            this.narrative = narrative;
            this.vs_temperature = vs_temperature;
            this.vs_weight = vs_weight;
            this.vs_height = vs_height;
            this.vs_bmi = vs_bmi;
            this.vs_heart_rate = vs_heart_rate;
            this.vs_respiratory_rate = vs_respiratory_rate;
            this.vs_blood_pressure = vs_blood_pressure;
            this.vs_spo2 = vs_spo2;
            this.vs_head_circum = vs_head_circum;
            this.loc_avpu = loc_avpu;
            this.pain_score = pain_score;
            this.pain_onset = pain_onset;
            this.pain_location = pain_location;
            this.pain_duration = pain_duration;
            this.pain_radiation = pain_radiation;
            this.allergy = allergy;
            this.current_medication = current_medication;
            this.skin_integrity = skin_integrity;
            this.com_dis_src = com_dis_src;
            this.discharge_plan = discharge_plan;
            this.dis_after_discharge_code = dis_after_discharge_code;
            this.dis_after_discharge_desc = dis_after_discharge_desc;
            this.caregiver_after_discharge = caregiver_after_discharge;
            this.btc_language = btc_language;
            this.btc_language_note = btc_language_note;
            this.btc_cognitive = btc_cognitive;
            this.btc_cognitive_note = btc_cognitive_note;
            this.btc_sensory = btc_sensory;
            this.btc_sensory_note = btc_sensory_note;
            this.btc_religious = btc_religious;
            this.btc_religious_note = btc_religious_note;
            this.btc_cultural = btc_cultural;
            this.btc_cultural_note = btc_cultural_note;
            this.general_appearance = general_appearance;
            this.eye = eye;
            this.voice = voice;
            this.motion = motion;
            this.alert = alert;
            this.coma = coma;
            this.others = others;
            this.str_others = str_others;
            this.respiratory = respiratory;
            this.rhythm_regular = rhythm_regular;
            this.rhythm_inregular = rhythm_inregular;
            this.rhythm_others = rhythm_others;
            this.rhythm_str_others = rhythm_str_others;
            this.psychosocial = psychosocial;
            this.psychosocial_others = psychosocial_others;
            this.psychosocial_str_others = psychosocial_str_others;
            this.other_systems_normal = other_systems_normal;
            this.other_systems_abnormal = other_systems_abnormal;
            this.others_systems_str = others_systems_str;
            this.lmp = lmp;
            this.lmP_note = lmP_note;
            this.para = para;
            this.abortions = abortions;
            this.blood_glucose_date_time = blood_glucose_date_time;
            this.blood_glucose_note = blood_glucose_note;
            this.ecg_date_time = ecg_date_time;
            this.ecg_note = ecg_note;
            this.urine_cath_date_time = urine_cath_date_time;
            this.urine_cath_note = urine_cath_note;
            this.splint_cast_dressing_date_time = splint_cast_dressing_date_time;
            this.splint_cast_dressing_note = splint_cast_dressing_note;
            this.procedure_other_date_time = procedure_other_date_time;
            this.procedure_other_note = procedure_other_note;
            this.discharge_date_time = discharge_date_time;
            this.discharge_by = discharge_by;
            this.admited_date_time = admited_date_time;
            this.admited_by = admited_by;
            this.receiving_unit = receiving_unit;
            this.transfer_to = transfer_to;
            this.transfer_by = transfer_by;
            this.noticed_time = noticed_time;
            this.direct_medication = direct_medication;
            this.assessment_system = assessment_system;
            this.nursing_note = nursing_note;
    }

        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/ena/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/ena/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }

        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/emr/document-del/" + userName + "/" + DataHelpers.varDocId);

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/ena/log/" + DataHelpers.varDocId);
                message[1] = responseStatus;
            }

            return message;
        }
    }

    public class OutPatientInitialNursingAssement
    {
        #region Properties
        public dynamic vs_temperature { get; set; }
        public dynamic user_name { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic pulse { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_note { get; set; }
        public dynamic mental_status { get; set; }
        public dynamic mental_status_note { get; set; }
        public dynamic paint_score_code { get; set; }
        public dynamic paint_score_description { get; set; }
        public dynamic fall_risk { get; set; }
        public dynamic fall_risk_assistance { get; set; }
        public dynamic nutrition_status_code { get; set; }
        public dynamic nutrition_status_description { get; set; }
        public dynamic housing_code { get; set; }
        public dynamic housing_description { get; set; }
        public dynamic prioritization_code { get; set; }
        public dynamic prioritization_description { get; set; }
        public dynamic assessment_date_time { get; set; }
        public dynamic document_id { get; set; }
        public dynamic model_id { get; set; }
        public dynamic patient_visit_id { get; set; }
        public dynamic status { get; set; }
        public dynamic created_user_id { get; set; }
        public dynamic created_name_e { get; set; }
        public dynamic created_name_l { get; set; }
        public dynamic created_date_time { get; set; }
        public dynamic modified_user_id { get; set; }
        public dynamic modified_name_e { get; set; }
        public dynamic modified_name_l { get; set; }
        public dynamic modified_date_time { get; set; }
        public dynamic submited_user_id { get; set; }
        public dynamic submited_name_e { get; set; }
        public dynamic submited_name_l { get; set; }
        public dynamic submited_date_time { get; set; }
        public dynamic signed_user_id { get; set; }
        public dynamic signed_name_e { get; set; }
        public dynamic signed_name_l { get; set; }
        public dynamic signed_date_time { get; set; }
        public dynamic delete_user_id { get; set; }
        public dynamic delete_name_e { get; set; }
        public dynamic delete_name_l { get; set; }
        public dynamic delete_date_time { get; set; }
        public dynamic document_type_rcd { get; set; }
        public dynamic amend_reason { get; set; }
        #endregion

        /// <summary>
        /// Load document
        /// </summary>
        /// <param name="vs_temperature"></param>
        /// <param name="vs_heart_rate"></param>
        /// <param name="vs_weight"></param>
        /// <param name="vs_respiratory_rate"></param>
        /// <param name="vs_height"></param>
        /// <param name="vs_BMI"></param>
        /// <param name="vs_blood_pressure"></param>
        /// <param name="vs_spO2"></param>
        /// <param name="pulse"></param>
        /// <param name="chief_complaint"></param>
        /// <param name="allergy"></param>
        /// <param name="allergy_note"></param>
        /// <param name="mental_status"></param>
        /// <param name="mental_status_note"></param>
        /// <param name="paint_score_code"></param>
        /// <param name="paint_score_description"></param>
        /// <param name="fall_risk"></param>
        /// <param name="fall_risk_assistance"></param>
        /// <param name="nutrition_status_code"></param>
        /// <param name="nutrition_status_description"></param>
        /// <param name="housing_code"></param>
        /// <param name="housing_description"></param>
        /// <param name="prioritization_code"></param>
        /// <param name="prioritization_description"></param>
        /// <param name="assessment_date_time"></param>
        /// <param name="document_id"></param>
        /// <param name="model_id"></param>
        /// <param name="patient_visit_id"></param>
        /// <param name="status"></param>
        /// <param name="created_user_id"></param>
        /// <param name="created_name_e"></param>
        /// <param name="created_name_l"></param>
        /// <param name="created_date_time"></param>
        /// <param name="modified_user_id"></param>
        /// <param name="modified_name_e"></param>
        /// <param name="modified_name_l"></param>
        /// <param name="modified_date_time"></param>
        /// <param name="submited_user_id"></param>
        /// <param name="submited_name_e"></param>
        /// <param name="submited_name_l"></param>
        /// <param name="submited_date_time"></param>
        /// <param name="signed_user_id"></param>
        /// <param name="signed_name_e"></param>
        /// <param name="signed_name_l"></param>
        /// <param name="signed_date_time"></param>
        /// <param name="delete_user_id"></param>
        /// <param name="delete_name_e"></param>
        /// <param name="delete_name_l"></param>
        /// <param name="delete_date_time"></param>
        /// <param name="document_type_rcd"></param>
        /// <param name="amend_reason"></param>
        public OutPatientInitialNursingAssement(dynamic vs_temperature, dynamic vs_heart_rate, dynamic vs_weight, dynamic vs_respiratory_rate, dynamic vs_height, dynamic vs_BMI, dynamic vs_blood_pressure, dynamic vs_spO2, dynamic pulse, dynamic chief_complaint, dynamic allergy, dynamic allergy_note, dynamic mental_status, dynamic mental_status_note, dynamic paint_score_code, dynamic paint_score_description, dynamic fall_risk, dynamic fall_risk_assistance, dynamic nutrition_status_code, dynamic nutrition_status_description, dynamic housing_code, dynamic housing_description, dynamic prioritization_code, dynamic prioritization_description, dynamic assessment_date_time, dynamic document_id, dynamic model_id, dynamic patient_visit_id, dynamic status, dynamic created_user_id, dynamic created_name_e, dynamic created_name_l, dynamic created_date_time, dynamic modified_user_id, dynamic modified_name_e, dynamic modified_name_l, dynamic modified_date_time, dynamic submited_user_id, dynamic submited_name_e, dynamic submited_name_l, dynamic submited_date_time, dynamic signed_user_id, dynamic signed_name_e, dynamic signed_name_l, dynamic signed_date_time, dynamic delete_user_id, dynamic delete_name_e, dynamic delete_name_l, dynamic delete_date_time, dynamic document_type_rcd, dynamic amend_reason)
        {
            this.vs_temperature = vs_temperature;
            this.vs_heart_rate = vs_heart_rate;
            this.vs_weight = vs_weight;
            this.vs_respiratory_rate = vs_respiratory_rate;
            this.vs_height = vs_height;
            this.vs_BMI = vs_BMI;
            this.vs_blood_pressure = vs_blood_pressure;
            this.vs_spO2 = vs_spO2;
            this.pulse = pulse;
            this.chief_complaint = chief_complaint;
            this.allergy = allergy;
            this.allergy_note = allergy_note;
            this.mental_status = mental_status;
            this.mental_status_note = mental_status_note;
            this.paint_score_code = paint_score_code;
            this.paint_score_description = paint_score_description;
            this.fall_risk = fall_risk;
            this.fall_risk_assistance = fall_risk_assistance;
            this.nutrition_status_code = nutrition_status_code;
            this.nutrition_status_description = nutrition_status_description;
            this.assessment_date_time = assessment_date_time;
            this.document_id = document_id;
            this.model_id = model_id;
            this.patient_visit_id = patient_visit_id;
            this.status = status;
            this.created_user_id = created_user_id;
            this.created_name_e = created_name_e;
            this.created_name_l = created_name_l;
            this.created_date_time = created_date_time;
            this.modified_user_id = modified_user_id;
            this.modified_name_e = modified_name_e;
            this.modified_name_l = modified_name_l;
            this.modified_date_time = modified_date_time;
            this.submited_user_id = submited_user_id;
            this.submited_name_e = submited_name_e;
            this.submited_date_time = submited_date_time;
            this.signed_user_id = signed_user_id;
            this.signed_name_e = signed_name_e;
            this.signed_name_l = signed_name_l;
            this.signed_date_time = signed_date_time;
            this.delete_user_id = delete_user_id;
            this.delete_name_e = delete_name_e;
            this.delete_name_l = delete_name_l;
            this.delete_date_time = delete_date_time;
            this.document_type_rcd = document_type_rcd;
            this.amend_reason = amend_reason;
        }

        public OutPatientInitialNursingAssement(string document_id)
        {
            string _jsonData = WebHelpers.GetAPI("api/oina/" + document_id);

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);

        }
        /// <summary>
        /// returns: an array of messages
        /// </summary>
        /// <returns></returns>
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/oina/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/oina/log/" + document_id);
                message[1] = responseStatus;
            }

            return message;
        }

        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/emr/document-del/" + userName + "/" + DataHelpers.varDocId);

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/oina/log/" + DataHelpers.varDocId);
                message[1] = responseStatus;
            }

            return message;
        }
    }

    #region Pomr

    public class POMR
    {
        #region Properties
        public dynamic chief_complaint { get; set; }
        public dynamic user_name { get; set; }
        public dynamic medical_history { get; set; }
        public dynamic current_medication { get; set; }
        public dynamic personal { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_note { get; set; }
        public dynamic family { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic physical_examination { get; set; }
        public dynamic laboratory_indications_results { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic differential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_code { get; set; }
        public dynamic treatment_desc { get; set; }
        public dynamic medicine { get; set; }
        public dynamic spec_opinion_requested { get; set; }
        public dynamic spec_opinion_requested_note { get; set; }
        public dynamic specific_education_required { get; set; }
        public dynamic bool_next_appointment { get; set; }
        public dynamic txt_next_appointment { get; set; }
        public dynamic date_next_appointment { get; set; }
        public dynamic document_id { get; set; }
        public dynamic model_id { get; set; }
        public dynamic patient_visit_id { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic created_user_id { get; set; }
        public dynamic created_name_e { get; set; }
        public dynamic created_name_l { get; set; }
        public dynamic created_date_time { get; set; }
        public dynamic modified_user_id { get; set; }
        public dynamic modified_name_e { get; set; }
        public dynamic modified_name_l { get; set; }
        public dynamic modified_date_time { get; set; }
        public dynamic submited_user_id { get; set; }
        public dynamic submited_name_e { get; set; }
        public dynamic submited_name_l { get; set; }
        public dynamic submited_date_time { get; set; }
        public dynamic signed_user_id { get; set; }
        public dynamic signed_name_e { get; set; }
        public dynamic signed_name_l { get; set; }
        public dynamic signed_date_time { get; set; }
        public dynamic delete_user_id { get; set; }
        public dynamic delete_name_e { get; set; }
        public dynamic delete_name_l { get; set; }
        public dynamic delete_date_time { get; set; }
        public dynamic document_type_rcd { get; set; }
        public dynamic documentid { get; set; }
        #endregion
        public POMR() { }
        public POMR(string document_id)
        {
            string _jsonData = WebHelpers.GetAPI("api/pomr/" + document_id);

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }


        //
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/pomr/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/pomr/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }
    }

    #endregion

    #region OUTPATIENT MEDICAL RECORD - Mr. Chung
    public partial class PatientInfo
    {
        //public  PatientInfo() { }
        public string p_info;
        public int p_age;

        public string ShowPatientInfo(bool vi_laganue)
        {
            p_age = DataHelpers.CalculateAge(DateTime.Parse(date_of_birth.ToString()));
            if (vi_laganue)
            {
                p_info = "(" + title_l + "), DOB: " + date_of_birth + p_age + " Sex " + gender_l + " PID:" + visible_patient_id;
            }
            else
            {
                p_info = "(" + title_e + "), DOB: " + date_of_birth + p_age + " Sex " + gender_e + " PID:" + visible_patient_id;
            }
            return p_info;
        }

        public dynamic patient_id { get; set; }


        public dynamic hospital_code { get; set; }


        public dynamic visible_patient_id { get; set; }

        public dynamic primary_patient_id { get; set; }

        public dynamic primary_hospital_code { get; set; }

        public dynamic primary_visible_patient_id { get; set; }

        public dynamic title_e { get; set; }


        public dynamic title_l { get; set; }


        public dynamic first_name_e { get; set; }


        public dynamic first_name_l { get; set; }


        public dynamic last_name_e { get; set; }


        public dynamic last_name_l { get; set; }

        public dynamic date_of_birth { get; set; }


        public dynamic gender_e { get; set; }


        public dynamic gender_l { get; set; }

        public dynamic national_id { get; set; }

        public dynamic passport { get; set; }

        public dynamic home_email { get; set; }

        public dynamic business_email { get; set; }

        public dynamic occupation_e { get; set; }

        public dynamic occupation_l { get; set; }

        public dynamic nationality_e { get; set; }

        public dynamic nationality_l { get; set; }

        public dynamic religion_e { get; set; }

        public dynamic religion_l { get; set; }

        public dynamic address_line_e { get; set; }

        public dynamic address_line_l { get; set; }

        public dynamic address_subregion_e { get; set; }

        public dynamic address_subregion_l { get; set; }

        public dynamic address_region_e { get; set; }

        public dynamic address_region_l { get; set; }

        public dynamic address_country_e { get; set; }

        public dynamic address_country_l { get; set; }


        public dynamic contact_name_e { get; set; }


        public dynamic contact_name_l { get; set; }


        public dynamic relationship_type_rcd { get; set; }

        public dynamic contact_phone_number { get; set; }

        public dynamic lu_updated { get; set; }

    }

    public class PatientVisitInfo
    {

        public dynamic patient_visit_id { get; set; }

        public dynamic patient_id { get; set; }

        public dynamic associated_visit_id { get; set; }

        public dynamic visit_type_group_rcd { get; set; }


        public dynamic visit_type { get; set; }


        public dynamic visit_code { get; set; }

        public dynamic actual_visit_date_time { get; set; }

        public dynamic closure_date_time { get; set; }


        public dynamic caregiver_name_e { get; set; }


        public dynamic caregiver_name_l { get; set; }


        public dynamic specialty_name_e { get; set; }


        public dynamic specialty_name_l { get; set; }


    }

    public partial class OutpatientMedicalRecord
    {
        #region Properties
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic chief_complain { get; set; }
        public dynamic medical_history { get; set; }
        public dynamic personal { get; set; }
        public dynamic habits_smoking { get; set; }
        public dynamic habits_smoking_pack { get; set; }
        public dynamic habits_alcohol { get; set; }
        public dynamic habits_alcohol_note { get; set; }
        public dynamic habits_drugs { get; set; }
        public dynamic habits_drugs_note { get; set; }
        public dynamic habits_physical_exercise { get; set; }
        public dynamic habits_phy_exer_note { get; set; }
        public dynamic habits_other { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_note { get; set; }
        public dynamic family { get; set; }
        public dynamic immunization { get; set; }
        public dynamic current_medication { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic physical_examination { get; set; }
        public dynamic psy_consult_required { get; set; }
        public dynamic laboratory_indications_results { get; set; }
        public dynamic additional_investigation { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic differential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_code { get; set; }
        public dynamic treatment_desc { get; set; }
        public dynamic medicine { get; set; }
        public dynamic spec_opinion_requested { get; set; }
        public dynamic spec_opinion_requested_note { get; set; }
        public dynamic specific_education_required { get; set; }

        public dynamic next_appointment { get; set; }
        #endregion

        #region Methods
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/omr/edit", this);

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/omr/log/" + document_id);
                message[1] = responseStatus;
            }
            return message;
        }
        #endregion

        #region Constructors
        public OutpatientMedicalRecord() { }

        // Constructor for API Update
        /// <summary>
        /// Get document by document_id
        /// </summary>
        /// <param name="document_id"></param>
        public OutpatientMedicalRecord(dynamic document_id)
        {

            DataTable tbl = new DataTable();
            string _jsonData = WebHelpers.GetAPI("api/omr/" + document_id);

            if (_jsonData != null)
            {
                // this = new OutpatientMedicalRecord();
                tbl = WebHelpers.GetJSONToDataTable(_jsonData);
                WebHelpers.BindingDatafield(tbl, this);
                DataHelpers.varDocumentStatus = this.status;
            }
        }//32.69 - 39678
        // Constructor for API Delete
        /// <summary>
        /// Method for API delete document by document_id & use_name
        /// </summary>
        /// <param name="document_id"></param>
        /// <param name="use_name"></param>
        public OutpatientMedicalRecord(dynamic document_id, dynamic use_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }
        // Constructor for API Inssert
        public OutpatientMedicalRecord(dynamic document_id
            , dynamic username
            , dynamic doc_status
            , dynamic amend_reason
            , dynamic chief_complain
        , dynamic medical_history
        , dynamic personal
            , dynamic habits_smoking
        , dynamic habits_smoking_pack
        , dynamic habits_alcohol
        , dynamic habits_alcohol_note
        , dynamic habits_drugs
        , dynamic habits_drugs_note
       , dynamic habits_physical_exercise
        , dynamic habits_phy_exer_note
        , dynamic habits_other
        , dynamic allergy
        , dynamic allergy_note
        , dynamic family
        , dynamic immunization
        , dynamic current_medication
        , dynamic vs_temperature
        , dynamic vs_heart_rate
        , dynamic vs_weight
        , dynamic vs_height
        , dynamic vs_respiratory_rate
        , dynamic vs_BMI
        , dynamic vs_blood_pressure
        , dynamic vs_spO2
        , dynamic vs_pulse
        , dynamic physical_examination
        , dynamic psy_consult_required
        , dynamic laboratory_indications_results
        , dynamic additional_investigation
        , dynamic initial_diagnosis
        , dynamic diagnosis
        , dynamic differential_diagnosis
        , dynamic associated_conditions
        , dynamic treatment_code
        , dynamic treatment_desc
        , dynamic medicine
        , dynamic spec_opinion_requested
        , dynamic spec_opinion_requested_note
        , dynamic specific_education_required
        , dynamic next_appointment
        ){
            this.document_id = document_id;
            // Bo sung them 13.04//
            this.user_name = username;
            this.status = doc_status;
            this.amend_reason = amend_reason;


            this.chief_complain = chief_complain;
            this.medical_history = medical_history;
            this.personal = personal;

            this.habits_smoking = habits_smoking;
            this.habits_smoking_pack = habits_smoking_pack;
            this.habits_alcohol = habits_alcohol;
            this.habits_alcohol_note = habits_alcohol_note;
            this.habits_drugs = habits_drugs;
            this.habits_drugs_note = habits_drugs_note;
            this.habits_physical_exercise = habits_physical_exercise;
            this.habits_phy_exer_note = habits_phy_exer_note;
            this.habits_other = habits_other;


            this.allergy = allergy;
            this.allergy_note = allergy_note;
            this.family = family;
            this.immunization = immunization;
            this.current_medication = current_medication;
            this.vs_temperature = vs_temperature;
            this.vs_heart_rate = vs_heart_rate;
            this.vs_weight = vs_weight;
            this.vs_height = vs_height;
            this.vs_respiratory_rate = vs_respiratory_rate;
            this.vs_BMI = vs_BMI;
            this.vs_blood_pressure = vs_blood_pressure;
            this.vs_spO2 = vs_spO2;
            this.vs_pulse = vs_pulse;
            this.physical_examination = physical_examination;
            this.psy_consult_required = psy_consult_required;
            this.laboratory_indications_results = laboratory_indications_results;
            this.additional_investigation = additional_investigation;
            this.initial_diagnosis = initial_diagnosis;
            this.diagnosis = diagnosis;
            this.differential_diagnosis = differential_diagnosis;
            this.associated_conditions = associated_conditions;
            this.treatment_code = treatment_code;
            this.treatment_desc = treatment_desc;
            this.medicine = medicine;
            this.spec_opinion_requested = spec_opinion_requested;
            this.spec_opinion_requested_note = spec_opinion_requested_note;
            this.specific_education_required = specific_education_required;
            this.next_appointment = next_appointment;
        }
    }

    public partial class MC
    {
        #region Properties
        public dynamic document_id { get; set; }

        public dynamic user_name { get; set; }

        public dynamic status { get; set; }

        public dynamic amend_reason { get; set; }

        public dynamic chief_complain { get; set; }
        public dynamic history_present_illness { get; set; }
        public dynamic past_history { get; set; }
        public dynamic clinical_findings { get; set; }
        public dynamic para_clinical_investigations { get; set; }

        public dynamic diagnosis { get; set; }

        public dynamic treatment { get; set; }

        public dynamic treatment_period { get; set; }

        public dynamic recommendation { get; set; }
        public dynamic treatment_plan { get; set; }

        #endregion

        MC() { }
        
        // Constructor for API Update
        /// <summary>
        /// Get document by document_id
        /// </summary>
        /// <param name="document_id"></param>
        public MC(dynamic document_id)
        {
            string _jsonData = WebHelpers.GetAPI("api/mc/" + document_id);

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);
            
            WebHelpers.BindingDatafield(db, this);
        }
        public MC(dynamic document_id, dynamic use_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }

        // Constructor for API Inssert
        /// <summary>
        /// Constructor for Edit_API
        /// </summary>
        /// <param name="_document_id"></param>
        /// <param name="_user_name"></param>
        /// <param name="_status"></param>
        /// <param name="_amend_reason"></param>
        /// <param name="_chief_complain"></param>
        /// <param name="_history_present_illness"></param>
        /// <param name="_past_history"></param>
        /// <param name="_clinical_findings"></param>
        /// <param name="_para_clinical_investigations"></param>
        /// <param name="_diagnosis"></param>
        /// <param name="_treatment"></param>
        /// <param name="_treatment_period"></param>
        /// <param name="_recommendation"></param>
        /// <param name="_treatment_plan"></param>
        public MC(
        dynamic _document_id
        , dynamic _user_name
        , dynamic _status
        , dynamic _amend_reason

        , dynamic _chief_complain
        , dynamic _history_present_illness
        , dynamic _past_history
        , dynamic _clinical_findings
        , dynamic _para_clinical_investigations
        , dynamic _diagnosis
        , dynamic _treatment
        , dynamic _treatment_period
        , dynamic _recommendation
        , dynamic _treatment_plan
        )

        {

            this.document_id = _document_id;
            this.user_name = _user_name;
            this.status = _status;
            this.amend_reason = _amend_reason;
            this.chief_complain = _chief_complain;
            this.history_present_illness = _history_present_illness;
            this.past_history = _past_history;
            this.clinical_findings = _clinical_findings;
            this.para_clinical_investigations = _para_clinical_investigations;
            this.diagnosis = _diagnosis;
            this.treatment = _treatment;
            this.treatment_period = _treatment_period;
            this.recommendation = _recommendation;
            this.treatment_plan = _treatment_plan;
        }

        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/mc/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/mc/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }

        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/emr/document-del/" + userName + "/" + DataHelpers.varDocId);

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/oina/log/" + DataHelpers.varDocId);
                message[1] = responseStatus;
            }

            return message;
        }
    }

    #endregion

    #endregion
}
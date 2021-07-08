using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace EMR
{
    public class EMRClass
    {
        public static Dictionary<string, dynamic> Settings = new Dictionary<string, dynamic>()
        {
            { "EMR_DOCUMENT_SESSION", null }
        };
    }
    public class Option
    {
        public string Text { get; set; }
        public dynamic Value { get; set; }
        public dynamic FixWidth { get; set; }
    }
    
    public class PatientVisit
    {
        public PatientVisit(string patient_visit_id)
        {
            dynamic response = WebHelpers.GetAPI($"api/emr/patient-visit/{DataHelpers._LOCATION}/{patient_visit_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable tbl = WebHelpers.GetJSONToDataTable(response.Data);
                WebHelpers.BindingDatafield(tbl, this);
                instance = this;
            }
        }

        private static readonly object _lock = new object();
        private static PatientVisit instance = null;
        public static PatientVisit Instance()
        {
            return instance;
        }

        #region Properties
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
        #endregion
    }

    public class Patient
    {
        public Patient(string visible_patient_id) {
            dynamic response = WebHelpers.GetAPI("api/emr/demographic/" + visible_patient_id);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable tbl = WebHelpers.GetJSONToDataTable(response.Data);
                WebHelpers.BindingDatafield(tbl, this);
                instance = this;
            }
        }

        private static Patient instance = null;
        public static Patient Instance()
        {
            return instance;
        }

        #region Properties
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
        #endregion

        #region Methods
        public int GetAge()
        {
           return DataHelpers.CalculateAge(date_of_birth);
        }
        public string GetFullName()
        {
            return this.first_name_l + " " + this.last_name_l;
        }
        public string GetAddress()
        {
            return string.Format("{0} {1} {2} {3}", this.address_line_l, this.address_subregion_l, this.address_region_l, this.address_country_l);
        }
        public string getContact()
        {
            return contact_name_l;
        }
        public string getRelationship()
        {
            return relationship_type_rcd;
        }
        public string GetGender()
        {
            return this.gender_l;
        }
        public string GetNationality()
        {
            return nationality_l;
        }
        public string GetOccupation()
        {
            return occupation_l;
        }
        public string GetTitle()
        {
            return this.title_l;
        }
        #endregion
    }

    public class PageInfo
    {
        public int pageIndex { get; set; }
        public int pageSize { get; set; }
        public int totalRows { get; set; }
        public int totalPages { get; set; }
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
        
        
        
        
        
        
       
        
        
}

    public partial class Ena
    {
        #region Properties
        private static string api = "api/ena";
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
        public dynamic discharge_option { get; set; }
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
        public dynamic skin_anno_data { get; set; }


        #endregion

        #region Dictionary
        public static Dictionary<string, string> DIRECT_MEDICATION_COL = new Dictionary<string, string>()
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
        public static Dictionary<string, string> NURSING_NOTE_COL = new Dictionary<string, string>()
        {
            { "id", "" },
            { "date_time", "DateTime" },
            { "patient_condition", "" },
            { "signature_name", "" },
        };
        public static Dictionary<string, string> ASSESSMENT_SYSTEM_COL = new Dictionary<string, string>()
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
        public static Dictionary<string, string> ARRIVAL_MODE_CODE = new Dictionary<string, string>()
        {
            { "WHE", "Xe lăn/Wheel chair" },
            { "WAL", "Tự đến/Walk-in" },
            { "AMB", "Xe cấp cứu/Ambulance" },
        };
        public static Dictionary<string, string> TRIAGE_CODE = new Dictionary<string, string>()
        {
            { "1", "1-Hồi sức/ Resuscitation" },
            { "2", "2-Cấp cứu/ Emergent" },
            { "3", "3-Khẩn trương/ Urgent" },
            { "4", "4- Trì hoãn/ Less urgent" },
            { "5", "5- Không cấp cứu/ Nonurgent" },
        };
        public static Dictionary<string, string> SKIN_INTEGRITY_CODE = new Dictionary<string, string>()
        {
            { "A", "Trầy xước/Abrasion (A)" },
            { "B", "Bỏng/Burn (B)" },
            { "D", "Biến dạng/Deformity (D)" },
            { "H", "Loét/ Ulceration (U)" },
            { "L", "Rách da/Laceration (L)" },
            { "S", "Bong gân Sprain/ Căng cơ Strain (S)" },
        };
        public static Dictionary<string, string> COM_DIS_SRC_CODE = new Dictionary<string, string>()
        {
            { "F", "Sốt/Fever" },
            { "R", "Nổi mẩn/Rash" },
            { "T", "Đi khỏi Việt Nam trong vòng 15 ngày gần đây/Travel outside Vietnam in recent 15 days" },
            { "S", "Đau họng/ Sore throat" },
            { "C", "Ho/Cough" },
        };
        public static Dictionary<string, string> DISCHARGE_PLAN_CODE = new Dictionary<string, string>()
        {
            { "RA", "Cần trợ  giúp sinh hoạt hàng ngày/ Require assistance with daily living" },
            { "LA", "Sống một mình/ Live alone" },
            { "HF", "Nguy cơ ngã cao/ High falling risk" },
        };
        public static Dictionary<string, string> DIS_AFTER_DISCHARGE_CODE = new Dictionary<string, string>()
        {
            { "H", "Nhà riêng/ Private home" },
            { "O", "Cơ sở y tế khác/Other healthcare facility" },
        };
        public static Dictionary<string, string> GENERAL_APPEARANCE_CODE = new Dictionary<string, string>()
        {
            { "P", "Hồng hào/ Pink" },
            { "T", "Tái/ Pallor" },
            { "C", "Tím/ Cyanosis" },
        };
        public static Dictionary<string, string> RESPIRATORY_CODE = new Dictionary<string, string>()
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
        public static Dictionary<string, string> DISCHARGE_OPTION_CODE = new Dictionary<string, string>()
        {
            { "H", "Về nhà/ Home" },
            { "A", "Tự ý/ AMA" },
            { "D", "Tử vong/ Dead" },
        };
        public static Dictionary<string, string> LOC_AVPU_CODE = new Dictionary<string, string>()
        {
            { "A", "Tỉnh/A-Alert" },
            { "P", "Đau/P-Pain" },
            { "U", "Không đáp ứng/U- Unresponsive" },
            { "V", "Lời nói/V-Verbal" },
        };
        #endregion

        Ena() { }

        public Ena(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if(response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
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
  dynamic discharge_option,
  dynamic admited_date_time,
  dynamic admited_by,
  dynamic receiving_unit,
  dynamic transfer_to,
  dynamic transfer_by,
  dynamic noticed_time,
  dynamic direct_medication,
  dynamic assessment_system,
  dynamic nursing_note,
  dynamic skin_anno_data
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
            this.discharge_option = discharge_option;
            this.admited_date_time = admited_date_time;
            this.admited_by = admited_by;
            this.receiving_unit = receiving_unit;
            this.transfer_to = transfer_to;
            this.transfer_by = transfer_by;
            this.noticed_time = noticed_time;
            this.direct_medication = direct_medication;
            this.assessment_system = assessment_system;
            this.nursing_note = nursing_note;
            this.skin_anno_data = skin_anno_data;
    }

        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;
            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                message[1] = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
            }
            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
    }

    public class Oadr
    {
        #region Properties
        private static string api = "api/oadr";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic admis_delivery { get; set; }
        public dynamic obs_name { get; set; }
        public dynamic obs_initial { get; set; }
        public dynamic delivery_at { get; set; }
        public dynamic apgar_score_1 { get; set; }
        public dynamic apgar_score_5 { get; set; }
        public dynamic apgar_score_10 { get; set; }
        public dynamic weight_of_birth { get; set; }
        public dynamic length_of_birth { get; set; }
        public dynamic head_circum { get; set; }
        public dynamic singleton_sex_code { get; set; }
        public dynamic singleton_sex_desc { get; set; }
        public dynamic multiple_sex { get; set; }
        public dynamic birth_defect { get; set; }
        public dynamic birth_defect_note { get; set; }
        public dynamic neonatal_status { get; set; }
        public dynamic intervention { get; set; }
        public dynamic intervention_note { get; set; }
        public dynamic placenta_deli { get; set; }
        public dynamic pacental_deli_dt { get; set; }
        public dynamic placenta_deli_mode { get; set; }
        public dynamic placenta_weight { get; set; }
        public dynamic umbilical_coil { get; set; }
        public dynamic umbilical_length { get; set; }
        public dynamic blood_loss { get; set; }
        public dynamic p_intervention { get; set; }
        public dynamic p_intervention_note { get; set; }
        public dynamic spO2 { get; set; }
        public dynamic temp { get; set; }
        public dynamic bp { get; set; }
        public dynamic hr { get; set; }
        public dynamic rr { get; set; }
        public dynamic delivery_mode_code { get; set; }
        public dynamic delivery_mode_desc { get; set; }
        public dynamic vaginal_deli_code { get; set; }
        public dynamic vaginal_deli_desc { get; set; }
        public dynamic section_code { get; set; }
        public dynamic section_desc { get; set; }
        public dynamic interven_reason { get; set; }
        public dynamic pre_intact { get; set; }
        public dynamic pre_lacera { get; set; }
        public dynamic pre_lacera_degree { get; set; }
        public dynamic pre_episiotomy { get; set; }
        public dynamic pre_episiotomy_st { get; set; }
        public dynamic cervix_intact { get; set; }
        public dynamic preo_diagnosis { get; set; }
        public dynamic post_diagnosis { get; set; }
        public dynamic operations { get; set; }
        public dynamic sur_incident { get; set; }
        public dynamic sur_incident_note { get; set; }
        public dynamic sur_complication { get; set; }
        public dynamic sur_complication_note { get; set; }
        public dynamic treatment_plan { get; set; }
        #endregion

        #region Codes
        public static Dictionary<string, string> DELIVERY_MODE_CODE = new Dictionary<string, string>()
        {
            { "S", "Sanh mổ/ C-Section" },
            { "V", "Vaginal delivery" },
        };

        public static Dictionary<string, string> SECTION_CODE = new Dictionary<string, string>()
        {
            { "EM", "Mổ cấp cứu/ Emergency" },
            { "EL", "Mổ chương trình/ Elective" },
        };

        public static Dictionary<string, string> VAGINAL_DELI_CODE = new Dictionary<string, string>()
        {
            { "S", "Sanh tự nhiên/ Spontaneous" },
            { "F", "Sanh kềm/ Forceps-assisted" },
            { "V", "Sanh hút/ Vacuum-assisted" },
        };

        public static Dictionary<string, string> SEX_CODE = new Dictionary<string, string>()
        {
            { "F", "Nữ/ Femal" },
            { "M", "Nam/ Male" },
        };

        public static class MULTIPLE_SEX
        {
            public static class F {
                public static string code = "F";
                public static string desc = "Nữ/ Femal";
            }
            public static class M
            {
                public static string code = "M";
                public static string desc = "Nam/ Male";
            }
        };

        public static Dictionary<string, string> OPERATION = new Dictionary<string, string>()
        {
            { "id", "" },
            { "date_time", "DateTime" },
            { "surgical_anesthesia", "" },
            { "surgeon", "" },
            { "anesthesiologist", "" },
        };
        #endregion

        #region Constructors
        public Oadr(
            dynamic document_id ,
            dynamic user_name ,
            dynamic status ,
            dynamic amend_reason ,
            dynamic admis_delivery ,
            dynamic obs_name ,
            dynamic obs_initial ,
            dynamic delivery_at ,
            dynamic apgar_score_1 ,
            dynamic apgar_score_5 ,
            dynamic apgar_score_10 ,
            dynamic weight_of_birth,
            dynamic length_of_birth,
            dynamic head_circum ,
            dynamic singleton_sex_code ,
            dynamic singleton_sex_desc ,
            dynamic multiple_sex ,
            dynamic birth_defect ,
            dynamic birth_defect_note ,
            dynamic neonatal_status,
            dynamic intervention ,
            dynamic intervention_note,
            dynamic placenta_deli ,
            dynamic pacental_deli_dt ,
            dynamic placenta_deli_mode  ,
            dynamic placenta_weight,
            dynamic umbilical_coil ,
            dynamic umbilical_length,
            dynamic blood_loss  ,
            dynamic p_intervention,
            dynamic p_intervention_note,
            dynamic spO2  ,
            dynamic temp  ,
            dynamic bp  ,
            dynamic hr  ,
            dynamic rr  ,
            dynamic delivery_mode_code,
            dynamic delivery_mode_desc ,
            dynamic vaginal_deli_code ,
            dynamic vaginal_deli_desc ,
            dynamic section_code  ,
            dynamic section_desc  ,
            dynamic interven_reason ,
            dynamic pre_intact  ,
            dynamic pre_lacera  ,
            dynamic pre_lacera_degree ,
            dynamic pre_episiotomy , 
            dynamic pre_episiotomy_st  ,
            dynamic cervix_intact ,
            dynamic preo_diagnosis ,
            dynamic post_diagnosis ,
            dynamic operations ,
            dynamic sur_incident ,
            dynamic sur_incident_note ,
            dynamic sur_complication ,
            dynamic sur_complication_note ,
            dynamic treatment_plan
            )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.admis_delivery = admis_delivery;
            this.obs_name = obs_name;
            this.obs_initial = obs_initial;
            this.delivery_at = delivery_at;
            this.apgar_score_1 = apgar_score_1;
            this.apgar_score_5 = apgar_score_5;
            this.apgar_score_10 = apgar_score_10;
            this.weight_of_birth = weight_of_birth;
            this.length_of_birth = length_of_birth;
            this.head_circum = head_circum;
            this.singleton_sex_code = singleton_sex_code;
            this.singleton_sex_desc = singleton_sex_desc;
            this.multiple_sex = multiple_sex;
            this.birth_defect = birth_defect;
            this.birth_defect_note = birth_defect_note;
            this.neonatal_status = neonatal_status;
            this.intervention = intervention;
            this.intervention_note = intervention_note;
            this.placenta_deli = placenta_deli;
            this.pacental_deli_dt = pacental_deli_dt;
            this.placenta_deli_mode = placenta_deli_mode;
            this.placenta_weight = placenta_weight;
            this.umbilical_coil = umbilical_coil;
            this.umbilical_length = umbilical_length;
            this.blood_loss = blood_loss;
            this.p_intervention = p_intervention;
            this.p_intervention_note = p_intervention_note;
            this.spO2 = spO2;
            this.temp = temp;
            this.bp = bp;
            this.hr = hr;
            this.rr = rr;
            this.delivery_mode_code = delivery_mode_code;
            this.delivery_mode_desc = delivery_mode_desc;
            this.vaginal_deli_code = vaginal_deli_code;
            this.vaginal_deli_desc = vaginal_deli_desc;
            this.section_code = section_code;
            this.section_desc = section_desc;
            this.interven_reason = interven_reason;
            this.pre_intact = pre_intact;
            this.pre_lacera = pre_lacera;
            this.pre_lacera_degree = pre_lacera_degree;
            this.pre_episiotomy = pre_episiotomy;
            this.pre_episiotomy_st = pre_episiotomy_st;
            this.cervix_intact = cervix_intact;
            this.preo_diagnosis = preo_diagnosis;
            this.post_diagnosis = post_diagnosis;
            this.operations = operations;
            this.sur_incident = sur_incident;
            this.sur_incident_note = sur_incident_note;
            this.sur_complication = sur_complication;
            this.sur_complication_note = sur_complication_note;
            this.treatment_plan = treatment_plan;
        }

        public Oadr(string document_id)
        {
            dynamic response = WebHelpers.GetAPI(api + "/get/" + DataHelpers._LOCATION + "/" + document_id);

            if(response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #endregion

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }


        #endregion
    }

    public class Disc
    {

        #region Properties
        public static string api = "api/disc";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic no_discharge { get; set; }
        public dynamic disc_ward_code { get; set; }
        public dynamic disc_ward_desc { get; set; }
        public dynamic no_health_insurance { get; set; }
        public dynamic valid_from { get; set; }
        public dynamic disc_date_time { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic disc_medication { get; set; }
        public dynamic followup_instruc { get; set; }
        public dynamic notes { get; set; }
        public dynamic signature_date { get; set; }
        #endregion

        public static Dictionary<string, string> DISC_WARD_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "K18", "Khoa Nhi – Săn sóc đặc biệt sơ sinh" },
            { "K03", "Khoa Nội Tổng Hợp" },
            { "K26", "Khoa Gây mê – Hồi sức" },
            { "K19", "Khoa Ngoại Tổng Hợp" },
            { "K02", "Khoa Cấp cứu" },
            { "K27", "Khoa Sản – Phụ khoa" },
            { "K48", "Khoa Hồi sức tích cực – Chống độc" },
        };

        public Disc(dynamic document_id, dynamic user_name, dynamic status, dynamic amend_reason,
            dynamic no_discharge, dynamic disc_ward_code, dynamic disc_ward_desc, dynamic no_health_insurance,
            dynamic valid_from, dynamic disc_date_time, dynamic diagnosis, dynamic disc_medication, dynamic followup_instruc, dynamic notes, dynamic signature_date )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.no_discharge = no_discharge;
            this.disc_ward_code = disc_ward_code;
            this.disc_ward_desc = disc_ward_desc;
            this.no_health_insurance = no_health_insurance;
            this.valid_from = valid_from;
            this.disc_date_time = disc_date_time;
            this.diagnosis = diagnosis;
            this.disc_medication = disc_medication;
            this.followup_instruc = followup_instruc;
            this.notes = notes;
            this.signature_date = signature_date;
        }
        public Disc(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if(response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        #endregion
    }

    public class Diss
    {

        #region Properties
        public static string api = "api/diss";

        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic disc_reason_code { get; set; }
        public dynamic disc_reason_desc { get; set; }
        public dynamic date_of_hospital { get; set; }
        public dynamic date_of_discharge { get; set; }
        public dynamic admission_reason { get; set; }
        public dynamic icd10_diagnosis { get; set; }
        public dynamic associated_diagnosis { get; set; }
        public dynamic cur_med_history { get; set; }
        public dynamic ant_med_history { get; set; }
        public dynamic physical_finding { get; set; }
        public dynamic lab_result { get; set; }
        public dynamic patho_result_code { get; set; }
        public dynamic patho_result_desc { get; set; }
        public dynamic proce_performed { get; set; }
        public dynamic treatment { get; set; }
        public dynamic evolution { get; set; }
        public dynamic disc_condition { get; set; }
        public dynamic follow_up_instruc { get; set; }
        public dynamic special_diet { get; set; }
        public dynamic next_consult_date { get; set; }
        public dynamic next_consult_doctor { get; set; }
        public dynamic disc_medication { get; set; }
        public dynamic dama { get; set; }
        public dynamic dama_note { get; set; }
        public dynamic trans_to_hospital { get; set; }
        public dynamic transfer_reason { get; set; }
        public dynamic signed_date { get; set; }
        public dynamic signed_doctor { get; set; }
        #endregion

        public static Dictionary<string, string> DISC_REASON_CODE = new Dictionary<string, string>()
        {
            { "DAMA", "DAMA" },
            { "AMA", "Normal" },
            { "TRANSFER", "Transfer" },
        };

        public static Dictionary<string, string> PATHO_RESULT_CODE = new Dictionary<string, string>()
        {
            { "UC", "Chưa xác định/ Unconfirmed" },
            { "BE", "Lành tính/ Benign" },
            { "MA", "Ác tính/ Malignant" },
        };

        public Diss(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
            dynamic disc_reason_code,
            dynamic disc_reason_desc,
            dynamic date_of_hospital,
            dynamic date_of_discharge,
            dynamic admission_reason,
            dynamic icd10_diagnosis,
            dynamic associated_diagnosis,
            dynamic cur_med_history,
            dynamic ant_med_history,
            dynamic physical_finding,
            dynamic lab_result,
            dynamic patho_result_code,
            dynamic patho_result_desc,
            dynamic proce_performed,
            dynamic treatment,
            dynamic evolution,
            dynamic disc_condition,
            dynamic follow_up_instruc,
            dynamic special_diet,
            dynamic next_consult_date,
            dynamic next_consult_doctor,
            dynamic disc_medication,
            dynamic dama,
            dynamic dama_note,
            dynamic trans_to_hospital,
            dynamic transfer_reason,
            dynamic signed_date,
            dynamic signed_doctor
            )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.disc_reason_code = disc_reason_code;
            this.disc_reason_desc = disc_reason_desc;
            this.date_of_hospital = date_of_hospital;
            this.date_of_discharge = date_of_discharge;
            this.admission_reason = admission_reason;
            this.icd10_diagnosis = icd10_diagnosis;
            this.associated_diagnosis = associated_diagnosis;
            this.cur_med_history = cur_med_history;
            this.ant_med_history = ant_med_history;
            this.physical_finding = physical_finding;
            this.lab_result = lab_result;
            this.patho_result_code = patho_result_code;
            this.patho_result_desc = patho_result_desc;
            this.proce_performed = proce_performed;
            this.treatment = treatment;
            this.evolution = evolution;
            this.disc_condition = disc_condition;
            this.follow_up_instruc = follow_up_instruc;
            this.special_diet = special_diet;
            this.next_consult_date = next_consult_date;
            this.next_consult_doctor = next_consult_doctor;
            this.disc_medication = disc_medication;
            this.dama = dama;
            this.dama_note = dama_note;
            this.trans_to_hospital = trans_to_hospital;
            this.transfer_reason = transfer_reason;
            this.signed_date = signed_date;
            this.signed_doctor = signed_doctor;
        }
        public Diss(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {

                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }

        #endregion
    }
    public class Uusr
    {

        #region Properties
        public static string api = "api/uusr";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic left_kidney { get; set; }
        public dynamic right_kidney { get; set; }
        public dynamic urinary_bladder { get; set; }
        public dynamic prostate { get; set; }
        public dynamic post_void_resi_volume { get; set; }
        public dynamic conclusion { get; set; }
        public dynamic recommendation { get; set; }
        #endregion

        public Uusr(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
            dynamic diagnosis,
            dynamic left_kidney,
            dynamic right_kidney,
            dynamic urinary_bladder,
            dynamic prostate,
            dynamic post_void_resi_volume,
            dynamic conclusion,
            dynamic recommendation)
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.diagnosis = diagnosis;
            this.left_kidney = left_kidney;
            this.right_kidney = right_kidney;
            this.urinary_bladder = urinary_bladder;
            this.prostate = prostate;
            this.post_void_resi_volume = post_void_resi_volume;
            this.conclusion = conclusion;
            this.recommendation = recommendation;
        }
      
        public Uusr(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if(response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        #endregion
    }
    public class Surc
    {

        #region Properties
        public static string api = "api/surc";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic admission_date { get; set; }
        public dynamic procedure_date { get; set; }
        public dynamic discharge_date { get; set; }
        public dynamic preo_diagnosis { get; set; }
        public dynamic name_of_procedure { get; set; }
        public dynamic proce_narrative { get; set; }
        public dynamic blood_type { get; set; }
        public dynamic rh { get; set; }
        #endregion

        public Surc(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
            dynamic admission_date,
            dynamic procedure_date,
            dynamic discharge_date,
            dynamic preo_diagnosis,
            dynamic name_of_procedure,
            dynamic proce_narrative,
            dynamic blood_type,
            dynamic rh)
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.admission_date = admission_date;
            this.procedure_date = procedure_date;
            this.discharge_date = discharge_date;
            this.preo_diagnosis = preo_diagnosis;
            this.name_of_procedure = name_of_procedure;
            this.proce_narrative = proce_narrative;
            this.blood_type = blood_type;
            this.rh = rh;
        }

        public Surc(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        #endregion
    }
    public class Somr
    {

        #region Properties
        public static string api = "api/somr";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic form_date { get; set; }
        public dynamic to_date { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic clinical_evolution { get; set; }
        public dynamic result_para_clinical { get; set; }
        public dynamic treatment { get; set; }
        public dynamic eval_treatment { get; set; }
        public dynamic treatment_prognosis { get; set; }
        #endregion

        public Somr(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
            dynamic form_date,
            dynamic to_date,
            dynamic chief_complaint,
            dynamic diagnosis,
            dynamic clinical_evolution,
            dynamic result_para_clinical,
            dynamic treatment,
            dynamic eval_treatment,
            dynamic treatment_prognosis)
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.form_date = form_date;
            this.to_date = to_date;
            this.chief_complaint = chief_complaint;
            this.diagnosis = diagnosis;
            this.clinical_evolution = clinical_evolution;
            this.result_para_clinical = result_para_clinical;
            this.treatment = treatment;
            this.eval_treatment = eval_treatment;
            this.treatment_prognosis = treatment_prognosis;
        }

        public Somr(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if(response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
            else
            {
                System.Diagnostics.Debug.WriteLine(response.Status);
                System.Diagnostics.Debug.WriteLine(response.Data);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, docid));

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI(api + "/log/" + docid);
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        #endregion
    }

    public class Iina
    {
        #region Properties
        public static string api = "api/iina";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic residence_code { get; set; }
        public dynamic residence_desc { get; set; }
        public dynamic residence_other { get; set; }
        public dynamic language_code { get; set; }
        public dynamic language_desc { get; set; }
        public dynamic language_other { get; set; }
        public dynamic req_interpreter { get; set; }
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
        #endregion

        #region

        public Iina(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
             dynamic residence_code,
  dynamic residence_desc,
  dynamic residence_other,
  dynamic language_code,
  dynamic language_desc,
  dynamic language_other,
  dynamic req_interpreter,
  dynamic religion_code,
  dynamic religion_desc,
  dynamic religion_other,
  dynamic spiritual_couns,
  dynamic occupation,
  dynamic living_status_code,
  dynamic living_status_desc,
  dynamic living_status_note,
  dynamic hospital_concern_code,
  dynamic hospital_concern_desc,
  dynamic hospital_concern_other,
  dynamic accompanied,
  dynamic relationship,
  dynamic admit_from_code,
  dynamic admit_from_desc,
  dynamic admit_from_other,
  dynamic arrived,
  dynamic admission_reason,
  dynamic previous_admission,
  dynamic past_med_history,
  dynamic past_med_history_note,
  dynamic past_sur_history,
  dynamic past_sur_history_note,
  dynamic substance_abuse,
  dynamic substance_abuse_other,
  dynamic previous_document,
  dynamic previous_document_note,
  dynamic cur_home_medication,
  dynamic allergy,
  dynamic allergy_note,
  dynamic high_risk_patient,
  dynamic vs_temperature,
  dynamic vs_heart_rate,
  dynamic vs_weight,
  dynamic vs_height,
  dynamic vs_respiratory_rate,
  dynamic vs_BMI,
  dynamic vs_blood_pressure,
  dynamic vs_spO2,
  dynamic vs_pulse,
  dynamic respiratory_system,
  dynamic cough,
  dynamic pro_cough,
  dynamic pro_cough_note,
  dynamic pulse_code,
  dynamic pulse_desc,
  dynamic presence,
  dynamic extremities,
  dynamic oriented,
  dynamic mental_status,
  dynamic mental_status_other,
  dynamic hearing_code,
  dynamic hearing_desc,
  dynamic vision_code,
  dynamic vision_desc,
  dynamic vision_other,
  dynamic speech_code,
  dynamic speech_desc,
  dynamic diet_code,
  dynamic diet_desc,
  dynamic diet_other,
  dynamic diet_pre_code,
  dynamic diet_pre_desc,
  dynamic ng_tube,
  dynamic gastrostomy,
  dynamic size,
  dynamic size_note,
  dynamic last_date_changed,
  dynamic food_dislike,
  dynamic bowel_elimination_code,
  dynamic bowel_elimination_desc,
  dynamic stool_consistency_code,
  dynamic stool_consistency_desc,
  dynamic gas_presence_code,
  dynamic gas_presence_desc,
  dynamic bmi_out_range,
  dynamic loss_weight,
  dynamic reduce_dietary,
  dynamic severely_ill,
  dynamic nutrition_normal,
  dynamic nutrition_score1,
  dynamic nutrition_score2,
  dynamic nutrition_score3,
  dynamic nutrition_score,
  dynamic normal_nutrition_req,
  dynamic severity_score1,
  dynamic severity_score2,
  dynamic severity_score3,
  dynamic severity_score,
  dynamic younger_70,
  dynamic older_70,
  dynamic age_score,
  dynamic total_nutri_score,
  dynamic urination,
  dynamic inter_catheter,
  dynamic inter_catheter_note,
  dynamic ind_catheter,
  dynamic ind_catheter_size,
  dynamic ind_catheter_date,
  dynamic sup_catheter,
  dynamic sup_catheter_size,
  dynamic last_sup_catheter_date,
  dynamic menstruation_code,
  dynamic menstruation_desc,
  dynamic cycle_day,
  dynamic last_mens_period,
  dynamic not_pregnancy,
  dynamic pre_pregnancy,
  dynamic para,
  dynamic cur_pregnancy,
  dynamic pregnancy_week,
  dynamic contraception_code,
  dynamic contraception_desc,
  dynamic contraception_other,
  dynamic mus_history,
  dynamic paralysis,
  dynamic paralysis_note,
  dynamic amputation,
  dynamic amputation_note,
  dynamic contracture,
  dynamic contracture_note,
  dynamic prosthesis,
  dynamic prosthesis_note,
  dynamic cur_in_pain,
  dynamic p_location_1,
  dynamic p_location_2,
  dynamic p_location_3,
  dynamic q_location_1,
  dynamic q_location_2,
  dynamic q_location_3,
  dynamic r_location_1,
  dynamic r_location_2,
  dynamic r_location_3,
  dynamic s_location_1,
  dynamic s_location_2,
  dynamic s_location_3,
  dynamic t_location_1,
  dynamic t_location_2,
  dynamic t_location_3,
  dynamic pain_annotation,
  dynamic using_pain_killer,
  dynamic pain_killer_name,
  dynamic pa_comment,
  dynamic condition,
  dynamic wounds,
  dynamic skin_anno,
  dynamic skin_anno_data,
  dynamic sensory_code,
  dynamic sensory_desc,
  dynamic moisture_code,
  dynamic moisture_desc,
  dynamic activity_code,
  dynamic activity_desc,
  dynamic mobility_code,
  dynamic mobility_desc,
  dynamic nutrition_code,
  dynamic nutrition_desc,
  dynamic friction_code,
  dynamic friction_desc,
  dynamic total_score,
  dynamic pres_sore_risk_code,
  dynamic pres_sore_risk_desc,
  dynamic preven_action,
  dynamic bathing_code,
  dynamic bathing_desc,
  dynamic oral_care_code,
  dynamic oral_care_desc,
  dynamic oral_care_note,
  dynamic dentures_code,
  dynamic dentures_desc,
  dynamic toilet_use_code,
  dynamic toilet_use_desc,
  dynamic dressing_code,
  dynamic dressing_desc,
  dynamic eating_code,
  dynamic eating_desc,
  dynamic turning_bed_code,
  dynamic turning_bed_desc,
  dynamic ambulation_code,
  dynamic ambulation_desc,
  dynamic ambulation_note,
  dynamic sleep_code,
  dynamic sleep_desc,
  dynamic medication_used,
  dynamic fall_history_code,
  dynamic fall_history_desc,
  dynamic secon_diagnosis_code,
  dynamic secon_diagnosis_desc,
  dynamic ambula_aids_code,
  dynamic ambula_aids_desc,
  dynamic intra_therapy_code,
  dynamic intra_therapy_desc,
  dynamic gait_trans_code,
  dynamic gait_trans_desc,
  dynamic fr_mental_status_code,
  dynamic fr_mental_status_desc,
  dynamic fr_total_score,
  dynamic involvement,
  dynamic req_med_equipment,
  dynamic req_foll_care,
  dynamic suicidal_referral,
  dynamic alone_reduce_functional,
  dynamic ref_physiotherapist,
  dynamic ref_speech_therapist,
  dynamic ref_dietician,
  dynamic ref_psychologist,
  dynamic ref_other_hospital,
  dynamic support_at_home,
  dynamic req_transportation,
  dynamic stairs_climb_home,
  dynamic dis_planning,
  dynamic dis_management,
  dynamic assess_date_time
            )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.residence_code = residence_code;
  this.residence_desc = residence_desc;
  this.residence_other = residence_other;
  this.language_code = language_code;
  this.language_desc = language_desc;
  this.language_other = language_other;
  this.req_interpreter = req_interpreter;
  this.religion_code = religion_code;
  this.religion_desc = religion_desc;
  this.religion_other = religion_other;
  this.spiritual_couns = spiritual_couns;
  this.occupation = occupation;
  this.living_status_code = living_status_code;
  this.living_status_desc = living_status_desc;
  this.living_status_note = living_status_note;
  this.hospital_concern_code = hospital_concern_code;
  this.hospital_concern_desc = hospital_concern_desc;
  this.hospital_concern_other = hospital_concern_other;
  this.accompanied = accompanied;
  this.relationship = relationship;
  this.admit_from_code = admit_from_code;
  this.admit_from_desc = admit_from_desc;
  this.admit_from_other = admit_from_other;
  this.arrived = arrived;
  this.admission_reason = admission_reason;
  this.previous_admission = previous_admission;
  this.past_med_history = past_med_history;
  this.past_med_history_note = past_med_history_note;
  this.past_sur_history = past_sur_history;
  this.past_sur_history_note = past_sur_history_note;
  this.substance_abuse = substance_abuse;
  this.substance_abuse_other = substance_abuse_other;
  this.previous_document = previous_document;
  this.previous_document_note = previous_document_note;
  this.cur_home_medication = cur_home_medication;
  this.allergy = allergy;
  this.allergy_note = allergy_note;
  this.high_risk_patient = high_risk_patient;
  this.vs_temperature = vs_temperature;
  this.vs_heart_rate = vs_heart_rate;
  this.vs_weight = vs_weight;
  this.vs_height = vs_height;
  this.vs_respiratory_rate = vs_respiratory_rate;
  this.vs_BMI = vs_BMI;
  this.vs_blood_pressure = vs_blood_pressure;
  this.vs_spO2 = vs_spO2;
  this.vs_pulse = vs_pulse;
  this.respiratory_system = respiratory_system;
  this.cough = cough;
  this.pro_cough = pro_cough;
  this.pro_cough_note = pro_cough_note;
  this.pulse_code = pulse_code;
  this.pulse_desc = pulse_desc;
  this.presence = presence;
  this.extremities = extremities;
  this.oriented = oriented;
  this.mental_status = mental_status;
  this.mental_status_other = mental_status_other;
  this.hearing_code = hearing_code ;
  this.hearing_desc = hearing_desc;
  this.vision_code = vision_code;
  this.vision_desc = vision_desc;
  this.vision_other = vision_other;
  this.speech_code = speech_code;
  this.speech_desc = speech_desc;
  this.diet_code = diet_code;
  this.diet_desc = diet_desc;
  this.diet_other = diet_other;
  this.diet_pre_code = diet_pre_code;
  this.diet_pre_desc = diet_pre_desc;
  this.ng_tube = ng_tube;
  this.gastrostomy = gastrostomy;
  this.size = size;
  this.size_note = size_note;
            this.last_date_changed = last_date_changed;
  this.food_dislike = food_dislike;
  this.bowel_elimination_code = bowel_elimination_code;
  this.bowel_elimination_desc = bowel_elimination_desc;
  this.stool_consistency_code = stool_consistency_code;
  this.stool_consistency_desc = stool_consistency_desc;
  this.gas_presence_code = gas_presence_code;
  this.gas_presence_desc = gas_presence_desc;
  this.bmi_out_range = bmi_out_range;
  this.loss_weight = loss_weight;
  this.reduce_dietary = reduce_dietary;
  this.severely_ill = severely_ill;
  this.nutrition_normal = nutrition_normal;
  this.nutrition_score1 = nutrition_score1;
  this.nutrition_score2 = nutrition_score2;
  this.nutrition_score3 = nutrition_score3;
  this.nutrition_score = nutrition_score;
  this.normal_nutrition_req = normal_nutrition_req;
  this.severity_score1 = severity_score1;
  this.severity_score2 = severity_score2;
  this.severity_score3 = severity_score3;
  this.severity_score = severity_score;
  this.younger_70 = younger_70;
  this.older_70 = older_70;
  this.age_score = age_score;
  this.total_nutri_score = total_nutri_score;
  this.urination = urination;
  this.inter_catheter = inter_catheter;
  this.inter_catheter_note = inter_catheter_note;
  this.ind_catheter = ind_catheter;
  this.ind_catheter_size = ind_catheter_size;
            this.ind_catheter_date = ind_catheter_date;
  this.sup_catheter = sup_catheter;
  this.sup_catheter_size = sup_catheter_size;
            this.last_sup_catheter_date = last_sup_catheter_date;
  this.menstruation_code = menstruation_code;
  this.menstruation_desc = menstruation_desc;
  this.cycle_day = cycle_day;
  this.last_mens_period = last_mens_period;
  this.not_pregnancy = not_pregnancy;
  this.pre_pregnancy = pre_pregnancy;
  this.para = para;
  this.cur_pregnancy = cur_pregnancy;
  this.pregnancy_week = pregnancy_week;
  this.contraception_code = contraception_code;
  this.contraception_desc = contraception_desc;
  this.contraception_other = contraception_other;
  this.mus_history = mus_history ;
  this.paralysis = paralysis;
  this.paralysis_note = paralysis_note;
  this.amputation = amputation;
  this.amputation_note = amputation_note;
  this.contracture = contracture;
  this.contracture_note = contracture_note;
  this.prosthesis = prosthesis;
  this.prosthesis_note = prosthesis_note;
  this.cur_in_pain = cur_in_pain;
  this.p_location_1 = p_location_1;
  this.p_location_2 = p_location_2;
  this.p_location_3 = p_location_3;
  this.q_location_1 = q_location_1;
  this.q_location_2 = q_location_2;
  this.q_location_3 = q_location_3;
  this.r_location_1 = r_location_1;
  this.r_location_2 = r_location_2;
  this.r_location_3 = r_location_3;
  this.s_location_1 = s_location_1;
  this.s_location_2 = s_location_2;
  this.s_location_3 = s_location_3;
  this.t_location_1 = t_location_1;
  this.t_location_2 = t_location_2;
  this.t_location_3 = t_location_3;
  this.pain_annotation = pain_annotation;
  this.using_pain_killer = using_pain_killer;
  this.pain_killer_name = pain_killer_name;
  this.pa_comment = pa_comment;
  this.condition = condition;
  this.wounds = wounds;
  this.skin_anno = skin_anno;
  this.skin_anno_data = skin_anno_data;
  this.sensory_code = sensory_code;
  this.sensory_desc = sensory_desc;
  this.moisture_code = moisture_code;
  this.moisture_desc = moisture_desc;
  this.activity_code = activity_code;
  this.activity_desc = activity_desc;
  this.mobility_code = mobility_code;
  this.mobility_desc = mobility_desc;
  this.nutrition_code = nutrition_code;
  this.nutrition_desc = nutrition_desc;
  this.friction_code = friction_code;
  this.friction_desc = friction_desc;
  this.total_score = total_score;
  this.pres_sore_risk_code = pres_sore_risk_code;
  this.pres_sore_risk_desc = pres_sore_risk_desc;
  this.preven_action = preven_action;
  this.bathing_code = bathing_code;
  this.bathing_desc = bathing_desc;
  this.oral_care_code = oral_care_code;
  this.oral_care_desc = oral_care_desc;
  this.oral_care_note = oral_care_note;
  this.dentures_code = dentures_code;
  this.dentures_desc = dentures_desc;
  this.toilet_use_code = toilet_use_code;
  this.toilet_use_desc = toilet_use_desc;
  this.dressing_code = dressing_code;
  this.dressing_desc = dressing_desc;
  this.eating_code = eating_code;
  this.eating_desc = eating_desc;
  this.turning_bed_code = turning_bed_code;
  this.turning_bed_desc = turning_bed_desc;
  this.ambulation_code = ambulation_code;
  this.ambulation_desc = ambulation_desc;
  this.ambulation_note = ambulation_note;
  this.sleep_code = sleep_code;
  this.sleep_desc = sleep_desc;
  this.medication_used = medication_used;
  this.fall_history_code = fall_history_code;
  this.fall_history_desc = fall_history_desc;
  this.secon_diagnosis_code = secon_diagnosis_code;
  this.secon_diagnosis_desc = secon_diagnosis_desc;
  this.ambula_aids_code = ambula_aids_code;
  this.ambula_aids_desc = ambula_aids_desc;
  this.intra_therapy_code = intra_therapy_code;
  this.intra_therapy_desc = intra_therapy_desc;
  this.gait_trans_code = gait_trans_code;
  this.gait_trans_desc = gait_trans_desc;
  this.fr_mental_status_code = fr_mental_status_code;
  this.fr_mental_status_desc = fr_mental_status_desc ;
  this.fr_total_score = fr_total_score;
  this.involvement = involvement;
  this.req_med_equipment = req_med_equipment;
  this.req_foll_care = req_foll_care;
  this.suicidal_referral = suicidal_referral;
  this.alone_reduce_functional = alone_reduce_functional;
  this.ref_physiotherapist = ref_physiotherapist;
  this.ref_speech_therapist = ref_speech_therapist;
  this.ref_dietician = ref_dietician;
  this.ref_psychologist = ref_psychologist;
  this.ref_other_hospital = ref_other_hospital;
  this.support_at_home = support_at_home;
  this.req_transportation = req_transportation;
            this.stairs_climb_home = stairs_climb_home;
            this.dis_planning = dis_planning;
            this.dis_management = dis_management;
            this.assess_date_time = assess_date_time;
        }
        public static Dictionary<string, string> PRES_SORE_RISK_CODE = new Dictionary<string, string>()
        {
            { "H", "Cao/ High" },
            { "L", "Thấp/ Low" },
            { "V", "Rất cao/ Very high" },
        };
        public static Dictionary<string, string> RESIDENCE_CODE = new Dictionary<string, string>()
        {
            { "VNM", "Việt Nam" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> ARRIVED = new Dictionary<string, string>()
        {
            { "W", "Tự đi được/ Walking" },
            { "WC", "Bằng xe lăn/ Wheelchair" },
            { "S", "Bằng băng ca/ Stretcher" },
        };
        public static Dictionary<string, string> LANGUAGE_CODE = new Dictionary<string, string>()
        {
            { "VI", "Tiếng Việt" },
            { "EN", "Tiếng Anh" },
            { "OTH", "Tiếng khác" },
        };
        public static Dictionary<string, string> RELIGION_CODE = new Dictionary<string, string>()
        {
            { "CH", "Thiên chúa giáo" },
            { "BH", "Phật giáo/ Buddhism" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> LIVING_STATUS_CODE = new Dictionary<string, string>()
        {
            { "ALN", "Một mình/ Alone" },
            { "WTH", "Với vợ, chồng, con, anh, chị, em ruột/ With spouse, children, sibling" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> PULSE_CODE = new Dictionary<string, string>()
        {
            { "I", "Không đều/Irregular" },
            { "R", "Đều/ Regular" },
        };
        public static Dictionary<string, string> SUBSTANCE_ABUSE = new Dictionary<string, string>()
        {
            { "A", "Rượu bia/ Acohol" },
            { "OTH", "Khác/ Other" },
            { "S", "Hút thuốc/ Smoking" },
        };
        public static Dictionary<string, string> HOSPITAL_CONCERN_CODE = new Dictionary<string, string>()
        {
            { "NON", "Không/ None" },
            { "WOR", "Lo âu/ Worriedness" },
            { "OTH", "Khác/ Others" },
            { "REL", "Gia đình, các mối quan hệ/ Family, relationship issues" },
            { "FIN", "Tài chính/ Financial" },
        };
        public static Dictionary<string, string> ADMIT_FROM_CODE = new Dictionary<string, string>()
        {
            { "OTH", "Khác/Referral" },
            { "ER", "Khoa cấp cứu/ ER" },
            { "OPD", "Khoa khám bệnh/ OPD" },
            { "VD", "Bác sĩ hơp tác/ Visiting Doctor" },
        };
        public static Dictionary<string, string> FR_MENTAL_STATUS_CODE = new Dictionary<string, string>()
        {
            { "0", "Hiểu được giới hạn bản thân/Understands limitations = 0" },
            { "15", "Không hiểu được giới hạn bản thân/Does not understand limitation = 15" },
        };
        public static Dictionary<string, string> GAIT_TRANS_CODE = new Dictionary<string, string>()
        {
            { "0", "Bình thường, nằm tại giường/Normal, bedrest = 0" },
            { "10", "Yếu/Weak = 10" },
            { "20", "Suy yếu/Impaired = 20" },
        };
        public static Dictionary<string, string> INTRA_THERAPY_CODE = new Dictionary<string, string>()
        {
            { "0", "Không/No = 0" },
            { "20", "Có/Yes = 20" },
        };

        public static Dictionary<string, string> AMBULATION_CODE = new Dictionary<string, string>()
        {
            { "BF", "Liệt giường/ Bedfast" },
            { "NA", "Cần hỗ trợ (ghi rõ)/ Need assistance (specify)" },
            { "IN", "Tự đi/ Independent" },
        };

        public static Dictionary<string, string> AMBULA_AIDS_CODE = new Dictionary<string, string>()
        {
            { "0", "Không di chuyển, nằm tại giường, điều dưỡng hỗ trợ/ None, bedrest, wheelchair, nurse assist = 0" },
            { "15", "Nạng, thiết bị hỗ trợ đi lại/Crutches, cane walker = 15" },
            { "30", "Sử dụng vật dụng hỗ trợ/Furniture = 30" },
        };

        public static Dictionary<string, string> SECON_DIAGNOSIS_CODE = new Dictionary<string, string>()
        {
            { "0", "Không/No = 0" },
            { "15", "Có/Yes = 15" },
        };
        public static Dictionary<string, string> FALL_HISTORY_CODE = new Dictionary<string, string>()
        {
            { "0", "Không/No = 0" },
            { "25", "Có/Yes = 25" },
        };

        public static Dictionary<string, string> URINATION_CODE = new Dictionary<string, string>()
        {
            { "DY", "Khó tiểu/ Dysuria" },
            { "FR", "Thường xuyên/ Frequency" },
            { "IN", "Không kiểm soát/ Incontinece" },
            { "NM", "Không có vấn đề/ Normal" },
            { "NO", "Tiểu đêm/ Nocturia" },
        };

        public static Dictionary<string, string> NUTRITION_SCORE1_CODE = new Dictionary<string, string>()
        {
            { "1", "Sụt cân > 5% trong 3 tháng Weight loss > 5% in 3 months" },
            { "2", "Ăn ít 50%-75% so với nhu cầu ăn bình thường trong tuần qua Food intake below 50 - 75% of normal requirement in preceding week" },
        };

        public static Dictionary<string, string> NUTRITION_SCORE2_CODE = new Dictionary<string, string>()
        {
            { "1", "Sụt cân > 5% trong 2 tháng Weight loss > 5% in 2 months" },
            { "2", "BMI 18.5-20.5 và tổng trạng suy yếu BMI 18.5 - 20.5 and impaired general condition" },
            { "3", "Ăn ít 25%-50% so với nhu cầu ăn bình thường trong tuần qua Food intake 25–50% of normal requirement in preceding week" },
        };

        public static Dictionary<string, string> NUTRITION_SCORE3_CODE = new Dictionary<string, string>()
        {
            { "1", "Sụt cân > 5% trong 1 tháng Weight loss > 5% in 1 month" },
            { "2", "BMI < 18.5 và tổng trạng suy yếu BMI < 18.5 and impaired general condition" },
            { "3", "Ăn ít 0-25% so với nhu cầu ăn bình thường trong tuần qua Food intake 0-25% of normal requirement in preceding week" },
        };

        public static Dictionary<string, string> SEVERITY_SCORE1_CODE = new Dictionary<string, string>()
        {
            { "1", "Gãy khớp háng/ Hip fracture" },
            { "2", "Bệnh mãn tính có kèm theo biến chứng/ Chronic disease with complications" },
            { "3", "Viêm phổi tắc nghẽn mãn tính/ COPD" },
            { "4", "NB yếu nhưng có thể di chuyển được/ The patient is weak but can move out of bed" },
        };

        public static Dictionary<string, string> SEVERITY_SCORE2_CODE = new Dictionary<string, string>()
        {
            { "1", "Có phẫu thuật ở bụng/ Major abdominal surgery" },
            { "2", "Đột quị/ Stroke" },
            { "3", "Viêm phổi nặng/ Severe pneumonia" },
            { "4", "Bệnh ác tính huyết học/ Hematologic malignancy" },
            { "5", "NB nằm liệt giường/ The patient is bedridden" },
        };

        public static Dictionary<string, string> SEVERITY_SCORE3_CODE = new Dictionary<string, string>()
        {
            { "1", "Chấn thương đầu/ Head injury" },
            { "2", "Ghép tủy xương/ Bone marrow transplantation" },
            { "3", "Bệnh nhân chăm sóc chuyên sâu (APACHE> 10)/ Intensive care patients (APACHE > 10)" },
        };

        public static Dictionary<string, string> HIGH_RISK_PATIENT_CODE = new Dictionary<string, string>()
        {
            { "CH", "Trẻ em (< hoặc 8 tuổi)/ Children (<8 years old)" },
            { "SDP", "Những người bệnh tàn tật năng/ Severely disabled patients" },
            { "ELD", "Người cao tuổi (80 tuổi hoặc hơn)/ Elderly people (80 years old or above)" },
            { "HRF", "Những người bệnh có nguy cơ té ngã cao/ Patients with high risk of falls" },
            { "CCP", "Những người bệnh lú lẫn/hôn mê/ Confused or comatose patients" },
            { "RES", "Người bệnh bị kìm giữ/ Restrained patients" },
            { "HRT", "Người bệnh đang điều trị có nguy cơ cao (như chạy thận nhân tạo, hóa trị liệu..)/ Patients that receiving high-risk treatments (such as dialysis, chemotherapy…)" },
        };

        public static Dictionary<string, string> RESPIRATORY_SYSTEM_CODE = new Dictionary<string, string>()
        {
            { "N", "Không có vấn đề/ Normal" },
            { "D", "Khó thở/ Dyspnea" },
            { "O", "Khó thở nằm/ Orthopnea" },
            { "W", "Khó thở khò khè/ Wheeze" },
            { "C", "Da xanh tái/ Cyanosis" },
        };

        public static Dictionary<string, string> PRESENCE_CODE = new Dictionary<string, string>()
        {
            { "CP", "Đau ngực/ Chest pain" },
            { "DI", "Chóng mặt/ Dizzinness" },
            { "CA", "Đau bắp chân/ Calf pain" },
            { "PE", "Phù ngoại biên/ Peripheral edema" },
        };

        public static Dictionary<string, string> EXTREMITIES_CODE = new Dictionary<string, string>()
        {
            { "WA", "Ấm/ Warm" },
            { "CO", "Lạnh/ Cold" },
            { "CL", "Ẩm ướt/ Clammy" },
            { "CY", "Xanh tái/ Cyanosed" },
        };

        public static Dictionary<string, string> ORIENTED_CODE = new Dictionary<string, string>()
        {
            { "DAY", "Ngày/ Day" },
            { "TIME", "Thời gian/ Time" },
            { "PER", "Người/ Person" },
            { "PLA", "Nơi/ Place" },
            { "NA", "Không định hướng được/ Not all all" },
        };

        public static Dictionary<string, string> MENTAL_STATUS_CODE = new Dictionary<string, string>()
        {
            { "AL", "Tỉnh táo/ Alert" },
            { "CF", "Nhầm lẫn/ Confused" },
            { "AG", "Kích động/ Agitated" },
            { "FR", "Quấy/ Fretful" },
            { "OTH", "Khác/ Other" },
            { "DE", "Trầm cảm/ Depressed" },
            { "LE", "Lơ mơ/ Lethargic" },
        };

        public static Dictionary<string, string> HEARING_CODE = new Dictionary<string, string>()
        {
            { "N", "Bình thường/ Normal" },
            { "HI", "Khiếm thính/ Hearing impaired" },
            { "HA", "Dùng máy trợ thính (Trái/Phải)/ Uses hearing aid (Left/Right)" },
        };

        public static Dictionary<string, string> DIET_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "BF", "Bú bình/ Bottle feeding" },
            { "TBF", "Bú mẹ hoàn toàn/ Total breast feeding" },
            { "OTH", "Khác/ Other" },
        };

        public static Dictionary<string, string> DIET_PRE_CODE = new Dictionary<string, string>()
        {
            { "V", "Nôn/ Vomiting" },
            { "N", "Buồn nôn/ Nausea" },
            { "S", "Nuốt khó (chuyển đến chuyên gia trị liệu)/ Swalloing difficulties (refer to therapist)" },
        };

        public static Dictionary<string, string> BOWEL_ELIMINATION_CODE = new Dictionary<string, string>()
        {
            { "TWO", "2 lần/ ngày (2 times/day)" },
            { "ONE", "1 lần/ ngày (1 time/day)" },
            { "EOD", "Cách ngày/ Every other day" },
            { "OTH", "Khác/ Other" },
        };

        public static Dictionary<string, string> STOOL_CONSISTENCY_CODE = new Dictionary<string, string>()
        {
            { "H", "Cứng/ Hard" },
            { "F", "Có hình dạng/ Formed" },
            { "L", "Lỏng/ Loose" },
            { "W", "Phân nước/ Watery" },
        };

        public static Dictionary<string, string> GAS_PRESENCE_CODE = new Dictionary<string, string>()
        {
            { "N", "Bình thường/ Normal" },
            { "I", "Không kiểm soát/ Incontinence" },
            { "S", "Hậu môn nhân tạo/ Stoma" },
        };

        public static Dictionary<string, string> VISION_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "GL", "Đeo kính/ Glasses" },
            { "CL", "Kính sát tròng/ Contact lenses" },
            { "OTH", "Khác/ Other" },
        };

        public static Dictionary<string, string> SPEECH_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "SL", "Nói lắp/ Slurred" },
            { "AP", "Chứng mất ngôn ngữ/ Aphasic" },
            { "NC", "Không giao tiếp (Bất tỉnh or mê)/ Non-communicative(Unconscious )" },
            { "SI", "Khiếm ngôn/ Speech impaired" },
            { "NV", "Chưa biết nói/ Non-verbal" },
        };

        public static Dictionary<string, string> MENSTRUATION_CODE = new Dictionary<string, string>()
        {
            { "ME", "Mãn kinh/ Menopause" },
            { "AM", "Vô kinh/ Amenorrhea" },
            { "CY", "Chu kỳ (ngày)/ Cycle (day)" },
        };

        public static Dictionary<string, string> CONTRACEPTION_CODE = new Dictionary<string, string>()
        {
            { "NO", "Không/ No" },
            { "PILL", "Thuốc ngừa thai/ Contraceptive pill" },
            { "OTH", "Khác/ Other" },
            { "DEV", "Dụng cụ ngừa thai đặt trong tử cung/ Intrauterine Device" },
        };

        public static Dictionary<string, string> MUS_HISTORY = new Dictionary<string, string>()
        {
            { "JP", "Đau khớp/ Joint pain" },
            { "MS", "Sự co rút cơ/ Muscle spasms" },
            { "NM", "Bình thường/ Normal" },
            { "JS", "Sưng khớp/ Joint swelling" },
        };

        public static Dictionary<string, string> CONDITION_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "PA", "Tái/ Pale" },
            { "FL", "Đỏ/ Flush" },
            { "JA", "Vàng da/ Jaundiced" },
            { "DR", "Khô/ Dry" },
            { "OI", "Nhờn/ Oily" },
            { "SW", "Nhiều mồ hôi/ Sweaty" },
            { "RA", "Phát ban/ Rash" },
        };

        public static Dictionary<string, string> WOUNDS_CODE = new Dictionary<string, string>()
        {
            { "1", "Máu tụ (1)/ Haematoma" },
            { "2", "Sự thâm tím (2)/ Bruises" },
            { "3", "Rách (3)/ Laceration" },
            { "4", "Sẹo (4)/ Scar" },
            { "5", "Phỏng (5)/ Burn" },
            { "6", "Loét do tỳ đè (6)/ Pressure sore" },
        };

        public static Dictionary<string, string> BATHING_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự tắm/ Independent" },
            { "AS", "Cần sự hỗ trợ khi tắm/ Assisted in shower" },
            { "DB", "Tự tắm tại giường/ Dependent in bed" },
            { "AB", "Hỗ trợ tắm tại giường/ Assisted in bed" },
        };

        public static Dictionary<string, string> ORAL_CARE_CODE = new Dictionary<string, string>()
        {
            { "AB", "Hỗ trợ đánh răng/ Assisted to brush teeth" },
            { "PU", "Chỉ chuẩn bị đồ dùng/ Prepare utensils only" },
            { "OC", "Tự làm/ Independent" },
            { "OTH", "." },
            { "DB", "Dependent in bed" },
        };

        public static Dictionary<string, string> DENTURES_CODE = new Dictionary<string, string>()
        {
            { "P", "Từng phần/ Partial" },
            { "L", "Hàm dưới/ Lower" },
            { "N", "Không có/ None" },
            { "U", "Hàm trên/ Upper" },
        };

        public static Dictionary<string, string> TOILET_USE_CODE = new Dictionary<string, string>()
        {
            { "AC", "Cần hỗ trợ trên ghế dùng để tiểu tiện trong phòng/ Assisted on the commode" },
            { "AT", "Cần hỗ trợ khi đi vệ sinh/ Assisted to the toilet" },
            { "BU", "Bô dùng tại giường/ Bedpan/urine bottle" },
            { "CA", "Ống thông tiểu/ Urinary catheter" },
            { "DI", "Tã/ Diaper" },
            { "IN", "Tự vệ sinh/ Independent" },
            { "UC", "Ống thông tiểu đặt ngoài bàng quang/ Urinary condom" },
        };

        public static Dictionary<string, string> DRESSING_CODE = new Dictionary<string, string>()
        {
            { "WA", "Cần hỗ trợ/ With assistance" },
            { "IN", "Tự làm/ Independent" },
        };

        public static Dictionary<string, string> EATING_CODE = new Dictionary<string, string>()
        {
            { "DP", "Phụ thuộc về tư thế/ Dependon position" },
            { "TU", "Cho ăn qua ống/ NG tube/Gastrostomy" },
            { "DA", "Phụ thuộc về ăn uống/ Dependent to eat" },
            { "IN", "Tự ăn/ Independent" },
        };

        public static Dictionary<string, string> TURNING_BED_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự xoay sở/ Independent" },
            { "DN", "Không tự xoay sở/ Does not turn independently" },
        };

        //public static Dictionary<string, string> AMBULATION_CODE = new Dictionary<string, string>()
        //{
        //    { "BF", "Liệt giường/ Bedfast" },
        //    { "NA", "Cần hỗ trợ (ghi rõ)/ Need assistance (specify)" },
        //    { "IN", "Tự đi/ Independent" },
        //};

        public static Dictionary<string, string> SLEEP_CODE = new Dictionary<string, string>()
        {
            { "PFA", "Khó ngủ/ Problem to fall asleep" },
            { "PST", "Khó ngủ say/ Problem to sleep through" },
            { "NM", "Bình thường/ Normal" },
            { "AE", "Thức sớm/ Awake early" },
        };

        public static Dictionary<string, string> SENSORY_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Giới hạn hoàn toàn/ Completely limited" },
            { "2", "2_Giới hạn nhiều/ Very limited" },
            { "3", "3_Giới hạn ít/ Slightly limited" },
            { "4", "4_Không giới hạn/ No limitations" },
        };

        public static Dictionary<string, string> MOISTURE_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Liên tục ẩm/ Constantly moist" },
            { "2", "2_Thường ẩm/ Often moist" },
            { "3", "3_Thỉnh thoảng ẩm/ Occasionally moist" },
            { "4", "4_Hiếm khi ẩm/ Rarely moist" },
        };

        public static Dictionary<string, string> ACTIVITY_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Nằm liệt giường/ Bedfast" },
            { "2", "2_Cố định trên ghế/ Chairfast" },
            { "3", "3_Thỉnh thoảng đi lại Walks/ occasionally moist" },
            { "4", "4_Đi lại thường xuyên/ Walks frequently" },
        };

        public static Dictionary<string, string> MOBILITY_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Hoàn toàn bất động/ Completely immobile" },
            { "2", "2_Rất hạn chế/ Very limited" },
            { "3", "3_Ít hạn chế/ Slightly limited" },
            { "4", "4_Không giới hạn/ No limitations" },
        };

        public static Dictionary<string, string> NUTRITION_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Rất kém/ Very poor" },
            { "2", "2_Có thể không đầy đủ/ Probably inadequate" },
            { "3", "3_Đầy đủ/ Adequate" },
            { "4", "4_Hoàn hảo/ Excellent" },
        };

        public static Dictionary<string, string> FRICTION_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Có vấn đề/ Problem" },
            { "2", "2_Vấn đề tiềm ẩn/ Potential problem" },
            { "3", "3_Không có vấn đề/ No problem" },
        };

        public static Dictionary<string, string> SKIN_ANNO = new Dictionary<string, string>()
        {
            { "id", "" },
            { "location", "" },
            { "type", "" },
        };
        #endregion
        public Iina(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if(response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);
                WebHelpers.BindingDatafield(db, this);
            } 
            else if(response.Status == System.Net.HttpStatusCode.NotFound)
            {

            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }

        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        #endregion
    }

    public class Iima
    {

        #region Properties
        public static string api = "api/iima";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic cur_med_history { get; set; }
        public dynamic cur_medication { get; set; }
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
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic physical_exam { get; set; }
        public dynamic psy_consul_required { get; set; }
        public dynamic laboratory_result { get; set; }
        public dynamic add_investigation { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic diff_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_plan { get; set; }
        public dynamic discharge_plan { get; set; }
        #endregion

        public Iima(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
              dynamic chief_complaint,
              dynamic cur_med_history,
              dynamic cur_medication,
              dynamic personal,
              dynamic habits_smoking,
              dynamic habits_smoking_pack,
              dynamic habits_alcohol,
              dynamic habits_alcohol_note,
              dynamic habits_drugs,
              dynamic habits_drugs_note,
              dynamic habits_physical_exercise,
              dynamic habits_phy_exer_note,
              dynamic habits_other,
              dynamic allergy,
              dynamic allergy_note,
              dynamic family,
              dynamic immunization,
              dynamic vs_temperature,
              dynamic vs_heart_rate,
              dynamic vs_weight,
              dynamic vs_height,
              dynamic vs_respiratory_rate,
              dynamic vs_BMI,
              dynamic vs_blood_pressure,
              dynamic vs_spO2,
              dynamic vs_pulse,
              dynamic physical_exam,
              dynamic psy_consul_required,
              dynamic laboratory_result,
              dynamic add_investigation,
              dynamic initial_diagnosis,
              dynamic diagnosis,
              dynamic diff_diagnosis,
              dynamic associated_conditions,
              dynamic treatment_plan,
              dynamic discharge_plan
            )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.chief_complaint = chief_complaint;
            this.cur_med_history = cur_med_history;
            this.cur_medication = cur_medication;
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
            this.vs_temperature = vs_temperature;
            this.vs_heart_rate = vs_heart_rate;
            this.vs_weight = vs_weight;
            this.vs_height = vs_height;
            this.vs_respiratory_rate = vs_respiratory_rate;
            this.vs_BMI = vs_BMI;
            this.vs_blood_pressure = vs_blood_pressure;
            this.vs_spO2 = vs_spO2;
            this.vs_pulse = vs_pulse;
            this.physical_exam = physical_exam;
            this.psy_consul_required = psy_consul_required;
            this.laboratory_result = laboratory_result;
            this.add_investigation = add_investigation;
            this.initial_diagnosis = initial_diagnosis;
            this.diagnosis = diagnosis;
            this.diff_diagnosis = diff_diagnosis;
            this.associated_conditions = associated_conditions;
            this.treatment_plan = treatment_plan;
            this.discharge_plan = discharge_plan;
        }

        public Iima(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }

        public static dynamic UpdateVitalSign(string document_id)
        {
            return WebHelpers.PostAPI($"{api}/update-vital-sign/{document_id}");
        }
        #endregion
    }

    public class Mrfv
    {

        #region Properties
        public static string api = "api/mrfv";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic cur_med_history { get; set; }
        public dynamic cur_medications { get; set; }
        public dynamic personal { get; set; }
        public dynamic family { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_text { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic scr_before_vacc_1 { get; set; }
        public dynamic scr_before_vacc_2 { get; set; }
        public dynamic scr_before_vacc_3 { get; set; }
        public dynamic scr_before_vacc_4 { get; set; }
        public dynamic scr_before_vacc_5 { get; set; }
        public dynamic scr_before_vacc_6 { get; set; }
        public dynamic scr_before_vacc_7 { get; set; }
        public dynamic scr_before_vacc_8 { get; set; }
        public dynamic appointed_vaccine { get; set; }
        public dynamic additional_investigations { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic differential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_code { get; set; }
        public dynamic treatment_desc { get; set; }
        public dynamic spec_opinion_req { get; set; }
        public dynamic spec_opinion_req_text { get; set; }
        public dynamic pecific_edu_req { get; set; }
        public dynamic next_appointment { get; set; }
        #endregion

        public Mrfv(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
             dynamic chief_complaint,
             dynamic cur_med_history,
             dynamic cur_medications,
             dynamic personal,
             dynamic family,
             dynamic allergy,
             dynamic allergy_text,
             dynamic vs_temperature,
             dynamic vs_heart_rate,
             dynamic vs_weight,
             dynamic vs_height,
             dynamic vs_respiratory_rate,
             dynamic vs_BMI,
             dynamic vs_blood_pressure,
             dynamic vs_spO2,
             dynamic vs_pulse,
             dynamic scr_before_vacc_1,
             dynamic scr_before_vacc_2,
             dynamic scr_before_vacc_3,
             dynamic scr_before_vacc_4,
             dynamic scr_before_vacc_5,
             dynamic scr_before_vacc_6,
             dynamic scr_before_vacc_7,
             dynamic scr_before_vacc_8,
             dynamic appointed_vaccine,
             dynamic additional_investigations,
             dynamic initial_diagnosis,
             dynamic differential_diagnosis,
             dynamic associated_conditions,
             dynamic treatment_code,
             dynamic treatment_desc,
             dynamic spec_opinion_req,
             dynamic spec_opinion_req_text,
             dynamic pecific_edu_req,
             dynamic next_appointment
            )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.chief_complaint = chief_complaint;
            this.cur_med_history = cur_med_history;
            this.cur_medications = cur_medications;
            this.personal = personal;
            this.family = family;
            this.allergy = allergy;
            this.allergy_text = allergy_text;
            this.vs_temperature = vs_temperature;
            this.vs_heart_rate = vs_heart_rate;
            this.vs_weight = vs_weight;
            this.vs_height = vs_height;
            this.vs_respiratory_rate = vs_respiratory_rate;
            this.vs_BMI = vs_BMI;
            this.vs_blood_pressure = vs_blood_pressure;
            this.vs_spO2 = vs_spO2;
            this.vs_pulse = vs_pulse;
            this.scr_before_vacc_1 = scr_before_vacc_1;
            this.scr_before_vacc_2 = scr_before_vacc_2;
            this.scr_before_vacc_3 = scr_before_vacc_3;
            this.scr_before_vacc_4 = scr_before_vacc_4;
            this.scr_before_vacc_5 = scr_before_vacc_5;
            this.scr_before_vacc_6 = scr_before_vacc_6;
            this.scr_before_vacc_7 = scr_before_vacc_7;
            this.scr_before_vacc_8 = scr_before_vacc_8;
            this.appointed_vaccine = appointed_vaccine;
            this.additional_investigations = additional_investigations;
            this.initial_diagnosis = initial_diagnosis;
            this.differential_diagnosis = differential_diagnosis;
            this.associated_conditions = associated_conditions;
            this.treatment_code = treatment_code;
            this.treatment_desc = treatment_desc;
            this.spec_opinion_req = spec_opinion_req;
            this.spec_opinion_req_text = spec_opinion_req_text;
            this.pecific_edu_req = pecific_edu_req;
            this.next_appointment = next_appointment;

        }

        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };
        public static Dictionary<string, string> APPOINTED_VACCINE = new Dictionary<string, string>()
        {
            { "id", "" },
            { "drug_name", "" },
            { "strength", "" },
            { "router", "" },
            { "reason", "" },
        };
        public Mrfv(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        #endregion
    }

    public class Mrnv
    {
        public static Dictionary<string, string> APPOINTED_VACCINE = new Dictionary<string, string>()
        {
            { "id", "" },
            { "drug_name", "" },
            { "strength", "" },
            { "router", "" },
            { "reason", "" },
        };
        #region Properties
        public static string api = "api/mrnv";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic cur_med_history { get; set; }
        public dynamic cur_medications { get; set; }
        public dynamic personal { get; set; }
        public dynamic family { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_text { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_SpO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic scr_before_vacc_1 { get; set; }
        public dynamic scr_before_vacc_2 { get; set; }
        public dynamic scr_before_vacc_3 { get; set; }
        public dynamic scr_before_vacc_4 { get; set; }
        public dynamic scr_before_vacc_5 { get; set; }
        public dynamic scr_before_vacc_6 { get; set; }
        public dynamic scr_before_vacc_7 { get; set; }
        public dynamic scr_before_vacc_8 { get; set; }
        public dynamic scr_before_vacc_9 { get; set; }
        public dynamic appointed_vaccine { get; set; }
        public dynamic additional_investigations { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic differential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_code { get; set; }
        public dynamic treatment_desc { get; set; }
        public dynamic spec_opinion_req { get; set; }
        public dynamic spec_opinion_req_text { get; set; }
        public dynamic pecific_edu_req { get; set; }
        public dynamic next_appointment { get; set; }
        #endregion

        public Mrnv(
            dynamic document_id,
            dynamic user_name,
            dynamic status,
            dynamic amend_reason,
             dynamic chief_complaint,
             dynamic cur_med_history,
             dynamic cur_medication,
             dynamic personal,
             dynamic family,
             dynamic allergy,
             dynamic allergy_text,
             dynamic vs_temperature,
             dynamic vs_heart_rate,
             dynamic vs_weight,
             dynamic vs_height,
             dynamic vs_respiratory_rate,
             dynamic vs_BMI,
             dynamic vs_blood_pressure,
             dynamic vs_SpO2,
             dynamic vs_pulse,
             dynamic scr_before_vacc_1,
             dynamic scr_before_vacc_2,
             dynamic scr_before_vacc_3,
             dynamic scr_before_vacc_4,
             dynamic scr_before_vacc_5,
             dynamic scr_before_vacc_6,
             dynamic scr_before_vacc_7,
             dynamic scr_before_vacc_8,
             dynamic scr_before_vacc_9,
             dynamic appointed_vaccine,
             dynamic additional_investigations,
             dynamic initial_diagnosis,
             dynamic differential_diagnosis,
             dynamic associated_conditions,
             dynamic treatment_code,
             dynamic treatment_desc,
             dynamic spec_opinion_req,
             dynamic spec_opinion_req_text,
             dynamic pecific_edu_req,
             dynamic next_appointment
            )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.chief_complaint = chief_complaint;
            this.cur_med_history = cur_med_history;
            this.cur_medications = cur_medications;
            this.personal = personal;
            this.family = family;
            this.allergy = allergy;
            this.allergy_text = allergy_text;
            this.vs_temperature = vs_temperature;
            this.vs_heart_rate = vs_heart_rate;
            this.vs_weight = vs_weight;
            this.vs_height = vs_height;
            this.vs_respiratory_rate = vs_respiratory_rate;
            this.vs_BMI = vs_BMI;
            this.vs_blood_pressure = vs_blood_pressure;
            this.vs_SpO2 = vs_SpO2;
            this.vs_pulse = vs_pulse;
            this.scr_before_vacc_1 = scr_before_vacc_1;
            this.scr_before_vacc_2 = scr_before_vacc_2;
            this.scr_before_vacc_3 = scr_before_vacc_3;
            this.scr_before_vacc_4 = scr_before_vacc_4;
            this.scr_before_vacc_5 = scr_before_vacc_5;
            this.scr_before_vacc_6 = scr_before_vacc_6;
            this.scr_before_vacc_7 = scr_before_vacc_7;
            this.scr_before_vacc_8 = scr_before_vacc_8;
            this.scr_before_vacc_9 = scr_before_vacc_9;
            this.appointed_vaccine = appointed_vaccine;
            this.additional_investigations = additional_investigations;
            this.initial_diagnosis = initial_diagnosis;
            this.differential_diagnosis = differential_diagnosis;
            this.associated_conditions = associated_conditions;
            this.treatment_code = treatment_code;
            this.treatment_desc = treatment_desc;
            this.spec_opinion_req = spec_opinion_req;
            this.spec_opinion_req_text = spec_opinion_req_text;
            this.pecific_edu_req = pecific_edu_req;
            this.next_appointment = next_appointment;

        }

        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };


        public Mrnv(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        #endregion
    }

    public class Oina
    {
        #region Properties
        public static string api = "api/oina";
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

        public static Dictionary<string, string> NUTRITION_STATUS_CODE = new Dictionary<string, string>()
        {
            { "U", "Suy dinh dưỡng/ Undernutrition" },
            { "O", "Thừa cân hoặc béo phì/ Overweight or obesity" },
            { "N", "Bình thường/ Normal" },
        };

        public static Dictionary<string, string> PAINT_SCORE_CODE = new Dictionary<string, string>()
        {
            { "0", "Không đau/ No hurt" },
            { "1", "Đau rất ít/ Little hurt" },
            { "2", "Đau nhẹ/ Slight hurt" },
            { "3", "Đau vừa/ Considerable hurt" },
            { "4", "Đau nhiều/ Serious hurt" },
            { "5", "Rất đau/ Worst hurt" },
        };

        public static Dictionary<string, string> HOUSING_CODE = new Dictionary<string, string>()
        {
            { "ALN", "Sống một mình<div> Lives alone</div>" },
            { "REL", "Sống với người thân<div> With relatives</div>" },
        };

        public static Dictionary<string, string> PRIORITIZATION_CODE = new Dictionary<string, string>()
        {
            { "IM", "Cần được khám ngay/ Immediate consulting requirement" },
            { "WA", "Có thể chờ khám trong khoảng thời gian xác định/ Be able to wait for consultation at a specific time" },
        };

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
        public Oina(dynamic vs_temperature, dynamic vs_heart_rate, dynamic vs_weight, dynamic vs_respiratory_rate, dynamic vs_height, dynamic vs_BMI, dynamic vs_blood_pressure, dynamic vs_spO2, dynamic pulse, dynamic chief_complaint, dynamic allergy, dynamic allergy_note, dynamic mental_status, dynamic mental_status_note, dynamic paint_score_code, dynamic paint_score_description, dynamic fall_risk, dynamic fall_risk_assistance, dynamic nutrition_status_code, dynamic nutrition_status_description, dynamic housing_code, dynamic housing_description, dynamic prioritization_code, dynamic prioritization_description, dynamic assessment_date_time, dynamic document_id, dynamic model_id, dynamic patient_visit_id, dynamic status, dynamic created_user_id, dynamic created_name_e, dynamic created_name_l, dynamic created_date_time, dynamic modified_user_id, dynamic modified_name_e, dynamic modified_name_l, dynamic modified_date_time, dynamic submited_user_id, dynamic submited_name_e, dynamic submited_name_l, dynamic submited_date_time, dynamic signed_user_id, dynamic signed_name_e, dynamic signed_name_l, dynamic signed_date_time, dynamic delete_user_id, dynamic delete_name_e, dynamic delete_name_l, dynamic delete_date_time, dynamic document_type_rcd, dynamic amend_reason)
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

        public Oina(string document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }
        
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }
            return message;
        }

        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
    }

    #region Pomr

    public class POMR
    {
        #region Properties
        public static string api = "api/pomr";
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
        public dynamic tranfer { get; set; }
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

        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };
        public POMR() { }
        public POMR(string document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        //
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        public static dynamic UpdateVitalSign(string document_id) { 
            return WebHelpers.PostAPI($"{api}/update-vital-sign/{DataHelpers._LOCATION}/{document_id}");
        }
    }

    #endregion

    public partial class PatientInfo
    {
        #region Properties
        public string p_info;
        public int p_age;
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

        #endregion
        public PatientInfo() { }
        public PatientInfo(string _patient_id) {
            this.patient_id = _patient_id;
        }
        
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

    public class Omr
    {
        #region Properties
        public static string api = "api/omr";
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

        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };

        #region Methods
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }

        public static dynamic UpdateVitalSign(string document_id)
        {
            return WebHelpers.PostAPI($"{api}/update-vital-sign/{DataHelpers._LOCATION}/{document_id}");
        }
        #endregion

        #region Constructors
        public Omr() { }

        // Constructor for API Update
        /// <summary>
        /// Get document by document_id
        /// </summary>
        /// <param name="document_id"></param>
        public Omr(dynamic document_id)
        {

            DataTable tbl = new DataTable();
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                tbl = WebHelpers.GetJSONToDataTable(response.Data);
                WebHelpers.BindingDatafield(tbl, this);
                DataHelpers.varDocumentStatus = this.status;
            }
        }
        // Constructor for API Delete
        /// <summary>
        /// Method for API delete document by document_id & use_name
        /// </summary>
        /// <param name="document_id"></param>
        /// <param name="use_name"></param>
        public Omr(dynamic document_id, dynamic use_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }
        // Constructor for API Inssert
        public Omr(dynamic document_id
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
    public partial class Ogia
    {
        #region Ogia_Properties
        private static dynamic api = "api/ogia";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }

        //public Guid document_id { get; set; }
        public dynamic reason_admission { get; set; }
        public dynamic is_obs_gyn { get; set; }
        public dynamic lmp_from { get; set; }
        public dynamic lmp_to { get; set; }
        public dynamic ges_age_weeks { get; set; }
        public dynamic ges_age_days { get; set; }
        public dynamic prenatal_visit { get; set; }
        public dynamic tetanus_vaccination { get; set; }
        public dynamic tetanus_vaccin_time { get; set; }
        public dynamic gbs_disease { get; set; }
        public dynamic gbs_bacteriuria { get; set; }
        public dynamic gbs_vaginal { get; set; }
        public dynamic ges_diabetes { get; set; }
        public dynamic other_ges_abnormal { get; set; }
        public dynamic other_ges_abnormal_note { get; set; }
        public dynamic labor_trig_at_time { get; set; }
        public dynamic preliminary_signs { get; set; }
        public dynamic progression { get; set; }
        public dynamic obs_cur_medication { get; set; }
        public dynamic gyn_med_history { get; set; }
        public dynamic gyn_cur_medication { get; set; }
        public dynamic personal { get; set; }
        public dynamic family { get; set; }
        public dynamic age_of_menarhce { get; set; }
        public dynamic menstrual_cycle { get; set; }
        public dynamic length_of_period { get; set; }
        public dynamic amount_mens_blood { get; set; }
        public dynamic marriage_age { get; set; }
        public dynamic age_menopause { get; set; }
        public dynamic previous_gyn_diseases { get; set; }
        public dynamic obs_history { get; set; }
        public dynamic general_appearance { get; set; }
        public dynamic edema { get; set; }
        public dynamic edema_note { get; set; }
        public dynamic cardio_system { get; set; }
        public dynamic respiratory_system { get; set; }
        public dynamic digestive_system { get; set; }
        public dynamic nervous_system { get; set; }
        public dynamic uro_system { get; set; }
        public dynamic mus_system { get; set; }
        public dynamic otorhinolaryngology { get; set; }

        public dynamic integumentary_system { get; set; }
        public dynamic ophthalmology { get; set; }
        public dynamic other_findings { get; set; }
        public dynamic psy_consul_required { get; set; }
        public dynamic obs_pre_cicatrice { get; set; }
        public dynamic obs_uterine_shape { get; set; }
        public dynamic obs_posture { get; set; }
        public dynamic obs_fundal_height { get; set; }
        public dynamic obs_abdominal_circum { get; set; }
        public dynamic obs_uterine_con { get; set; }
        public dynamic obs_fetal_heart_rate { get; set; }
        public dynamic obs_breasts { get; set; }
        public dynamic obs_vulva { get; set; }
        public dynamic obs_vagina { get; set; }
        public dynamic obs_perineum { get; set; }
        public dynamic obs_cervix { get; set; }
        public dynamic obs_adnexa { get; set; }
        public dynamic obs_mem_condition_code { get; set; }
        public dynamic obs_mem_condition_desc { get; set; }
        public dynamic obs_mem_con_attri_code { get; set; }
        public dynamic obs_mem_con_attri_desc { get; set; }
        public dynamic obs_rup_of_mem_at { get; set; }
        public dynamic obs_rup_of_mem_code { get; set; }
        public dynamic obs_rup_of_mem_desc { get; set; }
        public dynamic obs_feat_amniotic { get; set; }
        public dynamic obs_color_amniotic { get; set; }
        public dynamic obs_presentation_code { get; set; }
        public dynamic obs_presentation_desc { get; set; }
        public dynamic obs_presentation_other { get; set; }
        public dynamic obs_fetal_position { get; set; }
        public dynamic obs_pelvic_exam { get; set; }
        public dynamic obs_bishop_score { get; set; }
        public dynamic gyn_abdo_sur_scars { get; set; }
        public dynamic gyn_reason { get; set; }
        public dynamic gyn_uterine_height { get; set; }
        public dynamic gyn_vulva { get; set; }
        public dynamic gyn_perineum { get; set; }
        public dynamic gyn_vagina { get; set; }
        public dynamic gyn_discharge { get; set; }
        public dynamic gyn_cervix { get; set; }
        public dynamic gyn_uterus { get; set; }
        public dynamic gyn_adnexa { get; set; }
        public dynamic gyn_douglas_pouchs { get; set; }
        public dynamic lab_result { get; set; }
        public dynamic add_investigations { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic diff_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_plan { get; set; }
        public dynamic discharge_plan { get; set; }


        #endregion

        public static string OBS_HISTORY_TEMPLATE = "[{\"id\":1,\"label\":\"Năm/ Year\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":2,\"label\":\"Sanh đủ tháng/ term delivery\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":3,\"label\":\"Sanh non tháng/ preterm delivery\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":4,\"label\":\"Sảy thai/ miscarriage\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":5,\"label\":\"Hút thai/ aspiration abortion\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":6,\"label\":\"Nạo thai/ dilation and evacuation\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":7,\"label\":\"Thủ thuật Kovac/ Kovac’s procedure\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":8,\"label\":\"Thai ngoài tử cung/ ectopic\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":9,\"label\":\"Thai trứng/ molar pregnancy\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":10,\"label\":\"Thai lưu/ stillbirth\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":11,\"label\":\"Sinh sống/ living child\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":12,\"label\":\"Cân nặng/ weight\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":13,\"label\":\"Phương pháp sinh/ delivery mode\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"},{\"id\":14,\"label\":\"Biến chứng/ complication\",\"grav_1\":\"\",\"grav_2\":\"\",\"grav_3\":\"\",\"grav_4\":\"\",\"grav_5\":\"\",\"grav_6\":\"\"}]";

        #region Dictionary
        public static Dictionary<string, string> OBS_HISTORY = new Dictionary<string, string>()
        {
            { "id", "" },
            { "label", "" },
            { "grav_1", "" },
            { "grav_2", "" },
            { "grav_3", "" },
            { "grav_4", "" },
            { "grav_5", "" },
            { "grav_6", "" },
        };

        public static Dictionary<string, string> OBS_FEAT_AMNIOTIC = new Dictionary<string, string>()
        {
            { "N", "Bình thường/ Normal" },
            { "O", "Thiểu ối/ Oligohydramnios" },
            { "P", "Đa ối/ Polyhydramnios" },
        };
        public static Dictionary<string, string> OBS_PRESENTATION_CODE = new Dictionary<string, string>()
        {
            { "O", "Ngôi khác/ Others, specify" },
            { "B", "Mông/ Breech" },
            { "C", "Đầu/ Cephalic" },
        };

        public static Dictionary<string, string> OBS_MEM_CONDITION_CODE = new Dictionary<string, string>()
        {
            { "IN", "Nguyên vẹn/ Intact" },
            { "RU", "Đã vỡ/ Ruptured" },
        };
        
        public static Dictionary<string, string> OBS_MEM_CON_ATTRI_CODE = new Dictionary<string, string>()
        {
            { "FLAT", "Dẹt/Flat" },
            { "INFLAT", "Phồng/Inflattable" },
        };

        public static Dictionary<string, string> OBS_RUP_OF_MEM_CODE = new Dictionary<string, string>()
        {
            { "S", "Tự nhiên/ Spontaneous" },
            { "I", "Can thiệp/ Interventional" },
        };

        #endregion
        Ogia() { }

        public Ogia(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }
        public Ogia(dynamic document_id, dynamic user_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }

        // Constructor for API Inssert
        public Ogia(
  dynamic document_id,
  dynamic user_name,
  dynamic status,
  dynamic amend_reason,

        dynamic document_id_,
          dynamic user_name_,
          dynamic status_,
          dynamic amend_reason_,

        //  Guid document_id_ ,
          dynamic reason_admission_,
          dynamic is_obs_gyn_,
          dynamic lmp_from_,
          dynamic lmp_to_,
          dynamic ges_age_weeks_,
          dynamic ges_age_days_,
          dynamic prenatal_visit_,
          dynamic tetanus_vaccination_,
          dynamic tetanus_vaccin_time_,
          dynamic gbs_disease_,
          dynamic gbs_bacteriuria_,
          dynamic gbs_vaginal_,
          dynamic ges_diabetes_,
          dynamic other_ges_abnormal_,
          dynamic other_ges_abnormal_note_,
          dynamic labor_trig_at_time_,
          dynamic preliminary_signs_,
          dynamic progression_,
          dynamic obs_cur_medication_,
          dynamic gyn_med_history_,
          dynamic gyn_cur_medication_,
          dynamic personal_,
          dynamic family_,
          dynamic age_of_menarhce_,
          dynamic menstrual_cycle_,
          dynamic length_of_period_,
          dynamic amount_mens_blood_,
          dynamic marriage_age_,
          dynamic age_menopause_,
          dynamic previous_gyn_diseases_,
          dynamic obs_history_,
          dynamic general_appearance_,
          dynamic edema_,
          dynamic edema_note_,
          dynamic cardio_system_,
          dynamic respiratory_system,
          dynamic digestive_system_,
          dynamic nervous_system_,
          dynamic uro_system_,
          dynamic mus_system_,
          dynamic otorhinolaryngology_,
          dynamic integumentary_system_,
          dynamic ophthalmology_,
          dynamic other_findings_,
          dynamic psy_consul_required_,
          dynamic obs_pre_cicatrice_,
          dynamic obs_uterine_shape_,
          dynamic obs_posture_,
          dynamic obs_fundal_height_,
          dynamic obs_abdominal_circum_,
          dynamic obs_uterine_con_,
          dynamic obs_fetal_heart_rate_,
          dynamic obs_breasts_,
          dynamic obs_vulva_,
          dynamic obs_vagina_,
          dynamic obs_perineum_,
          dynamic obs_cervix_,
          dynamic obs_adnexa_,
          dynamic obs_mem_condition_code_,
          dynamic obs_mem_condition_desc_,
          dynamic obs_mem_condition_desc,
          dynamic obs_mem_con_attri_code,
          dynamic obs_mem_con_attri_desc,
          dynamic obs_rup_of_mem_at,
          dynamic obs_rup_of_mem_code,
          dynamic obs_rup_of_mem_desc,
          dynamic obs_feat_amniotic_,
          dynamic obs_color_amniotic_,
          dynamic obs_presentation_code_,
          dynamic obs_presentation_desc_,
          dynamic obs_presentation_other_,
          dynamic obs_fetal_position_,
          dynamic obs_pelvic_exam_,
          dynamic obs_bishop_score_,
          dynamic gyn_abdo_sur_scars_,
          dynamic gyn_reason_,
          dynamic gyn_uterine_height_,
          dynamic gyn_vulva_,
          dynamic gyn_perineum_,
          dynamic gyn_vagina_,
          dynamic gyn_discharge_,
          dynamic gyn_cervix_,
          dynamic gyn_uterus_,
          dynamic gyn_adnexa_,
          dynamic gyn_douglas_pouchs_,
          dynamic lab_result_,
          dynamic add_investigations_,
          dynamic initial_diagnosis_,
          dynamic diagnosis_,
          dynamic diff_diagnosis_,
          dynamic associated_conditions_,
          dynamic treatment_plan_,
          dynamic discharge_plan_
        )
        {
            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;

            this.reason_admission = reason_admission_;
            this.is_obs_gyn = is_obs_gyn_;
            this.lmp_from = lmp_from_;
            this.lmp_to = lmp_to_;
            this.ges_age_weeks = ges_age_weeks_;
            this.ges_age_days = ges_age_days_;
            this.prenatal_visit = prenatal_visit_;
            this.tetanus_vaccination = tetanus_vaccination_;
            this.tetanus_vaccin_time = tetanus_vaccin_time_;
            this.gbs_disease = gbs_disease_;
            this.gbs_bacteriuria = gbs_bacteriuria_;
            this.gbs_vaginal = gbs_vaginal_;
            this.ges_diabetes = ges_diabetes_;
            this.other_ges_abnormal = other_ges_abnormal_;
            this.other_ges_abnormal_note = other_ges_abnormal_note_;
            this.labor_trig_at_time = labor_trig_at_time_;
            this.preliminary_signs = preliminary_signs_;
            this.progression = progression_;
            this.obs_cur_medication = obs_cur_medication_;
            this.gyn_med_history = gyn_med_history_;
            this.gyn_cur_medication = gyn_cur_medication_;
            this.personal = personal_;
            this.family = family_;
            this.age_of_menarhce = age_of_menarhce_;
            this.menstrual_cycle = menstrual_cycle_;
            this.length_of_period = length_of_period_;
            this.amount_mens_blood = amount_mens_blood_;
            this.marriage_age = marriage_age_;
            this.age_menopause = age_menopause_;
            this.previous_gyn_diseases = previous_gyn_diseases_;
            this.obs_history = obs_history_;
            this.general_appearance = general_appearance_;
            this.edema = edema_;
            this.edema_note = edema_note_;
            this.cardio_system = cardio_system_;
            this.respiratory_system = respiratory_system;
            this.digestive_system = digestive_system_;
            this.nervous_system = nervous_system_;
            this.uro_system = uro_system_;
            this.mus_system = mus_system_;
            this.otorhinolaryngology = otorhinolaryngology_;
            this.integumentary_system = integumentary_system_;
            this.ophthalmology = ophthalmology_;
            this.other_findings = other_findings_;
            this.psy_consul_required = psy_consul_required_;
            this.obs_pre_cicatrice = obs_pre_cicatrice_;
            this.obs_uterine_shape = obs_uterine_shape_;
            this.obs_posture = obs_posture_;
            this.obs_fundal_height = obs_fundal_height_;
            this.obs_abdominal_circum = obs_abdominal_circum_;
            this.obs_uterine_con = obs_uterine_con_;
            this.obs_fetal_heart_rate = obs_fetal_heart_rate_;
            this.obs_breasts = obs_breasts_;
            this.obs_vulva = obs_vulva_;
            this.obs_vagina = obs_vagina_;
            this.obs_perineum = obs_perineum_;
            this.obs_cervix = obs_cervix_;
            this.obs_adnexa = obs_adnexa_;
            this.obs_mem_condition_code = obs_mem_condition_code_;
            this.obs_mem_condition_desc = obs_mem_condition_desc_;
            this.obs_feat_amniotic = obs_feat_amniotic_;
            this.obs_color_amniotic = obs_color_amniotic_;
            this.obs_presentation_code = obs_presentation_code_;
            this.obs_presentation_desc = obs_presentation_desc_;
            this.obs_presentation_other = obs_presentation_other_;
            this.obs_fetal_position = obs_fetal_position_;
            this.obs_pelvic_exam = obs_pelvic_exam_;
            this.obs_bishop_score = obs_bishop_score_;
            this.gyn_abdo_sur_scars = gyn_abdo_sur_scars_;
            this.gyn_reason = gyn_reason_;
            this.gyn_uterine_height = gyn_uterine_height_;
            this.gyn_vulva = gyn_vulva_;
            this.gyn_perineum = gyn_perineum_;
            this.gyn_vagina = gyn_vagina_;
            this.gyn_discharge = gyn_discharge_;
            this.gyn_cervix = gyn_cervix_;
            this.gyn_uterus = gyn_uterus_;
            this.gyn_adnexa = gyn_adnexa_;
            this.gyn_douglas_pouchs = gyn_douglas_pouchs_;
            this.lab_result = lab_result_;
            this.add_investigations = add_investigations_;
            this.initial_diagnosis = initial_diagnosis_;
            this.diagnosis = diagnosis_;
            this.diff_diagnosis = diff_diagnosis_;
            this.associated_conditions = associated_conditions_;
            this.treatment_plan = treatment_plan_;
            this.discharge_plan = discharge_plan_;
        }

        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];
            
            dynamic response = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response;

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response1;
            }
            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;
                response.Exception = ex;
                message[0] = response;
                return message;
            }
        }
    }
    public partial class MC
    {
        #region Properties
        public static string api = "api/mc";
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
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
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

        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                    message[1] = response1;
                }
                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }

        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
    }

    #endregion

    #region Trai
    public partial class EmergencyMedicalRecord
    {
        #region Properties
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic evaluation_time { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic chief_complaint_code { get; set; }
        public dynamic chief_complaint_desc { get; set; }
        public dynamic history_of_present { get; set; }
        public dynamic past_med_his_meds { get; set; }
        public dynamic past_med_his_surs { get; set; }
        public dynamic habits { get; set; }
        public dynamic habits_other { get; set; }
        public dynamic home_medications { get; set; }
        public dynamic allergies { get; set; }
        public dynamic relevant_family_history { get; set; }
        public dynamic finding { get; set; }
        public dynamic required_code { get; set; }
        public dynamic required_text { get; set; }
        public dynamic investigations_results { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic diferential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic comfirmed_diagnosis { get; set; }
        public dynamic specialist_opinion { get; set; }
        public dynamic name_of_specialist { get; set; }
        public dynamic time_contaced { get; set; }
        public dynamic time_provided { get; set; }
        public dynamic spec_opinion_summarised { get; set; }
        public dynamic treatment { get; set; }
        public dynamic progress_note { get; set; }
        public dynamic conclusions { get; set; }
        public dynamic discharge { get; set; }
        public dynamic prescription { get; set; }
        public dynamic specify_care_instructions { get; set; }
        public dynamic discharge_time { get; set; }
        public dynamic referred_to_OPD { get; set; }
        public dynamic referred_to_OPD_text { get; set; }
        public dynamic hospitalisation_required { get; set; }
        public dynamic reason { get; set; }
        public dynamic ward { get; set; }
        public dynamic time_of_leaving_emergency { get; set; }
        public dynamic emergency_surgery { get; set; }
        public dynamic pre_operative_diagnosis { get; set; }
        public dynamic brief_summary { get; set; }
        public dynamic time_of_leaving_emer_e { get; set; }
        public dynamic transfer_hospital { get; set; }
        public dynamic reason_for_transfer { get; set; }
        public dynamic status_before_transfer { get; set; }
        public dynamic time_of_leaving_emer_a { get; set; }
        public dynamic patient_discharge { get; set; }
        public dynamic txt_patient_discharge { get; set; }
        public dynamic icd_10 { get; set; }
        public dynamic model_id { get; set; }
        public dynamic patient_visit_id { get; set; }
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
        public static Dictionary<string, string> ChiefComplaintCode = new Dictionary<string, string>()
        {
            { "R", "Resuscitation/ Hồi sức" },
            { "E", "Emergency/ Cấp cứu" },
            { "U", "Urgent/ Khẩn trương" },
            { "L", "Less urgent/ Trì hoãn" },
            { "N", "Non-Urgent/ Không cấp cứu" },
        };
        //public class PatientPischarge
        public static Dictionary<string, string> PatientDischarge = new Dictionary<string, string>()
        {
            { "IMP", "Improved/ Có cải thiện" },
            { "UNC", "Unchanged/ Không thay đổi" },
            { "UNS", "Unstable/ Không ổn định" }
        };
        //public class Habits
        public static Dictionary<string, string> Habits = new Dictionary<string, string>()
        {
            { "A", "Alcohol/ Rượu" },
            { "S", "Smoking/ Thuốc lá" },
            { "D", "Drugs/ Chất gây nghiện" },
            { "O", "Other, specify/ Khác ghi rõ" }
        };
        public static Dictionary<string, string> Treatment = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "DateTime" },
            { "medication", "" },
            { "dose", "" },
            { "route", "" },
            { "comment", "" },
        };
        public static Dictionary<string, string> ProgressNote = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "DateTime" },
            { "progress", "" },
            { "appropriate_order", "" },
        };
        EmergencyMedicalRecord() { }

        // Constructor for API Update
        /// <summary>
        /// Get document by document_id
        /// </summary>
        /// <param name="document_id"></param>
        public EmergencyMedicalRecord(dynamic document_id)
        {
            DataTable tbl = new DataTable();
            dynamic response = WebHelpers.GetAPI($"api/emr/get/{DataHelpers._LOCATION}/" + document_id);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                // this = new OutpatientMedicalRecord();
                tbl = WebHelpers.GetJSONToDataTable(response.Data);
                WebHelpers.BindingDatafield(tbl, this);
                DataHelpers.varDocumentStatus = this.status;
            }
        }
        public EmergencyMedicalRecord(dynamic document_id, dynamic use_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }
        public EmergencyMedicalRecord(
        dynamic _document_id
        , dynamic _user_name
        , dynamic _status
        , dynamic _evaluation_time
        , dynamic _chief_complaint
        , dynamic _chief_complaint_code
        , dynamic _chief_complaint_desc
        , dynamic _history_of_present
        , dynamic _past_med_his_meds
        , dynamic _past_med_his_surs
        , dynamic _habits
        , dynamic _habits_other
        , dynamic _home_medications
        , dynamic _allergies
        , dynamic _relevant_family_history
        , dynamic _finding
        , dynamic _required_code
        , dynamic _required_text
        , dynamic _investigations_results
        , dynamic _initial_diagnosis
        , dynamic _diferential_diagnosis
        , dynamic _associated_conditions
        , dynamic _comfirmed_diagnosis
        , dynamic _specialist_opinion
        , dynamic _name_of_specialist
        , dynamic _time_contaced
        , dynamic _time_provided
        , dynamic _spec_opinion_summarised
        , dynamic _treatment
        , dynamic _progress_note
        , dynamic _conclusions
        , dynamic _discharge
        , dynamic _prescription
        , dynamic _specify_care_instructions
        , dynamic _discharge_time
        , dynamic _referred_to_OPD
        , dynamic _referred_to_OPD_text
        , dynamic _hospitalisation_required
        , dynamic _reason
        , dynamic _ward
        , dynamic _time_of_leaving_emergency
        , dynamic _emergency_surgery
        , dynamic _pre_operative_diagnosis
        , dynamic _brief_summary
        , dynamic _time_of_leaving_emer_e
        , dynamic _transfer_hospital
        , dynamic _reason_for_transfer
        , dynamic _status_before_transfer
        , dynamic _time_of_leaving_emer_a
        , dynamic _patient_discharge
        , dynamic _txt_patient_discharge
        , dynamic _icd_10
        , dynamic _model_id
        , dynamic _patient_visit_id
        , dynamic _amend_reason
        , dynamic _created_user_id
        , dynamic _created_name_e
        , dynamic _created_name_l
        , dynamic _created_date_time
        , dynamic _modified_user_id
        , dynamic _modified_name_e
        , dynamic _modified_name_l
        , dynamic _modified_date_time
        , dynamic _submited_user_id
        , dynamic _submited_name_e
        , dynamic _submited_name_l
        , dynamic _submited_date_time
        , dynamic _signed_user_id
        , dynamic _signed_name_e
        , dynamic _signed_name_l
        , dynamic _signed_date_time
        , dynamic _delete_user_id
        , dynamic _delete_name_e
        , dynamic _delete_name_l
        , dynamic _delete_date_time
        , dynamic _document_type_rcd
        )
        {

            this.document_id = _document_id;
            this.user_name = _user_name;
            this.status = _status;
            this.evaluation_time = _evaluation_time;
            this.chief_complaint = _chief_complaint;
            this.chief_complaint_code = _chief_complaint_code;
            this.chief_complaint_desc = _chief_complaint_desc;
            this.history_of_present = _history_of_present;
            this.past_med_his_meds = _past_med_his_meds;
            this.past_med_his_surs = _past_med_his_surs;
            this.habits = _habits;
            this.habits_other = _habits_other;
            this.home_medications = _home_medications;
            this.allergies = _allergies;
            this.relevant_family_history = _relevant_family_history;
            this.finding = _finding;
            this.required_code = _required_code;
            this.required_text = _required_text;
            this.investigations_results = _investigations_results;
            this.initial_diagnosis = _initial_diagnosis;
            this.diferential_diagnosis = _diferential_diagnosis;
            this.associated_conditions = _associated_conditions;
            this.comfirmed_diagnosis = _comfirmed_diagnosis;
            this.specialist_opinion = _specialist_opinion;
            this.name_of_specialist = _name_of_specialist;
            this.time_contaced = _time_contaced;
            this.time_provided = _time_provided;
            this.spec_opinion_summarised = _spec_opinion_summarised;
            this.treatment = _treatment;
            this.progress_note = _progress_note;
            this.conclusions = _conclusions;
            this.discharge = _discharge;
            this.prescription = _prescription;
            this.specify_care_instructions = _specify_care_instructions;
            this.discharge_time = _discharge_time;
            this.referred_to_OPD = _referred_to_OPD;
            this.referred_to_OPD_text = _referred_to_OPD_text;
            this.hospitalisation_required = _hospitalisation_required;
            this.reason = _reason;
            this.ward = _ward;
            this.time_of_leaving_emergency = _time_of_leaving_emergency;
            this.emergency_surgery = _emergency_surgery;
            this.pre_operative_diagnosis = _pre_operative_diagnosis;
            this.brief_summary = _brief_summary;
            this.time_of_leaving_emer_e = _time_of_leaving_emer_e;
            this.transfer_hospital = _transfer_hospital;
            this.reason_for_transfer = _reason_for_transfer;
            this.status_before_transfer = _status_before_transfer;
            this.time_of_leaving_emer_a = _time_of_leaving_emer_a;
            this.patient_discharge = _patient_discharge;
            this.txt_patient_discharge = _txt_patient_discharge;
            this.icd_10 = _icd_10;
            this.model_id = _model_id;
            this.patient_visit_id = _patient_visit_id;
            this.amend_reason = _amend_reason;
            this.created_user_id = _created_user_id;
            this.created_name_e = _created_name_e;
            this.created_name_l = _created_name_l;
            this.created_date_time = _created_date_time;
            this.modified_user_id = _modified_user_id;
            this.modified_name_e = _modified_name_e;
            this.modified_name_l = _modified_name_l;
            this.modified_date_time = _modified_date_time;
            this.submited_user_id = _submited_user_id;
            this.submited_name_e = _submited_name_e;
            this.submited_name_l = _submited_name_l;
            this.submited_date_time = _submited_date_time;
            this.signed_user_id = _signed_user_id;
            this.signed_name_e = _signed_name_e;
            this.signed_name_l = _signed_name_l;
            this.signed_date_time = _signed_date_time;
            this.delete_user_id = _delete_user_id;
            this.delete_name_e = _delete_name_e;
            this.delete_name_l = _delete_name_l;
            this.delete_date_time = _delete_date_time;
            this.document_type_rcd = _document_type_rcd;
        }
        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"api/emr/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"api/emr/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"api/emr/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
    }
    #endregion
    #region Trai
    public partial class Imani
    {
        #region Properties
        public static string api = "api/imani";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic admission_reason { get; set; }
        public dynamic cur_med_history { get; set; }
        public dynamic cur_medication { get; set; }
        public dynamic delivery { get; set; }
        public dynamic post_nutrition { get; set; }
        public dynamic mater_med_history { get; set; }
        public dynamic exam_weight { get; set; }
        public dynamic exam_length { get; set; }
        public dynamic exam_head_circum { get; set; }
        public dynamic exam_hr { get; set; }
        public dynamic exam_rr { get; set; }
        public dynamic physical_exam { get; set; }
        public dynamic laboratory { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic diff_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_plan { get; set; }
        public dynamic discharge_plan { get; set; }
        public dynamic model_id { get; set; }
        public dynamic patient_visit_id { get; set; }
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
        #endregion

        public Imani(
        dynamic document_id
        , dynamic user_name
        , dynamic status
        , dynamic amend_reason
        , dynamic admission_reason
        , dynamic cur_med_history
        , dynamic cur_medication
        , dynamic delivery
        , dynamic post_nutrition
        , dynamic mater_med_history
        , dynamic exam_weight
        , dynamic exam_length
        , dynamic exam_head_circum
        , dynamic exam_hr
        , dynamic exam_rr
        , dynamic physical_exam
        , dynamic laboratory
        , dynamic initial_diagnosis
        , dynamic diff_diagnosis
        , dynamic associated_conditions
        , dynamic treatment_plan
        , dynamic discharge_plan
        , dynamic model_id
        , dynamic patient_visit_id
        , dynamic created_user_id
        , dynamic created_name_e
        , dynamic created_name_l
        , dynamic created_date_time
        , dynamic modified_user_id
        , dynamic modified_name_e
        , dynamic modified_name_l
        , dynamic modified_date_time
        , dynamic submited_user_id
        , dynamic submited_name_e
        , dynamic submited_name_l
        , dynamic submited_date_time
        , dynamic signed_user_id
        , dynamic signed_name_e
        , dynamic signed_name_l
        , dynamic signed_date_time
        , dynamic delete_user_id
        , dynamic delete_name_e
        , dynamic delete_name_l
        , dynamic delete_date_time
        , dynamic document_type_rcd
        )
        {

            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.admission_reason = admission_reason;
            this.cur_med_history = cur_med_history;
            this.cur_medication = cur_medication;
            this.delivery = delivery;
            this.post_nutrition = post_nutrition;
            this.mater_med_history = mater_med_history;
            this.exam_weight = exam_weight;
            this.exam_length = exam_length;
            this.exam_head_circum = exam_head_circum;
            this.exam_hr = exam_hr;
            this.exam_rr = exam_rr;
            this.physical_exam = physical_exam;
            this.laboratory = laboratory;
            this.initial_diagnosis = initial_diagnosis;
            this.diff_diagnosis = diff_diagnosis;
            this.associated_conditions = associated_conditions;
            this.treatment_plan = treatment_plan;
            this.discharge_plan = discharge_plan;
            this.model_id = model_id;
            this.patient_visit_id = patient_visit_id;
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
            this.submited_name_l = submited_name_l;
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
        }


        Imani() { }
        public Imani(dynamic document_id)
        {
            dynamic response = WebHelpers.GetAPI($"{api}/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable obj = WebHelpers.GetJSONToDataTable(response.Data);
                if (obj.Rows.Count <= 0) { throw new Exception(); }
                WebHelpers.BindingDatafield(obj, this);
            }
        }
        public Imani(dynamic document_id, dynamic use_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }


        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
    }
    
    public class Surr
    {
        #region properties
        private static string api = "api/surr";
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public dynamic procedure_date { get; set; }
        public dynamic start_time { get; set; }
        public dynamic finish_time { get; set; }
        public dynamic preo_diagnosis { get; set; }
        public dynamic post_diagnosis { get; set; }
        public dynamic name_procedure { get; set; }
        public dynamic anesthesia { get; set; }
        public dynamic surgeon { get; set; }
        public dynamic assistant_surgeon { get; set; }
        public dynamic anesthesiologist { get; set; }
        public dynamic anesthetic_nurse { get; set; }
        public dynamic scrub_nurse { get; set; }
        public dynamic circulating_nurse { get; set; }
        public dynamic estimated_bloodloss { get; set; }
        public dynamic biopsy_pathology { get; set; }
        public dynamic complications { get; set; }
        public dynamic procedure_chart { get; set; }
        public dynamic procedure_narrative { get; set; }
        public dynamic model_id { get; set; }
        public dynamic patient_visit_id { get; set; }
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
        #endregion
        public Surr(dynamic document_id
        , dynamic user_name
        , dynamic status
        , dynamic amend_reason
        , dynamic procedure_date
        , dynamic start_time
        , dynamic finish_time
        , dynamic preo_diagnosis
        , dynamic post_diagnosis
        , dynamic name_procedure
        , dynamic anesthesia
        , dynamic surgeon
        , dynamic assistant_surgeon
        , dynamic anesthesiologist
        , dynamic anesthetic_nurse
        , dynamic scrub_nurse
        , dynamic circulating_nurse
        , dynamic estimated_bloodloss
        , dynamic biopsy_pathology
        , dynamic complications
        , dynamic procedure_chart
        , dynamic procedure_narrative
        , dynamic model_id
        , dynamic patient_visit_id
        , dynamic created_user_id
        , dynamic created_name_e
        , dynamic created_name_l
        , dynamic created_date_time
        , dynamic modified_user_id
        , dynamic modified_name_e
        , dynamic modified_name_l
        , dynamic modified_date_time
        , dynamic submited_user_id
        , dynamic submited_name_e
        , dynamic submited_name_l
        , dynamic submited_date_time
        , dynamic signed_user_id
        , dynamic signed_name_e
        , dynamic signed_name_l
        , dynamic signed_date_time
        , dynamic delete_user_id
        , dynamic delete_name_e
        , dynamic delete_name_l
        , dynamic delete_date_time
        , dynamic document_type_rcd
        )
        {

            this.document_id = document_id;
            this.user_name = user_name;
            this.status = status;
            this.amend_reason = amend_reason;
            this.procedure_date = procedure_date;
            this.start_time = start_time;
            this.finish_time = finish_time;
            this.preo_diagnosis = preo_diagnosis;
            this.post_diagnosis = post_diagnosis;
            this.name_procedure = name_procedure;
            this.anesthesia = anesthesia;
            this.surgeon = surgeon;
            this.assistant_surgeon = assistant_surgeon;
            this.anesthesiologist = anesthesiologist;
            this.anesthetic_nurse = anesthetic_nurse;
            this.scrub_nurse = scrub_nurse;
            this.circulating_nurse = circulating_nurse;
            this.estimated_bloodloss = estimated_bloodloss;
            this.biopsy_pathology = biopsy_pathology;
            this.complications = complications;
            this.procedure_chart = procedure_chart;
            this.procedure_narrative = procedure_narrative;
            this.model_id = model_id;
            this.patient_visit_id = patient_visit_id;
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
            this.submited_name_l = submited_name_l;
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
        }

        public Surr(string document_id)
        {
            dynamic response = WebHelpers.GetAPI($"api/surr/get/{DataHelpers._LOCATION}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                WebHelpers.BindingDatafield(db, this);
            }
        }

        #region METHODS

        public dynamic[] Update()
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{DataHelpers._LOCATION}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
        public static dynamic[] Delete(string userName, string docid)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{DataHelpers._LOCATION}/{userName}/{docid}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{DataHelpers._LOCATION}/{docid}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }

        #endregion
    }
    #endregion
}
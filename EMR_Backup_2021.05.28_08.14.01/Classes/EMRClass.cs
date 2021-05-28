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
        public static Dictionary<string, string> disAfterDischarge = new Dictionary<string, string>()
        {
            { "H", "Nhà riêng/ Private home" },
            { "O", "Cơ sở y tế khác/Other healthcare facility" },
        };
        public static Dictionary<string, string> ArrivalMode = new Dictionary<string, string>()
        {
            { "WHE", "Xe lăn/Wheel chair" },
            { "WAL", "Tự đến/Walk-in" },
            { "AMB", "Xe cấp cứu/Ambulance" },
        };
        public static Dictionary<string, string> DischargeOption = new Dictionary<string, string>()
        {
            { "H", "Về nhà/ Home" },
            { "A", "Tự ý/ AMA" },
            { "D", "Tử vong/ Dead" },
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

    public partial class Ena
    {
        #region Properties
        private string api = "api/ena/";
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

        Ena() { }

        public Ena(dynamic document_id)
        {
            string _jsonData = WebHelpers.GetAPI(api + document_id);

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

        public string[] Update()
        {   
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(api + "/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(api + "/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }

        public static string[] Delete(string userName)
        {
            string[] message = new string[2];
            try
            {

                string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

                message[0] = responseStatus;
                if (responseStatus == WebHelpers.ResponseStatus.OK)
                {
                    responseStatus = WebHelpers.PostAPI("api/ena/log/" + DataHelpers.varDocId);
                    message[1] = responseStatus;
                }

                return message;
            } catch (Exception ex)
            {
                message[0] = ex.Message;
                return message;
            }
            
        }
    }

    public class Oadr
    {
        #region properties
        private string api = "api/oadr";
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

        public static class TABLE {
            public static Dictionary<string, string> OPERATION = new Dictionary<string, string>()
            {
                { "id", "" },
                { "date_time", "" },
                { "surgical_anesthesia", "" },
                { "surgeon", "" },
                { "anesthesiologist", "" },
            };
        }

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
            string _jsonData = WebHelpers.GetAPI("api/oadr/" + document_id);

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(api + "/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(api + "/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/oadr/log/" + DataHelpers.varDocId);
                message[1] = responseStatus;
            }

            return message;
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
            string _jsonData = WebHelpers.GetAPI(string.Format("{0}/{1}", api, document_id));

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("{0}/edit", api), this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, document_id));
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, DataHelpers.varDocId));
                message[1] = responseStatus;
            }

            return message;
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
            string _jsonData = WebHelpers.GetAPI(string.Format("{0}/{1}", api, document_id));

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("{0}/edit", api), this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, document_id));
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, DataHelpers.varDocId));
                message[1] = responseStatus;
            }

            return message;
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
            string _jsonData = WebHelpers.GetAPI(string.Format("{0}/{1}", api, document_id));

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("{0}/edit", api), this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, document_id));
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));
            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, DataHelpers.varDocId));
                message[1] = responseStatus;
            }

            return message;
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
            string _jsonData = WebHelpers.GetAPI(string.Format("{0}/{1}", api, document_id));

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("{0}/edit", api), this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, document_id));
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));
            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, DataHelpers.varDocId));
                message[1] = responseStatus;
            }

            return message;
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
            string _jsonData = WebHelpers.GetAPI(string.Format("{0}/{1}", api, document_id));

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("{0}/edit", api), this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, document_id));
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));
            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, DataHelpers.varDocId));
                message[1] = responseStatus;
            }

            return message;
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
            string _jsonData = WebHelpers.GetAPI(string.Format("{0}/{1}", api, document_id));

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("{0}/edit", api), this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, document_id));
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));
            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, DataHelpers.varDocId));
                message[1] = responseStatus;
            }

            return message;
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
        public dynamic cur_medication { get; set; }
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
            this.cur_medication = cur_medication;
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

        public Mrfv(dynamic document_id)
        {
            string _jsonData = WebHelpers.GetAPI(string.Format("{0}/{1}", api, document_id));

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("{0}/edit", api), this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, document_id));
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));
            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(string.Format("{0}/log/{1}", api, DataHelpers.varDocId));
                message[1] = responseStatus;
            }

            return message;
        }
        #endregion
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

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

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
        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };
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
        public  PatientInfo() { }
        public PatientInfo(string _patient_id) {
            this.patient_id = _patient_id;
        }
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
    public partial class OGIA
    {
        #region OGIA_Properties
        private dynamic api = "api/ogia/";
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

        OGIA() { }

        public OGIA(dynamic document_id)
        {
            string _jsonData = WebHelpers.GetAPI(api + document_id);

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }
        public OGIA(dynamic document_id, dynamic user_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }

        // Constructor for API Inssert
        public OGIA(
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

        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(api + "/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(api + "/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }

        public static string[] Delete(string userName)
        {
            string[] message = new string[2];
            try
            {

                string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

                message[0] = responseStatus;
                if (responseStatus == WebHelpers.ResponseStatus.OK)
                {
                    responseStatus = WebHelpers.PostAPI("api/OGIA/log/" + DataHelpers.varDocId);
                    message[1] = responseStatus;
                }

                return message;
            }
            catch (Exception ex)
            {
                message[0] = ex.Message;
                return message;
            }

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

            string responseStatus = WebHelpers.PostAPI(string.Format("api/emr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

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
            { "time", "" },
            { "medication", "" },
            { "dose", "" },
            { "route", "" },
            { "comment", "" },
        };
        public static Dictionary<string, string> ProgressNote = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "" },
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
            string _jsonData = WebHelpers.GetAPI("api/emr/" + document_id);

            if (_jsonData != null)
            {
                // this = new OutpatientMedicalRecord();
                tbl = WebHelpers.GetJSONToDataTable(_jsonData);
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

        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/emr/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/emr/log/" + this.document_id);
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
                responseStatus = WebHelpers.PostAPI("api/emr/log/" + DataHelpers.varDocId);
                message[1] = responseStatus;
            }

            return message;
        }
    }
    #endregion
    #region Trai
    public partial class IniMedAssForNeoInpatient
    {
        #region Properties
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

        public IniMedAssForNeoInpatient(
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


        IniMedAssForNeoInpatient() { }
        public IniMedAssForNeoInpatient(dynamic document_id)
        {
            DataTable tbl = new DataTable();
            string _jsonData = WebHelpers.GetAPI("api/imani/" + document_id);

            if (_jsonData != null)
            {
                // this = new OutpatientMedicalRecord();
                tbl = WebHelpers.GetJSONToDataTable(_jsonData);
                WebHelpers.BindingDatafield(tbl, this);
                DataHelpers.varDocumentStatus = this.status;
            }
        }
        public IniMedAssForNeoInpatient(dynamic document_id, dynamic use_name)
        {
            this.document_id = document_id;
            this.user_name = user_name;
        }


        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/imani/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/imani/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }

        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/imani/document-del/" + userName + "/" + DataHelpers.varDocId);

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/imani/log/" + DataHelpers.varDocId);
                message[1] = responseStatus;
            }

            return message;
        }
        #endregion



    }
    
    public class Surr
    {
        #region properties
        private string api = "api/surr";
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
            string _jsonData = WebHelpers.GetAPI("api/surr/" + document_id);

            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

            WebHelpers.BindingDatafield(db, this);
        }

        #region METHODS
        public string[] Update()
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(api + "/edit", this);
            message[0] = responseStatus;

            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI(api + "/log/" + this.document_id);
                message[1] = responseStatus;
            }

            return message;
        }
        public static string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI(string.Format("api/surr/document-del/{0}/{1}", userName, DataHelpers.varDocId));

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/surr/log/" + DataHelpers.varDocId);
                message[1] = responseStatus;
            }

            return message;
        }
        #endregion
    }
    #endregion
}
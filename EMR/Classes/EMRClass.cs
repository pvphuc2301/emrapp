using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EMR
{
    public class EMRClass
    {
    }

    public class PatientInfo
    {
        public dynamic patient_id { get; set; }
        public dynamic visible_patient_id { get; set; }
        public dynamic first_name_l { get; set; }
        public dynamic last_name_l { get; set; }
        public dynamic date_of_birth { get; set; }
        public dynamic gender_l { get; set; }
        public dynamic address_line_l { get; set; }
        public dynamic address_subregion_l { get; set; }
        public dynamic address_region_l { get; set; }
        public dynamic address_country_l { get; set; }
        public dynamic contact_name_l { get; set; }
        public dynamic relationship_type_rcd { get; set; }
        public dynamic contact_phone_number { get; set; }
        public dynamic title_l { get; set; }

        //      "patient_id": "c248e0fc-39b6-493f-a197-6cf2a96b37ad",
        //"hospital_code": "AIH",
        //"visible_patient_id": "900005754",
        //"primary_patient_id": "c248e0fc-39b6-493f-a197-6cf2a96b37ad",
        //"primary_hospital_code": "AIH",
        //"primary_visible_patient_id": "900005754",
        //"title_e": "Ms.",
        //"title_l": "Bà",
        //"first_name_e": "Patient for",
        //"first_name_l": "Patient for",
        //"last_name_e": "Test",
        //"last_name_l": "Test",
        //"date_of_birth": "2017-10-18T00:00:00",
        //"gender_e": "Female",
        //"gender_l": "Nữ",
        //"national_id": "079187006681 ( m? )",
        //"passport": null,
        //"home_email": null,
        //"business_email": "",
        //"occupation_e": "White-collar worker",
        //"occupation_l": "Nhân viên văn phòng",
        //"nationality_e": "Atlantic Ocean (East)",
        //"nationality_l": "Atlantic Ocean (East)",
        //"religion_e": "Unknown",
        //"religion_l": "Không có thông tin",
        //"address_line_e": "19/1 Phan Tây Hồ,P.7",
        //"address_line_l": "19/1 Phan Tây Hồ,P.7",
        //"address_subregion_e": "Phu Nhuan District",
        //"address_subregion_l": "Quận Phú Nhuận",
        //"address_region_e": "Ho Chi Minh",
        //"address_region_l": "Tp. HCM",
        //"address_country_e": "Vietnam",
        //"address_country_l": "Việt Nam",
        //"contact_name_e": "Ms. Le Hoang Thao",
        //"contact_name_l": "Bà Lê Hoàng Thảo",
        //"relationship_type_rcd": "Mẹ",
        //"contact_phone_number": null,
        //"lu_updated": "2021-01-20T09:00:23.563"
    }

    public class OutPatIniNurAss
    {
        public dynamic vs_temperature { get; set; }
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
        public dynamic documentid { get; set; }
        public dynamic amend_reason { get; set; }
    }

    public class OutPatIniNurAssPOST
    {
        public string document_id { get; set; }
        public string user_name { get; set; }
        public string status { get; set; }
        public string amend_reason { get; set; }
        public string vs_temperature { get; set; }
        public string vs_heart_rate { get; set; }
        public string vs_weight { get; set; }
        public string vs_respiratory_rate { get; set; }
        public string vs_height { get; set; }
        public string vs_BMI { get; set; }
        public string vs_blood_pressure { get; set; }
        public string vs_spO2 { get; set; }
        public string pulse { get; set; }
        public string chief_complaint { get; set; }
        public bool allergy { get; set; }
        public string allergy_note { get; set; }
        public bool mental_status { get; set; }
        public string mental_status_note { get; set; }
        public string paint_score_code { get; set; }
        public string paint_score_description { get; set; }
        public bool fall_risk { get; set; }
        public string fall_risk_assistance { get; set; }
        public string nutrition_status_code { get; set; }
        public string nutrition_status_description { get; set; }
        public string housing_code { get; set; }
        public string housing_description { get; set; }
        public string prioritization_code { get; set; }
        public string prioritization_description { get; set; }
        public string assessment_date_time { get; set; }
        
    }
}
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

    public static class VAL_GLOBAL
    {
        public static string docId { get; set; }
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

        public string[] Delete(string userName)
        {
            string[] message = new string[2];

            string responseStatus = WebHelpers.PostAPI("api/emr/document-del/" + userName + "/" + document_id);

            message[0] = responseStatus;
            if (responseStatus == WebHelpers.ResponseStatus.OK)
            {
                responseStatus = WebHelpers.PostAPI("api/oina/log/" + document_id);
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
    }

    #endregion

    #endregion
}
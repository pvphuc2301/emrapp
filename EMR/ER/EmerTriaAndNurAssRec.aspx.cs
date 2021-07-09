﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.ImageEditor;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace EMR
{
    public partial class EmergencyTriageAndNursingAssessmentRecord : System.Web.UI.Page
    {
        #region Variables
        public Ena ena;
        MemoryStream ms;
        #endregion
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!WebHelpers.CheckSession(this)) return;
            if (!IsPostBack)
            {
                Initial();
            }
            
        }
       
        #region Binding Data
        private void BindingDataForm(Ena ena, bool state)
        {
            
            if (state)
            {
                BindingDataFormEdit(ena);
            }
            else
            {
                BindingDataFormView(ena);
            }
        }
        private void BindingDataFormEdit(Ena ena)
        {
            try
            {
                WebHelpers.VisibleControl(true, undo, redo, pencilWrapper);

                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(ena.skin_anno_data).dataURI;
                //Triage Date Time
                WebHelpers.BindDateTimePicker(dtpk_triage_time, ena.triage_time);

                //Triage Area #
                txt_triage_area.Value = ena.triage_area;

                //Chief complaint
                txt_chief_complaint.Value = ena.chief_complaint;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_triage_code_" + ena.triage_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_arrival_mode_code_" + ena.arrival_mode_code);

                //Past Medical History
                txt_past_medical_history.Value = ena.past_medical_history;

                ////Narrative
                txt_narrative.Value = ena.narrative;

                ////Vital signs
                txt_vs_temperature.Value = ena.vs_temperature;
                txt_vs_heart_rate.Value = ena.vs_heart_rate;
                txt_vs_weight.Value = ena.vs_weight;
                txt_vs_respiratory_rate.Value = ena.vs_respiratory_rate;
                txt_vs_height.Value = ena.vs_height;
                txt_vs_blood_pressure.Value = ena.vs_blood_pressure;
                txt_vs_bmi.Text = ena.vs_bmi;
                txt_vs_spo2.Value = ena.vs_spo2;
                txt_vs_head_circum.Value = ena.vs_head_circum;

                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_loc_avpu_", WebHelpers.GetJSONToDataTable(ena.loc_avpu), "cde");
                //Pain assess
                txt_pain_onset.Value = ena.pain_onset;
                txt_pain_location.Value = ena.pain_location;
                txt_pain_duration.Value = ena.pain_duration;
                txt_pain_radiation.Value = ena.pain_radiation;
                txt_pain_score.Value = ena.pain_score;

                //allergy
                txt_allergy.Value = ena.allergy;

                //medications used
                txt_current_medication.Value = ena.current_medication;

                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_skin_integrity_", WebHelpers.GetJSONToDataTable(ena.skin_integrity), "cde");
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_com_dis_src_", WebHelpers.GetJSONToDataTable(ena.com_dis_src), "cde");
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_discharge_plan_", WebHelpers.GetJSONToDataTable(ena.discharge_plan), "cde");

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_dis_after_discharge_code_" + ena.dis_after_discharge_code);
                txt_caregiver_after_discharge.Value = ena.caregiver_after_discharge;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_language_" + ena.btc_language);
                txt_btc_language_note.Value = ena.btc_language_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_cognitive_" + ena.btc_cognitive);
                txt_btc_cognitive_note.Value = ena.btc_cognitive_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_sensory_" + ena.btc_sensory);
                txt_btc_sensory_note.Value = ena.btc_sensory_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_religious_" + ena.btc_religious);
                txt_btc_religious_note.Value = ena.btc_religious_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_btc_cultural_" + ena.btc_cultural);
                txt_btc_cultural_note.Value = ena.btc_cultural_note;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_general_appearance_", WebHelpers.GetJSONToDataTable(ena.general_appearance), "cde");

                txt_eye.Value = ena.eye;
                txt_voice.Value = ena.voice;
                txt_motion.Value = ena.motion;

                //

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_alert_" + ena.alert);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_coma_" + ena.coma);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_others_" + ena.others);

                txt_str_others.Value = ena.str_others;

                DataTable respiratory = WebHelpers.GetJSONToDataTable(ena.respiratory);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_respiratory_", respiratory, out int oth_index, "cde");

                if(oth_index != -1)
                {
                    txt_respiratory_oth.Value = respiratory.Rows[oth_index].Field<string>("desc").ToString();
                }

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_regular_" + ena.rhythm_regular);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_inregular_" + ena.rhythm_inregular);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_others_" + ena.rhythm_others);

                txt_rhythm_str_others.Value = ena.rhythm_str_others;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_psychosocial_" + ena.psychosocial);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_psychosocial_others_" + ena.psychosocial_others);
                txt_psychosocial_str_others.Value = ena.psychosocial_str_others;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_psychosocial_" + ena.psychosocial);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_other_systems_normal_" + ena.other_systems_normal);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_other_systems_abnormal_" + ena.other_systems_abnormal);

                txt_others_systems_str.Value = ena.others_systems_str;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_lmp_" + ena.lmp);

                txt_lmP_note.Value = ena.lmP_note;
                txt_para.Value = ena.para;
                txt_abortions.Value = ena.abortions;

                WebHelpers.BindDateTimePicker(dtpk_blood_glucose_date_time, ena.blood_glucose_date_time);

                txt_blood_glucose_note.Value = ena.blood_glucose_note;

                WebHelpers.BindDateTimePicker(dtpk_ecg_date_time, ena.ecg_date_time);

                txt_ecg_note.Value = ena.ecg_note;

                WebHelpers.BindDateTimePicker(dtpk_urine_cath_date_time, ena.urine_cath_date_time);

                txt_urine_cath_note.Value = ena.urine_cath_note;

                WebHelpers.BindDateTimePicker(dtpk_splint_cast_dressing_date_time, ena.splint_cast_dressing_date_time);

                txt_splint_cast_dressing_note.Value = ena.splint_cast_dressing_note;

                WebHelpers.BindDateTimePicker(dtpk_procedure_other_date_time, ena.procedure_other_date_time);

                txt_procedure_other_note.Value = ena.procedure_other_note;

                //Assessment System

                ViewState[grid_AssessmentSystem.ID] = WebHelpers.BindingDataGridView(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system), Ena.ASSESSMENT_SYSTEM_COL, btn_grid_AssessmentSystem_add);

                ViewState[gridDirectMedication.ID] = WebHelpers.BindingDataGridView(gridDirectMedication, WebHelpers.GetJSONToDataTable(ena.direct_medication), Ena.DIRECT_MEDICATION_COL, btn_gridDirectMedication_add);

                //Discharged

                WebHelpers.BindDateTimePicker(dtpk_discharge_date_time, ena.discharge_date_time);

                txt_discharge_by.Value = ena.discharge_by;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_discharge_option_", WebHelpers.GetJSONToDataTable(ena.discharge_option));

                //Admited
                WebHelpers.BindDateTimePicker(dtpk_admited_date_time, ena.admited_date_time);

                txt_admited_by.Value = ena.admited_by;
                txt_receiving_unit.Value = ena.receiving_unit;

                //Transfer to
                txt_transfer_to.Value = ena.transfer_to;
                txt_transfer_by.Value = ena.transfer_by;

                //noticed time
                WebHelpers.BindDateTimePicker(dtpk_noticed_time, ena.noticed_time);

                //Nursing notes
                ViewState[grid_NursingNotes.ID] = WebHelpers.BindingDataGridView(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note), Ena.NURSING_NOTE_COL, btn_grid_NursingNotes_add);

                DataObj.Value = JsonConvert.SerializeObject(ena);
                WebHelpers.AddScriptFormEdit(Page, ena, (string)Session["emp_id"]);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
            
        }
        private void BindingDataFormView(Ena ena)
        {
            try
            {
                WebHelpers.VisibleControl(false, undo, redo, pencilWrapper);
                image1.Src = JObject.Parse(ena.skin_anno_data).dataURI;
                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(ena.skin_anno_data).dataURI;
                lbl_triage_time.Text = WebHelpers.FormatDateTime(ena.triage_time, "dd-MM-yyyy HH:mm");
                lbl_triage_area.Text = WebHelpers.FormatString(ena.triage_area);
                lbl_chief_complaint.Text = WebHelpers.FormatString(ena.chief_complaint);
                lbl_triage_desc.Text = WebHelpers.FormatString(ena.triage_desc);
                lbl_arrival_mode_desc.Text = WebHelpers.FormatString(ena.arrival_mode_desc);
                lbl_past_medical_history.Text = WebHelpers.FormatString(ena.past_medical_history);
                lbl_narrative.Text = WebHelpers.FormatString(ena.narrative);

                lbl_vs_temperature.Text = WebHelpers.FormatString(ena.vs_temperature);
                lbl_vs_weight.Text = WebHelpers.FormatString(ena.vs_weight);
                lbl_vs_height.Text = WebHelpers.FormatString(ena.vs_height);
                txt_vs_bmi.Text = WebHelpers.FormatString(ena.vs_bmi);
                lbl_vs_heart_rate.Text = WebHelpers.FormatString(ena.vs_heart_rate);
                lbl_vs_respiratory_rate.Text = WebHelpers.FormatString(ena.vs_respiratory_rate);
                lbl_vs_blood_pressure.Text = WebHelpers.FormatString(ena.vs_blood_pressure);
                lbl_vs_spo2.Text = WebHelpers.FormatString(ena.vs_spo2);
                lbl_vs_head_circum.Text = WebHelpers.FormatString(ena.vs_head_circum);

                lbl_loc_avpu.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.loc_avpu));
                //Pain assess
                lbl_pain_score.Text = WebHelpers.FormatString(ena.pain_score);
                lbl_pain_onset.Text = WebHelpers.FormatString(ena.pain_onset);
                lbl_pain_location.Text = WebHelpers.FormatString(ena.pain_location);
                lbl_pain_duration.Text = WebHelpers.FormatString(ena.pain_duration);
                lbl_pain_radiation.Text = WebHelpers.FormatString(ena.pain_radiation);
                lbl_allergy.Text = WebHelpers.FormatString(ena.allergy);
                lbl_current_medication.Text = WebHelpers.FormatString(ena.current_medication);
                lbl_skin_integrity.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.skin_integrity));
                lbl_com_dis_src.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.com_dis_src));
                lbl_discharge_plan.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.discharge_plan));
                lbl_dis_after_discharge_code.Text = WebHelpers.FormatString(ena.dis_after_discharge_desc);
                lbl_caregiver_after_discharge.Text = WebHelpers.FormatString(ena.caregiver_after_discharge);
                lbl_btc_language.Text = WebHelpers.FormatString(WebHelpers.GetBool(ena.btc_language, $"Có, Giải thích/Yes Explain {WebHelpers.FormatString(ena.btc_language_note)}"));
                lbl_btc_cognitive.Text = WebHelpers.FormatString(WebHelpers.GetBool(ena.btc_cognitive, $"Có, Giải thích/Yes Explain {WebHelpers.FormatString(ena.btc_cognitive_note)}"));
                lbl_btc_sensory.Text = WebHelpers.FormatString(WebHelpers.GetBool(ena.btc_sensory, $"Có, Giải thích/Yes Explain {WebHelpers.FormatString(ena.btc_sensory_note)}"));
                lbl_btc_religious.Text = WebHelpers.FormatString(WebHelpers.GetBool(ena.btc_religious, $"Có, Giải thích/Yes Explain {WebHelpers.FormatString(ena.btc_religious_note)}"));
                lbl_btc_cultural.Text = WebHelpers.FormatString(WebHelpers.GetBool(ena.btc_cultural, $"Có, Giải thích/Yes Explain {WebHelpers.FormatString(ena.btc_cultural_note)}"));

                lbl_general_appearance.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.general_appearance));
                lbl_eye.Text = WebHelpers.FormatString(ena.eye);
                lbl_voice.Text = WebHelpers.FormatString(ena.voice);
                lbl_motion.Text = WebHelpers.FormatString(ena.motion);

                WebHelpers.VisibleControl(false, cb_alert_true, cb_coma_true, cb_others_true);
                cb_alert_true.Checked = ena.alert;
                cb_coma_true.Checked = ena.coma;
                cb_others_true.Checked = ena.others;
                lbl_str_others.Text = WebHelpers.FormatString(ena.str_others);

                //Cardiovascular
                WebHelpers.VisibleControl(false, cb_rhythm_regular_true, cb_rhythm_inregular_true, cb_rhythm_others_true);
                cb_rhythm_regular_true.Checked = ena.rhythm_regular;
                cb_rhythm_inregular_true.Checked = ena.rhythm_inregular;
                cb_rhythm_others_true.Checked = ena.rhythm_others;
                lbl_rhythm_str_others.Text = ena.rhythm_str_others;
                //Psychosocial
                WebHelpers.VisibleControl(false, cb_psychosocial_true, cb_psychosocial_others_true);
                cb_psychosocial_true.Checked = ena.psychosocial;
                cb_psychosocial_others_true.Checked = ena.psychosocial_others;
                if (cb_psychosocial_others_true.Checked) { lbl_psychosocial_str_others.Text = WebHelpers.FormatString(ena.psychosocial_str_others); }
                //Other systems
                WebHelpers.VisibleControl(false, cb_other_systems_normal_true, cb_other_systems_abnormal_true);
                cb_other_systems_normal_true.Checked = ena.other_systems_normal;
                cb_other_systems_abnormal_true.Checked = ena.other_systems_abnormal;
                if (cb_other_systems_abnormal_true.Checked) { lbl_others_systems_str.Text = ena.others_systems_str; }
                //Sản-phụ
                lbl_respiratory.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.respiratory));
                lbl_lmp.Text = WebHelpers.FormatString(ena.lmP_note);
                lbl_para.Text = WebHelpers.FormatString(ena.para);
                lbl_abortions.Text = WebHelpers.FormatString(ena.abortions);
                //Intervention Procedure
                lbl_blood_glucose_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.blood_glucose_date_time));
                lbl_blood_glucose_note.Text = WebHelpers.FormatString(ena.blood_glucose_note);

                lbl_ecg_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.ecg_date_time));
                lbl_ecg_note.Text = WebHelpers.FormatString(ena.ecg_note);

                lbl_urine_cath_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.urine_cath_date_time));
                lbl_urine_cath_note.Text = WebHelpers.FormatString(ena.urine_cath_note);

                lbl_splint_cast_dressing_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.splint_cast_dressing_date_time));
                lbl_splint_cast_dressing_note.Text = WebHelpers.FormatString(ena.splint_cast_dressing_note);

                lbl_procedure_other_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.procedure_other_date_time));
                lbl_procedure_other_note.Text = WebHelpers.FormatString(ena.procedure_other_note);

                //

                //DataBind(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system));
                WebHelpers.LoadDataGridView(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system), Ena.ASSESSMENT_SYSTEM_COL, btn_grid_AssessmentSystem_add);

                //Direct Medication & IV fluids Order
                WebHelpers.LoadDataGridView(gridDirectMedication, WebHelpers.GetJSONToDataTable(ena.direct_medication), Ena.DIRECT_MEDICATION_COL, btn_gridDirectMedication_add);

                //Discharged
                lbl_discharge_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.discharge_date_time));
                lbl_discharge_by.Text = WebHelpers.FormatString(ena.discharge_by);
                lbl_discharge_option.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.discharge_option));

                lbl_admited_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.admited_date_time));
                lbl_admited_by.Text = WebHelpers.FormatString(ena.admited_by);
                lbl_receiving_unit.Text = WebHelpers.FormatString(ena.receiving_unit);

                lbl_transfer_to.Text = WebHelpers.FormatString(ena.transfer_to);
                lbl_transfer_by.Text = WebHelpers.FormatString(ena.transfer_by);
                lbl_noticed_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.noticed_time));

                //PHIẾU GHI CHÚ ĐIỀU DƯỠNG / NURSING NOTES
                WebHelpers.LoadDataGridView(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note), Iina.SKIN_ANNO, btn_grid_NursingNotes_add);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Ena ena)
        {
            try
            {

                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();

                //prt_pid.Text = prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;
                prtdate.Text = $"Ngày/<span class='text-primary'>Date</span>: {WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time)} Giờ/ <span class='text-primary'>Triage Time</span> {WebHelpers.FormatDateTime(ena.triage_time, "HH")}:{WebHelpers.FormatDateTime(ena.triage_time, "mm")} Khu vực/ <span class='text-primary'>Triage Area</span> #: {ena.triage_area}";
                
                prt_fullname.Text = patient.GetFullName();
                prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
                prt_nationality.Text = patient.GetNationality() ;
                prt_address.Text = patient.GetAddress();
                prt_contact.Text = patient.getContact();
                prt_relationship.Text = patient.getRelationship();
                prt_telephone.Text = patient.contact_phone_number;
                prt_chieft_complaint.Text = ena.chief_complaint;
                prt_chieft_complaint_code.Text = WebHelpers.CreateOptions(Ena.TRIAGE_CODE, ena.triage_code, "display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr");

                prt_mode_of_arrival.Text = WebHelpers.CreateOptions(Ena.ARRIVAL_MODE_CODE, ena.arrival_mode_code, "display: grid; grid-template-columns: 1fr 1fr 1fr");

                prt_past_medical_history.Text = "Tiền căn/ <span class='text-primary'>Past Medical History:</span>" + ena.past_medical_history;

                prt_vital_signs.Text = $"Dấu sinh hiệu/ <span class='text-primary'>Vital signs</span>: Huyết áp/<span class='text-primary'>BP</span>:{ena.vs_blood_pressure}mmHg Mạch/ <span class='text-primary'>Pulse</span>:{ena.vs_head_circum}lần/phút/bpm Nhiệt độ/<span class='text-primary'>Temp</span>:{ena.vs_temperature}0C (Gồm trẻ em/<span class='text-primary'>Including child aged</span> >= 3 tuổi/<span class='text-primary'>years old</span>) Nhịp thở/<span class='text-primary'>Resp</span>: {ena.vs_respiratory_rate} lần/phút/min. Độ bão hòa oxy/<span class='text-primary'>O2Sat</span>: {ena.vs_spo2}%";

                prt_loc_avpu.Text = WebHelpers.CreateOptions(Ena.LOC_AVPU_CODE, ena.loc_avpu, "display: grid; grid-template-columns: 1fr 1fr 1fr 1fr");

                prt_pain_assess.Text = $"Đánh giá đau/ <span class='text-primary'>Pain assess</span>. Khởi phát/ <span class='text-primary'>Onset</span>{ena.pain_onset}Vị trí/ <span class='text-primary'>Location</span>{ena.pain_location}Kéo dài/<span class='text-primary'>Duration</span>{ena.pain_duration}Hướng lan/Radiation {ena.pain_radiation}";

                prt_pain_scale.Text = $"Điểm đau/ <span class='text-primary'>Pain scale:</span>{ena.pain_score}/10";

                prt_weight.Text = $"Cân nặng/ Weight: {ena.vs_weight} kg Chiều cao/ Height: {ena.vs_height}cm";
                prt_pulse.Text = $"Vòng đầu/ Head circumsference: {ena.vs_head_circum} cm";
                prt_allergy.Text = $"Dị ứng/ Allergy {ena.allergy}";
                prt_medications_used.Text = $"Thuốc đã dùng/ Medications used: {ena.past_medical_history}";

                prt_skin_integrity.Text = WebHelpers.CreateOptions(Ena.SKIN_INTEGRITY_CODE, "", "");

                prt_com_dis_src.Text = WebHelpers.CreateOptions(Ena.COM_DIS_SRC_CODE, ena.com_dis_src, "");

                prt_discharge_plan.Text = WebHelpers.CreateOptions(Ena.DISCHARGE_PLAN_CODE, ena.discharge_plan, "");
                prt_caregiver_after_discharge.Text = $"Người chăm sóc sau khi xuất viện/ People who will look after patient after discharge {ena.caregiver_after_discharge}";

                prt_btc_language.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Giải thích/ Yes Explain " }, ena.btc_language, "display: grid;grid-template-columns:auto auto;");
                prt_btc_language_note.Text = ena.btc_language_note;

                prt_btc_cognitive.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Giải thích/ Yes Explain " }, ena.btc_cognitive, "display: grid;grid-template-columns:auto auto;");
                prt_btc_cognitive_note.Text = ena.btc_cognitive_note;

                //prt_btc_sensory.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Giải thích/ Yes Explain " }, ena.btc_sensory, "display: grid;grid-template-columns:auto auto;");
                //prt_btc_sensory_note.Text = ena.btc_sensory_note;

                //prt_btc_religious.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Giải thích/ Yes Explain " }, ena.btc_religious, "display: grid;grid-template-columns:auto auto;") + (ena.btc_religious ? ena.btc_religious_note : "");
                //prt_btc_religious_note.Text = ena.btc_religious_note;

                //prt_btc_cultural.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Giải thích/ Yes Explain " }, ena.btc_cultural, "display: grid;grid-template-columns:auto auto;");
                //prt_btc_cultural_note.Text = ena.btc_cultural_note;

                prt_room_number.Text = "";
                prt_time_of_assess.Text = " ";

                prt_general_appearance.Text = WebHelpers.CreateOptions(Ena.GENERAL_APPEARANCE_CODE, ena.general_appearance, "");
                prt_neuro.Text = $"Thần kinh/ <span class='text-primary'>Neuro</span>: GCS: Mắt/<span class='text-primary'>E</span> {ena.eye} Lời nói/<span class='text-primary'>V</span> {ena.voice} Vận động/<span class='text-primary'>M</span> {ena.motion}";

                prt_alert.Text = WebHelpers.GetCheckedIcon(ena.alert);
                prt_coma.Text = WebHelpers.GetCheckedIcon(ena.coma);
                prt_other.Text = WebHelpers.GetCheckedIcon(ena.others);
                prt_str_others.Text = ena.str_others;


                prt_rhythm_regular.Text = WebHelpers.GetCheckedIcon(ena.rhythm_regular);
                prt_rhythm_inregular.Text = WebHelpers.GetCheckedIcon(ena.rhythm_inregular);

                prt_psychosocial.Text = WebHelpers.GetCheckedIcon(ena.psychosocial);
                prt_psychosocial_others.Text = WebHelpers.GetCheckedIcon(ena.psychosocial_others);
                prt_psychosocial_str_others.Text = ena.psychosocial_str_others;

                //
                prt_other_systems_normal.Text = WebHelpers.GetCheckedIcon(ena.other_systems_normal);
                prt_other_systems_abnormal.Text = WebHelpers.GetCheckedIcon(ena.other_systems_abnormal);
                prt_others_systems_str.Text = ena.others_systems_str;
                //
                prt_lmp.Text = WebHelpers.GetCheckedIcon(ena.lmp);
                prt_lmp_note.Text = ena.lmP_note;
                prt_para.Text = ena.para;
                prt_abortions.Text = ena.abortions;

                prt_respiratory.Text = ena.respiratory;

                //
                prt_noticed_time.Text = WebHelpers.FormatDateTime(ena.noticed_time, "dd-MM-yyyy HH:mm");

                prt_assessment_system.DataSource = WebHelpers.GetJSONToDataTable(ena.assessment_system);
                prt_assessment_system.DataBind();

                prt_direct_medication.DataSource = WebHelpers.GetJSONToDataTable(ena.direct_medication);
                prt_direct_medication.DataBind();

                //
                prt_discharge_by.Text = ena.discharge_by;
                prt_discharge_date_time.Text = WebHelpers.FormatDateTime(ena.discharge_date_time);
                prt_discharge_option.Text = WebHelpers.CreateOptions(Ena.DISCHARGE_OPTION_CODE, ena.discharge_option, "");

                prt_admited_date_time.Text = WebHelpers.FormatDateTime(ena.admited_date_time);
                prt_admited_by.Text = ena.admited_by;
                prt_receiving_unit.Text = "Khoa tiếp nhận/ Receiving Unit: " + ena.receiving_unit;
                prt_transfer_to.Text = $"Chuyển viện/ Transfer to: {ena.transfer_to}";
                prt_transfer_by.Text = $"bởi BS/ by Dr. {ena.transfer_by}";

                prt_nursing_note.DataSource = WebHelpers.GetJSONToDataTable(ena.nursing_note);
                prt_nursing_note.DataBind();

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        #region Actions
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ena = new Ena(DataHelpers.varDocId);
                ena.status = DocumentStatus.FINAL;
                ena.user_name = (string)Session["UserID"];

                UpdateData(ena);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ena = new Ena(DataHelpers.varDocId);
                ena.status = DocumentStatus.DRAFT;
                
                UpdateData(ena);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try {
                dynamic result = Ena.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, (string)Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Ena ena = new Ena(Request.QueryString["docId"]);

                txt_amend_reason.Text = "";
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, ena, ControlState.Edit, (string)Session["location"], (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(ena);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ena = new Ena(Request.QueryString["docId"]);
            BindingDataFormPrint(ena);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        protected void grid_AssessmentSystem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_AssessmentSystem_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_AssessmentSystem.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_AssessmentSystem.ID], grid_AssessmentSystem, Ena.ASSESSMENT_SYSTEM_COL);
        }
        protected void gridDirectMedication_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_gridDirectMedication_add_Click(object sender, EventArgs e)
        {
            ViewState[gridDirectMedication.ID] = WebHelpers.AddRow((DataTable)ViewState[gridDirectMedication.ID], gridDirectMedication, Ena.DIRECT_MEDICATION_COL);
        }
        protected void grid_NursingNotes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_NursingNotes_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_NursingNotes.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_NursingNotes.ID], grid_NursingNotes, Ena.NURSING_NOTE_COL);
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
        }
        #endregion
        private void UploadFile(string base64String)
        {
            ////Clear changes and remove uploaded image from Cache
            //RadImageEditor1.ResetChanges();

            //byte[] bytes = Convert.FromBase64String(base64String);

            //ms = new MemoryStream(bytes);

            //ViewState[RadImageEditor1.ID] = ms;

            //using (ms = new MemoryStream(bytes))
            //{

            //    ms.Write(bytes, 0, bytes.Length);
            //    Context.Cache.Insert(Session.SessionID + "UploadedFile", ms, null, DateTime.Now.AddMinutes(20), TimeSpan.Zero);

            //    //image = Image.FromStream(ms);
            //}
        }

        public TimeSpan? GetTimeSpan(string time)
        {
            if (string.IsNullOrEmpty(time)) return null;
            else return TimeSpan.Parse(time);
        }

        private void RadImageEditor1_ImageEditing1(object sender, ImageEditorEditingEventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void gridAssessmentSystem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                    }
                }
            }
        }

        protected void RadImageEditor1_ImageLoading(object sender, ImageEditorLoadingEventArgs args)
        {
            //Handle Uploaded images
           
            //using (EditableImage image = new EditableImage((MemoryStream)ViewState[RadImageEditor1.ID]))
            //{
            //    args.Image = image.Clone();
            //    args.Cancel = true;
            //}
        }

        protected void RadImageEditor1_ImageChanged(object sender, ImageEditorEventArgs args)
        {
            //using (MemoryStream ms = new MemoryStream())
            //{
            //    args.Image.Image.Save(ms, args.Image.Image.RawFormat);
                
            //    ViewState[RadImageEditor1.ID] = ms;
            //}
        }

        #region Methods
        private void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];
            try
            {
                Ena ena = new Ena(Request.QueryString["docId"]);
                BindingDataFormPrint(ena);

                imageTemp.Src = JObject.Parse(ena.skin_anno_data).dataURI;

                ena.skin_anno_data = WebHelpers.getImageDefault(ena.skin_anno_data);

                prt_barcode.Text = Patient.Instance().visible_patient_id;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;

                if (ena.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(ena, WebHelpers.LoadFormControl(form1, ena, ControlState.View, (string)Session["location"], (string)Session["access_authorize"]));
                }
                else if (ena.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(ena, WebHelpers.LoadFormControl(form1, ena, ControlState.Edit, (string)Session["location"], (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, ena.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        private void UpdateData(Ena ena)
        {
            try
            {
                ena.triage_time = DataHelpers.ConvertSQLDateTime(dtpk_triage_time.SelectedDate);

                ena.triage_area = txt_triage_area.Value;

                ena.chief_complaint = txt_chief_complaint.Value;

                ena.triage_code = WebHelpers.GetRadioButton(form1, "rad_triage_code_", Ena.TRIAGE_CODE);
                if (ena.triage_code != null) { ena.triage_desc = Ena.TRIAGE_CODE[ena.triage_code]; }

                ena.arrival_mode_code = WebHelpers.GetRadioButton(form1, "rad_arrival_mode_code_", Ena.ARRIVAL_MODE_CODE);
                if (ena.arrival_mode_code != null) { ena.arrival_mode_desc = Ena.ARRIVAL_MODE_CODE[ena.arrival_mode_code]; }

                //ena.arrival_mode_note = ?

                //
                ////Past Medical History
                ena.past_medical_history = txt_past_medical_history.Value;

                ////Narrative
                ena.narrative = txt_narrative.Value;

                //Vital signs
                ena.vs_temperature = txt_vs_temperature.Value;
                ena.vs_heart_rate = txt_vs_heart_rate.Value;
                ena.vs_weight = txt_vs_weight.Value;
                ena.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                ena.vs_height = txt_vs_height.Value;
                ena.vs_blood_pressure = txt_vs_blood_pressure.Value;
                ena.vs_bmi = txt_vs_bmi.Text;
                ena.vs_spo2 = txt_vs_spo2.Value;
                ena.vs_head_circum = txt_vs_head_circum.Value;

                //GetCheckBox("cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);

                //GetCheckBox(string checkbox, Dictionary<string, string> value)

                ena.loc_avpu = WebHelpers.GetCheckBox(form1, "cb_loc_avpu_", Ena.LOC_AVPU_CODE, "cde");

                ena.pain_onset = txt_pain_onset.Value;
                ena.pain_location = txt_pain_location.Value;
                ena.pain_duration = txt_pain_duration.Value;
                ena.pain_radiation = txt_pain_radiation.Value;
                ena.pain_score = txt_pain_score.Value;

                ena.allergy = txt_allergy.Value;
                ena.current_medication = txt_current_medication.Value;

                ena.skin_integrity = WebHelpers.GetCheckBox(form1, "cb_skin_integrity_", Ena.SKIN_INTEGRITY_CODE, "cde");

                //dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(ena.skin_anno_data);
                //jsonObject.dataURI = string.Format("{0}", "data:image/png;base64,", ViewState[RadImageEditor1.ID]);

                //ena.skin_anno_data = new JavaScriptSerializer().Serialize(jsonObject);

                ena.com_dis_src = WebHelpers.GetCheckBox(form1, "cb_com_dis_src_", Ena.COM_DIS_SRC_CODE, "cde");

                ena.discharge_plan = WebHelpers.GetCheckBox(form1, "cb_discharge_plan_", Ena.DISCHARGE_PLAN_CODE, "cde");

                ena.dis_after_discharge_code = WebHelpers.GetRadioButton(form1, "rad_dis_after_discharge_code_", Ena.DIS_AFTER_DISCHARGE_CODE);
                if (ena.dis_after_discharge_code != null) ena.dis_after_discharge_desc = Ena.DIS_AFTER_DISCHARGE_CODE[ena.dis_after_discharge_code];

                ena.caregiver_after_discharge = txt_caregiver_after_discharge.Value;

                ena.btc_language = WebHelpers.GetRadioButton(form1, "rad_btc_language_");
                ena.btc_language_note = txt_btc_language_note.Value;

                ena.btc_cognitive = WebHelpers.GetRadioButton(form1, "rad_btc_cognitive_");
                ena.btc_cognitive_note = txt_btc_cognitive_note.Value;

                ena.btc_sensory = WebHelpers.GetRadioButton(form1, "rad_btc_sensory_");
                ena.btc_sensory_note = txt_btc_sensory_note.Value;

                ena.btc_religious = WebHelpers.GetRadioButton(form1, "rad_btc_religious_");
                ena.btc_religious_note = txt_btc_religious_note.Value;

                ena.btc_cultural = WebHelpers.GetRadioButton(form1, "rad_btc_cultural_");
                ena.btc_cultural_note = txt_btc_cultural_note.Value;

                ena.general_appearance = WebHelpers.GetCheckBox(form1, "cb_general_appearance_", Ena.GENERAL_APPEARANCE_CODE, "cde");

                ena.eye = txt_eye.Value;
                ena.voice = txt_voice.Value;
                ena.motion = txt_motion.Value;

                ena.alert = cb_alert_true.Checked;
                ena.coma = cb_coma_true.Checked;
                ena.others = cb_others_true.Checked;
                ena.str_others = txt_str_others.Value;

                WebHelpers.GetCheckBox(form1, "cb_respiratory_", Ena.RESPIRATORY_CODE, out DataTable dtb_respiratory, "cde");

                if (cb_respiratory_oth.Checked)
                {
                    DataRow dtRow = dtb_respiratory.NewRow();

                    dtRow["cde"] = "OTH";
                    dtRow["desc"] = txt_respiratory_oth.Value;
                    dtb_respiratory.Rows.Add(dtRow);
                }

                ena.respiratory = JsonConvert.SerializeObject(dtb_respiratory);

                ena.rhythm_regular = cb_rhythm_regular_true.Checked;
                ena.rhythm_inregular = cb_rhythm_inregular_true.Checked;
                ena.rhythm_others = cb_rhythm_others_true.Checked;
                ena.rhythm_str_others = txt_rhythm_str_others.Value;

                ena.psychosocial = cb_psychosocial_true.Checked;
                ena.psychosocial_others = cb_psychosocial_others_true.Checked;
                ena.psychosocial_str_others = txt_psychosocial_str_others.Value;

                ena.other_systems_normal = cb_other_systems_normal_true.Checked;
                ena.other_systems_abnormal = cb_other_systems_abnormal_true.Checked;
                ena.others_systems_str = txt_others_systems_str.Value;

                ena.lmp = cb_lmp_true.Checked;
                ena.lmP_note = txt_lmP_note.Value;
                ena.para = txt_para.Value;
                ena.abortions = txt_abortions.Value;

                ena.blood_glucose_date_time = DataHelpers.ConvertSQLDateTime(dtpk_blood_glucose_date_time.SelectedDate);
                ena.blood_glucose_note = txt_blood_glucose_note.Value;

                ena.ecg_date_time = DataHelpers.ConvertSQLDateTime(dtpk_ecg_date_time.SelectedDate);

                ena.ecg_note = txt_ecg_note.Value;

                ena.urine_cath_date_time = DataHelpers.ConvertSQLDateTime(dtpk_urine_cath_date_time.SelectedDate);

                ena.urine_cath_note = txt_urine_cath_note.Value;

                ena.splint_cast_dressing_date_time = DataHelpers.ConvertSQLDateTime(dtpk_splint_cast_dressing_date_time.SelectedDate);

                ena.splint_cast_dressing_note = txt_splint_cast_dressing_note.Value;

                ena.procedure_other_date_time = DataHelpers.ConvertSQLDateTime(dtpk_procedure_other_date_time.SelectedDate);

                ena.procedure_other_note = txt_procedure_other_note.Value;

                // Assessment System

                ena.assessment_system = WebHelpers.GetDataGridView(grid_AssessmentSystem, Ena.ASSESSMENT_SYSTEM_COL);

                ena.direct_medication = WebHelpers.GetDataGridView(gridDirectMedication, Ena.DIRECT_MEDICATION_COL);

                // Discharged
                ena.discharge_date_time = DataHelpers.ConvertSQLDateTime(dtpk_discharge_date_time.SelectedDate);
                ena.discharge_by = txt_discharge_by.Value;

                ena.discharge_option = WebHelpers.GetCheckBox(form1, "cb_discharge_option_", Ena.DISCHARGE_OPTION_CODE);

                // Admited
                ena.admited_date_time = DataHelpers.ConvertSQLDateTime(dtpk_admited_date_time.SelectedDate);
                ena.admited_by = txt_admited_by.Value;
                ena.receiving_unit = txt_receiving_unit.Value;

                // transfer
                ena.transfer_to = txt_transfer_to.Value;
                ena.transfer_by = txt_transfer_by.Value;

                //
                ena.noticed_time = DataHelpers.ConvertSQLDateTime(dtpk_noticed_time.SelectedDate);

                // nursing notes
                ena.nursing_note = WebHelpers.GetDataGridView(grid_NursingNotes, Ena.NURSING_NOTE_COL);

                ena.skin_anno_data = "{\"dataURI\":\""+ skin_anno_data_base64.Value + "\"}";

                if (JsonConvert.SerializeObject(ena) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                ena.amend_reason = txt_amend_reason.Text;
                ena.user_name = (string)Session["UserID"];

                dynamic result = ena.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        protected void prt_direct_medication_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell2 = new TableCell();

                HeaderCell2.Text = "Giờ/ Time";

                HeaderCell2.RowSpan = 2;

                HeaderRow.Cells.Add(HeaderCell2);



                HeaderCell2 = new TableCell();

                HeaderCell2.Text = "Y lệnh thuốc & dịch truyền trực tiếp/ Direct Medication & IV fluids Order";

                HeaderCell2.ColumnSpan = 4;

                HeaderRow.Cells.Add(HeaderCell2);



                HeaderCell2 = new TableCell();

                HeaderCell2.Text = "BÁC SĨ/ DOCTOR";

                HeaderCell2.RowSpan = 2;

                HeaderRow.Cells.Add(HeaderCell2);


                HeaderCell2 = new TableCell();

                HeaderCell2.Text = "GHI CHÚ/ COMMENT";

                HeaderCell2.RowSpan = 2;

                HeaderRow.Cells.Add(HeaderCell2);



                HeaderCell2 = new TableCell();

                HeaderCell2.Text = "Giờ/ Time";

                HeaderCell2.RowSpan = 2;

                HeaderRow.Cells.Add(HeaderCell2);


                HeaderCell2 = new TableCell();

                HeaderCell2.Text = "Chữ kí/ Tên & MSNV Signature/ Name & ID";

                HeaderCell2.RowSpan = 2;

                HeaderRow.Cells.Add(HeaderCell2);


                prt_direct_medication.Controls[0].Controls.AddAt(0, HeaderRow);

                GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);


                TableCell HeaderCell = new TableCell();

                HeaderCell.Text = "Thuốc/ Medication Dịch truyền/ IV FLUIDS";

                HeaderRow1.Cells.Add(HeaderCell);



                HeaderCell = new TableCell();

                HeaderCell.Text = "LIỀU/ DOSE";

                HeaderRow1.Cells.Add(HeaderCell);



                HeaderCell = new TableCell();

                HeaderCell.Text = "ĐƯỜNG DÙNG/ ROUTE";

                HeaderRow1.Cells.Add(HeaderCell);


                HeaderCell = new TableCell();

                HeaderCell.Text = "TỐC ĐỘ/ RATE";

                HeaderRow1.Cells.Add(HeaderCell);

                prt_direct_medication.Controls[0].Controls.AddAt(1, HeaderRow1);
            }
        }

        protected void prt_nursing_note_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell2 = new TableCell();

                HeaderCell2.Text = "PHIẾU GHI CHÚ ĐIỀU DƯỠNG <br/> <span class='text-primary text-center'> NURSING NOTES</span>";
                HeaderCell2.CssClass = "p-2 text-center";
                HeaderCell2.ColumnSpan = 5;

                HeaderRow.Cells.Add(HeaderCell2);

                prt_nursing_note.Controls[0].Controls.AddAt(0, HeaderRow);

                GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);


                TableCell HeaderCell = new TableCell();
                
                HeaderCell.Text = "NGÀY <br> <span class='text-primary text-center'>DATE</span>  <br/> dd/mm/yyyy";
                HeaderCell.Width = 50;
                HeaderCell.CssClass = "p-2 text-center";
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();

                HeaderCell.Text = "GIỜ PHÚT <br/> <span class='text-primary text-center'>TIME </span> <br/> hh:mm";
                HeaderCell.Width = 40;
                HeaderCell.CssClass = "p-2 text-center";
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();

                HeaderCell.Text = "THEO DÕI DIỄN TIẾN <br/> <span class='text-primary text-center'> PATIENT CONDITION </span>";
                HeaderCell.Width = 100;
                HeaderCell.CssClass = "p-2 text-center";
                HeaderRow1.Cells.Add(HeaderCell);


                HeaderCell = new TableCell();

                HeaderCell.Text = "CAN THIỆP ĐIỀU DƯỠNG <br/> <span class='text-primary text-center'>NURSING INTERVENTION</span>";
                HeaderCell.CssClass = "p-2 text-center";
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.CssClass = "p-2 text-center";
                HeaderCell.Text = "KÝ/GHI TÊN ĐD <br/> <span class='text-primary text-center'>RN'S NAME & SIGNATURE</span>";

                HeaderRow1.Cells.Add(HeaderCell);

                prt_nursing_note.Controls[0].Controls.AddAt(1, HeaderRow1);
            }
        }
    }
}
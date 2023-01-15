using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace EMR
{
    public partial class EmergencyTriageAndNursingAssessmentRecord : System.Web.UI.Page
    {
        #region Variables
        Ena ena;
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
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) return;

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            string url = Request.RawUrl.Split('.')[0];
            var urlArr = url.Split('/');
            url = urlArr[urlArr.Length - 1];

            PAGE_URL = $"/ER/{url}.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

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
                WebHelpers.VisibleControl(true, undo, redo, pencilWrapper, cb_alert_true, cb_coma_true, cb_others_true, cb_rhythm_regular_true, cb_rhythm_inregular_true, cb_rhythm_others_true, cb_psychosocial_true, cb_psychosocial_others_true, cb_other_systems_normal_true, cb_other_systems_abnormal_true);

                cb_rhythm_regular_true.Disabled
                    = cb_rhythm_inregular_true.Disabled
                    = cb_rhythm_cardiac_arrest_true.Disabled
                    = cb_rhythm_chest_pain_true.Disabled
                    = cb_rhythm_others_true.Disabled = false;

                cb_alert_true.Disabled = cb_coma_true.Disabled = cb_others_true.Disabled = false;

                cb_psychosocial_true.Disabled = cb_psychosocial_others_true.Disabled = false;

                cb_other_systems_normal_true.Disabled = cb_other_systems_abnormal_true.Disabled = false;

                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(ena.skin_anno_data).dataURI;
                //Triage Date Time
                WebHelpers.BindDateTimePicker(dtpk_triage_time, ena.triage_time);

                //Triage Area #
                txt_triage_area.Value = ena.triage_area;

                //Chief complaint
                txt_chief_complaint.Value = ena.chief_complaint;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_triage_code_" + ena.triage_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_arrival_mode_code_" + ena.arrival_mode_code);

                if (ena.arrival_mode_code == "OTH") { txt_arrival_mode_note.Value = ena.arrival_mode_note; }

                //Past Medical History
                txt_past_medical_history.Value = ena.past_medical_history;

                ////Narrative
                txt_narrative.Value = ena.narrative;

                //Vital signs
                txt_vs_temperature.Value = ena.vs_temperature;
                txt_vs_heart_rate.Value = ena.vs_heart_rate;
                txt_vs_weight.Value = ena.vs_weight;
                txt_vs_respiratory_rate.Value = ena.vs_respiratory_rate;
                txt_vs_height.Value = ena.vs_height;
                txt_vs_blood_pressure.Value = ena.vs_blood_pressure;
                txt_vs_bmi.Value = ena.vs_bmi;
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
                //updated 26/11/21 (by Ken)
                txt_room_number.Value = ena.room_number;
                WebHelpers.BindDateTimePicker(dtpk_time_of_assessment, ena.time_of_assessment);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_general_appearance_", WebHelpers.GetJSONToDataTable(ena.general_appearance), "cde");

                txt_eye.Value = ena.eye;
                txt_voice.Value = ena.voice;
                txt_motion.Value = ena.motion;

                //

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_alert_" + ena.alert);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_coma_" + ena.coma);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_others_" + ena.others);

                txt_str_others.Value = ena.str_others;

                WebHelpers.VisibleControl(true, txt_respiratory_oth_field);
                WebHelpers.VisibleControl(false, lbl_respiratory_oth);
                cb_respiratory_oth.Disabled = false;
                DataTable respiratory = WebHelpers.GetJSONToDataTable(ena.respiratory);

                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_respiratory_", respiratory, out int oth_index, "cde");
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_respiratory_", respiratory, out int oth_index, "code");

                if (oth_index != -1)
                {
                    txt_respiratory_oth.Value = respiratory.Rows[oth_index].Field<string>("desc").ToString();
                }

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_regular_" + ena.rhythm_regular);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_inregular_" + ena.rhythm_inregular);
                //updated 01/12/21 (by Ken)
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_cardiac_arrest_" + ena.rhythm_cardiac_arrest);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_chest_pain_" + ena.rhythm_chest_pain);
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
                txt_blood_glucose_signature.Value = ena.blood_glucose_signature;

                WebHelpers.BindDateTimePicker(dtpk_ecg_date_time, ena.ecg_date_time);
                txt_ecg_note.Value = ena.ecg_note;
                txt_ecg_signature.Value = ena.ecg_signature;

                WebHelpers.BindDateTimePicker(dtpk_urine_cath_date_time, ena.urine_cath_date_time);
                txt_urine_cath_note.Value = ena.urine_cath_note;
                txt_urine_cath_signature.Value = ena.urine_cath_signature;

                WebHelpers.BindDateTimePicker(dtpk_splint_cast_dressing_date_time, ena.splint_cast_dressing_date_time);
                txt_splint_cast_dressing_note.Value = ena.splint_cast_dressing_note;
                txt_splint_cast_dressing_signature.Value = ena.splint_cast_dressing_signature;

                WebHelpers.BindDateTimePicker(dtpk_procedure_other_date_time, ena.procedure_other_date_time);
                txt_procedure_other_note.Value = ena.procedure_other_note;
                txt_procedure_other_signature.Value = ena.procedure_other_signature;

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
                ViewState[grid_NursingNotes.ID] = WebHelpers.BindingDataGridView_NursingNote(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note), Ena.NURSING_NOTE_COL, btn_grid_NursingNotes_add);

                DataObj.Value = JsonConvert.SerializeObject(ena);

                //Session["docid"] = ena.document_id;
                //WebHelpers.AddScriptFormEdit(Page, ena, (string)Session["emp_id"], loc);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "localStorage_addItem", "window.localStorage.setItem(\"document_id\", \"" + varDocID + "\");", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }

        private void BindingDataFormView(Ena ena)
        {
            try
            {
                WebHelpers.VisibleControl(false, undo, redo, pencilWrapper);

                image1.Src = JObject.Parse(ena.skin_anno_data).dataURI;

                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(ena.skin_anno_data).dataURI;

                lbl_triage_time.Text = WebHelpers.FormatDateTime(ena.triage_time, "dd-MMM-yyyy HH:mm");

                lbl_triage_area.Text = WebHelpers.FormatString(ena.triage_area);

                lbl_chief_complaint.Text = WebHelpers.FormatString(ena.chief_complaint);

                lbl_triage_desc.Text = WebHelpers.FormatString(ena.triage_desc);

                lbl_arrival_mode_desc.Text = WebHelpers.FormatString(ena.arrival_mode_desc);

                lbl_past_medical_history.Text = WebHelpers.FormatString(ena.past_medical_history);

                lbl_narrative.Text = WebHelpers.FormatString(ena.narrative);

                lbl_vs_bmi.Text = WebHelpers.FormatString(ena.vs_bmi) + "&nbsp;(Kg/m <sup>2</sup>)";

                lbl_vs_temperature.Text = WebHelpers.FormatString(ena.vs_temperature) + "&nbsp;°C";

                lbl_vs_weight.Text = WebHelpers.FormatString(ena.vs_weight) + "&nbsp;kg";

                lbl_vs_height.Text = WebHelpers.FormatString(ena.vs_height) + "&nbsp;cm";

                lbl_vs_heart_rate.Text = WebHelpers.FormatString(ena.vs_heart_rate) + "&nbsp;/phút (m)";

                lbl_vs_respiratory_rate.Text = WebHelpers.FormatString(ena.vs_respiratory_rate) + "&nbsp;/phút (m)";

                lbl_vs_blood_pressure.Text = WebHelpers.FormatString(ena.vs_blood_pressure) + "&nbsp;mmHg";

                lbl_vs_spo2.Text = WebHelpers.FormatString(ena.vs_spo2) + "&nbsp;%";

                lbl_vs_head_circum.Text = WebHelpers.FormatString(ena.vs_head_circum) + "&nbsp;cm";

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
                //updated 26/11/21 (by Ken)
                lbl_room_number.Text = ena.room_number;
                lbl_time_of_assessment.Text = WebHelpers.FormatDateTime(ena.time_of_assessment, "dd-MMM-yyyy HH:mm");
                lbl_general_appearance.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.general_appearance));
                lbl_eye.Text = WebHelpers.FormatString(ena.eye);
                lbl_voice.Text = WebHelpers.FormatString(ena.voice);
                lbl_motion.Text = WebHelpers.FormatString(ena.motion);

                cb_alert_true.Disabled = cb_coma_true.Disabled = cb_others_true.Disabled = true;
                cb_alert_true.Checked = ena.alert;
                cb_coma_true.Checked = ena.coma;
                cb_others_true.Checked = ena.others;
                lbl_str_others.Text = WebHelpers.FormatString(ena.str_others);
                //Cardiovascular
                cb_rhythm_regular_true.Disabled
                    = cb_rhythm_inregular_true.Disabled
                    = cb_rhythm_cardiac_arrest_true.Disabled
                    = cb_rhythm_chest_pain_true.Disabled
                    = cb_rhythm_others_true.Disabled = true;

                cb_rhythm_regular_true.Checked = ena.rhythm_regular;
                cb_rhythm_inregular_true.Checked = ena.rhythm_inregular;
                //updated 01/12/21
                cb_rhythm_cardiac_arrest_true.Checked = ena.rhythm_cardiac_arrest != null && ena.rhythm_cardiac_arrest;
                cb_rhythm_chest_pain_true.Checked = ena.rhythm_chest_pain != null && ena.rhythm_chest_pain;

                cb_rhythm_others_true.Checked = ena.rhythm_others;
                lbl_rhythm_str_others.Text = ena.rhythm_str_others;
                //Psychosocial
                cb_psychosocial_true.Disabled = cb_psychosocial_others_true.Disabled = true;
                cb_psychosocial_true.Checked = ena.psychosocial;
                cb_psychosocial_others_true.Checked = ena.psychosocial_others;
                if (cb_psychosocial_others_true.Checked) { lbl_psychosocial_str_others.Text = WebHelpers.FormatString(ena.psychosocial_str_others); }
                //Other systems

                cb_other_systems_normal_true.Disabled = cb_other_systems_abnormal_true.Disabled = true;
                cb_other_systems_normal_true.Checked = ena.other_systems_normal;
                cb_other_systems_abnormal_true.Checked = ena.other_systems_abnormal;
                if (cb_other_systems_abnormal_true.Checked) { lbl_others_systems_str.Text = ena.others_systems_str; }
                //Sản-phụ
                WebHelpers.VisibleControl(false, txt_respiratory_oth_field);

                DataTable respiratory = WebHelpers.GetJSONToDataTable(ena.respiratory);

                lbl_respiratory.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(respiratory, out int oth_index));

                if (oth_index != -1)
                {
                    cb_respiratory_oth.Checked = cb_respiratory_oth.Disabled = true;
                    WebHelpers.VisibleControl(true, lbl_respiratory_oth, respiratory_oth_field);
                    lbl_respiratory_oth.Text = respiratory.Rows[oth_index].Field<string>("desc").ToString();

                }
                else
                {
                    WebHelpers.VisibleControl(false, lbl_respiratory_oth, respiratory_oth_field);
                }

                lbl_lmp.Text = WebHelpers.FormatString(WebHelpers.GetBool(ena.lmp, "True", "False")) + " " + WebHelpers.FormatString(ena.lmP_note);
                lbl_para.Text = WebHelpers.FormatString(ena.para);
                lbl_abortions.Text = WebHelpers.FormatString(ena.abortions);
                //Intervention Procedure
                lbl_blood_glucose_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.blood_glucose_date_time, "dd-MMM-yyyy HH:mm"));
                lbl_blood_glucose_note.Text = WebHelpers.FormatString(ena.blood_glucose_note);
                lbl_blood_glucose_signature.Text = WebHelpers.FormatString(ena.blood_glucose_signature);

                lbl_ecg_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.ecg_date_time, "dd-MMM-yyyy HH:mm"));
                lbl_ecg_note.Text = WebHelpers.FormatString(ena.ecg_note);
                lbl_ecg_signature.Text = WebHelpers.FormatString(ena.ecg_signature);

                lbl_urine_cath_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.urine_cath_date_time, "dd-MMM-yyyy HH:mm"));
                lbl_urine_cath_note.Text = WebHelpers.FormatString(ena.urine_cath_note);
                lbl_urine_cath_signature.Text = WebHelpers.FormatString(ena.urine_cath_signature);

                lbl_splint_cast_dressing_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.splint_cast_dressing_date_time, "dd-MMM-yyyy HH:mm"));
                lbl_splint_cast_dressing_note.Text = WebHelpers.FormatString(ena.splint_cast_dressing_note);
                lbl_splint_cast_dressing_signature.Text = WebHelpers.FormatString(ena.splint_cast_dressing_signature);

                lbl_procedure_other_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.procedure_other_date_time, "dd-MMM-yyyy HH:mm"));
                lbl_procedure_other_note.Text = WebHelpers.FormatString(ena.procedure_other_note);
                lbl_procedure_other_signature.Text = WebHelpers.FormatString(ena.procedure_other_signature);
                //

                //DataBind(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system));
                WebHelpers.LoadDataGridView(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system), Ena.ASSESSMENT_SYSTEM_COL, btn_grid_AssessmentSystem_add);

                //Direct Medication & IV fluids Order
                WebHelpers.LoadDataGridView(gridDirectMedication, WebHelpers.GetJSONToDataTable(ena.direct_medication), Ena.DIRECT_MEDICATION_COL, btn_gridDirectMedication_add);

                //Discharged
                lbl_discharge_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.discharge_date_time, "dd-MMM-yyyy HH:mm"));

                lbl_discharge_by.Text = WebHelpers.FormatString(ena.discharge_by);

                lbl_discharge_option.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ena.discharge_option));

                lbl_admited_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.admited_date_time, "dd-MMM-yyyy HH:mm"));

                lbl_admited_by.Text = "bởi BS/ by Dr." + WebHelpers.FormatString(ena.admited_by);

                lbl_receiving_unit.Text = "Khoa tiếp nhận/ Receiving Unit " + WebHelpers.FormatString(ena.receiving_unit);

                lbl_transfer_to.Text = WebHelpers.FormatString(ena.transfer_to);

                lbl_transfer_by.Text = WebHelpers.FormatString(ena.transfer_by);

                lbl_noticed_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.noticed_time, "dd-MMM-yyyy HH:mm"));

                //PHIẾU GHI CHÚ ĐIỀU DƯỠNG / NURSING NOTES
                WebHelpers.LoadDataGridView(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note), Ena.NURSING_NOTE_COL, btn_grid_NursingNotes_add);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }

        private void BindingDataFormPrint(Ena ena)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                //prt_pid.Text = 
                prt_vpid.Text = patientInfo.visible_patient_id;

                prtdate.Text = $"<b>Ngày</b>/<span class='text-primary'><i>Date</i></span>: {WebHelpers.FormatString(WebHelpers.FormatDateTime(patientVisitInfo.actual_visit_date_time, "dd/MM/yyyy"), "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")} <b>Giờ</b>/ <span class='text-primary'><i>Triage Time</i></span>: {WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.triage_time, "HH:mm"), "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")} <b>Khu vực</b>/ <span class='text-primary'><i>Triage Area</i></span> #: {ena.triage_area}";

                prt_fullname.Text = "&nbsp;" + patientInfo.FullName;
                prt_dob.Text = "&nbsp;" + WebHelpers.FormatDateTime(patientInfo.date_of_birth, "dd/MM/yyyy");
                prt_nationality.Text = "&nbsp;" + patientInfo.GetNationality();

                prt_address.Text = WebHelpers.FormatString(patientInfo.Address, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_contact.Text = WebHelpers.FormatString(patientInfo.Contact, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_relationship.Text = WebHelpers.FormatString(patientInfo.Relationship, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_telephone.Text = WebHelpers.FormatString(patientInfo.contact_phone_number, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

                prt_chieft_complaint.Text = ena.chief_complaint;

                prt_mode_of_arrival.Text = WebHelpers.CreateOptions(Ena.ARRIVAL_MODE_CODE, ena.arrival_mode_code, "display: grid; grid-template-columns: 1fr 1fr 1fr");

                Control chieft_complaint = FindControl("prt_chieft_complaint_code" + ena.triage_code);
                if (chieft_complaint != null) { (chieft_complaint as Label).Text = "☒"; }

                prt_past_medical_history.Text = "Tiền căn/ <span class='text-primary'><i>Past Medical History</i>:</span>&nbsp;" + ena.past_medical_history;

                prt_vs_blood_pressure.Text = WebHelpers.FormatString(ena.vs_blood_pressure, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_vs_head_circum.Text = WebHelpers.FormatString(ena.vs_head_circum, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_vs_temperature.Text = WebHelpers.FormatString(ena.vs_temperature, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_vs_resp.Text = WebHelpers.FormatString(ena.vs_respiratory_rate, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_vs_spo2.Text = WebHelpers.FormatString(ena.vs_spo2, "&nbsp;&nbsp;&nbsp;&nbsp;");

                DataTable loc_avpu = WebHelpers.GetJSONToDataTable(ena.loc_avpu);
                if (loc_avpu != null)
                {
                    foreach (DataRow row in loc_avpu.Rows)
                    {
                        string code = Convert.ToString(row["cde"]);
                        Control control = FindControl("prt_loc_avpu_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                prt_pain_onset.Text = WebHelpers.FormatString(ena.pain_onset, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_pain_location.Text = WebHelpers.FormatString(ena.pain_location, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_pain_duration.Text = WebHelpers.FormatString(ena.pain_duration, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_pain_radiation.Text = WebHelpers.FormatString(ena.pain_radiation, "&nbsp;&nbsp;&nbsp;&nbsp;");

                prt_pain_scale.Text = WebHelpers.FormatString(ena.pain_score, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + "/10";
                prt_vs_heart_rate.Text = WebHelpers.FormatString(ena.vs_heart_rate, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_vs_weight.Text = WebHelpers.FormatString(ena.vs_weight, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_vs_height.Text = WebHelpers.FormatString(ena.vs_height, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_vs_head_circum.Text = WebHelpers.FormatString(ena.vs_head_circum, "&nbsp;&nbsp;&nbsp;&nbsp;");

                prt_allergy.Text = $"Dị ứng/ <span class='text-primary'><i>Allergy</i></span>:&nbsp; {ena.allergy}";
                prt_medications_used.Text = ena.current_medication;
                

                DataTable skin_integrity = WebHelpers.GetJSONToDataTable(ena.skin_integrity);
                if (skin_integrity != null)
                {
                    foreach (DataRow row in skin_integrity.Rows)
                    {
                        string code = Convert.ToString(row["cde"]);
                        Control control = FindControl("prt_skin_integrity_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                DataTable com_dis_src = WebHelpers.GetJSONToDataTable(ena.com_dis_src);
                if (com_dis_src != null)
                {
                    foreach (DataRow row in com_dis_src.Rows)
                    {
                        string code = Convert.ToString(row["cde"]);
                        Control control = FindControl("prt_com_dis_src_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                //prt_discharge_plan.Text = WebHelpers.CreateOptions(Ena.DISCHARGE_PLAN_CODE, ena.discharge_plan, "");

                DataTable discharge_plan = WebHelpers.GetJSONToDataTable(ena.discharge_plan);
                if (discharge_plan != null)
                {
                    foreach (DataRow row in discharge_plan.Rows)
                    {
                        string code = Convert.ToString(row["cde"]);
                        Control control = FindControl("prt_discharge_plan_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                Control dis_after_discharge_code = FindControl("prt_dis_after_discharge_code_" + ena.dis_after_discharge_code);
                if (dis_after_discharge_code != null) { (dis_after_discharge_code as Label).Text = "☒"; }

                //prt_dis_after_discharge_code_o.Text = "☒";

                prt_caregiver_after_discharge.Text = $"Người chăm sóc sau khi xuất viện<br/><span class=\"text-primary\"><i>People who will look after patient after discharge</i> </span> {ena.caregiver_after_discharge}";

                prt_btc_language.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\"><i>No</i></span>", Value = false }, new Option { Text = "Có, Giải thích/ <span class=\"text-primary\"><i>Yes Explain</i></span> ", Value = true }, ena.btc_language, "display: grid;grid-template-columns:90px auto;");

                prt_btc_language_note.Text = ena.btc_language_note;

                prt_btc_cognitive.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\"><i>No</i></span>", Value = false }, new Option { Text = "Có, Giải thích/ <span class=\"text-primary\"><i>Yes Explain</i></span> ", Value = true }, ena.btc_cognitive, "display: grid;grid-template-columns:90px auto;");
                prt_btc_cognitive_note.Text = ena.btc_cognitive_note;

                prt_btc_sensory.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\"><i>No</i></span>", Value = false }, new Option { Text = "Có, Giải thích/ <span class=\"text-primary\"><i>Yes Explain</i></span> ", Value = true }, ena.btc_sensory, "display: grid;grid-template-columns:90px auto;");
                prt_btc_sensory_note.Text = ena.btc_sensory_note;

                prt_btc_religious.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\"><i>No</i></span>", Value = false }, new Option { Text = "Có, Giải thích/ <span class=\"text-primary\"><i>Yes Explain</i></span> ", Value = true }, ena.btc_religious, "display: grid;grid-template-columns:90px auto;");

                prt_btc_religious_note.Text = ena.btc_religious_note;

                prt_btc_cultural.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\"><i>No</i></span>", Value = false }, new Option { Text = "Có, Giải thích/ <span class=\"text-primary\"><i>Yes Explain</i></span> ", Value = true }, ena.btc_cultural, "display: grid;grid-template-columns:90px auto;");
                prt_btc_cultural_note.Text = ena.btc_cultural_note;

                prt_room_number.Text = ena.room_number;
                prt_time_of_assess.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.time_of_assessment, "dd/MM/yyyy HH:mm"), "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

                //prt_general_appearance.Text = WebHelpers.CreateOptions(Ena.GENERAL_APPEARANCE_CODE, ena.general_appearance, "");

                DataTable general_appearance = WebHelpers.GetJSONToDataTable(ena.general_appearance);
                if (general_appearance != null)
                {
                    foreach (DataRow row in general_appearance.Rows)
                    {
                        string code = Convert.ToString(row["cde"]);
                        Control control = FindControl("prt_general_appearance_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                prt_eye.Text = WebHelpers.FormatString(ena.eye, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_voice.Text = WebHelpers.FormatString(ena.voice, "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_motion.Text = WebHelpers.FormatString(ena.motion, "&nbsp;&nbsp;&nbsp;&nbsp;");

                prt_alert.Text = WebHelpers.GetCheckedIcon(ena.alert);
                prt_coma.Text = WebHelpers.GetCheckedIcon(ena.coma);
                prt_other.Text = WebHelpers.GetCheckedIcon(ena.others) + " Khác/ <span class=\"text-primary\"><i>Others</i></span>: " + ena.str_others;

                prt_rhythm_regular.Text = WebHelpers.GetCheckedIcon(ena.rhythm_regular);
                prt_rhythm_inregular.Text = WebHelpers.GetCheckedIcon(ena.rhythm_inregular);
                //updated 01/12/21 (by Ken)
                prt_rhythm_cardiac_arrest.Text = WebHelpers.GetCheckedIcon(ena.rhythm_cardiac_arrest);
                prt_rhythm_chest_pain.Text = WebHelpers.GetCheckedIcon(ena.rhythm_chest_pain);

                prt_rhythm_others.Text = WebHelpers.GetCheckedIcon(ena.rhythm_others) + "Khác/ <i class='text-primary'>Others</i>: " + ena.rhythm_str_others;

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

                DataTable respiratory = WebHelpers.GetJSONToDataTable(ena.respiratory);
                if (respiratory != null)
                {
                    foreach (DataRow row in respiratory.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_respiratory_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                //
                prt_noticed_time.Text = WebHelpers.FormatDateTime(ena.noticed_time, "dd/MM/yyyy HH:mm");

                prt_blood_glucose_date_time.Text = WebHelpers.FormatDateTime(ena.blood_glucose_date_time, "dd/MM/yyyy HH:mm");
                prt_blood_glucose_note.Text = ena.blood_glucose_note;
                prt_blood_glucose_signature.Text = ena.blood_glucose_signature;

                prt_ecg_date_time.Text = WebHelpers.FormatDateTime(ena.ecg_date_time, "dd/MM/yyyy HH:mm");
                prt_ecg_note.Text = ena.ecg_note;
                prt_ecg_signature.Text = ena.ecg_signature;

                prt_urine_cath_date_time.Text = WebHelpers.FormatDateTime(ena.urine_cath_date_time, "dd/MM/yyyy HH:mm");
                prt_urine_cath_note.Text = ena.urine_cath_note;
                prt_urine_cath_signature.Text = ena.urine_cath_signature;

                prt_splint_cast_dressing_date_time.Text = WebHelpers.FormatDateTime(ena.splint_cast_dressing_date_time, "dd/MM/yyyy HH:mm");
                prt_splint_cast_dressing_note.Text = ena.splint_cast_dressing_note;
                prt_splint_cast_dressing_signature.Text = ena.splint_cast_dressing_signature;

                prt_procedure_other_date_time.Text = WebHelpers.FormatDateTime(ena.procedure_other_date_time, "dd/MM/yyyy HH:mm");
                prt_procedure_other_note.Text = ena.procedure_other_note;
                prt_procedure_other_signature.Text = ena.procedure_other_signature;

                DataTable assessment_system = WebHelpers.GetJSONToDataTable(ena.assessment_system);

                if (assessment_system != null)
                {
                    foreach (DataRow row in assessment_system.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;
                        HtmlGenericControl p;
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["time"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["rrlp"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["o2sat"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["hr"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["bp"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["temp"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["gcs"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["pain"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["ats"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["intervention"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["initial"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);

                        prt_assessment_system.Rows.Add(tr);
                    }
                }

                DataTable direct_medication = WebHelpers.GetJSONToDataTable(ena.direct_medication);

                if (direct_medication != null)
                {
                    foreach (DataRow row in direct_medication.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;
                        HtmlGenericControl p;
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_time"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 40px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_medication"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 175px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_dose"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 70px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_route"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 70px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_rate"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 50px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_doctor"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 97.213px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_comment"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 75px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_time2"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 40px");
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dir_med_initial"]) };
                        td.Controls.Add(p);
                        td.Attributes.Add("style", "width: 80px");
                        tr.Cells.Add(td);

                        prt_direct_medication.Rows.Add(tr);
                    }
                }

                //
                prt_discharge_by.Text = ena.discharge_by;
                prt_discharge_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.discharge_date_time), "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                //prt_discharge_option.Text = WebHelpers.CreateOptions(Ena.DISCHARGE_OPTION_CODE, WebHelpers.GetJSONToDataTable(ena.discharge_option), "");

                DataTable discharge_option = WebHelpers.GetJSONToDataTable(ena.discharge_option);
                if (discharge_option != null)
                {
                    foreach (DataRow row in discharge_option.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_discharge_option_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                prt_admited_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ena.admited_date_time), "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_admited_by.Text = ena.admited_by;
                prt_receiving_unit.Text = "Khoa tiếp nhận/ <span class=\"text-primary\">Receiving Unit</span>: " + ena.receiving_unit;
                prt_transfer_to.Text = $"<b>Chuyển viện</b>/ <span class=\"text-primary\">Transfer to</span>: {ena.transfer_to}";
                prt_transfer_by.Text = $"bởi BS/ <span class=\"text-primary\">by Dr.</span> {ena.transfer_by}";

                DataTable nursing_note = WebHelpers.GetJSONToDataTable(ena.nursing_note);

                if (nursing_note != null)
                {
                    foreach (DataRow row in nursing_note.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;
                        HtmlGenericControl p;
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = WebHelpers.FormatDateTime(Convert.ToString(row["date_time"]), "dd/MM/yyyy") };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = WebHelpers.FormatDateTime(Convert.ToString(row["date_time"]), "HH:mm") };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["patient_condition"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        try
                        {
                            p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["nursing_intervention"]) };
                        } catch(Exception ex) 
                        {
                            p = new HtmlGenericControl("lable") { InnerHtml = "" };
                            Console.WriteLine(ex.Message); 
                        }
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["signature_name"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);

                        prt_nursing_note.Rows.Add(tr);
                    }
                }

                WebHelpers.AddJS(Page, "btnPrint_Click()");
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
                ena = new Ena(varDocID, loc);
                ena.status = DocumentStatus.FINAL;

                UpdateData(ena);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ena = new Ena(varDocID, loc);
                ena.status = DocumentStatus.DRAFT;

                UpdateData(ena);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Ena.Delete((string)Session["UserID"], varDocID, loc)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);

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
            if (WebHelpers.CanOpenForm(Page, (string)varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Ena ena = new Ena(varDocID, loc);

                txt_amend_reason.Text = "";
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, ena, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(ena);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
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
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
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

        public string FormatDateTime(object value, string format)
        {
            return WebHelpers.FormatDateTime(value, format);
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

            try
            {
                Ena ena;
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    ena = new Ena(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    ena = new Ena(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Ena.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);

                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.setBmi(bmiStr, ena.vs_bmi);

                imageTemp.Src = JObject.Parse(ena.skin_anno_data).dataURI;

                ena.skin_anno_data = WebHelpers.getImageDefault(ena.skin_anno_data);

                //prt_barcode.Text = Patient.Instance().visible_patient_id;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                //prt_barcode.Text = Patient.Instance().visible_patient_id;

                if (ena.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(ena, WebHelpers.LoadFormControl(form1, ena, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    lblPid.Text = varVPID;
                }
                else if (ena.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(ena, WebHelpers.LoadFormControl(form1, ena, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, ena.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = ena.status,
                    AccessGroup = (string)Session["group_access"],
                    AccessAuthorize = (string)Session["access_authorize"],
                    IsSameCompanyCode = loc == locChanged,
                    IsViewLog = varDocIdLog != null
                });
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

        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        public string GetDocIdLink(string args)
        {
            return PAGE_URL;
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected DateTime? GetDateTime(object value)
        {
            DateTime? dateTime = null;
            DateTime result = WebHelpers.ConvertDateTime(value, out bool isValid, out string datetime);
            if (isValid)
            {
                dateTime = result;
            }
            return dateTime;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/ER/EmerTriaAndNurAssRec.aspx?modelId={Request.QueryString["modelId"]}&docId={varDocID}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";

                if (doc_log_id != varDocID)
                {
                    url += $"&docIdLog={doc_log_id}";
                    Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;
                }

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
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
                if (ena.arrival_mode_code != null)
                {
                    if (ena.arrival_mode_code == "OTH")
                    {
                        ena.arrival_mode_note = txt_arrival_mode_note.Value;
                    }

                    ena.arrival_mode_desc = Ena.ARRIVAL_MODE_CODE[ena.arrival_mode_code];
                }

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
                ena.vs_bmi = txt_vs_bmi.Value;

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
                //updated 26/11/21
                ena.room_number = txt_room_number.Value;
                ena.time_of_assessment = DataHelpers.ConvertSQLDateTime(dtpk_time_of_assessment.SelectedDate);

                ena.general_appearance = WebHelpers.GetCheckBox(form1, "cb_general_appearance_", Ena.GENERAL_APPEARANCE_CODE, "cde");

                ena.eye = txt_eye.Value;
                ena.voice = txt_voice.Value;
                ena.motion = txt_motion.Value;

                ena.alert = cb_alert_true.Checked;
                ena.coma = cb_coma_true.Checked;
                ena.others = cb_others_true.Checked;
                ena.str_others = txt_str_others.Value;

                WebHelpers.GetCheckBox(form1, "cb_respiratory_", Ena.RESPIRATORY_CODE, out DataTable dtb_respiratory);

                if (cb_respiratory_oth.Checked)
                {
                    //DataRow dtRow = dtb_respiratory.NewRow();

                    //dtRow["code"] = "OTH";
                    //dtRow["desc"] = txt_respiratory_oth.Value;
                    //dtb_respiratory.Rows.Add(dtRow);

                    //updated 22/12/21 by Ken
                    try
                    {
                        foreach (DataRow dtRow in dtb_respiratory.Rows)
                        {
                            if (Convert.ToString(dtRow["code"]) == "OTH")
                            {
                                dtRow["desc"] = txt_respiratory_oth.Value;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }

                }

                ena.respiratory = JsonConvert.SerializeObject(dtb_respiratory);

                ena.rhythm_regular = cb_rhythm_regular_true.Checked;
                ena.rhythm_inregular = cb_rhythm_inregular_true.Checked;
                //updated 01/12/21
                ena.rhythm_cardiac_arrest = cb_rhythm_cardiac_arrest_true.Checked;
                ena.rhythm_chest_pain = cb_rhythm_chest_pain_true.Checked;
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
                ena.blood_glucose_signature = txt_blood_glucose_signature.Value;

                ena.ecg_date_time = DataHelpers.ConvertSQLDateTime(dtpk_ecg_date_time.SelectedDate);
                ena.ecg_note = txt_ecg_note.Value;
                ena.ecg_signature = txt_ecg_signature.Value;

                ena.urine_cath_date_time = DataHelpers.ConvertSQLDateTime(dtpk_urine_cath_date_time.SelectedDate);
                ena.urine_cath_note = txt_urine_cath_note.Value;
                ena.urine_cath_signature = txt_urine_cath_signature.Value;

                ena.splint_cast_dressing_date_time = DataHelpers.ConvertSQLDateTime(dtpk_splint_cast_dressing_date_time.SelectedDate);
                ena.splint_cast_dressing_note = txt_splint_cast_dressing_note.Value;
                ena.splint_cast_dressing_signature = txt_splint_cast_dressing_signature.Value;

                ena.procedure_other_date_time = DataHelpers.ConvertSQLDateTime(dtpk_procedure_other_date_time.SelectedDate);
                ena.procedure_other_note = txt_procedure_other_note.Value;
                ena.procedure_other_signature = txt_procedure_other_signature.Value;

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

                ena.skin_anno_data = "{\"dataURI\":\"" + skin_anno_data_base64.Value + "\"}";

                if (JsonConvert.SerializeObject(ena) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                ena.amend_reason = txt_amend_reason.Text;
                ena.user_name = (string)Session["UserID"];

                dynamic result = ena.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        //protected void prt_direct_medication_RowCreated(object sender, GridViewRowEventArgs e)
        //{
        //    if(e.Row.RowType == DataControlRowType.Header)
        //    {
        //        GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

        //        TableCell HeaderCell2 = new TableCell();

        //        HeaderCell2.Text = "Giờ/ Time";

        //        HeaderCell2.RowSpan = 2;

        //        HeaderRow.Cells.Add(HeaderCell2);



        //        HeaderCell2 = new TableCell();

        //        HeaderCell2.Text = "Y lệnh thuốc & dịch truyền trực tiếp/ Direct Medication & IV fluids Order";

        //        HeaderCell2.ColumnSpan = 4;

        //        HeaderRow.Cells.Add(HeaderCell2);



        //        HeaderCell2 = new TableCell();

        //        HeaderCell2.Text = "BÁC SĨ/ DOCTOR";

        //        HeaderCell2.RowSpan = 2;

        //        HeaderRow.Cells.Add(HeaderCell2);


        //        HeaderCell2 = new TableCell();

        //        HeaderCell2.Text = "GHI CHÚ/ COMMENT";

        //        HeaderCell2.RowSpan = 2;

        //        HeaderRow.Cells.Add(HeaderCell2);



        //        HeaderCell2 = new TableCell();

        //        HeaderCell2.Text = "Giờ/ Time";

        //        HeaderCell2.RowSpan = 2;

        //        HeaderRow.Cells.Add(HeaderCell2);


        //        HeaderCell2 = new TableCell();

        //        HeaderCell2.Text = "Chữ kí/ Tên & MSNV Signature/ Name & ID";

        //        HeaderCell2.RowSpan = 2;

        //        HeaderRow.Cells.Add(HeaderCell2);


        //        //prt_direct_medication.Controls[0].Controls.AddAt(0, HeaderRow);

        //        GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);


        //        TableCell HeaderCell = new TableCell();

        //        HeaderCell.Text = "Thuốc/ Medication Dịch truyền/ IV FLUIDS";

        //        HeaderRow1.Cells.Add(HeaderCell);



        //        HeaderCell = new TableCell();

        //        HeaderCell.Text = "LIỀU/ DOSE";

        //        HeaderRow1.Cells.Add(HeaderCell);



        //        HeaderCell = new TableCell();

        //        HeaderCell.Text = "ĐƯỜNG DÙNG/ ROUTE";

        //        HeaderRow1.Cells.Add(HeaderCell);


        //        HeaderCell = new TableCell();

        //        HeaderCell.Text = "TỐC ĐỘ/ RATE";

        //        HeaderRow1.Cells.Add(HeaderCell);

        //        //prt_direct_medication.Controls[0].Controls.AddAt(1, HeaderRow1);
        //    }
        //}
        //protected void prt_nursing_note_RowCreated(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.Header)
        //    {
        //        GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

        //        TableCell HeaderCell2 = new TableCell();

        //        HeaderCell2.Text = "PHIẾU GHI CHÚ ĐIỀU DƯỠNG <br/> <span class='text-primary text-center'> NURSING NOTES</span>";
        //        HeaderCell2.CssClass = "p-2 text-center";
        //        HeaderCell2.ColumnSpan = 5;

        //        HeaderRow.Cells.Add(HeaderCell2);

        //        //prt_nursing_note.Controls[0].Controls.AddAt(0, HeaderRow);

        //        GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);


        //        TableCell HeaderCell = new TableCell();

        //        HeaderCell.Text = "NGÀY <br> <span class='text-primary text-center'>DATE</span>  <br/> dd/mm/yyyy";
        //        HeaderCell.Width = 50;
        //        HeaderCell.CssClass = "p-2 text-center";
        //        HeaderRow1.Cells.Add(HeaderCell);

        //        HeaderCell = new TableCell();

        //        HeaderCell.Text = "GIỜ PHÚT <br/> <span class='text-primary text-center'>TIME </span> <br/> hh:mm";
        //        HeaderCell.Width = 40;
        //        HeaderCell.CssClass = "p-2 text-center";
        //        HeaderRow1.Cells.Add(HeaderCell);

        //        HeaderCell = new TableCell();

        //        HeaderCell.Text = "THEO DÕI DIỄN TIẾN <br/> <span class='text-primary text-center'> PATIENT CONDITION </span>";
        //        HeaderCell.Width = 100;
        //        HeaderCell.CssClass = "p-2 text-center";
        //        HeaderRow1.Cells.Add(HeaderCell);


        //        HeaderCell = new TableCell();

        //        HeaderCell.Text = "CAN THIỆP ĐIỀU DƯỠNG <br/> <span class='text-primary text-center'>NURSING INTERVENTION</span>";
        //        HeaderCell.CssClass = "p-2 text-center";
        //        HeaderRow1.Cells.Add(HeaderCell);

        //        HeaderCell = new TableCell();
        //        HeaderCell.CssClass = "p-2 text-center";
        //        HeaderCell.Text = "KÝ/GHI TÊN ĐD <br/> <span class='text-primary text-center'>RN'S NAME & SIGNATURE</span>";

        //        HeaderRow1.Cells.Add(HeaderCell);

        //        prt_nursing_note.Controls[0].Controls.AddAt(1, HeaderRow1);

        //    }
        //}
        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ena = new Ena(varDocID, loc);
            BindingDataFormPrint(ena);
        }
    }
}
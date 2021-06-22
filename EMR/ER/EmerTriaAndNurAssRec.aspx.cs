using System;
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

namespace EMR
{
    public partial class EmergencyTriageAndNursingAssessmentRecord : System.Web.UI.Page
    {
        #region Variables
        Ena ena;
        MemoryStream ms;
        #endregion
        
        #region Page Lifecycle
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);
            if (!IsPostBack)
            {
                Initial();
            }
        }
        #endregion

        #region Binding Data
        private void BindingDataFormEdit(Ena ena)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "localStorage_setItem", $"window.sessionStorage.setItem('{ena}', '{JsonConvert.SerializeObject(ena)}');", true);

            //Triage Date Time
            WebHelpers.BindDateTimePicker(dtpk_triage_time, ena.triage_time);

            //Triage Area #
            txt_triage_area.Value = ena.triage_area;

            //Chief complaint
            txt_chief_complaint.Value = ena.chief_complaint;

            //
            
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
            vs_bmi.Text = ena.vs_bmi;
            txt_vs_spo2.Value = ena.vs_spo2;
            txt_vs_head_circum.Value = ena.vs_head_circum;

            //
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_loc_avpu_", ena.loc_avpu, "cde");
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
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_skin_integrity_", ena.skin_integrity, "cde");
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_com_dis_src_", ena.com_dis_src, "cde");
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_discharge_plan_", ena.discharge_plan, "cde");

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

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_general_appearance_", ena.general_appearance, "cde");
            
            txt_eye.Value = ena.eye;
            txt_voice.Value = ena.voice;
            txt_motion.Value = ena.motion;

            //

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(),"cb_alert_" + ena.alert);

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(),"cb_coma_" + ena.coma);
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_others_" + ena.others);

            txt_str_others.Value = ena.str_others;

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(),"cb_respiratory_", ena.respiratory);

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(),"cb_rhythm_regular_" + ena.rhythm_regular);
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(),"cb_rhythm_inregular_" + ena.rhythm_inregular);
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_rhythm_others_" + ena.rhythm_others);

            txt_rhythm_str_others.Value = ena.rhythm_str_others;

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(),"cb_psychosocial_" + ena.psychosocial);
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_psychosocial_others_" + ena.psychosocial_others);
            txt_psychosocial_str_others.Value = ena.psychosocial_str_others;

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_psychosocial_" + ena.psychosocial);

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(),"cb_other_systems_normal_" + ena.other_systems_normal);
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

            ViewState[grid_AssessmentSystem.ID] = WebHelpers.DataBind(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system));

            ViewState[gridDirectMedication.ID] = WebHelpers.DataBind(gridDirectMedication, WebHelpers.GetJSONToDataTable(ena.direct_medication));

            //Discharged

            WebHelpers.BindDateTimePicker(dtpk_discharge_date_time, ena.discharge_date_time);

            txt_discharge_by.Value = ena.discharge_by;

            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_discharge_option_", ena.discharge_option);

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
            ViewState[grid_NursingNotes.ID] = WebHelpers.DataBind(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note));
        }
        private void BindingDataFormView(Ena ena)
        {
            lbl_triage_time.Text = WebHelpers.FormatDateTime(ena.triage_time, "dd-MM-yyyy HH:mm");
            lbl_triage_area.Text = WebHelpers.GetValue(ena.triage_area);
            lbl_chief_complaint.Text = WebHelpers.GetValue(ena.chief_complaint);
            lbl_triage_desc.Text = WebHelpers.GetValue(ena.triage_desc);
            lbl_arrival_mode_desc.Text = WebHelpers.GetValue(ena.arrival_mode_desc);
            lbl_past_medical_history.Text = WebHelpers.GetValue(ena.past_medical_history);
            lbl_narrative.Text = WebHelpers.GetValue(ena.narrative);

            lbl_vs_temperature.Text = WebHelpers.GetValue(ena.vs_temperature);
            lbl_vs_weight.Text = WebHelpers.GetValue(ena.vs_weight);
            lbl_vs_height.Text = WebHelpers.GetValue(ena.vs_height);
            vs_bmi.Text = WebHelpers.GetValue(ena.vs_bmi);
            lbl_vs_heart_rate.Text = WebHelpers.GetValue(ena.vs_heart_rate);
            lbl_vs_respiratory_rate.Text = WebHelpers.GetValue(ena.vs_respiratory_rate);
            lbl_vs_blood_pressure.Text = WebHelpers.GetValue(ena.vs_blood_pressure);
            lbl_vs_spo2.Text = WebHelpers.GetValue(ena.vs_spo2);
            lbl_vs_head_circum.Text = WebHelpers.GetValue(ena.vs_head_circum);

            lbl_loc_avpu.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ena.loc_avpu));
            //Pain assess
            lbl_pain_score.Text = WebHelpers.GetValue(ena.pain_score);
            lbl_pain_onset.Text = WebHelpers.GetValue(ena.pain_onset);
            lbl_pain_location.Text = WebHelpers.GetValue(ena.pain_location);
            lbl_pain_duration.Text = WebHelpers.GetValue(ena.pain_duration);
            lbl_pain_radiation.Text = WebHelpers.GetValue(ena.pain_radiation);
            lbl_allergy.Text = WebHelpers.GetValue(ena.allergy);
            lbl_current_medication.Text = WebHelpers.GetValue(ena.current_medication);
            lbl_skin_integrity.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ena.skin_integrity));
            lbl_com_dis_src.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ena.com_dis_src));
            lbl_discharge_plan.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ena.discharge_plan));
            lbl_dis_after_discharge_code.Text = WebHelpers.GetValue(ena.dis_after_discharge_desc);
            lbl_caregiver_after_discharge.Text = WebHelpers.GetValue(ena.caregiver_after_discharge);
            lbl_btc_language.Text = WebHelpers.GetValue(WebHelpers.GetBool(ena.btc_language, $"Có, Giải thích/Yes Explain {WebHelpers.GetValue(ena.btc_language_note)}"));
            lbl_btc_cognitive.Text = WebHelpers.GetValue(WebHelpers.GetBool(ena.btc_cognitive, $"Có, Giải thích/Yes Explain {WebHelpers.GetValue(ena.btc_cognitive_note)}"));
            lbl_btc_sensory.Text = WebHelpers.GetValue(WebHelpers.GetBool(ena.btc_sensory, $"Có, Giải thích/Yes Explain {WebHelpers.GetValue(ena.btc_sensory_note)}"));
            lbl_btc_religious.Text = WebHelpers.GetValue(WebHelpers.GetBool(ena.btc_religious, $"Có, Giải thích/Yes Explain {WebHelpers.GetValue(ena.btc_religious_note)}"));
            lbl_btc_cultural.Text = WebHelpers.GetValue(WebHelpers.GetBool(ena.btc_cultural, $"Có, Giải thích/Yes Explain {WebHelpers.GetValue(ena.btc_cultural_note)}"));

            lbl_general_appearance.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ena.general_appearance));
            lbl_eye.Text = WebHelpers.GetValue(ena.eye);
            lbl_voice.Text = WebHelpers.GetValue(ena.voice);
            lbl_motion.Text = WebHelpers.GetValue(ena.motion);

            cb_alert_true.Checked = ena.alert;
            cb_coma_true.Checked = ena.coma;
            cb_others_true.Checked = ena.others;
            lbl_str_others.Text = WebHelpers.GetValue(ena.str_others);

            //Cardiovascular
            cb_rhythm_regular_true.Checked = ena.rhythm_regular;
            cb_rhythm_inregular_true.Checked = ena.rhythm_inregular;
            cb_rhythm_others_true.Checked = ena.rhythm_others;
            lbl_rhythm_str_others.Text = ena.rhythm_str_others;
            //Psychosocial
            cb_psychosocial_true.Checked = ena.psychosocial;
            cb_psychosocial_others_true.Checked = ena.psychosocial_others;
            if (cb_psychosocial_others_true.Checked) { lbl_psychosocial_str_others.Text = WebHelpers.GetValue(ena.psychosocial_str_others); }
            //Other systems
            cb_other_systems_normal_true.Checked = ena.other_systems_normal;
            cb_other_systems_abnormal_true.Checked = ena.other_systems_abnormal;
            if(cb_other_systems_abnormal_true.Checked) { lbl_others_systems_str.Text = ena.others_systems_str; }
            //Sản-phụ
            lbl_respiratory.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ena.respiratory));
            lbl_lmp.Text = WebHelpers.GetValue(ena.lmP_note);
            lbl_para.Text = WebHelpers.GetValue(ena.para);
            lbl_abortions.Text = WebHelpers.GetValue(ena.abortions);
            //Intervention Procedure
            lbl_blood_glucose_date_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.blood_glucose_date_time));
            lbl_blood_glucose_note.Text = WebHelpers.GetValue(ena.blood_glucose_note);
            
            lbl_ecg_date_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.ecg_date_time));
            lbl_ecg_note.Text = WebHelpers.GetValue(ena.ecg_note);
            
            lbl_urine_cath_date_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.urine_cath_date_time));
            lbl_urine_cath_note.Text = WebHelpers.GetValue(ena.urine_cath_note);
            
            lbl_splint_cast_dressing_date_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.splint_cast_dressing_date_time));
            lbl_splint_cast_dressing_note.Text = WebHelpers.GetValue(ena.splint_cast_dressing_note);
            
            lbl_procedure_other_date_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.procedure_other_date_time));
            lbl_procedure_other_note.Text = WebHelpers.GetValue(ena.procedure_other_note);

            //
            
            //DataBind(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system));
            
            ViewState[grid_AssessmentSystem.ID] = WebHelpers.DataBind(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system));
            WebHelpers.DisabledGridView(grid_AssessmentSystem, true);
            //grid_AssessmentSystem.Columns[grid_AssessmentSystem.Columns.Count - 1].Visible = false;

            //Direct Medication & IV fluids Order
            ViewState[gridDirectMedication.ID] = WebHelpers.DataBind(gridDirectMedication, WebHelpers.GetJSONToDataTable(ena.direct_medication));
            WebHelpers.DisabledGridView(gridDirectMedication, true);
            //gridDirectMedication.Columns[gridDirectMedication.Columns.Count - 1].Visible = false;

            //Discharged
            lbl_discharge_date_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.discharge_date_time));
            lbl_discharge_by.Text = WebHelpers.GetValue(ena.discharge_by);
            lbl_discharge_option.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ena.discharge_option));
            
            lbl_admited_date_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.admited_date_time));
            lbl_admited_by.Text = WebHelpers.GetValue(ena.admited_by);
            lbl_receiving_unit.Text = WebHelpers.GetValue(ena.receiving_unit);

            lbl_transfer_to.Text = WebHelpers.GetValue(ena.transfer_to);
            lbl_transfer_by.Text = WebHelpers.GetValue(ena.transfer_by);
            lbl_noticed_time.Text = WebHelpers.GetValue(WebHelpers.FormatDateTime(ena.noticed_time));

            //PHIẾU GHI CHÚ ĐIỀU DƯỠNG / NURSING NOTES
            ViewState[grid_NursingNotes.ID] = WebHelpers.DataBind(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note));
            WebHelpers.DisabledGridView(grid_NursingNotes, true);
            //grid_NursingNotes.Columns[grid_NursingNotes.Columns.Count - 1].Visible = false;
        }
        private void BindingDataFormPrint(Ena ena)
        {
            Patient patient = Patient.Instance();
            prt_pid.Text = prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;

            prt_fullname.Text = patient.GetFullName();

            //prt_diagnosis.Text = uusr.diagnosis;
            //prt_left_kidney.Text = uusr.left_kidney;
            //prt_right_kidney.Text = uusr.right_kidney;
            //prt_urinary_bladder.Text = uusr.urinary_bladder;
            //prt_prostate.Text = uusr.prostate;
            //prt_post_void_resi_volume.Text = uusr.post_void_resi_volume;
            //prt_conclusion.Text = uusr.conclusion;
            //prt_recommendation.Text = uusr.recommendation;

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
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ena = new Ena(DataHelpers.varDocId);
                ena.status = DocumentStatus.DRAFT;
                ena.user_name = (string)Session["UserID"];

                UpdateData(ena);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Uusr.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
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
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            ena = new Ena(Request.QueryString["docId"]);
            txt_amend_reason.Text = "";
            WebHelpers.VisibleControl(false, btnAmend, btnPrint);
            WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper, btn_grid_AssessmentSystem_add, btn_gridDirectMedication_add, btn_grid_NursingNotes_add, cb_alert_true, cb_coma_true, cb_others_true, cb_rhythm_regular_true, cb_rhythm_inregular_true, cb_rhythm_others_true, cb_psychosocial_true, cb_psychosocial_others_true, cb_other_systems_normal_true, cb_other_systems_abnormal_true);
            

            WebHelpers.LoadFormControl(form1, ena, ControlState.Edit);

            BindingDataFormEdit(ena);
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
        #endregion
        private void UploadFile(string base64String)
        {
            //Clear changes and remove uploaded image from Cache
            RadImageEditor1.ResetChanges();

            byte[] bytes = Convert.FromBase64String(base64String);

            ms = new MemoryStream(bytes);

            ViewState[RadImageEditor1.ID] = ms;

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
            using (MemoryStream ms = new MemoryStream())
            {
                args.Image.Image.Save(ms, args.Image.Image.RawFormat);
                
                ViewState[RadImageEditor1.ID] = ms;
            }
        }

        #region Methods
        private void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            ena = new Ena(Request.QueryString["docId"]);

            prt_barcode.Text = Patient.Instance().visible_patient_id;
            WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
            
            if (ena.status == DocumentStatus.FINAL)
            {
                BindingDataFormView(ena);

                WebHelpers.VisibleControl(false, btnComplete, btnSave, btnDeleteModal, btn_grid_NursingNotes_add, btn_gridDirectMedication_add, btn_grid_AssessmentSystem_add, cb_alert_true, cb_coma_true, cb_others_true, cb_rhythm_regular_true, cb_rhythm_inregular_true, cb_rhythm_others_true, cb_psychosocial_true, cb_psychosocial_others_true, cb_other_systems_normal_true, cb_other_systems_abnormal_true);

                WebHelpers.VisibleControl(true, btnAmend, btnPrint);
                WebHelpers.LoadFormControl(form1, ena, ControlState.View);
            }
            else if (ena.status == DocumentStatus.DRAFT)
            {
                BindingDataFormEdit(ena);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnSave, btnDeleteModal);
                WebHelpers.LoadFormControl(form1, ena, ControlState.Edit);
            }
        }
        private void UpdateData(Ena ena)
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
            ena.vs_bmi = vs_bmi.Text;
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

            dynamic result = ena.Update()[0];

            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);
                Initial();
            }
            else
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg_error", "alert(\"" + result.Message + "\");", true);

                Session["PageNotFound"] = result;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        #endregion
    }
}
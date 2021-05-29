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
        Ena ena;
        MemoryStream ms;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initial();
            }
        }

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

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];
            
            ena = new Ena(DataHelpers.varDocId);

            loadDataToControls(ena);

            dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(ena.skin_anno_data);
            string test = jsonObject.dataURI;
            test = test.Replace("data:image/png;base64,", "");

            UploadFile(test);
        }

        public void loadDataToControls(Ena ena)
        {
            //Triage Date Time
            if (ena.triage_time != null)
            { dtpk_triage_time.SelectedDate = DateTime.Parse(ena.triage_time); }

            //Triage Area #
            txt_triage_area.Value = ena.triage_area;

            //Chief complaint
            txt_chief_complaint.Value = ena.chief_complaint;

            //
            if (ena.triage_code != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_triage_code_" + ena.triage_code)).Checked = true;
            }

            #region Mode of arrival
            if(ena.arrival_mode_code != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_arrival_mode_code_" + ena.arrival_mode_code)).Checked = true;
            }
            #endregion

            ////Past Medical History
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
            txt_vs_bmi.Value = ena.vs_bmi;
            txt_vs_spo2.Value = ena.vs_spo2;
            txt_vs_head_circum.Value = ena.vs_head_circum;

            //
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.loc_avpu).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_loc_avpu_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }

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
            #region skin integrity

            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.skin_integrity).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_skin_integrity_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }

            #endregion

            #region Communicable disease screening 

            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.com_dis_src).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_com_dis_src_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }

            #endregion

            #region discharge plainning

            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.discharge_plan).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_discharge_plan_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }

            #endregion

            #region Disposition after discharge

            try
            {
                ((HtmlInputRadioButton)FindControl("rad_dis_after_discharge_code_" + ena.dis_after_discharge_code.ToLower())).Checked = true;
            }
            catch { }

            txt_caregiver_after_discharge.Value = ena.caregiver_after_discharge;

            #endregion

            #region Language Barriers:

            txt_btc_language_note.Value = ena.btc_language_note;
            if(ena.btc_language != null)
            {
                rad_btc_language2.Checked = bool.Parse(ena.btc_language);
            }

            #endregion

            #region Cognitive Barriers

            txt_btc_cognitive_note.Value = ena.btc_cognitive_note;
            if (ena.btc_cognitive != null)
            {
                rad_btc_cognitive2.Checked = bool.Parse(ena.btc_cognitive);
            }

            #endregion

            #region Sensory Barriers

            txt_btc_sensory_note.Value = ena.btc_sensory_note;
            if (ena.btc_sensory != null)
            {
                rad_btc_sensory2.Checked = bool.Parse(ena.btc_sensory);
            }

            #endregion

            #region Religious Barriers

            txt_btc_religious_note.Value = ena.btc_religious_note;
            if (ena.btc_religious != null)
            {
                rad_btc_religious2.Checked = bool.Parse(ena.btc_religious);
            }

            #endregion

            #region Cultural Barriers

            txt_btc_cultural_note.Value = ena.btc_cultural_note;
            if (ena.btc_cultural != null)
            {
                rad_btc_cultural2.Checked = bool.Parse(ena.btc_cultural);
            }

            #endregion

            #region General appearance
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.general_appearance).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_general_appearance_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }
            #endregion

            #region neuro
            txt_eye.Value = ena.eye;
            txt_voice.Value = ena.voice;
            txt_motion.Value = ena.motion;
            #endregion
            
            //
            if(ena.alert != null)
                cb_alert.Checked = bool.Parse(ena.alert);
            if(ena.coma != null)
                cb_coma.Checked = bool.Parse(ena.coma);
            if(ena.others != null)
                cb_others.Checked = bool.Parse(ena.others);
            txt_str_others.Value = ena.str_others;

            #region respiratory

            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.respiratory).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_respiratory_" + row.Field<dynamic>("code").ToLower())).Checked = true;
            }

            //txt_respiratory_oth.Value = WebHelpers.GetJSONToDataTable(ena.respiratory)[0][1];

            #endregion

            #region rhythm

            if(ena.rhythm_regular != null)
                cb_rhythm_regular.Checked = bool.Parse(ena.rhythm_regular);
            if (ena.rhythm_inregular != null)
                cb_rhythm_inregular.Checked = bool.Parse(ena.rhythm_inregular);
            if (ena.rhythm_others != null)
                cb_rhythm_others.Checked = bool.Parse(ena.rhythm_others);
            txt_rhythm_str_others.Value = ena.rhythm_str_others;

            #endregion

            #region psychosocial
            if (ena.psychosocial != null)
                cb_psychosocial.Checked = bool.Parse(ena.psychosocial);
            if (ena.psychosocial_others != null)
                cb_psychosocial_others.Checked = bool.Parse(ena.psychosocial_others);
            txt_psychosocial_str_others.Value = ena.psychosocial_str_others;

            #endregion

            #region other systems
            if (ena.other_systems_normal != null)
                cb_other_systems_normal.Checked = bool.Parse(ena.other_systems_normal);
            if (ena.other_systems_abnormal != null)
                cb_other_systems_abnormal.Checked = bool.Parse(ena.other_systems_abnormal);
            txt_others_systems_str.Value = ena.others_systems_str;

            #endregion

            #region lmp
            if (ena.lmp != null)
                cb_lmp.Checked = bool.Parse(ena.lmp);
            txt_lmP_note.Value = ena.lmP_note;
            txt_para.Value = ena.para;
            txt_abortions.Value = ena.abortions;

            #endregion

            #region Intervention Procedure

            if (ena.blood_glucose_date_time != null)
            {
                dtpk_blood_glucose_date_time.SelectedDate = DateTime.Parse(ena.blood_glucose_date_time);
            }
            txt_blood_glucose_note.Value = ena.blood_glucose_note;

            if (ena.ecg_date_time != null)
            {
                dtpk_ecg_date_time.SelectedDate = DateTime.Parse(ena.ecg_date_time);
                
            }
            txt_ecg_note.Value = ena.ecg_note;

            if (ena.urine_cath_date_time != null)
            {
                dtpk_urine_cath_date_time.SelectedDate = DateTime.Parse(ena.urine_cath_date_time);
            }
            txt_urine_cath_note.Value = ena.urine_cath_note;

            if (ena.splint_cast_dressing_date_time != null)
            {
                dtpk_splint_cast_dressing_date_time.SelectedDate = DateTime.Parse(ena.splint_cast_dressing_date_time);
            }
            txt_splint_cast_dressing_note.Value = ena.splint_cast_dressing_note;

            if (ena.procedure_other_date_time != null)
            {
                dtpk_procedure_other_date_time.SelectedDate = DateTime.Parse(ena.procedure_other_date_time);
            }
            txt_procedure_other_note.Value = ena.procedure_other_note;

            #endregion

            //Assessment System

            _BindGridView(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system));

            _BindGridView(gridDirectMedication , WebHelpers.GetJSONToDataTable(ena.direct_medication));

            //Discharged
            if (ena.discharge_date_time != null)
            { dtpk_discharge_date_time.SelectedDate = DateTime.Parse(ena.discharge_date_time); }
            txt_discharge_by.Value = ena.discharge_by;
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.discharge_option).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_discharge_option_" + row.Field<dynamic>("code").ToLower())).Checked = true;
            }
            //foreach (KeyValuePair<string, string> code in DocumentCode.DischargeOption)
            //{

            //    try
            //    {
            //        ((HtmlInputRadioButton)FindControl("rad_triage_code_" + code.Key.ToLower())).Disabled = disabled;
            //    }
            //    catch (Exception ex) { }
            //}

            //Admited
            if (ena.admited_date_time != null)
            { dtpk_admited_date_time.SelectedDate = DateTime.Parse(ena.admited_date_time); }
            txt_admited_by.Value = ena.admited_by;
            txt_receiving_unit.Value = ena.receiving_unit;

            //Transfer to
            txt_transfer_to.Value = ena.transfer_to;
            txt_transfer_by.Value = ena.transfer_by;

            //noticed time
            if (ena.noticed_time != null)
            { dtpk_noticed_time.SelectedDate = DateTime.Parse(ena.noticed_time); }

            //Nursing notes
            
            _BindGridView(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note));

            btnCancel.Visible = false;
            txt_amendReason.Visible = false;
            if (ena.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                btnCancel.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);
            }
            else if (ena.status == DocumentStatus.DRAFT)
            {

                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }

        }

        protected void DisabledControl(bool disabled)
        {
            WebHelpers.DisabledDateTimePicker(dtpk_triage_time, disabled);
            
            txt_triage_area.Disabled = disabled;
            txt_chief_complaint.Disabled = disabled;

            foreach (KeyValuePair<string, string> code in DocumentCode.TriageCode)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_triage_code_" + code.Key.ToLower())).Disabled = disabled;
                } catch (Exception ex) { }
            }

            foreach (KeyValuePair<string, string> code in DocumentCode.ArrivalMode)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_arrival_mode_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            txt_past_medical_history.Disabled = disabled;
            txt_narrative.Disabled = disabled;

            txt_vs_temperature.Disabled = disabled;
            txt_vs_heart_rate.Disabled = disabled;
            txt_vs_weight.Disabled = disabled;
            txt_vs_respiratory_rate.Disabled = disabled;
            txt_vs_height.Disabled = disabled;
            txt_vs_blood_pressure.Disabled = disabled;
            txt_vs_bmi.Disabled = disabled;
            txt_vs_spo2.Disabled = disabled;
            txt_vs_head_circum.Disabled = disabled;

            //
            cb_loc_avpu_a.Disabled = disabled;
            cb_loc_avpu_v.Disabled = disabled;
            cb_loc_avpu_p.Disabled = disabled;
            cb_loc_avpu_u.Disabled = disabled;

            txt_pain_onset.Disabled = disabled;
            txt_pain_location.Disabled = disabled;
            txt_pain_duration.Disabled = disabled;
            txt_pain_radiation.Disabled = disabled;
            txt_pain_score.Disabled = disabled;

            txt_allergy.Disabled = disabled;
            txt_current_medication.Disabled = disabled;

            //Skin Integrity
            
            foreach (KeyValuePair<string, string> code in DocumentCode.SkinIntegrity)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl("cb_skin_integrity_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            //Communicable disease screening
            foreach (KeyValuePair<string, string> code in DocumentCode.ComDisSrc)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl("cb_com_dis_src_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            // Discharge Planning
            foreach (KeyValuePair<string, string> code in DocumentCode.DischargePlan)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl("cb_discharge_plan_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            // Disposition after discharge
            foreach (KeyValuePair<string, string> code in DocumentCode.disAfterDischarge)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_dis_after_discharge_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            // People who will look after patient after discharge
            txt_caregiver_after_discharge.Disabled = disabled;

            //
            rad_btc_language1.Disabled = disabled;
            rad_btc_language2.Disabled = disabled;
            txt_btc_language_note.Disabled = disabled;

            //
            rad_btc_cognitive1.Disabled = disabled;
            rad_btc_cognitive2.Disabled = disabled;
            txt_btc_cognitive_note.Disabled = disabled;

            //
            rad_btc_sensory1.Disabled = disabled;
            rad_btc_sensory2.Disabled = disabled;
            txt_btc_sensory_note.Disabled = disabled;

            //
            rad_btc_religious1.Disabled = disabled;
            rad_btc_religious2.Disabled = disabled;
            txt_btc_religious_note.Disabled = disabled;

            //
            rad_btc_cultural1.Disabled = disabled;
            rad_btc_cultural2.Disabled = disabled;
            txt_btc_cultural_note.Disabled = disabled;

            //
            foreach (KeyValuePair<string, string> code in DocumentCode.GeneralAppearance)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl("cb_general_appearance_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            //
            txt_eye.Disabled = disabled;
            txt_voice.Disabled = disabled;
            txt_motion.Disabled = disabled;

            //
            cb_alert.Disabled = disabled;
            cb_coma.Disabled = disabled;
            cb_others.Disabled = disabled;
            txt_str_others.Disabled = disabled;

            //missing

            // Respiratory
            foreach (KeyValuePair<string, string> code in DocumentCode.Respiratory)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl("cb_respiratory_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            //missing

            //Rhythm
            cb_rhythm_regular.Disabled = disabled;
            cb_rhythm_inregular.Disabled = disabled;
            cb_rhythm_others.Disabled = disabled;
            txt_rhythm_str_others.Disabled = disabled;

            //Psychosocial
            cb_psychosocial.Disabled = disabled;
            cb_psychosocial_others.Disabled = disabled;
            txt_psychosocial_str_others.Disabled = disabled;

            //Other systems
            cb_other_systems_normal.Disabled = disabled;
            cb_other_systems_abnormal.Disabled = disabled;
            txt_others_systems_str.Disabled = disabled;

            //
            cb_lmp.Disabled = disabled;
            txt_lmP_note.Disabled = disabled;
            txt_para.Disabled = disabled;
            txt_abortions.Disabled = disabled;

            //Direct Medication & IV fluids Order

            WebHelpers.DisabledDateTimePicker(dtpk_blood_glucose_date_time, disabled);
            txt_blood_glucose_note.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dtpk_ecg_date_time, disabled);
            txt_ecg_note.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dtpk_urine_cath_date_time, disabled);
            txt_urine_cath_note.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dtpk_splint_cast_dressing_date_time, disabled);
            txt_splint_cast_dressing_note.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dtpk_procedure_other_date_time, disabled);
            txt_procedure_other_note.Disabled = disabled;

            //
            DisabledGridView(grid_AssessmentSystem, disabled);
            //
            DisabledGridView(gridDirectMedication, disabled);

            // Discharged
            WebHelpers.DisabledDateTimePicker(dtpk_discharge_date_time, disabled);
            txt_discharge_by.Disabled = disabled;
            foreach (KeyValuePair<string, string> code in DocumentCode.DischargeOption)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl("cb_discharge_option_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            // Admited
            WebHelpers.DisabledDateTimePicker(dtpk_admited_date_time, disabled);
            txt_admited_by.Disabled = disabled;
            txt_receiving_unit.Disabled = disabled;
            txt_transfer_to.Disabled = disabled;
            txt_transfer_by.Disabled = disabled;

            //
            WebHelpers.DisabledDateTimePicker(dtpk_noticed_time, disabled);


            // Nursing notes
            DisabledGridView(grid_NursingNotes, disabled);
        }

        protected void DisabledGridView(GridView gridView, bool disabled)
        {
            try
            {
                for (int r = 0; r < gridView.Rows.Count; r++)
                {
                    for (int i = 0; i < gridView.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (gridView.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = gridView.Rows[r].Cells[i].Controls[1] as TextField;
                                text2.Disabled = disabled;
                            }
                            else if (gridView.Rows[r].Cells[i].Controls[1] is RadTimePicker)
                            {
                                RadTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadTimePicker;
                                text2.TimePopupButton.Visible = !disabled;
                                text2.EnableTyping = !disabled;
                            }
                            else if (gridView.Rows[r].Cells[i].Controls[1] is RadDateTimePicker)
                            {
                                RadDateTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadDateTimePicker;
                                text2.DatePopupButton.Visible = !disabled;
                                text2.TimePopupButton.Visible = !disabled;
                                text2.EnableTyping = !disabled;
                            }
                        }
                        catch (Exception ex) { }
                    }
                }
                ((Button)FindControl("btn_" + gridView.ID + "_add")).Visible = !disabled;
            }
            catch (Exception ex) { }

        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            var errors = new List<string>();

            checkValidField(errors);

            if (errors.Count <= 0)
            {
                ena = new Ena(DataHelpers.varDocId);

                ena.user_name = (string)Session["UserID"];
                ena.status = DocumentStatus.FINAL;

                UpdateData(ena);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);
            }

        }

        private void RadImageEditor1_ImageEditing1(object sender, ImageEditorEditingEventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var errors = new List<string>();

            checkValidField(errors);

            if(errors.Count <= 0)
            {
                ena = new Ena(DataHelpers.varDocId);

                ena.user_name = (string)Session["UserID"];
                ena.status = DocumentStatus.DRAFT;

                UpdateData(ena);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);
            }
        }

        private void checkValidField(List<string> errors)
        {
            if (dtpk_triage_time.SelectedDate == null)
            {
                errors.Add("dtpk_triage_time");
            }
            if (String.IsNullOrWhiteSpace(txt_triage_area.Value))
            {
                errors.Add("txt_triage_area");
            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "Disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            txt_amendReason.Visible = true;

            DisabledControl(false);
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            txt_amendReason.Visible = false;

            DisabledControl(true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Ena.Delete((string)Session["UserId"], Request.QueryString["vpid"])[0] == WebHelpers.ResponseStatus.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
        }

        private void _BindGridView(GridView gridView, DataTable dataSource)
        {
            try
            {
                ViewState[gridView.ID] = dataSource;
                gridView.DataSource = (DataTable)ViewState[gridView.ID];
                gridView.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                //string servicename = ((TextBox)gridAssessmentSystem.FooterRow.FindControl("txtService")).Text;
                //string filePath = ((FileUpload)gridAssessmentSystem.FooterRow.FindControl("fuService")).FileName;
                //bOService.Service_name = servicename;
                //bOService.Service_image = "../images/service/" + filePath;
                //if (File.Exists(Server.MapPath("~/images/service/" + filePath)))
                //{
                //}
                //else
                //{
                //    ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
                //}
                //((FileUpload)gridAssessmentSystem.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
                //dALService.SetService(bOService);
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gridService_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //try
            //{
            //    gridService.EditIndex = e.NewEditIndex;
            //_BindAssessmentSystem();
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
        }

        protected void gridService_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                //string servicename = ((TextBox)gridAssessmentSystem.Rows[e.RowIndex].FindControl("txtService")).Text;
                //string filePath = ((FileUpload)gridAssessmentSystem.Rows[e.RowIndex].FindControl("fuService")).FileName;

                //_BindAssessmentSystem();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
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

        protected void gridAssessmentSystem_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Retrieve the table from the session object.
            //DataTable dt = (DataTable)ViewState["AssessmentSystem"];

            ////Update the values.
            //GridViewRow row = gridAssessmentSystem.Rows[e.RowIndex];
            //dt.Rows[row.DataItemIndex]["Id"] = ((TextBox)(row.Cells[1].Controls[0])).Text;
            //dt.Rows[row.DataItemIndex]["Description"] = ((TextBox)(row.Cells[2].Controls[0])).Text;
            //dt.Rows[row.DataItemIndex]["IsComplete"] = ((CheckBox)(row.Cells[3].Controls[0])).Checked;

            ////Reset the edit index.
            //gridAssessmentSystem.EditIndex = -1;
        }

        protected void btn_gridDirectMedication_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[gridDirectMedication.ID];

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in EMRTable.directMedication)
                    {
                        table.Columns.Add(col.Key);
                    }
                }

                for (int r = 0; r < gridDirectMedication.Rows.Count; r++)
                {
                    for (int i = 0; i < gridDirectMedication.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (gridDirectMedication.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = gridDirectMedication.Rows[r].Cells[i].Controls[1] as TextField;

                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                            else if (gridDirectMedication.Rows[r].Cells[i].Controls[1] is RadTimePicker)
                            {
                                RadTimePicker text2 = gridDirectMedication.Rows[r].Cells[i].Controls[1] as RadTimePicker;
                                table.Rows[r][text2.ID] = DateTime.Parse(text2.SelectedDate.ToString()).ToString("HH:mm");
                            }
                        }
                        catch { }
                    }
                }

                DataRow dtRow = table.NewRow();

                dtRow = table.NewRow();
                dtRow["dir_med_time"] = DateTime.Now.ToString("HH:mm");
                dtRow["dir_med_time2"] = DateTime.Now.ToString("HH:mm");
                table.Rows.Add(dtRow);

                _BindGridView(gridDirectMedication, table);
            }
            catch(Exception ex)
            {

            }
        }

        protected void gridDirectMedication_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }

        protected void btn_grid_NursingNotes_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[grid_NursingNotes.ID];

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in EMRTable.nursingNote)
                    {
                        table.Columns.Add(col.Key);
                    }
                }
                
                for (int r = 0; r < grid_NursingNotes.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_NursingNotes.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if(grid_NursingNotes.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_NursingNotes.Rows[r].Cells[i].Controls[1] as TextField;

                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                            else if(grid_NursingNotes.Rows[r].Cells[i].Controls[1] is RadDateTimePicker)
                            {
                                RadDateTimePicker text2 = grid_NursingNotes.Rows[r].Cells[i].Controls[1] as RadDateTimePicker;
                                table.Rows[r][text2.ID] = text2.SelectedDate;
                            }
                        }
                        catch { }
                    }
                }

                table.Columns["date_time"].DataType = typeof(DateTime);

                DataRow dtRow = table.NewRow();

                dtRow = table.NewRow();
                dtRow["date_time"] = DateTime.Now;
                table.Rows.Add(dtRow);

                _BindGridView(grid_NursingNotes, table);
            }
            catch (Exception ex)
            {

            }
        }

        protected void grid_NursingNotes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }

        private void DeleteGridViewRow(GridView gridView, int rowIndex)
        {
            DataTable dt = ViewState[gridView.ID] as DataTable;
            dt.Rows[rowIndex].Delete();

            _BindGridView(gridView, dt);
        }

        protected void btn_AddAssessmentSystem_Click1(object sender, EventArgs e)
        {
            
        }

        protected void grid_AssessmentSystem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }

        protected void btn_grid_AssessmentSystem_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[grid_AssessmentSystem.ID];

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in EMRTable.assessmentSystem)
                    {
                        table.Columns.Add(col.Key);
                    }
                }

                for (int r = 0; r < grid_AssessmentSystem.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_AssessmentSystem.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (grid_AssessmentSystem.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_AssessmentSystem.Rows[r].Cells[i].Controls[1] as TextField;

                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                            else if (grid_AssessmentSystem.Rows[r].Cells[i].Controls[1] is RadTimePicker)
                            {
                                RadTimePicker text2 = grid_AssessmentSystem.Rows[r].Cells[i].Controls[1] as RadTimePicker;
                                table.Rows[r][text2.ID] = DateTime.Parse(text2.SelectedDate.ToString()).ToString("HH:mm");
                            }
                        }
                        catch (Exception ex) { }
                    }
                }

                DataRow dtRow = table.NewRow();

                dtRow = table.NewRow();
                dtRow["time"] = DateTime.Now.ToString("HH:mm");
                table.Rows.Add(dtRow);

                _BindGridView(grid_AssessmentSystem, table);
            }
            catch (Exception ex)
            {

            }
        }

        protected void RadImageEditor1_ImageLoading(object sender, ImageEditorLoadingEventArgs args)
        {
            //Handle Uploaded images
           
            using (EditableImage image = new EditableImage((MemoryStream)ViewState[RadImageEditor1.ID]))
            {
                args.Image = image.Clone();
                args.Cancel = true;
            }
        }

        protected void RadImageEditor1_ImageChanged(object sender, ImageEditorEventArgs args)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                args.Image.Image.Save(ms, args.Image.Image.RawFormat);
                
                ViewState[RadImageEditor1.ID] = ms;
            }
        }

        protected void UpdateData(Ena ena)
        {
            try
            {
                
                if (dtpk_triage_time.SelectedDate != null)
                {
                    ena.triage_time = DataHelpers.ConvertSQLDateTime(dtpk_triage_time.SelectedDate);
                }

                ena.triage_area = txt_triage_area.Value;

                ena.chief_complaint = txt_chief_complaint.Value;

                foreach (KeyValuePair<string, string> code in DocumentCode.TriageCode)
                {
                    if (((HtmlInputRadioButton)FindControl("rad_triage_code_" + code.Key.ToLower())).Checked)
                    {
                        ena.triage_code = code.Key;
                        ena.triage_desc = code.Value;
                    }
                }

                foreach (KeyValuePair<string, string> code in DocumentCode.ArrivalMode)
                {
                    if (((HtmlInputRadioButton)FindControl("rad_arrival_mode_code_" + code.Key.ToLower())).Checked)
                    {
                        ena.arrival_mode_code = code.Key;
                        ena.arrival_mode_desc = code.Value;
                    }
                }
                //ena.arrival_mode_note = ?

                //
                ////Past Medical History
                ena.past_medical_history = txt_past_medical_history.Value;

                ////Narrative
                ena.narrative = txt_narrative.Value;

                ////Vital signs
                ena.vs_temperature = txt_vs_temperature.Value;
                ena.vs_heart_rate = txt_vs_heart_rate.Value;
                ena.vs_weight = txt_vs_weight.Value;
                ena.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                ena.vs_height = txt_vs_height.Value;
                ena.vs_blood_pressure = txt_vs_blood_pressure.Value;
                ena.vs_bmi = txt_vs_bmi.Value;
                ena.vs_spo2 = txt_vs_spo2.Value;
                ena.vs_head_circum = txt_vs_head_circum.Value;

                #region loc avpu
                DataTable loc_avpu = new DataTable();
                loc_avpu.Columns.Add("cde");
                loc_avpu.Columns.Add("desc");
                DataRow dataRow;

                if (cb_loc_avpu_a.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.A.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.A.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                if (cb_loc_avpu_p.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.P.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.P.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                if (cb_loc_avpu_p.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.U.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.U.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                if (cb_loc_avpu_p.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.V.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.V.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                ena.loc_avpu = WebHelpers.GetDataTableToJSON(loc_avpu);
                #endregion

                #region Pain assess
                ena.pain_onset = txt_pain_onset.Value;
                ena.pain_location = txt_pain_location.Value;
                ena.pain_duration = txt_pain_duration.Value;
                ena.pain_radiation = txt_pain_radiation.Value;
                ena.pain_score = txt_pain_score.Value;
                #endregion

                ena.allergy = txt_allergy.Value;
                ena.current_medication = txt_current_medication.Value;

                #region skin integrity

                DataTable skin_integrity = new DataTable();
                skin_integrity.Columns.Add("cde");
                skin_integrity.Columns.Add("desc");
                DataRow skin_integrity_row;

                foreach (KeyValuePair<string, string> code in DocumentCode.SkinIntegrity)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_skin_integrity_" + code.Key.ToLower())).Checked)
                    {
                        skin_integrity_row = skin_integrity.NewRow();
                        skin_integrity_row["cde"] = code.Key;
                        skin_integrity_row["desc"] = code.Value;
                        skin_integrity.Rows.Add(skin_integrity_row);
                    }
                }
                ena.skin_integrity = WebHelpers.GetDataTableToJSON(skin_integrity);

                //
                dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(ena.skin_anno_data);
                jsonObject.dataURI = string.Format("{0}", "data:image/png;base64,", ViewState[RadImageEditor1.ID]);

                ena.skin_anno_data = new JavaScriptSerializer().Serialize(jsonObject);

                #endregion

                #region Communicable disease screening

                DataTable com_dis_src = new DataTable();
                com_dis_src.Columns.Add("cde");
                com_dis_src.Columns.Add("desc");
                DataRow com_dis_src_row;

                foreach (KeyValuePair<string, string> code in DocumentCode.ComDisSrc)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_com_dis_src_" + code.Key.ToLower())).Checked)
                    {
                        com_dis_src_row = com_dis_src.NewRow();
                        com_dis_src_row["cde"] = code.Key;
                        com_dis_src_row["desc"] = code.Value;
                        com_dis_src.Rows.Add(com_dis_src_row);
                    }
                }
                ena.com_dis_src = WebHelpers.GetDataTableToJSON(com_dis_src);

                #endregion

                #region Discharge Planning

                DataTable discharge_plan = new DataTable();
                discharge_plan.Columns.Add("cde");
                discharge_plan.Columns.Add("desc");
                DataRow discharge_plan_row;

                foreach (KeyValuePair<string, string> code in DocumentCode.DischargePlan)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_discharge_plan_" + code.Key.ToLower())).Checked)
                    {
                        discharge_plan_row = discharge_plan.NewRow();
                        discharge_plan_row["cde"] = code.Key;
                        discharge_plan_row["desc"] = code.Value;
                        discharge_plan.Rows.Add(discharge_plan_row);
                    }
                }
                ena.discharge_plan = WebHelpers.GetDataTableToJSON(discharge_plan);

                #endregion

                // Disposition after discharge

                foreach (KeyValuePair<string, string> code in DocumentCode.disAfterDischarge)
                {
                    if (((HtmlInputRadioButton)FindControl("rad_dis_after_discharge_code_" + code.Key.ToLower())).Checked)
                    {
                        ena.dis_after_discharge_code = code.Key;
                        ena.dis_after_discharge_desc = code.Value;
                    }
                }

                ena.caregiver_after_discharge = txt_caregiver_after_discharge.Value;

                #region barrier to care

                if (rad_btc_language2.Checked) { ena.btc_language = true; ena.btc_language_note = txt_btc_language_note.Value; }
                else { ena.btc_language = false; }

                if (rad_btc_cognitive2.Checked) { ena.btc_cognitive = true; ena.btc_cognitive_note = txt_btc_cognitive_note.Value; }
                else { ena.btc_cognitive = false; }

                if (rad_btc_sensory2.Checked) { ena.btc_sensory = true; ena.btc_sensory_note = txt_btc_sensory_note.Value; }
                else { ena.btc_sensory = false; }

                if (rad_btc_religious2.Checked) { ena.btc_religious = true; ena.btc_religious_note = txt_btc_religious_note.Value; }
                else { ena.btc_religious = false; }

                if (rad_btc_cultural2.Checked) { ena.btc_cultural = true; ena.btc_cultural_note = txt_btc_cultural_note.Value; }
                else { ena.btc_cultural = false; }

                #endregion

                #region General Appearance

                DataTable general_appearance = new DataTable();
                general_appearance.Columns.Add("cde");
                general_appearance.Columns.Add("desc");
                DataRow general_appearance_row;

                foreach (KeyValuePair<string, string> code in DocumentCode.GeneralAppearance)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_general_appearance_" + code.Key.ToLower())).Checked)
                    {
                        general_appearance_row = general_appearance.NewRow();
                        general_appearance_row["cde"] = code.Key;
                        general_appearance_row["desc"] = code.Value;
                        general_appearance.Rows.Add(general_appearance_row);
                    }
                }
                ena.general_appearance = WebHelpers.GetDataTableToJSON(general_appearance);

                #endregion

                ena.eye = txt_eye.Value;
                ena.voice = txt_voice.Value;
                ena.motion = txt_motion.Value;

                ena.alert = cb_alert.Checked;
                ena.coma = cb_coma.Checked;
                ena.others = cb_others.Checked;
                ena.str_others = txt_str_others.Value;

                #region respiratory

                DataTable respiratory = new DataTable();
                respiratory.Columns.Add("code");
                respiratory.Columns.Add("desc");
                DataRow respiratory_row;

                foreach (KeyValuePair<string, string> code in DocumentCode.Respiratory)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_respiratory_" + code.Key.ToLower())).Checked)
                    {
                        respiratory_row = respiratory.NewRow();
                        respiratory_row["code"] = code.Key;
                        respiratory_row["desc"] = code.Value;
                        respiratory.Rows.Add(respiratory_row);
                    }
                }

                if (cb_respiratory_oth.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = "OTH";
                    respiratory_row["desc"] = txt_respiratory_oth.Value;
                    respiratory.Rows.Add(respiratory_row);
                }
                ena.respiratory = WebHelpers.GetDataTableToJSON(respiratory);

                #endregion

                #region rhythm
                ena.rhythm_regular = cb_rhythm_regular.Checked;
                ena.rhythm_inregular = cb_rhythm_inregular.Checked;
                ena.rhythm_others = cb_rhythm_others.Checked;
                ena.rhythm_str_others = txt_rhythm_str_others.Value;
                #endregion

                #region psychosocial
                ena.psychosocial = cb_psychosocial.Checked;
                ena.psychosocial_others = cb_psychosocial_others.Checked;
                ena.psychosocial_str_others = txt_psychosocial_str_others.Value;
                #endregion

                #region other systems
                ena.other_systems_normal = cb_other_systems_normal.Checked;
                ena.other_systems_abnormal = cb_other_systems_abnormal.Checked;
                ena.others_systems_str = txt_others_systems_str.Value;
                #endregion

                #region lmp
                ena.lmp = cb_lmp.Checked;
                ena.lmP_note = txt_lmP_note.Value;
                ena.para = txt_para.Value;
                ena.abortions = txt_abortions.Value;
                #endregion

                #region Intervention Procedure
                if (dtpk_blood_glucose_date_time.SelectedDate != null)
                {
                    ena.blood_glucose_date_time = DataHelpers.ConvertSQLDateTime(dtpk_blood_glucose_date_time.SelectedDate);
                }
                ena.blood_glucose_note = txt_blood_glucose_note.Value;

                if (dtpk_ecg_date_time.SelectedDate != null)
                {
                    ena.ecg_date_time = DataHelpers.ConvertSQLDateTime(dtpk_ecg_date_time.SelectedDate);
                }
                ena.ecg_note = txt_ecg_note.Value;

                if (dtpk_urine_cath_date_time.SelectedDate != null)
                {
                    ena.urine_cath_date_time = DataHelpers.ConvertSQLDateTime(dtpk_urine_cath_date_time.SelectedDate);
                }
                ena.urine_cath_note = txt_urine_cath_note.Value;

                if (dtpk_splint_cast_dressing_date_time.SelectedDate != null)
                {
                    ena.splint_cast_dressing_date_time = DataHelpers.ConvertSQLDateTime(dtpk_splint_cast_dressing_date_time.SelectedDate);
                }
                ena.splint_cast_dressing_note = txt_splint_cast_dressing_note.Value;

                if (dtpk_procedure_other_date_time.SelectedDate != null)
                {
                    ena.procedure_other_date_time = DataHelpers.ConvertSQLDateTime(dtpk_procedure_other_date_time.SelectedDate);
                }
                ena.procedure_other_note = txt_procedure_other_note.Value;

                #endregion

                // Assessment System
                DataTable assessment_system_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in EMRTable.assessmentSystem)
                {
                    assessment_system_tb.Columns.Add(col.Key);
                }

                ena.assessment_system = WebHelpers.GetJSONFromTable(grid_AssessmentSystem, assessment_system_tb);

                // Direct Medication
                DataTable direct_medication_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in EMRTable.directMedication)
                {
                    direct_medication_tb.Columns.Add(col.Key);
                }

                ena.direct_medication = WebHelpers.GetJSONFromTable(gridDirectMedication, direct_medication_tb);

                // Discharged
                ena.discharge_date_time = DataHelpers.ConvertSQLDateTime(dtpk_discharge_date_time.SelectedDate);
                ena.discharge_by = txt_discharge_by.Value;

                DataTable discharge_option = new DataTable();
                discharge_option.Columns.Add("code");
                discharge_option.Columns.Add("desc");
                DataRow discharge_option_row;

                foreach (KeyValuePair<string, string> code in DocumentCode.DischargeOption)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_discharge_option_" + code.Key.ToLower())).Checked)
                    {
                        discharge_option_row = discharge_option.NewRow();
                        discharge_option_row["code"] = code.Key;
                        discharge_option_row["desc"] = code.Value;
                        discharge_option.Rows.Add(discharge_option_row);
                    }
                }
                ena.discharge_option = discharge_option;

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
                DataTable nursing_note_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in EMRTable.nursingNote)
                {
                    nursing_note_tb.Columns.Add(col.Key);
                }

                ena.nursing_note = WebHelpers.GetJSONFromTable(grid_NursingNotes, nursing_note_tb);

                if (ena.Update()[0] == "OK")
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                    Initial();
                }
            }
            catch (Exception ex)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, ex.Message, Message.TYPE.SUCCESS);
            }
        }
    }
}
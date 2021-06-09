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

        public TimeSpan? GetTimeSpan(string time)
        {
            if (string.IsNullOrEmpty(time)) return null;
            else return TimeSpan.Parse(time);
        }

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];
            
            ena = new Ena(DataHelpers.varDocId);

            loadDataToControls(ena);

            //dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(ena.skin_anno_data);
            //string test = jsonObject.dataURI;
            //test = test.Replace("data:image/png;base64,", "");

            //UploadFile(test);
        }

        public void loadDataToControls(Ena ena)
        {
            //Triage Date Time
            WebHelpers.BindDateTimePicker(dtpk_triage_time, ena.triage_time);

            //Triage Area #
            txt_triage_area.Value = ena.triage_area;

            //Chief complaint
            txt_chief_complaint.Value = ena.chief_complaint;

            //
            BindRadioButton("rad_triage_code_" + ena.triage_code);
            BindRadioButton("rad_arrival_mode_code_" + ena.arrival_mode_code);

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
            txt_vs_bmi.Value = ena.vs_bmi;
            txt_vs_spo2.Value = ena.vs_spo2;
            txt_vs_head_circum.Value = ena.vs_head_circum;

            //
            BindCheckBox("cb_loc_avpu_", ena.loc_avpu, "cde");

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
            BindCheckBox("cb_skin_integrity_", ena.skin_integrity, "cde");

            BindCheckBox("cb_com_dis_src_", ena.com_dis_src, "cde");

            BindCheckBox("cb_discharge_plan_", ena.discharge_plan, "cde");

            BindRadioButton("rad_dis_after_discharge_code_" + ena.dis_after_discharge_code);
            
            txt_caregiver_after_discharge.Value = ena.caregiver_after_discharge;

            BindRadioButton("rad_btc_language_" + ena.btc_language);
            txt_btc_language_note.Value = ena.btc_language_note;
            
            BindRadioButton("rad_btc_cognitive_" + ena.btc_cognitive);
            txt_btc_cognitive_note.Value = ena.btc_cognitive_note;

            BindRadioButton("rad_btc_sensory_" + ena.btc_sensory);
            txt_btc_sensory_note.Value = ena.btc_sensory_note;
            
            BindRadioButton("rad_btc_religious_" + ena.btc_religious);
            txt_btc_religious_note.Value = ena.btc_religious_note;

            BindRadioButton("rad_btc_cultural_" + ena.btc_cultural);
            txt_btc_cultural_note.Value = ena.btc_cultural_note;

            BindCheckBox("cb_general_appearance_", ena.general_appearance);
            
            txt_eye.Value = ena.eye;
            txt_voice.Value = ena.voice;
            txt_motion.Value = ena.motion;

            //
            BindCheckBox("cb_alert_" + ena.alert);
            BindCheckBox("cb_coma_" + ena.coma);
            BindCheckBox("cb_others_" + ena.others);

            txt_str_others.Value = ena.str_others;

            BindCheckBox("cb_respiratory_", ena.respiratory);

            BindCheckBox("cb_rhythm_regular_" + ena.rhythm_regular);
            BindCheckBox("cb_rhythm_inregular_" + ena.rhythm_inregular);
            BindCheckBox("cb_rhythm_others_" + ena.rhythm_others);

            txt_rhythm_str_others.Value = ena.rhythm_str_others;

            BindCheckBox("cb_psychosocial_" + ena.psychosocial);
            BindCheckBox("cb_psychosocial_others_" + ena.psychosocial_others);
            txt_psychosocial_str_others.Value = ena.psychosocial_str_others;

            BindCheckBox("cb_psychosocial_" + ena.psychosocial);

            BindCheckBox("cb_other_systems_normal_" + ena.other_systems_normal);
            BindCheckBox("cb_other_systems_abnormal_" + ena.other_systems_abnormal);

            txt_others_systems_str.Value = ena.others_systems_str;

            BindCheckBox("cb_lmp_" + ena.lmp);

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

            _BindGridView(grid_AssessmentSystem, WebHelpers.GetJSONToDataTable(ena.assessment_system));

            _BindGridView(gridDirectMedication , WebHelpers.GetJSONToDataTable(ena.direct_medication));

            //Discharged

            WebHelpers.BindDateTimePicker(dtpk_discharge_date_time, ena.discharge_date_time);

            txt_discharge_by.Value = ena.discharge_by;

            BindCheckBox("cb_discharge_option_", ena.discharge_option);

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
            
            _BindGridView(grid_NursingNotes, WebHelpers.GetJSONToDataTable(ena.nursing_note));

            btnCancel.Visible = false;
            txt_amendReason.Visible = false;

            if (ena.status == DocumentStatus.FINAL)
            {
                loadDataToFormPrint(ena);

                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDeleteModal.Visible = false;

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

        private void loadDataToFormPrint(Ena ena)
        {
            
        }

        private void BindCheckBox(string cb_name, string value, string key = "code")
        {
            if (value != null && cb_name != null)
            {
                foreach (DataRow row in WebHelpers.GetJSONToDataTable(value).Rows)
                {
                    try
                    {
                        ((HtmlInputCheckBox)FindControl(cb_name + row.Field<dynamic>(key).ToLower())).Checked = true;
                    }
                    catch (Exception ex)
                    {
                    }

                }
            }
        }

        private void BindRadioButton(string value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputRadioButton)FindControl(value)).Checked = true;
            }
        }

        private void BindCheckBox(string value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputCheckBox)FindControl(value)).Checked = true;
            }
        }

        protected void DisabledControl(bool disabled)
        {
            WebHelpers.DisabledDateTimePicker(dtpk_triage_time, disabled);
            
            txt_triage_area.Disabled = disabled;
            txt_chief_complaint.Disabled = disabled;

            DisabledRadioButton("rad_triage_code_", Ena.TRIAGE_CODE, disabled);

            DisabledRadioButton("rad_arrival_mode_code_", Ena.ARRIVAL_MODE_CODE, disabled);

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
            DisabledCheckBoxButton("cb_skin_integrity_", Ena.SKIN_INTEGRITY_CODE, disabled);

            DisabledCheckBoxButton("cb_com_dis_src_", Ena.COM_DIS_SRC_CODE, disabled);

            DisabledCheckBoxButton("cb_discharge_plan_", Ena.DISCHARGE_PLAN_CODE, disabled);

            DisabledRadioButton("rad_dis_after_discharge_code_", Ena.DIS_AFTER_DISCHARGE_CODE, disabled);

            // People who will look after patient after discharge
            txt_caregiver_after_discharge.Disabled = disabled;

            //
            rad_btc_language_true.Disabled = disabled;
            rad_btc_language_false.Disabled = disabled;
            txt_btc_language_note.Disabled = disabled;

            //
            rad_btc_cognitive_true.Disabled = disabled;
            rad_btc_cognitive_false.Disabled = disabled;
            txt_btc_cognitive_note.Disabled = disabled;

            //
            rad_btc_sensory_false.Disabled = disabled;
            rad_btc_sensory_true.Disabled = disabled;
            txt_btc_sensory_note.Disabled = disabled;

            //
            rad_btc_religious_false.Disabled = disabled;
            rad_btc_religious_true.Disabled = disabled;
            txt_btc_religious_note.Disabled = disabled;

            //
            rad_btc_cultural_false.Disabled = disabled;
            rad_btc_cultural_true.Disabled = disabled;
            txt_btc_cultural_note.Disabled = disabled;

            DisabledCheckBoxButton("cb_general_appearance_", Ena.GENERAL_APPEARANCE_CODE, disabled);

            //
            txt_eye.Disabled = disabled;
            txt_voice.Disabled = disabled;
            txt_motion.Disabled = disabled;

            //
            cb_alert_true.Disabled = disabled;
            cb_coma_true.Disabled = disabled;
            cb_others_true.Disabled = disabled;
            txt_str_others.Disabled = disabled;

            //missing

            // Respiratory
            DisabledCheckBoxButton("cb_respiratory_", Ena.RESPIRATORY_CODE, disabled);

            //missing

            //Rhythm
            cb_rhythm_regular_true.Disabled = disabled;
            cb_rhythm_inregular_true.Disabled = disabled;
            cb_rhythm_others_true.Disabled = disabled;
            txt_rhythm_str_others.Disabled = disabled;

            //Psychosocial
            cb_psychosocial_true.Disabled = disabled;
            cb_psychosocial_others_true.Disabled = disabled;
            txt_psychosocial_str_others.Disabled = disabled;

            //Other systems
            cb_other_systems_normal_true.Disabled = disabled;
            cb_other_systems_abnormal_true.Disabled = disabled;
            txt_others_systems_str.Disabled = disabled;

            //
            cb_lmp_true.Disabled = disabled;
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

            DisabledCheckBoxButton("cb_discharge_option_", Ena.DISCHARGE_OPTION_CODE, disabled);

            txt_discharge_by.Disabled = disabled;

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

        private void DisabledCheckBoxButton(string checkboxID, Dictionary<string, string> value, bool disabled)
        {
            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    ((HtmlInputCheckBox)FindControl(checkboxID + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

        }

        private void DisabledRadioButton(string radioButtonName, Dictionary<string, string> value, bool disabled)
        {
            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl(radioButtonName + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }
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
                            var control = gridView.Rows[r].Cells[i].Controls[1];

                            if (control is TextField)
                            {
                                (control as TextField).Disabled = disabled;
                            }
                            else if (control is RadTimePicker)
                            {
                                (control as RadTimePicker).TimePopupButton.Visible = !disabled;
                                (control as RadTimePicker).EnableTyping = !disabled;
                            }
                            else if (control is RadDateTimePicker)
                            {
                                (control as RadDateTimePicker).DatePopupButton.Visible = !disabled;
                                (control as RadDateTimePicker).TimePopupButton.Visible = !disabled;
                                (control as RadDateTimePicker).EnableTyping = !disabled;
                            }
                            else if (control is LinkButton)
                            {
                                (control as LinkButton).Visible = !disabled;
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
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
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
            string errors = checkValidField();

            if(string.IsNullOrEmpty(errors))
            {
                ena = new Ena(DataHelpers.varDocId);

                ena.user_name = (string)Session["UserID"];
                ena.status = DocumentStatus.DRAFT;

                UpdateData(ena);
            }
            else
            {
                RequiredFieldValidator.Value = errors;

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private string checkValidField()
        {
            string errors = "";
            if (dtpk_triage_time.SelectedDate == null)
            {
                errors += "dtpk_triage_time_error ";
            }
            return errors;
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
            if (Ena.Delete((string)Session["UserId"], Request.QueryString["vpid"])[0] == "OK")
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
                //new object
                if (table == null)
                {
                    table = new DataTable();
                }
                //create header
                for (int i = 0; i < Ena.DIRECT_MEDICATION_COL.Count; i++)
                {
                    var col = Ena.DIRECT_MEDICATION_COL.ElementAt(i);
                    if (!table.Columns.Contains(col.Key))
                    {
                        table.Columns.Add(col.Key);
                    }
                }
                //get current data
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
                //new object
                if (table == null)
                {
                    table = new DataTable();
                }
                //create header
                for (int i = 0; i < Ena.NURSING_NOTE_COL.Count; i++)
                {
                    var col = Ena.NURSING_NOTE_COL.ElementAt(i);
                    if (!table.Columns.Contains(col.Key))
                    {
                        table.Columns.Add(col.Key);
                    }
                }
                //get current data
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
                //new object
                if (table == null)
                {
                    table = new DataTable();
                }
                //create header
                for (int i = 0; i < Ena.ASSESSMENT_SYSTEM_COL.Count; i++)
                {
                    var col = Ena.ASSESSMENT_SYSTEM_COL.ElementAt(i);
                    if (!table.Columns.Contains(col.Key))
                    {
                        table.Columns.Add(col.Key);
                    }
                }
                //get current data
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

        protected void UpdateData(Ena ena)
        {
            try
            {
                ena.triage_time = DataHelpers.ConvertSQLDateTime(dtpk_triage_time.SelectedDate);

                ena.triage_area = txt_triage_area.Value;

                ena.chief_complaint = txt_chief_complaint.Value;

                ena.triage_code = GetRadioButton("rad_triage_code_", Ena.TRIAGE_CODE);
                if (ena.triage_code != null) { ena.triage_desc = Ena.TRIAGE_CODE[ena.triage_code]; }

                ena.arrival_mode_code = GetRadioButton("rad_arrival_mode_code_", Ena.ARRIVAL_MODE_CODE);
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
                ena.vs_bmi = txt_vs_bmi.Value;
                ena.vs_spo2 = txt_vs_spo2.Value;
                ena.vs_head_circum = txt_vs_head_circum.Value;

                //GetCheckBox("cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);

                //GetCheckBox(string checkbox, Dictionary<string, string> value)

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

                ena.skin_integrity = GetCheckBox("cb_skin_integrity_", Ena.SKIN_INTEGRITY_CODE, "cde");

                //dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(ena.skin_anno_data);
                //jsonObject.dataURI = string.Format("{0}", "data:image/png;base64,", ViewState[RadImageEditor1.ID]);

                //ena.skin_anno_data = new JavaScriptSerializer().Serialize(jsonObject);

                ena.com_dis_src = GetCheckBox("cb_com_dis_src_", Ena.COM_DIS_SRC_CODE, "cde");

                ena.discharge_plan = GetCheckBox("cb_discharge_plan_", Ena.DISCHARGE_PLAN_CODE, "cde");

                ena.dis_after_discharge_code = GetRadioButton("rad_dis_after_discharge_code_", Ena.DIS_AFTER_DISCHARGE_CODE);
                if (ena.dis_after_discharge_code != null) ena.dis_after_discharge_desc = Ena.DIS_AFTER_DISCHARGE_CODE[ena.dis_after_discharge_code];

                ena.caregiver_after_discharge = txt_caregiver_after_discharge.Value;

                #region barrier to care

                ena.btc_language = GetRadioButton("rad_btc_language_");
                ena.btc_language_note = txt_btc_language_note.Value;

                ena.btc_cognitive = GetRadioButton("rad_btc_cognitive_");
                ena.btc_cognitive_note = txt_btc_cognitive_note.Value;

                ena.btc_sensory = GetRadioButton("rad_btc_sensory_");
                ena.btc_sensory_note = txt_btc_sensory_note.Value;

                ena.btc_religious = GetRadioButton("rad_btc_religious_"); 
                ena.btc_religious_note = txt_btc_religious_note.Value;

                ena.btc_cultural = GetRadioButton("rad_btc_cultural_");
                ena.btc_cultural_note = txt_btc_cultural_note.Value;


                #endregion


                ena.general_appearance = GetCheckBox("cb_general_appearance_", Ena.GENERAL_APPEARANCE_CODE, "cde");

                ena.eye = txt_eye.Value;
                ena.voice = txt_voice.Value;
                ena.motion = txt_motion.Value;

                ena.alert = cb_alert_true.Checked;
                ena.coma = cb_coma_true.Checked;
                ena.others = cb_others_true.Checked;
                ena.str_others = txt_str_others.Value;

                DataTable respiratory = new DataTable();
                respiratory.Columns.Add("code");
                respiratory.Columns.Add("desc");

                foreach (KeyValuePair<string, string> code in Ena.RESPIRATORY_CODE)
                {
                    try
                    {
                        if (((HtmlInputCheckBox)FindControl("cb_respiratory_" + code.Key)).Checked)
                        {
                            DataRow dtRow = respiratory.NewRow();

                            dtRow = respiratory.NewRow();
                            dtRow["code"] = code.Key;
                            dtRow["desc"] = code.Value;
                            respiratory.Rows.Add(dtRow);
                        }
                    }
                    catch (Exception ex) { }
                }

                if (cb_respiratory_oth.Checked)
                {
                    DataRow dtRow = respiratory.NewRow();
                    dtRow["code"] = "OTH";
                    dtRow["desc"] = txt_respiratory_oth.Value;
                    respiratory.Rows.Add(dtRow);
                }
                ena.respiratory = WebHelpers.GetDataTableToJSON(respiratory);

                #region rhythm
                ena.rhythm_regular = cb_rhythm_regular_true.Checked;
                ena.rhythm_inregular = cb_rhythm_inregular_true.Checked;
                ena.rhythm_others = cb_rhythm_others_true.Checked;
                ena.rhythm_str_others = txt_rhythm_str_others.Value;
                #endregion

                #region psychosocial
                ena.psychosocial = cb_psychosocial_true.Checked;
                ena.psychosocial_others = cb_psychosocial_others_true.Checked;
                ena.psychosocial_str_others = txt_psychosocial_str_others.Value;
                #endregion

                #region other systems
                ena.other_systems_normal = cb_other_systems_normal_true.Checked;
                ena.other_systems_abnormal = cb_other_systems_abnormal_true.Checked;
                ena.others_systems_str = txt_others_systems_str.Value;
                #endregion

                #region lmp
                ena.lmp = cb_lmp_true.Checked;
                ena.lmP_note = txt_lmP_note.Value;
                ena.para = txt_para.Value;
                ena.abortions = txt_abortions.Value;
                #endregion

                #region Intervention Procedure
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

                #endregion

                // Assessment System

                ena.assessment_system = WebHelpers.GetJSONFromTable(grid_AssessmentSystem, Ena.ASSESSMENT_SYSTEM_COL);

                ena.direct_medication = WebHelpers.GetJSONFromTable(gridDirectMedication, Ena.DIRECT_MEDICATION_COL);

                // Discharged
                ena.discharge_date_time = DataHelpers.ConvertSQLDateTime(dtpk_discharge_date_time.SelectedDate);
                ena.discharge_by = txt_discharge_by.Value;

                ena.discharge_option = GetCheckBox("cb_discharge_option_", Ena.DISCHARGE_OPTION_CODE);

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
                ena.nursing_note = WebHelpers.GetJSONFromTable(grid_NursingNotes, Ena.NURSING_NOTE_COL);

                if (ena.Update()[0].Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                    Initial();
                }
                else
                {
                    Session["PageNotFound"] = ena.Update()[0];
                    Response.Redirect("../Other/PageNotFound.aspx", false);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }

        private bool? GetRadioButton(string radio_name)
        {
            if (((HtmlInputRadioButton)FindControl(radio_name + "True")).Checked)
            {
                return true;
            }
            else if (((HtmlInputRadioButton)FindControl(radio_name + "False")).Checked)
            {
                return false;
            }
            else { return null; }
        }

        private string GetRadioButton(string radio_name, Dictionary<string, string> value)
        {
            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    if (((HtmlInputRadioButton)FindControl(radio_name + code.Key)).Checked)
                    {
                        return code.Key;
                        break;
                    }
                }
                catch (Exception ex) { }
            }
            return null;
        }

        private dynamic GetCheckBox(string checkbox, Dictionary<string, string> value, string code_col = "code")
        {
            DataTable table = new DataTable();
            table.Columns.Add(code_col);
            table.Columns.Add("desc");

            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    if (((HtmlInputCheckBox)FindControl(checkbox + code.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();

                        dtRow = table.NewRow();
                        dtRow["code"] = code.Key;
                        dtRow["desc"] = code.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex) { }
            }
            return JsonConvert.SerializeObject(table);
        }
    }
}
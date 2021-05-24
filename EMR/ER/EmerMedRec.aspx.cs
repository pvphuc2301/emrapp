using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Security.Permissions;
namespace EMR.ER
{
    public partial class EmerMedRec : System.Web.UI.Page
    {
        EmergencyMedicalRecord emr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Initial();
            }

        }
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];
            emr = new EmergencyMedicalRecord(DataHelpers.varDocId);
            loadDataToControls(emr);
        }
        public void loadDataToControls(EmergencyMedicalRecord emr)
        {
            txt_amendReason.Visible = false;
            if (emr.evaluation_time != null)
            {
                rad_evaluation_time.SelectedDate = DateTime.Parse(emr.evaluation_time);
            }

            txtChiefComplaint.Value = emr.chief_complaint;
            if (emr.chief_complaint_code != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + emr.chief_complaint_code)).Checked = true;
            }
            txtHistoryofPresent.Value = emr.history_of_present;
            //Meds
            txtpastmedhismeds.Value = emr.past_med_his_meds;
            //Surgical
            txtpastmedhissurs.Value = emr.past_med_his_surs;
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(emr.habits).Rows)
            {
                ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_habits_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }
            txthabitsother.Value = emr.habits_other;
            txthomemedications.Value = emr.home_medications;
            txtallergies.Value = emr.allergies;
            txtrelevantfamilyhistory.Value = emr.relevant_family_history;
            txtfinding.Value = emr.finding;
            if (emr.required_code != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_required_code_" + Convert.ToBoolean(emr.required_code))).Checked = true;
            }

            txtrequiredtext.Value = emr.required_text;
            txtinvestigationsresults.Value = emr.investigations_results;
            txtinitialdiagnosis.Value = emr.initial_diagnosis;
            txtdiferentialdiagnosis.Value = emr.diferential_diagnosis;
            txtassociatedconditions.Value = emr.associated_conditions;
            txtcomfirmeddiagnosis.Value = emr.comfirmed_diagnosis;
            if (emr.specialist_opinion != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_specialist_opinion_" + Convert.ToBoolean(emr.specialist_opinion))).Checked = true;
            }
            txtnameofspecialist.Value = emr.name_of_specialist;
            if (emr.time_contaced != null)
            {
                rad_time_contaced.SelectedDate = DateTime.Parse(emr.time_contaced);
            }
            if (emr.time_provided != null)
            {
                rad_time_provided.SelectedDate = DateTime.Parse(emr.time_provided);
            }
            txtspecopinionsummarised.Value = emr.spec_opinion_summarised;

            _BindGridView(grid_Treatment, WebHelpers.GetJSONToDataTable(emr.treatment));
            _BindGridView(grid_progress_note, WebHelpers.GetJSONToDataTable(emr.progress_note));
            if (emr.required_code != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_discharge_" + Convert.ToBoolean(emr.discharge))).Checked = true;
            }
            txtconclusions.Value = emr.conclusions;
            //if (emr.discharge != null)
            //{
            //    ((HtmlInputRadioButton)FindControl("rad_discharge_" + Convert.ToBoolean(emr.discharge))).Checked = true;
            //}
            txtprescription.Value = emr.prescription;
            txtspecifycareinstructions.Value = emr.specify_care_instructions;
            if (emr.discharge_time != null)
            {
                rad_discharge_time.SelectedDate = DateTime.Parse(emr.discharge_time);
            }
            if (emr.referred_to_OPD != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_referred_OPD_" + Convert.ToBoolean(emr.referred_to_OPD))).Checked = true;
            }
            txtreferredtoOPDtext.Value = emr.referred_to_OPD_text;

            if (emr.hospitalisation_required != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_hospitalisation_required_" + Convert.ToBoolean(emr.hospitalisation_required))).Checked = true;
            }
            txtreason.Value = emr.reason;
            txtward.Value = emr.ward;
            if (emr.discharge_time != null)
            {
                rad_timeofleavingemergency.SelectedDate = DateTime.Parse(emr.time_of_leaving_emergency);
            }
            if (emr.emergency_surgery != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_emergency_surgery_" + Convert.ToBoolean(emr.emergency_surgery))).Checked = true;
            }
            txtpreoperative_diagnosis.Value = emr.pre_operative_diagnosis;
            txtprebrief_summary.Value = emr.brief_summary;
            if (emr.time_of_leaving_emer_e != null)
            {
                rad_time_of_leaving_emer_e.SelectedDate = DateTime.Parse(emr.time_of_leaving_emer_e);
            }
            if (emr.transfer_hospital != null)
            {
                ((HtmlInputRadioButton)FindControl("rad_transfer_hospital_" + Convert.ToBoolean(emr.transfer_hospital))).Checked = true;
            }
            txtreasonfor_transfer.Value = emr.reason_for_transfer;
            txtstatus_before_transfer.Value = emr.status_before_transfer;
            if (emr.time_of_leaving_emer_a != null)
            {
                rad_time_of_leaving_emer_a.SelectedDate = DateTime.Parse(emr.time_of_leaving_emer_a);
            }
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(emr.patient_discharge).Rows)
            {
                ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_patient_discharge_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }
            txticd_10.Value = emr.icd_10;
            if (emr.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDeleteModal.Visible = false;
                btnCancel.Visible = false;
                btnDelete.Visible = false;
                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);
            }
            else if (emr.status == DocumentStatus.DRAFT)
            {

                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }

        }
        public static void DisabledDatimePicker(RadDateTimePicker radDateTimePicker, bool disabled)
        {
            radDateTimePicker.DatePopupButton.Visible = !disabled;
            radDateTimePicker.TimePopupButton.Visible = !disabled;
            radDateTimePicker.EnableTyping = !disabled;
        }
        protected void DisabledControl(bool disabled)
        {
            //rad_evaluation_time
            WebHelpers.DisabledDateTimePicker(rad_evaluation_time, disabled);
            //DisabledDatimePicker(rad_evaluation_time, disabled);
            txtChiefComplaint.Disabled = disabled;
            rad_chief_complaint_code_E.Disabled = disabled;
            rad_chief_complaint_code_L.Disabled = disabled;
            rad_chief_complaint_code_N.Disabled = disabled;
            rad_chief_complaint_code_R.Disabled = disabled;
            rad_chief_complaint_code_U.Disabled = disabled;
            txtHistoryofPresent.Disabled = disabled;
            txtpastmedhismeds.Disabled = disabled;
            txtpastmedhissurs.Disabled = disabled;
            cb_habits_A.Disabled = disabled;
            cb_habits_D.Disabled = disabled;
            cb_habits_O.Disabled = disabled;
            cb_habits_S.Disabled = disabled;
            txthabitsother.Disabled = disabled;
            txthomemedications.Disabled = disabled;
            txtallergies.Disabled = disabled;
            txtrelevantfamilyhistory.Disabled = disabled;
            txtfinding.Disabled = disabled;
            rad_required_code_True.Disabled = disabled;
            rad_required_code_False.Disabled = disabled;
            txtrequiredtext.Disabled = disabled;
            txtinvestigationsresults.Disabled = disabled;
            txtinitialdiagnosis.Disabled = disabled;
            txtdiferentialdiagnosis.Disabled = disabled;
            txtassociatedconditions.Disabled = disabled;
            txtcomfirmeddiagnosis.Disabled = disabled;
            rad_specialist_opinion_True.Disabled = disabled;
            rad_specialist_opinion_False.Disabled = disabled;
            txtnameofspecialist.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(rad_time_contaced, disabled);
            WebHelpers.DisabledDateTimePicker(rad_time_provided, disabled);
            txtspecopinionsummarised.Disabled = disabled;
            txtconclusions.Disabled = disabled;
            rad_discharge_True.Disabled = disabled;
            rad_discharge_False.Disabled = disabled;
            txtprescription.Disabled = disabled;
            txtspecifycareinstructions.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(rad_discharge_time, disabled);
            rad_referred_OPD_True.Disabled = disabled;
            rad_referred_OPD_False.Disabled = disabled;
            txtreferredtoOPDtext.Disabled = disabled;
            rad_hospitalisation_required_False.Disabled = disabled;
            rad_hospitalisation_required_True.Disabled = disabled;
            txtreason.Disabled = disabled;
            txtward.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(rad_timeofleavingemergency, disabled);
            rad_emergency_surgery_True.Disabled = disabled;
            rad_emergency_surgery_False.Disabled = disabled;
            txtpreoperative_diagnosis.Disabled = disabled;
            txtprebrief_summary.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(rad_time_of_leaving_emer_e, disabled);
            rad_transfer_hospital_True.Disabled = disabled;
            rad_transfer_hospital_False.Disabled = disabled;
            txtreasonfor_transfer.Disabled = disabled;
            txtstatus_before_transfer.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(rad_time_of_leaving_emer_a, disabled);
            cb_patient_discharge_IMP.Disabled = disabled;
            cb_patient_discharge_UNC.Disabled = disabled;
            cb_patient_discharge_UNS.Disabled = disabled;
            txticd_10.Disabled = disabled;
            DisabledGridView(grid_Treatment, disabled);
            DisabledGridView(grid_progress_note, disabled);

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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                emr = new EmergencyMedicalRecord(DataHelpers.varDocId);
                emr.user_name = (string)Session["UserID"];//DataHelpers.varUseName;
                emr.status = DocumentStatus.DRAFT;

                if (rad_evaluation_time.SelectedDate != null)
                {
                    emr.evaluation_time = DataHelpers.ConvertSQLDateTime(rad_evaluation_time.SelectedDate);
                }

                emr.chief_complaint = txtChiefComplaint.Value;
                foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.ChiefComplaintCode)
                {
                    if (((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + code.Key.ToLower())).Checked)
                    {
                        emr.chief_complaint_code = code.Key;
                        emr.chief_complaint_desc = code.Value;
                    }
                }
                emr.history_of_present = txtHistoryofPresent.Value;
                emr.past_med_his_meds = txtpastmedhismeds.Value;
                emr.past_med_his_surs = txtpastmedhissurs.Value;

                DataTable habits = new DataTable();
                habits.Columns.Add("cde");
                habits.Columns.Add("desc");
                DataRow habits_row;

                foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.Habits)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_habits_" + code.Key.ToLower())).Checked)
                    {
                        habits_row = habits.NewRow();
                        habits_row["cde"] = code.Key;
                        habits_row["desc"] = code.Value;
                        habits.Rows.Add(habits_row);
                        if (code.Key == "O")
                        {
                            emr.habits_other = txthabitsother.Value;
                        }
                        else
                        {
                            emr.habits_other = "";
                        }
                    }
                }
                emr.habits = WebHelpers.GetDataTableToJSON(habits);

                emr.home_medications = txthomemedications.Value;
                emr.allergies = txtallergies.Value;
                emr.relevant_family_history = txtrelevantfamilyhistory.Value;
                emr.finding = txtfinding.Value;
                if (rad_required_code_True.Checked)
                {
                    emr.required_code = true;
                    emr.required_text = txtrequiredtext.Value;
                }
                if (rad_required_code_False.Checked)
                {
                    emr.required_code = false;
                    emr.required_text = "";
                }
                emr.investigations_results = txtinvestigationsresults.Value;
                emr.initial_diagnosis = txtinitialdiagnosis.Value;
                emr.diferential_diagnosis = txtdiferentialdiagnosis.Value;
                emr.associated_conditions = txtassociatedconditions.Value;
                emr.comfirmed_diagnosis = txtcomfirmeddiagnosis.Value;
                if (rad_specialist_opinion_True.Checked)
                {
                    emr.specialist_opinion = true;
                    emr.name_of_specialist = txtnameofspecialist.Value;
                    emr.time_contaced = DataHelpers.ConvertSQLDateTime(rad_time_contaced.SelectedDate);
                    emr.time_provided = DataHelpers.ConvertSQLDateTime(rad_time_provided.SelectedDate);
                    emr.spec_opinion_summarised = txtspecopinionsummarised.Value;

                }
                if (rad_specialist_opinion_False.Checked)
                {
                    emr.specialist_opinion = false;
                    emr.name_of_specialist = "";
                    emr.time_contaced = null;
                    emr.time_provided = null;
                    emr.spec_opinion_summarised = "";

                }
                DataTable Treatment_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.Treatment)
                {
                    Treatment_tb.Columns.Add(col.Key);
                }
                emr.treatment = WebHelpers.GetJSONFromTable(grid_Treatment, Treatment_tb);
                DataTable Progress_note_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.ProgressNote)
                {
                    Progress_note_tb.Columns.Add(col.Key);
                }
                emr.progress_note = WebHelpers.GetJSONFromTable(grid_progress_note, Progress_note_tb);
                emr.conclusions = txtconclusions.Value;
                if (rad_discharge_True.Checked)
                {
                    emr.discharge = true;
                    emr.prescription = txtprescription.Value;
                    emr.specify_care_instructions = txtspecifycareinstructions.Value;
                    emr.discharge_time = DataHelpers.ConvertSQLDateTime(rad_discharge_time.SelectedDate);

                }
                if (rad_discharge_False.Checked)
                {
                    emr.discharge = false;
                    emr.prescription = "";
                    emr.specify_care_instructions = "";
                    emr.discharge_time = null;
                }
                if (rad_referred_OPD_True.Checked)
                {
                    emr.referred_to_OPD = true;
                    emr.referred_to_OPD_text = txtreferredtoOPDtext.Value;
                }
                if (rad_referred_OPD_False.Checked)
                {
                    emr.referred_to_OPD = false;
                    emr.referred_to_OPD_text = "";

                }
                if (rad_hospitalisation_required_True.Checked)
                {
                    emr.hospitalisation_required = true;
                    emr.reason = txtreason.Value;
                    emr.ward = txtward.Value;
                    emr.time_of_leaving_emergency = DataHelpers.ConvertSQLDateTime(rad_timeofleavingemergency.SelectedDate);
                }
                if (rad_hospitalisation_required_False.Checked)
                {
                    emr.hospitalisation_required = false;
                    emr.reason = "";
                    emr.ward = "";
                    emr.time_of_leaving_emergency = null;
                }
                if (rad_emergency_surgery_True.Checked)
                {
                    emr.emergency_surgery = true;
                    emr.pre_operative_diagnosis = txtpreoperative_diagnosis.Value;
                    emr.brief_summary = txtprebrief_summary.Value;
                    emr.time_of_leaving_emer_e = DataHelpers.ConvertSQLDateTime(rad_time_of_leaving_emer_e.SelectedDate);
                }
                if (rad_emergency_surgery_False.Checked)
                {
                    emr.emergency_surgery = false;
                    emr.pre_operative_diagnosis = "";
                    emr.brief_summary = "";
                    emr.time_of_leaving_emer_e = null;
                }
                if (rad_transfer_hospital_True.Checked)
                {
                    emr.transfer_hospital = true;
                    emr.reason_for_transfer = txtreasonfor_transfer.Value;
                    emr.status_before_transfer = txtstatus_before_transfer.Value;
                    emr.time_of_leaving_emer_a = DataHelpers.ConvertSQLDateTime(rad_time_of_leaving_emer_a.SelectedDate);
                }
                if (rad_transfer_hospital_False.Checked)
                {
                    emr.transfer_hospital = false;
                    emr.reason_for_transfer = "";
                    emr.status_before_transfer = "";
                    emr.time_of_leaving_emer_a = null;
                }
                DataTable patient_discharge = new DataTable();
                patient_discharge.Columns.Add("cde");
                patient_discharge.Columns.Add("desc");
                DataRow patient_discharge_row;

                foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.PatientDischarge)
                {
                    if (((HtmlInputCheckBox)FindControl("cb_patient_discharge_" + code.Key.ToLower())).Checked)
                    {
                        patient_discharge_row = patient_discharge.NewRow();
                        patient_discharge_row["cde"] = code.Key;
                        patient_discharge_row["desc"] = code.Value;
                        patient_discharge.Rows.Add(patient_discharge_row);
                    }
                }
                emr.patient_discharge = WebHelpers.GetDataTableToJSON(patient_discharge);
                emr.icd_10 = txticd_10.Value;
                if (emr.Update()[0] == WebHelpers.ResponseStatus.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                    Initial();
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void grid_progress_note_RowEditing(object sender, GridViewEditEventArgs e)
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
        protected void btnAdd_Click1(object sender, EventArgs e)
        {
        }
        protected void gridTreatment_RowDataBound(object sender, GridViewRowEventArgs e)
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
        protected void gridTreatment_RowUpdating(object sender, GridViewUpdateEventArgs e)

        {

        }
        protected void btn_grid_Treatment_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[grid_Treatment.ID];

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.Treatment)
                    {
                        table.Columns.Add(col.Key);
                    }
                }

                for (int r = 0; r < grid_Treatment.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_Treatment.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (grid_Treatment.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_Treatment.Rows[r].Cells[i].Controls[1] as TextField;

                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                            else if (grid_Treatment.Rows[r].Cells[i].Controls[1] is RadTimePicker)
                            {
                                RadTimePicker text2 = grid_Treatment.Rows[r].Cells[i].Controls[1] as RadTimePicker;
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
                _BindGridView(grid_Treatment, table);
            }
            catch (Exception ex)
            {

            }
        }
        protected void btn_grid_progress_note_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[grid_progress_note.ID];

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.ProgressNote)
                    {
                        table.Columns.Add(col.Key);
                    }
                }

                for (int r = 0; r < grid_progress_note.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_progress_note.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (grid_progress_note.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_progress_note.Rows[r].Cells[i].Controls[1] as TextField;

                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                            else if (grid_progress_note.Rows[r].Cells[i].Controls[1] is RadTimePicker)
                            {
                                RadTimePicker text2 = grid_progress_note.Rows[r].Cells[i].Controls[1] as RadTimePicker;
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

                _BindGridView(grid_progress_note, table);
            }
            catch (Exception ex)
            {

            }
        }
        protected void grid_Treatment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }
        protected void grid_progress_note_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }
        private void DeleteGridViewRow(GridView gridView, int rowIndex)
        {
            DataTable dt = ViewState[gridView.ID] as DataTable;
            dt.Rows[rowIndex].Delete();

            _BindGridView(gridView, dt);
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            
            txt_amendReason.Visible = true;

            btnComplete.Visible = true;
            btnComplete.Attributes["disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            emr = new EmergencyMedicalRecord(DataHelpers.varDocId);
            emr.user_name = (string)Session["UserID"];
            emr.status = DocumentStatus.FINAL;
            emr.amend_reason = txt_amendReason.Value;
            if (rad_evaluation_time.SelectedDate != null)
            {
                emr.evaluation_time = DataHelpers.ConvertSQLDateTime(rad_evaluation_time.SelectedDate);
            }

            emr.chief_complaint = txtChiefComplaint.Value;
            foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.ChiefComplaintCode)
            {
                if (((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + code.Key.ToLower())).Checked)
                {
                    emr.chief_complaint_code = code.Key;
                    emr.chief_complaint_desc = code.Value;
                }
            }
            emr.history_of_present = txtHistoryofPresent.Value;
            emr.past_med_his_meds = txtpastmedhismeds.Value;
            emr.past_med_his_surs = txtpastmedhissurs.Value;

            DataTable habits = new DataTable();
            habits.Columns.Add("cde");
            habits.Columns.Add("desc");
            DataRow habits_row;

            foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.Habits)
            {
                if (((HtmlInputCheckBox)FindControl("cb_habits_" + code.Key.ToLower())).Checked)
                {
                    habits_row = habits.NewRow();
                    habits_row["cde"] = code.Key;
                    habits_row["desc"] = code.Value;
                    habits.Rows.Add(habits_row);
                    if (code.Key == "O" )
                    {
                        emr.habits_other = txthabitsother.Value;
                    }
                    else
                    {
                        emr.habits_other = "";
                    }
                }
            }
            emr.habits = WebHelpers.GetDataTableToJSON(habits);
            
            emr.home_medications = txthomemedications.Value;
            emr.allergies = txtallergies.Value;
            emr.relevant_family_history = txtrelevantfamilyhistory.Value;
            emr.finding = txtfinding.Value;
            if (rad_required_code_True.Checked)
            {
                emr.required_code = true;
                emr.required_text = txtrequiredtext.Value;
            }
            if (rad_required_code_False.Checked)
            {
                emr.required_code = false;
                emr.required_text = "";
            }
            emr.investigations_results = txtinvestigationsresults.Value;
            emr.initial_diagnosis = txtinitialdiagnosis.Value;
            emr.diferential_diagnosis = txtdiferentialdiagnosis.Value;
            emr.associated_conditions = txtassociatedconditions.Value;
            emr.comfirmed_diagnosis = txtcomfirmeddiagnosis.Value;
            if (rad_specialist_opinion_True.Checked)
            {
                emr.specialist_opinion = true;
                emr.name_of_specialist = txtnameofspecialist.Value;
                emr.time_contaced = DataHelpers.ConvertSQLDateTime(rad_time_contaced.SelectedDate);
                emr.time_provided = DataHelpers.ConvertSQLDateTime(rad_time_provided.SelectedDate);
                emr.spec_opinion_summarised = txtspecopinionsummarised.Value;

            }
            if (rad_specialist_opinion_False.Checked)
            {
                emr.specialist_opinion = false;
                emr.name_of_specialist = "";
                emr.time_contaced = null;
                emr.time_provided = null;
                emr.spec_opinion_summarised = "";

            }
            DataTable Treatment_tb = new DataTable();
            foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.Treatment)
            {
                Treatment_tb.Columns.Add(col.Key);
            }
            emr.treatment = WebHelpers.GetJSONFromTable(grid_Treatment, Treatment_tb);
            DataTable Progress_note_tb = new DataTable();
            foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.ProgressNote)
            {
                Progress_note_tb.Columns.Add(col.Key);
            }
            emr.progress_note = WebHelpers.GetJSONFromTable(grid_progress_note, Progress_note_tb);
            emr.conclusions = txtconclusions.Value;
            if (rad_discharge_True.Checked)
            {
                emr.discharge = true;
                emr.prescription = txtprescription.Value;
                emr.specify_care_instructions = txtspecifycareinstructions.Value;
                emr.discharge_time = DataHelpers.ConvertSQLDateTime(rad_discharge_time.SelectedDate);

            }
            if (rad_discharge_False.Checked)
            {
                emr.discharge = false;
                emr.prescription = "";
                emr.specify_care_instructions = "";
                emr.discharge_time = null;
            }
            if (rad_referred_OPD_True.Checked)
            {
                emr.referred_to_OPD = true;
                emr.referred_to_OPD_text = txtreferredtoOPDtext.Value;
            }
            if (rad_referred_OPD_False.Checked)
            {
                emr.referred_to_OPD = false;
                emr.referred_to_OPD_text = "";

            }
            if (rad_hospitalisation_required_True.Checked)
            {
                emr.hospitalisation_required = true;
                emr.reason = txtreason.Value;
                emr.ward = txtward.Value;
                emr.time_of_leaving_emergency = DataHelpers.ConvertSQLDateTime(rad_timeofleavingemergency.SelectedDate);
            }
            if (rad_hospitalisation_required_False.Checked)
            {
                emr.hospitalisation_required = false;
                emr.reason = "";
                emr.ward = "";
                emr.time_of_leaving_emergency = null;
            }
            if (rad_emergency_surgery_True.Checked)
            {
                emr.emergency_surgery = true;
                emr.pre_operative_diagnosis = txtpreoperative_diagnosis.Value;
                emr.brief_summary = txtprebrief_summary.Value;
                emr.time_of_leaving_emer_e = DataHelpers.ConvertSQLDateTime(rad_time_of_leaving_emer_e.SelectedDate);
            }
            if (rad_emergency_surgery_False.Checked)
            {
                emr.emergency_surgery = false;
                emr.pre_operative_diagnosis = "";
                emr.brief_summary = "";
                emr.time_of_leaving_emer_e = null;
            }
            if (rad_transfer_hospital_True.Checked)
            {
                emr.transfer_hospital = true;
                emr.reason_for_transfer = txtreasonfor_transfer.Value;
                emr.status_before_transfer = txtstatus_before_transfer.Value;
                emr.time_of_leaving_emer_a = DataHelpers.ConvertSQLDateTime(rad_time_of_leaving_emer_a.SelectedDate);
            }
            if (rad_transfer_hospital_False.Checked)
            {
                emr.transfer_hospital = false;
                emr.reason_for_transfer = "";
                emr.status_before_transfer = "";
                emr.time_of_leaving_emer_a = null;
            }
            DataTable patient_discharge = new DataTable();
            patient_discharge.Columns.Add("cde");
            patient_discharge.Columns.Add("desc");
            DataRow patient_discharge_row;

            foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.PatientDischarge)
            {
                if (((HtmlInputCheckBox)FindControl("cb_patient_discharge_" + code.Key.ToLower())).Checked)
                {
                    patient_discharge_row = patient_discharge.NewRow();
                    patient_discharge_row["cde"] = code.Key;
                    patient_discharge_row["desc"] = code.Value;
                    patient_discharge.Rows.Add(patient_discharge_row);
                }
            }
            emr.patient_discharge = WebHelpers.GetDataTableToJSON(patient_discharge);
            emr.icd_10 = txticd_10.Value;
            if (emr.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }

        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (EmergencyMedicalRecord.Delete((string)Session["UserID"])[0] == WebHelpers.ResponseStatus.OK)
            {

            }
        }
        protected void btn_grid_progress_note_del_Click(object sender, EventArgs e)
        {
            if (EmergencyMedicalRecord.Delete((string)Session["UserID"])[0] == WebHelpers.ResponseStatus.OK)
            {

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


    }
}
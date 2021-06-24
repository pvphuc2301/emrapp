using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR.ER
{
    public partial class EmerMedRec : System.Web.UI.Page
    {
        EmergencyMedicalRecord emr;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);
            if (!IsPostBack)
            {
                Initial();
            }
        }
        #region Binding Data
        private void BindingDataForm(EmergencyMedicalRecord emr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(emr);
            }
            else
            {
                BindingDataFormView(emr);
            }
        }
        private void BindingDataFormEdit(EmergencyMedicalRecord emr)
        {
            try
            {

                //lbPatientName.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
                //lbDoB.Text = WebHelpers.FormatDateTime(DataHelpers.patient.date_of_birth) + "| " + DataHelpers.patient.gender_l;
                //lbPID.Text = DataHelpers.patient.visible_patient_id;
                //lbl_evaluation_time.Text = WebHelpers.FormatDateTime(emr.evaluation_time, "dd/MM/yyyy HH:mm tt");
                //WebHelpers.FormatDateTime(emr.evaluation_time, "dd/MM/yyyy HH:mm tt");
                //txt_amend_reason.Visible = false;
                //if (emr.evaluation_time != null)
                //{
                //    rad_evaluation_time.SelectedDate = emr.evaluation_time;
                //}

                //lbl_chief_complaint.Text = emr.chief_complaint;
                //txtChiefComplaint.Value = emr.chief_complaint;

                //if (emr.chief_complaint_code != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + emr.chief_complaint_code)).Checked = true;
                //    if (emr.chief_complaint_code == "R")
                //    {
                //        lbl_chief_complaint_code_R.Text = "☒";
                //        lbl_chief_complaint_code_E.Text = "❏";
                //        lbl_chief_complaint_code_U.Text = "❏";
                //        lbl_chief_complaint_code_L.Text = "❏";
                //        lbl_chief_complaint_code_N.Text = "❏";

                //    }
                //    else if (emr.chief_complaint_code == "E")
                //    {
                //        lbl_chief_complaint_code_R.Text = "❏";
                //        lbl_chief_complaint_code_E.Text = "☒";
                //        lbl_chief_complaint_code_U.Text = "❏";
                //        lbl_chief_complaint_code_L.Text = "❏";
                //        lbl_chief_complaint_code_N.Text = "❏";

                //    }
                //    else if (emr.chief_complaint_code == "U")
                //    {
                //        lbl_chief_complaint_code_R.Text = "❏";
                //        lbl_chief_complaint_code_E.Text = "❏";
                //        lbl_chief_complaint_code_U.Text = "☒";
                //        lbl_chief_complaint_code_L.Text = "❏";
                //        lbl_chief_complaint_code_N.Text = "❏";

                //    }
                //    else if (emr.chief_complaint_code == "L")
                //    {
                //        lbl_chief_complaint_code_R.Text = "❏";
                //        lbl_chief_complaint_code_E.Text = "❏";
                //        lbl_chief_complaint_code_U.Text = "❏";
                //        lbl_chief_complaint_code_L.Text = "☒";
                //        lbl_chief_complaint_code_N.Text = "❏";

                //    }
                //    else if (emr.chief_complaint_code == "N")
                //    {
                //        lbl_chief_complaint_code_R.Text = "❏";
                //        lbl_chief_complaint_code_E.Text = "❏";
                //        lbl_chief_complaint_code_U.Text = "❏";
                //        lbl_chief_complaint_code_L.Text = "❏";
                //        lbl_chief_complaint_code_N.Text = "☒";

                //    }
                //}
                //if (emr.chief_complaint_code != null)
                //{

                //    lbl_chief_complaint_code_R.Text = "❏";
                //    lbl_chief_complaint_code_E.Text = "❏";
                //    lbl_chief_complaint_code_U.Text = "❏";
                //    lbl_chief_complaint_code_L.Text = "❏";
                //    lbl_chief_complaint_code_N.Text = "❏";
                //}

                //lbl_history_of_present.Text = emr.history_of_present;
                //txtHistoryofPresent.Value = emr.history_of_present;
                ////Meds
                //lbl_past_med_his_meds.Text = emr.past_med_his_meds;
                //txtpastmedhismeds.Value = emr.past_med_his_meds;
                ////Surgical
                //lbl_past_med_his_surs.Text = emr.past_med_his_surs;
                //txtpastmedhissurs.Value = emr.past_med_his_surs;
                //BindCheckBox("cb_habits_", emr.habits, "cde");
                //string habits_temp = emr.habits;
                //if (habits_temp != null && habits_temp != "")
                //{
                //    List<Habits_Temp> Habits_Temps = JsonConvert.DeserializeObject<List<Habits_Temp>>(habits_temp);
                //    lbl_habits_A.Text = "❏";
                //    lbl_habits_S.Text = "❏";
                //    lbl_habits_D.Text = "❏";
                //    foreach (Habits_Temp locAvpu in Habits_Temps)
                //    {

                //        string cde = locAvpu.cde;
                //        if (cde != null)
                //        {
                //            if (cde == "A")
                //            {
                //                lbl_habits_A.Text = "☒";
                //            }
                //            if (cde == "S")
                //            {
                //                lbl_habits_S.Text = "☒";
                //            }
                //            if (cde == "D")
                //            {
                //                lbl_habits_D.Text = "☒";
                //            }
                //        }

                //    }
                //}
                //if (habits_temp == null && habits_temp == "")
                //{
                //    lbl_habits_A.Text = "❏";
                //    lbl_habits_S.Text = "❏";
                //    lbl_habits_D.Text = "❏";
                //}

                //lbl_habits_other.Text = emr.habits_other;
                //txthabitsother.Value = emr.habits_other;
                //lbl_home_medications.Text = emr.home_medications;
                //txthomemedications.Value = emr.home_medications;
                //lbl_allergies.Text = emr.allergies;
                //txtallergies.Value = emr.allergies;
                //lbl_relevant_family_history.Text = emr.relevant_family_history;
                //txtrelevantfamilyhistory.Value = emr.relevant_family_history;
                //lbl_finding.Text = emr.finding;
                //txtfinding.Value = emr.finding;
                //if (emr.required_code != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_required_code_" + emr.required_code)).Checked = true;
                //    if (emr.required_code = true)
                //    {
                //        lbl_required_code_True.Text = "☒";
                //        lbl_required_code_False.Text = "❏";
                //    }
                //    if (emr.required_code = false)
                //    {
                //        lbl_required_code_True.Text = "❏";
                //        lbl_required_code_False.Text = "☒";
                //    }
                //}
                //if (emr.required_code == null)
                //{

                //    lbl_required_code_True.Text = "❏";
                //    lbl_required_code_False.Text = "❏";

                //}

                //lbl_required_text.Text = emr.required_text;
                //txtrequiredtext.Value = emr.required_text;
                //lbl_investigations_results.Text = emr.investigations_results;
                //txtinvestigationsresults.Value = emr.investigations_results;
                //lbl_initial_diagnosis.Text = emr.initial_diagnosis;
                //txtinitialdiagnosis.Value = emr.initial_diagnosis;
                //lbl_diferential_diagnosis.Text = emr.diferential_diagnosis;
                //txtdiferentialdiagnosis.Value = emr.diferential_diagnosis;
                //lbl_associated_conditions.Text = emr.associated_conditions;
                //txtassociatedconditions.Value = emr.associated_conditions;
                //lbl_comfirmed_diagnosis.Text = emr.comfirmed_diagnosis;
                //txtcomfirmeddiagnosis.Value = emr.comfirmed_diagnosis;
                //if (emr.specialist_opinion != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_specialist_opinion_" + emr.specialist_opinion)).Checked = true;
                //    if (emr.specialist_opinion = true)
                //    {
                //        lbl_specialist_opinion_True.Text = "☒";
                //        lbl_specialist_opinion_False.Text = "❏";
                //    }
                //    if (emr.specialist_opinion = false)
                //    {
                //        lbl_specialist_opinion_True.Text = "❏";
                //        lbl_specialist_opinion_False.Text = "☒";
                //    }

                //}

                //if (emr.specialist_opinion == null)
                //{
                //    lbl_specialist_opinion_True.Text = "❏";
                //    lbl_specialist_opinion_False.Text = "❏";
                //}

                //lbl_name_of_specialist.Text = emr.name_of_specialist;
                //txtnameofspecialist.Value = emr.name_of_specialist;
                //if (emr.time_contaced != null)
                //{
                //    rad_time_contaced.SelectedDate = emr.time_contaced;
                //    lbl_time_contaced.Text = emr.time_contaced.ToString("dd/MM/yyyy HH:mm tt");
                //}
                //if (emr.time_provided != null)
                //{
                //    rad_time_provided.SelectedDate = emr.time_provided;
                //    lbl_time_provided.Text = emr.time_provided.ToString("dd/MM/yyyy HH:mm tt");
                //}
                //lbl_spec_opinion_summarised.Text = emr.spec_opinion_summarised;
                //txtspecopinionsummarised.Value = emr.spec_opinion_summarised;

                //_BindGridView(grid_Treatment, WebHelpers.GetJSONToDataTable(emr.treatment));
                //_BindGridView(lbl_Treatment, WebHelpers.GetJSONToDataTable(emr.treatment));
                //_BindGridView(grid_progress_note, WebHelpers.GetJSONToDataTable(emr.progress_note));
                //_BindGridView(lbl_progress_note, WebHelpers.GetJSONToDataTable(emr.progress_note));
                //lbl_conclusions.Text =
                //    txtconclusions.Value = emr.conclusions;
                //if (emr.required_code != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_discharge_" + emr.discharge)).Checked = true;
                //    if (emr.discharge = true)
                //    {
                //        lbl_discharge_True.Text = "☒";
                //        lbl_discharge_False.Text = "❏";
                //    }
                //    if (emr.discharge = false)
                //    {
                //        lbl_discharge_True.Text = "❏";
                //        lbl_discharge_False.Text = "☒";
                //    }

                //}
                //if (emr.required_code == null)
                //{
                //    lbl_discharge_True.Text = "❏";
                //    lbl_discharge_False.Text = "❏";
                //}

                //lbl_prescription.Text =
                //    txtprescription.Value = emr.prescription;
                //lbl_specify_care_instructions.Text =
                //    txtspecifycareinstructions.Value = emr.specify_care_instructions;
                //if (emr.discharge_time != null)
                //{
                //    rad_discharge_time.SelectedDate = emr.discharge_time;
                //    lbl_discharge_time.Text = WebHelpers.FormatDateTime(emr.discharge_time, "dd/MM/yyyy HH:mm tt");
                //}
                //if (emr.referred_to_OPD != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_referred_OPD_" + emr.referred_to_OPD)).Checked = true;
                //    if (emr.referred_to_OPD = true)
                //    {
                //        lbl_referred_OPD_True.Text = "☒";
                //        lbl_referred_OPD_False.Text = "❏";
                //    }
                //    if (emr.referred_to_OPD = false)
                //    {
                //        lbl_referred_OPD_True.Text = "❏";
                //        lbl_referred_OPD_False.Text = "☒";
                //    }
                //}
                //if (emr.referred_to_OPD == null)
                //{

                //    lbl_referred_OPD_True.Text = "❏";
                //    lbl_referred_OPD_False.Text = "❏";

                //}

                //txtreferredtoOPDtext.Value = emr.referred_to_OPD_text;
                //lbl_referred_to_OPD_text.Text = emr.referred_to_OPD_text;
                //if (emr.hospitalisation_required != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_hospitalisation_required_" + emr.hospitalisation_required)).Checked = true;
                //    if (emr.hospitalisation_required = true)
                //    {
                //        lbl_hospitalisation_required_True.Text = "☒";
                //        lbl_hospitalisation_required_False.Text = "❏";
                //    }
                //    if (emr.hospitalisation_required = false)
                //    {
                //        lbl_hospitalisation_required_True.Text = "❏";
                //        lbl_hospitalisation_required_False.Text = "☒";
                //    }
                //}
                //if (emr.hospitalisation_required == null)
                //{

                //    lbl_hospitalisation_required_True.Text = "❏";
                //    lbl_hospitalisation_required_False.Text = "❏";

                //}

                //txtreason.Value = emr.reason;
                //lbl_reason.Text = emr.reason;
                //txtward.Value = emr.ward;
                //lbl_ward.Text = emr.ward;

                //if (emr.discharge_time != null)
                //{
                //    rad_timeofleavingemergency.SelectedDate = emr.time_of_leaving_emergency;
                //    lbl_time_of_leaving_emergency.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emergency, "dd/MM/yyyy HH:mm tt");
                //}
                //if (emr.emergency_surgery != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_emergency_surgery_" + emr.emergency_surgery)).Checked = true;
                //    if (emr.emergency_surgery = true)
                //    {
                //        lbl_emergency_surgery_True.Text = "☒";
                //        lbl_emergency_surgery_False.Text = "❏";
                //    }
                //    if (emr.emergency_surgery = false)
                //    {
                //        lbl_emergency_surgery_True.Text = "❏";
                //        lbl_emergency_surgery_False.Text = "☒";
                //    }
                //}
                //if (emr.emergency_surgery == null)
                //{

                //    lbl_emergency_surgery_True.Text = "❏";
                //    lbl_emergency_surgery_False.Text = "❏";

                //}

                //txtpreoperative_diagnosis.Value = emr.pre_operative_diagnosis;
                //lbl_preoperative_diagnosis.Text = emr.pre_operative_diagnosis;
                //txtprebrief_summary.Value = emr.brief_summary;
                //lbl_brief_summary.Text = emr.pre_operative_diagnosis;

                //if (emr.time_of_leaving_emer_e != null)
                //{
                //    rad_time_of_leaving_emer_e.SelectedDate = emr.time_of_leaving_emer_e;
                //    lbl_time_of_leaving_emer_e.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emer_e, "dd/MM/yyyy HH:mm tt");
                //}
                //if (emr.transfer_hospital != null)
                //{
                //    ((HtmlInputRadioButton)FindControl("rad_transfer_hospital_" + emr.transfer_hospital)).Checked = true;
                //    if (emr.transfer_hospital = true)
                //    {
                //        lbl_transfer_hospital_True.Text = "☒";
                //        lbl_transfer_hospital_False.Text = "❏";
                //    }
                //    if (emr.transfer_hospital = false)
                //    {
                //        lbl_transfer_hospital_True.Text = "❏";
                //        lbl_transfer_hospital_False.Text = "☒";
                //    }
                //}
                //if (emr.transfer_hospital == null)
                //{

                //    lbl_transfer_hospital_True.Text = "❏";
                //    lbl_transfer_hospital_False.Text = "❏";

                //}

                //txtreasonfor_transfer.Value = emr.reason_for_transfer;
                //lbl_reason_for_transfer.Text = emr.reason_for_transfer;
                //txtstatus_before_transfer.Value = emr.status_before_transfer;
                //lbl_status_before_transfer.Text = emr.status_before_transfer;
                //if (emr.time_of_leaving_emer_a != null)
                //{
                //    rad_time_of_leaving_emer_a.SelectedDate = emr.time_of_leaving_emer_a;
                //    lbl_time_of_leaving_emer_a.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emer_a, "dd/MM/yyyy HH:mm tt");
                //}
                //BindCheckBox("cb_patient_discharge_", emr.patient_discharge, "cde");
                //string patient_discharge_temp = emr.patient_discharge;
                //if (patient_discharge_temp != null && patient_discharge_temp != "")
                //{
                //    List<PDT> patient_discharge_temps = JsonConvert.DeserializeObject<List<PDT>>(patient_discharge_temp);
                //    lbl_patient_discharge_IMP.Text = "❏";
                //    lbl_patient_discharge_UNC.Text = "❏";
                //    lbl_patient_discharge_UNS.Text = "❏";
                //    foreach (PDT PDTS in patient_discharge_temps)
                //    {

                //        string cde = PDTS.cde;
                //        if (cde != null)
                //        {
                //            if (cde == "IMP")
                //            {
                //                lbl_patient_discharge_IMP.Text = "☒";
                //            }
                //            if (cde == "UNC")
                //            {
                //                lbl_patient_discharge_UNC.Text = "☒";
                //            }
                //            if (cde == "UNS")
                //            {
                //                lbl_patient_discharge_UNS.Text = "☒";
                //            }
                //        }

                //    }
                //}
                //if (patient_discharge_temp == null || patient_discharge_temp == "")
                //{
                //    lbl_patient_discharge_IMP.Text = "❏";
                //    lbl_patient_discharge_UNC.Text = "❏";
                //    lbl_patient_discharge_UNS.Text = "❏";
                //}

                //txt_patient_discharge.Value = emr.txt_patient_discharge;
                //lbl_patient_discharge.Text = emr.txt_patient_discharge;
                //txticd_10.Value = emr.icd_10;
                //lbl_icd_10.Text = emr.icd_10;


                //lbl_date.Text = emr.created_date_time.ToString("dd");
                //lbl_month.Text = emr.created_date_time.ToString("MM");
                //lbl_year.Text = emr.created_date_time.ToString("yyyy");
                //lbl_created_name_l.Text = emr.created_name_l;

                WebHelpers.BindDateTimePicker(rad_evaluation_time, emr.evaluation_time);
                txt_chief_complaint.Value = emr.chief_complaint;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_chief_complaint_code_" + emr.chief_complaint_code);
                txt_history_of_present.Value = emr.history_of_present;
                txt_past_med_his_meds.Value = emr.past_med_his_meds;
                txt_past_med_his_surs.Value = emr.past_med_his_surs;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_habits_" + emr.habits);
                txt_habits_other.Value = emr.habits_other;
                txt_home_medications.Value = emr.home_medications;
                txt_allergies.Value = emr.allergies;
                txt_relevant_family_history.Value = emr.relevant_family_history;
                txt_finding.Value = emr.finding;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_required_code_" + emr.required_code);
                txt_required_text.Value = emr.required_text;
                txt_investigations_results.Value = emr.investigations_results;
                txt_initial_diagnosis.Value = emr.initial_diagnosis;
                txt_diferential_diagnosis.Value = emr.diferential_diagnosis;
                txt_associated_conditions.Value = emr.associated_conditions;
                txt_comfirmed_diagnosis.Value = emr.comfirmed_diagnosis;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_specialist_opinion_" + emr.specialist_opinion);
                txt_name_of_specialist.Value = emr.name_of_specialist;
                WebHelpers.BindDateTimePicker(dtpk_time_contaced, emr.time_contaced);
                WebHelpers.BindDateTimePicker(dtpk_time_provided, emr.time_provided);
                txt_spec_opinion_summarised.Value = emr.spec_opinion_summarised;
                ViewState[grid_Treatment.ID] = WebHelpers.DataBind(grid_Treatment, WebHelpers.GetJSONToDataTable(emr.treatment));
                ViewState[grid_progress_note.ID] = WebHelpers.DataBind(grid_progress_note, WebHelpers.GetJSONToDataTable(emr.progress_note));
                txt_conclusions.Value = emr.conclusions;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_discharge_" + emr.discharge);
                txt_prescription.Value = emr.prescription;
                txt_specify_care_instructions.Value = emr.specify_care_instructions;
                WebHelpers.BindDateTimePicker(dtpk_discharge_time, emr.discharge_time);
                //3
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_referred_OPD_" + emr.referred_to_OPD);
                txt_referred_to_OPD_text.Value = emr.referred_to_OPD_text;
                //4
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hospitalisation_required_" + emr.hospitalisation_required);
                txt_reason.Value = emr.reason;
                txt_ward.Value = emr.ward;
                WebHelpers.BindDateTimePicker(dtpk_time_of_leaving_emergency, emr.time_of_leaving_emergency);
                //5
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_emergency_surgery_" + emr.emergency_surgery);
                txt_pre_operative_diagnosis.Value = emr.pre_operative_diagnosis;
                txt_brief_summary.Value = emr.brief_summary;
                WebHelpers.BindDateTimePicker(rad_time_of_leaving_emer_e, emr.time_of_leaving_emer_e);
                //6
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_transfer_hospital_" + emr.transfer_hospital);
                txt_reason_for_transfer.Value = emr.reason_for_transfer;
                txt_status_before_transfer.Value = emr.status_before_transfer;
                WebHelpers.BindDateTimePicker(rad_time_of_leaving_emer_a, emr.time_of_leaving_emer_a);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_patient_discharge_" + emr.patient_discharge);
                txt_patient_discharge.Value = emr.txt_patient_discharge;
                txt_icd_10.Value = emr.icd_10;

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "localStorage_setItem", $"window.sessionStorage.setItem('{emr.document_id}', '{JsonConvert.SerializeObject(emr)}');", true);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(EmergencyMedicalRecord emr)
        {


        }
        private void BindingDataFormPrint(EmergencyMedicalRecord emr)
        {


        }
        #endregion


        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                EmergencyMedicalRecord emr = new EmergencyMedicalRecord(DataHelpers.varDocId);
                emr.status = DocumentStatus.FINAL;
                emr.user_name = (string)Session["UserID"];

                UpdateData(emr);
            }

            //emr = new EmergencyMedicalRecord(DataHelpers.varDocId);
            //emr.user_name = (string)Session["UserID"];
            //emr.status = DocumentStatus.FINAL;
            //emr.amend_reason = txt_amendReason.Value;
            //if (rad_evaluation_time.SelectedDate != null)
            //{
            //    emr.evaluation_time = DataHelpers.ConvertSQLDateTime(rad_evaluation_time.SelectedDate);
            //}

            //emr.chief_complaint = txtChiefComplaint.Value;
            //foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.ChiefComplaintCode)
            //{
            //    if (((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + code.Key.ToLower())).Checked)
            //    {
            //        emr.chief_complaint_code = code.Key;
            //        emr.chief_complaint_desc = code.Value;
            //    }
            //}
            //emr.history_of_present = txtHistoryofPresent.Value;
            //emr.past_med_his_meds = txtpastmedhismeds.Value;
            //emr.past_med_his_surs = txtpastmedhissurs.Value;

            //DataTable habits = new DataTable();
            //habits.Columns.Add("cde");
            //habits.Columns.Add("desc");
            //DataRow habits_row;

            //foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.Habits)
            //{
            //    if (((HtmlInputCheckBox)FindControl("cb_habits_" + code.Key.ToLower())).Checked)
            //    {
            //        habits_row = habits.NewRow();
            //        habits_row["cde"] = code.Key;
            //        habits_row["desc"] = code.Value;
            //        habits.Rows.Add(habits_row);
            //        if (code.Key == "O")
            //        {
            //            emr.habits_other = txthabitsother.Value;
            //        }
            //        else
            //        {
            //            emr.habits_other = "";
            //        }
            //    }
            //}
            //emr.habits = WebHelpers.GetDataTableToJSON(habits);

            //emr.home_medications = txthomemedications.Value;
            //emr.allergies = txtallergies.Value;
            //emr.relevant_family_history = txtrelevantfamilyhistory.Value;
            //emr.finding = txtfinding.Value;
            //if (rad_required_code_True.Checked)
            //{
            //    emr.required_code = true;
            //    emr.required_text = txtrequiredtext.Value;
            //}
            //if (rad_required_code_False.Checked)
            //{
            //    emr.required_code = false;
            //    emr.required_text = "";
            //}
            //emr.investigations_results = txtinvestigationsresults.Value;
            //emr.initial_diagnosis = txtinitialdiagnosis.Value;
            //emr.diferential_diagnosis = txtdiferentialdiagnosis.Value;
            //emr.associated_conditions = txtassociatedconditions.Value;
            //emr.comfirmed_diagnosis = txtcomfirmeddiagnosis.Value;
            //if (rad_specialist_opinion_True.Checked)
            //{
            //    emr.specialist_opinion = true;
            //    emr.name_of_specialist = txtnameofspecialist.Value;
            //    emr.time_contaced = DataHelpers.ConvertSQLDateTime(rad_time_contaced.SelectedDate);
            //    emr.time_provided = DataHelpers.ConvertSQLDateTime(rad_time_provided.SelectedDate);
            //    emr.spec_opinion_summarised = txtspecopinionsummarised.Value;

            //}
            //if (rad_specialist_opinion_False.Checked)
            //{
            //    emr.specialist_opinion = false;
            //    emr.name_of_specialist = "";
            //    emr.time_contaced = null;
            //    emr.time_provided = null;
            //    emr.spec_opinion_summarised = "";

            //}
            //DataTable Treatment_tb = new DataTable();
            //foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.Treatment)
            //{
            //    Treatment_tb.Columns.Add(col.Key);
            //}
            //emr.treatment = WebHelpers.GetJSONFromTable(grid_Treatment, Treatment_tb);
            //DataTable Progress_note_tb = new DataTable();
            //foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.ProgressNote)
            //{
            //    Progress_note_tb.Columns.Add(col.Key);
            //}
            //emr.progress_note = WebHelpers.GetJSONFromTable(grid_progress_note, Progress_note_tb);
            //emr.conclusions = txtconclusions.Value;
            //if (rad_discharge_True.Checked)
            //{
            //    emr.discharge = true;
            //    emr.prescription = txtprescription.Value;
            //    emr.specify_care_instructions = txtspecifycareinstructions.Value;
            //    emr.discharge_time = DataHelpers.ConvertSQLDateTime(rad_discharge_time.SelectedDate);

            //}
            //if (rad_discharge_False.Checked)
            //{
            //    emr.discharge = false;
            //    emr.prescription = "";
            //    emr.specify_care_instructions = "";
            //    emr.discharge_time = null;
            //}
            //if (rad_referred_OPD_True.Checked)
            //{
            //    emr.referred_to_OPD = true;
            //    emr.referred_to_OPD_text = txtreferredtoOPDtext.Value;
            //}
            //if (rad_referred_OPD_False.Checked)
            //{
            //    emr.referred_to_OPD = false;
            //    emr.referred_to_OPD_text = "";

            //}
            //if (rad_hospitalisation_required_True.Checked)
            //{
            //    emr.hospitalisation_required = true;
            //    emr.reason = txtreason.Value;
            //    emr.ward = txtward.Value;
            //    emr.time_of_leaving_emergency = DataHelpers.ConvertSQLDateTime(rad_timeofleavingemergency.SelectedDate);
            //}
            //if (rad_hospitalisation_required_False.Checked)
            //{
            //    emr.hospitalisation_required = false;
            //    emr.reason = "";
            //    emr.ward = "";
            //    emr.time_of_leaving_emergency = null;
            //}
            //if (rad_emergency_surgery_True.Checked)
            //{
            //    emr.emergency_surgery = true;
            //    emr.pre_operative_diagnosis = txtpreoperative_diagnosis.Value;
            //    emr.brief_summary = txtprebrief_summary.Value;
            //    emr.time_of_leaving_emer_e = DataHelpers.ConvertSQLDateTime(rad_time_of_leaving_emer_e.SelectedDate);
            //}
            //if (rad_emergency_surgery_False.Checked)
            //{
            //    emr.emergency_surgery = false;
            //    emr.pre_operative_diagnosis = "";
            //    emr.brief_summary = "";
            //    emr.time_of_leaving_emer_e = null;
            //}
            //if (rad_transfer_hospital_True.Checked)
            //{
            //    emr.transfer_hospital = true;
            //    emr.reason_for_transfer = txtreasonfor_transfer.Value;
            //    emr.status_before_transfer = txtstatus_before_transfer.Value;
            //    emr.time_of_leaving_emer_a = DataHelpers.ConvertSQLDateTime(rad_time_of_leaving_emer_a.SelectedDate);
            //}
            //if (rad_transfer_hospital_False.Checked)
            //{
            //    emr.transfer_hospital = false;
            //    emr.reason_for_transfer = "";
            //    emr.status_before_transfer = "";
            //    emr.time_of_leaving_emer_a = null;
            //}
            //DataTable patient_discharge = new DataTable();
            //patient_discharge.Columns.Add("cde");
            //patient_discharge.Columns.Add("desc");
            //DataRow patient_discharge_row;

            //foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.PatientDischarge)
            //{
            //    if (((HtmlInputCheckBox)FindControl("cb_patient_discharge_" + code.Key.ToLower())).Checked)
            //    {
            //        patient_discharge_row = patient_discharge.NewRow();
            //        patient_discharge_row["cde"] = code.Key;
            //        patient_discharge_row["desc"] = code.Value;
            //        patient_discharge.Rows.Add(patient_discharge_row);
            //    }
            //}
            //emr.patient_discharge = WebHelpers.GetDataTableToJSON(patient_discharge);
            //emr.txt_patient_discharge = txt_patient_discharge.Value;
            //emr.icd_10 = txticd_10.Value;

            //dynamic result = emr.Update()[0];

            //if (result.Status == System.Net.HttpStatusCode.OK)
            //{
            //    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
            //    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

            //    Initial();
            //}
            //else
            //{
            //    Session["PageNotFound"] = result[0];
            //    Response.Redirect("../Other/PageNotFound.aspx", false);
            //}
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                emr = new EmergencyMedicalRecord(DataHelpers.varDocId);
                emr.status = DocumentStatus.DRAFT;
                emr.user_name = (string)Session["UserID"];

                UpdateData(emr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = EmergencyMedicalRecord.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    string pid = Request["pid"];
                    string vpid = Request["vpid"];

                    Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            EmergencyMedicalRecord emr = new EmergencyMedicalRecord(Request.QueryString["docId"]);
            string emp_id = (string)Session["emp_id"];

            if (WebHelpers.CanOpenForm(Page, emr.document_id, emr.status, emp_id, (string)Session["location"]))
            {

                txt_amend_reason.Text = "";
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, emr, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(emr);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                EmergencyMedicalRecord emr = new EmergencyMedicalRecord(Request.QueryString["docId"]);
                BindingDataFormPrint(emr);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
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
        protected void btn_grid_Treatment_add_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState[grid_Treatment.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_Treatment.ID], grid_Treatment, EmergencyMedicalRecord.Treatment);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void grid_Treatment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_progress_note_add_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState[grid_progress_note.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_progress_note.ID], grid_progress_note, EmergencyMedicalRecord.ProgressNote);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void grid_progress_note_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        #endregion

        #region Functions
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                EmergencyMedicalRecord mc = new EmergencyMedicalRecord(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                //prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (mc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.View, (string)Session["location"]));

                }
                else if (mc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, mc.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void UpdateData(EmergencyMedicalRecord emr)
        {
            try
            {
                emr.amend_reason = txt_amend_reason.Text;
                emr.evaluation_time = DataHelpers.ConvertSQLDateTime(rad_evaluation_time.SelectedDate);

                emr.chief_complaint = txt_chief_complaint.Value;

                emr.chief_complaint_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_chief_complaint_code_", EmergencyMedicalRecord.ChiefComplaintCode);
                emr.chief_complaint_code = WebHelpers.GetDicDesc(emr.chief_complaint_code, EmergencyMedicalRecord.ChiefComplaintCode);

                emr.history_of_present = txt_history_of_present.Value;
                emr.past_med_his_meds = txt_past_med_his_meds.Value;
                emr.past_med_his_surs = txt_past_med_his_surs.Value;

                WebHelpers.GetCheckBox(form1, "cb_habits_", EmergencyMedicalRecord.Habits, out DataTable habits, "cde");

                if (cb_habits_O.Checked)
                {
                    DataRow dtRow = habits.NewRow();

                    dtRow["cde"] = "OTH";
                    dtRow["desc"] = txt_habits_other.Value;
                    habits.Rows.Add(dtRow);
                }
                emr.habits = JsonConvert.SerializeObject(habits);

                emr.home_medications = txt_home_medications.Value;
                emr.allergies = txt_allergies.Value;
                emr.relevant_family_history = txt_relevant_family_history.Value;
                emr.finding = txt_finding.Value;

                if (rad_required_code_True.Checked)
                {
                    emr.required_code = true;
                    emr.required_text = txt_required_text.Value;
                }
                if (rad_required_code_False.Checked)
                {
                    emr.required_code = false;
                    emr.required_text = "";
                }

                emr.investigations_results = txt_investigations_results.Value;
                emr.initial_diagnosis = txt_initial_diagnosis.Value;
                emr.diferential_diagnosis = txt_diferential_diagnosis.Value;
                emr.associated_conditions = txt_associated_conditions.Value;
                emr.comfirmed_diagnosis = txt_comfirmed_diagnosis.Value;

                if (rad_specialist_opinion_True.Checked)
                {
                    emr.specialist_opinion = true;
                    emr.name_of_specialist = txt_name_of_specialist.Value;
                    emr.time_contaced = DataHelpers.ConvertSQLDateTime(dtpk_time_contaced.SelectedDate);
                    emr.time_provided = DataHelpers.ConvertSQLDateTime(dtpk_time_provided.SelectedDate);
                    emr.spec_opinion_summarised = txt_spec_opinion_summarised.Value;

                }
                if (rad_specialist_opinion_False.Checked)
                {
                    emr.specialist_opinion = false;
                    emr.name_of_specialist = "";
                    emr.time_contaced = null;
                    emr.time_provided = null;
                    emr.spec_opinion_summarised = "";

                }
                //DataTable Treatment_tb = new DataTable();
                //foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.Treatment)
                //{
                //    Treatment_tb.Columns.Add(col.Key);
                //}
                emr.treatment = WebHelpers.GetDataGridView(grid_Treatment, EmergencyMedicalRecord.Treatment);

                //DataTable Progress_note_tb = new DataTable();
                //foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.ProgressNote)
                //{
                //    Progress_note_tb.Columns.Add(col.Key);
                //}
                //emr.progress_note = WebHelpers.GetJSONFromTable(grid_progress_note, Progress_note_tb);
                emr.progress_note = WebHelpers.GetDataGridView(grid_progress_note, EmergencyMedicalRecord.ProgressNote);

                emr.conclusions = txt_conclusions.Value;
                if (rad_discharge_True.Checked)
                {
                    emr.discharge = true;
                    emr.prescription = txt_prescription.Value;
                    emr.specify_care_instructions = txt_specify_care_instructions.Value;
                    emr.discharge_time = DataHelpers.ConvertSQLDateTime(dtpk_discharge_time.SelectedDate);

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
                    emr.referred_to_OPD_text = txt_referred_to_OPD_text.Value;
                }
                if (rad_referred_OPD_False.Checked)
                {
                    emr.referred_to_OPD = false;
                    emr.referred_to_OPD_text = "";

                }
                if (rad_hospitalisation_required_True.Checked)
                {
                    emr.hospitalisation_required = true;
                    emr.reason = txt_reason.Value;
                    emr.ward = txt_ward.Value;
                    emr.time_of_leaving_emergency = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emergency.SelectedDate);
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
                    emr.pre_operative_diagnosis = txt_pre_operative_diagnosis.Value;
                    emr.brief_summary = txt_brief_summary.Value;
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
                    emr.reason_for_transfer = txt_reason_for_transfer.Value;
                    emr.status_before_transfer = txt_status_before_transfer.Value;
                    emr.time_of_leaving_emer_a = DataHelpers.ConvertSQLDateTime(rad_time_of_leaving_emer_a.SelectedDate);
                }
                if (rad_transfer_hospital_False.Checked)
                {
                    emr.transfer_hospital = false;
                    emr.reason_for_transfer = "";
                    emr.status_before_transfer = "";
                    emr.time_of_leaving_emer_a = null;
                }

                emr.patient_discharge = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_patient_discharge_", EmergencyMedicalRecord.PatientDischarge, "cde");

                //DataTable patient_discharge = new DataTable();
                //patient_discharge.Columns.Add("cde");
                //patient_discharge.Columns.Add("desc");
                //DataRow patient_discharge_row;

                //foreach (KeyValuePair<string, string> code in EmergencyMedicalRecord.PatientDischarge)
                //{
                //    if (((HtmlInputCheckBox)FindControl("cb_patient_discharge_" + code.Key.ToLower())).Checked)
                //    {
                //        patient_discharge_row = patient_discharge.NewRow();
                //        patient_discharge_row["cde"] = code.Key;
                //        patient_discharge_row["desc"] = code.Value;
                //        patient_discharge.Rows.Add(patient_discharge_row);
                //    }
                //}
                //emr.patient_discharge = WebHelpers.GetDataTableToJSON(patient_discharge);
                //emr.txt_patient_discharge = txt_patient_discharge.Value;
                emr.icd_10 = txt_icd_10.Value;

                dynamic result = emr.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

    }
}
using EMR.UserControls;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.ER
{
    public partial class EmerMedRec : System.Web.UI.Page
    {
        EmergencyMedicalRecord emr;
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

            PAGE_URL = $"/ER/EmerMedRec.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }

            PostBackEventHandler();
        }
        private void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "hos_req_change":
                    hos_req_change(Request["__EVENTARGUMENT"]);
                    break;
                case "emergency_surgery_change":
                    emergency_surgery_change(Request["__EVENTARGUMENT"]);
                    break;
                case "transfer_hospital_change":
                    transfer_hospital_change(Request["__EVENTARGUMENT"]);
                    break;
                case "specialist_opinion_change":
                    specialist_opinion_change(Request["__EVENTARGUMENT"]);
                    break;
                case "discharge_change":
                    discharge_change(Request["__EVENTARGUMENT"]);
                    break;
            }
        }
        private void discharge_change(string value = "")
        {
            if (value == "clear") { rad_discharge_True.Checked = rad_discharge_False.Checked = false; }
            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, discharge_field, discharge_field1, discharge_field2);
                return;
            }
            WebHelpers.VisibleControl(rad_discharge_True.Checked, discharge_field, discharge_field1, discharge_field2);
        }
        private void specialist_opinion_change(string value = "")
        {

            if (value == "clear") {
                rad_specialist_opinion_True.Checked = rad_specialist_opinion_False.Checked = false;
            }
            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, specialist_opinion_field, specialist_opinion_field1, specialist_opinion_field2);
                return;
            }
            WebHelpers.VisibleControl(rad_specialist_opinion_True.Checked, specialist_opinion_field, specialist_opinion_field1, specialist_opinion_field2);
        }
        private void transfer_hospital_change(string value = "")
        {
            if (value == "clear") 
            { 
                rad_transfer_hospital_True.Checked = rad_transfer_hospital_False.Checked = false; 
            }
            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, transfer_hos_field, transfer_hos_field1, transfer_hos_field2);
                return;
            }
            WebHelpers.VisibleControl(rad_transfer_hospital_True.Checked, transfer_hos_field, transfer_hos_field1, transfer_hos_field2);
        }
        private void emergency_surgery_change(string value = "")
        {
            if (value == "clear")
            { rad_emergency_surgery_True.Checked = rad_emergency_surgery_False.Checked = false; }
            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, emr_sur_field, emr_sur_field1, emr_sur_field2);
                return;
            }
            WebHelpers.VisibleControl(rad_emergency_surgery_True.Checked, emr_sur_field, emr_sur_field1, emr_sur_field2);
        }
        private void hos_req_change(string value = "")
        {
            if (value == "clear") { rad_hospitalisation_required_True.Checked = rad_hospitalisation_required_False.Checked = false; }
            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, hos_req_field);
                return;
            }
            WebHelpers.VisibleControl(rad_hospitalisation_required_True.Checked, hos_req_field);
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
                txt_amend_reason.Text = "";
                WebHelpers.BindDateTimePicker(dtpk_evaluation_time, emr.evaluation_time);
                txt_chief_complaint.Value = emr.chief_complaint;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_chief_complaint_code_" + emr.chief_complaint_code);
                txt_history_of_present.Value = emr.history_of_present;
                txt_past_med_his_meds.Value = emr.past_med_his_meds;
                txt_past_med_his_surs.Value = emr.past_med_his_surs;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_habits_", WebHelpers.GetJSONToDataTable(emr.habits), "cde");
                txt_habits_other.Value = emr.habits_other;
                txt_home_medications.Value = emr.home_medications;
                txt_allergies.Value = emr.allergies;
                txt_relevant_family_history.Value = emr.relevant_family_history;
                txt_finding.Value = emr.finding;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_required_code_" + emr.required_code, "false");
                txt_required_text.Value = emr.required_text;
                txt_investigations_results.Value = emr.investigations_results;
                txt_initial_diagnosis.Value = emr.initial_diagnosis;
                txt_diferential_diagnosis.Value = emr.diferential_diagnosis;
                txt_associated_conditions.Value = emr.associated_conditions;
                txt_comfirmed_diagnosis.Value = emr.comfirmed_diagnosis;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_specialist_opinion_" + emr.specialist_opinion, "false");
                specialist_opinion_change(Convert.ToString(emr.specialist_opinion));
                txt_name_of_specialist.Value = emr.name_of_specialist;
                WebHelpers.BindDateTimePicker(dtpk_time_contaced, emr.time_contaced);
                WebHelpers.BindDateTimePicker(dtpk_time_provided, emr.time_provided);
                txt_spec_opinion_summarised.Value = emr.spec_opinion_summarised;
                
                ViewState[grid_Treatment.ID] = WebHelpers.BindingDataGridView(grid_Treatment, WebHelpers.GetJSONToDataTable(emr.treatment), EmergencyMedicalRecord.Treatment, btn_grid_Treatment_add);

                ViewState[grid_progress_note.ID] = WebHelpers.BindingDataGridView(grid_progress_note, WebHelpers.GetJSONToDataTable(emr.progress_note), EmergencyMedicalRecord.ProgressNote, btn_grid_progress_note_add);

                txt_conclusions.Value = emr.conclusions;
                //2
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_discharge_" + emr.discharge, "false");
                discharge_change(Convert.ToString(emr.discharge));
                txt_prescription.Value = emr.prescription;
                txt_specify_care_instructions.Value = emr.specify_care_instructions;
                WebHelpers.BindDateTimePicker(dtpk_discharge_time, emr.discharge_time);
                //3
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_referred_to_OPD_" + emr.referred_to_OPD, "false");
                txt_referred_to_OPD_text.Value = emr.referred_to_OPD_text;
                //4
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hospitalisation_required_" + emr.hospitalisation_required, "false");
                txt_reason.Value = emr.reason;
                txt_ward.Value = emr.ward;
                WebHelpers.BindDateTimePicker(dtpk_time_of_leaving_emergency, emr.time_of_leaving_emergency);
                hos_req_change(Convert.ToString(emr.hospitalisation_required));
                //5
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_emergency_surgery_" + emr.emergency_surgery, "false");
                txt_pre_operative_diagnosis.Value = emr.pre_operative_diagnosis;
                txt_brief_summary.Value = emr.brief_summary;
                WebHelpers.BindDateTimePicker(dtpk_time_of_leaving_emer_e, emr.time_of_leaving_emer_e);
                emergency_surgery_change(Convert.ToString(emr.emergency_surgery));
                //6
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_transfer_hospital_" + emr.transfer_hospital, "false");
                txt_reason_for_transfer.Value = emr.reason_for_transfer;
                txt_status_before_transfer.Value = emr.status_before_transfer;
                WebHelpers.BindDateTimePicker(dtpk_time_of_leaving_emer_a, emr.time_of_leaving_emer_a);
                transfer_hospital_change(Convert.ToString(emr.transfer_hospital));
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_patient_discharge_", WebHelpers.GetJSONToDataTable(emr.patient_discharge), "cde");
                txt_patient_discharge.Value = emr.txt_patient_discharge;
                //
                txt_icd_10.Value = emr.icd_10;

                //DataObj.Value = JsonConvert.SerializeObject(emr);
                Session["docid"] = emr.document_id;
                WebHelpers.AddScriptFormEdit(Page, emr, (string)Session["emp_id"], loc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(EmergencyMedicalRecord emr)
        {
            try
            {
                
                lbl_evaluation_time.Text = WebHelpers.FormatDateTime(emr.evaluation_time, "dd-MMM-yyyy HH:mm");
                lbl_chief_complaint.Text = WebHelpers.FormatString(emr.chief_complaint);
                lbl_chief_complaint_desc.Text = WebHelpers.FormatString(emr.chief_complaint_desc);
                lbl_history_of_present.Text = WebHelpers.FormatString(emr.history_of_present);
                lbl_past_med_his_meds.Text = WebHelpers.FormatString(emr.past_med_his_meds);
                lbl_past_med_his_surs.Text = WebHelpers.FormatString(emr.past_med_his_surs);

                lbl_habits.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(emr.habits));
                lbl_habits.Text += WebHelpers.FormatString(emr.habits_other);
                lbl_home_medications.Text = WebHelpers.FormatString(emr.home_medications);
                lbl_allergies.Text = WebHelpers.FormatString(emr.allergies);
                lbl_relevant_family_history.Text = WebHelpers.FormatString(emr.relevant_family_history);

                lbl_finding.Text = WebHelpers.FormatString(emr.finding);
                lbl_required_code.Text = WebHelpers.FormatString(WebHelpers.GetBool(emr.required_code));
                lbl_required_code.Text += WebHelpers.FormatString(emr.required_text);
                lbl_investigations_results.Text = WebHelpers.FormatString(emr.investigations_results);
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(emr.initial_diagnosis);
                lbl_diferential_diagnosis.Text = WebHelpers.FormatString(emr.diferential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.FormatString(emr.associated_conditions);
                lbl_comfirmed_diagnosis.Text = WebHelpers.FormatString(emr.comfirmed_diagnosis);
                lbl_specialist_opinion.Text = WebHelpers.FormatString(WebHelpers.GetBool(emr.specialist_opinion));
                
                specialist_opinion_change(Convert.ToString(emr.specialist_opinion));
                
                lbl_name_of_specialist.Text = WebHelpers.FormatString(emr.name_of_specialist);
                lbl_time_contaced.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(emr.time_contaced));
                lbl_time_provided.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(emr.time_provided));

                lbl_spec_opinion_summarised.Text = WebHelpers.FormatString(emr.spec_opinion_summarised);

                WebHelpers.LoadDataGridView(grid_Treatment, WebHelpers.GetJSONToDataTable(emr.treatment), Iina.SKIN_ANNO, btn_grid_Treatment_add);

                WebHelpers.LoadDataGridView(grid_progress_note, WebHelpers.GetJSONToDataTable(emr.progress_note), Iina.SKIN_ANNO, btn_grid_progress_note_add);

                WebHelpers.VisibleControl(false, btn_grid_Treatment_add, btn_grid_progress_note_add);

                lbl_conclusions.Text = WebHelpers.FormatString(emr.conclusions);
                lbl_discharge.Text = WebHelpers.FormatString(WebHelpers.GetBool(emr.discharge));
                lbl_prescription.Text = WebHelpers.FormatString(emr.prescription);
                lbl_specify_care_instructions.Text = WebHelpers.FormatString(emr.specify_care_instructions);
                lbl_discharge_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(emr.discharge_time, "dd-MMM-yyyy HH:mm"));
                lbl_referred_to_OPD.Text = WebHelpers.FormatString(WebHelpers.GetBool(emr.referred_to_OPD, "Yes,specify/ Có, ghi rõ" + "<br/>" + WebHelpers.FormatString(emr.referred_to_OPD_text)));
                
                lbl_hospitalisation_required.Text = WebHelpers.FormatString(WebHelpers.GetBool(emr.hospitalisation_required));
                lbl_reason.Text = WebHelpers.FormatString(emr.reason);
                lbl_ward.Text = WebHelpers.FormatString(emr.ward);
                lbl_time_of_leaving_emergency.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(emr.time_of_leaving_emergency, "dd-MMM-yyyy HH:mm"));
                lbl_emergency_surgery.Text = WebHelpers.FormatString(WebHelpers.GetBool(emr.emergency_surgery));
                lbl_pre_operative_diagnosis.Text = WebHelpers.FormatString(emr.pre_operative_diagnosis);
                lbl_brief_summary.Text = WebHelpers.FormatString(emr.brief_summary);
                lbl_time_of_leaving_emer_e.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(emr.time_of_leaving_emer_e, "dd-MMM-yyyy HH:mm"));

                if (emr.hospitalisation_required != null)
                {
                    rad_hospitalisation_required_True.Checked = emr.hospitalisation_required;
                }

                hos_req_change(Convert.ToString(emr.hospitalisation_required));

                if (emr.emergency_surgery != null)
                {
                    rad_emergency_surgery_True.Checked = emr.emergency_surgery;
                }

                emergency_surgery_change(Convert.ToString(emr.emergency_surgery));

                if (emr.transfer_hospital != null)
                {
                    rad_transfer_hospital_True.Checked = emr.transfer_hospital;
                }

                transfer_hospital_change(Convert.ToString(emr.transfer_hospital));

                lbl_transfer_hospital.Text = WebHelpers.FormatString(WebHelpers.GetBool(emr.transfer_hospital));
                lbl_reason_for_transfer.Text = WebHelpers.FormatString(emr.reason_for_transfer);
                lbl_status_before_transfer.Text = WebHelpers.FormatString(emr.status_before_transfer);
                lbl_time_of_leaving_emer_a.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(emr.time_of_leaving_emer_a, "dd-MMM-yyyy HH:mm"));
                lbl_patient_discharge.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(emr.patient_discharge));
                lbl_txt_patient_discharge.Text = WebHelpers.FormatString(emr.txt_patient_discharge);
                lbl_icd_10.Text = WebHelpers.FormatString(emr.icd_10);

            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }

        }
        private void BindingDataFormPrint(EmergencyMedicalRecord emr)
        {
            #region
            //try
            //{
            //    Patient patient = Patient.Instance();
            //    div_pecialistopinion.Visible= div_discharge_field.Visible = div_hos_req_field .Visible= div_emr_sur_field.Visible= div_transfer_hos_field.Visible = false;

            //    prt_fullname.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            //    prt_dob.Text = WebHelpers.FormatDateTime(DataHelpers.patient.date_of_birth) + "| " + DataHelpers.patient.gender_l;
            //    prt_vpid.Text = DataHelpers.patient.visible_patient_id;
            //    prt_evaluation_time.Text = WebHelpers.FormatDateTime(emr.evaluation_time, "dd/MM/yyyy HH:mm tt");
            //    //WebHelpers.FormatDateTime(emr.evaluation_time, "dd/MM/yyyy HH:mm tt");
            //    WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
            //    prt_chief_complaint.Text = emr.chief_complaint;

            //    if (emr.chief_complaint_code != null)
            //    {
            //        //((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + emr.chief_complaint_code)).Checked = true;
            //        if (emr.chief_complaint_code == "R")
            //        {
            //            lbl_chief_complaint_code_R.Text = "☒";
            //            lbl_chief_complaint_code_E.Text = "❏";
            //            lbl_chief_complaint_code_U.Text = "❏";
            //            lbl_chief_complaint_code_L.Text = "❏";
            //            lbl_chief_complaint_code_N.Text = "❏";

            //        }
            //        else if (emr.chief_complaint_code == "E")
            //        {
            //            lbl_chief_complaint_code_R.Text = "❏";
            //            lbl_chief_complaint_code_E.Text = "☒";
            //            lbl_chief_complaint_code_U.Text = "❏";
            //            lbl_chief_complaint_code_L.Text = "❏";
            //            lbl_chief_complaint_code_N.Text = "❏";

            //        }
            //        else if (emr.chief_complaint_code == "U")
            //        {
            //            lbl_chief_complaint_code_R.Text = "❏";
            //            lbl_chief_complaint_code_E.Text = "❏";
            //            lbl_chief_complaint_code_U.Text = "☒";
            //            lbl_chief_complaint_code_L.Text = "❏";
            //            lbl_chief_complaint_code_N.Text = "❏";

            //        }
            //        else if (emr.chief_complaint_code == "L")
            //        {
            //            lbl_chief_complaint_code_R.Text = "❏";
            //            lbl_chief_complaint_code_E.Text = "❏";
            //            lbl_chief_complaint_code_U.Text = "❏";
            //            lbl_chief_complaint_code_L.Text = "☒";
            //            lbl_chief_complaint_code_N.Text = "❏";

            //        }
            //        else if (emr.chief_complaint_code == "N")
            //        {
            //            lbl_chief_complaint_code_R.Text = "❏";
            //            lbl_chief_complaint_code_E.Text = "❏";
            //            lbl_chief_complaint_code_U.Text = "❏";
            //            lbl_chief_complaint_code_L.Text = "❏";
            //            lbl_chief_complaint_code_N.Text = "☒";

            //        }
            //    }
            //    if (emr.chief_complaint_code == null || emr.chief_complaint_code=="")
            //    {

            //        lbl_chief_complaint_code_R.Text = "❏";
            //        lbl_chief_complaint_code_E.Text = "❏";
            //        lbl_chief_complaint_code_U.Text = "❏";
            //        lbl_chief_complaint_code_L.Text = "❏";
            //        lbl_chief_complaint_code_N.Text = "❏";
            //    }

            //    prt_history_of_present.Text = emr.history_of_present;
            //    //Meds
            //    prt_past_med_his_meds.Text = emr.past_med_his_meds;
            //    //Surgical
            //    prt_past_med_his_surs.Text = emr.past_med_his_surs;
            //    string habits_temp = emr.habits;
            //    if (habits_temp != null)
            //    {
            //        List<Habits_Temp> Habits_Temps = JsonConvert.DeserializeObject<List<Habits_Temp>>(habits_temp);
            //        lbl_habits_A.Text = "❏";
            //        lbl_habits_S.Text = "❏";
            //        lbl_habits_D.Text = "❏";
            //        foreach (Habits_Temp locAvpu in Habits_Temps)
            //        {

            //            string cde = locAvpu.cde;
            //            if (cde != null)
            //            {
            //                if (cde == "A")
            //                {
            //                    lbl_habits_A.Text = "☒";
            //                }
            //                if (cde == "S")
            //                {
            //                    lbl_habits_S.Text = "☒";
            //                }
            //                if (cde == "D")
            //                {
            //                    lbl_habits_D.Text = "☒";
            //                }
            //            }

            //        }
            //    }
            //    if (habits_temp == null && habits_temp == "")
            //    {
            //        lbl_habits_A.Text = "❏";
            //        lbl_habits_S.Text = "❏";
            //        lbl_habits_D.Text = "❏";
            //    }

            //    lbl_habits_other.Text = emr.habits_other;
            //    prt_home_medications.Text = emr.home_medications;
            //    prt_allergies.Text = emr.allergies;
            //    prt_relevant_family_history.Text = emr.relevant_family_history;
            //    prt_finding.Text = emr.finding;
            //    if (emr.required_code != null)
            //    {
            //        ((HtmlInputRadioButton)FindControl("rad_required_code_" + emr.required_code)).Checked = true;
            //        if (emr.required_code = true)
            //        {
            //            lbl_required_code_True.Text = "☒";
            //            lbl_required_code_False.Text = "❏";
            //        }
            //        if (emr.required_code = false)
            //        {
            //            lbl_required_code_True.Text = "❏";
            //            lbl_required_code_False.Text = "☒";
            //        }
            //    }
            //    if (emr.required_code == null && emr.required_code == "")
            //    {

            //        lbl_required_code_True.Text = "❏";
            //        lbl_required_code_False.Text = "❏";

            //    }

            //    lbl_required_text.Text = emr.required_text;
            //    prt_investigations_results.Text = emr.investigations_results;
            //    prt_initial_diagnosis.Text = emr.initial_diagnosis;
            //    prt_diferential_diagnosis.Text = emr.diferential_diagnosis;
            //    prt_associated_conditions.Text = emr.associated_conditions;
            //    prt_comfirmed_diagnosis.Text = emr.comfirmed_diagnosis;
            //    if (emr.specialist_opinion != null)
            //    {
            //        if (emr.specialist_opinion == true)
            //        {
            //            lbl_specialist_opinion_True.Text = "☒";
            //            lbl_specialist_opinion_False.Text = "❏";
            //            div_pecialistopinion.Visible = true;
            //        }
            //        if (emr.specialist_opinion == false)
            //        {
            //            lbl_specialist_opinion_True.Text = "❏";
            //            lbl_specialist_opinion_False.Text = "☒";
            //        }

            //    }

            //    if ( emr.specialist_opinion ==null && emr.specialist_opinion =="")
            //    {
            //        lbl_specialist_opinion_True.Text = "❏";
            //        lbl_specialist_opinion_False.Text = "❏";
            //    }

            //    prt_name_of_specialist.Text = emr.name_of_specialist;
            //    if (emr.time_contaced != null)
            //    {
            //        prt_time_contaced.Text = emr.time_contaced.ToString("dd/MM/yyyy HH:mm tt");
            //    }
            //    if (emr.time_provided != null)
            //    {
            //        prt_time_provided.Text = emr.time_provided.ToString("dd/MM/yyyy HH:mm tt");
            //    }
            //    prt_spec_opinion_summarised.Text = emr.spec_opinion_summarised;

            //    string json_treatment = emr.treatment;
            //    lbl_Treatment.DataSource = JsonConvert.DeserializeObject<DataTable>(json_treatment);
            //    lbl_Treatment.DataBind();

            //    string json_progress_note = emr.progress_note;
            //    lbl_progress_note.DataSource = JsonConvert.DeserializeObject<DataTable>(json_progress_note);
            //    lbl_progress_note.DataBind();

            //    prt_conclusions.Text = emr.conclusions;
            //    if (emr.discharge != null)
            //    {
            //        if (emr.discharge == true)
            //        {
            //            lbl_discharge_True.Text = "☒";
            //            lbl_discharge_False.Text = "❏";
            //            div_discharge_field.Visible = true;
            //        }
            //        if (emr.discharge == false)
            //        {
            //            lbl_discharge_True.Text = "❏";
            //            lbl_discharge_False.Text = "☒";
            //        }

            //    }
            //    if (emr.discharge == null)
            //    {
            //        lbl_discharge_True.Text = "❏";
            //        lbl_discharge_False.Text = "❏";
            //    }

            //    prt_prescription.Text = emr.prescription;
            //    prt_specify_care_instructions.Text = emr.specify_care_instructions;
            //    if (emr.discharge_time != null)
            //    {
            //        prt_discharge_time.Text = WebHelpers.FormatDateTime(emr.discharge_time, "dd/MM/yyyy HH:mm tt");
            //    }
            //    if (emr.referred_to_OPD != null)
            //    {
            //        if (emr.referred_to_OPD == true)
            //        {
            //            lbl_referred_to_OPD_True.Text = "☒";
            //            lbl_referred_to_OPD_False.Text = "❏";
            //        }
            //        if (emr.referred_to_OPD == false)
            //        {
            //            lbl_referred_to_OPD_True.Text = "❏";
            //            lbl_referred_to_OPD_False.Text = "☒";
            //        }
            //    }
            //    if (emr.referred_to_OPD == null)
            //    {

            //        lbl_referred_to_OPD_True.Text = "❏";
            //        lbl_referred_to_OPD_False.Text = "❏";

            //    }

            //    lbl_referred_to_OPD_text.Text = emr.referred_to_OPD_text;
            //    if (emr.hospitalisation_required != null)
            //    {
            //        ((HtmlInputRadioButton)FindControl("rad_hospitalisation_required_" + emr.hospitalisation_required)).Checked = true;
            //        if (emr.hospitalisation_required == true)
            //        {
            //            lbl_hospitalisation_required_True.Text = "☒";
            //            lbl_hospitalisation_required_False.Text = "❏";
            //            div_hos_req_field.Visible = true;
            //        }
            //        if (emr.hospitalisation_required == false)
            //        {
            //            lbl_hospitalisation_required_True.Text = "❏";
            //            lbl_hospitalisation_required_False.Text = "☒";
            //        }
            //    }
            //    if (emr.hospitalisation_required == null && emr.hospitalisation_required == "")
            //    {

            //        lbl_hospitalisation_required_True.Text = "❏";
            //        lbl_hospitalisation_required_False.Text = "❏";

            //    }

            //    prt_reason.Text = emr.reason;
            //    prt_ward.Text = emr.ward;

            //    if (emr.discharge_time != null)
            //    {
            //        prt_time_of_leaving_emergency.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emergency, "dd/MM/yyyy HH:mm tt");
            //    }
            //    if (emr.emergency_surgery != null)
            //    {
            //        ((HtmlInputRadioButton)FindControl("rad_emergency_surgery_" + emr.emergency_surgery)).Checked = true;
            //        if (emr.emergency_surgery == true)
            //        {
            //            lbl_emergency_surgery_True.Text = "☒";
            //            lbl_emergency_surgery_False.Text = "❏";
            //            div_emr_sur_field.Visible = true;
            //        }
            //        if (emr.emergency_surgery == false)
            //        {
            //            lbl_emergency_surgery_True.Text = "❏";
            //            lbl_emergency_surgery_False.Text = "☒";
            //        }
            //    }
            //    if (emr.emergency_surgery == null)
            //    {

            //        lbl_emergency_surgery_True.Text = "❏";
            //        lbl_emergency_surgery_False.Text = "❏";

            //    }

            //    lbl_preoperative_diagnosis.Text = emr.pre_operative_diagnosis;
            //    prt_brief_summary.Text = emr.pre_operative_diagnosis;

            //    if (emr.time_of_leaving_emer_e != null)
            //    {
            //        prt_time_of_leaving_emer_e.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emer_e, "dd/MM/yyyy HH:mm tt");
            //    }
            //    if (emr.transfer_hospital != null)
            //    {
            //        ((HtmlInputRadioButton)FindControl("rad_transfer_hospital_" + emr.transfer_hospital)).Checked = true;
            //        if (emr.transfer_hospital == true)
            //        {
            //            lbl_transfer_hospital_True.Text = "☒";
            //            lbl_transfer_hospital_False.Text = "❏";
            //            div_transfer_hos_field.Visible = true;
            //        }
            //        if (emr.transfer_hospital == false)
            //        {
            //            lbl_transfer_hospital_True.Text = "❏";
            //            lbl_transfer_hospital_False.Text = "☒";
            //        }
            //    }
            //    if (emr.transfer_hospital == null)
            //    {

            //        lbl_transfer_hospital_True.Text = "❏";
            //        lbl_transfer_hospital_False.Text = "❏";

            //    }

            //    prt_reason_for_transfer.Text = emr.reason_for_transfer;
            //    prt_status_before_transfer.Text = emr.status_before_transfer;
            //    if (emr.time_of_leaving_emer_a != null)
            //    {
            //        prt_time_of_leaving_emer_a.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emer_a, "dd/MM/yyyy HH:mm tt");
            //    }
            //    string patient_discharge_temp = emr.patient_discharge;
            //    if (patient_discharge_temp != null && patient_discharge_temp != "")
            //    {
            //        List<PDT> patient_discharge_temps = JsonConvert.DeserializeObject<List<PDT>>(patient_discharge_temp);
            //        lbl_patient_discharge_IMP.Text = "❏";
            //        lbl_patient_discharge_UNC.Text = "❏";
            //        lbl_patient_discharge_UNS.Text = "❏";
            //        foreach (PDT PDTS in patient_discharge_temps)
            //        {

            //            string cde = PDTS.cde;
            //            if (cde != null)
            //            {
            //                if (cde == "IMP")
            //                {
            //                    lbl_patient_discharge_IMP.Text = "☒";
            //                }
            //                if (cde == "UNC")
            //                {
            //                    lbl_patient_discharge_UNC.Text = "☒";
            //                }
            //                if (cde == "UNS")
            //                {
            //                    lbl_patient_discharge_UNS.Text = "☒";
            //                }
            //            }

            //        }
            //    }
            //    if (patient_discharge_temp == null || patient_discharge_temp == "")
            //    {
            //        lbl_patient_discharge_IMP.Text = "❏";
            //        lbl_patient_discharge_UNC.Text = "❏";
            //        lbl_patient_discharge_UNS.Text = "❏";
            //    }

            //    txt_patient_discharge.Value = emr.txt_patient_discharge;
            //    lbl_patient_discharge.Text = emr.txt_patient_discharge;
            //    prt_patient_discharge.Text = emr.txt_patient_discharge;
            //    prt_icd_10.Text = emr.icd_10;


            //    lbl_date.Text = emr.created_date_time.ToString("dd");
            //    lbl_month.Text = emr.created_date_time.ToString("MM");
            //    lbl_year.Text = emr.created_date_time.ToString("yyyy");
            //    lbl_created_name_l.Text = emr.created_name_l;
            //}
            //catch (Exception ex)
            //{
            //    WebHelpers.SendError(Page, ex);
            //}
            #endregion

            try
            {
                patientInfo = new PatientInfo(varPID);

                div_pecialistopinion.Visible = div_discharge_field.Visible = div_hos_req_field.Visible = div_emr_sur_field.Visible = div_transfer_hos_field.Visible = false;
        
                div_pecialistopinion.Visible = div_discharge_field.Visible = div_hos_req_field.Visible = div_emr_sur_field.Visible = div_transfer_hos_field.Visible = false;
                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_fullname.Text = patientInfo.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth) + "| " + patientInfo.Gender;
                prt_vpid.Text = patientInfo.visible_patient_id;
                prt_evaluation_time.Text = WebHelpers.FormatDateTime(emr.evaluation_time, "HH:mm");
                //WebHelpers.FormatDateTime(emr.evaluation_time, "dd/MM/yyyy HH:mm tt");

                prt_chief_complaint.Text = emr.chief_complaint;
                lbl_chief_complaint_code_R.Text = "❏";
                lbl_chief_complaint_code_E.Text = "❏";
                lbl_chief_complaint_code_U.Text = "❏";
                lbl_chief_complaint_code_L.Text = "❏";
                lbl_chief_complaint_code_N.Text = "❏";
                if (emr.chief_complaint_code != null)
                {
                    //((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + emr.chief_complaint_code)).Checked = true;
                    if (emr.chief_complaint_code == "R")
                    {
                        lbl_chief_complaint_code_R.Text = "☒";

                    }
                    else if (emr.chief_complaint_code == "E")
                    {
                        lbl_chief_complaint_code_E.Text = "☒";

                    }
                    else if (emr.chief_complaint_code == "U")
                    {
                        lbl_chief_complaint_code_U.Text = "☒";

                    }
                    else if (emr.chief_complaint_code == "L")
                    {
                        lbl_chief_complaint_code_L.Text = "☒";

                    }
                    else if (emr.chief_complaint_code == "N")
                    {
                        lbl_chief_complaint_code_N.Text = "☒";

                    }
                }

                if (emr.chief_complaint_code == null || emr.chief_complaint_code == "")
                {

                    lbl_chief_complaint_code_R.Text = "❏";
                    lbl_chief_complaint_code_E.Text = "❏";
                    lbl_chief_complaint_code_U.Text = "❏";
                    lbl_chief_complaint_code_L.Text = "❏";
                    lbl_chief_complaint_code_N.Text = "❏";
                }

                prt_history_of_present.Text = emr.history_of_present;
                //Meds
                prt_past_med_his_meds.Text = emr.past_med_his_meds;
                //Surgical
                prt_past_med_his_surs.Text = emr.past_med_his_surs;
                string habits_temp = emr.habits;
                if (habits_temp != null)
                {
                    List<Habits_Temp> Habits_Temps = JsonConvert.DeserializeObject<List<Habits_Temp>>(habits_temp);

                    foreach (Habits_Temp locAvpu in Habits_Temps)
                    {
                        string cde = locAvpu.cde;
                        if (cde != null)
                        {
                            if (cde == "A")
                            {
                                lbl_habits_A.Text = "☒";
                            }
                            if (cde == "S")
                            {
                                lbl_habits_S.Text = "☒";
                            }
                            if (cde == "D")
                            {
                                lbl_habits_D.Text = "☒";
                            }
                        }
                    }
                }

                if (habits_temp == null && habits_temp == "")
                {
                    lbl_habits_A.Text = "❏";
                    lbl_habits_S.Text = "❏";
                    lbl_habits_D.Text = "❏";
                }

                lbl_habits_other.Text = emr.habits_other;
                prt_home_medications.Text = emr.home_medications;
                prt_allergies.Text = emr.allergies;
                prt_relevant_family_history.Text = emr.relevant_family_history;
                prt_finding.Text = emr.finding;
                if (emr.required_code != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_required_code_" + emr.required_code)).Checked = true;
                    if (emr.required_code = true)
                    {
                        lbl_required_code_True.Text = "☒";
                        lbl_required_code_False.Text = "❏";
                    }
                    if (emr.required_code = false)
                    {
                        lbl_required_code_True.Text = "❏";
                        lbl_required_code_False.Text = "☒";
                    }
                }
                if (emr.required_code == null && emr.required_code == "")
                {

                    lbl_required_code_True.Text = "❏";
                    lbl_required_code_False.Text = "❏";

                }

                lbl_required_text.Text = emr.required_text;
                prt_investigations_results.Text = emr.investigations_results;
                prt_initial_diagnosis.Text = emr.initial_diagnosis;
                prt_diferential_diagnosis.Text = emr.diferential_diagnosis;
                prt_associated_conditions.Text = emr.associated_conditions;
                prt_comfirmed_diagnosis.Text = emr.comfirmed_diagnosis;
                if (emr.specialist_opinion != null)
                {
                    if (emr.specialist_opinion == true)
                    {
                        lbl_specialist_opinion_True.Text = "☒";
                        lbl_specialist_opinion_False.Text = "❏";
                        div_pecialistopinion.Visible = true;
                    }
                    if (emr.specialist_opinion == false)
                    {
                        lbl_specialist_opinion_True.Text = "❏";
                        lbl_specialist_opinion_False.Text = "☒";
                    }

                }

                if (emr.specialist_opinion == null && emr.specialist_opinion == "")
                {
                    lbl_specialist_opinion_True.Text = "❏";
                    lbl_specialist_opinion_False.Text = "❏";
                }

                prt_name_of_specialist.Text = emr.name_of_specialist;
                if (emr.time_contaced != null)
                {
                    prt_time_contaced.Text = emr.time_contaced.ToString("HH:mm");
                }
                if (emr.time_provided != null)
                {
                    prt_time_provided.Text = emr.time_provided.ToString("HH:mm");
                }
                prt_spec_opinion_summarised.Text = emr.spec_opinion_summarised;

                string json_treatment = emr.treatment;
                lbl_Treatment.DataSource = JsonConvert.DeserializeObject<DataTable>(json_treatment);
                lbl_Treatment.DataBind();

                string json_progress_note = emr.progress_note;
                lbl_progress_note.DataSource = JsonConvert.DeserializeObject<DataTable>(json_progress_note);
                lbl_progress_note.DataBind();

                prt_conclusions.Text = emr.conclusions;
                if (emr.discharge != null)
                {
                    if (emr.discharge == true)
                    {
                        lbl_discharge_True.Text = "☒";
                        lbl_discharge_False.Text = "❏";
                        div_discharge_field.Visible = true;
                    }
                    if (emr.discharge == false)
                    {
                        lbl_discharge_True.Text = "❏";
                        lbl_discharge_False.Text = "☒";
                    }

                }
                if (emr.discharge == null)
                {
                    lbl_discharge_True.Text = "❏";
                    lbl_discharge_False.Text = "❏";
                }

                prt_prescription.Text = emr.prescription;
                prt_specify_care_instructions.Text = emr.specify_care_instructions;
                if (emr.discharge_time != null)
                {
                    prt_discharge_time.Text = WebHelpers.FormatDateTime(emr.discharge_time, "HH:mm");
                }
                if (emr.referred_to_OPD != null)
                {
                    if (emr.referred_to_OPD == true)
                    {
                        lbl_referred_to_OPD_True.Text = "☒";
                        lbl_referred_to_OPD_False.Text = "❏";
                    }
                    if (emr.referred_to_OPD == false)
                    {
                        lbl_referred_to_OPD_True.Text = "❏";
                        lbl_referred_to_OPD_False.Text = "☒";
                    }
                }
                if (emr.referred_to_OPD == null)
                {

                    lbl_referred_to_OPD_True.Text = "❏";
                    lbl_referred_to_OPD_False.Text = "❏";

                }

                lbl_referred_to_OPD_text.Text = emr.referred_to_OPD_text;
                if (emr.hospitalisation_required != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_hospitalisation_required_" + emr.hospitalisation_required)).Checked = true;
                    if (emr.hospitalisation_required == true)
                    {
                        lbl_hospitalisation_required_True.Text = "☒";
                        lbl_hospitalisation_required_False.Text = "❏";
                        div_hos_req_field.Visible = true;
                    }
                    if (emr.hospitalisation_required == false)
                    {
                        lbl_hospitalisation_required_True.Text = "❏";
                        lbl_hospitalisation_required_False.Text = "☒";
                    }
                }
                if (emr.hospitalisation_required == null && emr.hospitalisation_required == "")
                {

                    lbl_hospitalisation_required_True.Text = "❏";
                    lbl_hospitalisation_required_False.Text = "❏";

                }

                prt_reason.Text = emr.reason;
                prt_ward.Text = emr.ward;

                if (emr.discharge_time != null)
                {
                    prt_time_of_leaving_emergency.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emergency, "HH:mm");
                }
                if (emr.emergency_surgery != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_emergency_surgery_" + emr.emergency_surgery)).Checked = true;
                    if (emr.emergency_surgery == true)
                    {
                        lbl_emergency_surgery_True.Text = "☒";
                        lbl_emergency_surgery_False.Text = "❏";
                        div_emr_sur_field.Visible = true;
                    }
                    if (emr.emergency_surgery == false)
                    {
                        lbl_emergency_surgery_True.Text = "❏";
                        lbl_emergency_surgery_False.Text = "☒";
                    }
                }
                if (emr.emergency_surgery == null)
                {

                    lbl_emergency_surgery_True.Text = "❏";
                    lbl_emergency_surgery_False.Text = "❏";

                }

                lbl_preoperative_diagnosis.Text = emr.pre_operative_diagnosis;
                prt_brief_summary.Text = emr.pre_operative_diagnosis;

                if (emr.time_of_leaving_emer_e != null)
                {
                    prt_time_of_leaving_emer_e.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emer_e, "HH:mm");
                }
                if (emr.transfer_hospital != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_transfer_hospital_" + emr.transfer_hospital)).Checked = true;
                    if (emr.transfer_hospital == true)
                    {
                        lbl_transfer_hospital_True.Text = "☒";
                        lbl_transfer_hospital_False.Text = "❏";
                        div_transfer_hos_field.Visible = true;
                    }
                    if (emr.transfer_hospital == false)
                    {
                        lbl_transfer_hospital_True.Text = "❏";
                        lbl_transfer_hospital_False.Text = "☒";
                    }
                }
                if (emr.transfer_hospital == null)
                {

                    lbl_transfer_hospital_True.Text = "❏";
                    lbl_transfer_hospital_False.Text = "❏";

                }

                prt_reason_for_transfer.Text = emr.reason_for_transfer;
                prt_status_before_transfer.Text = emr.status_before_transfer;
                if (emr.time_of_leaving_emer_a != null)
                {
                    prt_time_of_leaving_emer_a.Text = WebHelpers.FormatDateTime(emr.time_of_leaving_emer_a, "HH:mm");
                }
                string patient_discharge_temp = emr.patient_discharge;
                if (patient_discharge_temp != null && patient_discharge_temp != "")
                {
                    List<PDT> patient_discharge_temps = JsonConvert.DeserializeObject<List<PDT>>(patient_discharge_temp);
                    prt_patient_discharge_IMP.Text = "❏";
                    prt_patient_discharge_UNC.Text = "❏";
                    prt_patient_discharge_UNS.Text = "❏";
                    foreach (PDT PDTS in patient_discharge_temps)
                    {

                        string cde = PDTS.cde;
                        if (cde != null)
                        {
                            if (cde == "IMP")
                            {
                                prt_patient_discharge_IMP.Text = "☒";
                            }
                            if (cde == "UNC")
                            {
                                prt_patient_discharge_UNC.Text = "☒";
                            }
                            if (cde == "UNS")
                            {
                                prt_patient_discharge_UNS.Text = "☒";
                            }
                        }

                    }
                }
                if (patient_discharge_temp == null || patient_discharge_temp == "")
                {
                    prt_patient_discharge_IMP.Text = "❏";
                    prt_patient_discharge_UNC.Text = "❏";
                    prt_patient_discharge_UNS.Text = "❏";
                }

                txt_patient_discharge.Value = emr.txt_patient_discharge;
                prt_patient_discharge.Text = emr.txt_patient_discharge;
                prt_icd_10.Text = emr.icd_10;

                //DateTime signature_date = (DateTime)Session["signature_date"];
                //string signature_doctor = (string)Session["signature_doctor"];

                //if(signature_date != null)
                //{
                //    lbl_date.Text = signature_date.ToString("dd");
                //    lbl_month.Text = signature_date.ToString("MM");
                //    lbl_year.Text = signature_date.ToString("yyyy");
                //}

                //lbl_created_name_l.Text = signature_doctor;
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion
        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                EmergencyMedicalRecord emr = new EmergencyMedicalRecord(varDocID, loc);
                emr.status = DocumentStatus.FINAL;

                UpdateData(emr);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                emr = new EmergencyMedicalRecord(varDocID, loc);
                emr.status = DocumentStatus.DRAFT;

                UpdateData(emr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = EmergencyMedicalRecord.Delete((string)Session["UserId"], Request.QueryString["docId"], loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                EmergencyMedicalRecord emr = new EmergencyMedicalRecord(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);
                
                //load form control
                WebHelpers.LoadFormControl(form1, emr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(emr);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
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



            ViewState[grid_Treatment.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_Treatment.ID], grid_Treatment, EmergencyMedicalRecord.Treatment);
        }
        protected void grid_Treatment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_progress_note_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_progress_note.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_progress_note.ID], grid_progress_note, EmergencyMedicalRecord.ProgressNote);

        }
        protected void grid_progress_note_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Functions
        public void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                EmergencyMedicalRecord emr;
                if (varDocIdLog != null)
                {
                    emr = new EmergencyMedicalRecord(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    emr = new EmergencyMedicalRecord(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                //loadRadGridHistoryLog();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, EmergencyMedicalRecord.Logs(varDocID, loc), out string SignatureDate, out string SignatureName);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (emr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(emr, WebHelpers.LoadFormControl(form1, emr, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    
                    BindingDataFormPrint(emr);
                }
                else if (emr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(emr, WebHelpers.LoadFormControl(form1, emr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, emr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
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
        private void loadRadGridHistoryLog()
        {
            DataTable dt = EmergencyMedicalRecord.Logs(varDocID, loc);
            string last_updated_date_time = "";
            string last_updated_doctor = "";

            if (dt != null)
            {
                RadGrid1.DataSource = dt;

                string created_date_time = Convert.ToString(dt.Rows[0]["created_date_time"]);
                string modified_date_time = Convert.ToString(dt.Rows[0]["modified_date_time"]);

                last_updated_date_time = WebHelpers.GetLogLastDateTime(created_date_time, modified_date_time);

                last_updated_doctor = WebHelpers.GetLogLastName(dt.Rows[0]["created_name_e"], dt.Rows[0]["modified_name_e"]);
            }

            SignatureDate = last_updated_date_time;
            SignatureName = last_updated_doctor;

            last_updated_date_time = WebHelpers.FormatDateTime(last_updated_date_time, "dd-MMM-yyyy HH:mm tt", "");

            RadLabel1.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{last_updated_date_time}</i></b>";
            RadGrid1.DataBind();
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = PAGE_URL + $"&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/ER/EmerMedRec.aspx?modelId={Request.QueryString["modelId"]}&docId={varDocID}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
        }
        private void UpdateData(EmergencyMedicalRecord emr)
        {
            try
            {
                
                emr.evaluation_time = DataHelpers.ConvertSQLDateTime(dtpk_evaluation_time.SelectedDate);

                emr.chief_complaint = txt_chief_complaint.Value;

                emr.chief_complaint_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_chief_complaint_code_", EmergencyMedicalRecord.ChiefComplaintCode);

                emr.chief_complaint_desc = WebHelpers.GetDicDesc(emr.chief_complaint_code, EmergencyMedicalRecord.ChiefComplaintCode);

                emr.history_of_present = txt_history_of_present.Value;
                emr.past_med_his_meds = txt_past_med_his_meds.Value;
                emr.past_med_his_surs = txt_past_med_his_surs.Value;

                emr.habits = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_habits_", EmergencyMedicalRecord.Habits, out DataTable habits, "cde");

                if (cb_habits_O.Checked)
                {
                    emr.habits_other = txt_habits_other.Value;
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
                if (rad_referred_to_OPD_True.Checked)
                {
                    emr.referred_to_OPD = true;
                    emr.referred_to_OPD_text = txt_referred_to_OPD_text.Value;
                }
                if (rad_referred_to_OPD_False.Checked)
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
                    emr.time_of_leaving_emer_e = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emer_e.SelectedDate);
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
                    emr.time_of_leaving_emer_a = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emer_a.SelectedDate);
                }
                if (rad_transfer_hospital_False.Checked)
                {
                    emr.transfer_hospital = false;
                    emr.reason_for_transfer = "";
                    emr.status_before_transfer = "";
                    emr.time_of_leaving_emer_a = null;
                }

                emr.patient_discharge = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_patient_discharge_", EmergencyMedicalRecord.PatientDischarge, "cde");

                emr.txt_patient_discharge = txt_patient_discharge.Value;

                emr.icd_10 = txt_icd_10.Value;

                if (JsonConvert.SerializeObject(emr) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                emr.amend_reason = txt_amend_reason.Text;
                emr.user_name = (string)Session["UserID"];

                dynamic result = emr.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
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
        #endregion

        #region Validation
        protected void chief_complaint_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_chief_complaint_code_E.Checked || rad_chief_complaint_code_L.Checked || rad_chief_complaint_code_N.Checked || rad_chief_complaint_code_R.Checked || rad_chief_complaint_code_U.Checked;
        }
        protected void habits_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_habits_A.Checked || cb_habits_D.Checked || cb_habits_O.Checked || cb_habits_S.Checked;
        }
        protected void required_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_required_code_True.Checked || rad_required_code_False.Checked;
        }
        protected void specialist_opinion_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_specialist_opinion_True.Checked || rad_specialist_opinion_False.Checked;
        }
        protected void discharge_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_discharge_True.Checked || rad_discharge_False.Checked;
        }
        protected void referred_to_OPD_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_referred_to_OPD_True.Checked || rad_referred_to_OPD_False.Checked;
        }
        protected void hos_req_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_hospitalisation_required_True.Checked || rad_hospitalisation_required_False.Checked;
        }
        protected void emergency_surgery_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_emergency_surgery_True.Checked || rad_emergency_surgery_False.Checked;
        }
        protected void transfer_hospital_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_transfer_hospital_True.Checked || rad_transfer_hospital_False.Checked;
        }
        protected void patient_discharge_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_patient_discharge_IMP.Checked || cb_patient_discharge_UNC.Checked || cb_patient_discharge_UNS.Checked;
        }
        protected void chief_complaint_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_chief_complaint.Value);
        }
        protected void history_of_present_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_history_of_present.Value);
        }
        protected void home_medications_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_home_medications.Value);
        }
        protected void allergies_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_allergies.Value);
        }
        protected void relevant_family_history_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_relevant_family_history.Value);
        }
        protected void finding_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_finding.Value);
        }
        protected void investigations_results_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_investigations_results.Value);
        }
        protected void initial_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_initial_diagnosis.Value);
        }
        protected void diferential_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_diferential_diagnosis.Value);
        }
        protected void associated_conditions_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_associated_conditions.Value);
        }
        protected void conclusions_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_conclusions.Value);
        }
        protected void prescription_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_prescription.Value);
        }
        protected void specify_care_instructions_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_specify_care_instructions.Value);
        }
        protected void reason_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_reason.Value);
        }
        protected void ward_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_ward.Value);
        }
        protected void pre_operative_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_pre_operative_diagnosis.Value);
        }
        protected void brief_summary_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_brief_summary.Value);
        }
        protected void reason_for_transfer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_reason_for_transfer.Value);
        }
        protected void status_before_transfer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_status_before_transfer.Value);
        }
        protected void icd_10_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_icd_10.Value);
        }
        protected void past_med_his_surs_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_past_med_his_surs.Value);
        }
        protected void past_med_his_meds_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_past_med_his_meds.Value);
        }
        #endregion

        public class Habits_Temp
        {
            public string cde { get; set; }
            public string desc { get; set; }
        }
        public class PDT
        {
            public string cde { get; set; }
            public string desc { get; set; }
        }

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
    }
}
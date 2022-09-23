using EMR.Model;
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
    public partial class EmerMedRec : System.Web.UI.Page, IEmrFormModel<EmrViewModel>
    {
        //EmergencyMedicalRecord emr;
        public EmrViewModel FormModel { get; set; }
        public PatientInfo patientInfo;
        public PatientVisitInfo patientVisitInfo;

        public string UserId { get => (string)Session["UserID"]; }

        public string EmpId { get => (string)Session["emp_id"]; }

        public string GroupAccess { get => (string)Session["group_access"]; }

        public string AccessAuthorize { get => (string)Session["access_authorize"]; }

        public string PAGE_URL { get => $"/ER/EmerMedRec.aspx?loc={Location}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}"; }
        public string PAGE_URL_DEFAULT { get => $"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={Location}"; }

        public string Location { get => (string)Session["company_code"]; }

        public string LocationChanged { get => (string)Session["const_company_code"]; }

        public bool IsLocationChanged { get => Location != LocationChanged; }

        public string varDocID { get => Request.QueryString["docId"]; }

        public string varDocIdLog { get => Request.QueryString["docIdLog"]; }

        public bool IsViewLog { get => varDocIdLog != null; }

        public string varModelID { get => Request.QueryString["modelId"]; }

        public string varPVID { get => Request.QueryString["pvId"]; }

        public string varVPID { get => Request.QueryString["vpId"]; }

        public string varPID { get => Request.QueryString["pId"]; }

        public string SignatureDate { get; set; }

        public string SignatureName { get; set; }

        public EmrViewModel Model => throw new NotImplementedException();

        public string signature_date => throw new NotImplementedException();

        public string signature_name => throw new NotImplementedException();

        //public string PAGE_URL { get; set; }
        //public string loc { get; set; }
        //public string locChanged { get; set; }
        //public string varDocID { get; set; }
        //public string varDocIdLog { get; set; }
        //public string varModelID { get; set; }
        //public string varPVID { get; set; }
        //public string varVPID { get; set; }
        //public string varPID { get; set; }

        //public string SignatureDate { get; set; }
        //public string SignatureName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = "hisuser";
            Session["emp_id"] = "8b38e1b7-374c-409a-8b2b-d8556683d4ce";

            Session["group_access"] = "DOC";
            Session["access_authorize"] = "FullAccess";
            Session["company_code"] = "AIH";
            Session["const_company_code"] = "AIH";

            if (varPID == null) Response.Redirect($"/ER/EmerMedRec.aspx?loc={Location}&pId=d5cda8bb-c776-11e8-b0cd-d89ef37d43fa&vpId=900000488&pvid=b3b72f37-2a6a-11ec-9add-94e23c4418b1&modelId=3efd8bc6-d254-4a53-a253-ff823d7ee5a4&docId=6ecccc57-498b-4e4c-928b-70c0ca96bb82");

            if (!WebHelpers.CheckSession(this)) return;

            //varDocID = Request.QueryString["docId"];
            //varDocIdLog = Request.QueryString["docIdLog"];
            //varModelID = Request.QueryString["modelId"];
            //varPVID = Request.QueryString["pvId"];
            //varVPID = Request.QueryString["vpId"];
            //varPID = Request.QueryString["pId"];
            //loc = (string)Session["company_code"];
            //locChanged = (string)Session["const_company_code"];

            //string rawurl =  Request.RawUrl;

            //PAGE_URL = Request.RawUrl;

            //string url = Request.RawUrl.Split('.')[0];
            //var urlArr = url.Split('/');
            //url = urlArr[urlArr.Length - 1];

            //PAGE_URL = $"/ER/{url}.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
                SetDefaultValue();
            }

            PostBackEventHandler();
        }
        public void SetDefaultValue()
        {
            if (RadGrid1.Items.Count <= 1)
            {
                rad_infected_with_covid_false.Checked = true;
            }
        }
        public void PostBackEventHandler()
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
            if (value == "clear")
            {
                rad_discharge_True.Checked = rad_discharge_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, discharge_field);
            }
            else
            {
                try
                {
                    bool.TryParse(value, out bool IsChecked);
                    discharge_field.Visible = IsChecked;
                }
                catch  (Exception ex) 
                {
                    Console.WriteLine(ex.Message);
                }
            }

            //WebHelpers.VisibleControl(rad_discharge_True.Checked, discharge_field);
        }
        private void specialist_opinion_change(string value = "")
        {

            if (value == "clear")
            {
                rad_specialist_opinion_True.Checked = rad_specialist_opinion_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, specialist_opinion_field);
            }

            WebHelpers.VisibleControl(rad_specialist_opinion_True.Checked, specialist_opinion_field);
        }
        private void transfer_hospital_change(string value = "")
        {
            if (value == "clear")
            {
                rad_transfer_hospital_True.Checked = rad_transfer_hospital_False.Checked = false;
            }
            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, transfer_hos_field);
            }

            WebHelpers.VisibleControl(rad_transfer_hospital_True.Checked, transfer_hos_field);
        }
        private void emergency_surgery_change(string value = "")
        {
            if (value == "clear")
            {
                rad_emergency_surgery_True.Checked = rad_emergency_surgery_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, emr_sur_field);
            }
            WebHelpers.VisibleControl(rad_emergency_surgery_True.Checked, emr_sur_field);
        }
        private void hos_req_change(string value = "")
        {
            if (value == "clear")
            {
                rad_hospitalisation_required_True.Checked = rad_hospitalisation_required_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, hos_req_field);
            }

            WebHelpers.VisibleControl(rad_hospitalisation_required_True.Checked, hos_req_field);
        }

        #region Binding Data
        public void BindingDataForm(EmrViewModel EmrViewModel, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(EmrViewModel);
            }
            else
            {
                BindingDataFormView(EmrViewModel);
            }
        }
        public void BindingDataFormEdit(EmrViewModel EmrViewModel)
        {
            try
            {
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = false;

                txt_amend_reason.Text = "";
                WebHelpers.BindDateTimePicker(dtpk_evaluation_time, EmrViewModel.evaluation_time);
                txt_chief_complaint.Value = EmrViewModel.chief_complaint;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_chief_complaint_code_" + EmrViewModel.chief_complaint_code);
                txt_history_of_present.Value = EmrViewModel.history_of_present;
                txt_past_med_his_meds.Value = EmrViewModel.past_med_his_meds;
                txt_past_med_his_surs.Value = EmrViewModel.past_med_his_surs;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_habits_", WebHelpers.GetJSONToDataTable(EmrViewModel.habits), "cde");
                txt_habits_other.Value = EmrViewModel.habits_other;
                txt_home_medications.Value = EmrViewModel.home_medications;
                txt_allergies.Value = EmrViewModel.allergies;
                txt_relevant_family_history.Value = EmrViewModel.relevant_family_history;
                txt_finding.Value = EmrViewModel.finding;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_required_code_" + EmrViewModel.required_code, "false");
                txt_required_text.Value = EmrViewModel.required_text;
                txt_investigations_results.Value = EmrViewModel.investigations_results;
                txt_initial_diagnosis.Value = EmrViewModel.initial_diagnosis;
                txt_diferential_diagnosis.Value = EmrViewModel.diferential_diagnosis;
                txt_associated_conditions.Value = EmrViewModel.associated_conditions;
                txt_comfirmed_diagnosis.Value = EmrViewModel.comfirmed_diagnosis;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_specialist_opinion_" + EmrViewModel.specialist_opinion, "false");
                specialist_opinion_change(Convert.ToString(EmrViewModel.specialist_opinion));
                txt_name_of_specialist.Value = EmrViewModel.name_of_specialist;
                WebHelpers.BindDateTimePicker(dtpk_time_contaced, EmrViewModel.time_contaced);
                WebHelpers.BindDateTimePicker(dtpk_time_provided, EmrViewModel.time_provided);
                txt_spec_opinion_summarised.Value = EmrViewModel.spec_opinion_summarised;

                ViewState[grid_Treatment.ID] = WebHelpers.BindingDataGridView(grid_Treatment, WebHelpers.GetJSONToDataTable(EmrViewModel.treatment), EmergencyMedicalRecord.Treatment, btn_grid_Treatment_add);

                ViewState[grid_progress_note.ID] = WebHelpers.BindingDataGridView(grid_progress_note, WebHelpers.GetJSONToDataTable(EmrViewModel.progress_note), EmergencyMedicalRecord.ProgressNote, btn_grid_progress_note_add);

                txt_conclusions.Value = EmrViewModel.conclusions;
                //2
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_discharge_" + EmrViewModel.discharge, "false");
                discharge_change(Convert.ToString(EmrViewModel.discharge));
                txt_prescription.Value = EmrViewModel.prescription;
                txt_specify_care_instructions.Value = EmrViewModel.specify_care_instructions;
                WebHelpers.BindDateTimePicker(dtpk_discharge_time, EmrViewModel.discharge_time);
                //3
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_referred_to_OPD_" + EmrViewModel.referred_to_OPD, "false");
                txt_referred_to_OPD_text.Value = EmrViewModel.referred_to_OPD_text;
                //4
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hospitalisation_required_" + EmrViewModel.hospitalisation_required, "false");
                txt_reason.Value = EmrViewModel.reason;
                txt_ward.Value = EmrViewModel.ward;
                WebHelpers.BindDateTimePicker(dtpk_time_of_leaving_emergency, EmrViewModel.time_of_leaving_emergency);
                hos_req_change(Convert.ToString(EmrViewModel.hospitalisation_required));
                //5
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_emergency_surgery_" + EmrViewModel.emergency_surgery, "false");
                txt_pre_operative_diagnosis.Value = EmrViewModel.pre_operative_diagnosis;
                txt_brief_summary.Value = EmrViewModel.brief_summary;
                WebHelpers.BindDateTimePicker(dtpk_time_of_leaving_emer_e, EmrViewModel.time_of_leaving_emer_e);
                emergency_surgery_change(Convert.ToString(EmrViewModel.emergency_surgery));
                //6
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_transfer_hospital_" + EmrViewModel.transfer_hospital, "false");
                txt_reason_for_transfer.Value = EmrViewModel.reason_for_transfer;
                txt_status_before_transfer.Value = EmrViewModel.status_before_transfer;
                WebHelpers.BindDateTimePicker(dtpk_time_of_leaving_emer_a, EmrViewModel.time_of_leaving_emer_a);
                transfer_hospital_change(Convert.ToString(EmrViewModel.transfer_hospital));
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_patient_discharge_", WebHelpers.GetJSONToDataTable(EmrViewModel.patient_discharge), "cde");
                txt_patient_discharge.Value = EmrViewModel.txt_patient_discharge;
                //
                txt_icd_10.Value = EmrViewModel.icd_10;

                //Update V2.0
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_" + EmrViewModel.infected_with_covid);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + EmrViewModel.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + EmrViewModel.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + EmrViewModel.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + EmrViewModel.not_yet_vaccinations);

                txt_other_vaccinations.Value = EmrViewModel.other_vaccinations;

                //DataObj.Value = JsonConvert.SerializeObject(EmrViewModel);
                Session["docid"] = EmrViewModel.document_id;
                WebHelpers.AddScriptFormEdit(Page, EmrViewModel, EmpId, Location);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public void BindingDataFormView(EmrViewModel EmrViewModel)
        {
            try
            {

                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = true;

                lbl_infected_with_covid.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.infected_with_covid));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + EmrViewModel.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + EmrViewModel.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + EmrViewModel.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + EmrViewModel.not_yet_vaccinations);

                lbl_other_vaccinations.Text = EmrViewModel.other_vaccinations;

                lbl_evaluation_time.Text = WebHelpers.FormatDateTime(EmrViewModel.evaluation_time, "dd-MMM-yyyy HH:mm");
                lbl_chief_complaint.Text = WebHelpers.FormatString(EmrViewModel.chief_complaint);
                lbl_chief_complaint_desc.Text = WebHelpers.FormatString(EmrViewModel.chief_complaint_desc);
                lbl_history_of_present.Text = WebHelpers.FormatString(EmrViewModel.history_of_present);
                lbl_past_med_his_meds.Text = WebHelpers.FormatString(EmrViewModel.past_med_his_meds);
                lbl_past_med_his_surs.Text = WebHelpers.FormatString(EmrViewModel.past_med_his_surs);

                lbl_habits.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(EmrViewModel.habits));
                lbl_habits.Text += WebHelpers.FormatString(EmrViewModel.habits_other);
                lbl_home_medications.Text = WebHelpers.FormatString(EmrViewModel.home_medications);
                lbl_allergies.Text = WebHelpers.FormatString(EmrViewModel.allergies);
                lbl_relevant_family_history.Text = WebHelpers.FormatString(EmrViewModel.relevant_family_history);

                lbl_finding.Text = WebHelpers.FormatString(EmrViewModel.finding);
                lbl_required_code.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.required_code));
                lbl_required_code.Text += WebHelpers.FormatString(EmrViewModel.required_text);
                lbl_investigations_results.Text = WebHelpers.FormatString(EmrViewModel.investigations_results);
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(EmrViewModel.initial_diagnosis);
                lbl_diferential_diagnosis.Text = WebHelpers.FormatString(EmrViewModel.diferential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.FormatString(EmrViewModel.associated_conditions);
                lbl_comfirmed_diagnosis.Text = WebHelpers.FormatString(EmrViewModel.comfirmed_diagnosis);
                lbl_specialist_opinion.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.specialist_opinion));

                specialist_opinion_change(Convert.ToString(EmrViewModel.specialist_opinion));

                lbl_name_of_specialist.Text = WebHelpers.FormatString(EmrViewModel.name_of_specialist);
                lbl_time_contaced.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(EmrViewModel.time_contaced));
                lbl_time_provided.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(EmrViewModel.time_provided));

                lbl_spec_opinion_summarised.Text = WebHelpers.FormatString(EmrViewModel.spec_opinion_summarised);

                WebHelpers.LoadDataGridView(grid_Treatment, WebHelpers.GetJSONToDataTable(EmrViewModel.treatment), Iina.SKIN_ANNO, btn_grid_Treatment_add);

                WebHelpers.LoadDataGridView(grid_progress_note, WebHelpers.GetJSONToDataTable(EmrViewModel.progress_note), Iina.SKIN_ANNO, btn_grid_progress_note_add);

                WebHelpers.VisibleControl(false, btn_grid_Treatment_add, btn_grid_progress_note_add);

                lbl_conclusions.Text = WebHelpers.FormatString(EmrViewModel.conclusions);
                lbl_discharge.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.discharge));
                lbl_prescription.Text = WebHelpers.FormatString(EmrViewModel.prescription);
                lbl_specify_care_instructions.Text = WebHelpers.FormatString(EmrViewModel.specify_care_instructions);
                lbl_discharge_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(EmrViewModel.discharge_time, "dd-MMM-yyyy HH:mm"));
                lbl_referred_to_OPD.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.referred_to_OPD, "Yes,specify/ Có, ghi rõ" + "<br/>" + WebHelpers.FormatString(EmrViewModel.referred_to_OPD_text)));

                lbl_hospitalisation_required.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.hospitalisation_required));
                lbl_reason.Text = WebHelpers.FormatString(EmrViewModel.reason);
                lbl_ward.Text = WebHelpers.FormatString(EmrViewModel.ward);
                lbl_time_of_leaving_emergency.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(EmrViewModel.time_of_leaving_emergency, "dd-MMM-yyyy HH:mm"));
                lbl_emergency_surgery.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.emergency_surgery));
                lbl_pre_operative_diagnosis.Text = WebHelpers.FormatString(EmrViewModel.pre_operative_diagnosis);
                lbl_brief_summary.Text = WebHelpers.FormatString(EmrViewModel.brief_summary);
                lbl_time_of_leaving_emer_e.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(EmrViewModel.time_of_leaving_emer_e, "dd-MMM-yyyy HH:mm"));

                if (EmrViewModel.hospitalisation_required != null)
                {
                    rad_hospitalisation_required_True.Checked = EmrViewModel.hospitalisation_required;
                }

                discharge_change(Convert.ToString(EmrViewModel.discharge));

                hos_req_change(Convert.ToString(EmrViewModel.hospitalisation_required));

                if (EmrViewModel.emergency_surgery != null)
                {
                    rad_emergency_surgery_True.Checked = EmrViewModel.emergency_surgery;
                }

                emergency_surgery_change(Convert.ToString(EmrViewModel.emergency_surgery));

                if (EmrViewModel.transfer_hospital != null)
                {
                    rad_transfer_hospital_True.Checked = EmrViewModel.transfer_hospital;
                }

                transfer_hospital_change(Convert.ToString(EmrViewModel.transfer_hospital));

                lbl_transfer_hospital.Text = WebHelpers.FormatString(WebHelpers.GetBool(EmrViewModel.transfer_hospital));
                lbl_reason_for_transfer.Text = WebHelpers.FormatString(EmrViewModel.reason_for_transfer);
                lbl_status_before_transfer.Text = WebHelpers.FormatString(EmrViewModel.status_before_transfer);
                lbl_time_of_leaving_emer_a.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(EmrViewModel.time_of_leaving_emer_a, "dd-MMM-yyyy HH:mm"));
                lbl_patient_discharge.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(EmrViewModel.patient_discharge));
                lbl_txt_patient_discharge.Text = WebHelpers.FormatString(EmrViewModel.txt_patient_discharge);
                lbl_icd_10.Text = WebHelpers.FormatString(EmrViewModel.icd_10);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }

        }
        public void BindingDataFormPrint(EmrViewModel EmrViewModel)
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
                prt_evaluation_time.Text = WebHelpers.FormatDateTime(EmrViewModel.evaluation_time, "HH:mm, dd/MM/yyyy");
                //WebHelpers.FormatDateTime(EmrViewModel.evaluation_time, "dd/MM/yyyy HH:mm tt");

                prt_chief_complaint.Text = EmrViewModel.chief_complaint;
                lbl_chief_complaint_code_R.Text = "❏";
                lbl_chief_complaint_code_E.Text = "❏";
                lbl_chief_complaint_code_U.Text = "❏";
                lbl_chief_complaint_code_L.Text = "❏";
                lbl_chief_complaint_code_N.Text = "❏";
                if (EmrViewModel.chief_complaint_code != null)
                {
                    //((HtmlInputRadioButton)FindControl("rad_chief_complaint_code_" + EmrViewModel.chief_complaint_code)).Checked = true;
                    if (EmrViewModel.chief_complaint_code == "R")
                    {
                        lbl_chief_complaint_code_R.Text = "☒";

                    }
                    else if (EmrViewModel.chief_complaint_code == "E")
                    {
                        lbl_chief_complaint_code_E.Text = "☒";

                    }
                    else if (EmrViewModel.chief_complaint_code == "U")
                    {
                        lbl_chief_complaint_code_U.Text = "☒";

                    }
                    else if (EmrViewModel.chief_complaint_code == "L")
                    {
                        lbl_chief_complaint_code_L.Text = "☒";

                    }
                    else if (EmrViewModel.chief_complaint_code == "N")
                    {
                        lbl_chief_complaint_code_N.Text = "☒";

                    }
                }

                if (EmrViewModel.chief_complaint_code == null || EmrViewModel.chief_complaint_code == "")
                {

                    lbl_chief_complaint_code_R.Text = "❏";
                    lbl_chief_complaint_code_E.Text = "❏";
                    lbl_chief_complaint_code_U.Text = "❏";
                    lbl_chief_complaint_code_L.Text = "❏";
                    lbl_chief_complaint_code_N.Text = "❏";
                }

                prt_history_of_present.Text = EmrViewModel.history_of_present;
                //Meds
                prt_past_med_his_meds.Text = EmrViewModel.past_med_his_meds;
                //Surgical
                prt_past_med_his_surs.Text = EmrViewModel.past_med_his_surs;
                string habits_temp = EmrViewModel.habits;
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

                lbl_habits_other.Text = EmrViewModel.habits_other;
                prt_home_medications.Text = EmrViewModel.home_medications;
                prt_allergies.Text = EmrViewModel.allergies;
                prt_relevant_family_history.Text = EmrViewModel.relevant_family_history;
                prt_finding.Text = EmrViewModel.finding;

                if (EmrViewModel.required_code != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_required_code_" + EmrViewModel.required_code)).Checked = true;
                    if (EmrViewModel.required_code = true)
                    {
                        lbl_required_code_True.Text = "☒";
                        lbl_required_code_False.Text = "❏";
                    }
                    if (EmrViewModel.required_code = false)
                    {
                        lbl_required_code_True.Text = "❏";
                        lbl_required_code_False.Text = "☒";
                    }
                }
                if (EmrViewModel.required_code == null && EmrViewModel.required_code == "")
                {

                    lbl_required_code_True.Text = "❏";
                    lbl_required_code_False.Text = "❏";

                }

                lbl_required_text.Text = EmrViewModel.required_text;
                prt_investigations_results.Text = EmrViewModel.investigations_results;
                prt_initial_diagnosis.Text = EmrViewModel.initial_diagnosis;
                prt_diferential_diagnosis.Text = EmrViewModel.diferential_diagnosis;
                prt_associated_conditions.Text = EmrViewModel.associated_conditions;
                prt_comfirmed_diagnosis.Text = EmrViewModel.comfirmed_diagnosis;
                if (EmrViewModel.specialist_opinion != null)
                {
                    if (EmrViewModel.specialist_opinion == true)
                    {
                        lbl_specialist_opinion_True.Text = "☒";
                        lbl_specialist_opinion_False.Text = "❏";
                        div_pecialistopinion.Visible = true;
                    }
                    if (EmrViewModel.specialist_opinion == false)
                    {
                        lbl_specialist_opinion_True.Text = "❏";
                        lbl_specialist_opinion_False.Text = "☒";
                    }

                }

                if (EmrViewModel.specialist_opinion == null && EmrViewModel.specialist_opinion == "")
                {
                    lbl_specialist_opinion_True.Text = "❏";
                    lbl_specialist_opinion_False.Text = "❏";
                }

                prt_name_of_specialist.Text = EmrViewModel.name_of_specialist;
                if (EmrViewModel.time_contaced != null)
                {
                    prt_time_contaced.Text = EmrViewModel.time_contaced.ToString("HH:mm");
                }
                if (EmrViewModel.time_provided != null)
                {
                    prt_time_provided.Text = EmrViewModel.time_provided.ToString("HH:mm");
                }
                prt_spec_opinion_summarised.Text = EmrViewModel.spec_opinion_summarised;

                DataTable treatment = WebHelpers.GetJSONToDataTable(EmrViewModel.treatment);

                if (treatment != null)
                {
                    foreach (DataRow row in treatment.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;
                        HtmlGenericControl p;
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = WebHelpers.FormatDateTime(Convert.ToString(row["time"]), "dd/MM/yyyy HH:mm tt") };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["medication"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dose"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["route"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";

                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["comment"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);

                        prt_treatment.Rows.Add(tr);
                    }
                }

                DataTable progress_note = WebHelpers.GetJSONToDataTable(EmrViewModel.progress_note);

                if (progress_note != null)
                {
                    foreach (DataRow row in progress_note.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;
                        HtmlGenericControl p;
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = WebHelpers.FormatDateTime(Convert.ToString(row["time"]), "dd/MM/yyyy HH:mm tt") };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["progress"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["appropriate_order"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);

                        prt_progress_note.Rows.Add(tr);
                    }
                }

                //prt_conclusions.Text = EmrViewModel.conclusions;
                if (EmrViewModel.discharge != null)
                {
                    if (EmrViewModel.discharge == true)
                    {
                        lbl_discharge_True.Text = "☒";
                        lbl_discharge_False.Text = "❏";
                        div_discharge_field.Visible = true;
                    }
                    if (EmrViewModel.discharge == false)
                    {
                        lbl_discharge_True.Text = "❏";
                        lbl_discharge_False.Text = "☒";
                    }

                }
                if (EmrViewModel.discharge == null)
                {
                    lbl_discharge_True.Text = "❏";
                    lbl_discharge_False.Text = "❏";
                }

                prt_prescription.Text = EmrViewModel.prescription;
                prt_specify_care_instructions.Text = EmrViewModel.specify_care_instructions;
                if (EmrViewModel.discharge_time != null)
                {
                    prt_discharge_time.Text = WebHelpers.FormatDateTime(EmrViewModel.discharge_time, "HH:mm");
                }
                if (EmrViewModel.referred_to_OPD != null)
                {
                    if (EmrViewModel.referred_to_OPD == true)
                    {
                        lbl_referred_to_OPD_True.Text = "☒";
                        lbl_referred_to_OPD_False.Text = "❏";
                    }
                    if (EmrViewModel.referred_to_OPD == false)
                    {
                        lbl_referred_to_OPD_True.Text = "❏";
                        lbl_referred_to_OPD_False.Text = "☒";
                    }
                }
                if (EmrViewModel.referred_to_OPD == null)
                {

                    lbl_referred_to_OPD_True.Text = "❏";
                    lbl_referred_to_OPD_False.Text = "❏";

                }

                lbl_referred_to_OPD_text.Text = EmrViewModel.referred_to_OPD_text;
                if (EmrViewModel.hospitalisation_required != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_hospitalisation_required_" + EmrViewModel.hospitalisation_required)).Checked = true;
                    if (EmrViewModel.hospitalisation_required == true)
                    {
                        lbl_hospitalisation_required_True.Text = "☒";
                        lbl_hospitalisation_required_False.Text = "❏";
                        div_hos_req_field.Visible = true;
                    }
                    if (EmrViewModel.hospitalisation_required == false)
                    {
                        lbl_hospitalisation_required_True.Text = "❏";
                        lbl_hospitalisation_required_False.Text = "☒";
                    }
                }
                if (EmrViewModel.hospitalisation_required == null && EmrViewModel.hospitalisation_required == "")
                {

                    lbl_hospitalisation_required_True.Text = "❏";
                    lbl_hospitalisation_required_False.Text = "❏";

                }

                prt_reason.Text = EmrViewModel.reason;
                prt_ward.Text = EmrViewModel.ward;

                if (EmrViewModel.time_of_leaving_emergency != null)
                {
                    prt_time_of_leaving_emergency.Text = WebHelpers.FormatDateTime(EmrViewModel.time_of_leaving_emergency, "HH:mm");
                }
                if (EmrViewModel.emergency_surgery != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_emergency_surgery_" + EmrViewModel.emergency_surgery)).Checked = true;
                    if (EmrViewModel.emergency_surgery == true)
                    {
                        lbl_emergency_surgery_True.Text = "☒";
                        lbl_emergency_surgery_False.Text = "❏";
                        div_emr_sur_field.Visible = true;
                    }
                    if (EmrViewModel.emergency_surgery == false)
                    {
                        lbl_emergency_surgery_True.Text = "❏";
                        lbl_emergency_surgery_False.Text = "☒";
                    }
                }
                if (EmrViewModel.emergency_surgery == null)
                {

                    lbl_emergency_surgery_True.Text = "❏";
                    lbl_emergency_surgery_False.Text = "❏";

                }

                lbl_preoperative_diagnosis.Text = EmrViewModel.pre_operative_diagnosis;
                prt_brief_summary.Text = EmrViewModel.pre_operative_diagnosis;

                if (EmrViewModel.time_of_leaving_emer_e != null)
                {
                    prt_time_of_leaving_emer_e.Text = WebHelpers.FormatDateTime(EmrViewModel.time_of_leaving_emer_e, "HH:mm");
                }
                if (EmrViewModel.transfer_hospital != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_transfer_hospital_" + EmrViewModel.transfer_hospital)).Checked = true;
                    if (EmrViewModel.transfer_hospital == true)
                    {
                        lbl_transfer_hospital_True.Text = "☒";
                        lbl_transfer_hospital_False.Text = "❏";
                        div_transfer_hos_field.Visible = true;
                    }
                    if (EmrViewModel.transfer_hospital == false)
                    {
                        lbl_transfer_hospital_True.Text = "❏";
                        lbl_transfer_hospital_False.Text = "☒";
                    }
                }
                if (EmrViewModel.transfer_hospital == null)
                {

                    lbl_transfer_hospital_True.Text = "❏";
                    lbl_transfer_hospital_False.Text = "❏";

                }

                prt_reason_for_transfer.Text = EmrViewModel.reason_for_transfer;
                prt_status_before_transfer.Text = EmrViewModel.status_before_transfer;
                if (EmrViewModel.time_of_leaving_emer_a != null)
                {
                    prt_time_of_leaving_emer_a.Text = WebHelpers.FormatDateTime(EmrViewModel.time_of_leaving_emer_a, "HH:mm");
                }
                string patient_discharge_temp = EmrViewModel.patient_discharge;
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

                txt_patient_discharge.Value = EmrViewModel.txt_patient_discharge;
                prt_patient_discharge.Text = EmrViewModel.txt_patient_discharge;
                prt_icd_10.Text = EmrViewModel.icd_10;

                prt_infected_with_covid_false.Text
                    = prt_infected_with_covid_true.Text
                    = prt_received_1_dose_true.Text
                    = prt_received_2_dose_true.Text
                    = prt_received_additional_true.Text
                    = prt_not_yet_vaccinations_true.Text
                    = "❏";

                Label infected_with_covid = FindControl("prt_infected_with_covid_" + EmrViewModel.infected_with_covid);
                if (infected_with_covid != null) infected_with_covid.Text = "☒";

                Label received_1_dose = FindControl("prt_received_1_dose_" + EmrViewModel.received_1_dose);
                if (received_1_dose != null) received_1_dose.Text = "☒";

                Label received_2_dose = FindControl("prt_received_2_dose_" + EmrViewModel.received_2_dose);
                if (received_2_dose != null) received_2_dose.Text = "☒";

                Label received_additional = FindControl("prt_received_additional_" + EmrViewModel.received_additional);
                if (received_additional != null) received_additional.Text = "☒";

                Label not_yet_vaccinations = FindControl("prt_not_yet_vaccinations_" + EmrViewModel.not_yet_vaccinations);
                if (not_yet_vaccinations != null) not_yet_vaccinations.Text = "☒";

                prt_other_vaccinations.Text = "• Tiêm vắc xin khác (ghi rõ)/ <span class=\"text-primary\">Other vaccinations (specify)</span>: " + EmrViewModel.other_vaccinations;

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
                FormModel = new EmrViewModel(varDocID, Location);
                FormModel.status = DocumentStatus.FINAL;

                UpdateData(FormModel);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                FormModel = new EmrViewModel(varDocID, Location);
                FormModel.status = DocumentStatus.DRAFT;

                UpdateData(FormModel);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = (new EmrViewModel(varDocID, Location)).Delete(UserId, Location)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, Location);
                    Response.Redirect(PAGE_URL_DEFAULT);
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, EmpId, Location, LocationChanged, AccessAuthorize))
            {
                FormModel = new EmrViewModel(varDocID, Location);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, FormModel, ControlState.Edit, IsViewLog, !IsLocationChanged, AccessAuthorize);
                //binding data
                BindingDataFormEdit(FormModel);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, Location);
            Initial();
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
        protected void btnHome_Click(object sender, EventArgs e) => Response.Redirect(PAGE_URL_DEFAULT);
        
        #endregion

        #region Functions
        public void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, Location);

                FormModel = new EmrViewModel(varDocID, Location, varDocIdLog);
                currentLog.Visible = !string.IsNullOrEmpty(varDocIdLog);

                LoadPatientInfo();
                //loadRadGridHistoryLog();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, FormModel.Logs(Location), out string SignatureDate, out string SignatureName);
                //SignatureDate = _SignatureDate;
                //SignatureName = _SignatureName;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                //if (EmrViewModel.status == DocumentStatus.FINAL)
                //{
                //    BindingDataForm(EmrViewModel, WebHelpers.LoadFormControl(form1, EmrViewModel, ControlState.View, IsViewLog, !IsLocationChanged, AccessAuthorize));

                //    BindingDataFormPrint(EmrViewModel);
                //}
                //else if (EmrViewModel.status == DocumentStatus.DRAFT)
                //{
                //    BindingDataForm(EmrViewModel, WebHelpers.LoadFormControl(form1, EmrViewModel, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                //}

                BindingDataForm(FormModel, WebHelpers.LoadFormControl(form1, FormModel, FormModel.status == DocumentStatus.FINAL ? ControlState.View : ControlState.Edit, IsViewLog, !IsLocationChanged, AccessAuthorize));

                // WebHelpers.getAccessButtons(form1, emr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
                
                WebHelpers.getAccessButtons(new AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = FormModel.status,
                    AccessGroup = GroupAccess,
                    AccessAuthorize = AccessAuthorize,
                    IsSameCompanyCode = !IsLocationChanged,
                    IsViewLog = IsViewLog
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
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason) => WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
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
        protected string GetLogUrl(object doc_log_id) => PAGE_URL + $"&docIdLog={doc_log_id}";
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e) => (sender as HyperLink).NavigateUrl = PAGE_URL;
        public void UpdateData(EmrViewModel EmrViewModel)
        {
            try
            {

                EmrViewModel.evaluation_time = DataHelpers.ConvertSQLDateTime(dtpk_evaluation_time.SelectedDate);
                EmrViewModel.chief_complaint = txt_chief_complaint.Value;
                EmrViewModel.chief_complaint_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_chief_complaint_code_", EmergencyMedicalRecord.ChiefComplaintCode);
                EmrViewModel.chief_complaint_desc = WebHelpers.GetDicDesc(EmrViewModel.chief_complaint_code, EmergencyMedicalRecord.ChiefComplaintCode);
                EmrViewModel.history_of_present = txt_history_of_present.Value;
                EmrViewModel.past_med_his_meds = txt_past_med_his_meds.Value;
                EmrViewModel.past_med_his_surs = txt_past_med_his_surs.Value;
                EmrViewModel.habits = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_habits_", EmergencyMedicalRecord.Habits, out DataTable habits, "cde");

                if (cb_habits_O.Checked)
                {
                    EmrViewModel.habits_other = txt_habits_other.Value;
                }

                EmrViewModel.habits = JsonConvert.SerializeObject(habits);
                EmrViewModel.home_medications = txt_home_medications.Value;
                EmrViewModel.allergies = txt_allergies.Value;
                EmrViewModel.relevant_family_history = txt_relevant_family_history.Value;
                EmrViewModel.finding = txt_finding.Value;

                if (rad_required_code_True.Checked)
                {
                    EmrViewModel.required_code = true;
                    EmrViewModel.required_text = txt_required_text.Value;
                }
                if (rad_required_code_False.Checked)
                {
                    EmrViewModel.required_code = false;
                    EmrViewModel.required_text = "";
                }

                EmrViewModel.investigations_results = txt_investigations_results.Value;
                EmrViewModel.initial_diagnosis = txt_initial_diagnosis.Value;
                EmrViewModel.diferential_diagnosis = txt_diferential_diagnosis.Value;
                EmrViewModel.associated_conditions = txt_associated_conditions.Value;
                EmrViewModel.comfirmed_diagnosis = txt_comfirmed_diagnosis.Value;

                if (rad_specialist_opinion_True.Checked)
                {
                    EmrViewModel.specialist_opinion = true;
                    EmrViewModel.name_of_specialist = txt_name_of_specialist.Value;
                    EmrViewModel.time_contaced = DataHelpers.ConvertSQLDateTime(dtpk_time_contaced.SelectedDate);
                    EmrViewModel.time_provided = DataHelpers.ConvertSQLDateTime(dtpk_time_provided.SelectedDate);
                    EmrViewModel.spec_opinion_summarised = txt_spec_opinion_summarised.Value;

                }
                if (rad_specialist_opinion_False.Checked)
                {
                    EmrViewModel.specialist_opinion = false;
                    EmrViewModel.name_of_specialist = "";
                    EmrViewModel.time_contaced = null;
                    EmrViewModel.time_provided = null;
                    EmrViewModel.spec_opinion_summarised = "";

                }
                //DataTable Treatment_tb = new DataTable();
                //foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.Treatment)
                //{
                //    Treatment_tb.Columns.Add(col.Key);
                //}
                EmrViewModel.treatment = WebHelpers.GetDataGridView(grid_Treatment, EmergencyMedicalRecord.Treatment);

                //DataTable Progress_note_tb = new DataTable();
                //foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.ProgressNote)
                //{
                //    Progress_note_tb.Columns.Add(col.Key);
                //}
                //emr.progress_note = WebHelpers.GetJSONFromTable(grid_progress_note, Progress_note_tb);
                EmrViewModel.progress_note = WebHelpers.GetDataGridView(grid_progress_note, EmergencyMedicalRecord.ProgressNote);

                EmrViewModel.conclusions = txt_conclusions.Value;
                if (rad_discharge_True.Checked)
                {
                    EmrViewModel.discharge = true;
                    EmrViewModel.prescription = txt_prescription.Value;
                    EmrViewModel.specify_care_instructions = txt_specify_care_instructions.Value;
                    EmrViewModel.discharge_time = DataHelpers.ConvertSQLDateTime(dtpk_discharge_time.SelectedDate);

                }
                if (rad_discharge_False.Checked)
                {
                    EmrViewModel.discharge = false;
                    EmrViewModel.prescription = "";
                    EmrViewModel.specify_care_instructions = "";
                    EmrViewModel.discharge_time = null;
                }
                if (rad_referred_to_OPD_True.Checked)
                {
                    EmrViewModel.referred_to_OPD = true;
                    EmrViewModel.referred_to_OPD_text = txt_referred_to_OPD_text.Value;
                }
                if (rad_referred_to_OPD_False.Checked)
                {
                    EmrViewModel.referred_to_OPD = false;
                    EmrViewModel.referred_to_OPD_text = "";

                }
                if (rad_hospitalisation_required_True.Checked)
                {
                    EmrViewModel.hospitalisation_required = true;
                    EmrViewModel.reason = txt_reason.Value;
                    EmrViewModel.ward = txt_ward.Value;
                    EmrViewModel.time_of_leaving_emergency = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emergency.SelectedDate);
                }
                if (rad_hospitalisation_required_False.Checked)
                {
                    EmrViewModel.hospitalisation_required = false;
                    EmrViewModel.reason = "";
                    EmrViewModel.ward = "";
                    EmrViewModel.time_of_leaving_emergency = null;
                }
                if (rad_emergency_surgery_True.Checked)
                {
                    EmrViewModel.emergency_surgery = true;
                    EmrViewModel.pre_operative_diagnosis = txt_pre_operative_diagnosis.Value;
                    EmrViewModel.brief_summary = txt_brief_summary.Value;
                    EmrViewModel.time_of_leaving_emer_e = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emer_e.SelectedDate);
                }
                if (rad_emergency_surgery_False.Checked)
                {
                    EmrViewModel.emergency_surgery = false;
                    EmrViewModel.pre_operative_diagnosis = "";
                    EmrViewModel.brief_summary = "";
                    EmrViewModel.time_of_leaving_emer_e = null;
                }
                if (rad_transfer_hospital_True.Checked)
                {
                    EmrViewModel.transfer_hospital = true;
                    EmrViewModel.reason_for_transfer = txt_reason_for_transfer.Value;
                    EmrViewModel.status_before_transfer = txt_status_before_transfer.Value;
                    EmrViewModel.time_of_leaving_emer_a = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emer_a.SelectedDate);
                }
                if (rad_transfer_hospital_False.Checked)
                {
                    EmrViewModel.transfer_hospital = false;
                    EmrViewModel.reason_for_transfer = "";
                    EmrViewModel.status_before_transfer = "";
                    EmrViewModel.time_of_leaving_emer_a = null;
                }

                EmrViewModel.patient_discharge = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_patient_discharge_", EmergencyMedicalRecord.PatientDischarge, "cde");

                EmrViewModel.txt_patient_discharge = txt_patient_discharge.Value;

                EmrViewModel.icd_10 = txt_icd_10.Value;

                if (JsonConvert.SerializeObject(EmrViewModel) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                //Update v2.0
                EmrViewModel.infected_with_covid = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_");
                EmrViewModel.received_1_dose = cb_received_1_dose_true.Checked;
                EmrViewModel.received_2_dose = cb_received_2_dose_true.Checked;
                EmrViewModel.received_additional = cb_received_additional_true.Checked;
                EmrViewModel.other_vaccinations = txt_other_vaccinations.Value;
                EmrViewModel.not_yet_vaccinations = cb_not_yet_vaccinations_true.Checked;
                
                EmrViewModel.amend_reason = txt_amend_reason.Text;
                EmrViewModel.user_name = UserId;

                dynamic result = EmrViewModel.Update(Location)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
            finally
            {
                WebHelpers.clearSessionDoc(Page, varDocID, Location);
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
            //args.IsValid = !string.IsNullOrEmpty(txt_conclusions.Value);
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

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            BindingDataFormPrint(new EmrViewModel(varDocID, Location, varDocIdLog));
            WebHelpers.AddJS(Page, "btnPrint_Click()");
        }

        public void BindingDataForm(bool state)
        {
            throw new NotImplementedException();
        }

        public void BindingDataFormView()
        {
            throw new NotImplementedException();
        }

        public void BindingDataFormEdit()
        {
            throw new NotImplementedException();
        }

        public void BindingDataFormPrint()
        {
            throw new NotImplementedException();
        }

        public void UpdateModel()
        {
            throw new NotImplementedException();
        }
    }
}
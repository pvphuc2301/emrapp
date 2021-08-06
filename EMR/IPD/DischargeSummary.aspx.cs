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

namespace EMR
{
    public partial class DischargeSummary : System.Web.UI.Page
    {
        Diss diss;
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
            if(!WebHelpers.CheckSession(this)) return;

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = Request.QueryString["loc"];

            PAGE_URL = $"/IPD/DischargeSummary.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack) {
                
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                LoadPatientInfo();

                Initial(); 
            }

            PostBackEvent();
        }

        private void LoadPatientInfo()
        {
            lblFirstName.Text = patientInfo.first_name_l;
            lblLastName.Text = patientInfo.last_name_l;
            lblGender.Text = patientInfo.gender_l;

            WebHelpers.ConvertDateTime(patientInfo.DOB,  out bool isValid, out string DOB, "dd-MM-yyyy");
            lblDoB.Text = DOB + " (" + patientInfo.Age + "t)";
            
            lblPatientAddress.Text = patientInfo.Address;
            lblContactPerson.Text = patientInfo.Contact;

            lblVisitCode.Text = patientVisitInfo.VisitCode;

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
        }

        #region Binding Data

        private void BindingDataForm(Diss diss, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(diss);
            }
            else
            {
                BindingDataFormView(diss);
            }
        }
        private void BindingDataFormView(Diss diss)
        {
            try
            {
                lbl_disc_reason_desc.Text = WebHelpers.TextToHtmlTag(diss.disc_reason_desc);
                lbl_date_of_hospital.Text = WebHelpers.FormatDateTime(diss.date_of_hospital, "dd-MMM-yyyy");
                lbl_date_of_discharge.Text = WebHelpers.FormatDateTime(diss.date_of_discharge, "dd-MMM-yyyy");
                lbl_admission_reason.Text = WebHelpers.TextToHtmlTag(diss.admission_reason);
                lbl_icd10_diagnosis.Text = WebHelpers.TextToHtmlTag(diss.icd10_diagnosis);
                lbl_associated_diagnosis.Text = WebHelpers.TextToHtmlTag(diss.associated_diagnosis);
                lbl_cur_med_history.Text = WebHelpers.TextToHtmlTag(diss.cur_med_history);
                lbl_ant_med_history.Text = WebHelpers.TextToHtmlTag(diss.ant_med_history);
                lbl_physical_finding.Text = WebHelpers.TextToHtmlTag(diss.physical_finding);
                lbl_lab_result.Text = WebHelpers.TextToHtmlTag(diss.lab_result);
                lbl_patho_result_desc.Text = WebHelpers.TextToHtmlTag(diss.patho_result_desc);
                lbl_proce_performed.Text = WebHelpers.TextToHtmlTag(diss.proce_performed);
                lbl_treatment.Text = WebHelpers.TextToHtmlTag(diss.treatment);
                lbl_evolution.Text = WebHelpers.TextToHtmlTag(diss.evolution);
                lbl_disc_condition.Text = WebHelpers.TextToHtmlTag(diss.disc_condition);
                lbl_disc_medication.Text = WebHelpers.TextToHtmlTag(diss.disc_medication);
                lbl_follow_up_instruc.Text = WebHelpers.TextToHtmlTag(diss.follow_up_instruc);
                lbl_special_diet.Text = WebHelpers.TextToHtmlTag(diss.special_diet);
                lbl_next_consult_date.Text = WebHelpers.FormatDateTime(diss.next_consult_date, "dd-MMM-yyyy");
                lbl_next_consult_doctor.Text = WebHelpers.TextToHtmlTag(diss.next_consult_doctor);
                lbl_dama.Text = WebHelpers.TextToHtmlTag(diss.dama);
                lbl_dama_note.Text = WebHelpers.TextToHtmlTag(diss.dama_note);
                lbl_transfer_reason.Text = WebHelpers.TextToHtmlTag(diss.transfer_reason);
                lbl_trans_to_hospital.Text = WebHelpers.TextToHtmlTag(diss.trans_to_hospital);
                lbl_signed_date.Text = WebHelpers.FormatDateTime(diss.signed_date, "dd-MMM-yyyy");
                lbl_signed_doctor.Text = WebHelpers.TextToHtmlTag(diss.signed_doctor);

                LoadDischargeReason(diss.disc_reason_code);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormEdit(Diss diss)
        {
            try
            {
                txt_amend_reason.Text = "";
                LoadDischargeReason(diss.disc_reason_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_disc_reason_code_" + diss.disc_reason_code);

                WebHelpers.BindDateTimePicker(dpk_date_of_hospital, diss.date_of_hospital);

                WebHelpers.BindDateTimePicker(dpk_date_of_discharge, diss.date_of_discharge);
                //1
                txt_admission_reason.Value = WebHelpers.TextToHtmlTag(diss.admission_reason);
                //2
                txt_icd10_diagnosis.Value = WebHelpers.TextToHtmlTag(diss.icd10_diagnosis);
                txt_associated_diagnosis.Value = WebHelpers.TextToHtmlTag(diss.associated_diagnosis);
                //3
                txt_cur_med_history.Value = WebHelpers.TextToHtmlTag(diss.cur_med_history);
                txt_ant_med_history.Value = WebHelpers.TextToHtmlTag(diss.ant_med_history);
                //4
                txt_physical_finding.Value = WebHelpers.TextToHtmlTag(diss.physical_finding);
                //5
                txt_lab_result.Value = WebHelpers.TextToHtmlTag(diss.lab_result);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_patho_result_code_" + diss.patho_result_code);

                //6
                txt_proce_performed.Value = WebHelpers.TextToHtmlTag(diss.proce_performed);
                //7
                txt_treatment.Value = WebHelpers.TextToHtmlTag(diss.treatment);
                //8
                txt_evolution.Value = WebHelpers.TextToHtmlTag(diss.evolution);
                //9
                txt_disc_condition.Value = WebHelpers.TextToHtmlTag(diss.disc_condition);
                //10
                if (diss.disc_reason_code == "DAMA")
                {
                    txt_disc_medication.Visible = false;
                }
                else
                {
                    txt_disc_medication.Value = WebHelpers.TextToHtmlTag(diss.disc_medication);
                }
                //11
                txt_follow_up_instruc.Value = WebHelpers.TextToHtmlTag(diss.follow_up_instruc);
                //12
                txt_special_diet.Value = WebHelpers.TextToHtmlTag(diss.special_diet);
                //13
                WebHelpers.BindDateTimePicker(dpk_next_consult_date, diss.next_consult_date);
                txt_next_consult_doctor.Value = WebHelpers.TextToHtmlTag(diss.next_consult_doctor);

                //dama
                txt_dama.Value = WebHelpers.TextToHtmlTag(diss.dama);
                txt_dama_note.Value = WebHelpers.TextToHtmlTag(diss.dama_note);

                // transfer
                txt_trans_to_hospital.Value = WebHelpers.TextToHtmlTag(diss.trans_to_hospital);
                txt_transfer_reason.Value = WebHelpers.TextToHtmlTag(diss.transfer_reason);

                WebHelpers.BindDateTimePicker(dpk_signed_date, diss.signed_date);
                txt_signed_doctor.Value = diss.signed_doctor;

                //DataObj.Value = JsonConvert.SerializeObject(diss);
                //Session["docid"] = diss.document_id;
                WebHelpers.AddScriptFormEdit(Page, diss, (string)Session["emp_id"], loc);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        private void BindingDataFormPrint(Diss diss)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_fullname.InnerText = string.Format("{0} - {1}", patientInfo.FullName, patientInfo.Gender);

                prt_DOB.InnerText = "DOB: " + WebHelpers.FormatDateTime(patientInfo.DOB, "dd-MM-yyyy", "");

                prt_vpid.InnerText = string.Format("{0} - {1} - {2}", patientInfo.visible_patient_id, patientVisitInfo.visit_type, patientVisitInfo.visit_code);
                
                prt_date_of_hospital.Text = WebHelpers.FormatDateTime(diss.date_of_hospital);

                prt_date_of_discharge.Text = WebHelpers.FormatDateTime(diss.date_of_discharge);
                //1
                prt_admission_reason.Text = WebHelpers.TextToHtmlTag(diss.admission_reason);
                //2
                prt_icd10_diagnosis.Text = WebHelpers.TextToHtmlTag(diss.icd10_diagnosis);
                //3
                prt_cur_med_history.Text = WebHelpers.TextToHtmlTag(diss.cur_med_history);
                //4
                prt_physical_finding.Text = WebHelpers.TextToHtmlTag(diss.physical_finding);
                //5
                prt_lab_result.Text = WebHelpers.TextToHtmlTag(diss.lab_result);
                //6
                prt_proce_performed.Text = WebHelpers.TextToHtmlTag(diss.proce_performed);
                //7
                prt_treatment.Text = WebHelpers.TextToHtmlTag(diss.treatment);
                //8
                prt_evolution.Text = WebHelpers.TextToHtmlTag(diss.evolution);
                //9
                prt_disc_condition.Text = WebHelpers.TextToHtmlTag(diss.disc_condition);
                //10
                prt_disc_medication.Text = WebHelpers.TextToHtmlTag(diss.disc_medication);

                WebHelpers.VisibleControl(false, prt_follow_up_instruc, prt_special_diet, prt_next_consult, prt_dama, prt_trans_to_hospital, prt_transfer_reason, prt_disc_medication, prt_dama_title, prt_disc_medication_title, prt_trans_to_hospital_title, prt_transfer_reason_title, prt_follow_up_instruc_title, prt_special_diet_title, prt_next_consult_title);
                
                if (diss.disc_reason_code == "DAMA")
                {
                    //10
                    WebHelpers.VisibleControl(true, prt_dama_title, prt_dama);
                    prt_dama.Text = WebHelpers.TextToHtmlTag(diss.dama);

                }
                else if (diss.disc_reason_code == "TRANSFER")
                {
                    //10
                    WebHelpers.VisibleControl(true, prt_disc_medication, prt_disc_medication_title, prt_trans_to_hospital, prt_trans_to_hospital_title, prt_transfer_reason, prt_transfer_reason_title);
                    prt_disc_medication.Text = WebHelpers.TextToHtmlTag(diss.disc_medication);
                    //11
                    prt_trans_to_hospital.Text = WebHelpers.TextToHtmlTag(diss.trans_to_hospital);

                    prt_transfer_reason.Text = WebHelpers.TextToHtmlTag(diss.transfer_reason);
                }
                else if (diss.disc_reason_code == "AMA")
                {
                    WebHelpers.VisibleControl(true, prt_disc_medication, prt_disc_medication_title, prt_follow_up_instruc, prt_follow_up_instruc_title, prt_special_diet, prt_special_diet_title, prt_next_consult, prt_next_consult_title);
                    //10
                    prt_disc_medication.Text = WebHelpers.TextToHtmlTag(diss.disc_medication);
                    //11
                    prt_follow_up_instruc.Text = WebHelpers.TextToHtmlTag(diss.follow_up_instruc);
                    //12
                    prt_special_diet.Text = WebHelpers.TextToHtmlTag(diss.special_diet);
                    //13
                    prt_next_consult.Text = $"{WebHelpers.FormatDateTime(diss.next_consult_date, "dd-MM-yyyy", "")} {diss.next_consult_doctor}";
                }

                prt_signature_date.Text = WebHelpers.FormatDateTime(SignatureDate, "dd-MM-yyyy", "");

                prt_signature_doctor.Text = SignatureName;
            }
            catch(Exception ex)
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
                Diss diss = new Diss(varDocID, loc);
                diss.status = DocumentStatus.FINAL;
                
                UpdateData(diss);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Diss diss = new Diss(varDocID, loc);
                diss.status = DocumentStatus.DRAFT;

                UpdateData(diss);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
           
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc
                ))
            {
                Diss diss = new Diss(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, diss, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(diss);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try { 
                dynamic result = Diss.Delete((string)Session["UserId"], varDocID, loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);
                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
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
                if (varDocIdLog != null)
                {
                    diss = new Diss(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    diss = new Diss(varDocID, loc);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (diss.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(diss, WebHelpers.LoadFormControl(form1, diss, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(diss);
                }
                else if (diss.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(diss, WebHelpers.LoadFormControl(form1, diss, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, diss.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Diss.Logs(varDocID, loc);
            RadGrid1.DataSource = dt;
            string last_updated_date_time = "";
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_e");

                WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("created_date_time"), out bool isValid, out last_updated_date_time);

                if (isValid)
                {
                    SignatureDate = last_updated_date_time;
                }
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("submited_name_e");
                WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("created_date_time"), out bool isValid, out last_updated_date_time);

                if (isValid)
                {
                    SignatureDate = last_updated_date_time;
                }
            }

            SignatureName = last_updated_doctor;

            RadLabel1.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{Convert.ToDateTime(last_updated_date_time).ToString("dd-MMM-yyyy HH:mm tt")}</i></b>";
            RadGrid1.DataBind();
        }

        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended";
            object name = "";
            object time = "";

            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                name = created_name;
                time = created_date_time;
            }
            else
            {
                name = modified_name;
                time = created_date_time;
            }

            WebHelpers.ConvertDateTime(time, out bool isValid, out string dateTime, "dd-MMM-yyyy HH:mm tt");

            return $"{result} by <i>{name}</i> on <i>{dateTime}</i>";
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = PAGE_URL+ $"&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        public void UpdateData(Diss diss)
        {
            try
            {
                diss.disc_reason_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_disc_reason_code_", Diss.DISC_REASON_CODE);
                if (diss.disc_reason_code != null) diss.disc_reason_desc = Diss.DISC_REASON_CODE[diss.disc_reason_code];

                diss.date_of_hospital = DataHelpers.ConvertSQLDateTime(dpk_date_of_hospital.SelectedDate);
                diss.date_of_discharge = DataHelpers.ConvertSQLDateTime(dpk_date_of_discharge.SelectedDate);
                diss.admission_reason = txt_admission_reason.Value;
                diss.icd10_diagnosis = txt_icd10_diagnosis.Value;
                diss.associated_diagnosis = txt_associated_diagnosis.Value;
                diss.cur_med_history = txt_cur_med_history.Value;
                diss.ant_med_history = txt_ant_med_history.Value;
                diss.physical_finding = txt_physical_finding.Value;
                diss.lab_result = txt_lab_result.Value;

                diss.patho_result_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_patho_result_code_", Diss.PATHO_RESULT_CODE);
                if (diss.patho_result_code != null) diss.patho_result_desc = Diss.PATHO_RESULT_CODE[diss.patho_result_code];

                diss.proce_performed = txt_proce_performed.Value;
                diss.treatment = txt_treatment.Value;
                diss.evolution = txt_evolution.Value;
                diss.disc_condition = txt_disc_condition.Value;
                diss.disc_medication = txt_disc_medication.Value;

                if (diss.disc_reason_code == "TRANSFER")
                {
                    diss.disc_medication = txt_disc_medication.Value;
                    diss.trans_to_hospital = txt_trans_to_hospital.Value;
                    diss.transfer_reason = txt_transfer_reason.Value;

                    //
                    diss.next_consult_date = null;
                    diss.next_consult_doctor = null;
                    diss.dama = null;
                    diss.dama_note = null;

                }
                else if (diss.disc_reason_code == "AMA")
                {
                    diss.disc_medication = txt_disc_medication.Value;
                    diss.follow_up_instruc = txt_follow_up_instruc.Value;
                    diss.special_diet = txt_special_diet.Value;
                    diss.next_consult_date = DataHelpers.ConvertSQLDateTime(dpk_next_consult_date.SelectedDate);
                    diss.next_consult_doctor = txt_next_consult_doctor.Value;

                    //
                    diss.transfer_reason = null;
                    diss.trans_to_hospital = null;
                }
                else if (diss.disc_reason_code == "DAMA")
                {
                    diss.dama = txt_dama.Value;
                    diss.dama_note = txt_dama_note.Value;

                    //
                    diss.next_consult_date = null;
                    diss.next_consult_doctor = null;
                    diss.transfer_reason = null;
                    diss.trans_to_hospital = null;
                }

                diss.signed_date = DataHelpers.ConvertSQLDateTime(dpk_signed_date.SelectedDate);
                diss.signed_doctor = txt_signed_doctor.Value;
                

                if (JsonConvert.SerializeObject(diss) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                diss.user_name = (string)Session["UserID"];
                diss.amend_reason = txt_amend_reason.Text;

                dynamic result = diss.Update(loc)[0];

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
        }
        private void LoadDischargeReason(string value)
        {
            WebHelpers.VisibleControl(false, disc_medication_field, transfer_field, follow_up_field, special_diet_field, next_consultation_field, dama_field);
            if(value == null) { return; }
            if (value.ToUpper() == "DAMA")
            {
                WebHelpers.VisibleControl(true, dama_field);
            }
            else if (value.ToUpper() == "TRANSFER")
            {
                WebHelpers.VisibleControl(true, disc_medication_field, transfer_field);
            }
            else if (value.ToUpper() == "AMA")
            {
                WebHelpers.VisibleControl(true, next_consultation_field, special_diet_field, follow_up_field, disc_medication_field);
            }
        }
        private void PostBackEvent()
        {
            if (Request["__EVENTTARGET"] == "discReasonCode_Change")
            {
                LoadDischargeReason(Request["__EVENTARGUMENT"]);
            }
        }
        #endregion

        #region Validations
        protected void disc_reason_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_disc_reason_code_ama.Checked || rad_disc_reason_code_dama.Checked || rad_disc_reason_code_transfer.Checked;
        }
        protected void disc_reason_code_ama_ServerChange(object sender, EventArgs e)
        {
            LoadDischargeReason("AMA");
        }
        protected void disc_reason_code_dama_ServerChange(object sender, EventArgs e)
        {
            LoadDischargeReason("DAMA");
        }
        protected void disc_reason_code_transfer_ServerChange(object sender, EventArgs e)
        {
            LoadDischargeReason("TRANSFER");
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
    }
}
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!WebHelpers.CheckSession(this)) return;
            if (!IsPostBack) { 
                Initial(); 
            }
            PostBackEvent();
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
                lbl_disc_reason_desc.Text = WebHelpers.FormatString(diss.disc_reason_desc);
                lbl_date_of_hospital.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(diss.date_of_hospital));
                lbl_date_of_discharge.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(diss.date_of_discharge));
                lbl_admission_reason.Text = WebHelpers.FormatString(diss.admission_reason);
                lbl_icd10_diagnosis.Text = WebHelpers.FormatString(diss.icd10_diagnosis);
                lbl_associated_diagnosis.Text = WebHelpers.FormatString(diss.associated_diagnosis);
                lbl_cur_med_history.Text = WebHelpers.FormatString(diss.cur_med_history);
                lbl_ant_med_history.Text = WebHelpers.FormatString(diss.ant_med_history);
                lbl_physical_finding.Text = WebHelpers.FormatString(diss.physical_finding);
                lbl_lab_result.Text = WebHelpers.FormatString(diss.lab_result);
                lbl_patho_result_desc.Text = WebHelpers.FormatString(diss.patho_result_desc);
                lbl_proce_performed.Text = WebHelpers.FormatString(diss.proce_performed);
                lbl_treatment.Text = WebHelpers.FormatString(diss.treatment);
                lbl_evolution.Text = WebHelpers.FormatString(diss.evolution);
                lbl_disc_condition.Text = WebHelpers.FormatString(diss.disc_condition);
                lbl_disc_medication.Text = WebHelpers.FormatString(diss.disc_medication);
                lbl_follow_up_instruc.Text = WebHelpers.FormatString(diss.follow_up_instruc);
                lbl_special_diet.Text = WebHelpers.FormatString(diss.special_diet);
                lbl_next_consult_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(diss.next_consult_date));
                lbl_next_consult_doctor.Text = WebHelpers.FormatString(diss.next_consult_doctor);
                lbl_dama.Text = WebHelpers.FormatString(diss.dama);
                lbl_dama_note.Text = WebHelpers.FormatString(diss.dama_note);
                lbl_transfer_reason.Text = WebHelpers.FormatString(diss.transfer_reason);
                lbl_trans_to_hospital.Text = WebHelpers.FormatString(diss.trans_to_hospital);
                lbl_signed_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(diss.signed_date));
                lbl_signed_doctor.Text = WebHelpers.FormatString(diss.signed_doctor);

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
                txt_admission_reason.Value = diss.admission_reason;
                //2
                txt_icd10_diagnosis.Value = diss.icd10_diagnosis;
                txt_associated_diagnosis.Value = diss.associated_diagnosis;
                //3
                txt_cur_med_history.Value = diss.cur_med_history;
                txt_ant_med_history.Value = diss.ant_med_history;
                //4
                txt_physical_finding.Value = diss.physical_finding;
                //5
                txt_lab_result.Value = diss.lab_result;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_patho_result_code_" + diss.patho_result_code);

                //6
                txt_proce_performed.Value = diss.proce_performed;
                //7
                txt_treatment.Value = diss.treatment;
                //8
                txt_evolution.Value = diss.evolution;
                //9
                txt_disc_condition.Value = diss.disc_condition;
                //10
                if (diss.disc_reason_code == "DAMA")
                {
                    txt_disc_medication.Visible = false;
                }
                else
                {
                    txt_disc_medication.Value = diss.disc_medication;
                }
                //11
                txt_follow_up_instruc.Value = diss.follow_up_instruc;
                //12
                txt_special_diet.Value = diss.special_diet;
                //13
                WebHelpers.BindDateTimePicker(dpk_next_consult_date, diss.next_consult_date);
                txt_next_consult_doctor.Value = diss.next_consult_doctor;

                //dama
                txt_dama.Value = diss.dama;
                txt_dama_note.Value = diss.dama_note;

                // transfer
                txt_trans_to_hospital.Value = diss.trans_to_hospital;
                txt_transfer_reason.Value = diss.transfer_reason;

                WebHelpers.BindDateTimePicker(dpk_signed_date, diss.signed_date);
                txt_signed_doctor.Value = diss.signed_doctor;

                DataObj.Value = JsonConvert.SerializeObject(diss);
                Session["docid"] = diss.document_id;
                WebHelpers.AddScriptFormEdit(Page, diss, (string)Session["emp_id"]);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        private void BindingDataFormPrint(Diss diss)
        {
            try
            {
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();
                WebHelpers.gen_BarCode(Patient.Instance().visible_patient_id, BarCode);
                prt_fullname.InnerText = string.Format("{0} - {1}", patient.GetFullName(), patient.gender_l);
                prt_DOB.InnerText = "DOB: " + WebHelpers.FormatDateTime(patient.date_of_birth);
                prt_vpid.InnerText = string.Format("{0} - {1} - {2}", patient.visible_patient_id, patientVisit.visit_type, patientVisit.visit_code);
                
                prt_date_of_hospital.Text = WebHelpers.FormatDateTime(diss.date_of_hospital);

                prt_date_of_discharge.Text = WebHelpers.FormatDateTime(diss.date_of_discharge);
                //1
                prt_admission_reason.Text = diss.admission_reason;
                //2
                prt_icd10_diagnosis.Text = diss.icd10_diagnosis;
                //3
                prt_cur_med_history.Text = diss.cur_med_history;
                //4
                prt_physical_finding.Text = diss.physical_finding;
                //5
                prt_lab_result.Text = diss.lab_result;
                //6
                prt_proce_performed.Text = diss.proce_performed;
                //7
                prt_treatment.Text = diss.treatment;
                //8
                prt_evolution.Text = diss.evolution;
                //9
                prt_disc_condition.Text = diss.disc_condition;
                //10
                prt_disc_medication.Text = diss.disc_medication;

                WebHelpers.VisibleControl(false, prt_follow_up_instruc, prt_special_diet, prt_next_consult, prt_dama, prt_trans_to_hospital, prt_transfer_reason, prt_disc_medication, prt_dama_title, prt_disc_medication_title, prt_trans_to_hospital_title, prt_transfer_reason_title, prt_follow_up_instruc_title, prt_special_diet_title, prt_next_consult_title);
                
                if (diss.disc_reason_code == "DAMA")
                {
                    //10
                    WebHelpers.VisibleControl(true, prt_dama_title, prt_dama);
                    prt_dama.Text = diss.dama;

                }
                else if (diss.disc_reason_code == "TRANSFER")
                {
                    //10
                    WebHelpers.VisibleControl(true, prt_disc_medication, prt_disc_medication_title, prt_trans_to_hospital, prt_trans_to_hospital_title, prt_transfer_reason, prt_transfer_reason_title);
                    prt_disc_medication.Text = diss.disc_medication;
                    //11
                    prt_trans_to_hospital.Text = diss.trans_to_hospital;

                    prt_transfer_reason.Text = diss.transfer_reason;
                }
                else if (diss.disc_reason_code == "AMA")
                {
                    WebHelpers.VisibleControl(true, prt_disc_medication, prt_disc_medication_title, prt_follow_up_instruc, prt_follow_up_instruc_title, prt_special_diet, prt_special_diet_title, prt_next_consult, prt_next_consult_title);
                    //10
                    prt_disc_medication.Text = diss.disc_medication;
                    //11
                    prt_follow_up_instruc.Text = diss.follow_up_instruc;
                    //12
                    prt_special_diet.Text = diss.special_diet;
                    //13
                    prt_next_consult.Text = $"{WebHelpers.FormatDateTime(diss.next_consult_date)} {diss.next_consult_doctor}";
                }

                DateTime signature_date = (DateTime)Session["signature_date"];
                prt_signature_date.Text = signature_date.ToString("dd-MM-yyyy");
                prt_signature_doctor.Text = (string)Session["signature_doctor"];

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
                Diss diss = new Diss(Request.QueryString["docId"]);
                diss.status = DocumentStatus.FINAL;
                
                UpdateData(diss);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Diss diss = new Diss(Request.QueryString["docId"]);
                diss.status = DocumentStatus.DRAFT;

                UpdateData(diss);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            

            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Diss diss = new Diss(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, diss, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(diss);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try { 
                dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
        }
        #endregion

        #region Functions
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpid"] != null) DataHelpers.varPVId = Request.QueryString["vpid"];

            try
            {
                Diss diss;
                if (Request.QueryString["docIdLog"] != null)
                {
                    diss = new Diss(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    diss = new Diss(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }


                loadRadGridHistoryLog();
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (diss.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(diss, WebHelpers.LoadFormControl(form1, diss, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(diss);
                }
                else if (diss.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(diss, WebHelpers.LoadFormControl(form1, diss, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, diss.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Diss.Logs(Request.QueryString["docId"]);
            RadGrid1.DataSource = dt;
            DateTime last_updated_date_time = new DateTime();
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("created_date_time");
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("modified_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("modified_date_time");
            }

            Session["signature_date"] = last_updated_date_time;
            Session["signature_doctor"] = last_updated_doctor;
            RadLabel1.Text = $"Last updated by {last_updated_doctor} on " + WebHelpers.FormatDateTime(last_updated_date_time, "dd-MM-yyyy HH:mm");
            RadGrid1.DataBind();
        }

        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended by";
            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted by";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved by";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                result += $" {created_name} on {created_date_time}";
            }
            else
            {
                result += $" {modified_name} on {modified_date_time}";
            }
            return result;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/IPD/DischargeSummary.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/DischargeSummary.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
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

                dynamic result = diss.Update()[0];

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
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
    }
}
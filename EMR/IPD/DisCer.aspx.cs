﻿using EMR.UserControls;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class DischargeCertificate : System.Web.UI.Page
    {
        Disc disc;
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

            PAGE_URL = $"/IPD/DisCer.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Disc disc, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(disc);
            }
            else
            {
                BindingDataFormView(disc);
            }
        }
        private void BindingDataFormView(Disc disc)
        {
            try
            {
                lbl_disc_ward_desc.Text = WebHelpers.FormatString(disc.disc_ward_desc);
                lbl_no_health_insurance.Text = WebHelpers.FormatString(disc.no_health_insurance);
                lbl_valid_from.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(disc.valid_from));
                lbl_disc_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(disc.disc_date_time));
                lbl_diagnosis.Text = WebHelpers.FormatString(disc.diagnosis);
                lbl_disc_medication.Text = WebHelpers.FormatString(disc.disc_medication);
                lbl_followup_instruc.Text = WebHelpers.FormatString(disc.followup_instruc);
                lbl_notes.Text = WebHelpers.FormatString(disc.notes);
                lbl_signature_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(disc.signature_date));
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormEdit(Disc disc)
        {
            try
            {
                txt_amend_reason.Text = "";

                WebHelpers.DataBind(form1, select_disc_ward_code, Disc.DISC_WARD_CODE, disc.disc_ward_code);

                txt_no_health_insurance.Value = disc.no_health_insurance;
                dpk_valid_from.SelectedDate = disc.valid_from;
                WebHelpers.BindDateTimePicker(dtpk_disc_date_time, disc.disc_date_time);
                txt_diagnosis.Value = disc.diagnosis;
                txt_disc_medication.Value = disc.disc_medication;
                txt_followup_instruc.Value = disc.followup_instruc;
                txt_notes.Value = disc.notes;
                dpk_signature_date.SelectedDate = disc.signature_date;

                DataObj.Value = JsonConvert.SerializeObject(disc);
                Session["docid"] = disc.document_id;
                WebHelpers.AddScriptFormEdit(Page, disc, (string)Session["emp_id"], loc);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormPrint(Disc disc)
        {
            try
            {
                prt_disc_ward_desc.Text = disc.disc_ward_desc;

                prt_fullname.Text = patientInfo.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth);
                prt_vpid.Text = patientInfo.visible_patient_id;
                prt_gender.Text = patientInfo.Gender;
                prt_nationality.Text = patientInfo.GetNationality();
                prt_occupation.Text = patientInfo.GetOccupation();
                prt_valid_from.Text = WebHelpers.FormatDateTime(disc.valid_from);
                //prt_to.Text
                prt_no_health_insurance.Text = disc.no_health_insurance;
                prt_address.Text = patientInfo.Address;
                prt_admitted_time.dateTime = Convert.ToString(patientVisitInfo.actual_visit_date_time);
                prt_disc_date_time.dateTime = Convert.ToString(disc.disc_date_time);
                prt_diagnosis.Text = disc.diagnosis;
                prt_treatment.Text = disc.disc_medication;
                prt_followup_instruc.Text = disc.followup_instruc;
                prt_notes.Text = disc.notes;
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        #endregion

        #region Actions
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Disc disc = new Disc(Request.QueryString["docId"], loc);
                disc.status = DocumentStatus.FINAL;
                
                UpdateData(disc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Disc disc = new Disc(Request.QueryString["docId"], loc);
                disc.status = DocumentStatus.DRAFT;

                UpdateData(disc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Disc.Delete((string)Session["UserId"], Request.QueryString["docId"], loc)[0];

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
            if (WebHelpers.CanOpenForm(Page, (string)varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc))
            {
                Disc disc = new Disc(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, disc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(disc);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
            Initial();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Methods
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Disc.Logs(varDocID, loc);
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

            SignatureDate = last_updated_date_time;
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

                string url = PAGE_URL + $"&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        public string GetDocIdLink(string args)
        {
            return PAGE_URL;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        protected void UpdateData(Disc disc)
        {
            try
            {
                disc.no_discharge = disc.no_discharge;
                disc.disc_ward_code = select_disc_ward_code.Value;
                disc.disc_ward_desc = WebHelpers.GetDicDesc(disc.disc_ward_code, Disc.DISC_WARD_CODE);
                disc.no_health_insurance = txt_no_health_insurance.Value;
                disc.valid_from = DataHelpers.ConvertSQLDateTime(dpk_valid_from.SelectedDate);
                disc.disc_date_time = DataHelpers.ConvertSQLDateTime(dtpk_disc_date_time.SelectedDate);
                disc.diagnosis = txt_diagnosis.Value;
                disc.disc_medication = txt_disc_medication.Value;
                disc.followup_instruc = txt_followup_instruc.Value;
                disc.notes = txt_notes.Value;
                disc.signature_date = DataHelpers.ConvertSQLDateTime(dpk_signature_date.SelectedDate);

                if (JsonConvert.SerializeObject(disc) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                disc.amend_reason = txt_amend_reason.Text;
                disc.user_name = (string)Session["UserID"];

                dynamic result = disc.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);

                    Initial();
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    disc = new Disc(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    disc = new Disc(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                loadRadGridHistoryLog();
                
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                prt_admitted_time.dateTime = Convert.ToString(patientVisitInfo.actual_visit_date_time);
                prt_disc_date_time.dateTime = Convert.ToString(disc.disc_date_time);
                prt_date.dateTime = prt_date1.dateTime = Convert.ToString(disc.signature_date);

                if (disc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(disc, WebHelpers.LoadFormControl(form1, disc, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(disc);
                }
                else if (disc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(disc, WebHelpers.LoadFormControl(form1, disc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, disc.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Select")
            {
                Response.Redirect(PAGE_URL);
            }
        }

        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
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
    }
}
﻿using EMR.Classes;
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
    public partial class SurgicalCertificate : System.Web.UI.Page
    {
        Surc surc;
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

            PAGE_URL = $"/IPD/SurgicalCertificate.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Surc surc, bool state)
        {
            admission_date.Text = WebHelpers.FormatDateTime(surc.admission_date);
            procedure_date.Text = WebHelpers.FormatDateTime(surc.procedure_date);

            if (state)
            {
                BindingDataFormEdit(surc);
            }
            else
            {
                BindingDataFormView(surc);
            }
        }
        private void BindingDataFormEdit(Surc surc)
        {
            try
            {
                txt_amend_reason.Text = "";
                WebHelpers.BindDateTimePicker(dpk_discharge_date, surc.discharge_date);
                txt_preo_diagnosis.Value = WebHelpers.TextToHtmlTag(surc.preo_diagnosis);
                txt_name_of_procedure.Value = WebHelpers.TextToHtmlTag(surc.name_of_procedure);
                txt_proce_narrative.Value = WebHelpers.TextToHtmlTag(surc.proce_narrative);
                txt_blood_type.Value = WebHelpers.TextToHtmlTag(surc.blood_type);
                txt_rh.Value = WebHelpers.TextToHtmlTag(surc.rh);

                //DataObj.Value = JsonConvert.SerializeObject(surc);
                //Session["docid"] = surc.document_id;
                WebHelpers.AddScriptFormEdit(Page, surc, (string)Session["emp_id"], loc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Surc surc)
        {
            try
            {
                LoadBarCode();
                lbl_discharge_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(surc.discharge_date));
                lbl_preo_diagnosis.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surc.preo_diagnosis));
                lbl_name_of_procedure.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surc.name_of_procedure));
                lbl_proce_narrative.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surc.proce_narrative));
                lbl_blood_type.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surc.blood_type));
                lbl_rh.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surc.rh));
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
            
        }
        private void BindingDataFormPrint(Surc surc)
        {
            try
            {
                prt_vpid.Text = prt_vpid1.Text = patientInfo.visible_patient_id;

                prt_fullname.Text = patientInfo.GetFullName(true);
                prt_patient_name_e.Text = $"/ {patientInfo.GetFullName(false)}";

                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth);
                
                LoadBarCode();

                if (patientInfo.Gender == "Male" || patientInfo.Gender == "Nam")
                {
                    prt_male.Text = "☒";
                }
                else if (patientInfo.Gender == "Female" || patientInfo.Gender == "Nữ")
                {
                    prt_female.Text = "☒";
                }

                prt_address.Text = patientInfo.GetAddress(true);
                prt_address_e.Text = $"/ {patientInfo.GetAddress(false)}";

                prt_admission_date.Text = WebHelpers.FormatDateTime(surc.admission_date);
                prt_procedure_date.Text = WebHelpers.FormatDateTime(surc.procedure_date);
                prt_discharge_date.Text = WebHelpers.FormatDateTime(surc.discharge_date);
                prt_preo_diagnosis.Text = WebHelpers.TextToHtmlTag(surc.preo_diagnosis);
                prt_name_of_procedure.Text = WebHelpers.TextToHtmlTag(surc.name_of_procedure);
                prt_proce_narrative.Text = WebHelpers.TextToHtmlTag(surc.proce_narrative);
                prt_blood_type.Text = WebHelpers.TextToHtmlTag(surc.blood_type);
                prt_rh.Text = WebHelpers.TextToHtmlTag(surc.rh);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surc surc = new Surc(Request.QueryString["docId"], loc);
                surc.status = DocumentStatus.FINAL;
                
                UpdateData(surc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surc surc = new Surc(Request.QueryString["docId"], loc);
                surc.status = DocumentStatus.DRAFT;

                UpdateData(surc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"], loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Surc surc = new Surc(Request.QueryString["docId"], loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, surc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(surc);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
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

                if (varDocIdLog != null)
                {
                    surc = new Surc(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    surc = new Surc(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Surc.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;


                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (surc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(surc, WebHelpers.LoadFormControl(form1, surc, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(surc);
                }
                else if (surc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(surc, WebHelpers.LoadFormControl(form1, surc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, surc.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = surc.status,
                    AccessGroup = (string)Session["group_access"],
                    AccessAuthorize = (string)Session["access_authorize"],
                    IsSameCompanyCode = loc == locChanged,
                    IsViewLog = varDocIdLog != null
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
        
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
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
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        public void UpdateData(Surc surc)
        {
            try
            {

                surc.admission_date = DataHelpers.ConvertSQLDateTime(surc.admission_date);
                surc.procedure_date = DataHelpers.ConvertSQLDateTime(surc.procedure_date);
                surc.discharge_date = DataHelpers.ConvertSQLDateTime(dpk_discharge_date.SelectedDate);
                surc.preo_diagnosis = txt_preo_diagnosis.Value;
                surc.name_of_procedure = txt_name_of_procedure.Value;
                surc.proce_narrative = txt_proce_narrative.Value;
                surc.blood_type = txt_blood_type.Value;
                surc.rh = txt_rh.Value;

                if (JsonConvert.SerializeObject(surc) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                surc.amend_reason = txt_amend_reason.Text;
                surc.user_name = (string)Session["UserID"];

                dynamic result = surc.Update(loc)[0];

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

        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);

        }
        private void LoadBarCode()
        {
            IBarcodeGenerator barcodeGenerator = new BarcodeGenerator();
            BarCode.Controls.Clear();
            BarCode.Controls.Add(barcodeGenerator.Generator(patientInfo.visible_patient_id));
        }
    }
}
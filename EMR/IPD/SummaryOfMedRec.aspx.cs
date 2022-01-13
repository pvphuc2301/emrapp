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
    public partial class SummaryOfMedicalReport : System.Web.UI.Page
    {
        Somr somr;
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
            if (!WebHelpers.CheckSession(this)) { return; }

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            PAGE_URL = $"/IPD/SummaryOfMedRec.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }
        
        #region Binding Data
        private void BindingDataForm(Somr somr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(somr);
            }
            else
            {
                BindingDataFormView(somr);
            }
        }
        private void BindingDataFormEdit(Somr somr)
        {
            try
            {
                txt_amend_reason.Text = "";

                WebHelpers.BindDateTimePicker(dpk_form_date, somr.form_date);
                WebHelpers.BindDateTimePicker(dpk_to_date, somr.to_date);
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(somr.chief_complaint);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(somr.diagnosis);
                txt_clinical_evolution.Value = WebHelpers.TextToHtmlTag(somr.clinical_evolution);
                txt_result_para_clinical.Value = WebHelpers.TextToHtmlTag(somr.result_para_clinical);
                txt_treatment.Value = WebHelpers.TextToHtmlTag(somr.treatment);
                txt_eval_treatment.Value = WebHelpers.TextToHtmlTag(somr.eval_treatment);
                txt_treatment_prognosis.Value = WebHelpers.TextToHtmlTag(somr.treatment_prognosis);

                DataObj.Value = JsonConvert.SerializeObject(somr);
                Session["docid"] = somr.document_id;
                WebHelpers.AddScriptFormEdit(Page, somr, (string)Session["emp_id"], loc);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Somr somr)
        {
            try
            {
                lbl_form_date.Text = WebHelpers.FormatDateTime(somr.form_date);
                lbl_to_date.Text = WebHelpers.FormatDateTime(somr.to_date);
                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(somr.chief_complaint);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(somr.diagnosis);
                lbl_clinical_evolution.Text = WebHelpers.TextToHtmlTag(somr.clinical_evolution);
                lbl_result_para_clinical.Text = WebHelpers.TextToHtmlTag(somr.result_para_clinical);
                lbl_treatment.Text = WebHelpers.TextToHtmlTag(somr.treatment);
                lbl_eval_treatment.Text = WebHelpers.TextToHtmlTag(somr.eval_treatment);
                lbl_treatment_prognosis.Text = WebHelpers.TextToHtmlTag(somr.treatment_prognosis);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(Somr somr)
        {
            try
            {
                prt_fullname.Text = string.Format("{0} ({1})", patientInfo.FullName, patientInfo.Title);
                prt_dob.Text = string.Format("{0} | {1}", WebHelpers.FormatDateTime(patientInfo.date_of_birth), patientInfo.Gender);
                prt_vpid.Text = patientInfo.visible_patient_id;
                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_department.Text = patientVisitInfo.getDept();
                prt_form_date.Text = WebHelpers.FormatDateTime(somr.form_date);
                prt_to_date.Text = WebHelpers.FormatDateTime(somr.to_date);
                
                prt_eval_treatment.Text = WebHelpers.TextToHtmlTag(somr.eval_treatment);
                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(somr.chief_complaint);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(somr.diagnosis);
                prt_clinical_evolution.Text = WebHelpers.TextToHtmlTag(somr.clinical_evolution);
                prt_result_para_clinical.Text = WebHelpers.TextToHtmlTag(somr.result_para_clinical);
                prt_treatment.Text = WebHelpers.TextToHtmlTag(somr.treatment);
                prt_treatment_prognosis.Text = WebHelpers.TextToHtmlTag(somr.treatment_prognosis);

                string signature_date = WebHelpers.FormatDateTime(SignatureDate, "dd-MM-yyyy", "");

                prt_signature_date1.Text = prt_signature_date2.Text = "Ngày/ Date: " + signature_date;
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
                Somr somr = new Somr(varDocID, loc);
                somr.status = DocumentStatus.FINAL;
                
                UpdateData(somr);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Somr somr = new Somr(varDocID, loc);
                somr.status = DocumentStatus.DRAFT;

                UpdateData(somr);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Somr somr = new Somr(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, somr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(somr);
                //get access button
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
            Initial();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Disc.Delete((string)Session["UserID"], varDocID, loc)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);
                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Functions
        public void UpdateData(Somr somr)
        {
            try
            {
                somr.form_date = DataHelpers.ConvertSQLDateTime(dpk_form_date.SelectedDate);
                somr.to_date = DataHelpers.ConvertSQLDateTime(dpk_to_date.SelectedDate);
                somr.chief_complaint = txt_chief_complaint.Value;
                somr.diagnosis = txt_diagnosis.Value;
                somr.clinical_evolution = txt_clinical_evolution.Value;
                somr.result_para_clinical = txt_result_para_clinical.Value;
                somr.treatment = txt_treatment.Value;
                somr.eval_treatment = txt_eval_treatment.Value;
                somr.treatment_prognosis = txt_treatment_prognosis.Value;
                
                if (JsonConvert.SerializeObject(somr) == DataObj.Value) { 
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error");  return; 
                }
                
                somr.amend_reason = txt_amend_reason.Text;
                somr.user_name = (string)Session["UserID"];

                dynamic result = somr.Update(loc)[0];

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
        public void Initial()
        {
            try
            {
                
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    somr = new Somr(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    somr = new Somr(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Somr.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;


                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                if (somr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(somr, WebHelpers.LoadFormControl(form1, somr, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(somr);
                }
                else if (somr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(somr, WebHelpers.LoadFormControl(form1, somr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, somr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
                
                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = somr.status,
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
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/IPD/SummaryOfMedRec.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/SummaryOfMedRec.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
        }
    }
}
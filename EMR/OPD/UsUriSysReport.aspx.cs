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
    public partial class USUrinarySystemReport : System.Web.UI.Page
    {
        #region Variables
        Uusr uusr;
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
        #endregion

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

            PAGE_URL = $"/OPD/UsUriSystem.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Uusr uusr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(uusr);
            }
            else
            {
                BindingDataFormView(uusr);
            }
        }
        private void BindingDataFormEdit(Uusr uusr)
        {
            try
            {
                txt_amend_reason.Text = "";
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(uusr.diagnosis);
                txt_left_kidney.Value = WebHelpers.TextToHtmlTag(uusr.left_kidney);
                txt_right_kidney.Value = WebHelpers.TextToHtmlTag(uusr.right_kidney);
                txt_urinary_bladder.Value = WebHelpers.TextToHtmlTag(uusr.urinary_bladder);
                txt_prostate.Value = WebHelpers.TextToHtmlTag(uusr.prostate);
                txt_post_void_resi_volume.Value = WebHelpers.TextToHtmlTag(uusr.post_void_resi_volume);
                txt_conclusion.Value = WebHelpers.TextToHtmlTag(uusr.conclusion);
                txt_recommendation.Value = WebHelpers.TextToHtmlTag(uusr.recommendation);

                DataObj.Value = JsonConvert.SerializeObject(uusr);
                Session["docid"] = uusr.document_id;
                WebHelpers.AddScriptFormEdit(Page, uusr, (string)Session["emp_id"], loc);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        private void BindingDataFormView(Uusr uusr)
        {
            try {
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(uusr.diagnosis);
                lbl_left_kidney.Text = WebHelpers.TextToHtmlTag(uusr.left_kidney);
                lbl_right_kidney.Text = WebHelpers.TextToHtmlTag(uusr.right_kidney);
                lbl_urinary_bladder.Text = WebHelpers.TextToHtmlTag(uusr.urinary_bladder);
                lbl_prostate.Text = WebHelpers.TextToHtmlTag(uusr.prostate);
                lbl_post_void_resi_volume.Text = WebHelpers.TextToHtmlTag(uusr.post_void_resi_volume);
                lbl_conclusion.Text = WebHelpers.TextToHtmlTag(uusr.conclusion);
                lbl_recommendation.Text = WebHelpers.TextToHtmlTag(uusr.recommendation);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormPrint(Uusr uusr)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                prt_pid.Text = prt_vpid.Text = patientInfo.visible_patient_id;
                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_fullname.Text = patientInfo.FullName;

                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(uusr.diagnosis);
                prt_left_kidney.Text = WebHelpers.TextToHtmlTag(uusr.left_kidney);
                prt_right_kidney.Text = WebHelpers.TextToHtmlTag(uusr.right_kidney);
                prt_urinary_bladder.Text = WebHelpers.TextToHtmlTag(uusr.urinary_bladder);
                prt_prostate.Text = WebHelpers.TextToHtmlTag(uusr.prostate);
                prt_post_void_resi_volume.Text = WebHelpers.TextToHtmlTag(uusr.post_void_resi_volume);
                prt_conclusion.Text = WebHelpers.TextToHtmlTag(uusr.conclusion);
                prt_recommendation.Text = WebHelpers.TextToHtmlTag(uusr.recommendation);

                string signature_date = WebHelpers.FormatDateTime(SignatureDate, "dd-MM-yyyy", "");
                prt_signature_date.Text = "Ngày/ Date: " + signature_date;
                prt_signature_doctor.Text = SignatureName;

            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(varDocID, loc);
                uusr.status = DocumentStatus.FINAL;
                
                UpdateData(uusr);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(varDocID, loc);
                uusr.status = DocumentStatus.DRAFT;
                
                UpdateData(uusr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try { 
                dynamic result = Uusr.Delete((string)Session["UserID"], varDocID, loc)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);

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
            if (WebHelpers.CanOpenForm(Page, (string)varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Uusr uusr = new Uusr(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form2, uusr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(uusr);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                uusr = new Uusr(varDocID, loc);
                BindingDataFormPrint(uusr);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Methods
        private void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    uusr = new Uusr(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    uusr = new Uusr(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Uusr.Logs(varDocID, loc), out string SignatureDate, out string SignatureName);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (uusr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(uusr, WebHelpers.LoadFormControl(form2, uusr, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(uusr);
                }
                else if (uusr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(uusr, WebHelpers.LoadFormControl(form2, uusr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form2, uusr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void LoadPatientInfo()
        {
            lblFirstName.Text = patientInfo.FirstName;
            lblLastName.Text = patientInfo.LastName;
            lblGender.Text = patientInfo.Gender;

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
        private void UpdateData(Uusr uusr)
        {
            try
            {
                
                uusr.diagnosis = txt_diagnosis.Value;
                uusr.left_kidney = txt_left_kidney.Value;
                uusr.right_kidney = txt_right_kidney.Value;
                uusr.urinary_bladder = txt_urinary_bladder.Value;
                uusr.prostate = txt_prostate.Value;
                uusr.post_void_resi_volume = txt_post_void_resi_volume.Value;
                uusr.conclusion = txt_conclusion.Value;
                uusr.recommendation = txt_recommendation.Value;

                if (JsonConvert.SerializeObject(uusr) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                uusr.amend_reason = txt_amend_reason.Text;
                uusr.user_name = (string)Session["UserID"];

                dynamic result = uusr.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);

                    Initial();
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
    }
}
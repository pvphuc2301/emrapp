using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.DBP.OPD
{
    public partial class OutPatMedRec : System.Web.UI.Page
    {
        Omr omr;
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

            PAGE_URL = $"/OPD/OutPatMedRec.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

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
                case "rad_treatment_code_change":
                    rad_treatment_code_change((string)Request["__EVENTARGUMENT"]);
                    break;

            }
        }
        private void rad_treatment_code_change(string code)
        {
            if (code == null) { code = "opd"; }
            switch (code.ToUpper())
            {
                case "OPD":
                    WebHelpers.VisibleControl(true, current_medication_field);
                    break;
                default:
                    WebHelpers.VisibleControl(false, current_medication_field);
                    break;
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
                    omr = new Omr(varDocIdLog, true, loc);
                    currentLog.Visible = true;

                }
                else
                {
                    omr = new Omr(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Omr.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;


                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (omr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    //BindingDataFormPrint(omr);
                }
                else if (omr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, omr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        private void BindingDataForm(Omr omr, bool state)
        {
            if (state)
            {
                //BindingDataFormEdit(omr);
            }
            else
            {
                //BindingDataFormView(omr);
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
    }
}
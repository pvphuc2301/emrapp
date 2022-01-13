using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.IPD
{
    public partial class SurgicalReport : System.Web.UI.Page
    {
        Surr surr;
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
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            PAGE_URL = $"/IPD/SurgicalReport.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Surr surr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(surr);
            }
            else
            {
                BindingDataFormView(surr);
            }
        }
        private void BindingDataFormEdit(Surr surr)
        {
            try
            {
                txt_amend_reason.Text = "";
                WebHelpers.BindDateTimePicker(dpk_procedure_date, surr.procedure_date);
                txt_start_time.Text = surr.start_time;
                txt_finish_time.Text = surr.finish_time;
                txt_preo_diagnosis.Value = WebHelpers.TextToHtmlTag(surr.preo_diagnosis);
                txt_post_diagnosis.Value = WebHelpers.TextToHtmlTag(surr.post_diagnosis);
                txt_name_procedure.Value = WebHelpers.TextToHtmlTag(surr.name_procedure);
                txt_surgeon.Value = WebHelpers.TextToHtmlTag(surr.surgeon);
                txt_assistant_surgeon.Value = WebHelpers.TextToHtmlTag(surr.assistant_surgeon);
                txt_anesthesiologist.Value = WebHelpers.TextToHtmlTag(surr.anesthesiologist);
                txt_anesthesia.Value = WebHelpers.TextToHtmlTag(surr.anesthesia);
                txt_anesthetic_nurse.Value = WebHelpers.TextToHtmlTag(surr.anesthetic_nurse);
                txt_scrub_nurse.Value = WebHelpers.TextToHtmlTag(surr.scrub_nurse);
                txt_circulating_nurse.Value = WebHelpers.TextToHtmlTag(surr.circulating_nurse);
                txt_estimated_bloodloss.Value = WebHelpers.TextToHtmlTag(surr.estimated_bloodloss);
                txt_biopsy_pathology.Value = WebHelpers.TextToHtmlTag(surr.biopsy_pathology);
                txt_complications.Value = WebHelpers.TextToHtmlTag(surr.complications);
                txt_procedure_chart.Value = WebHelpers.TextToHtmlTag(surr.procedure_chart);
                txt_procedure_narrative.Value = WebHelpers.TextToHtmlTag(surr.procedure_narrative);

                //DataObj.Value = JsonConvert.SerializeObject(surr);
                //Session["docid"] = surr.document_id;
                WebHelpers.AddScriptFormEdit(Page, surr, (string)Session["emp_id"], loc);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Surr surr)
        {
            try
            {
                //3
                lbl_procedure_date.Text = WebHelpers.FormatDateTime(surr.procedure_date, "dd-MMM-yyyy");
                lbl_start_time.Text = WebHelpers.FormatString(surr.start_time);
                lbl_finish_time.Text = WebHelpers.FormatString(surr.finish_time);
                //4
                lbl_preo_diagnosis.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.preo_diagnosis));
                //5
                lbl_post_diagnosis.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.post_diagnosis));
                //6
                lbl_name_procedure.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.name_procedure));
                //7
                lbl_anesthesia.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.anesthesia));
                //8
                lbl_surgeon.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.surgeon));
                lbl_assistant_surgeon.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.assistant_surgeon));
                lbl_anesthesiologist.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.anesthesiologist));
                lbl_anesthetic_nurse.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.anesthetic_nurse));
                lbl_scrub_nurse.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.scrub_nurse));
                lbl_circulating_nurse.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.circulating_nurse));
                lbl_estimated_bloodloss.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.estimated_bloodloss));
                lbl_biopsy_pathology.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.biopsy_pathology));
                lbl_complications.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.complications));
                lbl_procedure_chart.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.procedure_chart));
                lbl_procedure_narrative.Text = WebHelpers.FormatString(WebHelpers.TextToHtmlTag(surr.procedure_narrative));
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(Surr surr)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                prt_vpid.Text = patientInfo.visible_patient_id;
                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_FullName.Text = patientInfo.FullName;
                prt_admission_date.Text = WebHelpers.FormatDateTime(patientVisitInfo.actual_visit_date_time);

                prt_procedure_date.Text = WebHelpers.FormatDateTime(surr.procedure_date);
                prt_start_time.Text = surr.start_time;
                prt_finish_time.Text = surr.finish_time;
                prt_preo_diagnosis.Text = WebHelpers.TextToHtmlTag(surr.preo_diagnosis);
                prt_post_diagnosis.Text = WebHelpers.TextToHtmlTag(surr.post_diagnosis);
                prt_name_procedure.Text = WebHelpers.TextToHtmlTag(surr.name_procedure);
                prt_anesthesia.Text = WebHelpers.TextToHtmlTag(surr.anesthesia);
                prt_surgeon.Text = WebHelpers.TextToHtmlTag(surr.surgeon);
                prt_assistant_surgeon.Text = WebHelpers.TextToHtmlTag(surr.assistant_surgeon);
                prt_anesthesiologist.Text = WebHelpers.TextToHtmlTag(surr.anesthesiologist);
                prt_anesthetic_nurse.Text = WebHelpers.TextToHtmlTag(surr.anesthetic_nurse);
                prt_scrub_nurse.Text = WebHelpers.TextToHtmlTag(surr.scrub_nurse);
                prt_circulating_nurse.Text = WebHelpers.TextToHtmlTag(surr.circulating_nurse);
                prt_estimated_bloodloss.Text = WebHelpers.TextToHtmlTag(surr.estimated_bloodloss);
                prt_biopsy_pathology.Text = WebHelpers.TextToHtmlTag(surr.biopsy_pathology);
                prt_complications.Text = WebHelpers.TextToHtmlTag(surr.complications);
                prt_procedure_chart.Text = WebHelpers.TextToHtmlTag(surr.procedure_chart);
                prt_procedure_narrative.Text = WebHelpers.TextToHtmlTag(surr.procedure_narrative);

                //string signature_date = "Ngày/ Date: " + WebHelpers.FormatDateTime(SignatureDate, "dd-MM-yyyy", "");

                //prt_signature_date.Text = signature_date;
                //prt_signature_name.Text = SignatureName;
                

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
                Surr surr = new Surr(varDocID, loc);
                surr.status = DocumentStatus.FINAL;
                
                UpdateData(surr);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surr surr = new Surr(varDocID, loc);
                surr.status = DocumentStatus.DRAFT;
                
                UpdateData(surr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Surr.Delete((string)Session["UserID"], varDocID, loc)[0];
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
            if (WebHelpers.CanOpenForm(Page,  (string)varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Surr surr = new Surr(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, surr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(surr);
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
            Surr surr = new Surr(varDocID, loc);
            BindingDataFormPrint(surr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
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
                    surr = new Surr(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    surr = new Surr(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Surr.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                if (surr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(surr, WebHelpers.LoadFormControl(form1, surr, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(surr);
                }
                else if (surr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(surr, WebHelpers.LoadFormControl(form1, surr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, surr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
                
                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = surr.status,
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

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MMM-yyyy");
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
        private void UpdateData(Surr surr)
        {
            try
            {
                //3
                surr.procedure_date = DataHelpers.ConvertSQLDateTime(dpk_procedure_date.SelectedDate);
                surr.start_time = txt_start_time.Text;
                surr.finish_time = txt_finish_time.Text;
                //4
                surr.preo_diagnosis = txt_preo_diagnosis.Value;
                //5
                surr.post_diagnosis = txt_post_diagnosis.Value;
                //6
                surr.name_procedure = txt_name_procedure.Value;
                //7
                surr.anesthesia = txt_anesthesia.Value;
                //8
                surr.surgeon = txt_surgeon.Value;
                //9
                surr.assistant_surgeon = txt_assistant_surgeon.Value;
                //10
                surr.anesthesiologist = txt_anesthesiologist.Value;
                //11
                surr.anesthetic_nurse = txt_anesthetic_nurse.Value;
                //12
                surr.scrub_nurse = txt_scrub_nurse.Value;
                //13
                surr.circulating_nurse = txt_circulating_nurse.Value;
                //14
                surr.estimated_bloodloss = txt_estimated_bloodloss.Value;
                //15
                surr.biopsy_pathology = txt_biopsy_pathology.Value;
                //16
                surr.complications = txt_complications.Value;
                //
                surr.procedure_chart = txt_procedure_chart.Value;
                surr.procedure_narrative = txt_procedure_narrative.Value;

                if (JsonConvert.SerializeObject(surr) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                surr.amend_reason = txt_amend_reason.Text;
                surr.user_name = (string)Session["UserID"];

                dynamic result = surr.Update(loc)[0];

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
            WebHelpers.clearSessionDoc(Page, varDocID, loc);

        }
    }
}



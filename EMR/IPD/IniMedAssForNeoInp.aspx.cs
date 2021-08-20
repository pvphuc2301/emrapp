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
    public partial class IniMedAssForNeoInp : System.Web.UI.Page
    {
        Imani imani;
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

            PAGE_URL = $"/IPD/IniMedAssForNeoInp.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Imani imani, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(imani);
            }
            else
            {
                BindingDataFormView(imani);
            }
        }
        private void BindingDataFormEdit(Imani imani)
        {
            try
            {
                txt_amend_reason.Text = "";

                txt_admission_reason.Value = WebHelpers.TextToHtmlTag(imani.admission_reason);
                txt_cur_med_history.Value = WebHelpers.TextToHtmlTag(imani.cur_med_history);
                txt_cur_medication.Value = WebHelpers.TextToHtmlTag(imani.cur_medication);
                txt_delivery.Value = WebHelpers.TextToHtmlTag(imani.delivery);
                txt_post_nutrition.Value = WebHelpers.TextToHtmlTag(imani.post_nutrition);
                txt_mater_med_history.Value = WebHelpers.TextToHtmlTag(imani.mater_med_history);
                txt_exam_weight.Value = WebHelpers.TextToHtmlTag(imani.exam_weight);
                txt_exam_length.Value = WebHelpers.TextToHtmlTag(imani.exam_length);
                txt_exam_head_circum.Value = WebHelpers.TextToHtmlTag(imani.exam_head_circum);
                txt_exam_hr.Value = WebHelpers.TextToHtmlTag(imani.exam_hr);
                txt_exam_rr.Value = WebHelpers.TextToHtmlTag(imani.exam_rr);
                txt_physical_exam.Value = WebHelpers.TextToHtmlTag(imani.physical_exam);
                txt_laboratory.Value = WebHelpers.TextToHtmlTag(imani.laboratory);
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(imani.initial_diagnosis);
                txt_diff_diagnosis.Value = WebHelpers.TextToHtmlTag(imani.diff_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(imani.associated_conditions);
                txt_treatment_plan.Value = WebHelpers.TextToHtmlTag(imani.treatment_plan);
                txt_discharge_plan.Value = WebHelpers.TextToHtmlTag(imani.discharge_plan);

                //DataObj.Value = JsonConvert.SerializeObject(imani);

                WebHelpers.AddScriptFormEdit(Page, imani, (string)Session["emp_id"], loc);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Imani imani)
        {
            try
            {
                lbl_admission_reason.Text = WebHelpers.TextToHtmlTag(imani.admission_reason);
                lbl_cur_med_history.Text = WebHelpers.TextToHtmlTag(imani.cur_med_history);
                lbl_cur_medication.Text = WebHelpers.TextToHtmlTag(imani.cur_medication);
                lbl_delivery.Text = WebHelpers.TextToHtmlTag(imani.delivery);
                lbl_post_nutrition.Text = WebHelpers.TextToHtmlTag(imani.post_nutrition);
                lbl_mater_med_history.Text = WebHelpers.TextToHtmlTag(imani.mater_med_history);
                lbl_exam_weight.Text = WebHelpers.TextToHtmlTag(imani.exam_weight);
                lbl_exam_length.Text = WebHelpers.TextToHtmlTag(imani.exam_length);
                lbl_exam_head_circum.Text = WebHelpers.TextToHtmlTag(imani.exam_head_circum);
                lbl_exam_hr.Text = WebHelpers.TextToHtmlTag(imani.exam_hr);
                lbl_exam_rr.Text = WebHelpers.TextToHtmlTag(imani.exam_rr);
                lbl_physical_exam.Text = WebHelpers.TextToHtmlTag(imani.physical_exam);

                lbl_laboratory.Text = WebHelpers.TextToHtmlTag(imani.laboratory);
                lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(imani.initial_diagnosis);
                lbl_diff_diagnosis.Text = WebHelpers.TextToHtmlTag(imani.diff_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(imani.associated_conditions);
                lbl_treatment_plan.Text = WebHelpers.TextToHtmlTag(imani.treatment_plan);
                lbl_discharge_plan.Text = WebHelpers.TextToHtmlTag(imani.discharge_plan);

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Imani imani)
        {
            try
            {
                prt_fullname.Text = patientInfo.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.DOB) + " | " + patientInfo.Gender;
                prt_vpid.Text = patientInfo.visible_patient_id;

                var result = WebHelpers.ConvertDateTime(SignatureDate, out bool isValid, out string validDateTime);

                string signatureDate = "__";
                string signatureMonth = "__";
                string signatureYear = "__";

                if (isValid)
                {
                    signatureDate = result.ToString("dd");
                    signatureMonth = result.ToString("MM");
                    signatureYear = result.ToString("yyyy");
                }

                //prt_signature_date.Text = $"Ngày/date {signatureDate} tháng/month {signatureMonth} năm/year {signatureYear}";

                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_admission_reason.Text = WebHelpers.TextToHtmlTag(imani.admission_reason);
                prt_cur_med_history.Text = WebHelpers.TextToHtmlTag(imani.cur_med_history);
                prt_cur_medication.Text = WebHelpers.TextToHtmlTag(imani.cur_medication);
                prt_delivery.Text = WebHelpers.TextToHtmlTag(imani.delivery);
                prt_post_nutrition.Text = WebHelpers.TextToHtmlTag(imani.post_nutrition);
                prt_mater_med_history.Text = WebHelpers.TextToHtmlTag(imani.mater_med_history);
                prt_exam_weight.Text = imani.exam_weight;
                prt_exam_length.Text = imani.exam_length;
                prt_exam_head_circum.Text = imani.exam_head_circum;
                prt_exam_hr.Text = imani.exam_hr;
                prt_exam_rr.Text = imani.exam_rr;
                prt_physical_exam.Text = WebHelpers.TextToHtmlTag(imani.physical_exam);
                prt_laboratory.Text = WebHelpers.TextToHtmlTag(imani.laboratory);
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(imani.initial_diagnosis);
                prt_diff_diagnosis.Text = WebHelpers.TextToHtmlTag(imani.diff_diagnosis);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(imani.associated_conditions);
                prt_treatment_plan.Text = WebHelpers.TextToHtmlTag(imani.treatment_plan);
                prt_discharge_plan.Text = WebHelpers.TextToHtmlTag(imani.discharge_plan);

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        #endregion
        
        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Imani imani = new Imani(varDocID, loc);
                imani.status = DocumentStatus.FINAL;
                
                UpdateData(imani);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Imani imani = new Imani(varDocID, loc);
                imani.status = DocumentStatus.DRAFT;

                UpdateData(imani);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Imani.Delete((string)Session["UserId"], varDocID, loc)[0];

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
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Imani imani = new Imani(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, imani, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(imani);
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
                Imani imani = new Imani(varDocID, loc);
                BindingDataFormPrint(imani);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

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
                    imani = new Imani(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    imani = new Imani(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                //loadRadGridHistoryLog();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Imani.Logs(varDocID, loc), out string SignatureDate, out string SignatureName);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (imani.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(imani, WebHelpers.LoadFormControl(form1, imani, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    lblPid.Text = varVPID;
                    BindingDataFormPrint(imani);
                }
                else if (imani.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(imani, WebHelpers.LoadFormControl(form1, imani, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, imani.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
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

                string url = $"/IPD/IniMedAssForNeoInp.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&loc={loc}&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/IniMedAssForNeoInp.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";
            Response.Redirect(url);
        }
        public void UpdateData(Imani imani)
        {
            try
            {
                imani.admission_reason = txt_admission_reason.Value;
                imani.cur_med_history = txt_cur_med_history.Value;
                imani.cur_medication = txt_cur_medication.Value;
                imani.delivery = txt_delivery.Value;
                imani.post_nutrition = txt_post_nutrition.Value;
                imani.mater_med_history = txt_mater_med_history.Value;
                imani.exam_weight = txt_exam_weight.Value;
                imani.exam_length = txt_exam_length.Value;
                imani.exam_head_circum = txt_exam_head_circum.Value;
                imani.exam_hr = txt_exam_hr.Value;
                imani.exam_rr = txt_exam_rr.Value;
                imani.physical_exam = txt_physical_exam.Value;
                imani.laboratory = txt_laboratory.Value;
                imani.initial_diagnosis = txt_initial_diagnosis.Value;
                imani.diff_diagnosis = txt_diff_diagnosis.Value;
                imani.associated_conditions = txt_associated_conditions.Value;
                imani.treatment_plan = txt_treatment_plan.Value;
                imani.discharge_plan = txt_discharge_plan.Value;

                if (JsonConvert.SerializeObject(imani) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                imani.amend_reason = txt_amend_reason.Text;
                imani.user_name = (string)Session["UserID"];

                dynamic result = imani.Update(loc)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);

        }
    }
}
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
    public partial class MedicalCertificate : System.Web.UI.Page
    {
        MC mc;
        PatientInfo patientInfo;
        PatientVisitInfo patientVisitInfo;
        public string loc { get; set; }
        public string PAGE_URL { get; set; }
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

            PAGE_URL = $"/OPD/MedicalCertificate.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
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
                    mc = new MC(varDocIdLog, true, loc);
                    currentLog.Visible = true;

                }
                else
                {
                    mc = new MC(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();


                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, MC.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (mc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    
                }
                else if (mc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, mc.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo() { 
                    Form = form1, 
                    DocStatus = mc.status,
                    AccessGroup = (string)Session["group_access"],
                    AccessAuthorize = (string)Session["access_authorize"],
                    IsSameCompanyCode = loc == locChanged,
                    IsViewLog = varDocIdLog != null
                });

                if (btnPrint.Visible)
                {
                    BindingDataFormPrint(mc);
                }
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
            lblRelationship.Text = patientInfo.Relationship;
            lblVisitCode.Text = patientVisitInfo.VisitCode;

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
        }
        #region Binding Data
        private void BindingDataForm(MC mc, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(mc);
            }
            else
            {
                BindingDataFormView(mc);
            }
        }
        private void BindingDataFormEdit(MC mc)
        {
            try
            {
                txt_amend_reason.Text = "";

                // 2. Lý do đến khám
                txt_chief_complain.Value = WebHelpers.TextToHtmlTag(mc.chief_complain);
                // 3. Tóm tắt bệnh sử                          
                txt_history_present_illness.Value = WebHelpers.TextToHtmlTag(mc.history_present_illness);
                // 4. Tiền sử bệnh                
                txt_past_history.Value = WebHelpers.TextToHtmlTag(mc.past_history);
                // 5. Đặc điểm lâm sàng
                txt_clinical_findings.Value = WebHelpers.TextToHtmlTag(mc.clinical_findings);
                //6. Cận lâm sàng được chỉ định
                txt_para_clinical_investigations.Value = WebHelpers.TextToHtmlTag(mc.para_clinical_investigations);
                //7. Chẩn đoán
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(mc.diagnosis);
                //8. Phương pháp và thuốc điều trị
                txt_treatment.Value = WebHelpers.TextToHtmlTag(mc.treatment);
                //9. Thời gian điều trị
                txt_treatment_period.Value = WebHelpers.TextToHtmlTag(mc.treatment_period);
                //10. Lời khuyên và theo dõi
                txt_recommendation.Value = WebHelpers.TextToHtmlTag(mc.recommendation);
                //11. Lời khuyên và theo dõi
                txt_treatment_plan.Value = WebHelpers.TextToHtmlTag(mc.treatment_plan);

                DataObj.Value = JsonConvert.SerializeObject(mc);

                Session["docid"] = mc.document_id;
                WebHelpers.AddScriptFormEdit(Page, mc, (string)Session["emp_id"], loc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(MC mc)
        {
            try
            {
                lbl_chief_complain.Text = WebHelpers.TextToHtmlTag(mc.chief_complain);
                lbl_history_present_illness.Text = WebHelpers.TextToHtmlTag(mc.history_present_illness);
                lbl_past_history.Text = WebHelpers.TextToHtmlTag(mc.past_history);
                lbl_clinical_findings.Text = WebHelpers.TextToHtmlTag(mc.clinical_findings);
                lbl_para_clinical_investigations.Text = WebHelpers.TextToHtmlTag(mc.para_clinical_investigations);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(mc.diagnosis);
                lbl_treatment.Text = WebHelpers.TextToHtmlTag(mc.treatment);
                lbl_treatment_period.Text = WebHelpers.TextToHtmlTag(mc.treatment_period);
                lbl_recommendation.Text = WebHelpers.TextToHtmlTag(mc.recommendation);
                lbl_treatment_plan.Text = WebHelpers.TextToHtmlTag(mc.treatment_plan);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(MC mc)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                prt_vpid.Text = patientInfo.visible_patient_id;
                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_patient_name.Text = $"{patientInfo.FullName} ({patientInfo.Title})";

                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth);
                
                if(patientInfo.Gender == "Male" || patientInfo.Gender == "Nam")
                {
                    prt_male.Text = "☒";
                } else if (patientInfo.Gender == "Female" || patientInfo.Gender == "Nữ")
                {
                    prt_female.Text = "☒";
                }

                prt_pid.Text = patientInfo.visible_patient_id;
                prt_date_of_visit.Text = WebHelpers.FormatDateTime(patientVisitInfo.actual_visit_date_time);
                prt_chief_complain.Text = WebHelpers.TextToHtmlTag(mc.chief_complain, false);
                prt_history_present_illness.Text = WebHelpers.TextToHtmlTag(mc.history_present_illness, false);
                prt_past_history.Text = WebHelpers.TextToHtmlTag(mc.past_history, false);
                prt_clinical_findings.Text = WebHelpers.TextToHtmlTag(mc.clinical_findings, false);
                prt_para_clinical_investigations.Text = WebHelpers.TextToHtmlTag(mc.para_clinical_investigations, false);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(mc.diagnosis, false);
                prt_treatment.Text = WebHelpers.TextToHtmlTag(mc.treatment, false);
                prt_treatment_period.Text = WebHelpers.TextToHtmlTag(mc.treatment_period, false);
                prt_recommendation.Text = WebHelpers.TextToHtmlTag(mc.recommendation, false);

                prt_date.Text = WebHelpers.FormatDateTime(SignatureDate, "dd-MM-yyyy", "");
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
                MC mc = new MC(varDocID, loc);
                mc.status = DocumentStatus.FINAL;
                
                UpdateData(mc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MC mc = new MC(varDocID, loc);
                mc.status = DocumentStatus.DRAFT;

                UpdateData(mc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = MC.Delete((string)Session["UserID"], Request.QueryString["docid"], loc)[0];
                
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
            if(WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"])) {
                MC mc = new MC(Request.QueryString["docId"], loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(mc);
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
        
        private void UpdateData(MC mc)
        {
            try
            {
                mc.chief_complain = txt_chief_complain.Value;
                mc.history_present_illness = txt_history_present_illness.Value;
                mc.past_history = txt_past_history.Value;
                mc.clinical_findings = txt_clinical_findings.Value;
                mc.para_clinical_investigations = txt_para_clinical_investigations.Value;
                mc.diagnosis = txt_diagnosis.Value;
                mc.treatment = txt_treatment.Value;
                mc.treatment_period = txt_treatment_period.Value;
                mc.recommendation = txt_recommendation.Value;
                mc.treatment_plan = txt_treatment_plan.Value;

                if (JsonConvert.SerializeObject(mc) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                mc.amend_reason = txt_amend_reason.Text;
                mc.user_name = (string)Session["UserID"];

                dynamic result = mc.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
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

                string url = PAGE_URL + $"&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        #endregion

        #region Validation
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_amend_reason.Text.Length > 3;
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
        }
    }
}
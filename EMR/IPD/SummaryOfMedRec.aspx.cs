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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

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

                Patient patient = Patient.Instance();
                WebHelpers.BindDateTimePicker(dpk_form_date, somr.form_date);
                WebHelpers.BindDateTimePicker(dpk_to_date, somr.to_date);
                txt_chief_complaint.Value = somr.chief_complaint;
                txt_diagnosis.Value = somr.diagnosis;
                txt_clinical_evolution.Value = somr.clinical_evolution;
                txt_result_para_clinical.Value = somr.result_para_clinical;
                txt_treatment.Value = somr.treatment;
                txt_eval_treatment.Value = somr.eval_treatment;
                txt_treatment_prognosis.Value = somr.treatment_prognosis;

                DataObj.Value = JsonConvert.SerializeObject(somr);
                Session["docid"] = somr.document_id;
                WebHelpers.AddScriptFormEdit(Page, somr, (string)Session["emp_id"]);
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
                lbl_chief_complaint.Text = WebHelpers.GetValue(somr.chief_complaint);
                lbl_diagnosis.Text = WebHelpers.GetValue(somr.diagnosis);
                lbl_clinical_evolution.Text = WebHelpers.GetValue(somr.clinical_evolution);
                lbl_result_para_clinical.Text = WebHelpers.GetValue(somr.result_para_clinical);
                lbl_treatment.Text = WebHelpers.GetValue(somr.treatment);
                lbl_eval_treatment.Text = WebHelpers.GetValue(somr.eval_treatment);
                lbl_treatment_prognosis.Text = WebHelpers.GetValue(somr.treatment_prognosis);
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
                Patient patient = Patient.Instance();
                prt_fullname.Text = string.Format("{0} ({1})", patient.GetFullName(), patient.GetTitle());
                prt_dob.Text = string.Format("{0} | {1}", WebHelpers.FormatDateTime(patient.date_of_birth), patient.GetGender());
                prt_vpid.Text = patient.visible_patient_id;
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
                prt_department.Text = PatientVisit.Instance().getDept();
                prt_form_date.Text = WebHelpers.FormatDateTime(somr.form_date);
                prt_to_date.Text = WebHelpers.FormatDateTime(somr.to_date);
                
                prt_eval_treatment.Text = somr.eval_treatment;
                prt_chief_complaint.Text = somr.chief_complaint;
                prt_diagnosis.Text = somr.diagnosis;
                prt_clinical_evolution.Text = somr.clinical_evolution;
                prt_result_para_clinical.Text = somr.result_para_clinical;
                prt_treatment.Text = somr.treatment;
                prt_treatment_prognosis.Text = somr.treatment_prognosis;

                DateTime signature_date = (DateTime)Session["signature_date"];
                prt_signature_date1.Text = prt_signature_date2.Text = "Ngày/ Date: " + signature_date.ToString("dd-MM-yyyy");
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
                Somr somr = new Somr(DataHelpers.varDocId);
                somr.status = DocumentStatus.FINAL;
                
                UpdateData(somr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Somr somr = new Somr(DataHelpers.varDocId);
                somr.status = DocumentStatus.DRAFT;

                UpdateData(somr);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Somr somr = new Somr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, somr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(somr);
                //get access button
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            Initial();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Disc.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
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

                dynamic result = somr.Update()[0];

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
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            try
            {
                Somr somr;

                if (Request.QueryString["docIdLog"] != null)
                {
                    somr = new Somr(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    somr = new Somr(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();
                
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                if (somr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(somr, WebHelpers.LoadFormControl(form1, somr, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(somr);
                }
                else if (somr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(somr, WebHelpers.LoadFormControl(form1, somr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }
                WebHelpers.getAccessButtons(form1, somr.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Somr.Logs(Request.QueryString["docId"]);
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
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
    }
}
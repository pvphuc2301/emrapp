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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) return;
            if (!IsPostBack)
            {
                Initial();
            }
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
                txt_chief_complain.Value = mc.chief_complain;
                txt_chief_complain.Disabled = false;
                // 3. Tóm tắt bệnh sử                          
                txt_history_present_illness.Value = mc.history_present_illness;
                // 4. Tiền sử bệnh                
                txt_past_history.Value = mc.past_history;
                // 5. Đặc điểm lâm sàng
                txt_clinical_findings.Value = mc.clinical_findings;
                //6. Cận lâm sàng được chỉ định
                txt_para_clinical_investigations.Value = mc.para_clinical_investigations;
                //7. Chẩn đoán
                txt_diagnosis.Value = mc.diagnosis;
                //8. Phương pháp và thuốc điều trị
                txt_treatment.Value = mc.treatment;
                //9. Thời gian điều trị
                txt_treatment_period.Value = mc.treatment_period;
                //10. Lời khuyên và theo dõi
                txt_recommendation.Value = mc.recommendation;
                //11. Lời khuyên và theo dõi
                txt_treatment_plan.Value = mc.treatment_plan;

                DataObj.Value = JsonConvert.SerializeObject(mc);

                Session["docid"] = mc.document_id;
                WebHelpers.AddScriptFormEdit(Page, mc, (string)Session["emp_id"]);
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
                lbl_chief_complain.Text = WebHelpers.FormatString(mc.chief_complain);
                lbl_history_present_illness.Text = WebHelpers.FormatString(mc.history_present_illness);
                lbl_past_history.Text = WebHelpers.FormatString(mc.past_history);
                lbl_clinical_findings.Text = WebHelpers.FormatString(mc.clinical_findings);
                lbl_para_clinical_investigations.Text = WebHelpers.FormatString(mc.para_clinical_investigations);
                lbl_diagnosis.Text = WebHelpers.FormatString(mc.diagnosis);
                lbl_treatment.Text = WebHelpers.FormatString(mc.treatment);
                lbl_treatment_period.Text = WebHelpers.FormatString(mc.treatment_period);
                lbl_recommendation.Text = WebHelpers.FormatString(mc.recommendation);
                lbl_treatment_plan.Text = WebHelpers.FormatString(mc.treatment_plan);
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
                Patient patient = Patient.Instance();
                prt_vpid.Text = patient.visible_patient_id;
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
                prt_patient_name.Text = $"{patient.GetFullName()} ({patient.GetTitle()})";

                prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
                
                prt_gender.Text = WebHelpers.CreateOptions(new Option { Text = "Nam <div class='text-primary'>Male</div>", Value = "Male" }, new Option { Text = "Nữ<div class='text-primary'>Female</div>", Value = "Female" }, DataHelpers.patient.gender_e, "display: grid; grid-template-columns: 1fr 1fr; width: 300px");
                //prt_dept.Text = PatientVisit.Instance().getDept();
                prt_pid.Text = DataHelpers.patient.visible_patient_id;
                prt_date_of_visit.Text = WebHelpers.FormatDateTime(PatientVisit.Instance().actual_visit_date_time);
                prt_chief_complain.Text = mc.chief_complain;
                prt_history_present_illness.Text = mc.history_present_illness;
                prt_past_history.Text = mc.past_history;
                prt_clinical_findings.Text = DataHelpers.FormatPhysicalExamination(mc.clinical_findings);
                prt_para_clinical_investigations.Text = mc.para_clinical_investigations;
                prt_diagnosis.Text = mc.diagnosis;
                prt_treatment.Text = mc.treatment;
                prt_treatment_period.Text = mc.treatment_period;
                prt_recommendation.Text = mc.recommendation;

                DateTime signature_date = (DateTime)Session["signature_date"];
                string signature_name = (string)Session["signature_name"];

                prt_date.Text = WebHelpers.FormatDateTime(signature_date, "dd/MM/yyyy");
                prt_signature_doctor.Text = signature_name;
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MC mc = new MC(DataHelpers.varDocId);
                mc.status = DocumentStatus.FINAL;
                
                UpdateData(mc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MC mc = new MC(DataHelpers.varDocId);
                mc.status = DocumentStatus.DRAFT;

                UpdateData(mc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = MC.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if(WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"])) {
                MC mc = new MC(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(mc);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
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
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            try
            {
                MC mc;

                if (Request.QueryString["docIdLog"] != null)
                {
                    mc = new MC(Request.QueryString["docId"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    mc = new MC(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (mc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(mc);
                }
                else if (mc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, mc.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);

                BindingDataFormPrint(mc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
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

                dynamic result = mc.Update()[0];

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
        private void loadRadGridHistoryLog()
        {
            DataTable dt = MC.Logs(Request.QueryString["docId"]);
            RadGrid1.DataSource = dt;
            DateTime last_updated_date_time = new DateTime();
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_e");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("created_date_time");
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("submited_name_e");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("submited_date_time");
            }

            Session["signature_date"] = last_updated_date_time;
            Session["signature_name"] = last_updated_doctor;
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
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/OPD/MedicalCertificate.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/OPD/MedicalCertificate.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

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
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
    }
}
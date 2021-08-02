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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!WebHelpers.CheckSession(this)) return;
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
                txt_preo_diagnosis.Value = surr.preo_diagnosis;
                txt_post_diagnosis.Value = surr.post_diagnosis;
                txt_name_procedure.Value = surr.name_procedure;
                txt_surgeon.Value = surr.surgeon;
                txt_assistant_surgeon.Value = surr.assistant_surgeon;
                txt_anesthesiologist.Value = surr.anesthesiologist;
                txt_anesthesia.Value = surr.anesthesia;
                txt_anesthetic_nurse.Value = surr.anesthetic_nurse;
                txt_scrub_nurse.Value = surr.scrub_nurse;
                txt_circulating_nurse.Value = surr.circulating_nurse;
                txt_estimated_bloodloss.Value = surr.estimated_bloodloss;
                txt_biopsy_pathology.Value = surr.biopsy_pathology;
                txt_complications.Value = surr.complications;
                txt_procedure_chart.Value = surr.procedure_chart;
                txt_procedure_narrative.Value = surr.procedure_narrative;

                DataObj.Value = JsonConvert.SerializeObject(surr);
                Session["docid"] = surr.document_id;
                WebHelpers.AddScriptFormEdit(Page, surr, (string)Session["emp_id"]);
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
                lbl_procedure_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(surr.procedure_date));
                lbl_start_time.Text = WebHelpers.FormatString(surr.start_time);
                lbl_finish_time.Text = WebHelpers.FormatString(surr.finish_time);
                //4
                lbl_preo_diagnosis.Text = WebHelpers.FormatString(surr.preo_diagnosis);
                //5
                lbl_post_diagnosis.Text = WebHelpers.FormatString(surr.post_diagnosis);
                //6
                lbl_name_procedure.Text = WebHelpers.FormatString(surr.name_procedure);
                //7
                lbl_anesthesia.Text = WebHelpers.FormatString(surr.anesthesia);
                //8
                lbl_surgeon.Text = WebHelpers.FormatString(surr.surgeon);
                lbl_assistant_surgeon.Text = WebHelpers.FormatString(surr.assistant_surgeon);
                lbl_anesthesiologist.Text = WebHelpers.FormatString(surr.anesthesiologist);
                lbl_anesthetic_nurse.Text = WebHelpers.FormatString(surr.anesthetic_nurse);
                lbl_scrub_nurse.Text = WebHelpers.FormatString(surr.scrub_nurse);
                lbl_circulating_nurse.Text = WebHelpers.FormatString(surr.circulating_nurse);
                lbl_estimated_bloodloss.Text = WebHelpers.FormatString(surr.estimated_bloodloss);
                lbl_biopsy_pathology.Text = WebHelpers.FormatString(surr.biopsy_pathology);
                lbl_complications.Text = WebHelpers.FormatString(surr.complications);
                lbl_procedure_chart.Text = WebHelpers.FormatString(surr.procedure_chart);
                lbl_procedure_narrative.Text = WebHelpers.FormatString(surr.procedure_narrative);
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
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();
                prt_vpid.Text = patient.visible_patient_id;
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
                prt_FullName.InnerHtml = patient.GetFullName();
                prt_admission_date.InnerHtml = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);

                prt_procedure_date.InnerHtml = WebHelpers.FormatDateTime(surr.procedure_date);
                prt_start_time.InnerHtml = surr.start_time;
                prt_finish_time.InnerHtml = surr.finish_time;
                prt_preo_diagnosis.InnerHtml = surr.preo_diagnosis;
                prt_post_diagnosis.InnerHtml = surr.post_diagnosis;
                prt_name_procedure.InnerHtml = surr.name_procedure;
                prt_anesthesia.InnerHtml = surr.anesthesia;
                prt_surgeon.InnerHtml = surr.surgeon;
                prt_assistant_surgeon.InnerHtml = surr.assistant_surgeon;
                prt_anesthesiologist.InnerHtml = surr.anesthesiologist;
                prt_anesthetic_nurse.InnerHtml = surr.anesthetic_nurse;
                prt_scrub_nurse.InnerHtml = surr.scrub_nurse;
                prt_circulating_nurse.InnerHtml = surr.circulating_nurse;
                prt_estimated_bloodloss.InnerHtml = surr.estimated_bloodloss;
                prt_biopsy_pathology.InnerHtml = surr.biopsy_pathology;
                prt_complications.InnerHtml = surr.complications;
                prt_procedure_chart.InnerHtml = surr.procedure_chart;
                prt_procedure_narrative.InnerHtml = surr.procedure_narrative;

                DateTime signature_date = (DateTime)Session["signature_date"];
                lbl_submited_date.InnerText = signature_date.ToString("dd-MM-yyyy");
                prt_signature_doctor.InnerText = (string)Session["signature_doctor"];

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
                Surr surr = new Surr(DataHelpers.varDocId);
                surr.status = DocumentStatus.FINAL;
                
                UpdateData(surr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surr surr = new Surr(DataHelpers.varDocId);
                surr.status = DocumentStatus.DRAFT;
                
                UpdateData(surr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Surr.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
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
            if (WebHelpers.CanOpenForm(Page,  (string)Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Surr surr = new Surr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, surr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(surr);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Surr surr = new Surr(Request.QueryString["docId"]);
            BindingDataFormPrint(surr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
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
                Surr surr;

                if (Request.QueryString["docIdLog"] != null)
                {
                    surr = new Surr(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    surr = new Surr(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                if (surr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(surr, WebHelpers.LoadFormControl(form1, surr, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(surr);
                }
                else if (surr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(surr, WebHelpers.LoadFormControl(form1, surr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, surr.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Surr.Logs(Request.QueryString["docId"]);
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

                string url = $"/IPD/SurgicalReport.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/SurgicalReport.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
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

                dynamic result = surr.Update()[0];

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
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

        }
    }
}



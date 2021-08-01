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
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }
            
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
                txt_diagnosis.Value = uusr.diagnosis;
                txt_left_kidney.Value = uusr.left_kidney;
                txt_right_kidney.Value = uusr.right_kidney;
                txt_urinary_bladder.Value = uusr.urinary_bladder;
                txt_prostate.Value = uusr.prostate;
                txt_post_void_resi_volume.Value = uusr.post_void_resi_volume;
                txt_conclusion.Value = uusr.conclusion;
                txt_recommendation.Value = uusr.recommendation;

                DataObj.Value = JsonConvert.SerializeObject(uusr);
                Session["docid"] = uusr.document_id;
                WebHelpers.AddScriptFormEdit(Page, uusr, (string)Session["emp_id"]);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        private void BindingDataFormView(Uusr uusr)
        {
            try {
                lbl_diagnosis.Text = uusr.diagnosis;
                lbl_left_kidney.Text = uusr.left_kidney;
                lbl_right_kidney.Text = uusr.right_kidney;
                lbl_urinary_bladder.Text = uusr.urinary_bladder;
                lbl_prostate.Text = uusr.prostate;
                lbl_post_void_resi_volume.Text = uusr.post_void_resi_volume;
                lbl_conclusion.Text = uusr.conclusion;
                lbl_recommendation.Text = uusr.recommendation;
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormPrint(Uusr uusr)
        {
            try
            {
                Patient patient = Patient.Instance();
                prt_pid.Text = prt_vpid.Text = patient.visible_patient_id;
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
                prt_fullname.Text = patient.GetFullName();

                prt_diagnosis.Text = uusr.diagnosis;
                prt_left_kidney.Text = uusr.left_kidney;
                prt_right_kidney.Text = uusr.right_kidney;
                prt_urinary_bladder.Text = uusr.urinary_bladder;
                prt_prostate.Text = uusr.prostate;
                prt_post_void_resi_volume.Text = uusr.post_void_resi_volume;
                prt_conclusion.Text = uusr.conclusion;
                prt_recommendation.Text = uusr.recommendation;

                DateTime signature_date = (DateTime)Session["signature_date"];

                prt_signature_date.Text = "Ngày/ Date: " + signature_date.ToString("dd-MM-yyyy");
                prt_signature_doctor.Text = (string)Session["signature_doctor"];

            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(DataHelpers.varDocId);
                uusr.status = DocumentStatus.FINAL;
                
                UpdateData(uusr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(DataHelpers.varDocId);
                uusr.status = DocumentStatus.DRAFT;
                
                UpdateData(uusr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try { 
                dynamic result = Uusr.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
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
            if (WebHelpers.CanOpenForm(Page, (string)Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Uusr uusr = new Uusr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form2, uusr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(uusr);
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
            try
            {
                uusr = new Uusr(Request.QueryString["docId"]);
                BindingDataFormPrint(uusr);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
        }
        #endregion

        #region Methods
        private void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                Uusr uusr;

                if (Request.QueryString["docIdLog"] != null)
                {
                    uusr = new Uusr(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    uusr = new Uusr(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();
                
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (uusr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(uusr, WebHelpers.LoadFormControl(form2, uusr, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(uusr);
                }
                else if (uusr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(uusr, WebHelpers.LoadFormControl(form2, uusr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form2, uusr.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Uusr.Logs(Request.QueryString["docId"]);
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

                string url = $"/OPD/UsUriSysReport.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/OPD/UsUriSysReport.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
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

                dynamic result = uusr.Update()[0];

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
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
    }
}
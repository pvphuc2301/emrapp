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
    public partial class SurgicalCertificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) return;
            if (!IsPostBack) { Initial(); }
        }

        #region Binding Data
        private void BindingDataForm(Surc surc, bool state)
        {
            admission_date.Text = WebHelpers.FormatDateTime(surc.admission_date);
            procedure_date.Text = WebHelpers.FormatDateTime(surc.procedure_date);

            if (state)
            {
                BindingDataFormEdit(surc);
            }
            else
            {
                BindingDataFormView(surc);
            }
        }
        private void BindingDataFormEdit(Surc surc)
        {
            try
            {
                txt_amend_reason.Text = "";
                WebHelpers.BindDateTimePicker(dpk_discharge_date, surc.discharge_date);
                txt_preo_diagnosis.Value = surc.preo_diagnosis;
                txt_name_of_procedure.Value = surc.name_of_procedure;
                txt_proce_narrative.Value = surc.proce_narrative;
                txt_blood_type.Value = surc.blood_type;
                txt_rh.Value = surc.rh;

                DataObj.Value = JsonConvert.SerializeObject(surc);
                Session["docid"] = surc.document_id;
                WebHelpers.AddScriptFormEdit(Page, surc, (string)Session["emp_id"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Surc surc)
        {
            try
            {
                lbl_discharge_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(surc.discharge_date));
                lbl_preo_diagnosis.Text = WebHelpers.FormatString(surc.preo_diagnosis);
                lbl_name_of_procedure.Text = WebHelpers.FormatString(surc.name_of_procedure);
                lbl_proce_narrative.Text = WebHelpers.FormatString(surc.proce_narrative);
                lbl_blood_type.Text = WebHelpers.FormatString(surc.blood_type);
                lbl_rh.Text = WebHelpers.FormatString(surc.rh);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
            
        }
        private void BindingDataFormPrint(Surc surc)
        {
            try
            {
                Patient patient = Patient.Instance();

                prt_vpid.Text = prt_vpid1.Text = patient.visible_patient_id;

                prt_fullname.Text = patient.GetFullName();
                prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
                prt_gender.Text = WebHelpers.CreateOptions(new Option { Text = "Nam <div class='text-primary'>Male</div>", Value = "Male" }, new Option { Text = "Nữ<div class='text-primary'>Female</div>", Value = "Female" }, DataHelpers.patient.gender_e, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

                prt_address.Text = patient.GetAddress();

                prt_admission_date.Text = WebHelpers.FormatDateTime(surc.admission_date);
                prt_procedure_date.Text = WebHelpers.FormatDateTime(surc.procedure_date);
                prt_discharge_date.Text = WebHelpers.FormatDateTime(surc.discharge_date);
                prt_preo_diagnosis.Text = surc.preo_diagnosis;
                prt_name_of_procedure.Text = surc.name_of_procedure;
                prt_proce_narrative.Text = surc.proce_narrative;
                prt_blood_type.Text = surc.blood_type;
                prt_rh.Text = surc.rh;
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surc surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.FINAL;
                
                UpdateData(surc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surc surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.DRAFT;

                UpdateData(surc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Surc surc = new Surc(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, surc, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(surc);
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
            if (Request.QueryString["vpid"] != null) DataHelpers.varPVId = Request.QueryString["vpid"];

            try
            {
                Surc surc;
                if (Request.QueryString["docIdLog"] != null)
                {
                    surc = new Surc(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    surc = new Surc(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }


                loadRadGridHistoryLog();
                
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (surc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(surc, WebHelpers.LoadFormControl(form1, surc, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(surc);
                }
                else if (surc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(surc, WebHelpers.LoadFormControl(form1, surc, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, surc.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Surc.Logs(Request.QueryString["docId"]);
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

                string url = $"/IPD/SurgicalCertificate.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/SurgicalCertificate.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
        }
        public void UpdateData(Surc surc)
        {
            try
            {

                surc.admission_date = DataHelpers.ConvertSQLDateTime(surc.admission_date);
                surc.procedure_date = DataHelpers.ConvertSQLDateTime(surc.procedure_date);
                surc.discharge_date = DataHelpers.ConvertSQLDateTime(dpk_discharge_date.SelectedDate);
                surc.preo_diagnosis = txt_preo_diagnosis.Value;
                surc.name_of_procedure = txt_name_of_procedure.Value;
                surc.proce_narrative = txt_proce_narrative.Value;
                surc.blood_type = txt_blood_type.Value;
                surc.rh = txt_rh.Value;

                if (JsonConvert.SerializeObject(surc) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                surc.amend_reason = txt_amend_reason.Text;
                surc.user_name = (string)Session["UserID"];

                dynamic result = surc.Update()[0];

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
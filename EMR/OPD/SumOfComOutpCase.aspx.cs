using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class SummaryOfComplexOutpatientCases : System.Web.UI.Page
    {
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
            loc = Request.QueryString["loc"];

            PAGE_URL = $"/OPD/SumOfComOutpCase.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Scoc scoc = new Scoc(varDocID, loc);
                scoc.status = DocumentStatus.FINAL;

                UpdateData(scoc);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Scoc scoc = new Scoc(varDocID, loc);
                //scoc.status = DocumentStatus.DRAFT;

                UpdateData(scoc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Scoc.Delete((string)Session["UserId"], varDocID, loc)[0];

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
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc
                
                ))
            {
                Scoc scoc = new Scoc(varDocID, loc);

                //WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                //WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, scoc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(scoc);
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
            Scoc scoc = new Scoc(varDocID, loc);
            BindingDataFormPrint(scoc);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        private void Initial()
        {
            try
            {
                Scoc scoc;
                patientInfo = new PatientInfo(varPID);
                //patientVisitInfo = new PatientVisitInfo(varPVID, loc);
                if (varDocIdLog != null)
                {
                    scoc = new Scoc(varDocIdLog, true, loc);
                    currentLog.Visible = true;

                }
                else
                {
                    scoc = new Scoc(varDocID,loc);
                    currentLog.Visible = false;
                }
                LoadPatientInfo();
                loadRadGridHistoryLog();
                

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                //if (scoc.status == DocumentStatus.FINAL)
                //{
                //    BindingDataFormPrint(scoc);
                //    BindingDataForm(scoc, WebHelpers.LoadFormControl(form1, scoc, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));

                //}
                //else if (scoc.status == DocumentStatus.DRAFT)
                //{
                    BindingDataForm(scoc, WebHelpers.LoadFormControl(form1, scoc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                //}

                WebHelpers.getAccessButtons(form1, scoc.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.VisibleControl(false, btnComplete, btnDeleteModal, btnPrint, btnAmend);
                btnSave.Visible = true;

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
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Scoc.Logs(Request.QueryString["docId"], loc);

            string last_updated_date_time = "";
            string last_updated_doctor = "";

            if (dt != null)
            {
                RadGrid1.DataSource = dt;

                last_updated_date_time = WebHelpers.GetLogLastDateTime(dt.Rows[dt.Rows.Count - 1]["created_date_time"], dt.Rows[dt.Rows.Count - 1]["modified_date_time"]);

                last_updated_doctor = WebHelpers.GetLogLastName(dt.Rows[dt.Rows.Count - 1]["created_name_e"], dt.Rows[dt.Rows.Count - 1]["modified_name_e"]);
            }

            SignatureDate = last_updated_date_time;
            SignatureName = last_updated_doctor;

            last_updated_date_time = WebHelpers.FormatDateTime(last_updated_date_time, "dd-MMM-yyyy HH:mm tt", "");

            RadLabel1.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{last_updated_date_time}</i></b>";
            RadGrid1.DataBind();

            //RadGrid1.DataSource = dt;
            //string last_updated_date_time = "";
            //string last_updated_doctor = "";

            //if (dt.Rows.Count == 1)
            //{
            //    last_updated_doctor = dt.Rows[0].Field<string>("created_name_e");

            //    WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("created_date_time"), out bool isValid, out last_updated_date_time);

            //    if (isValid)
            //    {
            //        SignatureDate = last_updated_date_time;
            //    }
            //}
            //else if (dt.Rows.Count > 1)
            //{
            //    last_updated_doctor = dt.Rows[0].Field<string>("modified_name_e");
            //    WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("modified_date_time"), out bool isValid, out last_updated_date_time);

            //    if (isValid)
            //    {
            //        SignatureDate = last_updated_date_time;
            //    }
            //}

            //SignatureName = last_updated_doctor;

            //if (!string.IsNullOrEmpty(last_updated_date_time))
            //{
            //    RadLabel1.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{Convert.ToDateTime(last_updated_date_time).ToString("dd-MMM-yyyy HH:mm tt")}</i></b>";
            //}
            //else
            //{
            //    RadLabel1.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i></i></b>";
            //}

            //RadGrid1.DataBind();
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
            string result = "Amended by";
            object name = "";
            object time = "";

            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                name = created_name;
                time = created_date_time;
            }
            else
            {
                name = modified_name;
                time = created_date_time;
            }

            WebHelpers.ConvertDateTime(time, out bool isValid, out string dateTime, "dd-MMM-yyyy HH:mm tt");

            return $"{result} by <i>{name}</i> on <i>{dateTime}</i>";
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
        private void UpdateData(Scoc scoc)
        {
            try
            {
                scoc.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                scoc.allergy_note = txt_allergy_note.Value;
                scoc.remarkable = txt_remarkable.Value;
                scoc.past_history = txt_past_history.Value;
                scoc.diagnosis = txt_diagnosis.Value;
                scoc.cur_treatment = txt_cur_treatment.Value;
                scoc.cur_care_plans = txt_cur_care_plans.Value;
                scoc.recommendation = txt_recommendation.Value;
                scoc.created_date_time = DataHelpers.ConvertSQLDateTime(scoc.created_date_time);

                if (JsonConvert.SerializeObject(scoc) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }
                scoc.modified_date_time = null;
                scoc.signed_date_time = null;
                scoc.submited_date_time = null;
                //
                scoc.amend_reason = txt_amend_reason.Text;
                scoc.user_name = (string)Session["UserID"];

                dynamic result = scoc.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.MESSAGE_SAVE_SUCCESS);
                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        #region Binding Data
        private void BindingDataForm(Scoc scoc, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(scoc);
            }
            else
            {
                BindingDataFormView(scoc);
            }
        }
        private void BindingDataFormEdit(Scoc scoc)
        {
            try
            {
                txt_amend_reason.Text = "";
                //I.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + scoc.allergy);
                txt_allergy_note.Value = WebHelpers.TextToHtmlTag(scoc.allergy_note);
                txt_remarkable.Value = WebHelpers.TextToHtmlTag(scoc.remarkable);
                txt_past_history.Value = WebHelpers.TextToHtmlTag(scoc.past_history);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(scoc.diagnosis);
                txt_cur_treatment.Value = WebHelpers.TextToHtmlTag(scoc.cur_treatment);
                txt_cur_care_plans.Value = WebHelpers.TextToHtmlTag(scoc.cur_care_plans);
                txt_recommendation.Value = WebHelpers.TextToHtmlTag(scoc.recommendation);

                DataObj.Value = JsonConvert.SerializeObject(scoc);
                Session["docid"] = scoc.document_id;
                WebHelpers.AddScriptFormEdit(Page, scoc, (string)Session["emp_id"], loc);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Scoc scoc)
        {
            try
            {
                lbl_allergy.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(scoc.allergy, "Có, ghi rõ/ Yes, specify: " + scoc.allergy_note));
                lbl_remarkable.Text = WebHelpers.TextToHtmlTag(scoc.remarkable);
                lbl_past_history.Text = WebHelpers.TextToHtmlTag(scoc.past_history);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(scoc.diagnosis);
                lbl_cur_treatment.Text = WebHelpers.TextToHtmlTag(scoc.cur_treatment);
                lbl_cur_care_plans.Text = WebHelpers.TextToHtmlTag(scoc.cur_care_plans);
                lbl_recommendation.Text = WebHelpers.TextToHtmlTag(scoc.recommendation);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Scoc scoc)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);

                prt_fullname.Text = patientInfo.FullName;
                prt_pid.Text = patientInfo.visible_patient_id; 
                

                prt_patient_id.Text = prt_pid.Text = patientInfo.visible_patient_id;
                //prt_date_of_summary_report.Text = scoc.
                prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Yes", Value = true }, scoc.allergy, "display: grid;grid-template-columns:150px auto;");
                if(scoc.allergy != null)
                {
                    if (scoc.allergy)
                    {
                        prt_allergy_note_wrapper.Visible = true;
                        prt_allergy_note.Text = WebHelpers.TextToHtmlTag(scoc.allergy_note);
                    }
                    else
                    {
                        prt_allergy_note_wrapper.Visible = false;
                    }
                }
                
                prt_remarkable.Text = WebHelpers.TextToHtmlTag(scoc.remarkable);
                past_history.Text = WebHelpers.TextToHtmlTag(scoc.past_history);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(scoc.diagnosis);
                prt_cur_treatment.Text = WebHelpers.TextToHtmlTag(scoc.cur_treatment);
                prt_cur_care_plans.Text = WebHelpers.TextToHtmlTag(scoc.cur_care_plans);
                prt_recommendation.Text = WebHelpers.TextToHtmlTag(scoc.recommendation);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);

        }
    }
}
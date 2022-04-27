using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.IPD
{
    public partial class DisCerV10 : System.Web.UI.Page
    {
        Disc disc;
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
        public DateTime associated_visit_admited { get; set; }
        public DateTime associated_visit_closed { get; set; }
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

            PAGE_URL = $"/IPD/DisCer.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Disc disc, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(disc);
            }
            else
            {
                BindingDataFormView(disc);
            }
        }
        private void BindingDataFormView(Disc disc)
        {
            try
            {
                lbl_disc_ward_desc.Text = WebHelpers.TextToHtmlTag(disc.disc_ward_desc);
                lbl_no_health_insurance.Text = WebHelpers.TextToHtmlTag(disc.no_health_insurance);
                lbl_valid_from.Text = WebHelpers.FormatDateTime(disc.valid_from, "dd-MMM-yyyy");
                lbl_disc_date_time.Text = WebHelpers.FormatDateTime(disc.disc_date_time, "dd-MMM-yyyy HH:mm");
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(disc.diagnosis);
                lbl_disc_medication.Text = WebHelpers.TextToHtmlTag(disc.disc_medication);
                lbl_followup_instruc.Text = WebHelpers.TextToHtmlTag(disc.followup_instruc);
                lbl_notes.Text = WebHelpers.TextToHtmlTag(disc.notes);
                lbl_signature_date.Text = WebHelpers.FormatDateTime(disc.signature_date, "dd-MMM-yyyy");
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormEdit(Disc disc)
        {
            try
            {
                txt_amend_reason.Text = "";

                WebHelpers.DataBind(form1, select_disc_ward_code, Disc.DISC_WARD_CODE, disc.disc_ward_code);

                txt_no_health_insurance.Value = disc.no_health_insurance;
                dpk_valid_from.SelectedDate = disc.valid_from;
                WebHelpers.BindDateTimePicker(dtpk_disc_date_time, disc.disc_date_time);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(disc.diagnosis);
                txt_disc_medication.Value = WebHelpers.TextToHtmlTag(disc.disc_medication);
                txt_followup_instruc.Value = WebHelpers.TextToHtmlTag(disc.followup_instruc);
                txt_notes.Value = WebHelpers.TextToHtmlTag(disc.notes);
                dpk_signature_date.SelectedDate = disc.signature_date;

                //DataObj.Value = JsonConvert.SerializeObject(disc);
                //Session["docid"] = disc.document_id;
                WebHelpers.AddScriptFormEdit(Page, disc, (string)Session["emp_id"], loc);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Disc disc)
        {
            try
            {
                //bool IsLocal = (patientInfo.nationality_e == "Viet Nam");

                prt_disc_ward_desc.Text = disc.disc_ward_desc;

                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.DOB);
                prt_vpid.Text = patientInfo.visible_patient_id;

                prt_address.Text = patientInfo.GetAddress(true);
                prt_address_e.Text = $"/ {patientInfo.GetAddress(false)}";

                prt_gender.Text = patientInfo.GetGender(true);
                prt_gender_e.Text = $"/ {patientInfo.GetGender(false)}";

                prt_occupation.Text = patientInfo.GetOccupation(true);
                prt_occupation_e.Text = $"/ {patientInfo.GetOccupation(false)}";

                prt_nationality.Text = patientInfo.GetNationality(true);
                prt_nationality_e.Text = $"/ {patientInfo.GetNationality(false)}";

                prt_fullname.Text = patientInfo.GetFullName(true);
                prt_patient_name_e.Text = $"/ {patientInfo.GetFullName(false)}";

                prt_valid_from.Text = WebHelpers.FormatDateTime(disc.valid_from);
                //prt_to.Text
                //prt_no_health_insurance.Text = "<span style=\"border:1px solid #0000\" >" + disc.no_health_insurance + "</span>";

                string no_health_insurance = disc.no_health_insurance;
                prt_no1.Text = prt_no2.Text = prt_no3.Text = prt_no4.Text = prt_no5.Text = prt_no6.Text = " ";
                if (no_health_insurance != null)
                {
                    for (int i = 0; i < no_health_insurance.Length; i++)
                    {
                        if (i <= 1)
                        {
                            prt_no1.Text += no_health_insurance[i];
                        }
                        else if (i <= 2)
                        {
                            prt_no2.Text += no_health_insurance[i];
                        }
                        else if (i <= 4)
                        {
                            prt_no3.Text += no_health_insurance[i];
                        }
                        else if (i <= 7)
                        {
                            prt_no4.Text += no_health_insurance[i];
                        }
                        else if (i <= 10)
                        {
                            prt_no5.Text += no_health_insurance[i];
                        }
                        else if (i <= 13)
                        {
                            prt_no6.Text += no_health_insurance[i];
                        }
                    }
                }

                

                bool isValidDateTime;

                //if (patientVisitInfo.associated_visit_id != Convert.ToString(Guid.Empty) && Convert.ToString(patientVisitInfo.visit_type).Trim() == "ERO")
                //{

                if (patientVisitInfo.associated_visit_id != Convert.ToString(Guid.Empty))
                {
                    PatientVisitInfo patientVisitInfo1 = new PatientVisitInfo(patientVisitInfo.associated_visit_id, loc);

                    associated_visit_admited = WebHelpers.ConvertDateTime(patientVisitInfo1.actual_visit_date_time, out isValidDateTime, out string admitted_time1);

                    associated_visit_closed = WebHelpers.ConvertDateTime(patientVisitInfo1.closure_date_time, out bool isValid3, out string admitted_time3);
                }
                else
                {
                    associated_visit_admited = WebHelpers.ConvertDateTime(patientVisitInfo.actual_visit_date_time, out isValidDateTime, out string admitted_time2);
                }

                //associated_visit_admited = WebHelpers.ConvertDateTime(patientVisitInfo.actual_visit_date_time, out isValidDateTime, out string admitted_time);

                if (isValidDateTime)
                {
                    string hour = associated_visit_admited.Hour.ToString();
                    string minute = associated_visit_admited.Minute.ToString();

                    string day = associated_visit_admited.Day.ToString();
                    string month = associated_visit_admited.Month.ToString();
                    string year = associated_visit_admited.Year.ToString();

                    prt_hour.Text = (hour.Length <= 1 ? "0" : "") + hour;
                    prt_minute.Text = (minute.Length <= 1 ? "0" : "") + minute;
                    prt_day.Text = (day.Length <= 1 ? "0" : "") + day;
                    prt_month.Text = (month.Length <= 1 ? "0" : "") + month;
                    prt_year.Text = year;
                }

                var DiscDateTime = WebHelpers.ConvertDateTime(disc.disc_date_time, out bool isValid1, out string disc_date_time);

                if (isValid1)
                {
                    string hour = DiscDateTime.Hour.ToString();
                    string minute = DiscDateTime.Minute.ToString();

                    string day = DiscDateTime.Day.ToString();
                    string month = DiscDateTime.Month.ToString();
                    string year = DiscDateTime.Year.ToString();

                    prt_hour1.Text = (hour.Length <= 1 ? "0" : "") + hour;
                    prt_minute1.Text = (minute.Length <= 1 ? "0" : "") + minute;
                    prt_day1.Text = (day.Length <= 1 ? "0" : "") + day;
                    prt_month1.Text = (month.Length <= 1 ? "0" : "") + month;
                    prt_year1.Text = year;
                }

                prt_date.dateTime = prt_date1.dateTime = Convert.ToString(disc.signature_date);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(disc.diagnosis);
                prt_treatment.Text = WebHelpers.TextToHtmlTag(disc.disc_medication);
                prt_followup_instruc.Text = WebHelpers.TextToHtmlTag(disc.followup_instruc);
                prt_notes.Text = WebHelpers.TextToHtmlTag(disc.notes, false);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        #endregion

        #region Actions
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Disc disc = new Disc(Request.QueryString["docId"], loc);
                disc.status = DocumentStatus.FINAL;

                UpdateData(disc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Disc disc = new Disc(varDocID, loc);
                disc.status = DocumentStatus.DRAFT;

                UpdateData(disc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Disc.Delete((string)Session["UserId"], Request.QueryString["docId"], loc)[0];

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
            if (WebHelpers.CanOpenForm(Page, (string)varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Disc disc = new Disc(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, disc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(disc);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
            Initial();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Methods

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
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        public string GetDocIdLink(string args)
        {
            return PAGE_URL;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        protected void UpdateData(Disc disc)
        {
            try
            {
                disc.no_discharge = disc.no_discharge;
                disc.disc_ward_code = select_disc_ward_code.Value;
                disc.disc_ward_desc = WebHelpers.GetDicDesc(disc.disc_ward_code, Disc.DISC_WARD_CODE);
                disc.no_health_insurance = txt_no_health_insurance.Value;
                disc.valid_from = DataHelpers.ConvertSQLDateTime(dpk_valid_from.SelectedDate);
                disc.disc_date_time = DataHelpers.ConvertSQLDateTime(dtpk_disc_date_time.SelectedDate);
                disc.diagnosis = txt_diagnosis.Value;
                disc.disc_medication = txt_disc_medication.Value;
                disc.followup_instruc = txt_followup_instruc.Value;
                disc.notes = txt_notes.Value;
                disc.signature_date = DataHelpers.ConvertSQLDateTime(dpk_signature_date.SelectedDate);

                if (JsonConvert.SerializeObject(disc) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                disc.amend_reason = txt_amend_reason.Text;
                disc.user_name = (string)Session["UserID"];

                dynamic result = disc.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);

                    Initial();
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    disc = new Disc(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    disc = new Disc(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Disc.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                //loadRadGridHistoryLog();

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (disc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(disc, WebHelpers.LoadFormControl(form1, disc, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(disc);
                }
                else if (disc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(disc, WebHelpers.LoadFormControl(form1, disc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, disc.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = disc.status,
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
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Response.Redirect(PAGE_URL);
            }
        }

        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
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
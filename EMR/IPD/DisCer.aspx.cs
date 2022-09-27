using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class DischargeCertificate : EmrPage, IEmrFormModel<Disc>
    {
        public override string form_url { get; set; } = "IPD/DisCer";
        public Disc Model { get; set; }
        public DateTime associated_visit_admited { get; set; }
        public DateTime associated_visit_closed { get; set; }
        #region Binding Data
        public override void BindingDataFormView()
        {
            try
            {
                lbl_disc_ward_desc.Text = WebHelpers.TextToHtmlTag(Model.disc_ward_desc);
                lbl_no_health_insurance.Text = WebHelpers.TextToHtmlTag(Model.no_health_insurance);
                lbl_valid_from.Text = WebHelpers.FormatDateTime(Model.valid_from, "dd-MMM-yyyy");
                lbl_disc_date_time.Text = WebHelpers.FormatDateTime(Model.disc_date_time, "dd-MMM-yyyy HH:mm");
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                lbl_disc_medication.Text = WebHelpers.TextToHtmlTag(Model.disc_medication);
                lbl_followup_instruc.Text = WebHelpers.TextToHtmlTag(Model.followup_instruc);
                lbl_notes.Text = WebHelpers.TextToHtmlTag(Model.notes);
                lbl_signature_date.Text = WebHelpers.FormatDateTime(Model.signature_date, "dd-MMM-yyyy");
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormEdit()
        {
            try
            {
                txt_amend_reason.Text = "";

                WebHelpers.DataBind(form1, select_disc_ward_code, EmrDictionary.DISC_WARD_CODE, Model.disc_ward_code);

                txt_no_health_insurance.Value = Model.no_health_insurance;

                dpk_valid_from.SelectedDate = Model.valid_from;

                BindingDateTimePicker(dtpk_disc_date_time, Model.disc_date_time);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.diagnosis);
                txt_disc_medication.Value = WebHelpers.TextToHtmlTag(Model.disc_medication);
                txt_followup_instruc.Value = WebHelpers.TextToHtmlTag(Model.followup_instruc);
                txt_notes.Value = WebHelpers.TextToHtmlTag(Model.notes);
                dpk_signature_date.SelectedDate = Model.signature_date;

                WebHelpers.AddScriptFormEdit(Page, Model, EmpId, Location);
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex); 
            }
        }
        public override void BindingDataFormPrint()
        {
            try
            {
                prt_disc_ward_desc.Text = Model.disc_ward_desc;

                prt_dob.Text = WebHelpers.FormatDateTime(Patient.DOB);
                prt_vpid.Text = Patient.visible_patient_id;

                prt_address.Text = Patient.GetAddress(true);
                prt_address_e.Text = $"/ {Patient.GetAddress(false)}";

                prt_gender.Text = Patient.GetGender(true);
                prt_gender_e.Text = $"/ {Patient.GetGender(false)}";

                prt_occupation.Text = Patient.GetOccupation(true);
                prt_occupation_e.Text = $"/ {Patient.GetOccupation(false)}";

                prt_nationality.Text = Patient.GetNationality(true);
                prt_nationality_e.Text = $"/ {Patient.GetNationality(false)}";

                prt_fullname.Text = Patient.GetFullName(true);
                prt_patient_name_e.Text = $"/ {Patient.GetFullName(false)}";

                prt_valid_from.Text = WebHelpers.FormatDateTime(Model.valid_from);
                
                string no_health_insurance = Model.no_health_insurance;
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

                if (PatientVisit.associated_visit_id != Convert.ToString(Guid.Empty))
                {
                    PatientVisitInfo patientVisitInfo1 = new PatientVisitInfo(PatientVisit.associated_visit_id, Location);

                    associated_visit_admited = WebHelpers.ConvertDateTime(patientVisitInfo1.actual_visit_date_time, out isValidDateTime, out string admitted_time1);

                    associated_visit_closed = WebHelpers.ConvertDateTime(patientVisitInfo1.closure_date_time, out bool isValid3, out string admitted_time3);
                }
                else
                {
                    associated_visit_admited = WebHelpers.ConvertDateTime(PatientVisit.actual_visit_date_time, out isValidDateTime, out string admitted_time2);
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

                var DiscDateTime = WebHelpers.ConvertDateTime(Model.disc_date_time, out bool isValid1, out string disc_date_time);

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

                prt_date.dateTime = prt_date1.dateTime = Convert.ToString(Model.signature_date);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                prt_treatment.Text = WebHelpers.TextToHtmlTag(Model.disc_medication);
                prt_followup_instruc.Text = WebHelpers.TextToHtmlTag(Model.followup_instruc);
                prt_notes.Text = WebHelpers.TextToHtmlTag(Model.notes, false);
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex); 
            }
        }
        #endregion
        #region Actions
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Model = new Disc(varDocID, Location);
                dynamic result = Model.Delete(UserId, Location)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, Location);
                    Response.Redirect(PAGE_URL_DEFAULT);
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (CheckOpenForm)
            {
                Model = new Disc(varDocID, Location);
                HideControl(btnAmend, btnPrint);
                ShowControl(btnComplete, btnCancel, amendReasonWraper);
                LoadFormControl(form1, Model, ControlState.Edit);
                BindingDataFormEdit();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, Location);
            Init_Page();
        }
        #endregion
        #region Methods
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
        /// <summary>
        /// <para>Step 1: Check valid data</para>
        /// <para>Step 2: Update data</para>
        /// </summary>
        /// <param name="disc"></param>
        public override void UpdateModel(string status)
        {
            try
            {
                Model = new Disc(varDocID, Location);
                Model.status = status;

                Model.no_discharge = Model.no_discharge;
                Model.disc_ward_code = select_disc_ward_code.Value;
                Model.disc_ward_desc = WebHelpers.GetDicDesc(Model.disc_ward_code, EmrDictionary.DISC_WARD_CODE);
                Model.no_health_insurance = txt_no_health_insurance.Value;
                Model.valid_from = DataHelpers.ConvertSQLDateTime(dpk_valid_from.SelectedDate);
                Model.disc_date_time = DataHelpers.ConvertSQLDateTime(dtpk_disc_date_time.SelectedDate);
                Model.diagnosis = txt_diagnosis.Value;
                Model.disc_medication = txt_disc_medication.Value;
                Model.followup_instruc = txt_followup_instruc.Value;
                Model.notes = txt_notes.Value;
                Model.signature_date = DataHelpers.ConvertSQLDateTime(dpk_signature_date.SelectedDate);

                if (JsonConvert.SerializeObject(Model) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                Model.amend_reason = txt_amend_reason.Text;
                Model.user_name = UserId;

                dynamic result = Model.Update(Location)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                    Init_Page();
                }
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex); 
            }
            finally
            {
                WebHelpers.clearSessionDoc(Page, varDocID, Location);
            }
        }
        public override void Init_Page()
        {
            Patient = new PatientInfo(varPID);
            PatientVisit = new PatientVisitInfo(varPVID, Location);

            Model = new Disc(varDocID, Location, varDocIdLog);
            currentLog.Visible = !string.IsNullOrEmpty(varDocIdLog);
            uc_patientInfo.Patient = Patient;
            uc_patientInfo.PatientVisit = PatientVisit;

            RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Model.Logs(Location), out string signature_date, out string signature_name);

            HideControl(btnCancel, amendReasonWraper);

            if (Model.status == DocumentStatus.FINAL)
            {
                BindingDataForm(form1, Model, ControlState.View);
                BindingDataFormPrint();
            }
            else if (Model.status == DocumentStatus.DRAFT)
            {
                BindingDataForm(form1, Model, ControlState.Edit);
            }

            WebHelpers.getAccessButtons(new AccessButtonInfo()
            {
                Form = form1,
                DocStatus = Model.status,
                AccessGroup = GroupAccess,
                AccessAuthorize = AccessAuthorize,
                IsSameCompanyCode = !IsLocationChanged,
                IsViewLog = IsViewLog
            });
        }
        #endregion
        public override void PostBackEventHandler() { }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e) => (sender as HyperLink).NavigateUrl = PAGE_URL;
    }
}
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class DischargeCertificate : System.Web.UI.Page
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
                lbl_disc_ward_desc.Text = WebHelpers.FormatString(disc.disc_ward_desc);
                lbl_no_health_insurance.Text = WebHelpers.FormatString(disc.no_health_insurance);
                lbl_valid_from.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(disc.valid_from));
                lbl_disc_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(disc.disc_date_time));
                lbl_diagnosis.Text = WebHelpers.FormatString(disc.diagnosis);
                lbl_disc_medication.Text = WebHelpers.FormatString(disc.disc_medication);
                lbl_followup_instruc.Text = WebHelpers.FormatString(disc.followup_instruc);
                lbl_notes.Text = WebHelpers.FormatString(disc.notes);
                lbl_signature_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(disc.signature_date));
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
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
                txt_diagnosis.Value = disc.diagnosis;
                txt_disc_medication.Value = disc.disc_medication;
                txt_followup_instruc.Value = disc.followup_instruc;
                txt_notes.Value = disc.notes;
                dpk_signature_date.SelectedDate = disc.signature_date;

                WebHelpers.AddScriptFormEdit(Page, disc, (string)Session["emp_id"]);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormPrint(Disc disc)
        {
            try
            {
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();

                prt_fullname.Text = patient.GetFullName();
                prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
                prt_vpid.Text = patient.visible_patient_id;
                prt_gender.Text = patient.GetGender();
                prt_nationality.Text = patient.GetNationality();
                prt_occupation.Text = patient.GetOccupation();
                prt_valid_from.Text = WebHelpers.FormatDateTime(disc.valid_from);
                //prt_to.Text
                prt_no_health_insurance.Text = disc.no_health_insurance;
                prt_address.Text = patient.GetAddress();
                prt_admitted_time.dateTime = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
                //prt_disc_date_time.dateTime = disc.disc_date_time;
                prt_diagnosis.Text = disc.diagnosis;
                prt_treatment.Text = disc.disc_medication;
                prt_followup_instruc.Text = disc.followup_instruc;
                prt_notes.Text = disc.notes;
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        #endregion

        #region Actions
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Disc disc = new Disc(Request.QueryString["docId"]);
                disc.status = DocumentStatus.FINAL;
                
                UpdateData(disc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Disc disc = new Disc(Request.QueryString["docId"]);
                disc.status = DocumentStatus.DRAFT;

                UpdateData(disc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Disc.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    string pid = Request["pid"];
                    string vpid = Request["vpid"];

                    Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
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
                Disc disc = new Disc(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, disc, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(disc);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Disc disc = new Disc(Request.QueryString["docId"]);
            BindingDataFormPrint(disc);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        #endregion

        #region Methods
        protected void UpdateData(Disc disc)
        {
            try
            {
                disc.amend_reason = txt_amend_reason.Text;
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

                disc.user_name = (string)Session["UserID"];

                dynamic result = disc.Update()[0];

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
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {

                Disc disc = new Disc(Request.QueryString["docId"]);
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_admitted_time.dateTime = WebHelpers.FormatDateTime(PatientVisit.Instance().actual_visit_date_time);

                prt_disc_date_time.dateTime = WebHelpers.FormatDateTime(disc.disc_date_time);

                if (disc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(disc, WebHelpers.LoadFormControl(form1, disc, ControlState.View, (string)Session["location"]));
                }
                else if (disc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(disc, WebHelpers.LoadFormControl(form1, disc, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, disc.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion
    }
}
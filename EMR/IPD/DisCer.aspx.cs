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
        public Disc disc; string UserID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserID();

            if (!IsPostBack)
            {
                Initial();
            }
        }

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            disc = new Disc(Request.QueryString["docId"]);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;
            prt_admitted_time.dateTime = WebHelpers.FormatDateTime(PatientVisit.Instance(Request.QueryString["pvId"]).actual_visit_date_time);
            prt_disc_date_time.dateTime = disc.disc_date_time;
            if (disc.status == DocumentStatus.FINAL)
            {
                loadFormView(disc);
            }
            else if (disc.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(disc);
            }
        }

        #region Events
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            disc = new Disc(Request.QueryString["docId"]);

            amendReasonWraper.Visible = true;
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            LoadFormEdit(disc);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                disc = new Disc(Request.QueryString["docId"]);

                disc.user_name = (string)Session["UserID"];
                disc.status = DocumentStatus.FINAL;

                UpdateData(disc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                disc = new Disc(Request.QueryString["docId"]);

                disc.user_name = (string)Session["UserID"];
                disc.status = DocumentStatus.DRAFT;

                UpdateData(disc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            disc = new Disc(Request.QueryString["docId"]);
            LoadFormPrint(disc);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
        #endregion

        #region Load Forms
        private void LoadFormEdit(Disc disc)
        {
            txt_no_health_insurance.Value = disc.no_health_insurance;
            dpk_valid_from.SelectedDate = disc.valid_from;
            txt_diagnosis.Value = disc.diagnosis;
            txt_disc_medication.Value = disc.disc_medication;
            txt_followup_instruc.Value = disc.followup_instruc;
            txt_notes.Value = disc.notes;
            dpk_signature_date.SelectedDate = disc.signature_date;

            LoadFormControl(false);
            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }
        private void loadFormView(Disc disc)
        {
            lbl_no_health_insurance.Text = WebHelpers.GetValue(disc.no_health_insurance);
            lbl_valid_from.Text = WebHelpers.FormatDateTime(disc.valid_from);
            lbl_disc_date_time.Text = WebHelpers.FormatDateTime(disc.disc_date_time);
            lbl_diagnosis.Text = WebHelpers.GetValue(disc.diagnosis);
            lbl_disc_date_time.Text = WebHelpers.GetValue(disc.disc_medication);
            lbl_followup_instruc.Text = WebHelpers.GetValue(disc.followup_instruc);
            lbl_notes.Text = WebHelpers.GetValue(disc.notes);
            lbl_signature_date.Text = WebHelpers.FormatDateTime(disc.signature_date);

            LoadFormControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void LoadFormPrint(Disc disc)
        {


            Patient patient = Patient.Instance();
            PatientVisit patientVisit = PatientVisit.Instance(Request["pvid"]);
            
            prt_fullname.Text = patient.GetFullName();
            prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
            prt_vpid.Text =  patient.visible_patient_id;
            prt_gender.Text = patient.GetGender();
            prt_nationality.Text = patient.GetNationality();
            prt_occupation.Text = patient.GetOccupation();
            prt_valid_from.Text = WebHelpers.FormatDateTime(disc.valid_from);
            //prt_to.Text
            prt_no_health_insurance.Text = disc.no_health_insurance;
            prt_address.Text = patient.GetAddress();
            prt_admitted_time.dateTime = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
            prt_disc_date_time.dateTime = disc.disc_date_time;
            prt_diagnosis.Text = disc.diagnosis;
            prt_treatment.Text = disc.disc_medication;
            prt_followup_instruc.Text = disc.followup_instruc;
            prt_notes.Text = disc.notes;


        }
        #endregion

        public void UpdateData(Disc disc)
        {
            try
            {

                disc.amend_reason = txt_amend_reason.Text;
                disc.no_discharge = disc.no_discharge;
                //disc.disc_ward_code = ddbtn_disc_ward.Value;
                //if (disc.disc_ward_code != null) disc.disc_ward_desc = Disc.DISC_WARD_CODE[disc.disc_ward_code];
                disc.no_health_insurance = txt_no_health_insurance.Value;
                disc.valid_from = DataHelpers.ConvertSQLDateTime(dpk_valid_from.SelectedDate);
                disc.disc_date_time = DataHelpers.ConvertSQLDateTime(dtpk_disc_date_time.SelectedDate);
                disc.diagnosis = txt_diagnosis.Value;
                disc.disc_medication = txt_disc_medication.Value;
                disc.followup_instruc = txt_followup_instruc.Value;
                disc.notes = txt_notes.Value;
                disc.signature_date = DataHelpers.ConvertSQLDateTime(dpk_signature_date.SelectedDate);
                //?

                dynamic result = disc.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);
                    Initial();
                }
                else
                {
                    Session["PageNotFound"] = result;
                    Response.Redirect("../Other/PageNotFound.aspx", false);
                }
            }
            catch (Exception ex) { }
        }

        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in disc.GetType().GetProperties())
            {
                var control1 = FindControl(prop.Name + "_wrapper");
                var control2 = FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = !disabled;
                }
                if (control2 != null)
                {
                    control2.Visible = disabled;
                }
            }
        }

        #region Session
        private void CheckUserID()
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);
        }

        #endregion
    }
}
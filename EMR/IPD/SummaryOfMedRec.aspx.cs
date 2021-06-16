using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class SummaryOfMedicalReport : System.Web.UI.Page
    {
        Somr somr; string UserID = "";
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
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            somr = new Somr(Request.QueryString["docId"]);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;
            prt_barcode.Text = Patient.Instance().visible_patient_id;

            prt_barcode.Text = Patient.Instance().visible_patient_id;
            if (somr.status == DocumentStatus.FINAL)
            {
                loadFormView(somr);
            }
            else if (somr.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(somr);
            }
        }

        #region Load Form
        private void LoadFormEdit(Somr somr)
        {
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

            LoadFormControl(false);

            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }
        private void loadFormView(Somr somr)
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
            //
            LoadFormControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void LoadFormPrint(Somr somr)
        {
            Patient patient = Patient.Instance();
            prt_fullname.Text = string.Format("{0} ({1})", patient.GetFullName(), patient.GetTitle());
            prt_dob.Text = string.Format("{0} | {1}", WebHelpers.FormatDateTime(patient.date_of_birth), patient.GetGender());
            prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;
            
            prt_form_date.Text = WebHelpers.FormatDateTime(somr.form_date);
            prt_to_date.Text = WebHelpers.FormatDateTime(somr.to_date);

            prt_chief_complaint.Text = somr.chief_complaint;
            prt_diagnosis.Text = somr.diagnosis;
            prt_clinical_evolution.Text = somr.clinical_evolution;
            prt_result_para_clinical.Text = somr.result_para_clinical;
            prt_treatment_prognosis.Text = somr.treatment_prognosis;
        }

        #endregion

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                somr = new Somr(DataHelpers.varDocId);
                somr.status = DocumentStatus.FINAL;
                somr.user_name = (string)Session["UserID"];

                UpdateData(somr);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                somr = new Somr(DataHelpers.varDocId);
                somr.status = DocumentStatus.DRAFT;
                somr.user_name = (string)Session["UserID"];

                UpdateData(somr);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            somr = new Somr(Request.QueryString["docId"]);

            amendReasonWraper.Visible = true;
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            LoadFormEdit(somr);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        public void UpdateData(Somr somr)
        {
            somr.amend_reason = txt_amend_reason.Text;
            somr.form_date = DataHelpers.ConvertSQLDateTime(dpk_form_date.SelectedDate);
            somr.to_date = DataHelpers.ConvertSQLDateTime(dpk_to_date.SelectedDate);
            somr.chief_complaint = txt_chief_complaint.Value;
            somr.diagnosis = txt_diagnosis.Value;
            somr.clinical_evolution = txt_clinical_evolution.Value;
            somr.result_para_clinical = txt_result_para_clinical.Value;
            somr.treatment = txt_treatment.Value;
            somr.eval_treatment = txt_eval_treatment.Value;
            somr.treatment_prognosis = txt_treatment_prognosis.Value;

            dynamic result = somr.Update()[0];

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
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            dynamic result = Disc.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
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
            somr = new Somr(Request.QueryString["docId"]);
            LoadFormPrint(somr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
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

        #region

        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in somr.GetType().GetProperties())
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
        #endregion
    }
}
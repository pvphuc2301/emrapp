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
        Somr somr;
        protected void Page_Load(object sender, EventArgs e)
        {
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

            somr = new Somr(DataHelpers.varDocId);
            loadDataToControls(somr);
        }
        public void loadDataToControls(Somr somr)
        {
            try
            {
                WebHelpers.BindDateTimePicker(dpk_form_date, somr.form_date);
                WebHelpers.BindDateTimePicker(dpk_to_date, somr.to_date);
                txt_chief_complaint.Value = somr.chief_complaint;
                txt_diagnosis.Value = somr.diagnosis;
                txt_clinical_evolution.Value = somr.clinical_evolution;
                txt_result_para_clinical.Value = somr.result_para_clinical;
                txt_treatment.Value = somr.treatment;
                txt_eval_treatment.Value = somr.eval_treatment;
                txt_treatment_prognosis.Value = somr.treatment_prognosis;

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (somr.status == DocumentStatus.FINAL)
                {
                    loadDataToPrint(somr);

                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }

                else if (somr.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void loadDataToPrint(Somr somr)
        {
            Patient patient = Patient.Instance();
            prt_patient_label1.PID = patient.visible_patient_id;
            prt_patient_label1.FullName = patient.first_name_l;
            prt_patient_label1.DOB = WebHelpers.FormatDateTime(patient.date_of_birth);
            prt_patient_label1.Gender = patient.gender_l;

            prt_form_date.Value = WebHelpers.FormatDateTime(somr.form_date);
            prt_to_date.Value = WebHelpers.FormatDateTime(somr.to_date);

            prt_chief_complaint.Value = somr.chief_complaint;
            prt_diagnosis.Value = somr.diagnosis;
            prt_clinical_evolution.Value = somr.clinical_evolution;
            prt_result_para_clinical.Value = somr.result_para_clinical;
            prt_treatment_prognosis.Value = somr.treatment_prognosis;

            prt_signature1.Content = WebHelpers.GetSignatureTemplate1("__-__-20__", "Trưởng khoa (ký và ghi rõ họ tên)", "", "The Head of Department's signature and full name", "", (string)Session["UserId"]);

            prt_signature2.Content = WebHelpers.GetSignatureTemplate1("__-__-20__", "Bác sĩ điều trị (ký và ghi rõ họ tên)", "", "Physician's signature and full name", "", (string)Session["UserId"]);
        }

        protected void DisabledControl(bool disabled)
        {
            WebHelpers.DisabledDateTimePicker(dpk_form_date, disabled);
            WebHelpers.DisabledDateTimePicker(dpk_to_date, disabled);
            txt_chief_complaint.Disabled = disabled;
            txt_diagnosis.Disabled = disabled;
            txt_clinical_evolution.Disabled = disabled;
            txt_result_para_clinical.Disabled = disabled;
            txt_treatment.Disabled = disabled;
            txt_eval_treatment.Disabled = disabled;
            txt_treatment_prognosis.Disabled = disabled;
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                somr = new Somr(DataHelpers.varDocId);
                somr.status = DocumentStatus.FINAL;
                somr.user_name = (string)Session["UserID"];

                UpdateData(somr);
            }
            else
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
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
            else
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private string checkValidField()
        {
            string errors = "";

            if (dpk_form_date.SelectedDate == null)
            {
                errors += "dpk_form_date_error ";
            }
            if (dpk_to_date.SelectedDate == null)
            {
                errors += "dpk_to_date_error ";
            }
            return errors;
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            txt_amendReason.Visible = true;

            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        public void UpdateData(Somr somr)
        {
            somr.amend_reason = txt_amendReason.Value;
            somr.form_date = DataHelpers.ConvertSQLDateTime(dpk_form_date.SelectedDate);
            somr.to_date = DataHelpers.ConvertSQLDateTime(dpk_to_date.SelectedDate);
            somr.chief_complaint = txt_chief_complaint.Value;
            somr.diagnosis = txt_diagnosis.Value;
            somr.clinical_evolution = txt_clinical_evolution.Value;
            somr.result_para_clinical = txt_result_para_clinical.Value;
            somr.treatment = txt_treatment.Value;
            somr.eval_treatment = txt_eval_treatment.Value;
            somr.treatment_prognosis = txt_treatment_prognosis.Value;

            if (somr.Update())
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);
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
            somr = new Somr(Request["docid"]);
            loadDataToPrint(somr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = dpk_form_date.SelectedDate != null && dpk_to_date.SelectedDate != null;
        }
    }
}
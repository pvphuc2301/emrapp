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
            loadDataToOMRControls(somr);
        }
        public void loadDataToOMRControls(Somr somr)
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
            if (CheckFieldsValid())
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

        private bool CheckFieldsValid()
        {
            if(dpk_form_date.SelectedDate == null || dpk_to_date.SelectedDate == null)
            {
                return false;
            }
            return true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            somr = new Somr(DataHelpers.varDocId);
            somr.status = DocumentStatus.DRAFT;
            somr.user_name = (string)Session["UserID"];

            if(UpdateData(somr) == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);
            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            txt_amendReason.Visible = true;

            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        public string UpdateData(Somr somr)
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

            return somr.Update()[0];
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Somr.Delete((string)Session["UserID"])[0] == WebHelpers.ResponseStatus.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
        }
    }
}
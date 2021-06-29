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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            if (!IsPostBack)
            {
                Initial();
            }
        }
        
        #region Binding Data
        private void BindingDataForm(Somr somr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(somr);
            }
            else
            {
                BindingDataFormView(somr);
            }
        }
        private void BindingDataFormEdit(Somr somr)
        {
            try
            {
                txt_amend_reason.Text = "";

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

                WebHelpers.AddScriptFormEdit(Page, somr);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
            
        }
        private void BindingDataFormView(Somr somr)
        {
            try
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
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
            
            //
        }
        private void BindingDataFormPrint(Somr somr)
        {
            try
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
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
            
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Somr somr = new Somr(DataHelpers.varDocId);
                somr.status = DocumentStatus.FINAL;
                
                UpdateData(somr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Somr somr = new Somr(DataHelpers.varDocId);
                somr.status = DocumentStatus.DRAFT;

                UpdateData(somr);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Somr somr = new Somr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, somr, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(somr);
                //get access button
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            Initial();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Disc.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    string pid = Request["pid"];
                    string vpid = Request["vpid"];

                    Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
                }
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try { 
                Somr somr = new Somr(Request.QueryString["docId"]);
                BindingDataFormPrint(somr);
            
                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }

        #endregion

        #region Functions
        public void UpdateData(Somr somr)
        {
            try
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
                somr.user_name = (string)Session["UserID"];

                dynamic result = somr.Update()[0];

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
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            try
            {
                Somr somr = new Somr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (somr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(somr, WebHelpers.LoadFormControl(form1, somr, ControlState.View, (string)Session["location"]));

                }
                else if (somr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(somr, WebHelpers.LoadFormControl(form1, somr, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, somr.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

    }
}
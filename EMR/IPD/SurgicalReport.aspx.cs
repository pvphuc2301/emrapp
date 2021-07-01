using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.IPD
{
    public partial class SurgicalReport : System.Web.UI.Page
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
        private void BindingDataForm(Surr surr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(surr);
            }
            else
            {
                BindingDataFormView(surr);
            }
        }
        private void BindingDataFormEdit(Surr surr)
        {
            try
            {
                txt_amend_reason.Text = "";
                WebHelpers.BindDateTimePicker(dpk_procedure_date, surr.procedure_date);
                txt_start_time.Text = surr.start_time;
                txt_finish_time.Text = surr.finish_time;
                txt_preo_diagnosis.Value = surr.preo_diagnosis;
                txt_post_diagnosis.Value = surr.post_diagnosis;
                txt_name_procedure.Value = surr.name_procedure;
                txt_surgeon.Value = surr.surgeon;
                txt_assistant_surgeon.Value = surr.assistant_surgeon;
                txt_anesthesiologist.Value = surr.anesthesiologist;
                txt_anesthesia.Value = surr.anesthesia;
                txt_anesthetic_nurse.Value = surr.anesthetic_nurse;
                txt_scrub_nurse.Value = surr.scrub_nurse;
                txt_circulating_nurse.Value = surr.circulating_nurse;
                txt_estimated_bloodloss.Value = surr.estimated_bloodloss;
                txt_biopsy_pathology.Value = surr.biopsy_pathology;
                txt_complications.Value = surr.complications;
                txt_procedure_chart.Value = surr.procedure_chart;
                txt_procedure_narrative.Value = surr.procedure_narrative;

                WebHelpers.AddScriptFormEdit(Page, surr, (string)Session["emp_id"]);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Surr surr)
        {
            try
            {
                //3
                lbl_procedure_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(surr.procedure_date));
                lbl_start_time.Text = WebHelpers.FormatString(surr.start_time);
                lbl_finish_time.Text = WebHelpers.FormatString(surr.finish_time);
                //4
                lbl_preo_diagnosis.Text = WebHelpers.FormatString(surr.preo_diagnosis);
                //5
                lbl_post_diagnosis.Text = WebHelpers.FormatString(surr.post_diagnosis);
                //6
                lbl_name_procedure.Text = WebHelpers.FormatString(surr.name_procedure);
                //7
                lbl_anesthesia.Text = WebHelpers.FormatString(surr.anesthesia);
                //8
                lbl_surgeon.Text = WebHelpers.FormatString(surr.surgeon);
                lbl_assistant_surgeon.Text = WebHelpers.FormatString(surr.assistant_surgeon);
                lbl_anesthesiologist.Text = WebHelpers.FormatString(surr.anesthesiologist);
                lbl_anesthetic_nurse.Text = WebHelpers.FormatString(surr.anesthetic_nurse);
                lbl_scrub_nurse.Text = WebHelpers.FormatString(surr.scrub_nurse);
                lbl_circulating_nurse.Text = WebHelpers.FormatString(surr.circulating_nurse);
                lbl_estimated_bloodloss.Text = WebHelpers.FormatString(surr.estimated_bloodloss);
                lbl_biopsy_pathology.Text = WebHelpers.FormatString(surr.biopsy_pathology);
                lbl_complications.Text = WebHelpers.FormatString(surr.complications);
                lbl_procedure_chart.Text = WebHelpers.FormatString(surr.procedure_chart);
                lbl_procedure_narrative.Text = WebHelpers.FormatString(surr.procedure_narrative);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(Surr surr)
        {
            try
            {
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();
                prt_pid.InnerText = patient.visible_patient_id;
                prt_FullName.InnerText = patient.GetFullName();
                prt_admission_date.InnerText = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);

                prt_procedure_date.InnerText = WebHelpers.FormatDateTime(surr.procedure_date);
                prt_start_time.InnerText = surr.start_time;
                prt_finish_time.InnerText = surr.finish_time;
                prt_preo_diagnosis.InnerText = surr.preo_diagnosis;
                prt_post_diagnosis.InnerText = surr.post_diagnosis;
                prt_name_procedure.InnerText = surr.name_procedure;
                prt_anesthesia.InnerText = surr.anesthesia;
                prt_surgeon.InnerText = surr.surgeon;
                prt_assistant_surgeon.InnerText = surr.assistant_surgeon;
                prt_anesthesiologist.InnerText = surr.anesthesiologist;
                prt_anesthetic_nurse.InnerText = surr.anesthetic_nurse;
                prt_scrub_nurse.InnerText = surr.scrub_nurse;
                prt_circulating_nurse.InnerText = surr.circulating_nurse;
                prt_estimated_bloodloss.InnerText = surr.estimated_bloodloss;
                prt_biopsy_pathology.InnerText = surr.biopsy_pathology;
                prt_complications.InnerText = surr.complications;
                prt_procedure_chart.InnerText = surr.procedure_chart;
                prt_procedure_narrative.InnerText = surr.procedure_narrative;
            }
            catch(Exception ex)
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
                Surr surr = new Surr(DataHelpers.varDocId);
                surr.status = DocumentStatus.FINAL;
                
                UpdateData(surr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surr surr = new Surr(DataHelpers.varDocId);
                surr.status = DocumentStatus.DRAFT;
                
                UpdateData(surr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Surr.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
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
            if (WebHelpers.CanOpenForm(Page,  (string)Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Surr surr = new Surr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, surr, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(surr);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Surr surr = new Surr(Request.QueryString["docId"]);
            BindingDataFormPrint(surr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        #endregion

        #region Functions
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            try
            {
                Surr surr = new Surr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (surr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(surr, WebHelpers.LoadFormControl(form1, surr, ControlState.View, (string)Session["location"]));
                }
                else if (surr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(surr, WebHelpers.LoadFormControl(form1, surr, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, surr.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void UpdateData(Surr surr)
        {
            try
            {
                //3
                surr.procedure_date = DataHelpers.ConvertSQLDateTime(dpk_procedure_date.SelectedDate);
                surr.start_time = txt_start_time.Text;
                surr.finish_time = txt_finish_time.Text;
                //4
                surr.preo_diagnosis = txt_preo_diagnosis.Value;
                //5
                surr.post_diagnosis = txt_post_diagnosis.Value;
                //6
                surr.name_procedure = txt_name_procedure.Value;
                //7
                surr.anesthesia = txt_anesthesia.Value;
                //8
                surr.surgeon = txt_surgeon.Value;
                //9
                surr.assistant_surgeon = txt_assistant_surgeon.Value;
                //10
                surr.anesthesiologist = txt_anesthesiologist.Value;
                //11
                surr.anesthetic_nurse = txt_anesthetic_nurse.Value;
                //12
                surr.scrub_nurse = txt_scrub_nurse.Value;
                //13
                surr.circulating_nurse = txt_circulating_nurse.Value;
                //14
                surr.estimated_bloodloss = txt_estimated_bloodloss.Value;
                //15
                surr.biopsy_pathology = txt_biopsy_pathology.Value;
                //16
                surr.complications = txt_complications.Value;
                //
                surr.procedure_narrative = txt_procedure_narrative.Value;

                surr.user_name = (string)Session["UserID"];

                dynamic result = surr.Update()[0];

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

    }
}
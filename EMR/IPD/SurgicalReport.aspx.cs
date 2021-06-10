using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EMR
{
    public partial class SurgicalReport : System.Web.UI.Page
    {
        Surr surr;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadPrintInfo(true);

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
            surr = new Surr(DataHelpers.varDocId);
            loadDataToSurrControls(surr);


        }

        public void loadDataToSurrControls(Surr surr)
        {
            try
            {
                lbl_caregiver_name_l.InnerText =surr.created_name_l;
                lbl_submited_date.InnerText = WebHelpers.FormatDateTime(surr.submited_date_time);
                lbl_pid.InnerText = DataHelpers.patient.visible_patient_id;
                
                WebHelpers.BindDateTimePicker(rad_procedure_date, surr.procedure_date);
                lbl_procedure_date.InnerText =  WebHelpers.FormatDateTime(surr.procedure_date);

                WebHelpers.BindDateTimePicker(rad_start_time, surr.start_time);
                lbl_start_time.InnerText = WebHelpers.FormatDateTime(surr.start_time);
                lbl_finish_time.InnerText = WebHelpers.FormatDateTime(surr.finish_time);
                WebHelpers.BindDateTimePicker(rad_finish_time, surr.finish_time);
                lbl_preo_diagnosis.InnerText=txt_preo_diagnosis.Value = surr.preo_diagnosis;
                lbl_post_diagnosis.InnerText=txt_post_diagnosis.Value = surr.post_diagnosis;
                lbl_name_procedure.InnerText=txt_name_procedure.Value = surr.name_procedure;
                lbl_anesthesia.InnerText=txt_anesthesia.Value = surr.anesthesia;
                lbl_surgeon.InnerText=txt_surgeon.Value = surr.surgeon;
                lbl_assistant_surgeon.InnerText=txt_assistant_surgeon.Value = surr.assistant_surgeon;
                lbl_anesthesiologist.InnerText=txt_anesthesiologist.Value = surr.anesthesiologist;
                lbl_anesthetic_nurse.InnerText=txt_anesthetic_nurse.Value = surr.anesthetic_nurse;
                lbl_scrub_nurse.InnerText=txt_scrub_nurse.Value = surr.scrub_nurse;
                lbl_circulating_nurse.InnerText=txt_circulating_nurse.Value = surr.circulating_nurse;
                lbl_estimated_bloodloss.InnerText=txt_estimated_bloodloss.Value = surr.estimated_bloodloss;
                lbl_biopsy_pathology.InnerText=txt_biopsy_pathology.Value = surr.biopsy_pathology;
                lbl_complications.InnerText=txt_complications.Value = surr.complications;
                lbl_procedure_chart.InnerText=txt_procedure_chart.Value = surr.procedure_chart;
                lbl_procedure_narrative.InnerText=txt_procedure_narrative.Value = surr.procedure_narrative;
                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (surr.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;
                    btnCancel.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }
                else if (surr.status == DocumentStatus.DRAFT)
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
            WebHelpers.DisabledDateTimePicker(rad_procedure_date, disabled);
            WebHelpers.DisabledDateTimePicker(rad_start_time, disabled);
            WebHelpers.DisabledDateTimePicker(rad_finish_time, disabled);
            txt_preo_diagnosis.Disabled = disabled;
            txt_post_diagnosis.Disabled = disabled;
            txt_name_procedure.Disabled = disabled;
            txt_anesthesia.Disabled = disabled;
            txt_surgeon.Disabled = disabled;
            txt_assistant_surgeon.Disabled = disabled;
            txt_anesthesiologist.Disabled = disabled;
            txt_anesthetic_nurse.Disabled = disabled;
            txt_scrub_nurse.Disabled = disabled;
            txt_circulating_nurse.Disabled = disabled;
            txt_estimated_bloodloss.Disabled = disabled;
            txt_biopsy_pathology.Disabled = disabled;
            txt_complications.Disabled = disabled;
            txt_procedure_chart.Disabled = disabled;
            txt_procedure_narrative.Disabled = disabled;

        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                surr = new Surr(DataHelpers.varDocId);
                surr.status = DocumentStatus.FINAL;

                surr.user_name = (string)Session["UserID"];

                UpdateData(surr);
            }
            else
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }

        }

        public void UpdateData(Surr surr)
        {
            try
            {
                surr.procedure_date = DataHelpers.ConvertSQLDateTime(rad_procedure_date.SelectedDate);
                surr.start_time = DataHelpers.ConvertSQLDateTime(rad_start_time.SelectedDate);
                surr.finish_time = DataHelpers.ConvertSQLDateTime(rad_finish_time.SelectedDate);
                surr.preo_diagnosis=txt_preo_diagnosis.Value;
                surr.post_diagnosis = txt_post_diagnosis.Value;
                surr.name_procedure = txt_name_procedure.Value;
                surr.anesthesia = txt_anesthesia.Value;
                surr.surgeon = txt_surgeon.Value;
                surr.assistant_surgeon = txt_assistant_surgeon.Value;
                surr.anesthesiologist = txt_anesthesiologist.Value;
                surr.anesthetic_nurse = txt_anesthetic_nurse.Value;
                surr.scrub_nurse = txt_scrub_nurse.Value;
                surr.circulating_nurse = txt_circulating_nurse.Value;
                surr.estimated_bloodloss = txt_estimated_bloodloss.Value;
                surr.biopsy_pathology = txt_biopsy_pathology.Value;
                surr.complications = txt_complications.Value;
                surr.procedure_chart = txt_procedure_chart.Value;
                surr.procedure_narrative = txt_procedure_narrative.Value;

                dynamic result = surr.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 100000);

                    Initial();
                }
                else
                {
                    Session["PageNotFound"] = result[0];
                    Response.Redirect("../Other/PageNotFound.aspx", false);
                }
            }
            catch (Exception ex) { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                surr = new Surr(DataHelpers.varDocId);

                surr.user_name = (string)Session["UserID"];
                surr.status = DocumentStatus.DRAFT;

                UpdateData(surr);
            }
            else
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private string checkValidField()
        {
            return "";
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "Disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            txt_amendReason.Visible = true;

            DisabledControl(false);
        }

        public void LoadPrintInfo(bool tmp)
        {
            try
            {
                
                lbl_FullName.InnerText = DataHelpers.patient.first_name_l+ " " + DataHelpers.patient.last_name_l;
                lbl_admission_date.InnerText = WebHelpers.FormatDateTime(DataHelpers.patientVisit.actual_visit_date_time);
                //lbl_caregiver_name_l.InnerText = DataHelpers.patientVisit.caregiver_name_l;


            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            txt_amendReason.Visible = false;

            DisabledControl(true);
        }
        

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Surr.Delete((string)Session["UserId"], Request.QueryString["docId"]);

            if (result[0].Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result[0];
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
    }
}
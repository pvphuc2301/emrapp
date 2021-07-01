using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class IniMedAssForNeoInp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) return;
            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Imani imani, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(imani);
            }
            else
            {
                BindingDataFormView(imani);
            }
        }
        private void BindingDataFormEdit(Imani imani)
        {
            try
            {
                txt_amend_reason.Text = "";

                txt_admission_reason.Value = imani.admission_reason;
                txt_cur_med_history.Value = imani.cur_med_history;
                txt_cur_medication.Value = imani.cur_medication;
                txt_delivery.Value = imani.delivery;
                txt_post_nutrition.Value = imani.post_nutrition;
                txt_mater_med_history.Value = imani.mater_med_history;
                txt_exam_weight.Value = imani.exam_weight;
                txt_exam_length.Value = imani.exam_length;
                txt_exam_head_circum.Value = imani.exam_head_circum;
                txt_exam_hr.Value = imani.exam_hr;
                txt_exam_rr.Value = imani.exam_rr;
                txt_physical_exam.Value = imani.physical_exam;
                txt_laboratory.Value = imani.laboratory;
                txt_initial_diagnosis.Value = imani.initial_diagnosis;
                txt_diff_diagnosis.Value = imani.diff_diagnosis;
                txt_associated_conditions.Value = imani.associated_conditions;
                txt_treatment_plan.Value = imani.treatment_plan;
                txt_discharge_plan.Value = imani.discharge_plan;

                WebHelpers.AddScriptFormEdit(Page, imani, (string)Session["emp_id"]);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Imani imani)
        {
            try
            {
                lbl_admission_reason.Text = WebHelpers.FormatString(imani.admission_reason);
                lbl_cur_med_history.Text = WebHelpers.FormatString(imani.cur_med_history);
                lbl_cur_medication.Text = WebHelpers.FormatString(imani.cur_medication);
                lbl_delivery.Text = WebHelpers.FormatString(imani.delivery);
                lbl_post_nutrition.Text = WebHelpers.FormatString(imani.post_nutrition);
                lbl_mater_med_history.Text = WebHelpers.FormatString(imani.mater_med_history);
                lbl_exam_weight.Text = WebHelpers.FormatString(imani.exam_weight);
                lbl_exam_length.Text = WebHelpers.FormatString(imani.exam_length);
                lbl_exam_head_circum.Text = WebHelpers.FormatString(imani.exam_head_circum);
                lbl_exam_hr.Text = WebHelpers.FormatString(imani.exam_hr);
                lbl_exam_rr.Text = WebHelpers.FormatString(imani.exam_rr);
                lbl_physical_exam.Text = WebHelpers.FormatString(imani.physical_exam);
                lbl_laboratory.Text = WebHelpers.FormatString(imani.laboratory);
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(imani.initial_diagnosis);
                lbl_diff_diagnosis.Text = WebHelpers.FormatString(imani.diff_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.FormatString(imani.associated_conditions);
                lbl_treatment_plan.Text = WebHelpers.FormatString(imani.treatment_plan);
                lbl_discharge_plan.Text = WebHelpers.FormatString(imani.discharge_plan);

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Imani imani)
        {
            try
            {
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();

                prt_fullname.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
                prt_dob.Text = WebHelpers.FormatDateTime(DataHelpers.patient.date_of_birth) + "| " + DataHelpers.patient.gender_l;
                prt_vpid.Text = DataHelpers.patient.visible_patient_id;
                lbl_date.Text = imani.created_date_time.ToString("dd");
                lbl_month.Text = imani.created_date_time.ToString("MM");
                lbl_year.Text = imani.created_date_time.ToString("yyyy");

                prt_admission_reason.Text = imani.admission_reason;
                prt_cur_med_history.Text = imani.cur_med_history;
                prt_cur_medication.Text = imani.cur_medication;
                prt_delivery.Text = imani.delivery;
                prt_post_nutrition.Text = imani.post_nutrition;
                prt_mater_med_history.Text = imani.mater_med_history;
                prt_exam_weight.Text = imani.exam_weight;
                prt_exam_length.Text = imani.exam_length;
                prt_exam_head_circum.Text = imani.exam_head_circum;
                prt_exam_hr.Text = imani.exam_hr;
                prt_exam_rr.Text = imani.exam_rr;
                prt_physical_exam.Text = imani.physical_exam;
                prt_laboratory.Text = imani.laboratory;
                prt_initial_diagnosis.Text = imani.initial_diagnosis;
                prt_diff_diagnosis.Text = imani.diff_diagnosis;
                prt_associated_conditions.Text = imani.associated_conditions;
                prt_treatment_plan.Text = imani.treatment_plan;
                prt_discharge_plan.Text = imani.discharge_plan;

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        #endregion
        
        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Imani imani = new Imani(Request.QueryString["docId"]);
                imani.status = DocumentStatus.FINAL;
                
                UpdateData(imani);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Imani imani = new Imani(Request.QueryString["docId"]);
                imani.status = DocumentStatus.DRAFT;

                UpdateData(imani);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Imani.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

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
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Imani imani = new Imani(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, imani, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(imani);
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
            try
            {
                Imani imani = new Imani(Request.QueryString["docId"]);
                BindingDataFormPrint(imani);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        #endregion

        #region Functions
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];
            
            try
            {
                Imani imani = new Imani(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (imani.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(imani, WebHelpers.LoadFormControl(form1, imani, ControlState.View, (string)Session["location"]));

                }
                else if (imani.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(imani, WebHelpers.LoadFormControl(form1, imani, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, imani.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public void UpdateData(Imani imani)
        {
            try
            {
                imani.admission_reason = txt_admission_reason.Value;
                imani.cur_med_history = txt_cur_med_history.Value;
                imani.cur_medication = txt_cur_medication.Value;
                imani.delivery = txt_delivery.Value;
                imani.post_nutrition = txt_post_nutrition.Value;
                imani.mater_med_history = txt_mater_med_history.Value;
                imani.exam_weight = txt_exam_weight.Value;
                imani.exam_length = txt_exam_length.Value;
                imani.exam_head_circum = txt_exam_head_circum.Value;
                imani.exam_hr = txt_exam_hr.Value;
                imani.exam_rr = txt_exam_rr.Value;
                imani.physical_exam = txt_physical_exam.Value;
                imani.laboratory = txt_laboratory.Value;
                imani.initial_diagnosis = txt_initial_diagnosis.Value;
                imani.diff_diagnosis = txt_diff_diagnosis.Value;
                imani.associated_conditions = txt_associated_conditions.Value;
                imani.treatment_plan = txt_treatment_plan.Value;
                imani.discharge_plan = txt_discharge_plan.Value;
                imani.user_name = (string)Session["UserID"];

                dynamic result = imani.Update()[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

    }
}
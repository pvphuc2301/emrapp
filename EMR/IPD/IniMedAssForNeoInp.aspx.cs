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
        string amendReason = "";
        IniMedAssForNeoInpatient imani;
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
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];
            imani = new IniMedAssForNeoInpatient(DataHelpers.varDocId);
            loadDataToControls(imani);

        }
        public void loadDataToControls(IniMedAssForNeoInpatient imani)
        {
            lbPatientName.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            lbDoB.Text = DateTime.Parse(DataHelpers.patient.date_of_birth).ToString("dd/MM/yyyy") + "| " + DataHelpers.patient.gender_l;
            lbPID.Text = DataHelpers.patient.visible_patient_id;
            lbl_admission_reason.Text=txt_admission_reason.Value = imani.admission_reason;
            lbl_cur_med_history.Text=txt_cur_med_history.Value = imani.cur_med_history;
            lbl_cur_medication.Text=txt_cur_medication.Value = imani.cur_medication;
            lbl_delivery.Text=txt_delivery.Value = imani.delivery;
            lbl_post_nutrition.Text=txt_post_nutrition.Value = imani.post_nutrition;
            lbl_mater_med_history.Text=txt_mater_med_history.Value = imani.mater_med_history;
            lbl_exam_weight.Text=txt_exam_weight.Value = imani.exam_weight;
            lbl_exam_length.Text=txt_exam_length.Value = imani.exam_length;
            lbl_exam_head_circum.Text=txt_exam_head_circum.Value = imani.exam_head_circum;
            lbl_exam_hr.Text=txt_exam_hr.Value = imani.exam_hr;
            lbl_exam_rr.Text=txt_exam_rr.Value = imani.exam_rr;
            lbl_physical_exam.Text=txt_physical_exam.Value = imani.physical_exam;
            lbl_laboratory.Text=txt_laboratory.Value = imani.laboratory;
            lbl_initial_diagnosis.Text=txt_initial_diagnosis.Value = imani.initial_diagnosis;
            lbl_diff_diagnosis.Text=txt_diff_diagnosis.Value = imani.diff_diagnosis;
            lbl_associated_conditions.Text=txt_associated_conditions.Value = imani.associated_conditions;
            lbl_treatment_plan.Text=txt_treatment_plan.Value = imani.treatment_plan;
            lbl_discharge_plan.Text = txt_discharge_plan.Value = imani.discharge_plan;
            btnCancel.Visible = false;
            txt_amendReason.Visible = false;
            if (imani.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                btnCancel.Visible = false;
                btnDeleteModal.Visible = false;
                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);
            }
            else if (imani.status == DocumentStatus.DRAFT)
            {

                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }
        protected void DisabledControl(bool disabled)
        {
            txt_admission_reason.Disabled = disabled;
            txt_cur_med_history.Disabled = disabled;
            txt_cur_medication.Disabled = disabled;
            txt_delivery.Disabled = disabled;
            txt_post_nutrition.Disabled = disabled;
            txt_mater_med_history.Disabled = disabled;
            txt_exam_weight.Disabled = disabled;
            txt_exam_length.Disabled = disabled;
            txt_exam_head_circum.Disabled = disabled;
            txt_exam_hr.Disabled = disabled;
            txt_exam_rr.Disabled = disabled;
            txt_physical_exam.Disabled = disabled;
            txt_laboratory.Disabled = disabled;
            txt_initial_diagnosis.Disabled = disabled;
            txt_diff_diagnosis.Disabled = disabled;
            txt_associated_conditions.Disabled = disabled;
            txt_treatment_plan.Disabled = disabled;
            txt_discharge_plan.Disabled = disabled;
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            AmendReason amendReason = (AmendReason)Page.LoadControl("~/UserControls/AmendReason.ascx");
            amendReason.Load(AmendReasonPlaceHolder);

            btnComplete.Visible = true;
            btnComplete.Attributes["disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }
        public void UpdateData(IniMedAssForNeoInpatient imani)
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

                if (imani.Update()[0] == WebHelpers.ResponseStatus.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS, 100000);

                    Initial();
                }
            }
            catch (Exception ex) { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            imani = new IniMedAssForNeoInpatient(DataHelpers.varDocId);

            imani.user_name = (string)Session["UserID"];
            imani.status = DocumentStatus.DRAFT;
            UpdateData(imani);

        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            imani = new IniMedAssForNeoInpatient(DataHelpers.varDocId);
            imani.status = DocumentStatus.FINAL;
            imani.user_name = (string)Session["UserID"];

            UpdateData(imani);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (IniMedAssForNeoInpatient.Delete((string)Session["UserID"], Request.QueryString["vpid"])[0] == WebHelpers.ResponseStatus.OK)
            {

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

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
    }
}
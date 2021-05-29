using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class MedicalCertificate : System.Web.UI.Page
    {
        MC mc;

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

            mc = new MC(DataHelpers.varDocId);

            loadDataToControls(mc);
        }

        public void loadDataToControls(MC mc)
        {
            // 2. Lý do đến khám
            txtChiefComplaint.Value = mc.chief_complain;
            txtChiefComplaint.Disabled = false;

            // 3. Tóm tắt bệnh sử                          
            txtHistoryPresentIllness.Value = mc.history_present_illness;

            // 4. Tiền sử bệnh                
            txtPastHistory.Value = mc.past_history;
            // 5. Đặc điểm lâm sàng
            txtClinicalFindings.Value = mc.clinical_findings;

            //6. Cận lâm sàng được chỉ định
            txtParaClinicalInvestigations.Value = mc.para_clinical_investigations;

            //7. Chẩn đoán
            txtDiagnosis.Value = mc.diagnosis;

            //8. Phương pháp và thuốc điều trị
            txtTreatment.Value = mc.treatment;

            //9. Thời gian điều trị
            txtTreatmentPeriod.Value = mc.treatment_period;

            //10. Lời khuyên và theo dõi
            txtRecommendation.Value = mc.recommendation;

            //11. Lời khuyên và theo dõi
            txtTreatmentPlan.Value = mc.treatment_plan;

            btnCancel.Visible = false;
            //amendReasonBox.Visible = false;
            if (mc.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                btnCancel.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);
            }
            else if (mc.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            mc = new MC(DataHelpers.varDocId);

            mc.user_name = (string)Session["UserID"];

            mc.status = DocumentStatus.FINAL;
            mc.chief_complain = txtChiefComplaint.Value;
            mc.history_present_illness = txtHistoryPresentIllness.Value;
            mc.past_history = txtPastHistory.Value;
            mc.clinical_findings = txtClinicalFindings.Value;
            mc.para_clinical_investigations = txtParaClinicalInvestigations.Value;
            mc.diagnosis = txtDiagnosis.Value;
            mc.treatment = txtTreatment.Value;
            mc.treatment_period = txtTreatmentPeriod.Value;
            mc.recommendation = txtRecommendation.Value;
            mc.treatment_plan = txtTreatmentPlan.Value;

            if (mc.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            mc = new MC(DataHelpers.varDocId);

            mc.user_name = (string)Session["UserID"];
            mc.status = DocumentStatus.DRAFT;
            mc.chief_complain = txtChiefComplaint.Value;
            mc.history_present_illness = txtHistoryPresentIllness.Value;
            mc.past_history = txtPastHistory.Value;
            mc.clinical_findings = txtClinicalFindings.Value;
            mc.para_clinical_investigations = txtParaClinicalInvestigations.Value;
            mc.diagnosis = txtDiagnosis.Value;
            mc.treatment = txtTreatment.Value;
            mc.treatment_period = txtTreatmentPeriod.Value;
            mc.recommendation = txtRecommendation.Value;
            mc.treatment_plan = txtTreatmentPlan.Value;

            if (mc.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (MC.Delete((string)Session["UserID"])[0] == WebHelpers.ResponseStatus.OK) { 
                
            }
        }

        protected void DisabledControl(bool disabled)
        {
            txtChiefComplaint.Disabled = disabled;
            txtHistoryPresentIllness.Disabled = disabled;
            txtPastHistory.Disabled = disabled;
            txtClinicalFindings.Disabled = disabled;
            txtParaClinicalInvestigations.Disabled = disabled;
            txtDiagnosis.Disabled = disabled;
            txtTreatment.Disabled = disabled;
            txtTreatmentPeriod.Disabled = disabled;
            txtRecommendation.Disabled = disabled;
            txtTreatmentPlan.Disabled = disabled;
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

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
    }
}
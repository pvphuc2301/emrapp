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

            loadDataToOMRControls(mc);

            btnCancel.Visible = false;

            if (mc.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                btnCancel.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;
                WebHelpers.DisabledControl(form1, true);

            }
            else if (mc.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        public void loadDataToOMRControls(MC mc)
        {
            // 2. Lý do đến khám
            txtChiefComplaint.Value = mc.chief_complain;

            // 3. Tóm tắt bệnh sử                          
            txtHistoryPresentIllness.Value = mc.history_present_illness;

            // 4. Tiền sử bệnh                
            txtPastHistory.Value = mc.past_history;
            // 5. Đặc điểm lâm sàng
            txtClinicalFindings.Value = mc.clinical_findings;

            //string varspec_opinion_requested = omr1.spec_opinion_requested;
            //if (varspec_opinion_requested.ToLower() == "true")
            //{
            //    radSpecOpinionRequested1.Checked = true;
            //    txtSpecOpinionRequestedNote.Text = omr1.spec_opinion_requested_note;
            //}
            //else
            //    radSpecOpinionRequested0.Checked = true;

            //txtSpecificEducationRequired.Text = omr1.specific_education_required;
            //txtNextAppointment.Text = omr1.next_appointment;

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
                WebHelpers.DisabledControl(form1, true);
            }
            else if (mc.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        protected void btnComplete_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            mc = new MC(DataHelpers.varDocId);

            mc.user_name = "phut.phan";
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

            if (mc.Update()[0] == "OK")
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, "Your changes have been saved", 2000, Message.TYPE.SUCCESS);
                
                Initial();
            }

        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnAmend_ServerClick(object sender, EventArgs e)
        {
            AmendReason amendReason = (AmendReason)Page.LoadControl("~/UserControls/Prompt.ascx");
            amendReason.Load(AmendReasonPlaceHolder);


        }

        protected void btnPrint_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnCancel_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnGetValue_ServerClick(object sender, EventArgs e)
        {
            Console.WriteLine(txtChiefComplaint1.Value);
            Console.WriteLine(txtPastHistory1.Value);
        }
    }
}
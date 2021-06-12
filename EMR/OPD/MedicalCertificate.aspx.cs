using Newtonsoft.Json;
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
        MC mc; string UserID = "";
        PatientInfo pa;         
        protected void Page_Load(object sender, EventArgs e)
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);


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
            txt_amend_reason.Visible = false;

            if (mc.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDeleteModal.Visible = false;
                btnCancel.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);
                loadDataToPrint(mc);
            }
            else if (mc.status == DocumentStatus.DRAFT)
            {

                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        private void loadDataToPrint(MC mc)
        {
            prt_patient_label.PID = DataHelpers.patient.visible_patient_id;
            prt_patient_name.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            prt_dob.Text = DataHelpers.patient.date_of_birth.ToString("dd-MM-yyyy");
            prt_gender_male.Text = string.Format("{0}", ((string)DataHelpers.patient.gender_l).ToLower() == "nam" ? "☒" : "❏");
            prt_gender_female.Text = string.Format("{0}", ((string)DataHelpers.patient.gender_l).ToLower() == "nữ" ? "☒" : "❏");
            prt_pid.Text = DataHelpers.patient.visible_patient_id;
            prt_chief_complain.Text = mc.chief_complain;
            prt_history_present_illness.Text = mc.history_present_illness;
            prt_past_history.Text = mc.past_history;
            prt_clinical_findings.Text = mc.clinical_findings;
            prt_para_clinical_investigations.Text = mc.para_clinical_investigations;
            prt_diagnosis.Text = mc.diagnosis;
            prt_treatment.Text = mc.treatment;
            prt_treatment_period.Text = mc.treatment_period;
            prt_recommendation.Text = mc.recommendation;

        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                mc = new MC(Request.QueryString["docId"]);

                mc.user_name = (string)Session["UserID"];
                mc.status = DocumentStatus.FINAL;

                UpdateData(mc);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private string checkValidField()
        {
            string error = "";
            return error;
        }

        private void UpdateData(MC mc)
        {
            try
            {
                mc.amend_reason = txt_amend_reason.Value;
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

                dynamic result = mc.Update();

                if (result[0].Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                    Initial();
                }
                else
                {
                    Session["PageNotFound"] = result[0];
                    Response.Redirect("../Other/PageNotFound.aspx", false);
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                mc = new MC(Request.QueryString["docId"]);

                mc.user_name = (string)Session["UserID"];
                mc.status = DocumentStatus.DRAFT;

                UpdateData(mc);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"]);

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

            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "Disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            txt_amend_reason.Visible = true;
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
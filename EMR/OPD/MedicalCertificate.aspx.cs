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
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(MC mc, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(mc);
            }
            else
            {
                BindingDataFormView(mc);
            }
        }
        private void BindingDataFormEdit(MC mc)
        {
            try
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "localStorage_setItem", $"window.sessionStorage.setItem('{mc}', '{JsonConvert.SerializeObject(mc)}');", true);

                // 2. Lý do đến khám
                txt_chief_complain.Value = mc.chief_complain;
                txt_chief_complain.Disabled = false;
                // 3. Tóm tắt bệnh sử                          
                txt_history_present_illness.Value = mc.history_present_illness;
                // 4. Tiền sử bệnh                
                txt_past_history.Value = mc.past_history;
                // 5. Đặc điểm lâm sàng
                txt_clinical_findings.Value = mc.clinical_findings;
                //6. Cận lâm sàng được chỉ định
                txt_para_clinical_investigations.Value = mc.para_clinical_investigations;
                //7. Chẩn đoán
                txt_diagnosis.Value = mc.diagnosis;
                //8. Phương pháp và thuốc điều trị
                txt_treatment.Value = mc.treatment;
                //9. Thời gian điều trị
                txt_treatment_period.Value = mc.treatment_period;
                //10. Lời khuyên và theo dõi
                txt_recommendation.Value = mc.recommendation;
                //11. Lời khuyên và theo dõi
                txt_treatment_plan.Value = mc.treatment_plan;
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(MC mc)
        {
            lbl_chief_complain.Text = WebHelpers.GetValue(mc.chief_complain);
            lbl_history_present_illness.Text = WebHelpers.GetValue(mc.history_present_illness);
            lbl_past_history.Text = WebHelpers.GetValue(mc.past_history);
            lbl_clinical_findings.Text = WebHelpers.GetValue(mc.clinical_findings);
            lbl_para_clinical_investigations.Text = WebHelpers.GetValue(mc.para_clinical_investigations);
            lbl_diagnosis.Text = WebHelpers.GetValue(mc.diagnosis);
            lbl_treatment.Text = WebHelpers.GetValue(mc.treatment);
            lbl_treatment_period.Text = WebHelpers.GetValue(mc.treatment_period);
            lbl_recommendation.Text = WebHelpers.GetValue(mc.recommendation);
            lbl_treatment_plan.Text = WebHelpers.GetValue(mc.treatment_plan);

        }
        private void BindingDataFormPrint(MC mc)
        {
            Patient patient = Patient.Instance();
            prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;

            prt_patient_name.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);

            prt_gender.Text = WebHelpers.CreateOptions(new Option { Text = "Nam <div class='text-primary'>Male</div>", Value = "Male" }, new Option { Text = "Nữ<div class='text-primary'>Female</div>", Value = "Female" }, DataHelpers.patient.gender_e, "display: grid; grid-template-columns: 1fr 1fr; width: 300px");

            prt_pid.Text = DataHelpers.patient.visible_patient_id;
            prt_date_of_visit.Text = WebHelpers.FormatDateTime(PatientVisit.Instance().actual_visit_date_time);
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
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MC mc = new MC(DataHelpers.varDocId);
                mc.status = DocumentStatus.FINAL;
                mc.user_name = (string)Session["UserID"];

                UpdateData(mc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MC mc = new MC(DataHelpers.varDocId);
                mc.status = DocumentStatus.DRAFT;
                mc.user_name = (string)Session["UserID"];

                UpdateData(mc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = MC.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                WebHelpers.SendError(Page, result.ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            MC mc = new MC(Request.QueryString["docId"]);
            txt_amend_reason.Text = "";
            WebHelpers.VisibleControl(false, btnAmend, btnPrint);
            WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

            //load form control
            WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, (string)Session["location"]);
            //binding data
            BindingDataFormEdit(mc);
            //get access button
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            MC mc = new MC(Request.QueryString["docId"]);
            BindingDataFormPrint(mc);

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
                MC mc = new MC(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (mc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.View, (string)Session["location"]));

                }
                else if (mc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mc, WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, (string)Session["location"]));

                }

                WebHelpers.getAccessButtons(form1, mc.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void UpdateData(MC mc)
        {
            try
            {
                mc.amend_reason = txt_amend_reason.Text;
                mc.chief_complain = txt_chief_complain.Value;
                mc.history_present_illness = txt_history_present_illness.Value;
                mc.past_history = txt_past_history.Value;
                mc.clinical_findings = txt_clinical_findings.Value;
                mc.para_clinical_investigations = txt_para_clinical_investigations.Value;
                mc.diagnosis = txt_diagnosis.Value;
                mc.treatment = txt_treatment.Value;
                mc.treatment_period = txt_treatment_period.Value;
                mc.recommendation = txt_recommendation.Value;
                mc.treatment_plan = txt_treatment_plan.Value;

                dynamic result = mc.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
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
        #endregion

        #region Validation
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_amend_reason.Text.Length > 3;
        }
        #endregion
    }
}
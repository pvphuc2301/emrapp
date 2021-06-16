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
            CheckUserID();
            
            if (!IsPostBack)
            {
                Initial();
            }
        }

        private void CheckUserID()
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);
        }

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            mc = new MC(DataHelpers.varDocId);
            Patient patient = Patient.Instance();
            prt_barcode.Text = patient.visible_patient_id;
            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;
            //LoadFormPrint(mc);
            if (mc.status == DocumentStatus.FINAL)
            {
                loadFormView(mc);
            }
            else if (mc.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(mc);
            }
        }
        private void loadFormView(MC omr)
        {
            lbl_chief_complain.Text = WebHelpers.GetValue(omr.chief_complain);
            lbl_history_present_illness.Text = WebHelpers.GetValue(omr.history_present_illness);
            lbl_past_history.Text = WebHelpers.GetValue(omr.past_history);
            lbl_clinical_findings.Text = WebHelpers.GetValue(omr.clinical_findings);
            lbl_para_clinical_investigations.Text = WebHelpers.GetValue(omr.para_clinical_investigations);
            lbl_diagnosis.Text = WebHelpers.GetValue(omr.diagnosis);
            lbl_treatment.Text = WebHelpers.GetValue(omr.treatment);
            lbl_treatment_period.Text = WebHelpers.GetValue(omr.treatment_period);
            lbl_recommendation.Text = WebHelpers.GetValue(omr.recommendation);
            lbl_treatment_plan.Text = WebHelpers.GetValue(omr.treatment_plan);

            LoadFormControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void LoadFormEdit(MC mc)
        {
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
            //
            //
            //
            LoadFormControl(false);

            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }

        //public void loadDataToControls(MC mc)
        //{
        //    try
        //    {
        //        DisabledControl(false);

        //        //// 2. Lý do đến khám
        //        //txt_chief_complain.Value = mc.chief_complain;
        //        //txt_chief_complain.Disabled = false;
        //        //// 3. Tóm tắt bệnh sử                          
        //        //txt_history_present_illness.Value = mc.history_present_illness;
        //        //// 4. Tiền sử bệnh                
        //        //txt_past_history.Value = mc.past_history;
        //        //// 5. Đặc điểm lâm sàng
        //        //txt_clinical_findings.Value = mc.clinical_findings;
        //        ////6. Cận lâm sàng được chỉ định
        //        //txt_para_clinical_investigations.Value = mc.para_clinical_investigations;
        //        ////7. Chẩn đoán
        //        //txt_diagnosis.Value = mc.diagnosis;
        //        ////8. Phương pháp và thuốc điều trị
        //        //txt_treatment.Value = mc.treatment;
        //        ////9. Thời gian điều trị
        //        //txt_treatment_period.Value = mc.treatment_period;
        //        ////10. Lời khuyên và theo dõi
        //        //txt_recommendation.Value = mc.recommendation;
        //        ////11. Lời khuyên và theo dõi
        //        //txt_treatment_plan.Value = mc.treatment_plan;

        //    } catch(Exception ex)
        //    {

        //    }
            

        //    btnCancel.Visible = false;
        //    txt_amend_reason.Visible = false;

        //    if (mc.status == DocumentStatus.FINAL)
        //    {
        //        btnComplete.Visible = false;
        //        btnSave.Visible = false;
        //        btnDeleteModal.Visible = false;
        //        btnCancel.Visible = false;

        //        btnAmend.Visible = true;
        //        btnPrint.Visible = true;

        //        DisabledControl(true);
        //    }
        //    else if (mc.status == DocumentStatus.DRAFT)
        //    {

        //        btnAmend.Visible = false;
        //        btnPrint.Visible = false;
        //    }
        //}

        private void LoadFormPrint(MC mc)
        {
            Patient patient = Patient.Instance();
            prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;
            
            prt_patient_name.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);

            prt_gender.Text = WebHelpers.CreateOptions(new Option { Text = "Nam <div class='text-primary'>Male</div>", Value = "Male" }, new Option { Text = "Nữ<div class='text-primary'>Female</div>", Value = "Female" }, DataHelpers.patient.gender_e, "display: grid; grid-template-columns: 1fr 1fr; width: 300px");

            prt_pid.Text = DataHelpers.patient.visible_patient_id;
            prt_date_of_visit.Text =  WebHelpers.FormatDateTime(DataHelpers.patientVisit.actual_visit_date_time);
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
            if (Page.IsValid)
            {
                mc = new MC(Request.QueryString["docId"]);

                mc.user_name = (string)Session["UserID"];
                mc.status = DocumentStatus.FINAL;

                UpdateData(mc);
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                mc = new MC(Request.QueryString["docId"]);

                mc.user_name = (string)Session["UserID"];
                mc.status = DocumentStatus.DRAFT;

                UpdateData(mc);
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

        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in mc.GetType().GetProperties())
            {
                var control1 = FindControl(prop.Name + "_wrapper");
                var control2 = FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = !disabled;
                }
                if (control2 != null)
                {
                    control2.Visible = disabled;
                }
            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            mc = new MC(Request.QueryString["docId"]);

            amendReasonWraper.Visible = true;
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            LoadFormEdit(mc);
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            mc = new MC(Request.QueryString["docId"]);
            LoadFormPrint(mc);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_amend_reason.Text.Length > 3;
        }
    }
}
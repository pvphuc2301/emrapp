using EMR.Classes;
using EMR.Data.AIH.Model;
using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class MedicalCertificate : EmrPage, IEmrFormModel<McV1>
    {
        public override string form_url { get; set; } = $"OPD/{nameof(MedicalCertificate)}";
        public McV1 Model { get; set; }
        public override dynamic InitModel() => Model = new McV1(varDocID, Location, varDocIdLog);

        #region Binding Data
        public override void BindingDataFormView()
        {
            try
            {
                LoadBarCode();
                lbl_chief_complain.Text = WebHelpers.TextToHtmlTag(Model.chief_complain);
                lbl_history_present_illness.Text = WebHelpers.TextToHtmlTag(Model.history_present_illness);
                lbl_past_history.Text = WebHelpers.TextToHtmlTag(Model.past_history);
                lbl_clinical_findings.Text = WebHelpers.TextToHtmlTag(Model.clinical_findings);
                lbl_para_clinical_investigations.Text = WebHelpers.TextToHtmlTag(Model.para_clinical_investigations);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                lbl_treatment.Text = WebHelpers.TextToHtmlTag(Model.treatment);
                lbl_treatment_period.Text = WebHelpers.TextToHtmlTag(Model.treatment_period);
                lbl_recommendation.Text = WebHelpers.TextToHtmlTag(Model.recommendation);
                lbl_treatment_plan.Text = WebHelpers.TextToHtmlTag(Model.treatment_plan);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormEdit()
        {
            try
            {
                txt_amend_reason.Text = "";

                //2. Lý do đến khám
                txt_chief_complain.Value = WebHelpers.TextToHtmlTag(Model.chief_complain);
                //3. Tóm tắt bệnh sử                          
                txt_history_present_illness.Value = WebHelpers.TextToHtmlTag(Model.history_present_illness);
                //4. Tiền sử bệnh                
                txt_past_history.Value = WebHelpers.TextToHtmlTag(Model.past_history);
                //5. Đặc điểm lâm sàng
                txt_clinical_findings.Value = WebHelpers.TextToHtmlTag(Model.clinical_findings);
                //6. Cận lâm sàng được chỉ định
                txt_para_clinical_investigations.Value = WebHelpers.TextToHtmlTag(Model.para_clinical_investigations);
                //7. Chẩn đoán
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.diagnosis);
                //8. Phương pháp và thuốc điều trị
                txt_treatment.Value = WebHelpers.TextToHtmlTag(Model.treatment);
                //9. Thời gian điều trị
                txt_treatment_period.Value = WebHelpers.TextToHtmlTag(Model.treatment_period);
                //10. Lời khuyên và theo dõi
                txt_recommendation.Value = WebHelpers.TextToHtmlTag(Model.recommendation);
                //11. Lời khuyên và theo dõi
                txt_treatment_plan.Value = WebHelpers.TextToHtmlTag(Model.treatment_plan);

                //DataObj.Value = JsonConvert.SerializeObject(Model);

                Session["docid"] = Model.document_id;
                WebHelpers.AddScriptFormEdit(Page, Model, (string)Session["emp_id"], Location);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormPrint()
        {
            try
            {
                #region Patient 
                prt_vpid.Text = Patient.visible_patient_id;

                LoadBarCode();

                prt_patient_name_l.Text = $"{Patient.GetFullName(true)} ({Patient.GetTitle(true)})";
                prt_patient_name_e.Text = $"/ {Patient.GetFullName(false)} ({Patient.GetTitle(false)})";

                prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth);
                #endregion

                if (Patient.Gender == "Male" || Patient.Gender == "Nam")
                {
                    prt_male.Text = "☒";
                }
                else if (Patient.Gender == "Female" || Patient.Gender == "Nữ")
                {
                    prt_female.Text = "☒";
                }

                prt_pid.Text = Patient.visible_patient_id;
                prt_date_of_visit.Text = WebHelpers.FormatDateTime(PatientVisit.actual_visit_date_time);
                prt_chief_complain.Text = WebHelpers.TextToHtmlTag(Model.chief_complain, false);
                prt_history_present_illness.Text = WebHelpers.TextToHtmlTag(Model.history_present_illness, false);
                prt_past_history.Text = WebHelpers.TextToHtmlTag(Model.past_history, false);
                prt_clinical_findings.Text = WebHelpers.TextToHtmlTag(Model.clinical_findings, false);
                prt_para_clinical_investigations.Text = WebHelpers.TextToHtmlTag(Model.para_clinical_investigations, false);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis, false);
                prt_treatment.Text = WebHelpers.TextToHtmlTag(Model.treatment, false);
                prt_treatment_period.Text = WebHelpers.TextToHtmlTag(Model.treatment_period, false);
                prt_recommendation.Text = WebHelpers.TextToHtmlTag(Model.recommendation, false);

                prt_date.Text = WebHelpers.FormatDateTime(Model.modified_date_time, "dd-MM-yyyy", "");
                prt_signature_doctor.Text = Model.modified_name_e;
                uplPrintPage.Update();
            }
            catch(Exception ex) 
            { 
                WebHelpers.SendError(Page, ex); 
            }
        }
        public override void BindingControlToModel()
        {
            Model.chief_complain = txt_chief_complain.Value;
            Model.history_present_illness = txt_history_present_illness.Value;
            Model.past_history = txt_past_history.Value;
            Model.clinical_findings = txt_clinical_findings.Value;
            Model.para_clinical_investigations = txt_para_clinical_investigations.Value;
            Model.diagnosis = txt_diagnosis.Value;
            Model.treatment = txt_treatment.Value;
            Model.treatment_period = txt_treatment_period.Value;
            Model.recommendation = txt_recommendation.Value;
            Model.treatment_plan = txt_treatment_plan.Value;

            Model.amend_reason = txt_amend_reason.Text;
        }
        #endregion
        private void LoadBarCode()
        {
            IBarcodeGenerator barcodeGenerator = new BarcodeGenerator();
            BarCode.Controls.Clear();
            BarCode.Controls.Add(barcodeGenerator.Generator(Patient.visible_patient_id));
        }
        #region Events
        //protected void btnComplete_Click(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        MC mc = new MC(varDocID, loc);
        //        mc.status = DocumentStatus.FINAL;

        //        UpdateData(mc);
        //        WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
        //    }
        //}
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        MC mc = new MC(varDocID, loc);
        //        mc.status = DocumentStatus.DRAFT;

        //        UpdateData(mc);
        //    }
        //}
        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        dynamic result = MC.Delete((string)Session["UserID"], Request.QueryString["docid"], loc)[0];

        //        if (result.Status == System.Net.HttpStatusCode.OK)
        //        {
        //            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
        //            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}
        //protected void btnAmend_Click(object sender, EventArgs e)
        //{
        //    if(WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"])) {
        //        MC mc = new MC(Request.QueryString["docId"], loc);

        //        WebHelpers.VisibleControl(false, btnAmend, btnPrint);
        //        WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

        //        //load form control
        //        WebHelpers.LoadFormControl(form1, mc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
        //        //binding data
        //        BindingDataFormEdit(mc);
        //        //get access button
        //    }
        //}

        #endregion

        #region Validation
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_amend_reason.Text.Length > 3;
        }

        public override void PostBackEventHandler()
        {

        }
        #endregion
    }
}
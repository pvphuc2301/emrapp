using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.DBP.OPD
{
    public partial class OutPatIniNurAss : System.Web.UI.Page
    {
        Oina oina;
        PatientInfo patientInfo;
        PatientVisitInfo patientVisitInfo;
        public string PAGE_URL { get; set; }
        public string loc { get; set; }
        public string locChanged { get; set; }
        public string varDocID { get; set; }
        public string varDocIdLog { get; set; }
        public string varModelID { get; set; }
        public string varPVID { get; set; }
        public string varVPID { get; set; }
        public string varPID { get; set; }

        public string SignatureDate { get; set; }
        public string SignatureName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            PAGE_URL = $"/DBP/OPD/OutPatIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }

            PostBackEvent();
        }
        private void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    oina = new Oina(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    oina = new Oina(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Oina.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.setBmi(bmiStr, oina.vs_BMI);
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (oina.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(oina, WebHelpers.LoadFormControl(form1, oina, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }
                else if (oina.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(oina, WebHelpers.LoadFormControl(form1, oina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                BindingDataFormPrint(oina);

                //WebHelpers.getAccessButtons(form1, oina.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = oina.status,
                    AccessGroup = (string)Session["group_access"],
                    AccessAuthorize = (string)Session["access_authorize"],
                    IsSameCompanyCode = loc == locChanged,
                    IsViewLog = varDocIdLog != null
                });
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void LoadPatientInfo()
        {
            lblFirstName.Text = patientInfo.first_name_l;
            lblLastName.Text = patientInfo.last_name_l;
            lblGender.Text = patientInfo.gender_l;

            WebHelpers.ConvertDateTime(patientInfo.DOB, out bool isValid, out string DOB, "dd-MM-yyyy");
            lblDoB.Text = DOB + " (" + patientInfo.Age + "t)";

            lblPatientAddress.Text = patientInfo.Address;
            lblContactPerson.Text = patientInfo.Contact;
            lblRelationship.Text = patientInfo.Relationship;
            lblVisitCode.Text = patientVisitInfo.VisitCode;

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
        }
        private void PostBackEvent()
        {
            
        }

        #region Binding Data
        private void BindingDataForm(Oina oina, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(oina);
            }
            else
            {
                BindingDataFormView(oina);
            }
        }
        private void BindingDataFormEdit(Oina oina)
        {
            try
            {
                txt_amend_reason.Text = "";
                //I.
                txt_vs_temperature.Value = oina.vs_temperature;
                txt_vs_heart_rate.Value = oina.vs_heart_rate;
                txt_vs_weight.Value = oina.vs_weight;
                txt_vs_respiratory_rate.Value = oina.vs_respiratory_rate;
                txt_vs_height.Value = oina.vs_height;
                txt_vs_blood_pressure.Value = oina.vs_blood_pressure;
                txt_vs_bmi.Value = oina.vs_BMI;
                txt_vs_spo2.Value = oina.vs_spO2;
                txt_pulse.Value = oina.pulse;

                //II.
                //1.
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(oina.chief_complaint);
                //2.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + oina.allergy);
                if (rad_allergy_true.Checked)
                {
                    txt_allergy_note.Value = WebHelpers.TextToHtmlTag(oina.allergy_note);
                }
                //3.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_mental_status_" + oina.mental_status);
                if (rad_mental_status_true.Checked)
                {
                    txt_mental_status_note.Value = WebHelpers.TextToHtmlTag(oina.mental_status_note);
                }
                //4
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_paint_score_code_" + oina.paint_score_code);
                //5
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fall_risk_" + oina.fall_risk);
                if (rad_fall_risk_true.Checked)
                {
                    txt_fall_risk_assistance.Value = WebHelpers.TextToHtmlTag(oina.fall_risk_assistance);
                }
                //6.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_" + oina.nutrition_status_code);
                //III.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_housing_code_" + oina.housing_code, "aln");
                //IV.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_prioritization_code_" + oina.prioritization_code, "wa");

                WebHelpers.BindDateTimePicker(dtpk_assessment_date_time, oina.assessment_date_time);

                DataObj.Value = JsonConvert.SerializeObject(oina);
                Session["docid"] = oina.document_id;
                WebHelpers.AddScriptFormEdit(Page, oina, (string)Session["emp_id"], loc);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Oina oina)
        {
            try
            {
                lbl_fall_risk.Text = WebHelpers.GetBool(oina.fall_risk, $"Có, cung cấp phương tiện hỗ trợ/ Yes, provide assistance: {WebHelpers.TextToHtmlTag(oina.fall_risk_assistance)}", "Không có nguy cơ/ No risk");

                lbl_mental_status.Text = WebHelpers.GetBool(oina.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {WebHelpers.TextToHtmlTag(oina.mental_status_note)}");

                lbl_paint_score_description.Text = WebHelpers.TextToHtmlTag(oina.paint_score_description);

                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(oina.chief_complaint);

                lbl_allergy.Text = WebHelpers.GetBool(oina.allergy, $"Có, ghi rõ/ Yes, specify: {WebHelpers.TextToHtmlTag(oina.allergy_note)}");

                lbl_mental_status.Text = WebHelpers.GetBool(oina.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {WebHelpers.TextToHtmlTag(oina.mental_status_note)}");

                lbl_nutrition_status_description.Text = WebHelpers.TextToHtmlTag(oina.nutrition_status_description);

                lbl_housing_description.Text = WebHelpers.TextToHtmlTag(oina.housing_description);
                lbl_prioritization_description.Text = WebHelpers.TextToHtmlTag(oina.prioritization_description);
                //
                lbl_vs_temperature.Text = oina.vs_temperature + " °C";
                lbl_vs_heart_rate.Text = oina.vs_heart_rate + " /phút (m)";
                lbl_vs_weight.Text = oina.vs_weight + " kg";
                lbl_vs_height.Text = oina.vs_height + " cm";
                lbl_vs_respiratory_rate.Text = oina.vs_respiratory_rate + " / phút (min)";
                lbl_vs_bmi.Text = oina.vs_BMI + " (Kg/m <sup>2</sup>)";
                lbl_vs_blood_pressure.Text = oina.vs_blood_pressure + " mmHg";
                lbl_pulse.Text = oina.pulse + " cm";
                lbl_vs_spo2.Text = oina.vs_spO2 + " %";
                lbl_assessment_date_time.Text = WebHelpers.FormatDateTime(oina.assessment_date_time, "dd-MM-yyyy HH:mm");

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Oina oina)
        {
            try
            {
                prt_fullname.Text = $"{patientInfo.FullName} ({patientInfo.Title})";
                prt_DOB.Text = $"{WebHelpers.FormatDateTime(patientInfo.DOB)} | {patientInfo.Gender}";
                prt_vpid.Text = patientInfo.visible_patient_id;

                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);

                prt_vs_temperature.Text = oina.vs_temperature;
                prt_vs_weight.Text = oina.vs_weight;
                prt_vs_height.Text = oina.vs_height;
                prt_vs_BMI.Text = oina.vs_BMI;
                prt_pulse.Text = oina.vs_heart_rate;
                prt_vs_respiratory_rate.Text = oina.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = oina.vs_blood_pressure;
                prt_vs_spO2.Text = oina.vs_spO2;

                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(oina.chief_complaint);

                prt_allergy.Text = WebHelpers.GetBool(oina.allergy, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(oina.allergy_note));

                prt_mental_status.Text = WebHelpers.CreateOptions(new Option { Text = "Có/ Yes", Value = true }, new Option { Text = "Không, ghi rõ/ No, specify: " + WebHelpers.TextToHtmlTag(oina.mental_status_note), Value = false }, oina.mental_status, "display: grid; grid-template-columns: 80px 1fr");

                prt_paint_score_code.Text = oina.paint_score_code;

                prt_fall_risk.Text = WebHelpers.GetBool(oina.fall_risk, "Có, cung cấp phương tiện hỗ trợ/ Yes, provide assistance: " + WebHelpers.TextToHtmlTag(oina.fall_risk_assistance), "Không có nguy cơ/ No risk");

                prt_nutrition_status_code.Text = oina.nutrition_status_description;

                prt_housing.Text = WebHelpers.CreateOptions(Oina.HOUSING_CODE, (string)oina.housing_code, "display: grid; grid-template-columns: 1fr 1fr");

                string signature_date = WebHelpers.FormatDateTime(SignatureDate, "dd-MM-yyyy HH:mm", "");

                prt_prioritization_code.Text = WebHelpers.TextToHtmlTag(oina.prioritization_description);

                prt_signature_date.Text = "Ngày/ Date: " + signature_date;
                //prt_signature_name.Text = SignatureName;

            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Oina oina = new Oina(varDocID, loc);
                oina.status = DocumentStatus.FINAL;
                //WebHelpers.RefreshMenu(Page);
                UpdateData(oina);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Oina oina = new Oina(varDocID, loc);
                oina.status = DocumentStatus.DRAFT;
                //WebHelpers.RefreshMenu(Page);
                UpdateData(oina);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Oina.Delete((string)Session["UserId"], varDocID, loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);

                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Oina oina = new Oina(varDocID, loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, oina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(oina);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);

            Initial();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        #region METHODS

        private void UpdateData(Oina oina)
        {
            try
            {
                oina.vs_temperature = txt_vs_temperature.Value;
                oina.vs_heart_rate = txt_vs_heart_rate.Value;
                oina.vs_weight = txt_vs_weight.Value;
                oina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                oina.vs_height = txt_vs_height.Value;
                oina.vs_blood_pressure = txt_vs_blood_pressure.Value;
                oina.vs_BMI = txt_vs_bmi.Value;
                oina.vs_spO2 = txt_vs_spo2.Value;
                oina.pulse = txt_pulse.Value;
                //1.
                oina.chief_complaint = txt_chief_complaint.Value;
                //2.
                oina.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                oina.allergy_note = WebHelpers.GetBool(oina.allergy, txt_allergy_note.Value, null);
                //3.
                oina.mental_status = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_mental_status_");
                oina.mental_status_note = WebHelpers.GetBool(oina.mental_status, null, txt_mental_status_note.Value);
                //4.
                oina.paint_score_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                oina.paint_score_description = WebHelpers.GetDicDesc(oina.paint_score_code, Oina.PAINT_SCORE_CODE);
                //5.
                oina.fall_risk = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_risk_");
                oina.fall_risk_assistance = WebHelpers.GetBool(oina.fall_risk, txt_fall_risk_assistance.Value, null);

                oina.nutrition_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_", Oina.NUTRITION_STATUS_CODE);
                oina.nutrition_status_description = WebHelpers.GetDicDesc(oina.nutrition_status_code, Oina.NUTRITION_STATUS_CODE);

                oina.housing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_housing_code_", Oina.HOUSING_CODE);
                oina.housing_description = WebHelpers.GetDicDesc(oina.housing_code, Oina.HOUSING_CODE);

                oina.prioritization_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", Oina.PRIORITIZATION_CODE);
                oina.prioritization_description = WebHelpers.GetDicDesc(oina.prioritization_code, Oina.PRIORITIZATION_CODE);

                oina.assessment_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assessment_date_time.SelectedDate);

                if (JsonConvert.SerializeObject(oina) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                //
                oina.amend_reason = txt_amend_reason.Text;
                oina.user_name = (string)Session["UserID"];

                dynamic result = oina.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.MESSAGE_SAVE_SUCCESS);
                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = PAGE_URL + $"&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }

        #endregion

        #region Validation
        protected void CustomValidatorAllergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_allergy_note.Value.Length <= 256;
        }
        protected void CustomValidatorMentalStatusNote_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_mental_status_note.Value.Length <= 256;
        }
        protected void CustomValidatorFallRiskAssistance_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_fall_risk_assistance.Value.Length <= 256;
        }

        protected void CustomValidatorMentalStatus_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_mental_status_true.Checked || rad_mental_status_false.Checked;
        }

        protected void CustomValidatorFallRisk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_fall_risk_true.Checked || rad_fall_risk_false.Checked;
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
    }
}
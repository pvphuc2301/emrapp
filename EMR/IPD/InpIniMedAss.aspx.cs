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
    public partial class InpIniMedAss : Page
    {
        Iima iima;
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
            if(!WebHelpers.CheckSession(this)) return;

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            PAGE_URL = $"/IPD/InpIniMedAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Iima iima, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(iima);
            }
            else
            {
                BindingDataFormView(iima);
            }
        }
        private void BindingDataFormEdit(Iima iima)
        {
            try
            {
                txt_amend_reason.Text = "";
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(iima.chief_complaint);
                txt_cur_med_history.Value = WebHelpers.TextToHtmlTag(iima.cur_med_history);
                txt_cur_medication.Value = WebHelpers.TextToHtmlTag(iima.cur_medication);
                txt_personal.Value = WebHelpers.TextToHtmlTag(iima.personal);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_smoking_" + iima.habits_smoking);
                txt_habits_smoking_pack.Value = iima.habits_smoking_pack;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_alcohol_" + iima.habits_alcohol);
                txt_habits_alcohol_note.Value = WebHelpers.TextToHtmlTag(iima.habits_alcohol_note);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_drugs_" + iima.habits_drugs);
                txt_habits_drugs_note.Value = WebHelpers.TextToHtmlTag(iima.habits_drugs_note);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_habits_physical_exercise_" + iima.habits_physical_exercise);
                txt_habits_phy_exer_note.Value = WebHelpers.TextToHtmlTag(iima.habits_phy_exer_note);

                txt_habits_other.Value = WebHelpers.TextToHtmlTag(iima.habits_other);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_allergy_" + iima.allergy);
                txt_allergy_note.Value = WebHelpers.TextToHtmlTag(iima.allergy_note);

                txt_family.Value = WebHelpers.TextToHtmlTag(iima.family);
                txt_immunization.Value = WebHelpers.TextToHtmlTag(iima.immunization);
                vs_temperature.Text = iima.vs_temperature;
                vs_heart_rate.Text = iima.vs_heart_rate;
                vs_weight.Text = iima.vs_weight;
                vs_height.Text = iima.vs_height;
                vs_respiratory_rate.Text = iima.vs_respiratory_rate;
                vs_bmi.Text = iima.vs_BMI;
                vs_blood_pressure.Text = iima.vs_blood_pressure;
                vs_spo2.Text = iima.vs_spO2;
                vs_pulse.Text = iima.vs_pulse;
                txt_physical_exam.Value = WebHelpers.TextToHtmlTag(iima.physical_exam);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), $"rad_psy_consul_required_" + iima.psy_consul_required);
                
                txt_laboratory_result.Value = WebHelpers.TextToHtmlTag(iima.laboratory_result);
                txt_add_investigation.Value = WebHelpers.TextToHtmlTag(iima.add_investigation);
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(iima.initial_diagnosis);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(iima.diagnosis);
                txt_diff_diagnosis.Value = WebHelpers.TextToHtmlTag(iima.diff_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(iima.associated_conditions);
                txt_treatment_plan.Value = WebHelpers.TextToHtmlTag(iima.treatment_plan);
                txt_discharge_plan.Value = WebHelpers.TextToHtmlTag(iima.discharge_plan);
                WebHelpers.VisibleControl(true, btnUpdateVitalSign);

                //DataObj.Value = JsonConvert.SerializeObject(iima);
                //Session["docid"] = iima.document_id;
                WebHelpers.AddScriptFormEdit(Page, iima, (string)Session["emp_id"], loc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Iima iima)
        {
            try
            {
                //I
                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(iima.chief_complaint);
                //II
                //1
                lbl_cur_med_history.Text = WebHelpers.TextToHtmlTag(iima.cur_med_history);
                lbl_cur_medication.Text = WebHelpers.TextToHtmlTag(iima.cur_medication);
                //2
                lbl_personal.Text = WebHelpers.TextToHtmlTag(iima.personal);
                lbl_habits_smoking.Text = WebHelpers.GetBool(iima.habits_smoking, $"Có, ghi số gói trong năm/ Yes, specify pack years: {iima.habits_smoking_pack}");
                lbl_habits_alcohol.Text = WebHelpers.GetBool(iima.habits_alcohol, $"Có, ghi rõ/ Yes, specify {iima.habits_alcohol_note}");
                lbl_habits_drugs.Text = WebHelpers.GetBool(iima.habits_drugs, $"Có, ghi rõ/ Yes, specify {iima.habits_drugs_note}");
                lbl_habits_physical_exercise.Text = WebHelpers.GetBool(iima.habits_physical_exercise, $"Có, ghi rõ/ Yes, specify {iima.habits_phy_exer_note}");
                lbl_habits_other.Text = WebHelpers.TextToHtmlTag(iima.habits_other);
                lbl_allergy.Text = WebHelpers.GetBool(iima.allergy, $"Có, ghi rõ/ Yes, specify: {iima.allergy_note}");
                lbl_family.Text = WebHelpers.TextToHtmlTag(iima.family);
                lbl_immunization.Text = WebHelpers.TextToHtmlTag(iima.immunization);
                //
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);
                vs_temperature.Text = iima.vs_temperature;
                vs_heart_rate.Text = iima.vs_heart_rate;
                vs_weight.Text = iima.vs_weight;
                vs_respiratory_rate.Text = iima.vs_respiratory_rate;
                vs_height.Text = iima.vs_height;
                vs_blood_pressure.Text = iima.vs_blood_pressure;
                vs_bmi.Text = iima.vs_BMI;
                vs_spo2.Text = iima.vs_spO2;
                vs_pulse.Text = iima.vs_pulse;
                lbl_physical_exam.Text = WebHelpers.TextToHtmlTag(iima.physical_exam);
                lbl_psy_consul_required.Text = WebHelpers.GetBool(iima.psy_consul_required);
                //IV
                lbl_laboratory_result.Text = WebHelpers.TextToHtmlTag(iima.laboratory_result);
                lbl_add_investigation.Text = WebHelpers.TextToHtmlTag(iima.add_investigation);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(iima.initial_diagnosis);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(iima.diagnosis);
                lbl_diff_diagnosis.Text = WebHelpers.TextToHtmlTag(iima.diff_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(iima.associated_conditions);
                lbl_treatment_plan.Text = WebHelpers.TextToHtmlTag(iima.treatment_plan);
                lbl_discharge_plan.Text = WebHelpers.TextToHtmlTag(iima.discharge_plan);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(Iima iima)
        {
            try
            {
                //prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth) + " | " + patientInfo.Gender;
                //prt_vpid.Text = patientInfo.visible_patient_id;
                //WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                //prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(iima.chief_complaint);
                //prt_cur_med_history.Text = WebHelpers.TextToHtmlTag(iima.cur_med_history);
                //prt_cur_medication.Text = WebHelpers.TextToHtmlTag(iima.cur_medication);
                //prt_personal.Text = WebHelpers.TextToHtmlTag(iima.personal);
                //if (iima.habits_smoking != null)
                //{
                //    if (iima.habits_smoking = true)
                //    {
                //        prt_habits_smoking_True.Text = "☒";
                //        prt_habits_smoking_False.Text = "❏";
                //    }
                //    if (iima.habits_smoking = false)
                //    {
                //        prt_habits_smoking_True.Text = "❏";
                //        prt_habits_smoking_False.Text = "☒";
                //    }
                //}
                //if (iima.habits_smoking == null)
                //{
                //    prt_habits_smoking_True.Text = "❏";
                //    prt_habits_smoking_False.Text = "❏";
                //}
                //lbl_habits_smoking_pack.Text = iima.habits_smoking_pack;
                //if (iima.habits_alcohol != null)
                //{
                //    if (iima.habits_alcohol = true)
                //    {
                //        prt_habits_alcohol_True.Text = "☒";
                //        prt_habits_alcohol_False.Text = "❏";
                //    }
                //    if (iima.habits_alcohol = false)
                //    {
                //        prt_habits_alcohol_True.Text = "❏";
                //        prt_habits_alcohol_False.Text = "☒";
                //    }
                //}
                //if (iima.habits_alcohol == null)
                //{
                //    prt_habits_alcohol_True.Text = "❏";
                //    prt_habits_alcohol_False.Text = "❏";
                //}
                //prt_habits_alcohol_note.Text = iima.habits_alcohol_note;
                //if (iima.habits_drugs != null)
                //{
                //    if (iima.habits_drugs = true)
                //    {
                //        prt_habits_drugs_True.Text = "☒";
                //        prt_habits_drugs_False.Text = "❏";
                //    }
                //    if (iima.habits_drugs = false)
                //    {
                //        prt_habits_drugs_True.Text = "❏";
                //        prt_habits_drugs_False.Text = "☒";
                //    }
                //}
                //if (iima.habits_drugs == null)
                //{
                //    prt_habits_drugs_True.Text = "❏";
                //    prt_habits_drugs_False.Text = "❏";
                //}
                //prt_habits_drugs_note.Text = iima.habits_drugs_note;
                //if (iima.habits_physical_exercise != null)
                //{
                //    if (iima.habits_physical_exercise = true)
                //    {
                //        prt_habits_physical_exercise_True.Text = "☒";
                //        prt_habits_physical_exercise_False.Text = "❏";
                //    }
                //    if (iima.habits_drugs = false)
                //    {
                //        prt_habits_physical_exercise_True.Text = "❏";
                //        prt_habits_physical_exercise_False.Text = "☒";
                //    }
                //}
                //if (iima.habits_drugs == null)
                //{
                //    prt_habits_physical_exercise_True.Text = "❏";
                //    prt_habits_physical_exercise_False.Text = "❏";
                //}
                //prt_habits_phy_exer_note.Text = iima.habits_phy_exer_note;
                //prt_habits_other.Text = iima.habits_other;
                //if (iima.allergy != null)
                //{
                //    if (iima.allergy = true)
                //    {
                //        prt_allergy_True.Text = "☒";
                //        prt_allergy_False.Text = "❏";
                //    }
                //    if (iima.allergy = false)
                //    {
                //        prt_allergy_True.Text = "❏";
                //        prt_allergy_False.Text = "☒";
                //    }
                //}
                //if (iima.allergy == null)
                //{
                //    prt_allergy_True.Text = "❏";
                //    prt_allergy_False.Text = "❏";
                //}
                //prt_allergy_note.Text = WebHelpers.TextToHtmlTag(iima.allergy_note);
                //prt_family.Text = WebHelpers.TextToHtmlTag(iima.family);
                //prt_immunization.Text = WebHelpers.TextToHtmlTag(iima.immunization);
                //prt_vs_temperature.Text = iima.vs_temperature;
                //prt_vs_heart_rate.Text = iima.vs_heart_rate;
                //prt_vs_weight.Text = iima.vs_weight;
                //prt_vs_height.Text = iima.vs_height;
                //prt_vs_respiratory_rate.Text = iima.vs_respiratory_rate;
                //prt_vs_BMI.Text = iima.vs_BMI;
                //prt_vs_blood_pressure.Text = iima.vs_blood_pressure;
                //prt_vs_spO2.Text = iima.vs_spO2;
                ////prt_vs_pulse.Text = iima.vs_pulse;
                //prt_physical_exam.Text = WebHelpers.TextToHtmlTag(iima.physical_exam);
                //if (iima.psy_consul_required != null)
                //{
                //    if (iima.psy_consul_required = true)
                //    {
                //        prt_psy_consul_required_True.Text = "☒";
                //        prt_psy_consul_required_False.Text = "❏";
                //    }
                //    if (iima.psy_consul_required = false)
                //    {
                //        prt_psy_consul_required_True.Text = "❏";
                //        prt_psy_consul_required_False.Text = "☒";
                //    }
                //}
                //if (iima.psy_consul_required == null)
                //{
                //    prt_psy_consul_required_True.Text = "❏";
                //    prt_psy_consul_required_False.Text = "❏";
                //}

                //prt_laboratory_result.Text = WebHelpers.TextToHtmlTag(iima.laboratory_result);
                ////prt_add_investigation.Text = iima.add_investigation;
                //prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(iima.initial_diagnosis);
                ////prt_diagnosis.Text = iima.diagnosis;
                //prt_diff_diagnosis.Text = WebHelpers.TextToHtmlTag(iima.diff_diagnosis);
                //prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(iima.associated_conditions);
                //prt_treatment_plan.Text = WebHelpers.TextToHtmlTag(iima.treatment_plan);
                //prt_discharge_plan.Text = WebHelpers.TextToHtmlTag(iima.discharge_plan);

            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Iima iima = new Iima(varDocID, loc);
                iima.status = DocumentStatus.FINAL;
                
                UpdateData(iima);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Iima iima = new Iima(varDocID, loc);
                iima.status = DocumentStatus.DRAFT;

                UpdateData(iima);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Iima.Delete((string)Session["UserId"], varDocID, loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);

                    Response.Redirect($"index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            try
            {
                if (WebHelpers.CanOpenForm(Page, (string)varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
                {
                    Iima iima = new Iima(varDocID, loc);

                    WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                    WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                    //load form control
                    WebHelpers.LoadFormControl(form1, iima, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                    //binding data
                    BindingDataFormEdit(iima);
                    //get access button
                }
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
            Initial();
        }
        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            try
            {
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);
                dynamic response = VitalSign.Update(patientVisitInfo.patient_visit_id, patientVisitInfo.visit_type, loc);
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic vs = JsonConvert.DeserializeObject(response.Data);
LoadVitalSigns(vs);
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        public void LoadVitalSigns(dynamic vs)
        {
            vs_temperature.Text = WebHelpers.FormatString(vs.vs_temperature);
            vs_heart_rate.Text = WebHelpers.FormatString(vs.vs_heart_rate);
            vs_weight.Text = WebHelpers.FormatString(vs.vs_weight);
            vs_respiratory_rate.Text = WebHelpers.FormatString(vs.vs_respiratory_rate);
            vs_height.Text = WebHelpers.FormatString(vs.vs_height);
            vs_bmi.Text = WebHelpers.FormatString(vs.vs_BMI);
            vs_blood_pressure.Text = WebHelpers.FormatString(vs.vs_blood_pressure);
            vs_spo2.Text = WebHelpers.FormatString(vs.vs_spO2);
            vs_pulse.Text = WebHelpers.FormatString(vs.pulse);
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region METHOD
        public void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    iima = new Iima(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    iima = new Iima(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                //loadRadGridHistoryLog();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Iima.Logs(varDocID, loc), out string SignatureDate, out string SignatureName);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (iima.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(iima, WebHelpers.LoadFormControl(form1, iima, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    lblPid.Text = varVPID;
                    BindingDataFormPrint(iima);
                }
                else if (iima.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(iima, WebHelpers.LoadFormControl(form1, iima, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, iima.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
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

            lblVisitCode.Text = patientVisitInfo.VisitCode;

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
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

                string url = $"/IPD/InpIniMedAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&loc={loc}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/InpIniMedAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";
            Response.Redirect(url);
        }
        public void UpdateData(Iima iima)
        {
            try { 

                iima.chief_complaint = txt_chief_complaint.Value;
                iima.cur_med_history = txt_cur_med_history.Value;
                iima.cur_medication = txt_cur_medication.Value;
                iima.personal = txt_personal.Value;

                iima.habits_smoking = WebHelpers.getRadioButton(form1, "rad_habits_smoking_");
                iima.habits_smoking_pack = txt_habits_smoking_pack.Value;

                iima.habits_alcohol = WebHelpers.getRadioButton(form1, "rad_habits_alcohol_");
                iima.habits_alcohol_note = txt_habits_alcohol_note.Value;

                iima.habits_drugs = WebHelpers.getRadioButton(form1, "rad_habits_drugs_");
                iima.habits_drugs_note = txt_habits_drugs_note.Value;

                iima.habits_physical_exercise = WebHelpers.getRadioButton(form1, "rad_habits_physical_exercise_");
                iima.habits_phy_exer_note = txt_habits_phy_exer_note.Value;

                iima.habits_other = txt_habits_other.Value;

                iima.allergy = WebHelpers.getRadioButton(form1, "rad_allergy_");
                iima.allergy_note = txt_allergy_note.Value;

                iima.family = txt_family.Value;
                iima.immunization = txt_immunization.Value;
                iima.vs_temperature = vs_temperature.Text;
                iima.vs_heart_rate = vs_heart_rate.Text;
                iima.vs_weight = vs_weight.Text;
                iima.vs_height = vs_height.Text;
                iima.vs_respiratory_rate = vs_respiratory_rate.Text;
                iima.vs_BMI = vs_bmi.Text;
                iima.vs_blood_pressure = vs_blood_pressure.Text;
                iima.vs_spO2 = vs_spo2.Text;
                iima.vs_pulse = vs_pulse.Text;
                iima.physical_exam = txt_physical_exam.Value;

                iima.psy_consul_required = WebHelpers.getRadioButton(form1, "rad_psy_consul_required_");

                iima.laboratory_result = txt_laboratory_result.Value;
                iima.add_investigation = txt_add_investigation.Value;
                iima.initial_diagnosis = txt_initial_diagnosis.Value;
                iima.diagnosis = txt_diagnosis.Value;
                iima.diff_diagnosis = txt_diff_diagnosis.Value;
                iima.associated_conditions = txt_associated_conditions.Value;
                iima.treatment_plan = txt_treatment_plan.Value;
                iima.discharge_plan = txt_discharge_plan.Value;

                if (JsonConvert.SerializeObject(iima) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                iima.user_name = (string)Session["UserID"];
                iima.amend_reason = txt_amend_reason.Text;

                dynamic result = iima.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                    
                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);

        }
    }
}
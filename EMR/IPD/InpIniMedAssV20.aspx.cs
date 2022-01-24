using EMR.Classes;
using Newtonsoft.Json;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.IPD
{
    public partial class InpIniMedAssV20 : System.Web.UI.Page
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
            if (!WebHelpers.CheckSession(this)) return;

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            string url = Request.RawUrl.Split('.')[0];
            var urlArr = url.Split('/');
            url = urlArr[urlArr.Length - 1];

            //PAGE_URL = $"/ER/{url}.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            PAGE_URL = $"/IPD/{url}.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
                SetDefaultValue();
            }
        }

        private void SetDefaultValue()
        {
            if (RadGrid1.Items.Count <= 1)
            {
                rad_infected_with_covid_false.Checked = true;
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
                btnVSFreeText.Visible = true;
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = false;

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

                txt_vs_temperature.Disabled
                 = txt_vs_weight.Disabled
                 = txt_vs_height.Disabled
                 = txt_vs_bmi.Disabled
                 = txt_vs_pulse.Disabled
                 = txt_vs_heart_rate.Disabled
                 = txt_vs_respiratory_rate.Disabled
                 = txt_vs_blood_pressure.Disabled
                 = txt_vs_spO2.Disabled
                 = !cbVSFreeText.Checked;

                txt_vs_temperature.Value = iima.vs_temperature;
                txt_vs_heart_rate.Value = iima.vs_heart_rate;
                txt_vs_weight.Value = iima.vs_weight;
                txt_vs_height.Value = iima.vs_height;
                txt_vs_respiratory_rate.Value = iima.vs_respiratory_rate;
                txt_vs_bmi.Value = iima.vs_BMI;
                txt_vs_blood_pressure.Value = iima.vs_blood_pressure;
                txt_vs_spO2.Value = iima.vs_spO2;
                txt_vs_pulse.Value = iima.vs_pulse;
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

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_" + iima.infected_with_covid);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + iima.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + iima.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + iima.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + iima.not_yet_vaccinations);

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
                btnVSFreeText.Visible = false;
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = true;
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

                lbl_vs_temperature.Text = iima.vs_temperature + " °C";
                lbl_vs_heart_rate.Text = iima.vs_heart_rate + " /phút (m)";
                lbl_vs_weight.Text = iima.vs_weight + " Kg";
                lbl_vs_respiratory_rate.Text = iima.vs_respiratory_rate + " /phút (m)";
                lbl_vs_height.Text = iima.vs_height + " cm";
                lbl_vs_blood_pressure.Text = iima.vs_blood_pressure + " mmHg";
                lbl_vs_BMI.Text = iima.vs_BMI + " (Kg/m 2)";
                lbl_vs_spO2.Text = iima.vs_spO2 + " %";
                lbl_vs_pulse.Text = iima.vs_pulse + " cm";
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

                lbl_infected_with_covid.Text = WebHelpers.FormatString(WebHelpers.GetBool(iima.infected_with_covid));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + iima.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + iima.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + iima.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + iima.not_yet_vaccinations);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(Iima iima)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_fullname.InnerText = string.Format("{0} - {1}", patientInfo.FullName, patientInfo.Gender);

                prt_DOB.InnerText = "DOB: " + WebHelpers.FormatDateTime(patientInfo.DOB, "dd-MM-yyyy", "");

                prt_vpid.InnerText = string.Format("{0} - {1} - {2}", patientInfo.visible_patient_id, patientVisitInfo.visit_type, patientVisitInfo.visit_code);

                //I
                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(iima.chief_complaint);
                //II
                //1
                prt_cur_med_history.Text = WebHelpers.TextToHtmlTag(iima.cur_med_history);
                prt_cur_medication.Text = WebHelpers.TextToHtmlTag(iima.cur_medication);

                //2
                prt_personal.Text = WebHelpers.TextToHtmlTag(iima.personal);
                //Habits
                prt_habits_smoking.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\">No</span>", Value = false }, new Option { Text = "Có, ghi số gói trong năm/ <span class=\"text-primary\">Yes, specify pack years</span> " + WebHelpers.GetBool(iima.habits_smoking, iima.habits_smoking_pack, ""), Value = true }, iima.habits_smoking, "display: grid; grid-template-columns:90px auto;");

                prt_habits_alcohol.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\">No</span>", Value = false }, new Option { Text = "Có, ghi rõ/ <span class=\"text-primary\">Yes, specify</span> " + WebHelpers.GetBool(iima.habits_alcohol, iima.habits_alcohol_note, ""), Value = true }, iima.habits_alcohol, "display: grid; grid-template-columns:90px auto;");

                prt_habits_drugs.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\">No</span>", Value = false }, new Option { Text = "Có, ghi rõ/ <span class=\"text-primary\">Yes, specify</span> " + WebHelpers.GetBool(iima.habits_drugs, iima.habits_drugs_note, ""), Value = true }, iima.habits_drugs, "display: grid; grid-template-columns:90px auto;");

                prt_habits_physical_exercise.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\">No</span>", Value = false }, new Option { Text = "Có, ghi rõ/ <span class=\"text-primary\">Yes, specify</span> " + WebHelpers.GetBool(iima.habits_physical_exercise, iima.habits_phy_exer_note, ""), Value = true }, iima.habits_physical_exercise, "display: grid; grid-template-columns:90px auto;");

                prt_habits_other.Text = "Khác/ Other, Ghi rõ/ Specify: " + iima.habits_other;

                prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"text-primary\">No</span>", Value = false }, new Option { Text = "Có, ghi rõ/ <span class=\"text-primary\">Yes, specify</span> " + WebHelpers.GetBool(iima.allergy, iima.allergy_note, ""), Value = true }, iima.allergy, "display: grid; grid-template-columns:90px auto;");
                //
                prt_family.Text = WebHelpers.TextToHtmlTag(iima.family);

                prt_immunization.Text = WebHelpers.TextToHtmlTag(iima.immunization);

                //III
                prt_vs_temperature.Text = iima.vs_temperature;
                prt_vs_heart_rate.Text = iima.vs_heart_rate;
                prt_vs_weight.Text = iima.vs_weight;
                prt_vs_height.Text = iima.vs_height;
                prt_vs_respiratory_rate.Text = iima.vs_respiratory_rate;
                prt_vs_BMI.Text = iima.vs_BMI;
                prt_vs_blood_pressure.Text = iima.vs_blood_pressure;
                prt_vs_spO2.Text = iima.vs_spO2;
                //prt_vs_pulse.Text = iima.vs_pulse;
                prt_physical_exam.Text = WebHelpers.TextToHtmlTag(iima.physical_exam);

                prt_psy_consul_required.Text = WebHelpers.CreateOptions(new Option { Text = "No/ <span class=\"text-primary\">Không</span>", Value = false }, new Option { Text = "Yes/ <span class=\"text-primary\">Có</span>", Value = true }, iima.psy_consul_required, "display: grid; grid-template-columns:90px auto;");

                //IV.
                prt_laboratory_result.Text = WebHelpers.TextToHtmlTag(iima.laboratory_result);
                prt_add_investigation.Text = iima.add_investigation;
                //V.
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(iima.initial_diagnosis);
                prt_diff_diagnosis.Text = WebHelpers.TextToHtmlTag(iima.diff_diagnosis);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(iima.associated_conditions);
                prt_treatment_plan.Text = WebHelpers.TextToHtmlTag(iima.treatment_plan);
                prt_discharge_plan.Text = WebHelpers.TextToHtmlTag(iima.discharge_plan);
                //prt_diagnosis.Text = iima.diagnosis;

                prt_infected_with_covid_false.Text
                    = prt_infected_with_covid_true.Text
                    = prt_received_1_dose_true.Text
                    = prt_received_2_dose_true.Text
                    = prt_received_additional_true.Text
                    = prt_not_yet_vaccinations_true.Text
                    = "❏";

                Label infected_with_covid = FindControl("prt_infected_with_covid_" + iima.infected_with_covid);
                if (infected_with_covid != null) infected_with_covid.Text = "☒";

                Label received_1_dose = FindControl("prt_received_1_dose_" + iima.received_1_dose);
                if (received_1_dose != null) received_1_dose.Text = "☒";

                Label received_2_dose = FindControl("prt_received_2_dose_" + iima.received_2_dose);
                if (received_2_dose != null) received_2_dose.Text = "☒";

                Label received_additional = FindControl("prt_received_additional_" + iima.received_additional);
                if (received_additional != null) received_additional.Text = "☒";

                Label not_yet_vaccinations = FindControl("prt_not_yet_vaccinations_" + iima.not_yet_vaccinations);
                if (not_yet_vaccinations != null) not_yet_vaccinations.Text = "☒";

                prt_immunization.Text = "- Tiêm vắc xin khác (ghi rõ)/ <span class=\"text-primary\">Other vaccinations (specify)</span>: " + iima.immunization;

                prt_signature_date.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
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
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

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
            txt_vs_temperature.Value = WebHelpers.FormatString(vs.vs_temperature);
            txt_vs_heart_rate.Value = WebHelpers.FormatString(vs.vs_heart_rate);
            txt_vs_weight.Value = WebHelpers.FormatString(vs.vs_weight);
            txt_vs_respiratory_rate.Value = WebHelpers.FormatString(vs.vs_respiratory_rate);
            txt_vs_height.Value = WebHelpers.FormatString(vs.vs_height);
            txt_vs_bmi.Value = WebHelpers.FormatString(vs.vs_BMI);
            txt_vs_blood_pressure.Value = WebHelpers.FormatString(vs.vs_blood_pressure);
            txt_vs_spO2.Value = WebHelpers.FormatString(vs.vs_spO2);
            txt_vs_pulse.Value = WebHelpers.FormatString(vs.pulse);
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

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Iima.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (iima.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(iima, WebHelpers.LoadFormControl(form1, iima, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    lblPid.Text = varVPID;
                }
                else if (iima.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(iima, WebHelpers.LoadFormControl(form1, iima, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, iima.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = iima.status,
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
            try
            {

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
                //iima.vs_temperature = vs_temperature.Text;
                //iima.vs_heart_rate = vs_heart_rate.Text;
                //iima.vs_weight = vs_weight.Text;
                //iima.vs_height = vs_height.Text;
                //iima.vs_respiratory_rate = vs_respiratory_rate.Text;
                //iima.vs_BMI = vs_bmi.Text;
                //iima.vs_blood_pressure = vs_blood_pressure.Text;
                //iima.vs_spO2 = vs_spo2.Text;
                //iima.vs_pulse = vs_pulse.Text;

                iima.vs_temperature = txt_vs_temperature.Value;
                iima.vs_heart_rate = txt_vs_heart_rate.Value;
                iima.vs_weight = txt_vs_weight.Value;
                iima.vs_height = txt_vs_height.Value;
                iima.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                iima.vs_BMI = txt_vs_bmi.Value;
                iima.vs_blood_pressure = txt_vs_blood_pressure.Value;
                iima.vs_spO2 = txt_vs_spO2.Value;
                iima.vs_pulse = txt_vs_pulse.Value;

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

                iima.infected_with_covid = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_");
                iima.received_1_dose = cb_received_1_dose_true.Checked;
                iima.received_2_dose = cb_received_2_dose_true.Checked;
                iima.received_additional = cb_received_additional_true.Checked;
                iima.immunization = txt_immunization.Value;
                iima.not_yet_vaccinations = cb_not_yet_vaccinations_true.Checked;

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

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            iima = new Iima(varDocID, loc);
            patientInfo = new PatientInfo(varPID);
            patientVisitInfo = new PatientVisitInfo(varPVID, loc);
            BindingDataFormPrint(iima);
            WebHelpers.AddJS(Page, "btnPrint_Click()");
        }

        protected void btnVSFreeText_Click(object sender, EventArgs e)
        {
            cbVSFreeText.Checked = !cbVSFreeText.Checked;
            txt_vs_temperature.Disabled
                 = txt_vs_weight.Disabled
                 = txt_vs_height.Disabled
                 //= txt_vs_bmi.Disabled
                 = txt_vs_pulse.Disabled
                 = txt_vs_heart_rate.Disabled
                 = txt_vs_respiratory_rate.Disabled
                 = txt_vs_blood_pressure.Disabled
                 = txt_vs_spO2.Disabled
                 = !cbVSFreeText.Checked;
        }
    }
}
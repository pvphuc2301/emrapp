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
    public partial class OutPatMedRec : System.Web.UI.Page
    {
        Omr omr;
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
            loc = Request.QueryString["loc"];

            PAGE_URL = $"/OPD/OutPatMedRec.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }

            PostBackEventHandler();
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
        private void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "rad_treatment_code_change":
                    rad_treatment_code_change((string)Request["__EVENTARGUMENT"]);
                    break;

            }
        }

        private void rad_treatment_code_change(string code)
        {
            if (code == null) { code = "opd"; }
            switch (code.ToUpper())
            {
                case "OPD":
                    WebHelpers.VisibleControl(true, current_medication_field);
                    break;
                default:
                    WebHelpers.VisibleControl(false, current_medication_field);
                    break;
            }
        }

        #region Binding Data
        private void BindingDataForm(Omr omr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(omr);
            }
            else
            {
                BindingDataFormView(omr);
            }
        }
        private void BindingDataFormEdit(Omr omr)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                txt_amend_reason.Text = "";

                if (DataHelpers.CalculateAge(patientInfo.date_of_birth) >= 18)
                {
                    habits_field.Visible = true;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_smoking_" + omr.habits_smoking);

                    txt_habits_smoking_pack.Value = WebHelpers.GetBool(omr.habits_smoking, omr.habits_smoking_pack, "");

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_alcohol_" + omr.habits_alcohol);

                    txt_habits_alcohol_note.Value = WebHelpers.GetBool(omr.habits_alcohol, WebHelpers.TextToHtmlTag(omr.habits_alcohol_note), "");
                        

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_drugs_" + omr.habits_drugs);

                    txt_habits_drugs_note.Value = WebHelpers.GetBool(omr.habits_drugs, WebHelpers.TextToHtmlTag(omr.habits_drugs_note), "");

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_physical_exercise_" + omr.habits_physical_exercise);

                    txt_habits_phy_exer_note.Value = WebHelpers.GetBool(omr.habits_physical_exercise, WebHelpers.TextToHtmlTag(omr.habits_phy_exer_note),"");

                    txt_habits_other.Value = WebHelpers.TextToHtmlTag(omr.habits_other);
                }
                else
                {
                    habits_field.Visible = false;
                }

                // I. Lý do đến khám/ Chief complaint:
                txt_chief_complain.Value = WebHelpers.TextToHtmlTag(omr.chief_complain);

                // II. Bệnh sử/ Medical History:
                // 1.Bệnh sử hiện tại / Current Medical History:
                txt_medical_history.Value = WebHelpers.TextToHtmlTag(omr.medical_history);

                txt_current_medication.Value = WebHelpers.TextToHtmlTag(omr.current_medication);

                // 2.Tiền sử bệnh/ Antecedent Medical History:
                txt_personal.Value = WebHelpers.TextToHtmlTag(omr.personal);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + omr.allergy);
                
                txt_allergy_note.Value = WebHelpers.GetBool(omr.allergy, WebHelpers.TextToHtmlTag(omr.allergy_note), "");

                txt_family.Value = WebHelpers.TextToHtmlTag(omr.family);
                txt_immunization.Value = WebHelpers.TextToHtmlTag(omr.immunization);

                // III.Khám bệnh/ Physical Examination:
                // DẤU HIỆU SINH TỒN/ VITAL SIGNS:

                txt_physical_examination.Value = WebHelpers.TextToHtmlTag(omr.physical_examination);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_psy_consult_required_" + omr.psy_consult_required, "false");

                WebHelpers.VisibleControl(true, btnUpdateVitalSign);

                vs_temperature.Text = omr.vs_temperature;
                vs_heart_rate.Text = omr.vs_heart_rate;
                vs_weight.Text = omr.vs_weight;
                vs_respiratory_rate.Text = omr.vs_respiratory_rate;
                vs_height.Text = omr.vs_height;
                vs_blood_pressure.Text = omr.vs_blood_pressure;
                vs_bmi.Text = omr.vs_BMI;
                vs_spo2.Text = omr.vs_spO2;
                vs_pulse.Text = omr.vs_pulse;

                txt_laboratory_indications_results.Value = WebHelpers.TextToHtmlTag(omr.laboratory_indications_results);
                txt_additional_investigation.Value = WebHelpers.TextToHtmlTag(omr.additional_investigation);
                // V.Kết luận/ Conclusion:
                //txtDiagnosis.Text = omr1.diagnosis;
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(omr.initial_diagnosis);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(omr.diagnosis);
                txt_differential_diagnosis.Value = WebHelpers.TextToHtmlTag(omr.differential_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(omr.associated_conditions);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + omr.treatment_code, "opd");
                
                // 5.Current medications
                rad_treatment_code_change(omr.treatment_code);
                txt_medicine.Value = WebHelpers.TextToHtmlTag(omr.medicine);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_" + omr.spec_opinion_requested, "false");
                txt_spec_opinion_requested_note.Value = WebHelpers.GetBool(omr.spec_opinion_requested, WebHelpers.TextToHtmlTag(omr.spec_opinion_requested_note), "");

                txt_specific_education_required.Value = WebHelpers.TextToHtmlTag(omr.specific_education_required);
                txt_next_appointment.Value = WebHelpers.TextToHtmlTag(omr.next_appointment);

                DataObj.Value = JsonConvert.SerializeObject(omr);

                Session["docid"] = omr.document_id;
                WebHelpers.AddScriptFormEdit(Page, omr, (string)Session["emp_id"], loc);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }

        private void BindingDataFormView(Omr omr)
        {
            try
            {
                //1
                lbl_chief_complain.Text = WebHelpers.TextToHtmlTag(omr.chief_complain);
                lbl_current_medication.Text = WebHelpers.TextToHtmlTag(omr.current_medication);
                //2
                lbl_personal.Text = WebHelpers.TextToHtmlTag(omr.personal);
                if (DataHelpers.CalculateAge(patientInfo.date_of_birth) >= 18)
                {
                    habits_field.Visible = true;

                    lbl_habits_smoking.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(omr.habits_smoking, "Có, ghi số gói trong năm/ Yes, specify pack years: " + omr.habits_smoking_pack));

                    lbl_habits_alcohol.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(omr.habits_alcohol, "Có, ghi rõ/ Yes, specify: " + omr.habits_alcohol_note));

                    lbl_habits_drugs.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(omr.habits_drugs, "Có, ghi rõ/ Yes, specify: " + omr.habits_drugs_note));

                    lbl_habits_physical_exercise.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(omr.habits_physical_exercise, "Có, ghi rõ/ Yes, specify: " + omr.habits_phy_exer_note));

                    lbl_habits_other.Text = WebHelpers.GetValue(omr.habits_other);
                }
                else
                {
                    habits_field.Visible = false;
                }

                lbl_medical_history.Text = WebHelpers.TextToHtmlTag(omr.medical_history);

                lbl_allergy.Text = WebHelpers.GetBool(omr.allergy, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(omr.allergy_note));

                lbl_family.Text = WebHelpers.TextToHtmlTag(omr.family);
                lbl_immunization.Text = WebHelpers.TextToHtmlTag(omr.immunization);
                //
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);
                vs_temperature.Text = omr.vs_temperature;
                vs_weight.Text = omr.vs_weight;
                vs_height.Text = omr.vs_height;
                vs_bmi.Text = omr.vs_BMI;
                vs_pulse.Text = omr.vs_pulse;
                vs_heart_rate.Text = omr.vs_heart_rate;
                vs_respiratory_rate.Text = omr.vs_respiratory_rate;
                vs_blood_pressure.Text = omr.vs_blood_pressure;
                vs_spo2.Text = omr.vs_spO2;

                lbl_physical_examination.Text = WebHelpers.TextToHtmlTag(omr.physical_examination);

                rad_treatment_code_change(omr.treatment_code);
                if (omr.treatment_code == "OPD") { lbl_medicine.Text = WebHelpers.TextToHtmlTag(omr.medicine); }
                
                lbl_psy_consult_required.Text = WebHelpers.GetBool(omr.psy_consult_required);

                //IV.
                lbl_laboratory_indications_results.Text = WebHelpers.TextToHtmlTag(omr.laboratory_indications_results);
                lbl_additional_investigation.Text = WebHelpers.TextToHtmlTag(omr.additional_investigation);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(omr.initial_diagnosis);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(omr.diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(omr.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(omr.associated_conditions);
                lbl_treatment_code.Text = WebHelpers.TextToHtmlTag(omr.treatment_desc);

                lbl_spec_opinion_requested.Text = WebHelpers.GetBool(omr.spec_opinion_requested, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(omr.spec_opinion_requested_note));

                lbl_specific_education_required.Text = WebHelpers.TextToHtmlTag(omr.specific_education_required);
                lbl_next_appointment.Text = WebHelpers.TextToHtmlTag(omr.next_appointment);
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
            
        }
        private void BindingDataFormPrint(Omr omr)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                prt_fullname.Text = patientInfo.FullName + $" ({patientInfo.Title})";
                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth) + " | " + patientInfo.Gender;
                prt_vpid.Text = patientInfo.visible_patient_id;
                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(patientVisitInfo.actual_visit_date_time);
                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(omr.chief_complain, false);
                prt_medical_history.Text = WebHelpers.TextToHtmlTag(omr.medical_history, false);
                prt_personal.Text = WebHelpers.TextToHtmlTag(omr.personal, false);
                prt_family.Text = WebHelpers.TextToHtmlTag(omr.family, false);
                prt_immunization.Text = WebHelpers.TextToHtmlTag(omr.immunization, false);
                prt_current_medication.Text = WebHelpers.TextToHtmlTag(omr.current_medication, false);
                //IV.
                //1.
                prt_vs_temperature.Text = omr.vs_temperature;
                prt_vs_weight.Text = omr.vs_weight;
                prt_vs_height.Text = omr.vs_height;
                prt_vs_BMI.Text = omr.vs_BMI;
                prt_pulse.Text = omr.vs_heart_rate;
                
                prt_vs_respiratory_rate.Text = omr.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = omr.vs_blood_pressure;
                prt_vs_spO2.Text = omr.vs_spO2;
                //2.
                prt_physical_examination.Text = WebHelpers.TextToHtmlTag(omr.physical_examination, false);

                prt_psy_consult_required.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, omr.psy_consult_required, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

                prt_laboratory_indications_results.Text = WebHelpers.TextToHtmlTag(omr.laboratory_indications_results, false);
                prt_additional_investigation.Text = WebHelpers.TextToHtmlTag(omr.additional_investigation, false);
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(omr.initial_diagnosis, false);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(omr.diagnosis, false);
                prt_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(omr.differential_diagnosis, false);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(omr.associated_conditions, false);

                prt_treatment.Text = WebHelpers.CreateOptions(Omr.TREATMENT_CODE, (string)omr.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr;");

                if (omr.treatment_code == "OPD")
                {
                    prt_medicine.Visible = true;
                    prt_medicine.Text = WebHelpers.TextToHtmlTag(omr.medicine, false);
                }
                else
                {
                    prt_medicine.Visible = false;
                }

                prt_spec_opinion_requested.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, omr.spec_opinion_requested, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

                if (omr.spec_opinion_requested != null)
                {
                    if (omr.spec_opinion_requested)
                    {
                        prt_spec_opinion_requested_note_wrapper.Visible = true;
                        prt_spec_opinion_requested_note.Text = WebHelpers.TextToHtmlTag(omr.spec_opinion_requested_note, false);
                    }
                    else
                    {
                        prt_spec_opinion_requested_note_wrapper.Visible = false;
                    }
                }

                prt_specific_education_required.Text = WebHelpers.TextToHtmlTag(omr.specific_education_required, false);

                prt_next_appointment.Text = WebHelpers.TextToHtmlTag(omr.next_appointment, false);

                prt_signature_doctor.Text = SignatureName;
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Omr omr = new Omr(Request.QueryString["docId"], loc);
                omr.status = DocumentStatus.FINAL;
                
                UpdateData(omr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Omr omr = new Omr(Request.QueryString["docId"], loc);
                omr.status = DocumentStatus.DRAFT;

                UpdateData(omr);

            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = POMR.Delete((string)Session["UserId"], Request.QueryString["docId"], loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);

                    string url = $"../other/index.aspx?pid={varPID}&vpid={varVPID}";
                    WebHelpers.AddJS(Page, "DeleteNode(\"" + url + "\");");

                    //Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&req_act=1");
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], loc))
            {
                Omr omr = new Omr(Request.QueryString["docId"], loc);
                
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, omr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(omr);
                //get access button
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
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
            } catch(Exception ex) { WebHelpers.SendError(Page, ex); }
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

        #region Functions
        protected void UpdateData(Omr omr)
        {
            try
            {
                //I.
                omr.chief_complain = txt_chief_complain.Value;
                //II.
                //1.
                omr.medical_history = txt_medical_history.Value;
                omr.current_medication = txt_current_medication.Value;
                //2.
                omr.personal = txt_personal.Value;

                omr.habits_smoking = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_habits_smoking_");
                omr.habits_smoking_pack = txt_habits_smoking_pack.Value;

                omr.habits_alcohol = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_habits_alcohol_");
                omr.habits_alcohol_note = txt_habits_alcohol_note.Value;

                omr.habits_drugs = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_habits_drugs_");
                omr.habits_drugs_note = txt_habits_drugs_note.Value;

                omr.habits_physical_exercise = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_habits_physical_exercise_");
                omr.habits_phy_exer_note = txt_habits_phy_exer_note.Value;

                omr.habits_other = txt_habits_other.Value;

                omr.family = txt_family.Value;
                omr.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                omr.allergy_note = WebHelpers.GetBool(omr.allergy, txt_allergy_note.Value, null);
                omr.immunization = txt_immunization.Value;
                //II.
                omr.vs_temperature = vs_temperature.Text;
                omr.vs_weight = vs_weight.Text;
                omr.vs_height = vs_height.Text;
                omr.vs_BMI = vs_bmi.Text;
                omr.vs_pulse = vs_pulse.Text;
                omr.vs_heart_rate = vs_heart_rate.Text;
                omr.vs_respiratory_rate = vs_respiratory_rate.Text;
                omr.vs_blood_pressure = vs_blood_pressure.Text;
                omr.vs_spO2 = vs_spo2.Text;
                omr.physical_examination = txt_physical_examination.Value.Replace("<br>", "");
                omr.psy_consult_required = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_psy_consult_required_");
                //IV.
                omr.laboratory_indications_results = txt_laboratory_indications_results.Value;
                omr.additional_investigation = txt_additional_investigation.Value;
                //V.
                omr.initial_diagnosis = txt_initial_diagnosis.Value;
                omr.diagnosis = txt_diagnosis.Value;
                omr.differential_diagnosis = txt_differential_diagnosis.Value;
                omr.associated_conditions = txt_associated_conditions.Value;

                omr.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", Omr.TREATMENT_CODE);
                omr.treatment_desc = WebHelpers.GetDicDesc(omr.treatment_code, Omr.TREATMENT_CODE);

                //5.
                if (omr.treatment_code == "OPD") { omr.medicine = txt_medicine.Value; }
                
                omr.spec_opinion_requested = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_");
                omr.spec_opinion_requested_note = WebHelpers.GetBool(omr.spec_opinion_requested, txt_spec_opinion_requested_note.Value, null);

                omr.specific_education_required = txt_specific_education_required.Value;

                omr.next_appointment = txt_next_appointment.Value;

                if (JsonConvert.SerializeObject(omr) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                omr.amend_reason = txt_amend_reason.Text;
                omr.user_name = (string)Session["UserID"];

                dynamic result = omr.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public void Initial()
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);
                
                if (varDocIdLog != null)
                {
                    omr =  new Omr(varDocIdLog, true, loc);
                    currentLog.Visible = true;

                }
                else
                {
                    omr = new Omr(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                loadRadGridHistoryLog();
                
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (omr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(omr);
                }
                else if (omr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, omr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        private void loadRadGridHistoryLog()
        {
            DataTable dt = Omr.Logs(Request.QueryString["docId"], loc);
            RadGrid1.DataSource = dt;
            string last_updated_date_time = "";
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_e");

                WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("created_date_time"), out bool isValid, out last_updated_date_time);

                if (isValid)
                {
                    SignatureDate = last_updated_date_time;
                }
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("modified_name_e");
                WebHelpers.ConvertDateTime(dt.Rows[0].Field<DateTime>("modified_date_time"), out bool isValid, out last_updated_date_time);

                if (isValid)
                {
                    SignatureDate = last_updated_date_time;
                }
            }

            SignatureName = last_updated_doctor;

            RadLabel1.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{Convert.ToDateTime(last_updated_date_time).ToString("dd-MMM-yyyy HH:mm tt")}</i></b>";
            RadGrid1.DataBind();
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended by";
            object name = "";
            object time = "";

            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                name = created_name;
                time = created_date_time;
            }
            else
            {
                name = modified_name;
                time = created_date_time;
            }

            WebHelpers.ConvertDateTime(time, out bool isValid, out string dateTime, "dd-MMM-yyyy HH:mm tt");

            return $"{result} by <i>{name}</i> on <i>{dateTime}</i>";
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
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        #endregion

        #region Validations
        protected void spec_opinion_requested_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_spec_opinion_requested_false.Checked || rad_spec_opinion_requested_true.Checked;
        }
        protected void psy_consult_required_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_psy_consult_required_false.Checked || rad_psy_consult_required_true.Checked;
        }
        protected void allergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_allergy_false.Checked || rad_allergy_true.Checked;
        }
        protected void CustomValidatorAllergyNote_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_allergy_note.Value.Length <= 256;
        }
        protected void CustomValidatorSpecOpinionRequestedNote_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_spec_opinion_requested_note.Value.Length <= 256;
        }

        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);

        }
    }
}
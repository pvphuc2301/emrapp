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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            if (!IsPostBack)
            {
                Initial();
            }
            PostBackEventHandler();
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
                txt_amend_reason.Text = "";

                Patient patient = Patient.Instance();
                if (DataHelpers.CalculateAge(patient.date_of_birth) >= 18)
                {
                    habits_field.Visible = true;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_smoking_" + omr.habits_smoking);

                    txt_habits_smoking_pack.Value = WebHelpers.GetBool(omr.habits_smoking, omr.habits_smoking_pack, "");

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_alcohol_" + omr.habits_alcohol);

                    txt_habits_alcohol_note.Value = WebHelpers.GetBool(omr.habits_alcohol, omr.habits_alcohol_note, "");
                        

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_drugs_" + omr.habits_drugs);

                    txt_habits_drugs_note.Value = WebHelpers.GetBool(omr.habits_drugs, omr.habits_drugs_note, "");

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_physical_exercise_" + omr.habits_physical_exercise);

                    txt_habits_phy_exer_note.Value = WebHelpers.GetBool(omr.habits_physical_exercise, omr.habits_phy_exer_note,"");

                    txt_habits_other.Value = omr.habits_other;
                }
                else
                {
                    habits_field.Visible = false;
                }

                // I. Lý do đến khám/ Chief complaint:
                txt_chief_complain.Value = omr.chief_complain;

                // II. Bệnh sử/ Medical History:
                // 1.Bệnh sử hiện tại / Current Medical History:
                txt_medical_history.Value = omr.medical_history;

                txt_current_medication.Value = omr.current_medication;

                // 2.Tiền sử bệnh/ Antecedent Medical History:
                txt_personal.Value = omr.personal;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + omr.allergy);
                
                txt_allergy_note.Value = WebHelpers.GetBool(omr.allergy, omr.allergy_note, "");

                txt_family.Value = omr.family;
                txt_immunization.Value = omr.immunization;

                // III.Khám bệnh/ Physical Examination:
                // DẤU HIỆU SINH TỒN/ VITAL SIGNS:

                txt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(omr.physical_examination);

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

                txt_laboratory_indications_results.Value = omr.laboratory_indications_results;
                txt_additional_investigation.Value = omr.additional_investigation;
                // V.Kết luận/ Conclusion:
                //txtDiagnosis.Text = omr1.diagnosis;
                txt_initial_diagnosis.Value = omr.initial_diagnosis;
                txt_diagnosis.Value = omr.diagnosis;
                txt_differential_diagnosis.Value = omr.differential_diagnosis;
                txt_associated_conditions.Value = omr.associated_conditions;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + omr.treatment_code, "opd");
                
                // 5.Current medications
                rad_treatment_code_change(omr.treatment_code);
                txt_medicine.Value = omr.medicine;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_" + omr.spec_opinion_requested, "false");
                txt_spec_opinion_requested_note.Value = WebHelpers.GetBool(omr.spec_opinion_requested, omr.spec_opinion_requested_note, "");

                txt_specific_education_required.Value = omr.specific_education_required;
                txt_next_appointment.Value = omr.next_appointment;

                DataObj.Value = JsonConvert.SerializeObject(omr);

                Session["docid"] = omr.document_id;
                WebHelpers.AddScriptFormEdit(Page, omr, (string)Session["emp_id"]);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }

        private void BindingDataFormView(Omr omr)
        {
            try
            {
                //1
                lbl_chief_complain.Text = WebHelpers.FormatString(omr.chief_complain);
                lbl_current_medication.Text = WebHelpers.FormatString(omr.current_medication);
                //2
                lbl_personal.Text = WebHelpers.FormatString(omr.personal);
                if (DataHelpers.CalculateAge(DataHelpers.patient.date_of_birth) >= 18)
                {
                    habits_field.Visible = true;

                    lbl_habits_smoking.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.habits_smoking, "Có, ghi số gói trong năm/ Yes, specify pack years: " + omr.habits_smoking_pack));

                    lbl_habits_alcohol.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.habits_alcohol, "Có, ghi rõ/ Yes, specify: " + omr.habits_alcohol_note));

                    lbl_habits_drugs.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.habits_drugs, "Có, ghi rõ/ Yes, specify: " + omr.habits_drugs_note));

                    lbl_habits_physical_exercise.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.habits_physical_exercise, "Có, ghi rõ/ Yes, specify: " + omr.habits_phy_exer_note));

                    lbl_habits_other.Text = WebHelpers.GetValue(omr.habits_other);
                }
                else
                {
                    habits_field.Visible = false;
                }

                lbl_medical_history.Text = WebHelpers.FormatString(omr.medical_history);

                lbl_allergy.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.allergy, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(omr.allergy_note)));

                lbl_family.Text = WebHelpers.FormatString(omr.family);
                lbl_immunization.Text = WebHelpers.FormatString(omr.immunization);
                //
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);
                vs_temperature.Text = WebHelpers.FormatString(omr.vs_temperature);
                vs_weight.Text = WebHelpers.FormatString(omr.vs_weight);
                vs_height.Text = WebHelpers.FormatString(omr.vs_height);
                vs_bmi.Text = WebHelpers.FormatString(omr.vs_BMI);
                vs_pulse.Text = WebHelpers.FormatString(omr.vs_pulse);
                vs_heart_rate.Text = WebHelpers.FormatString(omr.vs_heart_rate);
                vs_respiratory_rate.Text = WebHelpers.FormatString(omr.vs_respiratory_rate);
                vs_blood_pressure.Text = WebHelpers.FormatString(omr.vs_blood_pressure);
                vs_spo2.Text = WebHelpers.FormatString(omr.vs_spO2);

                lbl_physical_examination.Text = WebHelpers.FormatString(DataHelpers.FormatPhysicalExamination(omr.physical_examination));

                rad_treatment_code_change(omr.treatment_code);
                if (omr.treatment_code == "OPD") { lbl_medicine.Text = WebHelpers.FormatString(omr.medicine); }
                
                lbl_psy_consult_required.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.psy_consult_required));

                //IV.
                lbl_laboratory_indications_results.Text = WebHelpers.FormatString(omr.laboratory_indications_results);
                lbl_additional_investigation.Text = WebHelpers.FormatString(omr.additional_investigation);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(omr.initial_diagnosis);
                lbl_diagnosis.Text = WebHelpers.FormatString(omr.diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.FormatString(omr.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.FormatString(omr.associated_conditions);
                lbl_treatment_code.Text = WebHelpers.FormatString(omr.treatment_desc);

                lbl_spec_opinion_requested.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.spec_opinion_requested, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(omr.spec_opinion_requested_note)));

                lbl_specific_education_required.Text = WebHelpers.FormatString(omr.specific_education_required);
                lbl_next_appointment.Text = WebHelpers.FormatString(omr.next_appointment);
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
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();
                prt_fullname.Text = patient.GetFullName() + " " + patient.title_l;
                prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth) + " | " + patient.GetGender();
                prt_vpid.Text = patient.visible_patient_id;
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
                prt_chief_complaint.Text = omr.chief_complain;
                prt_medical_history.Text = omr.medical_history;
                prt_personal.Text = omr.personal;
                prt_family.Text = omr.family;
                prt_immunization.Text = omr.immunization;
                prt_current_medication.Text = omr.current_medication;
                //IV.
                //1.
                prt_vs_temperature.Text = omr.vs_temperature;
                prt_vs_weight.Text = omr.vs_weight;
                prt_vs_height.Text = omr.vs_height;
                prt_vs_BMI.Text = omr.vs_BMI;
                prt_pulse.Text = omr.vs_pulse;
                prt_vs_respiratory_rate.Text = omr.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = omr.vs_blood_pressure;
                prt_vs_spO2.Text = omr.vs_spO2;
                //2.
                prt_physical_examination.Text = DataHelpers.FormatPhysicalExamination(omr.physical_examination);

                prt_psy_consult_required.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, omr.psy_consult_required, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

                prt_laboratory_indications_results.Text = omr.laboratory_indications_results;
                prt_additional_investigation.Text = omr.additional_investigation;
                prt_initial_diagnosis.Text = omr.initial_diagnosis;
                prt_diagnosis.Text = omr.diagnosis;
                prt_differential_diagnosis.Text = omr.differential_diagnosis;
                prt_associated_conditions.Text = omr.associated_conditions;

                prt_treatment.Text = WebHelpers.CreateOptions(Omr.TREATMENT_CODE, (string)omr.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr;");

                if (omr.treatment_code == "OPD")
                {
                    prt_medicine.Visible = true;
                    prt_medicine.Text = omr.medicine;
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
                        prt_spec_opinion_requested_note.Text = omr.spec_opinion_requested_note;
                    }
                    else
                    {
                        prt_spec_opinion_requested_note_wrapper.Visible = false;
                    }
                }

                prt_specific_education_required.Text = omr.specific_education_required;

                prt_next_appointment.Text = omr.next_appointment;

                prt_signature_doctor.Text = (string)Session["signature_doctor"];
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
                Omr omr = new Omr(Request.QueryString["docId"]);

                if(omr.status != DocumentStatus.DRAFT)
                {
                    Session["Transaction"] = string.Empty;
                }
                else
                {
                    Session["Transaction"] = "Complete";
                }

                omr.status = DocumentStatus.FINAL;
                
                UpdateData(omr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Omr omr = new Omr(Request.QueryString["docId"]);
                omr.status = DocumentStatus.DRAFT;

                UpdateData(omr);

            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = POMR.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Omr omr = new Omr(Request.QueryString["docId"]);
                
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, omr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(omr);
                //get access button
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic response = VitalSign.Update(PatientVisit.Instance().patient_visit_id, PatientVisit.Instance().visit_type);
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
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
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

                dynamic result = omr.Update()[0];

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
                Omr omr;
                if (Request.QueryString["docIdLog"] != null)
                {
                    omr =  new Omr(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];
                    
                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    omr = new Omr(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();
                
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (omr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(omr);
                }
                else if (omr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, omr.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        private void loadRadGridHistoryLog()
        {
            DataTable dt = Oina.Logs(Request.QueryString["docId"]);
            RadGrid1.DataSource = dt;
            DateTime last_updated_date_time = new DateTime();
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("created_date_time");
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("modified_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("modified_date_time");
            }

            Session["signature_doctor"] = last_updated_doctor;
            RadLabel1.Text = $"Last updated by {last_updated_doctor} on " + WebHelpers.FormatDateTime(last_updated_date_time, "dd-MM-yyyy HH:mm");
            RadGrid1.DataBind();
        }

        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended by";
            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason))) {
                result = "Submitted by";
            }
            
            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved by";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name))){
                result += $" {created_name} on {created_date_time}";
            }
            else
            {
                result += $" {modified_name} on {modified_date_time}";
            }
            return result;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/OPD/OutPatMedRec.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/OPD/OutPatMedRec.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
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
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

        }
    }
}
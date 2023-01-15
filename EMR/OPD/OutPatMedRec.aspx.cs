using EMR.Classes;
using EMR.Data.AIH.Dictionary;
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
    public partial class OutPatMedRec : EmrPage, IEmrFormModel<OmrModel>
    {
        public override string form_url { get; set; } = $"OPD/{nameof(OutPatMedRec)}";
        public OmrModel Model { get; set; }
        public override dynamic InitModel()
        {
            //if (WebHelpers.IsDEVELOP())
            {
                form_url = form_url + "RV01";
                Response.Redirect(PAGE_URL);
            }
            return Model = new OmrModel(varDocID, Location, varDocIdLog);
        }
        public override void PostBackEventHandler()
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
        public override void BindingDataFormEdit()
        {
            try
            {
                btnVSFreeText.Visible = true;

                Patient = new PatientInfo(varPID);
                txt_amend_reason.Text = "";

                if (DataHelpers.CalculateAge(Patient.date_of_birth) >= 18)
                {
                    habits_field.Visible = true;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_smoking_" + Model.habits_smoking);

                    txt_habits_smoking_pack.Value = WebHelpers.GetBool(Model.habits_smoking, Model.habits_smoking_pack, "");

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_alcohol_" + Model.habits_alcohol);

                    txt_habits_alcohol_note.Value = WebHelpers.GetBool(Model.habits_alcohol, WebHelpers.TextToHtmlTag(Model.habits_alcohol_note), "");


                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_drugs_" + Model.habits_drugs);

                    txt_habits_drugs_note.Value = WebHelpers.GetBool(Model.habits_drugs, WebHelpers.TextToHtmlTag(Model.habits_drugs_note), "");

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_physical_exercise_" + Model.habits_physical_exercise);

                    txt_habits_phy_exer_note.Value = WebHelpers.GetBool(Model.habits_physical_exercise, WebHelpers.TextToHtmlTag(Model.habits_phy_exer_note), "");

                    txt_habits_other.Value = WebHelpers.TextToHtmlTag(Model.habits_other);
                }
                else
                {
                    habits_field.Visible = false;
                }

                // I. Lý do đến khám/ Chief complaint:
                txt_chief_complain.Value = WebHelpers.TextToHtmlTag(Model.chief_complain);

                // II. Bệnh sử/ Medical History:
                // 1.Bệnh sử hiện tại / Current Medical History:
                txt_medical_history.Value = WebHelpers.TextToHtmlTag(Model.medical_history);

                txt_current_medication.Value = WebHelpers.TextToHtmlTag(Model.current_medication);

                // 2.Tiền sử bệnh/ Antecedent Medical History:
                txt_personal.Value = WebHelpers.TextToHtmlTag(Model.personal);

                //Update V2.0
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = false;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_" + Model.infected_with_covid);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + Model.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + Model.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + Model.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + Model.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + Model.not_yet_vaccinations);
                //txt_other_vaccinations.Value = WebHelpers.TextToHtmlTag(Model.immunization); // Model.other_vaccinations;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + Model.allergy);

                txt_allergy_note.Value = WebHelpers.GetBool(Model.allergy, WebHelpers.TextToHtmlTag(Model.allergy_note), "");

                txt_family.Value = WebHelpers.TextToHtmlTag(Model.family);
                txt_immunization.Value = WebHelpers.TextToHtmlTag(Model.immunization);

                // III.Khám bệnh/ Physical Examination:
                // DẤU HIỆU SINH TỒN/ VITAL SIGNS:

                txt_physical_examination.Value = WebHelpers.TextToHtmlTag(Model.physical_examination);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_psy_consult_required_" + Model.psy_consult_required, "false");

                WebHelpers.VisibleControl(true, btnUpdateVitalSign);

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

                txt_vs_temperature.Value = Model.vs_temperature;
                txt_vs_heart_rate.Value = Model.vs_heart_rate;
                txt_vs_weight.Value = Model.vs_weight;
                txt_vs_respiratory_rate.Value = Model.vs_respiratory_rate;
                txt_vs_height.Value = Model.vs_height;
                txt_vs_blood_pressure.Value = Model.vs_blood_pressure;
                txt_vs_bmi.Value = Model.vs_BMI;
                txt_vs_spO2.Value = Model.vs_spO2;
                txt_vs_pulse.Value = Model.vs_pulse;

                txt_laboratory_indications_results.Value = WebHelpers.TextToHtmlTag(Model.laboratory_indications_results);
                txt_additional_investigation.Value = WebHelpers.TextToHtmlTag(Model.additional_investigation);
                // V.Kết luận/ Conclusion:
                //txtDiagnosis.Text = Model1.diagnosis;
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.diagnosis);
                txt_differential_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(Model.associated_conditions);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + Model.treatment_code, "opd");

                // 5.Current medications
                rad_treatment_code_change(Model.treatment_code);
                txt_medicine.Value = WebHelpers.TextToHtmlTag(Model.medicine);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_" + Model.spec_opinion_requested, "false");
                txt_spec_opinion_requested_note.Value = WebHelpers.GetBool(Model.spec_opinion_requested, WebHelpers.TextToHtmlTag(Model.spec_opinion_requested_note), "");

                txt_specific_education_required.Value = WebHelpers.TextToHtmlTag(Model.specific_education_required);
                txt_next_appointment.Value = WebHelpers.TextToHtmlTag(Model.next_appointment);

                DataObj.Value = JsonConvert.SerializeObject(Model);

                Session["docid"] = Model.document_id;
                WebHelpers.AddScriptFormEdit(Page, Model, (string)Session["emp_id"], Location);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }

        public override void BindingDataFormView()
        {
            try
            {
                LoadBarCode();
                btnVSFreeText.Visible = false;
                //1
                lbl_chief_complain.Text = WebHelpers.TextToHtmlTag(Model.chief_complain);
                lbl_current_medication.Text = WebHelpers.TextToHtmlTag(Model.current_medication);
                //2
                lbl_personal.Text = WebHelpers.TextToHtmlTag(Model.personal);
                if (DataHelpers.CalculateAge(Patient.date_of_birth) >= 18)
                {
                    habits_field.Visible = true;

                    lbl_habits_smoking.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.habits_smoking, "Có, ghi số gói trong năm/ Yes, specify pack years: " + Model.habits_smoking_pack));

                    lbl_habits_alcohol.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.habits_alcohol, "Có, ghi rõ/ Yes, specify: " + Model.habits_alcohol_note));

                    lbl_habits_drugs.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.habits_drugs, "Có, ghi rõ/ Yes, specify: " + Model.habits_drugs_note));

                    lbl_habits_physical_exercise.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.habits_physical_exercise, "Có, ghi rõ/ Yes, specify: " + Model.habits_phy_exer_note));

                    lbl_habits_other.Text = WebHelpers.GetValue(Model.habits_other);
                }
                else
                {
                    habits_field.Visible = false;
                }

                lbl_medical_history.Text = WebHelpers.TextToHtmlTag(Model.medical_history);

                // Update 2.0
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = true;

                lbl_infected_with_covid.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.infected_with_covid));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + Model.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + Model.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + Model.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + Model.not_yet_vaccinations);
                lbl_immunization.Text = WebHelpers.TextToHtmlTag(Model.immunization);
                //lbl_other_vaccinations.Text = Model.other_vaccinations;

                lbl_allergy.Text = WebHelpers.GetBool(Model.allergy, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(Model.allergy_note));

                lbl_family.Text = WebHelpers.TextToHtmlTag(Model.family);

                //
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);

                lbl_vs_temperature.Text = Model.vs_temperature + " °C";
                lbl_vs_weight.Text = Model.vs_weight + " Kg";
                lbl_vs_height.Text = Model.vs_height + " cm";
                lbl_vs_BMI.Text = Model.vs_BMI + " (Kg/m 2)";
                lbl_vs_pulse.Text = Model.vs_pulse + " cm";
                lbl_vs_heart_rate.Text = Model.vs_heart_rate + " /phút (m)";
                lbl_vs_respiratory_rate.Text = Model.vs_respiratory_rate + " /phút (m)";
                lbl_vs_blood_pressure.Text = Model.vs_blood_pressure + " mmHg";
                lbl_vs_spO2.Text = Model.vs_spO2 + " %";

                lbl_physical_examination.Text = WebHelpers.TextToHtmlTag(Model.physical_examination);

                rad_treatment_code_change(Model.treatment_code);
                if (Model.treatment_code == "OPD") { lbl_medicine.Text = WebHelpers.TextToHtmlTag(Model.medicine); }

                lbl_psy_consult_required.Text = WebHelpers.GetBool(Model.psy_consult_required);

                //IV.
                lbl_laboratory_indications_results.Text = WebHelpers.TextToHtmlTag(Model.laboratory_indications_results);
                lbl_additional_investigation.Text = WebHelpers.TextToHtmlTag(Model.additional_investigation);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions);
                lbl_treatment_code.Text = WebHelpers.TextToHtmlTag(Model.treatment_desc);

                lbl_spec_opinion_requested.Text = WebHelpers.GetBool(Model.spec_opinion_requested, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(Model.spec_opinion_requested_note));

                lbl_specific_education_required.Text = WebHelpers.TextToHtmlTag(Model.specific_education_required);
                lbl_next_appointment.Text = WebHelpers.TextToHtmlTag(Model.next_appointment);
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
                prt_fullname.Text = Patient.FullName + $" ({Patient.Title})";
                prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth) + " | " + Patient.Gender;
                prt_vpid.Text = Patient.visible_patient_id;

                LoadBarCode();
                
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(PatientVisit.actual_visit_date_time);
                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complain, false);
                prt_medical_history.Text = WebHelpers.TextToHtmlTag(Model.medical_history, false);
                prt_personal.Text = WebHelpers.TextToHtmlTag(Model.personal, false);
                // Update 2.0
                prt_infected_with_covid_false.Text
                    = prt_infected_with_covid_true.Text
                    = prt_received_1_dose_true.Text
                    = prt_received_2_dose_true.Text
                    = prt_received_additional_true.Text
                    = prt_not_yet_vaccinations_true.Text
                    = "❏";

                Label infected_with_covid = FindControl("prt_infected_with_covid_" + Model.infected_with_covid);
                if (infected_with_covid != null) infected_with_covid.Text = "☒";

                Label received_1_dose = FindControl("prt_received_1_dose_" + Model.received_1_dose);
                if (received_1_dose != null) received_1_dose.Text = "☒";

                Label received_2_dose = FindControl("prt_received_2_dose_" + Model.received_2_dose);
                if (received_2_dose != null) received_2_dose.Text = "☒";

                Label received_additional = FindControl("prt_received_additional_" + Model.received_additional);
                if (received_additional != null) received_additional.Text = "☒";

                Label not_yet_vaccinations = FindControl("prt_not_yet_vaccinations_" + Model.not_yet_vaccinations);
                if (not_yet_vaccinations != null) not_yet_vaccinations.Text = "☒";

                //prt_other_vaccinations.Text = "Tiêm vắc xin khác (ghi rõ)/ <span class=\"text-primary\">Other vaccinations (specify):</span>";
                prt_immunization.Text = WebHelpers.TextToHtmlTag(Model.immunization, false);

                prt_family.Text = WebHelpers.TextToHtmlTag(Model.family, false);
                prt_current_medication.Text = WebHelpers.TextToHtmlTag(Model.current_medication, false);
                //IV.
                //1.
                prt_vs_temperature.Text = Model.vs_temperature;
                prt_vs_weight.Text = Model.vs_weight;
                prt_vs_height.Text = Model.vs_height;
                prt_vs_BMI.Text = Model.vs_BMI;
                prt_pulse.Text = Model.vs_heart_rate;

                prt_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = Model.vs_blood_pressure;
                prt_vs_spO2.Text = Model.vs_spO2;
                //2.
                prt_physical_examination.Text = WebHelpers.TextToHtmlTag(Model.physical_examination, false);

                prt_psy_consult_required_true.Text
                    = prt_psy_consult_required_false.Text
                    = "❏";
                BindingLabel(nameof(Model.psy_consult_required) + "_" + Model.psy_consult_required, "☒");
                
                prt_laboratory_indications_results.Text = WebHelpers.TextToHtmlTag(Model.laboratory_indications_results, false);
                prt_additional_investigation.Text = WebHelpers.TextToHtmlTag(Model.additional_investigation, false);
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis, false);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis, false);
                prt_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis, false);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions, false);

                //prt_treatment.Text = WebHelpers.CreateOptions(OmrDictionaryV1.TREATMENT_CODE, (string)Model.treatment_code, "display: grid; grid-template-columns: auto 1fr 1fr; gap: 6px");

                prt_treatment_code_ipd.Text
                    = prt_treatment_code_opd.Text
                    = prt_treatment_code_trf.Text
                    = "❏";
                BindingLabel(nameof(Model.treatment_code) + "_" + Model.treatment_code, "☒");

                if (Model.treatment_code == "OPD")
                {
                    prt_medicine.Visible = true;
                    prt_medicine.Text = WebHelpers.TextToHtmlTag(Model.medicine, false);
                }
                else
                {
                    prt_medicine.Visible = false;
                }

                prt_spec_opinion_requested_true.Text
                    = prt_spec_opinion_requested_false.Text
                    = "❏";
                BindingLabel(nameof(Model.spec_opinion_requested) + "_" + Model.spec_opinion_requested, "☒");
                
                if (Model.spec_opinion_requested != null)
                {
                    if (Model.spec_opinion_requested)
                    {
                        prt_spec_opinion_requested_note_wrapper.Visible = true;
                        prt_spec_opinion_requested_note.Text = WebHelpers.TextToHtmlTag(Model.spec_opinion_requested_note, false);
                    }
                    else
                    {
                        prt_spec_opinion_requested_note_wrapper.Visible = false;
                    }
                }

                prt_specific_education_required.Text = WebHelpers.TextToHtmlTag(Model.specific_education_required, false);

                prt_next_appointment.Text = WebHelpers.TextToHtmlTag(Model.next_appointment, false);

                uplPrintPage.Update();
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        #region Events
        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            try
            {
                PatientVisit = new PatientVisitInfo(varPVID, Location);
                dynamic response = VitalSign.Update(PatientVisit.patient_visit_id, PatientVisit.visit_type, Location);
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
            txt_vs_temperature.Value = vs.vs_temperature;
            txt_vs_heart_rate.Value = vs.vs_heart_rate;
            txt_vs_weight.Value = vs.vs_weight;
            txt_vs_respiratory_rate.Value = vs.vs_respiratory_rate;
            txt_vs_height.Value = vs.vs_height;
            txt_vs_bmi.Value = vs.vs_BMI;
            txt_vs_blood_pressure.Value = vs.vs_blood_pressure;
            txt_vs_spO2.Value = vs.vs_spO2;
            txt_vs_pulse.Value = vs.pulse;
        }
        #endregion

        #region Functions
        public override void BindingControlToModel()
        {
            try
            {
                //I.
                Model.chief_complain = txt_chief_complain.Value;
                //II.
                //1.
                Model.medical_history = txt_medical_history.Value;
                Model.current_medication = txt_current_medication.Value;
                //2.
                Model.personal = txt_personal.Value;
                //Update v2.0
                Model.infected_with_covid = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_");
                Model.received_1_dose = cb_received_1_dose_true.Checked;
                Model.received_2_dose = cb_received_2_dose_true.Checked;
                Model.received_additional = cb_received_additional_true.Checked;
                //omr.other_vaccinations = txt_other_vaccinations.Value;
                Model.not_yet_vaccinations = cb_not_yet_vaccinations_true.Checked;

                Model.habits_alcohol = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_habits_alcohol_");
                Model.habits_alcohol_note = txt_habits_alcohol_note.Value;

                Model.habits_drugs = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_habits_drugs_");
                Model.habits_drugs_note = txt_habits_drugs_note.Value;

                Model.habits_physical_exercise = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_habits_physical_exercise_");
                Model.habits_phy_exer_note = txt_habits_phy_exer_note.Value;

                Model.habits_other = txt_habits_other.Value;

                Model.family = txt_family.Value;
                Model.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                Model.allergy_note = WebHelpers.GetBool(Model.allergy, txt_allergy_note.Value, null);
                Model.immunization = txt_immunization.Value;
                //II.
                Model.vs_temperature = txt_vs_temperature.Value;
                Model.vs_weight = txt_vs_weight.Value;
                Model.vs_height = txt_vs_height.Value;
                Model.vs_BMI = txt_vs_bmi.Value;
                Model.vs_pulse = txt_vs_pulse.Value;
                Model.vs_heart_rate = txt_vs_heart_rate.Value;
                Model.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                Model.vs_blood_pressure = txt_vs_blood_pressure.Value;
                Model.vs_spO2 = txt_vs_spO2.Value;

                string physical_examination = txt_physical_examination.Value;

                while (physical_examination.Contains("<br>"))
                {
                    physical_examination = physical_examination.Replace("<br>", "\n");
                }

                while (physical_examination.Contains("\n\n"))
                {
                    physical_examination = physical_examination.Replace("\n\n", "\n");
                }

                Model.physical_examination = physical_examination;
                Model.psy_consult_required = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_psy_consult_required_");
                //IV.
                Model.laboratory_indications_results = txt_laboratory_indications_results.Value;
                Model.additional_investigation = txt_additional_investigation.Value;
                //V.
                Model.initial_diagnosis = txt_initial_diagnosis.Value;
                Model.diagnosis = txt_diagnosis.Value;
                Model.differential_diagnosis = txt_differential_diagnosis.Value;
                Model.associated_conditions = txt_associated_conditions.Value;

                Model.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", OmrDictionary.TREATMENT_CODE);
                Model.treatment_desc = WebHelpers.GetDicDesc(Model.treatment_code, Omr.TREATMENT_CODE);

                //5.
                if (Model.treatment_code == "OPD") { Model.medicine = txt_medicine.Value; }

                Model.spec_opinion_requested = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_");
                Model.spec_opinion_requested_note = WebHelpers.GetBool(Model.spec_opinion_requested, txt_spec_opinion_requested_note.Value, null);

                Model.specific_education_required = txt_specific_education_required.Value;

                Model.next_appointment = txt_next_appointment.Value;

                if (JsonConvert.SerializeObject(Model) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                Model.amend_reason = txt_amend_reason.Text;
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
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

        protected void btnNewVitalSign_Click(object sender, EventArgs e)
        {

        }
        private void LoadBarCode()
        {
            IBarcodeGenerator barcodeGenerator = new BarcodeGenerator();
            BarCode.Controls.Clear();
            BarCode.Controls.Add(barcodeGenerator.Generator(Patient.visible_patient_id));
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
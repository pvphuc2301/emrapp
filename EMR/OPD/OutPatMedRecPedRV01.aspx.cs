using EMR.Classes;
using EMR.Data.AIH.Model;
using EMR.Model;
using EMR.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Security.Policy;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class OutPatMedRecPedRV01 : EmrPage, IEmrFormModel<PomrModel>
    {
        public override string form_url { get; set; } = $"OPD/OutPatMedRecPedRV01";
        public PomrModel Model { get; set; }
        public override dynamic InitModel() {
            LoadPatient();
            Model = new PomrModel(varDocID, Location, varDocIdLog);

            if (Model.Logs(Location)?.Rows.Count == 1)
            {
                Model.SetDefaultDocument(Location, PatientVisit.patient_visit_id);
            }

            return Model;
        }
        #region Binding Data
        public override void BindingDataFormEdit()
        {
            try 
            {
                btnUpdateNutritionScreening.Visible = true;
                up_nutrition_screening.Visible = true;
                lbl_nutrition_screening_code.Visible = false;
                lbl_asessment_date_time.Visible = false;
                dtpk_asessment_date_time.Visible = true;

                BindingRadDateTimePicker(dtpk_asessment_date_time, Model.asessment_date_time);

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
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + Model.not_yet_vaccinations);

                txt_other_vaccinations.Value = Model.other_vaccinations;

                btnVSFreeText.Visible = true;
                txt_amend_reason.Text = "";

                // I. Lý do đến khám/ Chief complaint:
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(Model.chief_complaint);

                // II. Bệnh sử/ Medical History:
                // 1.Bệnh sử hiện tại / Current Medical History:
                txt_medical_history.Value = WebHelpers.TextToHtmlTag(Model.medical_history);

                txt_current_medication.Value = WebHelpers.TextToHtmlTag(Model.current_medication);

                // 2.Tiền sử bệnh/ Antecedent Medical History:
                txt_personal.Value = WebHelpers.TextToHtmlTag(Model.personal);
                txt_family.Value = WebHelpers.TextToHtmlTag(Model.family);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + Model.allergy);
                txt_allergy_note.Value = WebHelpers.GetBool(Model.allergy, WebHelpers.TextToHtmlTag(Model.allergy_note), "");


                // III.Khám bệnh/ Physical Examination:
                // DẤU HIỆU SINH TỒN/ VITAL SIGNS:

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

                txt_physical_examination.Value = Model.physical_examination.Replace("\n", "<br>");

                txt_laboratory_indications_results.Value = WebHelpers.TextToHtmlTag(Model.laboratory_indications_results);

                nutrition_screening_wrapper.Visible = false;
                nutrition_screening_desc_wrapper.Visible = false;
                if (!string.IsNullOrEmpty(Model.nutrition_screening))
                {
                    var nutrition_screening = NutritionalStatusProvider.ConvertToObject(Model.nutrition_screening);
                    if (NutritionalStatusProvider.IsRiskofMalnutrition(nutrition_screening.total_score))
                    {
                        lbl_risk_of_malnutrition.Text = "Có nguy cơ thiếu dinh dưỡng (≥ 2)/ Risk of malnutrition";
                        nutrition_screening_wrapper.Visible = true;
                        if (Model.nutrition_screening_code == "N")
                        {
                            rad_nutrition_screening_code_n.Checked = true;
                            nutrition_screening_desc_wrapper.Visible = true;
                            txt_nutrition_screening_desc.Value = Model.nutrition_screening_desc;
                        }
                        else if (Model.nutrition_screening_code == "Y")
                        {
                            rad_nutrition_screening_code_y.Checked = true;
                        }
                    }
                    else
                    {
                        lbl_risk_of_malnutrition.Text = "Không có nguy cơ thiếu dinh dưỡng (<2)/ No risk of malnutrition";
                        nutrition_screening_wrapper.Visible = false;
                    }
                }

                // V.Kết luận/ Conclusion:
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                txt_differential_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(Model.associated_conditions);

                // 5.Current medications
                //Set default value
                if (string.IsNullOrEmpty(Model.treatment_code)) { Model.treatment_code = "OPD"; }
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + Model.treatment_code);

                rad_treatment_code_change(Model.treatment_code);

                txt_medicine.Value = WebHelpers.TextToHtmlTag(Model.medicine);
                txt_tranfer.Value = WebHelpers.TextToHtmlTag(Model.tranfer);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_" + Model.spec_opinion_requested);

                if (Model.spec_opinion_requested == null) { rad_spec_opinion_requested_false.Checked = true; }

                txt_spec_opinion_requested_note.Value = WebHelpers.GetBool(Model.spec_opinion_requested, WebHelpers.TextToHtmlTag(Model.spec_opinion_requested_note), "");

                txt_specific_education_required.Value = WebHelpers.TextToHtmlTag(Model.specific_education_required);

                if(Model.bool_next_appointment != null)
                {
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bool_next_appointment_" + Model.bool_next_appointment);
                    if (Model.bool_next_appointment)
                    {
                        WebHelpers.BindDateTimePicker(dtpk_date_next_appointment, Model.date_next_appointment);
                    }
                    else
                    {
                        txt_next_appointment.Value = WebHelpers.TextToHtmlTag(Model.txt_next_appointment);
                    }
                }
                DataObj.Value = JsonConvert.SerializeObject(Model);

                Session["docid"] = Model.document_id;
                WebHelpers.AddScriptFormEdit(Page, Model, (string)Session["emp_id"], Location);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormView()
        {
            try
            {
                btnUpdateNutritionScreening.Visible = false;
                up_nutrition_screening.Visible = false;
                lbl_nutrition_screening_code.Visible = true;
                dtpk_asessment_date_time.Visible = false;

                lbl_asessment_date_time.Text = WebHelpers.FormatDateTime(Model.asessment_date_time, "dd-MMM-yyyy HH:mm tt", "—");

                LoadBarCode();//fix lỗi không load dc barcode
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

                lbl_other_vaccinations.Text = Model.other_vaccinations;

                btnVSFreeText.Visible = false;
                //1
                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                lbl_current_medication.Text = WebHelpers.TextToHtmlTag(Model.current_medication);
                //2
                lbl_personal.Text = WebHelpers.TextToHtmlTag(Model.personal);
            
                lbl_medical_history.Text = WebHelpers.TextToHtmlTag(Model.medical_history);

                lbl_allergy.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.allergy, "Có, ghi rõ/ Yes, specify: " + Model.allergy_note));

                lbl_family.Text = WebHelpers.TextToHtmlTag(Model.family);
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

                if (!string.IsNullOrEmpty(Model.nutrition_screening))
                {
                    var nutrition_screening = NutritionalStatusProvider.ConvertToObject(Model.nutrition_screening);
                    if (NutritionalStatusProvider.IsRiskofMalnutrition(nutrition_screening.total_score))
                    {
                        lbl_risk_of_malnutrition.Text = "Có nguy cơ thiếu dinh dưỡng (≥ 2)/ Risk of malnutrition";
                        nutrition_screening_wrapper.Visible = true;
                        if (Model.nutrition_screening_code == "N")
                        {
                            lbl_nutrition_screening_code.Text = "Không, lý do/ No, reason: " + Model.nutrition_screening_desc;
                        }
                        else if (Model.nutrition_screening_code == "Y")
                        {
                            lbl_nutrition_screening_code.Text = "Có/ Yes";
                        }
                    }
                    else
                    {
                        lbl_risk_of_malnutrition.Text = "Không có nguy cơ thiếu dinh dưỡng (<2)/ No risk of malnutrition";
                        nutrition_screening_wrapper.Visible = false;
                    }
                }

                rad_treatment_code_change(Model.treatment_code);
                if (Model.treatment_code == "OPD")
                {
                    lbl_medicine.Text = WebHelpers.TextToHtmlTag(Model.medicine);
                } else if (Model.treatment_code == "TRF")
                {
                    lbl_tranfer.Text = WebHelpers.TextToHtmlTag(Model.tranfer);
                }
                
                lbl_laboratory_indications_results.Text = WebHelpers.TextToHtmlTag(Model.laboratory_indications_results);
                lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions);
                lbl_treatment_code.Text = WebHelpers.TextToHtmlTag(Model.treatment_desc);

                lbl_spec_opinion_requested.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.spec_opinion_requested, "Có, ghi rõ/ Yes, specify: " + Model.spec_opinion_requested_note));
                
                lbl_specific_education_required.Text = WebHelpers.TextToHtmlTag(Model.specific_education_required);

                lbl_date_next_appointment.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.bool_next_appointment, "Calendar<br>" + WebHelpers.FormatDateTime(Model.date_next_appointment), "Text<br>" + Model.txt_next_appointment));
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
                prt_asessment_date.Text = WebHelpers.FormatDateTime(Model.asessment_date_time, "dd/MM/yyyy");
                prt_asessment_time.Text = WebHelpers.FormatDateTime(Model.asessment_date_time, "HH:mm");
                //prt_fullname.Text = Patient.FullName + " " + Patient.Title;
                //prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth) + $" | ({Patient.Gender})";
                //prt_vpid.Text = Patient.visible_patient_id;
                prt_patient_name.Text = Patient.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth, "dd/MM/yyyy");
                prt_gender.Text = Patient.Gender;
                prt_pid.Text = Patient.visible_patient_id;

                LoadBarCode();

                prt_day_of_visit.Text = WebHelpers.FormatDateTime(PatientVisit.actual_visit_date_time);
                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                prt_medical_history.Text = WebHelpers.TextToHtmlTag(Model.medical_history);
                prt_personal.Text = WebHelpers.TextToHtmlTag(Model.personal);
                //Update 2.0
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

                prt_other_vaccinations.Text = Model.other_vaccinations;

                prt_family.Text = WebHelpers.TextToHtmlTag(Model.family);

                prt_allergy_binding();

                prt_current_medication.Text = WebHelpers.TextToHtmlTag(Model.current_medication);
                //IV.
                //1.
                prt_vs_temperature.Text = Model.vs_temperature;
                prt_vs_weight.Text = Model.vs_weight;
                prt_vs_height.Text = Model.vs_height;
                prt_vs_BMI.Text = Model.vs_BMI;
                prt_vs_heart_rate.Text = Model.vs_heart_rate;

                prt_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = Model.vs_blood_pressure;
                prt_vs_spO2.Text = Model.vs_spO2;
                //2.
                prt_physical_examination.Text = WebHelpers.TextToHtmlTag(Model.physical_examination);

                prt_laboratory_indications_results.Text = WebHelpers.TextToHtmlTag(Model.laboratory_indications_results);
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                prt_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions);

                prt_treatment_code_ipd.Text
                    = prt_treatment_code_opd.Text
                    = prt_treatment_code_trf.Text
                    = "❏";
                BindingLabel(nameof(Model.treatment_code) + "_" + Model.treatment_code, "☒");

                if (Model.treatment_code == "OPD")
                {
                    prt_medicine.Visible = true;
                    prt_medicine.Text = WebHelpers.TextToHtmlTag(Model.medicine);
                } else if(Model.treatment_code == "TRF")
                {
                    prt_medicine.Visible = true;
                    prt_medicine.Text = WebHelpers.TextToHtmlTag(Model.tranfer);
                }
                else
                {
                    prt_medicine.Visible = false;
                }

                prt_spec_opinion_requested_true.Text
                    = prt_spec_opinion_requested_false.Text
                    = "❏";
                BindingLabel(nameof(Model.spec_opinion_requested) + "_" + Model.spec_opinion_requested, "☒");

                prt_spec_opinion_requested_note_wrapper.Visible = false;
                if (Model.spec_opinion_requested != null)
                {
                    if (Model.spec_opinion_requested)
                    {
                        prt_spec_opinion_requested_note_wrapper.Visible = true;
                        prt_spec_opinion_requested_note.Text = WebHelpers.TextToHtmlTag(Model.spec_opinion_requested_note);
                    }
                }

                prt_specific_education_required.Text = Model.specific_education_required;

                if (Model.bool_next_appointment != null)
                {
                    prt_next_appointment.Text = Model.bool_next_appointment ? WebHelpers.FormatDateTime(Model.date_next_appointment) : Model.txt_next_appointment;
                }

                prt_signature_doctor.Text = signature_name;

                prt_risk_of_malnutrition_true.Text
                    = prt_risk_of_malnutrition_false.Text
                    = prt_nutrition_screening_code_false.Text
                    = prt_nutrition_screening_code_true.Text
                    = "❏";
                prt_nutrition_screening_wrapper.Visible = false;
                if (!string.IsNullOrEmpty(Model.nutrition_screening))
                {
                    var nutrition_screening = NutritionalStatusProvider.ConvertToObject(Model.nutrition_screening);
                    if (NutritionalStatusProvider.IsRiskofMalnutrition(nutrition_screening.total_score))
                    {
                        prt_risk_of_malnutrition_true.Text = "☒";
                        prt_nutrition_screening_wrapper.Visible = true;
                        if (Model.nutrition_screening_code == "N")
                        {
                            prt_nutrition_screening_code_false.Text = "☒";
                            prt_nutrition_screening_desc.Text = Model.nutrition_screening_desc;
                        }
                        else if (Model.nutrition_screening_code == "Y")
                        {
                            prt_nutrition_screening_code_true.Text = "☒";
                        }
                    }
                    else
                    {
                        prt_risk_of_malnutrition_false.Text = "☒";
                    }
                }

                prt_printed_date.Text = DateTime.Now.ToString("dd/MM/yyyy");
                prt_printed_time.Text = DateTime.Now.ToString("HH:mm");

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        private void prt_allergy_binding()
        {
            prt_allergy_note_wrapper.Visible = false;

            Label Control = FindControl("prt_" + nameof(Model.allergy) + "_" + Model.allergy);
            if(Control != null)
            {
                Control.Text = "☒";
                if (prt_allergy_true.Text == "☒")
                {
                    prt_allergy_note_wrapper.Visible = true;
                    prt_allergy_note.Text = WebHelpers.TextToHtmlTag(Model.allergy_note);
                }
            }
        }

        private void LoadBarCode()
        {
            //IBarcodeGenerator barcodeGenerator = new BarcodeGenerator();
            //BarCode.Controls.Clear();
            //BarCode.Controls.Add(barcodeGenerator.Generator(Patient.visible_patient_id));
        }
        #endregion

        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            try
            {
                PatientVisit = new PatientVisitInfo(varPVID, Location);
                dynamic response = VitalSign.Update(varPVID, PatientVisit.visit_type, Location);
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic vs = JsonConvert.DeserializeObject(response.Data);

                    LoadVitalSigns(vs);
                }
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
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

        #region METHODS
        public override void BindingControlToModel()
        {
            try
            {
                Model.asessment_date_time = DataHelpers.ConvertSQLDateTime(dtpk_asessment_date_time.SelectedDate);
                //I.
                Model.chief_complaint = txt_chief_complaint.Value;
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
                Model.other_vaccinations = txt_other_vaccinations.Value;
                Model.not_yet_vaccinations = cb_not_yet_vaccinations_true.Checked;

                Model.family = txt_family.Value;
                Model.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                Model.allergy_note = WebHelpers.GetBool(Model.allergy, txt_allergy_note.Value, null);
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
                //IV.
                Model.laboratory_indications_results = txt_laboratory_indications_results.Value;

                if (rad_nutrition_screening_code_y.Checked)
                {
                    Model.nutrition_screening_code = "Y";
                }
                else if (rad_nutrition_screening_code_n.Checked)
                {
                    Model.nutrition_screening_code = "N";
                    Model.nutrition_screening_desc = txt_nutrition_screening_desc.Value;
                }

                //V.
                Model.initial_diagnosis = txt_initial_diagnosis.Value;
                Model.differential_diagnosis = txt_differential_diagnosis.Value;
                Model.associated_conditions = txt_associated_conditions.Value;

                Model.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", POMR.TREATMENT_CODE);
                Model.treatment_desc = WebHelpers.GetDicDesc(Model.treatment_code, Omr.TREATMENT_CODE);

                //5.
                if (Model.treatment_code == "OPD") { Model.medicine = txt_medicine.Value; }
                else if (Model.treatment_code == "TRF") { Model.tranfer = txt_tranfer.Value; }

                Model.spec_opinion_requested = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_");
                Model.spec_opinion_requested_note = WebHelpers.GetBool(Model.spec_opinion_requested, txt_spec_opinion_requested_note.Value, null);

                Model.specific_education_required = txt_specific_education_required.Value;

                Model.bool_next_appointment = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bool_next_appointment_");

                Model.txt_next_appointment = WebHelpers.GetBool(Model.bool_next_appointment, null, txt_next_appointment.Value);

                Model.date_next_appointment = WebHelpers.GetBool(Model.bool_next_appointment, DataHelpers.ConvertSQLDateTime(dtpk_date_next_appointment.SelectedDate), null);

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
        public override void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "rad_treatment_code_change":
                    rad_treatment_code_change((string)Request["__EVENTARGUMENT"]);
                    break;
                case "risk_of_malnutrition_changed":
                    bool risk_of_malnutrition = bool.Parse(Request["__EVENTARGUMENT"]);

                    if (risk_of_malnutrition)
                    {
                        rad_nutrition_screening_code_y.Checked = true;
                        nutrition_screening_desc_wrapper.Visible = false;
                    }
                    else
                    {
                        rad_nutrition_screening_code_n.Checked = true;
                        nutrition_screening_desc_wrapper.Visible = true;
                    }
                    break;
            }
        }
        private void rad_treatment_code_change(string code)
        {
            WebHelpers.VisibleControl(false, current_medication_field, tranfer_field);
            if(code == null) {
                rad_treatment_code_ipd.Checked = rad_treatment_code_opd.Checked = rad_treatment_code_trf.Checked = false;
                return;
            }
            switch (code.ToUpper())
            {
                case "OPD":
                    WebHelpers.VisibleControl(true, current_medication_field);
                    break;
                case "TRF":
                    WebHelpers.VisibleControl(true, tranfer_field);
                    break;
            }
        }
        #endregion

        #region Validations
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_amend_reason.Text.Length > 3;
        }
        protected void spec_opinion_requested_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_spec_opinion_requested_false.Checked || rad_spec_opinion_requested_true.Checked;
        }
        protected void allergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_allergy_false.Checked || rad_allergy_true.Checked;
        }
        protected void bool_next_appointment_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_bool_next_appointment_false.Checked || rad_bool_next_appointment_true.Checked;
        }
        #endregion

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
        protected void btnUpdateNutritionScreening_Click(object sender, EventArgs e)
        {
            Model = new PomrModel(varDocID, Location, varDocIdLog);
            var result = WebHelpers.GetAPI($"api/emr/nutrition-status/{Location}/{varPVID}");
            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                var data = result.Data;
                JObject resJson = JObject.Parse(data);
                Model.nutrition_screening = resJson["nutritional_status"].ToString();

                if (!string.IsNullOrEmpty(Model.nutrition_screening))
                {
                    var nutrition_screening = NutritionalStatusProvider.ConvertToObject(Model.nutrition_screening);
                    if (NutritionalStatusProvider.IsRiskofMalnutrition(nutrition_screening.total_score))
                    {
                        lbl_risk_of_malnutrition.Text = "Có nguy cơ thiếu dinh dưỡng (≥ 2)/ Risk of malnutrition";
                        nutrition_screening_wrapper.Visible = true;
                        if (Model.nutrition_screening_code == "N")
                        {
                            rad_nutrition_screening_code_n.Checked = true;
                            nutrition_screening_desc_wrapper.Visible = true;
                            txt_nutrition_screening_desc.Value = Model.nutrition_screening_desc;
                        }
                        else if (Model.nutrition_screening_code == "Y")
                        {
                            rad_nutrition_screening_code_y.Checked = true;
                        }
                    }
                    else
                    {
                        lbl_risk_of_malnutrition.Text = "Không có nguy cơ thiếu dinh dưỡng (<2)/ No risk of malnutrition";
                        nutrition_screening_wrapper.Visible = false;
                    }
                }
            }
        }
    }
}
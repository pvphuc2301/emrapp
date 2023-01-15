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

namespace EMR.OPD
{
    public partial class MedRecForVac : EmrPage, IEmrFormModel<MrfvModel>
    {
        public override string form_url { get; set; } = $"OPD/{nameof(MedRecForVac)}";
        public MrfvModel Model { get; set; }
        public override dynamic InitModel() => Model = new MrfvModel(varDocID, Location, varDocIdLog);
        #region Binding Data
        public override void BindingDataFormView()
        {
            LoadBarCode();

            cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = true;
            HideControl(btnVSFreeText);

            #region Patient Information

            #endregion

            #region I. Lý do đến khám/ Chief complaint
            lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complaint);
            #endregion

            #region II. Bệnh sử/ Medical History
            #region 1. Bệnh sử hiện tại/ Current Medical History
            #region 2. Tiền sử bệnh/ Antecedent Medical History
            //• Bản thân/ Personal
            lbl_personal.Text = WebHelpers.TextToHtmlTag(Model.personal);
            //• Gia đình/ Family
            lbl_family.Text = WebHelpers.TextToHtmlTag(Model.family);
            //• Dị ứng/ Allergy
            if (Model.allergy != null)
            {
                lbl_allergy.Text = Model.allergy ? "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.TextToHtmlTag(Model.allergy_text) : "Không/ No";
            }
            #endregion
            lbl_cur_med_history.Text = WebHelpers.TextToHtmlTag(Model.cur_med_history);
            lbl_cur_medications.Text = WebHelpers.TextToHtmlTag(Model.cur_medications);
            lbl_infected_with_covid.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.infected_with_covid));
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + Model.received_1_dose);
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + Model.received_2_dose);
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + Model.received_additional);
            WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + Model.not_yet_vaccinations);
            lbl_other_vaccinations.Text = Model.other_vaccinations;
            #endregion
            #endregion

            #region III. Khám bệnh/ Physical Examination
            #region DẤU HIỆU SINH TỒN/ VITAL SIGNS
            HideControl(btnUpdateVitalSign);
            lbl_vs_temperature.Text = Model.vs_temperature + " °C";
            lbl_vs_weight.Text = Model.vs_weight + " Kg";
            lbl_vs_height.Text = Model.vs_height + " cm";
            lbl_vs_BMI.Text = Model.vs_BMI + " (Kg/m 2)";
            lbl_vs_pulse.Text = Model.vs_pulse + " cm";
            lbl_vs_heart_rate.Text = Model.vs_heart_rate + " /phút (m)";
            lbl_vs_respiratory_rate.Text = Model.vs_respiratory_rate + " /phút (m)";
            lbl_vs_blood_pressure.Text = Model.vs_blood_pressure + " mmHg";
            lbl_vs_spO2.Text = Model.vs_SpO2 + " %";
            #endregion

            #region KHÁM SÀNG LỌC TRƯỚC TIÊM CHỦNG/ SCREENING BEFORE VACCINATION
            lbl_scr_before_vacc_1.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_1);
            lbl_scr_before_vacc_2.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_2);
            lbl_scr_before_vacc_3.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_3);
            lbl_scr_before_vacc_4.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_4);
            lbl_scr_before_vacc_5.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_5);
            lbl_scr_before_vacc_6.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_6);
            lbl_scr_before_vacc_7.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_7);
            lbl_scr_before_vacc_8.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_8);
            #endregion
            #endregion

            #region IV. Chỉ định và kết quả xét nghiệm/ Laboratory indications and results

            //• Loại vắc xin tiêm chủng lần này /Appointed Vaccine
            WebHelpers.LoadDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(Model.appointed_vaccine), Mrfv.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);
            //• Khảo sát bổ sung khác/ Additional investigations
            lbl_additional_investigations.Text = WebHelpers.TextToHtmlTag(Model.additional_investigations);

            #endregion

            #region V. Kết luận/ Conclusion
            //• Chẩn đoán ban đầu/ Initial diagnosis (ICD 10)
            lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
            //• Chẩn đoán phân biệt/ Differential diagnosis (ICD 10)
            lbl_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
            //• Bệnh kèm theo/ Associated conditions
            lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions);
            //• Kế hoạch điều trị/ Treatment
            lbl_treatment_desc.Text = WebHelpers.TextToHtmlTag(Model.treatment_desc);
            //• Yêu cầu ý kiến chuyên khoa/ Specialized opinion requested
            if (Model.spec_opinion_req != null)
            {
                lbl_spec_opinion_req.Text = WebHelpers.GetBool(Model.spec_opinion_req, "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.TextToHtmlTag(Model.spec_opinion_req_text), "Không/ No");
            }
            //• Hướng dẫn cụ thể dành cho bệnh nhân/ Specific education required
            lbl_pecific_edu_req.Text = WebHelpers.TextToHtmlTag(Model.pecific_edu_req);
            //• Hẹn lần khám tới/ Next Appointment
            lbl_next_appointment.Text = WebHelpers.TextToHtmlTag(Model.next_appointment);
            #endregion

            #region VI. Xác nhận của người tiêm chủng /người giám hộ hợp pháp/ Confirmation of patient/ legal guardian
            #endregion
        }
        public override void BindingDataFormEdit()
        {
            try
            {
                btnVSFreeText.Visible = true;
                btnUpdateVitalSign.Visible = true;
                txt_amend_reason.Text = "";
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                txt_cur_med_history.Value = WebHelpers.TextToHtmlTag(Model.cur_med_history);
                txt_cur_medications.Value = WebHelpers.TextToHtmlTag(Model.cur_medications);
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
                txt_other_vaccinations.Value = Model.other_vaccinations;

                txt_family.Value = WebHelpers.TextToHtmlTag(Model.family);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + Model.allergy, "false");
                if (rad_allergy_true.Checked)
                {
                    txt_allergy_note.Value = WebHelpers.TextToHtmlTag(Model.allergy_text);
                }

                //
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
                txt_vs_spO2.Value = Model.vs_SpO2;
                txt_vs_pulse.Value = Model.vs_pulse;

                txt_scr_before_vacc_1.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_1);
                txt_scr_before_vacc_2.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_2);
                txt_scr_before_vacc_3.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_3);
                txt_scr_before_vacc_4.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_4);
                txt_scr_before_vacc_5.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_5);
                txt_scr_before_vacc_6.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_6);
                txt_scr_before_vacc_7.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_7);
                txt_scr_before_vacc_8.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_8);

                ViewState[grid_appointed_vaccine.ID] = WebHelpers.BindingDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(Model.appointed_vaccine), Mrfv.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);

                txt_additional_investigations.Value = WebHelpers.TextToHtmlTag(Model.additional_investigations);
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                txt_differential_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(Model.associated_conditions);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + Model.treatment_code, "opd");

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_" + Model.spec_opinion_req, "false");
                txt_spec_opinion_req_text.Value = WebHelpers.GetBool(Model.spec_opinion_req, WebHelpers.TextToHtmlTag(Model.spec_opinion_req_text), "");

                txt_pecific_edu_req.Value = Model.pecific_edu_req;
                txt_next_appointment.Value = Model.next_appointment;

                //DataObj.Value = JsonConvert.SerializeObject(mrfv);
                //Session["docid"] = mrfv.document_id;
                //WebHelpers.AddScriptFormEdit(Page, mrfv, (string)Session["emp_id"], loc);

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
                prt_received_1_dose_true.Text
                = prt_received_2_dose_true.Text
                = prt_received_additional_true.Text
                = prt_not_yet_vaccinations_true.Text
                = "❏";

                #region Patient Info
                prt_vpid.Text = Patient.visible_patient_id;

                LoadBarCode();

                prt_fullname.Text = Patient.FullName + $" ({Patient.Title})";
                prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth);
                prt_gender.Text = Patient.Gender;
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(PatientVisit.actual_visit_date_time);
                prt_pid.Text = Patient.visible_patient_id;
                #endregion

                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                prt_cur_med_history.Text = WebHelpers.TextToHtmlTag(Model.cur_med_history);
                prt_cur_medications.Text = WebHelpers.TextToHtmlTag(Model.cur_medications);
                prt_personal.Text = WebHelpers.TextToHtmlTag(Model.personal);
                //Update 2.0
                BindingLabel(nameof(Model.received_1_dose) + "_" + Model.received_1_dose, "☒");
                BindingLabel(nameof(Model.received_2_dose) + "_" + Model.received_2_dose, "☒");
                BindingLabel(nameof(Model.received_additional) + "_" + Model.received_additional, "☒");
                BindingLabel(nameof(Model.not_yet_vaccinations) + "_" + Model.not_yet_vaccinations, "☒");
                prt_other_vaccinations.Text = "Tiêm vắc xin khác (ghi rõ)/ <span class=\"en\">Other vaccinations (specify):</span>&nbsp;" + Model.other_vaccinations;

                prt_family.Text = WebHelpers.TextToHtmlTag(Model.family);

                prt_allergy_true.Text
                    = prt_allergy_false.Text
                    = "❏";
                BindingLabel($"{nameof(Model.allergy)}_{Model.allergy}", "☒");
                prt_allergy_text.Text = WebHelpers.TextToHtmlTag(Model.allergy_text);

                prt_vs_temperature.Text = Model.vs_temperature;
                prt_vs_weight.Text = Model.vs_weight;
                prt_vs_height.Text = Model.vs_height;
                prt_vs_BMI.Text = Model.vs_BMI;
                prt_vs_heart_rate.Text = Model.vs_heart_rate;
                prt_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = Model.vs_blood_pressure;
                prt_vs_spO2.Text = Model.vs_SpO2;

                prt_scr_before_vacc_1.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_1);
                prt_scr_before_vacc_2.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_2);
                prt_scr_before_vacc_3.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_3);
                prt_scr_before_vacc_4.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_4);
                prt_scr_before_vacc_5.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_5);
                prt_scr_before_vacc_6.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_6);
                prt_scr_before_vacc_7.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_7);
                prt_scr_before_vacc_8.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_8);

                DataTable appointed_vaccine = WebHelpers.GetJSONToDataTable(Model.appointed_vaccine);

                if (appointed_vaccine != null)
                {
                    foreach (DataRow row in appointed_vaccine.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;

                        //
                        td = new HtmlTableCell();

                        td.InnerHtml = Convert.ToString(row["drug_name"]);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerHtml = row["strength"].ToString();
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerHtml = row["router"].ToString();
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerHtml = row["reason"].ToString();
                        tr.Cells.Add(td);

                        prt_appointed_vaccine.Rows.Add(tr);
                    }
                }

                prt_additional_investigations.Text = WebHelpers.TextToHtmlTag(Model.additional_investigations);
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                prt_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions);

                foreach (var item in MrfvDictionary.TREATMENT_CODE)
                {
                    BindingLabel($"{nameof(Model.treatment_code)}_{item.Key}", "❏");
                }
                BindingLabel($"{nameof(Model.treatment_code)}_{Model.treatment_code}", "☒");
                //
                prt_spec_opinion_req_true.Text
                    = prt_spec_opinion_req_false.Text
                    = "❏";
                BindingLabel($"{nameof(Model.spec_opinion_req)}_{Model.spec_opinion_req}", "☒");
                prt_spec_opinion_req_text.Text = WebHelpers.TextToHtmlTag(Model.spec_opinion_req_text);
                //
                prt_specific_edu_req.Text = WebHelpers.TextToHtmlTag(Model.pecific_edu_req);
                prt_next_appointment.Text = WebHelpers.TextToHtmlTag(Model.next_appointment);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        public override void BindingControlToModel()
        {
            Model.chief_complaint = txt_chief_complaint.Value;
            Model.cur_med_history = txt_cur_med_history.Value;
            Model.cur_medications = txt_cur_medications.Value;
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
            if (rad_allergy_true.Checked)
                Model.allergy_text = txt_allergy_note.Value;

            Model.vs_temperature = txt_vs_temperature.Value;
            Model.vs_heart_rate = txt_vs_heart_rate.Value;
            Model.vs_weight = txt_vs_weight.Value;
            Model.vs_height = txt_vs_height.Value;
            Model.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            Model.vs_BMI = txt_vs_bmi.Value;
            Model.vs_blood_pressure = txt_vs_blood_pressure.Value;
            Model.vs_SpO2 = txt_vs_spO2.Value;
            Model.vs_pulse = txt_vs_pulse.Value;

            Model.scr_before_vacc_1 = txt_scr_before_vacc_1.Value;
            Model.scr_before_vacc_2 = txt_scr_before_vacc_2.Value;
            Model.scr_before_vacc_3 = txt_scr_before_vacc_3.Value;
            Model.scr_before_vacc_4 = txt_scr_before_vacc_4.Value;
            Model.scr_before_vacc_5 = txt_scr_before_vacc_5.Value;
            Model.scr_before_vacc_6 = txt_scr_before_vacc_6.Value;
            Model.scr_before_vacc_7 = txt_scr_before_vacc_7.Value;
            Model.scr_before_vacc_8 = txt_scr_before_vacc_8.Value;

            Model.appointed_vaccine = WebHelpers.GetDataGridView(grid_appointed_vaccine, Mrfv.APPOINTED_VACCINE);

            Model.additional_investigations = txt_additional_investigations.Value;
            Model.initial_diagnosis = txt_initial_diagnosis.Value;
            Model.differential_diagnosis = txt_differential_diagnosis.Value;
            Model.associated_conditions = txt_associated_conditions.Value;

            Model.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", Mrfv.TREATMENT_CODE);
            Model.treatment_desc = WebHelpers.GetDicDesc(Model.treatment_code, Mrfv.TREATMENT_CODE);

            Model.spec_opinion_req = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_");
            if (rad_spec_opinion_req_true.Checked)
                Model.spec_opinion_req_text = txt_spec_opinion_req_text.Value;

            Model.pecific_edu_req = txt_pecific_edu_req.Value;
            Model.next_appointment = txt_next_appointment.Value;

            //if (JsonConvert.SerializeObject(Model) == DataObj.Value)
            //{
            //    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
            //}

            Model.amend_reason = txt_amend_reason.Text;
            //mrfv.user_name = (string)Session["UserID"];

            //dynamic result = mrfv.Update(loc)[0];

            //if (result.Status == System.Net.HttpStatusCode.OK)
            //{
            //    Initial();
            //    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
            //}
        }
        #endregion
        #region Events
        protected void grid_appointed_vaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_appointed_vaccine_add_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState[grid_appointed_vaccine.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_appointed_vaccine.ID], grid_appointed_vaccine, Mrfv.APPOINTED_VACCINE);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
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
        //public void Initial()
        //{
        //    try
        //    {
        //        //???
        //        txt_vs_temperature.Value = Model.vs_temperature;
        //        txt_vs_heart_rate.Value = Model.vs_heart_rate;
        //        txt_vs_weight.Value = Model.vs_weight;
        //        txt_vs_respiratory_rate.Value = Model.vs_respiratory_rate;
        //        txt_vs_height.Value = Model.vs_height;
        //        txt_vs_bmi.Value = Model.vs_BMI;
        //        txt_vs_blood_pressure.Value = Model.vs_blood_pressure;
        //        txt_vs_spO2.Value = Model.vs_SpO2;
        //        txt_vs_pulse.Value = Model.vs_pulse;

        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}
        #endregion
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
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex); 
            }
        }
        public override void PostBackEventHandler()
        {

        }
    }
}
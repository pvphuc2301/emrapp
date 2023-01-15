using EMR.Classes;
using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR.ER
{
    public partial class EmerMedRec : EmrPage, IEmrFormModel<EmrModel>
    {
        public override string form_url { get; set; } = "ER/EmerMedRec";
        public EmrModel Model { get; set; }
        public override dynamic InitModel() {
            Model = new EmrModel(varDocID, Location, varDocIdLog);
            return Model;
        }
        private void discharge_change(string value = "")
        {
            if (value == "clear")
            {
                rad_discharge_True.Checked = rad_discharge_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, discharge_field);
            }
            else
            {
                try
                {
                    bool.TryParse(value, out bool IsChecked);
                    discharge_field.Visible = IsChecked;
                }
                catch  (Exception ex) 
                {
                    Console.WriteLine(ex.Message);
                }
            }

            //WebHelpers.VisibleControl(rad_discharge_True.Checked, discharge_field);
        }
        private void specialist_opinion_change(string value = "")
        {

            if (value == "clear")
            {
                rad_specialist_opinion_True.Checked = rad_specialist_opinion_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, specialist_opinion_field);
            }

            WebHelpers.VisibleControl(rad_specialist_opinion_True.Checked, specialist_opinion_field);
        }
        private void transfer_hospital_change(string value = "")
        {
            if (value == "clear")
            {
                rad_transfer_hospital_True.Checked = rad_transfer_hospital_False.Checked = false;
            }
            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, transfer_hos_field);
            }

            WebHelpers.VisibleControl(rad_transfer_hospital_True.Checked, transfer_hos_field);
        }
        private void emergency_surgery_change(string value = "")
        {
            if (value == "clear")
            {
                rad_emergency_surgery_True.Checked = rad_emergency_surgery_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, emr_sur_field);
            }
            WebHelpers.VisibleControl(rad_emergency_surgery_True.Checked, emr_sur_field);
        }
        private void hos_req_change(string value = "")
        {
            if (value == "clear")
            {
                rad_hospitalisation_required_True.Checked = rad_hospitalisation_required_False.Checked = false;
            }

            if (string.IsNullOrEmpty(value))
            {
                WebHelpers.VisibleControl(false, hos_req_field);
            }

            WebHelpers.VisibleControl(rad_hospitalisation_required_True.Checked, hos_req_field);
        }

        #region Events
        protected void gridTreatment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                    }
                }
            }
        }
        protected void btn_grid_Treatment_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_Treatment.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_Treatment.ID], grid_Treatment, EmergencyMedicalRecord.Treatment);
        }
        protected void grid_Treatment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_progress_note_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_progress_note.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_progress_note.ID], grid_progress_note, EmergencyMedicalRecord.ProgressNote);
        }
        protected void grid_progress_note_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        #endregion

        #region Functions
        protected DateTime? GetDateTime(object value)
        {
            DateTime? dateTime = null;
            DateTime result = WebHelpers.ConvertDateTime(value, out bool isValid, out string datetime);
            if (isValid)
            {
                dateTime = result;
            }
            return dateTime;
        }
        #endregion

        #region Validation
        protected void txt_amend_reason_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_amend_reason.Text);
        }
        protected void chief_complaint_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_chief_complaint_code_E.Checked || rad_chief_complaint_code_L.Checked || rad_chief_complaint_code_N.Checked || rad_chief_complaint_code_R.Checked || rad_chief_complaint_code_U.Checked;
        }
        protected void habits_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_habits_A.Checked || cb_habits_D.Checked || cb_habits_O.Checked || cb_habits_S.Checked;
        }
        protected void required_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_required_code_True.Checked || rad_required_code_False.Checked;
        }
        protected void specialist_opinion_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_specialist_opinion_True.Checked || rad_specialist_opinion_False.Checked;
        }
        protected void discharge_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_discharge_True.Checked || rad_discharge_False.Checked;
        }
        protected void referred_to_OPD_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_referred_to_OPD_True.Checked || rad_referred_to_OPD_False.Checked;
        }
        protected void hos_req_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_hospitalisation_required_True.Checked || rad_hospitalisation_required_False.Checked;
        }
        protected void emergency_surgery_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_emergency_surgery_True.Checked || rad_emergency_surgery_False.Checked;
        }
        protected void transfer_hospital_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_transfer_hospital_True.Checked || rad_transfer_hospital_False.Checked;
        }
        protected void patient_discharge_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_patient_discharge_IMP.Checked || cb_patient_discharge_UNC.Checked || cb_patient_discharge_UNS.Checked;
        }
        protected void chief_complaint_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_chief_complaint.Value);
        }
        protected void history_of_present_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_history_of_present.Value);
        }
        protected void home_medications_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_home_medications.Value);
        }
        protected void allergies_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_allergies.Value);
        }
        protected void relevant_family_history_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_relevant_family_history.Value);
        }
        protected void finding_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_finding.Value);
        }
        protected void investigations_results_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_investigations_results.Value);
            
        }
        protected void initial_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_initial_diagnosis.Value);
        }
        protected void diferential_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_diferential_diagnosis.Value);
        }
        protected void associated_conditions_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_associated_conditions.Value);
        }
        protected void conclusions_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_conclusions.Value);
        }
        protected void prescription_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_prescription.Value);
        }
        protected void specify_care_instructions_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_specify_care_instructions.Value);
        }
        protected void reason_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_reason.Value);
        }
        protected void ward_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_ward.Value);
        }
        protected void pre_operative_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_pre_operative_diagnosis.Value);
        }
        protected void brief_summary_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_brief_summary.Value);
        }
        protected void transfer_hospital_name_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_transfer_hospital_name.Value);
        }
        protected void transfer_hospital_employee_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_transfer_hospital_employee.Value);
        }
        protected void transfer_hospital_phone_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_transfer_hospital_phone.Value);
        }
        protected void reason_for_transfer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_reason_for_transfer.Value);
        }
        protected void dtpk_evaluation_time_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = dtpk_evaluation_time.SelectedDate != null;
        }
        protected void status_before_transfer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_status_before_transfer.Value);
        }
        protected void comfirmed_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_comfirmed_diagnosis.Value);
        }
        protected void dtpk_time_of_leaving_emer_a_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = dtpk_time_of_leaving_emer_a.SelectedDate != null;
        }
        protected void icd_10_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_icd_10.Value);
        }
        protected void past_med_his_surs_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_past_med_his_surs.Value);
        }
        protected void past_med_his_meds_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_past_med_his_meds.Value);
        }
        #endregion

        public override void BindingDataFormEdit()
        {
            try
            {
                txt_amend_reason.Text = "";

                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = false;
                #region Ngày, giờ bắt đầu đánh giá/ Starting date, time of the assessmen
                BindingRadDateTimePicker(dtpk_evaluation_time, Model.evaluation_time);
                #endregion

                #region Lý do đến khám/ Chief complaint
                txt_chief_complaint.Value = Model.chief_complaint;
                BindingInputRadioButton($"{nameof(Model.chief_complaint_code)}_{Model.chief_complaint_code}");
                #endregion

                #region Bệnh Sử/ History of present illness(HPI)
                txt_history_of_present.Value = Model.history_of_present;
                #endregion

                #region Tiền sử bệnh/ Past medical history (PMH)
                txt_past_med_his_meds.Value = Model.past_med_his_meds;
                txt_past_med_his_surs.Value = Model.past_med_his_surs;
                #endregion

                #region Đã từng nhiễm COVID-19 trong vòng 6 tháng qua/ Have been infected with COVID-19 within the last 6 months
                BindingInputRadioButton($"{nameof(Model.infected_with_covid)}_{Model.infected_with_covid}");
                #endregion

                #region Tiền sử tiêm chủng/ Immunization history
                BindingInputCheckBox($"{nameof(Model.received_1_dose)}_{Model.received_1_dose}");
                BindingInputCheckBox($"{nameof(Model.received_2_dose)}_{Model.received_2_dose}");
                BindingInputCheckBox($"{nameof(Model.received_additional)}_{Model.received_additional}");
                BindingInputCheckBox($"{nameof(Model.not_yet_vaccinations)}_{Model.not_yet_vaccinations}");
                txt_other_vaccinations.Value = Model.other_vaccinations;
                #endregion

                #region Thói quen/ Habits
                DataTable habits_tb = EMRHelpers.ConvertToDataTable(Model.habits);
                if (habits_tb != null)
                {
                    BindingInputCheckBox(nameof(Model.habits), habits_tb, "cde");
                }
                txt_habits_other.Value = Model.habits_other;
                #endregion

                #region Thuốc dùng tại nhà/ Home medications
                txt_home_medications.Value = Model.home_medications;
                #endregion

                #region Tiền sử dị ứng/ Allergies
                txt_allergies.Value = Model.allergies;
                #endregion


                #region Tiền sử bệnh người thân/ Relevant family history
                txt_relevant_family_history.Value = Model.relevant_family_history;
                #endregion

                #region Khám lâm sàng liên quan/ Physical examination
                //Kết quả tìm thấy/ Findings (General and Diagnostic support)
                txt_finding.Value = Model.finding;

                //Yêu cầu khám chuyên khoa tâm lý/ Psychological assessment required
                BindingInputRadioButton($"{nameof(Model.required_code)}_{Model.required_code}");
                txt_required_text.Value = Model.required_text;
                #endregion

                //Kết quả khảo sát/ Investigations Results (Labs, Imaging...)
                txt_investigations_results.Value = Model.investigations_results;
                //Chẩn đoán ban đầu/ Initial diagnosis
                txt_initial_diagnosis.Value = Model.initial_diagnosis;
                //Chuẩn đoán xác định/ Diagnosis
                txt_comfirmed_diagnosis.Value = Model.comfirmed_diagnosis;
                //Chẩn đoán phân biệt/ Differential diagnosis
                txt_diferential_diagnosis.Value = Model.diferential_diagnosis;
                //Bệnh kèm theo/ Associated conditions
                txt_associated_conditions.Value = Model.associated_conditions;

                #region Ý kiến của bác sĩ chuyên khoa/ Specialist opinion
                specialist_opinion_change(Convert.ToString(Model.specialist_opinion));
                BindingInputRadioButton($"{nameof(Model.specialist_opinion)}_{Model.specialist_opinion}");
                txt_name_of_specialist.Value = Model.name_of_specialist;
                BindingRadDateTimePicker(dtpk_time_contaced, Model.time_contaced);
                BindingRadDateTimePicker(dtpk_time_provided, Model.time_provided);
                txt_spec_opinion_summarised.Value = Model.spec_opinion_summarised;
                #endregion

                //1. Điều trị tại khoa cấp cứu/ Treatment in Emergency
                ViewState[grid_Treatment.ID] = WebHelpers.BindingDataGridView(grid_Treatment, WebHelpers.GetJSONToDataTable(Model.treatment), EmergencyMedicalRecord.Treatment, btn_grid_Treatment_add);
                //Diễn tiến/ Progress Note
                ViewState[grid_progress_note.ID] = WebHelpers.BindingDataGridView(grid_progress_note, WebHelpers.GetJSONToDataTable(Model.progress_note), EmergencyMedicalRecord.ProgressNote, btn_grid_progress_note_add);
                txt_conclusions.Value = Model.conclusions;
                #region 2. Xuất viện/ Discharge
                BindingInputRadioButton($"{nameof(Model.discharge)}_{Model.discharge}");
                discharge_change(Convert.ToString(Model.discharge));
                txt_prescription.Value = Model.prescription;
                txt_specify_care_instructions.Value = Model.specify_care_instructions;
                BindingRadDateTimePicker(dtpk_discharge_time, Model.discharge_time);
                #endregion

                #region 3. Chuyển sang khám ngoại trú/ Referred to OPD
                BindingInputRadioButton($"{nameof(Model.referred_to_OPD)}_{Model.referred_to_OPD}");
                txt_referred_to_OPD_text.Value = Model.referred_to_OPD_text;
                #endregion

                #region 4. Yêu cầu nhập viện/ Hospitalisation required
                BindingInputRadioButton($"{nameof(Model.hospitalisation_required)}_{Model.hospitalisation_required}");
                txt_reason.Value = Model.reason;
                txt_ward.Value = Model.ward;
                BindingRadDateTimePicker(dtpk_time_of_leaving_emergency, Model.time_of_leaving_emergency);
                hos_req_change(Convert.ToString(Model.hospitalisation_required));
                #endregion

                #region 5. Nếu phẫu thuật cấp cứu/ In case of emergency surgery
                BindingInputRadioButton($"{nameof(Model.emergency_surgery)}_{Model.emergency_surgery}");
                txt_pre_operative_diagnosis.Value = Model.pre_operative_diagnosis;
                txt_brief_summary.Value = Model.brief_summary;
                BindingRadDateTimePicker(dtpk_time_of_leaving_emer_e, Model.time_of_leaving_emer_e);
                emergency_surgery_change(Convert.ToString(Model.emergency_surgery));
                #endregion

                #region 6. Nếu chuyển đến BV khác/ In case of transfer to another hospital
                BindingInputRadioButton($"{nameof(Model.transfer_hospital)}_{Model.transfer_hospital}");
                txt_transfer_hospital_name.Value = Model.transfer_hospital_name;
                txt_transfer_hospital_employee.Value = Model.transfer_hospital_employee;
                txt_transfer_hospital_phone.Value = Model.transfer_hospital_phone;
                txt_reason_for_transfer.Value = Model.reason_for_transfer;
                txt_status_before_transfer.Value = Model.status_before_transfer;
                BindingRadDateTimePicker(dtpk_time_of_leaving_emer_a, Model.time_of_leaving_emer_a);
                transfer_hospital_change(Convert.ToString(Model.transfer_hospital));
                #endregion

                #region Tình trạng của bệnh nhân khi xuất viện/ Patient's Condition at Discharge
                DataTable patient_discharge_dt = EMRHelpers.ConvertToDataTable(Model.patient_discharge);
                if(patient_discharge_dt != null)
                {
                    BindingInputCheckBox(nameof(Model.patient_discharge), patient_discharge_dt, "cde");
                }
                txt_patient_discharge.Value = Model.txt_patient_discharge;
                #endregion

                //Mã ICD-10/ ICD-10 Code(S)
                txt_icd_10.Value = Model.icd_10;

                //DataObj.Value = JsonConvert.SerializeObject(Model);
                Session["docid"] = Model.document_id;
                WebHelpers.AddScriptFormEdit(Page, Model, EmpId, Location);
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
                //WebHelpers.gen_BarCode(Patient.visible_patient_id, BarCode);
                prt_patient_name.Text = Patient.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth);
                prt_gender.Text = Patient.Gender;
                prt_pid.Text = Patient.visible_patient_id;

                #region Ngày, giờ bắt đầu đánh giá / Starting date, time of the assessment
                prt_evaluation_time.Text = WebHelpers.FormatDateTime(Model.evaluation_time, "HH:mm, dd/MM/yyyy");
                #endregion

                #region Lý do đến khám/ Chief complaint/ Reason of consultation
                prt_chief_complaint_code_r.Text
                 = prt_chief_complaint_code_e.Text
                 = prt_chief_complaint_code_u.Text
                 = prt_chief_complaint_code_l.Text
                 = prt_chief_complaint_code_n.Text 
                 = "❏";

                prt_chief_complaint.Text = Model.chief_complaint;
                BindingLabel($"{nameof(Model.chief_complaint_code)}_{Model.chief_complaint_code}", "☒");
                #endregion

                #region Bệnh sử / History of present illness (HPI)
                prt_history_of_present.Text = Model.history_of_present;
                #endregion

                #region Tiền sử bệnh / Past medical history (PMH)
                prt_past_med_his_meds.Text = Model.past_med_his_meds;
                prt_past_med_his_surs.Text = Model.past_med_his_surs;
                #endregion

                #region Đã từng nhiễm COVID-19 trong vòng 6 tháng qua/ Have been infected with COVID-19 within the last 6 months
                prt_infected_with_covid_false.Text
                    = prt_infected_with_covid_true.Text 
                    = "❏";
                BindingLabel($"{nameof(Model.infected_with_covid)}_{Model.infected_with_covid}", "☒");
                #endregion

                #region Tiền sử tiêm chủng/ Immunization history
                    prt_received_1_dose_true.Text
                    = prt_received_2_dose_true.Text
                    = prt_received_additional_true.Text
                    = prt_not_yet_vaccinations_true.Text
                    = "❏";
                BindingLabel($"{nameof(Model.received_1_dose)}_{Model.received_1_dose}", "☒");
                BindingLabel($"{nameof(Model.received_2_dose)}_{Model.received_2_dose}", "☒");
                BindingLabel($"{nameof(Model.received_additional)}_{Model.received_additional}", "☒");
                BindingLabel($"{nameof(Model.not_yet_vaccinations)}_{Model.not_yet_vaccinations}", "☒");
                prt_other_vaccinations.Text = "• Tiêm vắc xin khác (ghi rõ)/ <span class=\"text-primary\">Other vaccinations (specify)</span>: " + Model.other_vaccinations;
                #endregion

                #region Thói quen/ Habits
                prt_habits_a.Text 
                    = prt_habits_d.Text 
                    = prt_habits_s.Text 
                    = "❏";
                DataTable habits = EMRHelpers.ConvertToDataTable(Model.habits);
                if (habits != null)
                {
                    BindingLabel($"{nameof(Model.habits)}", habits, "☒", "cde");
                }
                prt_habits_other.Text = Model.habits_other;
                #endregion

                #region Thuốc dùng tại nhà/ Home medications
                prt_home_medications.Text = Model.home_medications;
                #endregion

                #region Tiền sử dị ứng/ Allergies
                prt_allergies.Text = Model.allergies;
                #endregion

                #region Tiền sử bệnh người thân/ Relevant family history
                prt_relevant_family_history.Text = Model.relevant_family_history;
                #endregion

                #region Khám lâm sàng liên quan/ Physical examination
                //* Kết quả tìm thấy/ Findings (General and Diagnostic support)
                prt_finding.Text = Model.finding;
                //* Yêu cầu khám chuyên khoa tâm lý/ Psychological assessment required
                prt_required_code_false.Text
                    = prt_required_code_true.Text
                    = "❏";
                BindingLabel($"{nameof(Model.required_code)}_{Model.required_code}", "☒");
                prt_required_text.Text = Model.required_text;
                #endregion

                #region Kết quả khảo sát/ Investigations Results (Labs, imaging...)
                prt_investigations_results.Text = Model.investigations_results;
                #endregion

                #region Chẩn đoán sơ bộ/ Initial diagnosis
                prt_initial_diagnosis.Text = Model.initial_diagnosis;
                #endregion

                #region Chẩn đoán phân biệt/ Diferential diagnosis
                prt_diferential_diagnosis.Text = Model.diferential_diagnosis;
                #endregion

                #region Bệnh kèm theo/ Associated conditions
                prt_associated_conditions.Text = Model.associated_conditions;
                #endregion

                #region Chẩn đoán xác định/ Comfirmed Diagnosis
                prt_comfirmed_diagnosis.Text = Model.comfirmed_diagnosis;
                #endregion

                #region Ý kiến của bác sỹ chuyên khoa/ Specialist opinion
                prt_specialist_opinion_false.Text
                    = prt_specialist_opinion_true.Text
                    = "❏";
                HideControl(specialist_opinion_collapse);
                BindingLabel($"{nameof(Model.specialist_opinion)}_{Model.specialist_opinion}", "☒");
                if(Model.specialist_opinion != null && Model.specialist_opinion)
                {
                    ShowControl(specialist_opinion_collapse);
                    prt_name_of_specialist.Text = Model.name_of_specialist;
                    if (Model.time_contaced != null)
                    {
                        prt_time_contaced.Text = Model.time_contaced.ToString("HH:mm");
                    }
                    if (Model.time_provided != null)
                    {
                        prt_time_provided.Text = Model.time_provided.ToString("HH:mm");
                    }
                    prt_spec_opinion_summarised.Text = Model.spec_opinion_summarised;
                }
                #endregion

                #region 1. Treatment in Emergency/Điều trị tại khoa cấp cứu
                if (Model.treatment != null)
                {
                    DataTable treatment = EMRHelpers.ConvertToDataTable(Model.treatment);
                    if (treatment != null)
                    {
                        foreach (DataRow row in treatment.Rows)
                        {
                            HtmlTableRow tr = new HtmlTableRow();
                            HtmlTableCell td;
                            HtmlGenericControl p;
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = WebHelpers.FormatDateTime(Convert.ToString(row["time"]), "dd/MM/yyyy HH:mm") };
                            td.Controls.Add(p);
                            tr.Cells.Add(td);
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["medication"]) };
                            td.Controls.Add(p);
                            tr.Cells.Add(td);
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["dose"]) };
                            td.Controls.Add(p);
                            td.Align = "Center";
                            tr.Cells.Add(td);
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["route"]) };
                            td.Controls.Add(p);
                            td.Align = "Center";

                            tr.Cells.Add(td);
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["comment"]) };
                            td.Controls.Add(p);
                            tr.Cells.Add(td);

                            prt_treatment.Rows.Add(tr);
                        }
                    }
                }
                #endregion

                #region Progress Note
                if (Model.progress_note != null)
                {
                    DataTable progress_note = EMRHelpers.ConvertToDataTable(Model.progress_note);
                    if (progress_note != null)
                    {
                        foreach (DataRow row in progress_note.Rows)
                        {
                            HtmlTableRow tr = new HtmlTableRow();
                            HtmlTableCell td;
                            HtmlGenericControl p;
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = WebHelpers.FormatDateTime(Convert.ToString(row["time"]), "dd/MM/yyyy HH:mm") };
                            td.Controls.Add(p);
                            tr.Cells.Add(td);
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["progress"]) };
                            td.Controls.Add(p);
                            tr.Cells.Add(td);
                            //
                            td = new HtmlTableCell();
                            p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["appropriate_order"]) };
                            td.Controls.Add(p);
                            td.Align = "Center";
                            tr.Cells.Add(td);

                            prt_progress_note.Rows.Add(tr);
                        }
                    }
                }
                prt_conclusions.Text = Model.conclusions;
                #endregion

                #region 2. Xuất viện/ Discharge
                prt_discharge_false.Text
                    = prt_discharge_true.Text
                    = "❏";
                HideControl(div_discharge_field);
                BindingLabel($"{nameof(Model.discharge)}_{Model.discharge}", "☒");
                if(Model.discharge != null && Model.discharge)
                {
                    ShowControl(div_discharge_field);
                    prt_prescription.Text = Model.prescription;
                    prt_specify_care_instructions.Text = Model.specify_care_instructions;
                    if (Model.discharge_time != null)
                    {
                        prt_discharge_time.Text = WebHelpers.FormatDateTime(Model.discharge_time, "HH:mm");
                    }
                }
                #endregion

                #region 3. Khám ngoại trú/Referred to OPD
                prt_referred_to_opd_false.Text
                    = prt_referred_to_opd_true.Text
                    = "❏";
                BindingLabel($"{nameof(Model.referred_to_OPD)}_{Model.referred_to_OPD}", "☒");
                prt_referred_to_opd_text.Text = Model.referred_to_OPD_text;
                #endregion

                #region 4. Yêu cầu nhập viện/ Hospitalisation required
                prt_hospitalisation_required_false.Text
                    = prt_hospitalisation_required_true.Text
                    = "❏";
                HideControl(div_hos_req_field);
                BindingLabel($"{nameof(Model.hospitalisation_required)}_{Model.hospitalisation_required}", "☒");
                if(Model.hospitalisation_required != null && Model.hospitalisation_required)
                {
                    ShowControl(div_hos_req_field);
                    prt_reason.Text = Model.reason;
                    prt_ward.Text = Model.ward;
                    if (Model.time_of_leaving_emergency != null)
                    {
                        prt_time_of_leaving_emergency.Text = WebHelpers.FormatDateTime(Model.time_of_leaving_emergency, "HH:mm");
                    }
                }
                #endregion

                #region 5. Nếu phẫu thuật cấp cứu/ In case of emergency surgery
                prt_emergency_surgery_false.Text
                    = prt_emergency_surgery_true.Text
                    = "❏";
                HideControl(div_emr_sur_field);
                BindingLabel($"{nameof(Model.emergency_surgery)}_{Model.emergency_surgery}", "☒");
                if(Model.emergency_surgery != null && Model.emergency_surgery)
                {
                    ShowControl(div_emr_sur_field);
                    prt_preoperative_diagnosis.Text = Model.pre_operative_diagnosis;
                    prt_brief_summary.Text = Model.pre_operative_diagnosis;

                    if (Model.time_of_leaving_emer_e != null)
                    {
                        prt_time_of_leaving_emer_e.Text = WebHelpers.FormatDateTime(Model.time_of_leaving_emer_e, "HH:mm");
                    }
                }
                #endregion

                #region 6. Nếu chuyển đến BV khác/ In case of transfer to another hospital
                prt_transfer_hospital_false.Text
                    = prt_transfer_hospital_true.Text
                    = "❏";
                HideControl(div_transfer_hos_field);
                BindingLabel($"{nameof(Model.transfer_hospital)}_{Model.transfer_hospital}", "☒");
                if(Model.transfer_hospital != null && Model.transfer_hospital)
                {
                    ShowControl(div_transfer_hos_field);
                    prt_transfer_hospital_name.Text = Model.transfer_hospital_name;
                    prt_transfer_hospital_employee.Text = Model.transfer_hospital_employee;
                    prt_transfer_hospital_phone.Text = Model.transfer_hospital_phone;
                    prt_reason_for_transfer.Text = Model.reason_for_transfer;
                    prt_status_before_transfer.Text = Model.status_before_transfer;
                    if (Model.time_of_leaving_emer_a != null)
                    {
                        prt_time_of_leaving_emer_a.Text = WebHelpers.FormatDateTime(Model.time_of_leaving_emer_a, "HH:mm");
                    }
                }
                #endregion

                #region Tình trạng bệnh nhân khi rời khoa Cấp Cứu/ Patient's Condition at Discharge from Emergency
                prt_patient_discharge_imp.Text 
                    = prt_patient_discharge_unc.Text 
                    = prt_patient_discharge_uns.Text 
                    = "❏";
                DataTable patient_discharge = EMRHelpers.ConvertToDataTable(Model.patient_discharge);
                if(patient_discharge != null)
                {
                    BindingLabel(nameof(Model.patient_discharge), patient_discharge, "☒", "cde");
                }
                prt_patient_discharge.Text = Model.txt_patient_discharge;
                #endregion

                #region Mã ICD-10/ ICD-10 Code(S)
                prt_icd_10.Text = Model.icd_10;
                #endregion

                try
                {
                    prt_printed_datetime.Text = string.Format("Ngày/<span class=\"en\">Date</span> {0}, Giờ/<span class=\"en\">Time</span> {1}", DateTime.Now.ToString("dd/MM/yyyy"), DateTime.Now.ToString("HH:mm"));
                } 
                catch(Exception ex)
                {

                }
                //DateTime signature_date = (DateTime)Session["signature_date"];
                //string signature_doctor = (string)Session["signature_doctor"];

                //if(signature_date != null)
                //{
                //    lbl_date.Text = signature_date.ToString("dd");
                //    lbl_month.Text = signature_date.ToString("MM");
                //    lbl_year.Text = signature_date.ToString("yyyy");
                //}

                //lbl_created_name_l.Text = signature_doctor;
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
                #region Ngày, giờ bắt đầu đánh giá/ Starting date, time of the assessmen
                lbl_evaluation_time.Text = WebHelpers.FormatDateTime(Model.evaluation_time, "dd-MMM-yyyy HH:mm");
                #endregion

                #region Lý do đến khám/ Chief complaint
                lbl_chief_complaint.Text = WebHelpers.FormatString(Model.chief_complaint);
                lbl_chief_complaint_desc.Text = WebHelpers.FormatString(Model.chief_complaint_desc);
                #endregion

                #region Bệnh Sử/ History of present illness(HPI)
                lbl_history_of_present.Text = WebHelpers.FormatString(Model.history_of_present);
                #endregion

                #region Tiền sử bệnh/ Past medical history (PMH)
                lbl_past_med_his_meds.Text = WebHelpers.FormatString(Model.past_med_his_meds);
                lbl_past_med_his_surs.Text = WebHelpers.FormatString(Model.past_med_his_surs);
                #endregion

                #region Đã từng nhiễm COVID-19 trong vòng 6 tháng qua/ Have been infected with COVID-19 within the last 6 months
                lbl_infected_with_covid.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.infected_with_covid));
                #endregion

                #region Tiền sử tiêm chủng/ Immunization history
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = true;
                BindingInputCheckBox($"{nameof(Model.received_1_dose)}_{Model.received_1_dose}");
                BindingInputCheckBox($"{nameof(Model.received_2_dose)}_{Model.received_2_dose}");
                BindingInputCheckBox($"{nameof(Model.received_additional)}_{Model.received_additional}");
                BindingInputCheckBox($"{nameof(Model.not_yet_vaccinations)}_{Model.not_yet_vaccinations}");
                lbl_other_vaccinations.Text = Model.other_vaccinations;
                #endregion

                #region Thói quen/ Habits
                DataTable habits_tb = EMRHelpers.ConvertToDataTable(Model.habits);
                if(habits_tb != null)
                {
                    //lbl_habits.Text = WebHelpers.FormatString(DisplayCheckBox(habits_tb));
                    lbl_habits.Text = ConcatCheckBoxAsString(habits_tb, (KeyValuePair<string, object> dictionary) => {
                        if (Convert.ToString(dictionary.Key) == "O") return dictionary.Value + ": " + Model.habits_other;
                        return dictionary.Value;
                    }, "cde");
                }

                //lbl_habits.Text += WebHelpers.FormatString(Model.habits_other);
                #endregion

                #region Thuốc dùng tại nhà/ Home medications
                lbl_home_medications.Text = WebHelpers.FormatString(Model.home_medications);
                #endregion

                #region Tiền sử dị ứng/ Allergies
                lbl_allergies.Text = WebHelpers.FormatString(Model.allergies);
                #endregion

                #region Tiền sử bệnh người thân/ Relevant family history
                lbl_relevant_family_history.Text = WebHelpers.FormatString(Model.relevant_family_history);
                #endregion

                #region Khám lâm sàng liên quan/ Physical examination
                lbl_finding.Text = WebHelpers.FormatString(Model.finding);

                lbl_required_code.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.required_code, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(Model.required_text)));
                #endregion

                #region Kết quả khảo sát/ Investigations Results (Labs, Imaging...)
                lbl_investigations_results.Text = WebHelpers.FormatString(Model.investigations_results);
                #endregion

                #region Chẩn đoán ban đầu/ Initial diagnosis
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(Model.initial_diagnosis);
                #endregion

                #region Chẩn đoán xác định/ Diagnosis
                lbl_comfirmed_diagnosis.Text = WebHelpers.FormatString(Model.comfirmed_diagnosis);
                #endregion

                #region Chẩn đoán phân biệt/ Differential diagnosis
                lbl_diferential_diagnosis.Text = WebHelpers.FormatString(Model.diferential_diagnosis);
                #endregion

                #region Bệnh kèm theo/ Associated conditions
                lbl_associated_conditions.Text = WebHelpers.FormatString(Model.associated_conditions);
                #endregion

                #region Ý kiến của bác sĩ chuyên khoa/ Specialist opinion
                lbl_specialist_opinion.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.specialist_opinion));
                if(Model.specialist_opinion != null)
                {
                    rad_specialist_opinion_True.Checked = Model.specialist_opinion;
                }
                specialist_opinion_change(Convert.ToString(Model.specialist_opinion));

                lbl_name_of_specialist.Text = WebHelpers.FormatString(Model.name_of_specialist);
                lbl_time_contaced.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.time_contaced));
                lbl_time_provided.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.time_provided));
                lbl_spec_opinion_summarised.Text = WebHelpers.FormatString(Model.spec_opinion_summarised);
                #endregion

                //Kế hoạch chăm sóc/ Care Plan
                #region 1. Điều trị tại khoa cấp cứu/ Treatment in Emergency
                HideControl(btn_grid_Treatment_add, btn_grid_progress_note_add);
                DataTable dtTreatment = EMRHelpers.ConvertToDataTable(Model.treatment);
                if(dtTreatment != null)
                {
                    WebHelpers.LoadDataGridView(grid_Treatment, dtTreatment, Iina.SKIN_ANNO, btn_grid_Treatment_add);
                }
                DataTable dtProgressNote = EMRHelpers.ConvertToDataTable(Model.progress_note);
                if(dtProgressNote != null)
                {
                    WebHelpers.LoadDataGridView(grid_progress_note, dtProgressNote, Iina.SKIN_ANNO, btn_grid_progress_note_add);
                }
                lbl_conclusions.Text = WebHelpers.FormatString(Model.conclusions);
                #endregion

                #region 2. Xuất viện/ Discharge
                discharge_change(Convert.ToString(Model.discharge));
                lbl_discharge.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.discharge));
                lbl_prescription.Text = WebHelpers.FormatString(Model.prescription);
                lbl_specify_care_instructions.Text = WebHelpers.FormatString(Model.specify_care_instructions);
                lbl_discharge_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.discharge_time, "dd-MMM-yyyy HH:mm"));
                #endregion

                #region 3. Chuyển sang khám ngoại trú/ Referred to OPD
                lbl_referred_to_OPD.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.referred_to_OPD, "Yes,specify/ Có, ghi rõ" + "<br/>" + WebHelpers.FormatString(Model.referred_to_OPD_text)));
                #endregion

                #region 4. Yêu cầu nhập viện/ Hospitalisation required
                if (Model.hospitalisation_required != null)
                {
                    rad_hospitalisation_required_True.Checked = Model.hospitalisation_required;
                }
                hos_req_change(Convert.ToString(Model.hospitalisation_required));
                lbl_hospitalisation_required.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.hospitalisation_required));
                lbl_reason.Text = WebHelpers.FormatString(Model.reason);
                lbl_ward.Text = WebHelpers.FormatString(Model.ward);
                lbl_time_of_leaving_emergency.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.time_of_leaving_emergency, "dd-MMM-yyyy HH:mm"));
                #endregion

                #region 5. Nếu phẫu thuật cấp cứu/ In case of emergency surgery
                if (Model.emergency_surgery != null)
                {
                    rad_emergency_surgery_True.Checked = Model.emergency_surgery;
                }

                emergency_surgery_change(Convert.ToString(Model.emergency_surgery));
                lbl_emergency_surgery.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.emergency_surgery));
                lbl_pre_operative_diagnosis.Text = WebHelpers.FormatString(Model.pre_operative_diagnosis);
                lbl_brief_summary.Text = WebHelpers.FormatString(Model.brief_summary);
                lbl_time_of_leaving_emer_e.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.time_of_leaving_emer_e, "dd-MMM-yyyy HH:mm"));
                #endregion

                #region 6. Nếu chuyển đến BV khác/ In case of transfer to another hospital
                if (Model.transfer_hospital != null)
                {
                    rad_transfer_hospital_True.Checked = Model.transfer_hospital;
                }

                transfer_hospital_change(Convert.ToString(Model.transfer_hospital));
                lbl_transfer_hospital_name.Text = WebHelpers.FormatString(Model.transfer_hospital_name);
                lbl_transfer_hospital_employee.Text = WebHelpers.FormatString(Model.transfer_hospital_employee);
                lbl_transfer_hospital_phone.Text = WebHelpers.FormatString(Model.transfer_hospital_phone);
                lbl_transfer_hospital.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.transfer_hospital));
                lbl_reason_for_transfer.Text = WebHelpers.FormatString(Model.reason_for_transfer);
                lbl_status_before_transfer.Text = WebHelpers.FormatString(Model.status_before_transfer);
                lbl_time_of_leaving_emer_a.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.time_of_leaving_emer_a, "dd-MMM-yyyy HH:mm"));
                #endregion

                #region Tình trạng của bệnh nhân khi xuất viện/ Patient's Condition at Discharge
                DataTable patient_discharge = EMRHelpers.ConvertToDataTable(Model.patient_discharge);
                if(patient_discharge != null)
                {
                    lbl_patient_discharge.Text = WebHelpers.FormatString(DisplayCheckBox(patient_discharge));
                }
                lbl_txt_patient_discharge.Text = WebHelpers.FormatString(Model.txt_patient_discharge);
                #endregion

                #region Mã ICD-10/ ICD-10 Code(S)
                lbl_icd_10.Text = WebHelpers.FormatString(Model.icd_10);
                #endregion
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingControlToModel() 
        {
            #region Ngày, giờ bắt đầu đánh giá/ Starting date, time of the assessmen
            Model.evaluation_time = DataHelpers.ConvertSQLDateTime(dtpk_evaluation_time.SelectedDate);
            #endregion

            #region Lý do đến khám/ Chief complaint
            Model.chief_complaint = txt_chief_complaint.Value;
            Model.chief_complaint_code = FindHtmlInputRadioButton(nameof(Model.chief_complaint_code), fEmrDictionary.CHIEF_COMPLAINT_CODE);
            Model.chief_complaint_desc = WebHelpers.GetDicDesc(Model.chief_complaint_code, fEmrDictionary.CHIEF_COMPLAINT_CODE);
            //Model.chief_complaint_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_chief_complaint_code_", EmergencyMedicalRecord.ChiefComplaintCode);
            //Model.chief_complaint_desc = WebHelpers.GetDicDesc(Model.chief_complaint_code, EmergencyMedicalRecord.ChiefComplaintCode);
            #endregion

            #region Bệnh Sử/ History of present illness(HPI)
            Model.history_of_present = txt_history_of_present.Value;
            #endregion

            #region Tiền sử bệnh/ Past medical history (PMH)
            //Nội/ Meds
            Model.past_med_his_meds = txt_past_med_his_meds.Value;
            //Ngoại/ Surgical
            Model.past_med_his_surs = txt_past_med_his_surs.Value;
            #endregion

            #region Đã từng nhiễm COVID-19 trong vòng 6 tháng qua/ Have been infected with COVID-19 within the last 6 months
            Model.infected_with_covid = FindHtmlInputRadioButton(nameof(Model.infected_with_covid)); // WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_");
            //Tiền sử tiêm chủng/ Immunization history
            Model.received_1_dose = cb_received_1_dose_true.Checked;
            Model.received_2_dose = cb_received_2_dose_true.Checked;
            Model.received_additional = cb_received_additional_true.Checked;
            Model.not_yet_vaccinations = cb_not_yet_vaccinations_true.Checked;
            Model.other_vaccinations = txt_other_vaccinations.Value;
            #endregion

            #region Thói quen/ Habits
            string habits_other = null;
            Model.habits = FindHtmlInputCheckBoxAsString(nameof(Model.habits), fEmrDictionary.HABITS, (KeyValuePair<string, object> dictionary) => {
                if (Convert.ToString(dictionary.Key) == "O") {
                    habits_other = txt_habits_other.Value;
                }
                return null;
            }, "cde");
            Model.habits_other = habits_other;
            #endregion

            #region Thuốc dùng tại nhà/ Home medications
            Model.home_medications = txt_home_medications.Value;
            #endregion

            #region Tiền sử dị ứng/ Allergies
            Model.allergies = txt_allergies.Value;
            #endregion

            #region Tiền sử bệnh người thân/ Relevant family history
            Model.relevant_family_history = txt_relevant_family_history.Value;
            #endregion

            //Khám lâm sàng liên quan/ Physical examination
            #region • Kết quả tìm thấy/ Findings (General and Diagnostic support)
            Model.finding = txt_finding.Value;
            #endregion

            Model.required_code = FindHtmlInputRadioButton(nameof(Model.required_code));
            Model.required_text = EMRHelpers.ConvertBooleanToString(Model.required_code, txt_required_text.Value, null);

            Model.investigations_results = txt_investigations_results.Value;
            Model.initial_diagnosis = txt_initial_diagnosis.Value;
            Model.diferential_diagnosis = txt_diferential_diagnosis.Value;
            Model.associated_conditions = txt_associated_conditions.Value;
            Model.comfirmed_diagnosis = txt_comfirmed_diagnosis.Value;

            if (rad_specialist_opinion_True.Checked)
            {
                Model.specialist_opinion = true;
                Model.name_of_specialist = txt_name_of_specialist.Value;
                Model.time_contaced = DataHelpers.ConvertSQLDateTime(dtpk_time_contaced.SelectedDate);
                Model.time_provided = DataHelpers.ConvertSQLDateTime(dtpk_time_provided.SelectedDate);
                Model.spec_opinion_summarised = txt_spec_opinion_summarised.Value;
            }
            else
            {
                Model.specialist_opinion = false;
                Model.name_of_specialist = "";
                Model.time_contaced = null;
                Model.time_provided = null;
                Model.spec_opinion_summarised = "";
            }

            #region treatment
            DataTable treatment = RetrieveGridViewData(grid_Treatment, fEmrDictionary.TREATMENT);
            string treatment_result = null;
            if (treatment != null)
            {
                treatment_result = JsonConvert.SerializeObject(treatment);
            }
            Model.treatment = treatment_result;
            #endregion

            #region progress_note
            DataTable Progress_note_tb = new DataTable();
            foreach (KeyValuePair<string, string> col in EmergencyMedicalRecord.ProgressNote)
            {
                Progress_note_tb.Columns.Add(col.Key);
            }
            DataTable progress_note = RetrieveGridViewData(grid_progress_note, fEmrDictionary.PROGRESS_NOTE);
            string progress_note_result = null;
            if (progress_note != null)
            {
                progress_note_result = JsonConvert.SerializeObject(progress_note);
            }
            Model.progress_note = progress_note_result;

            #endregion

            Model.conclusions = txt_conclusions.Value;

            if (rad_discharge_True.Checked)
            {
                Model.discharge = true;
                Model.prescription = txt_prescription.Value;
                Model.specify_care_instructions = txt_specify_care_instructions.Value;
                Model.discharge_time = DataHelpers.ConvertSQLDateTime(dtpk_discharge_time.SelectedDate);
            }
            else
            {
                Model.discharge = false;
                Model.prescription = null;
                Model.specify_care_instructions = null;
                Model.discharge_time = null;
            }

            if (rad_referred_to_OPD_True.Checked)
            {
                Model.referred_to_OPD = true;
                Model.referred_to_OPD_text = txt_referred_to_OPD_text.Value;
            }
            else
            {
                Model.referred_to_OPD = false;
                Model.referred_to_OPD_text = null;
            }

            if (rad_hospitalisation_required_True.Checked)
            {
                Model.hospitalisation_required = true;
                Model.reason = txt_reason.Value;
                Model.ward = txt_ward.Value;
                Model.time_of_leaving_emergency = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emergency.SelectedDate);
            }
            else
            {
                Model.hospitalisation_required = false;
                Model.reason = null;
                Model.ward = null;
                Model.time_of_leaving_emergency = null;
            }

            if (rad_emergency_surgery_True.Checked)
            {
                Model.emergency_surgery = true;
                Model.pre_operative_diagnosis = txt_pre_operative_diagnosis.Value;
                Model.brief_summary = txt_brief_summary.Value;
                Model.time_of_leaving_emer_e = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emer_e.SelectedDate);
            }
            else
            {
                Model.emergency_surgery = false;
                Model.pre_operative_diagnosis = null;
                Model.brief_summary = null;
                Model.time_of_leaving_emer_e = null;
            }
            #region 6. Nếu chuyển đến BV khác/ In case of transfer to another hospital
            if (rad_transfer_hospital_True.Checked)
            {
                Model.transfer_hospital = true;
                Model.reason_for_transfer = txt_reason_for_transfer.Value;
                Model.transfer_hospital_name = txt_transfer_hospital_name.Value;
                Model.transfer_hospital_employee = txt_transfer_hospital_employee.Value;
                Model.transfer_hospital_phone = txt_transfer_hospital_phone.Value;
                Model.status_before_transfer = txt_status_before_transfer.Value;
                Model.time_of_leaving_emer_a = DataHelpers.ConvertSQLDateTime(dtpk_time_of_leaving_emer_a.SelectedDate);
            }
            else
            {
                Model.transfer_hospital = false;
                Model.reason_for_transfer = null;
                Model.transfer_hospital_name = null;
                Model.transfer_hospital_employee = null;
                Model.transfer_hospital_phone = null;
                Model.status_before_transfer = null;
                Model.time_of_leaving_emer_a = null;
            }
            #endregion

            #region Tình trạng của bệnh nhân khi xuất viện/ Patient's Condition at Discharge
            Model.patient_discharge = FindHtmlInputCheckBoxAsString(nameof(Model.patient_discharge), fEmrDictionary.PATIENT_DISCHARGE, "cde");
            Model.txt_patient_discharge = txt_patient_discharge.Value;
            #endregion

            //Mã ICD-10/ ICD-10 Code(S)
            Model.icd_10 = txt_icd_10.Value;

            if (JsonConvert.SerializeObject(Model) == DataObj.Value)
            {
                WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
            }

            Model.amend_reason = txt_amend_reason.Text;
        }
        public override void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "hos_req_change":
                    hos_req_change(Request["__EVENTARGUMENT"]);
                    break;
                case "emergency_surgery_change":
                    emergency_surgery_change(Request["__EVENTARGUMENT"]);
                    break;
                case "transfer_hospital_change":
                    transfer_hospital_change(Request["__EVENTARGUMENT"]);
                    break;
                case "specialist_opinion_change":
                    specialist_opinion_change(Request["__EVENTARGUMENT"]);
                    break;
                case "discharge_change":
                    discharge_change(Request["__EVENTARGUMENT"]);
                    break;
            }
        }
        
    }
}
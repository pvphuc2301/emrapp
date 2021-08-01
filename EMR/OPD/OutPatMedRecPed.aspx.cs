﻿using Newtonsoft.Json;
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
    public partial class PediatricOutpatientMedicalRecord : System.Web.UI.Page
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

        #region Binding Data
        private void BindingDataForm(POMR pomr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(pomr);
            }
            else
            {
                BindingDataFormView(pomr);
            }
        }
        private void BindingDataFormEdit(POMR pomr)
        {
            try {
                
                txt_amend_reason.Text = "";

                // I. Lý do đến khám/ Chief complaint:
                txt_chief_complaint.Value = pomr.chief_complaint;

                // II. Bệnh sử/ Medical History:
                // 1.Bệnh sử hiện tại / Current Medical History:
                txt_medical_history.Value = pomr.medical_history;

                txt_current_medication.Value = pomr.current_medication;

                // 2.Tiền sử bệnh/ Antecedent Medical History:
                txt_personal.Value = pomr.personal;
                txt_family.Value = pomr.family;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + pomr.allergy);
                txt_allergy_note.Value = WebHelpers.GetBool(pomr.allergy, pomr.allergy_note, "");


                // III.Khám bệnh/ Physical Examination:
                // DẤU HIỆU SINH TỒN/ VITAL SIGNS:

                WebHelpers.VisibleControl(true, btnUpdateVitalSign);
                vs_temperature.Text = pomr.vs_temperature;
                vs_heart_rate.Text = pomr.vs_heart_rate;
                vs_weight.Text = pomr.vs_weight;
                vs_respiratory_rate.Text = pomr.vs_respiratory_rate;
                vs_height.Text = pomr.vs_height;
                vs_blood_pressure.Text = pomr.vs_blood_pressure;
                vs_bmi.Text = pomr.vs_BMI;
                vs_spo2.Text = pomr.vs_spO2;
                vs_pulse.Text = pomr.vs_pulse;

                txt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(pomr.physical_examination);

                txt_laboratory_indications_results.Value = pomr.laboratory_indications_results;
                // V.Kết luận/ Conclusion:
                txt_initial_diagnosis.Value = pomr.initial_diagnosis;
                txt_differential_diagnosis.Value = pomr.differential_diagnosis;
                txt_associated_conditions.Value = pomr.associated_conditions;

                // 5.Current medications
                //Set default value
                if (string.IsNullOrEmpty(pomr.treatment_code)) { pomr.treatment_code = "OPD"; }
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + pomr.treatment_code);

                rad_treatment_code_change(pomr.treatment_code);

                txt_medicine.Value = pomr.medicine;
                txt_tranfer.Value = pomr.tranfer;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_" + pomr.spec_opinion_requested);

                if (pomr.spec_opinion_requested == null) { rad_spec_opinion_requested_false.Checked = true; }

                txt_spec_opinion_requested_note.Value = WebHelpers.GetBool(pomr.spec_opinion_requested, pomr.spec_opinion_requested_note, "");

                txt_specific_education_required.Value = pomr.specific_education_required;

                if(pomr.bool_next_appointment != null)
                {
                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bool_next_appointment_" + pomr.bool_next_appointment);
                    if (pomr.bool_next_appointment)
                    {
                        WebHelpers.BindDateTimePicker(dtpk_date_next_appointment, pomr.date_next_appointment);
                    }
                    else
                    {
                        txt_next_appointment.Value = pomr.txt_next_appointment;
                    }
                }
                DataObj.Value = JsonConvert.SerializeObject(pomr);

                Session["docid"] = pomr.document_id;
                WebHelpers.AddScriptFormEdit(Page, pomr, (string)Session["emp_id"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(POMR pomr)
        {
            try
            {
                //1
                lbl_chief_complaint.Text = WebHelpers.FormatString(pomr.chief_complaint);
                lbl_current_medication.Text = WebHelpers.FormatString(pomr.current_medication);
                //2
                lbl_personal.Text = WebHelpers.FormatString(pomr.personal);
            
                lbl_medical_history.Text = WebHelpers.FormatString(pomr.medical_history);

                lbl_allergy.Text = WebHelpers.FormatString(WebHelpers.GetBool(pomr.allergy, "Có, ghi rõ/ Yes, specify: " + pomr.allergy_note));

                lbl_family.Text = WebHelpers.FormatString(pomr.family);
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);
                vs_temperature.Text = WebHelpers.FormatString(pomr.vs_temperature);
                vs_weight.Text = WebHelpers.FormatString(pomr.vs_weight);
                vs_height.Text = WebHelpers.FormatString(pomr.vs_height);
                vs_bmi.Text = WebHelpers.FormatString(pomr.vs_BMI);
                vs_pulse.Text = WebHelpers.FormatString(pomr.vs_pulse);
                vs_heart_rate.Text = WebHelpers.FormatString(pomr.vs_heart_rate);
                vs_respiratory_rate.Text = WebHelpers.FormatString(pomr.vs_respiratory_rate);
                vs_blood_pressure.Text = WebHelpers.FormatString(pomr.vs_blood_pressure);
                vs_spo2.Text = WebHelpers.FormatString(pomr.vs_spO2);

                lbl_physical_examination.Text = DataHelpers.FormatPhysicalExamination(pomr.physical_examination);

                rad_treatment_code_change(pomr.treatment_code);
                if (pomr.treatment_code == "OPD")
                {
                    lbl_medicine.Text = WebHelpers.FormatString(pomr.medicine);
                } else if (pomr.treatment_code == "TRF")
                {
                    lbl_tranfer.Text = WebHelpers.FormatString(pomr.tranfer);
                }
                
                lbl_laboratory_indications_results.Text = WebHelpers.FormatString(pomr.laboratory_indications_results);
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(pomr.initial_diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.FormatString(pomr.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.FormatString(pomr.associated_conditions);
                lbl_treatment_code.Text = WebHelpers.FormatString(pomr.treatment_desc);

                lbl_spec_opinion_requested.Text = WebHelpers.FormatString(WebHelpers.GetBool(pomr.spec_opinion_requested, "Có, ghi rõ/ Yes, specify: " + pomr.spec_opinion_requested_note));
                
                lbl_specific_education_required.Text = WebHelpers.FormatString(pomr.specific_education_required);

                lbl_date_next_appointment.Text = WebHelpers.FormatString(WebHelpers.GetBool(pomr.bool_next_appointment, "Calendar<br>" + WebHelpers.FormatDateTime(pomr.date_next_appointment), "Text<br>" + pomr.txt_next_appointment));

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormPrint(POMR pomr)
        {
            try { 
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();
                prt_fullname.Text = patient.GetFullName() + " " + patient.title_l;
                prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth) + " | " + patient.GetGender();
                prt_vpid.Text =  patient.visible_patient_id;
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
                prt_chief_complaint.Text = pomr.chief_complaint;
                prt_medical_history.Text = pomr.medical_history;
                prt_personal.Text = pomr.personal;
                prt_family.Text = pomr.family;

                prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, pomr.allergy, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

                prt_allergy_note_wrapper.Visible = false;

                if (pomr.allergy != null)
                {
                    if (pomr.allergy)
                    {
                        prt_allergy_note_wrapper.Visible = true;
                        prt_allergy_note.Text = pomr.allergy_note;
                    }
                }

                prt_current_medication.Text = pomr.current_medication;
                //IV.
                //1.
                prt_vs_temperature.Text = pomr.vs_temperature;
                prt_vs_weight.Text = pomr.vs_weight;
                prt_vs_height.Text = pomr.vs_height;
                prt_vs_BMI.Text = pomr.vs_BMI;
                prt_pulse.Text = pomr.vs_pulse;
                prt_vs_respiratory_rate.Text = pomr.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = pomr.vs_blood_pressure;
                prt_vs_spO2.Text = pomr.vs_spO2;
                //2.
                prt_physical_examination.Text = DataHelpers.FormatPhysicalExamination(pomr.physical_examination);

                prt_laboratory_indications_results.Text = pomr.laboratory_indications_results;
                prt_initial_diagnosis.Text = pomr.initial_diagnosis;
                prt_differential_diagnosis.Text = pomr.differential_diagnosis;
                prt_associated_conditions.Text = pomr.associated_conditions;

                prt_treatment.Text = WebHelpers.CreateOptions(Omr.TREATMENT_CODE, (string)pomr.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr;");

                if (pomr.treatment_code == "OPD")
                {
                    prt_medicine.Visible = true;
                    prt_medicine.Text = pomr.medicine;
                } else if(pomr.treatment_code == "TRF")
                {
                    prt_medicine.Visible = true;
                    prt_medicine.Text = pomr.tranfer;
                }
                else
                {
                    prt_medicine.Visible = false;
                }

                prt_spec_opinion_requested.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, pomr.spec_opinion_requested, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");
                prt_spec_opinion_requested_note_wrapper.Visible = false;
                if (pomr.spec_opinion_requested != null)
                {
                    if (pomr.spec_opinion_requested)
                    {
                        prt_spec_opinion_requested_note_wrapper.Visible = true;
                        prt_spec_opinion_requested_note.Text = pomr.spec_opinion_requested_note;
                    }
                }

                prt_specific_education_required.Text = pomr.specific_education_required;

                if (pomr.bool_next_appointment != null)
                {
                    prt_next_appointment.Text = pomr.bool_next_appointment ? WebHelpers.FormatDateTime(pomr.date_next_appointment) : pomr.txt_next_appointment;
                }

                prt_signature_doctor.Text = (string)Session["signature_doctor"];
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                POMR pomr = new POMR(Request.QueryString["docId"]);
                pomr.status = DocumentStatus.FINAL;
                
                UpdateData(pomr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                POMR pomr = new POMR(Request.QueryString["docId"]);
                pomr.status = DocumentStatus.DRAFT;

                UpdateData(pomr);
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
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                POMR pomr = new POMR(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, pomr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(pomr);
                //get access button
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            Initial();
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
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
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

        #region METHODS
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                POMR pomr;

                if (Request.QueryString["docIdLog"] != null)
                {
                    pomr = new POMR(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    pomr = new POMR(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (pomr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(pomr, WebHelpers.LoadFormControl(form1, pomr, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(pomr);

                }
                else if (pomr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(pomr, WebHelpers.LoadFormControl(form1, pomr, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, pomr.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void UpdateData(POMR pomr)
        {
            try
            {
                //I.
                pomr.chief_complaint = txt_chief_complaint.Value;
                //II.
                //1.
                pomr.medical_history = txt_medical_history.Value;
                pomr.current_medication = txt_current_medication.Value;
                //2.
                pomr.personal = txt_personal.Value;
                pomr.family = txt_family.Value;
                pomr.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                pomr.allergy_note = WebHelpers.GetBool(pomr.allergy, txt_allergy_note.Value, null);
                //II.

                pomr.vs_temperature = vs_temperature.Text;
                pomr.vs_weight = vs_weight.Text;
                pomr.vs_height = vs_height.Text;
                pomr.vs_BMI = vs_bmi.Text;
                pomr.vs_pulse = vs_pulse.Text;
                pomr.vs_heart_rate = vs_heart_rate.Text;
                pomr.vs_respiratory_rate = vs_respiratory_rate.Text;
                pomr.vs_blood_pressure = vs_blood_pressure.Text;
                pomr.vs_spO2 = vs_spo2.Text;

                pomr.physical_examination = txt_physical_examination.Value.Replace("<br>", "");
                //IV.
                pomr.laboratory_indications_results = txt_laboratory_indications_results.Value;
                //V.
                pomr.initial_diagnosis = txt_initial_diagnosis.Value;
                pomr.differential_diagnosis = txt_differential_diagnosis.Value;
                pomr.associated_conditions = txt_associated_conditions.Value;

                pomr.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", POMR.TREATMENT_CODE);
                pomr.treatment_desc = WebHelpers.GetDicDesc(pomr.treatment_code, Omr.TREATMENT_CODE);

                //5.
                if (pomr.treatment_code == "OPD") { pomr.medicine = txt_medicine.Value; }
                else if (pomr.treatment_code == "TRF") { pomr.tranfer = txt_tranfer.Value; }

                pomr.spec_opinion_requested = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_");
                pomr.spec_opinion_requested_note = WebHelpers.GetBool(pomr.spec_opinion_requested, txt_spec_opinion_requested_note.Value, null);

                pomr.specific_education_required = txt_specific_education_required.Value;

                pomr.bool_next_appointment = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bool_next_appointment_");

                pomr.txt_next_appointment = WebHelpers.GetBool(pomr.bool_next_appointment, null, txt_next_appointment.Value);

                pomr.date_next_appointment = WebHelpers.GetBool(pomr.bool_next_appointment, DataHelpers.ConvertSQLDateTime(dtpk_date_next_appointment.SelectedDate), null);

                if (JsonConvert.SerializeObject(pomr) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                pomr.amend_reason = txt_amend_reason.Text;
                pomr.user_name = (string)Session["UserID"];

                dynamic result = pomr.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
                    Initial();
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
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
        private void loadRadGridHistoryLog()
        {
            DataTable dt = POMR.Logs(Request.QueryString["docId"]);
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
            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted by";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved by";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                result += $" {created_name} on {created_date_time}";
            }
            else
            {
                result += $" {modified_name} on {modified_date_time}";
            }
            return result;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/OPD/OutPatMedRecPed.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/OPD/OutPatMedRecPed.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
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

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

        }
    }
}
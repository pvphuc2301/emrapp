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
            WebHelpers.CheckSession(this);

            if (!IsPostBack)
            {
                Initial();
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
            
            Patient patient = Patient.Instance();
            if (DataHelpers.CalculateAge(patient.date_of_birth) >= 18)
            {
                habits_field.Visible = true;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_smoking_" + omr.habits_smoking);
                
                if (omr.habits_smoking != null)
                {
                    if (omr.habits_smoking)
                    {
                        txt_habits_smoking_pack.Value = omr.habits_smoking_pack;
                    }
                }

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_alcohol_" + omr.habits_alcohol);

                if (omr.habits_alcohol != null)
                {
                    if (omr.habits_alcohol)
                    {
                        txt_habits_alcohol_note.Value = omr.habits_alcohol_note;
                    }
                }

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_drugs_" + omr.habits_drugs);
                if (omr.habits_drugs != null)
                {
                    if (omr.habits_drugs)
                    {
                        txt_habits_drugs_note.Value = omr.habits_drugs_note;
                    }
                }

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_habits_physical_exercise_" + omr.habits_physical_exercise);
                if (omr.habits_physical_exercise != null)
                {
                    if (omr.habits_physical_exercise)
                    {
                        txt_habits_phy_exer_note.Value = omr.habits_phy_exer_note;
                    }
                }

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
            if (omr.allergy != null)
            {
                if (omr.allergy)
                {
                    txt_allergy_note.Value = omr.allergy_note;
                }
            }

            txt_family.Value = omr.family;
            txt_immunization.Value = omr.immunization;

            // III.Khám bệnh/ Physical Examination:
            // DẤU HIỆU SINH TỒN/ VITAL SIGNS:

            txt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(omr.physical_examination);

            WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_psy_consult_required_" + omr.psy_consult_required);

            //if(omr1.psy_consult_required != null)
            //{
            //    if (omr1.psy_consult_required)
            //    {
            //        rad_psy_consult_required2.Checked = true;
            //    }
            //}
            WebHelpers.VisibleControl(true, btnUpdateVitalSign);
            txt_laboratory_indications_results.Value = omr.laboratory_indications_results;
            txt_additional_investigation.Value = omr.additional_investigation;
            // V.Kết luận/ Conclusion:
            //txtDiagnosis.Text = omr1.diagnosis;
            txt_initial_diagnosis.Value = omr.initial_diagnosis;
            txt_diagnosis.Value = omr.diagnosis;
            txt_differential_diagnosis.Value = omr.differential_diagnosis;
            txt_associated_conditions.Value = omr.associated_conditions;


            WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_"+ omr.treatment_code);

            // 5.Current medications
            txt_medicine.Value = omr.medicine;

            WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_" + omr.spec_opinion_requested);

            if (omr.spec_opinion_requested != null)
            {
                if (omr.spec_opinion_requested)
                {
                    txt_spec_opinion_requested_note.Value = omr.spec_opinion_requested_note;
                }
            }

            txt_specific_education_required.Value = omr.specific_education_required;
            txt_next_appointment.Value = omr.next_appointment;
        }
        private void BindingDataFormView(Omr omr)
        {
            //1
            lbl_chief_complain.Text = WebHelpers.FormatString(omr.chief_complain);
            lbl_current_medication.Text = WebHelpers.FormatString(omr.current_medication);
            //2
            lbl_personal.Text = WebHelpers.FormatString(omr.personal);
            if (DataHelpers.CalculateAge(DataHelpers.patient.date_of_birth) >= 18)
            {
                habits_field.Visible = true;

                lbl_habits_smoking.Text = omr.habits_smoking != null && omr.habits_smoking ? "Có, ghi số gói trong năm/ Yes, specify pack years: " + WebHelpers.GetValue(omr.habits_smoking_pack) : "Không/ No";
                lbl_habits_alcohol.Text = omr.habits_alcohol != null && omr.habits_alcohol ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(omr.habits_alcohol_note) : "Không/ No";
                lbl_habits_drugs.Text = omr.habits_drugs != null && omr.habits_drugs ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(omr.habits_drugs_note) : "Không/ No";
                lbl_habits_physical_exercise.Text = omr.habits_physical_exercise != null && omr.habits_physical_exercise ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(omr.habits_phy_exer_note) : "Không/ No";
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

            if (omr.treatment_code == "OPD")
            {
                lbl_medicine.Text = WebHelpers.FormatString(omr.medicine);
            }

            lbl_psy_consult_required.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.psy_consult_required));

            lbl_laboratory_indications_results.Text = WebHelpers.FormatString(omr.laboratory_indications_results);
            lbl_additional_investigation.Text = WebHelpers.FormatString(omr.additional_investigation);
            lbl_initial_diagnosis.Text = WebHelpers.FormatString(omr.initial_diagnosis);
            lbl_diagnosis.Text = WebHelpers.FormatString(omr.diagnosis);
            lbl_differential_diagnosis.Text = WebHelpers.FormatString(omr.differential_diagnosis);
            lbl_associated_conditions.Text = WebHelpers.FormatString(omr.associated_conditions);
            lbl_treatment_code.Text = WebHelpers.FormatString(omr.treatment_desc);

            lbl_spec_opinion_requested.Text = WebHelpers.FormatString(WebHelpers.GetBool(omr.spec_opinion_requested, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(omr.spec_opinion_requested_note)));

            lbl_specific_education_required.Text = WebHelpers.FormatString(omr.specific_education_required);
            lbl_next_appointment.Text = WebHelpers.FormatString(omr.next_appointment);
        }
        private void BindingDataFormPrint(Omr omr)
        {
            Patient patient = Patient.Instance();
            PatientVisit patientVisit = PatientVisit.Instance();
            prt_fullname.Text = patient.GetFullName() + " " + patient.title_l;
            prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth) + " | " + patient.GetGender();
            prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;
            
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
            prt_physical_examination.Text = DataHelpers.FormatPhysicalExamination(omr.physical_examination) ;

            prt_psy_consult_required.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, omr.psy_consult_required, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

            prt_laboratory_indications_results.Text = omr.laboratory_indications_results;
            prt_additional_investigation.Text = omr.additional_investigation;
            prt_initial_diagnosis.Text = omr.initial_diagnosis;
            prt_diagnosis.Text = omr.diagnosis;
            prt_differential_diagnosis.Text = omr.differential_diagnosis;
            prt_associated_conditions.Text = omr.associated_conditions;

            prt_treatment.Text = WebHelpers.CreateOptions(Omr.TREATMENT_CODE, (string)omr.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr;");

            if (omr.treatment_code == "OPD")
            { prt_medicine.Text = omr.medicine; }

            prt_spec_opinion_requested.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, omr.spec_opinion_requested, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

            if (omr.spec_opinion_requested != null)
            {
                if (omr.spec_opinion_requested)
                {
                    prt_spec_opinion_requested_note.Text = omr.spec_opinion_requested_note;
                }
            }

            prt_specific_education_required.Text = omr.specific_education_required;

            prt_next_appointment.Text = omr.next_appointment;
        }
        #endregion

        #region Events
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Omr omr = new Omr(Request.QueryString["docId"]);
                omr.status = DocumentStatus.DRAFT;
                omr.user_name = (string)Session["UserID"];

                UpdateData(omr);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            Omr omr = new Omr(Request.QueryString["docId"]);

            string emp_id = (string)Session["emp_id"];

            if (WebHelpers.CanOpenForm(Page, omr.document_id, omr.status, emp_id, (string)Session["location"]))
            {

                txt_amend_reason.Text = "";
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, omr, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(omr);
                //get access button
            }

        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Omr omr = new Omr(Request.QueryString["docId"]);
                omr.status = DocumentStatus.FINAL;
                omr.user_name = (string)Session["UserID"];

                UpdateData(omr);
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Omr omr = new Omr(Request.QueryString["docId"]);
            BindingDataFormPrint(omr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = POMR.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    string pid = Request["pid"];
                    string vpid = Request["vpid"];

                    Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic response = Omr.UpdateVitalSign(Request.QueryString["docId"]);
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                }
            } catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Functions
        protected void UpdateData(Omr omr)
        {
            try
            {
                omr.amend_reason = txt_amend_reason.Text;

                //I.
                omr.chief_complain = txt_chief_complain.Value;
                //II.
                //1.
                omr.medical_history = txt_medical_history.Value;
                omr.current_medication = txt_current_medication.Value;
                //2.
                omr.personal = txt_personal.Value;
                omr.family = txt_family.Value;
                if (rad_allergy_true.Checked)
                { omr.allergy = true; omr.allergy_note = txt_allergy_note.Value; }
                else if (rad_allergy_false.Checked)
                { omr.allergy = false; }
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
                //IV.
                omr.laboratory_indications_results = txt_laboratory_indications_results.Value;
                //V.
                omr.initial_diagnosis = txt_initial_diagnosis.Value;
                omr.differential_diagnosis = txt_differential_diagnosis.Value;
                omr.associated_conditions = txt_associated_conditions.Value;

                omr.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", Omr.TREATMENT_CODE);
                if (omr.treatment_code != null) omr.treatment_desc = Omr.TREATMENT_CODE[omr.treatment_code];

                //5.
                if (omr.treatment_code == "OPD") { omr.medicine = txt_medicine.Value; }
                else if (omr.treatment_code == "TRF") { }

                omr.spec_opinion_requested = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_requested_");
                if (rad_spec_opinion_requested_true.Checked)
                {
                    omr.spec_opinion_requested_note = txt_spec_opinion_requested_note.Value;
                }

                omr.specific_education_required = txt_specific_education_required.Value;

                omr.next_appointment = txt_next_appointment.Value;

                dynamic result = omr.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                    Initial();
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            try
            {
                Omr omr = new Omr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (omr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.View, (string)Session["location"]));

                }
                else if (omr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(omr, WebHelpers.LoadFormControl(form1, omr, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, omr.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
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
        #endregion
    }
}
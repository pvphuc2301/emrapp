using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class PediatricOutpatientMedicalRecord : System.Web.UI.Page
    {
        public POMR pomr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initial();
            }
        }

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            pomr = new POMR(DataHelpers.varDocId);

            loadDataToControls(pomr);
        }

        public void loadDataToControls(POMR pomr)
        {
            try
            {
                //I.
                txt_chief_complaint.Value = pomr.chief_complaint;
                //II.
                //1.
                txt_medical_history.Value = pomr.medical_history;
                txt_current_medication.Value = pomr.current_medication;
                //2.
                txt_personal.Value = pomr.personal;
                txt_family.Value = pomr.family;
                //
                txt_vs_temperature.Value = pomr.vs_temperature;
                txt_vs_heart_rate.Value = pomr.vs_heart_rate;
                txt_vs_weight.Value = pomr.vs_weight;
                txt_vs_respiratory_rate.Value = pomr.vs_respiratory_rate;
                txt_vs_height.Value = pomr.vs_height;
                txt_vs_blood_pressure.Value = pomr.vs_blood_pressure;
                txt_vs_bmi.Value = pomr.vs_BMI;
                txt_vs_spO2.Value = pomr.vs_spO2;
                txt_vs_pulse.Value = pomr.vs_pulse;

                //allergy
                BindRadioButton("rad_allergy_" + pomr.allergy);
                txt_allergy_note.Value = pomr.allergy_note;

                txt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(pomr.physical_examination);

                txt_laboratory_indications_results.Value = pomr.laboratory_indications_results;
                txt_initial_diagnosis.Value = pomr.initial_diagnosis;
                txt_differential_diagnosis.Value = pomr.differential_diagnosis;
                txt_associated_conditions.Value = pomr.associated_conditions;

                BindRadioButton("rad_treatment_code_" + pomr.treatment_code);

                BindRadioButton("rad_spec_opinion_requested_" + pomr.spec_opinion_requested);

                txt_spec_opinion_requested_note.Value = pomr.spec_opinion_requested_note;

                BindRadioButton("rad_next_appointment_" + pomr.bool_next_appointment);

                WebHelpers.BindDateTimePicker(dtpk_date_next_appointment, pomr.date_next_appointment);
                txt_next_appointment.Value = pomr.txt_next_appointment;

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (pomr.status == DocumentStatus.FINAL)
                {

                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                    loadDataToPrint(pomr);
                }

                else if (pomr.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }

                
            } catch (Exception ex) { }
        }

        private void loadDataToPrint(POMR pomr)
        {
            PatientVisit patientVisit = PatientVisit.Instance(Request["pvid"]);

            prt_patient_label.FullName = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            prt_patient_label.PID = DataHelpers.patient.visible_patient_id;
            prt_patient_label.DOB = string.Format("{0} | {1}", DataHelpers.patient.date_of_birth.ToString("dd-MM-yyyy"), DataHelpers.patient.gender_l);
            //
            prt_day_of_visit.Value = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
            //I.
            prt_chief_complaint.Value = pomr.chief_complaint;
            //II.
            prt_medical_history.Value = pomr.medical_history;
            //1. 
            prt_medical_history.Value = pomr.medical_history;

            prt_current_medication.Value = pomr.current_medication;

            prt_personal.Value = pomr.personal;
            prt_family.Value = pomr.family;
            //prt_immunization.Value = pomr.immunization;

            prt_allergy.Options = WebHelpers.CreateOptions(new Option {Text= "Không/ <span No", Value=false }, new Option { Text= "Có/ Yes:", Value=true});
            prt_allergy.SelectedValue = pomr.allergy;

            if (pomr.allergy != null)
            {
                if (pomr.allergy)
                {
                    prt_allergy_note.Value = pomr.allergy_note;
                }
                else
                {
                    prt_allergy_note.Visible = false;
                }
            }

            //II.
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
            prt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(pomr.physical_examination);

            //dynamic[] psy_consult_required_lst = new dynamic[2];

            //psy_consult_required_lst[0] = new System.Dynamic.ExpandoObject();
            //psy_consult_required_lst[0].title = "Không/ <span class='text-primary'>No</span>";

            //psy_consult_required_lst[1] = new System.Dynamic.ExpandoObject();
            //psy_consult_required_lst[1].title = "Có/ <span class='text-primary'>Yes</span>:";

            //prt_psy_consult_required.Options = JsonConvert.SerializeObject(psy_consult_required_lst);

            //prt_psy_consult_required.SelectedIndex = pomr.psy_consult_required ? 1 : 0;

            prt_laboratory_indications_results.Value = pomr.laboratory_indications_results;
            //prt_additional_investigation.Value = pomr.additional_investigation;
            prt_initial_diagnosis.Value = pomr.initial_diagnosis;
            //prt_diagnosis.Value = pomr.diagnosis;
            prt_differential_diagnosis.Value = pomr.differential_diagnosis;
            prt_associated_conditions.Value = pomr.associated_conditions;

            Option[] treatments = new Option[3];
            for(int i = 0; i < treatments.Length; i++)
            {
                var item = POMR.TREATMENT_CODE.ElementAt(i);

                treatments[i] = new Option { Text = item.Key, Value = item.Value };
            }

            prt_treatment.Options = WebHelpers.CreateOptions(treatments);
            prt_treatment.SelectedValue = pomr.treatment_code;

            prt_medicine.Value = pomr.medicine;

            prt_spec_opinion_requested.Options = WebHelpers.CreateOptions(new Option { Text = "Không/ <span No", Value = false }, new Option { Text = "Có/ Yes:", Value = true });
            prt_spec_opinion_requested.SelectedValue = pomr.spec_opinion_requested;

            if(pomr.spec_opinion_requested != null)
            {
                if (pomr.spec_opinion_requested)
                {
                    prt_spec_opinion_requested_note.Value = pomr.spec_opinion_requested_note;
                }
                else
                {
                    prt_spec_opinion_requested.Visible = false;
                }
            }


            prt_specific_education_required.Value = pomr.specific_education_required;

            if(pomr.bool_next_appointment != null)
            {
                if (pomr.bool_next_appointment)
                {
                    prt_next_appointment.Value = WebHelpers.FormatDateTime(pomr.date_next_appointment);

                }
                else
                {
                    prt_next_appointment.Value = pomr.txt_next_appointment;
                }
            }

            prt_signature1.Content = WebHelpers.GetSignatureTemplate1("", "BÁC SĨ ĐIỀU TRỊ", "ATTENDING DOCTOR", "", "", (string)Session["UserId"]);

        }

        private void BindRadioButton(string value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputRadioButton)FindControl(value)).Checked = true;
            }
        }
        protected void DisabledControl(bool disabled)
        {
            txt_chief_complaint.Disabled = disabled;
            txt_current_medication.Disabled = disabled;
            txt_medical_history.Disabled = disabled;
            txt_personal.Disabled = disabled;
            txt_family.Disabled = disabled;
            rad_allergy_true.Disabled = disabled;
            rad_allergy_false.Disabled = disabled;
            txt_allergy_note.Disabled = disabled;
            //txt_vs_temperature.Disabled = true;
            //txt_vs_heart_rate.Disabled = true;
            //txt_vs_weight.Disabled = true;
            //txt_vs_respiratory_rate.Disabled = true;
            //txt_vs_height.Disabled = true;
            //txt_vs_blood_pressure.Disabled = true;
            //txt_vs_spO2.Disabled = true;
            //txt_vs_pulse.Disabled = true;
            txt_physical_examination.Disabled = disabled;
            txt_laboratory_indications_results.Disabled = disabled;
            txt_initial_diagnosis.Disabled = disabled;
            txt_differential_diagnosis.Disabled = disabled;
            txt_associated_conditions.Disabled = disabled;
            foreach (KeyValuePair<string, string> code in POMR.TREATMENT_CODE)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_treatment_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            txt_medicine.Disabled = disabled;
            txt_transfer.Disabled = disabled;
            rad_spec_opinion_requested_true.Disabled = disabled;
            rad_spec_opinion_requested_false.Disabled = disabled;
            txt_spec_opinion_requested_note.Disabled = disabled;
            txt_specific_education_required.Disabled = disabled;

            rad_next_appointment_true.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dtpk_date_next_appointment, disabled);

            rad_next_appointment_false.Disabled = disabled;
            txt_next_appointment.Disabled = disabled;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                pomr = new POMR(Request.QueryString["docId"]);
                pomr.status = DocumentStatus.FINAL;
                pomr.user_name = (string)Session["UserID"];

                UpdateData(pomr);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private string checkValidField()
        {
            string errors = "";
            return errors;
        }

        public void UpdateData(POMR pomr)
        {
            
            pomr.amend_reason = txt_amendReason.Value;
            
            //I.
            pomr.chief_complaint = txt_chief_complaint.Value;
            //II.
            //1.
            pomr.medical_history = txt_medical_history.Value;
            pomr.current_medication = txt_current_medication.Value;
            //2.
            pomr.personal = txt_personal.Value;
            pomr.family = txt_family.Value;
            if (rad_allergy_true.Checked)
            { pomr.allergy = true; pomr.allergy_note = txt_allergy_note.Value; }
            else if (rad_allergy_false.Checked)
            { pomr.allergy = false; }
            //II.
            pomr.vs_temperature = txt_vs_temperature.Value;
            pomr.vs_weight = txt_vs_weight.Value;
            pomr.vs_height = txt_vs_height.Value;
            pomr.vs_BMI = txt_vs_bmi.Value;
            pomr.vs_pulse = txt_vs_pulse.Value;
            pomr.vs_heart_rate = txt_vs_heart_rate.Value;
            pomr.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            pomr.vs_blood_pressure = txt_vs_blood_pressure.Value;
            pomr.vs_spO2 = txt_vs_spO2.Value;
            pomr.physical_examination = txt_physical_examination.Value.Replace("<br>", "");
            //IV.
            pomr.laboratory_indications_results = txt_laboratory_indications_results.Value;
            //V.
            pomr.initial_diagnosis = txt_initial_diagnosis.Value;
            pomr.differential_diagnosis = txt_differential_diagnosis.Value;
            pomr.associated_conditions = txt_associated_conditions.Value;

            pomr.treatment_code = GetRadioButton("rad_treatment_code_", POMR.TREATMENT_CODE);
            if (pomr.treatment_code != null) pomr.treatment_desc = POMR.TREATMENT_CODE[pomr.treatment_code];

            //5.
            if(pomr.treatment_code == "OPD") { pomr.medicine = txt_medicine.Value; }
            else if(pomr.treatment_code == "TRF") { }

            pomr.spec_opinion_requested = GetRadioButton("rad_spec_opinion_requested_");
            if (rad_spec_opinion_requested_true.Checked)
            {
                pomr.spec_opinion_requested_note = txt_spec_opinion_requested_note.Value;
            }

            pomr.specific_education_required = txt_specific_education_required.Value;

            pomr.bool_next_appointment = GetRadioButton("rad_next_appointment_");

            if (rad_next_appointment_true.Checked)
            {
                pomr.txt_next_appointment = null;

                pomr.date_next_appointment = DataHelpers.ConvertSQLDateTime(dtpk_date_next_appointment.SelectedDate);
            }
            else if (rad_next_appointment_false.Checked)
            {
                pomr.bool_next_appointment = false;
                pomr.txt_next_appointment = txt_next_appointment.Value;
            }

            dynamic result = pomr.Update();

            if (result[0].Status == System.Net.HttpStatusCode.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                Initial();
            }
            else
            {
                Session["PageNotFound"] = result[0];
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                pomr = new POMR(Request.QueryString["docId"]);
                pomr.status = DocumentStatus.DRAFT;
                pomr.user_name = (string)Session["UserID"];

                UpdateData(pomr);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            txt_amendReason.Visible = true;

            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            dynamic response = POMR.UpdateVitalSign(Request.QueryString["docId"]);
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                Initial();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = POMR.Delete((string)Session["UserId"], Request.QueryString["docId"]);

            if (result[0].Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result[0];
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }

        #region METHODS
        private dynamic GetRadioButton(string radio_name, Dictionary<string, string> value)
        {
            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    if (((HtmlInputRadioButton)FindControl(radio_name + code.Key)).Checked)
                    {
                        return code.Key;
                        break;
                    }
                }
                catch (Exception ex) { }
            }
            return null;
        }
        private dynamic GetRadioButton(string radio_name)
        {
            if (((HtmlInputRadioButton)FindControl(radio_name + "true")).Checked)
            {
                return true;
            }
            else if (((HtmlInputRadioButton)FindControl(radio_name + "false")).Checked)
            {
                return false;
            }
            else { return null; }
        }
        #endregion
    }
}
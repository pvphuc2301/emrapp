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
            if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

            // Get du lieu tu API to Object
            omr = new Omr(Request.QueryString["docId"]);

            // Fill du lieu tu Object to Controls.
            loadDataToControls(omr);
        }
      
        public void loadDataToControls(Omr omr1)
        {
            Patient patient = Patient.Instance();
            if (DataHelpers.CalculateAge(patient.date_of_birth) >= 18)
            {
                habits_field.Visible = true;

                BindRadioButton("rad_habits_smoking_" + omr1.habits_smoking);

                if (omr1.habits_smoking != null)
                {
                    if (omr1.habits_smoking)
                    {
                        txt_habits_smoking_pack.Value = omr1.habits_smoking_pack;
                    }
                }


                BindRadioButton("rad_habits_alcohol_" + omr1.habits_alcohol);

                if (omr1.habits_alcohol != null)
                {
                    if (omr1.habits_alcohol)
                    {
                        txt_habits_alcohol_note.Value = omr1.habits_alcohol_note;
                    }
                }

                BindRadioButton("rad_habits_drugs_" + omr1.habits_drugs);
                if (omr1.habits_drugs != null)
                {
                    if (omr1.habits_drugs)
                    {
                        txt_habits_drugs_note.Value = omr1.habits_drugs_note;
                    }
                }

                BindRadioButton("rad_habits_physical_exercise_" + omr1.habits_physical_exercise);
                if (omr1.habits_physical_exercise != null)
                {
                    if (omr1.habits_physical_exercise)
                    {
                        txt_habits_phy_exer_note.Value = omr1.habits_phy_exer_note;
                    }
                }

                txt_habits_other.Value = omr1.habits_other;
            }
            else
            {
                habits_field.Visible = false;
            }

            // I. Lý do đến khám/ Chief complaint:
            txt_chief_complaint.Value = omr1.chief_complain;

            // II. Bệnh sử/ Medical History:
            // 1.Bệnh sử hiện tại / Current Medical History:
            txt_medical_history.Value = omr1.medical_history;
            
            txt_current_medication.Value = omr1.current_medication;

            // 2.Tiền sử bệnh/ Antecedent Medical History:
            txt_personal.Value = omr1.personal;

            BindRadioButton("rad_allergy_" + omr1.allergy);
            if (omr1.allergy != null)
            {
                if (omr1.allergy)
                {
                    txt_allergy_note.Value = omr1.allergy_note;
                }
            }
            
            txt_family.Value = omr1.family;
            txt_immunization.Value = omr1.immunization;

            // III.Khám bệnh/ Physical Examination:
            // DẤU HIỆU SINH TỒN/ VITAL SIGNS:
            txt_vs_temperature.Value = omr1.vs_temperature;
            txt_vs_heart_rate.Value = omr1.vs_heart_rate;
            txt_vs_weight.Value = omr1.vs_weight;
            txt_vs_respiratory_rate.Value = omr1.vs_respiratory_rate;
            txt_vs_height.Value = omr1.vs_height;
            txt_vs_blood_pressure.Value = omr1.vs_blood_pressure;
            txt_vs_bmi.Value = omr1.vs_BMI;
            txt_vs_spO2.Value = omr1.vs_spO2;
            txt_vs_pulse.Value = omr1.vs_pulse;

            txt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(omr1.physical_examination);

            BindRadioButton("rad_psy_consult_required_" + omr1.psy_consult_required);
            
            //if(omr1.psy_consult_required != null)
            //{
            //    if (omr1.psy_consult_required)
            //    {
            //        rad_psy_consult_required2.Checked = true;
            //    }
            //}

            txt_laboratory_indications_results.Value = omr1.laboratory_indications_results;
            txt_additional_investigation.Value = omr1.additional_investigation;
            // V.Kết luận/ Conclusion:
            //txtDiagnosis.Text = omr1.diagnosis;
            txt_initial_diagnosis.Value = omr1.initial_diagnosis;
            txt_diagnosis.Value = omr1.diagnosis;
            txt_differential_diagnosis.Value = omr1.differential_diagnosis;
            txt_associated_conditions.Value = omr1.associated_conditions;


            BindRadioButton("rad_treatment_code_" + omr1.treatment_code);

            // 5.Current medications
            txt_medicine.Value = omr1.medicine;

            BindRadioButton("rad_spec_opinion_requested_" + omr1.spec_opinion_requested);

            if (omr1.spec_opinion_requested != null)
            {
                if (omr1.spec_opinion_requested)
                {
                    txt_spec_opinion_requested_note.Value = omr1.spec_opinion_requested_note;
                }
            }

            txt_specific_education_required.Value = omr1.specific_education_required;
            txt_next_appointment.Value = omr1.next_appointment;

            btnCancel.Visible = false;
            txt_amendReason.Visible = false;

            if (omr1.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDeleteModal.Visible = false;

                btnAmend.Visible = true;
                
                btnPrint.Visible = true;

                DisabledControl(true);
                LoadDataToPrint(omr1);
            }

            else if (omr1.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        private void LoadDataToPrint(Omr omr1)
        {
            PatientVisit patientVisit = PatientVisit.Instance(Request["pvid"]);
            
            prt_patient_label.FullName = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            prt_patient_label.PID = DataHelpers.patient.visible_patient_id;
            prt_patient_label.DOB = string.Format("{0} | {1}", DataHelpers.patient.date_of_birth.ToString("dd-MM-yyyy"), DataHelpers.patient.gender_l);

            prt_day_of_visit.Value = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
            prt_chief_complaint.Value = omr1.chief_complain;
            prt_medical_history.Value = omr1.medical_history;
            prt_personal.Value = omr1.personal;
            prt_family.Value = omr1.family;
            prt_immunization.Value = omr1.immunization;
            prt_current_medication.Value = omr1.current_medication;
            //IV.
            //1.
            prt_vs_temperature.Text = omr1.vs_temperature;
            prt_vs_weight.Text = omr1.vs_weight;
            prt_vs_height.Text = omr1.vs_height;
            prt_vs_BMI.Text = omr1.vs_BMI;
            prt_pulse.Text = omr1.vs_pulse;
            prt_vs_respiratory_rate.Text = omr1.vs_respiratory_rate;
            prt_vs_blood_pressure.Text = omr1.vs_blood_pressure;
            prt_vs_spO2.Text = omr1.vs_spO2;
            //2.
            prt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(omr1.physical_examination) ;

            dynamic[] psy_consult_required_lst = new dynamic[2];

            psy_consult_required_lst[0] = new System.Dynamic.ExpandoObject();
            psy_consult_required_lst[0].title = "Không/ <span class='text-primary'>No</span>";

            psy_consult_required_lst[1] = new System.Dynamic.ExpandoObject();
            psy_consult_required_lst[1].title = "Có/ <span class='text-primary'>Yes</span>:";

            prt_psy_consult_required.Options = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text= "Có/ <span class='text-primary'>Yes</span>:", Value = true });

            prt_psy_consult_required.SelectedValue = omr1.psy_consult_required;

            prt_laboratory_indications_results.Value = omr1.laboratory_indications_results;
            prt_additional_investigation.Value = omr1.additional_investigation;
            prt_initial_diagnosis.Value = omr1.initial_diagnosis;
            prt_diagnosis.Value = omr1.diagnosis;
            prt_differential_diagnosis.Value = omr1.differential_diagnosis;
            prt_associated_conditions.Value = omr1.associated_conditions;

            Option[] treatments = new Option[3];
            for (int i = 0; i < treatments.Length; i++)
            {
                var item = Omr.TREATMENT_CODE.ElementAt(i);

                treatments[i] = new Option { Text = item.Value, Value = item.Key };
            }

            prt_treatment.Options = WebHelpers.CreateOptions(treatments);
            prt_treatment.SelectedValue = omr.treatment_code;

            prt_spec_opinion_requested.Options = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true });
            prt_spec_opinion_requested.SelectedValue = omr.spec_opinion_requested;

            if (omr.spec_opinion_requested != null)
            {
                if (omr.spec_opinion_requested)
                {
                    prt_spec_opinion_requested_note.Value = omr.spec_opinion_requested_note;
                }
                else
                {
                    prt_spec_opinion_requested_note.Visible = false;
                }
            }

            prt_specific_education_required.Value = omr.specific_education_required;

            prt_next_appointment.Value = omr1.next_appointment;

            prt_signature1.Content = WebHelpers.GetSignatureTemplate1("", "<div class='font-bold'>BÁC SĨ ĐIỀU TRỊ</div>", "ATTENDING DOCTOR", "", "", "");

        }


        protected void DisabledControl(bool disabled)
        {
            txt_chief_complaint.Disabled = disabled;
            txt_current_medication.Disabled = disabled;
            txt_medical_history.Disabled = disabled;
            txt_personal.Disabled = disabled;
            txt_habits_smoking_pack.Disabled = disabled;
            txt_habits_alcohol_note.Disabled = disabled;
            txt_allergy_note.Disabled = disabled;
            txt_habits_drugs_note.Disabled = disabled;
            txt_habits_phy_exer_note.Disabled = disabled;
            txt_habits_other.Disabled = disabled;
            txt_immunization.Disabled = disabled;
            txt_family.Disabled = disabled;
            txt_physical_examination.Disabled = disabled;
            txt_laboratory_indications_results.Disabled = disabled;
            txt_additional_investigation.Disabled = disabled;
            txt_initial_diagnosis.Disabled = disabled;
            txt_diagnosis.Disabled = disabled;
            txt_differential_diagnosis.Disabled = disabled;
            txt_associated_conditions.Disabled = disabled;
            txt_medicine.Disabled = disabled;
            txt_spec_opinion_requested_note.Disabled = disabled;
            txt_specific_education_required.Disabled = disabled;
            txt_next_appointment.Disabled = disabled;

            DisabledRadioButton("rad_habits_smoking_", disabled);
            DisabledRadioButton("rad_habits_alcohol_", disabled);
            DisabledRadioButton("rad_habits_drugs_", disabled);
            DisabledRadioButton("rad_habits_physical_exercise_", disabled);
            DisabledRadioButton("rad_allergy_", disabled);
            txt_allergy_note.Disabled = disabled;
            DisabledRadioButton("rad_psy_consult_required_", disabled);
            DisabledRadioButton("rad_treatment_code_", Omr.TREATMENT_CODE, disabled);
            DisabledRadioButton("rad_spec_opinion_requested_", disabled);

        }

        /// <summary>
        /// Chi khi DocumentStatus = DRAFT thi Button nay moi thuc hien Action.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e) 
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                omr = new Omr(Request.QueryString["docId"]);
                omr.status = DocumentStatus.DRAFT;
                omr.user_name = (string)Session["UserID"];

                UpdateData(omr);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }

        }
       /// <summary>
       /// DocumentStatus = Final, muon chinh sua du lieu --> thuc hien Button nay, de bat trang thai Edit cho tat ca TextBox.
       /// </summary>
       /// <param name="sender"></param>
       /// <param name="e"></param>
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

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                omr = new Omr(Request.QueryString["docId"]);
                omr.status = DocumentStatus.FINAL;
                omr.user_name = (string)Session["UserID"];

                UpdateData(omr);
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
            return "";
        }

        protected void UpdateData(Omr omr)
        {
            omr.amend_reason = txt_amendReason.Value;

            //I.
            omr.chief_complain = txt_chief_complaint.Value;
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
            omr.vs_temperature = txt_vs_temperature.Value;
            omr.vs_weight = txt_vs_weight.Value;
            omr.vs_height = txt_vs_height.Value;
            omr.vs_BMI = txt_vs_bmi.Value;
            omr.vs_pulse = txt_vs_pulse.Value;
            omr.vs_heart_rate = txt_vs_heart_rate.Value;
            omr.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            omr.vs_blood_pressure = txt_vs_blood_pressure.Value;
            omr.vs_spO2 = txt_vs_spO2.Value;
            omr.physical_examination = txt_physical_examination.Value.Replace("<br>", "");
            //IV.
            omr.laboratory_indications_results = txt_laboratory_indications_results.Value;
            //V.
            omr.initial_diagnosis = txt_initial_diagnosis.Value;
            omr.differential_diagnosis = txt_differential_diagnosis.Value;
            omr.associated_conditions = txt_associated_conditions.Value;

            omr.treatment_code = GetRadioButton("rad_treatment_code_", Omr.TREATMENT_CODE);
            if (omr.treatment_code != null) omr.treatment_desc = Omr.TREATMENT_CODE[omr.treatment_code];

            //5.
            if (omr.treatment_code == "OPD") { omr.medicine = txt_medicine.Value; }
            else if (omr.treatment_code == "TRF") { }

            omr.spec_opinion_requested = GetRadioButton("rad_spec_opinion_requested_");
            if (rad_spec_opinion_requested_true.Checked)
            {
                omr.spec_opinion_requested_note = txt_spec_opinion_requested_note.Value;
            }

            omr.specific_education_required = txt_specific_education_required.Value;

            omr.next_appointment = txt_next_appointment.Value;

            dynamic result = omr.Update();

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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
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

        private void BindRadioButton(string value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputRadioButton)FindControl(value)).Checked = true;
            }
        }
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
        private void DisabledRadioButton(string radioButtonName, Dictionary<string, string> value, bool disabled)
        {
            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl(radioButtonName + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }
        }
        private void DisabledRadioButton(string radioButtonName, bool disabled)
        {
                try
                {
                HtmlInputRadioButton control1 = ((HtmlInputRadioButton)FindControl(radioButtonName + "true"));
                if (control1 != null) { control1.Disabled = disabled; }; HtmlInputRadioButton control2 = ((HtmlInputRadioButton)FindControl(radioButtonName + "false"));
                if (control2 != null) { control2.Disabled = disabled; };
            }
                catch (Exception ex) { }
            
        }

        protected void btnUpdateVS_Click(object sender, EventArgs e)
        {
            dynamic response = POMR.UpdateVitalSign(Request.QueryString["docId"]);
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                Initial();
            }
        }
    }
}
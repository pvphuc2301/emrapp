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
                if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
                if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
                if (Request.QueryString["vpId"] != null) DataHelpers.varPVId = Request.QueryString["vpId"];

                Initial();
            }
        }

        public void Initial()
        {
           
            // Get du lieu tu API to Object
            omr = new Omr(Request.QueryString["docId"]);

            // Fill du lieu tu Object to Controls.

            //lbl_vs_temperature.Text = omr.vs_temperature;
            //lbl_vs_heart_rate.Text = omr.vs_heart_rate;
            //lbl_vs_weight.Text = omr.vs_weight;
            //lbl_vs_respiratory_rate.Text = omr.vs_respiratory_rate;
            //lbl_vs_height.Text = omr.vs_height;
            //lbl_vs_blood_pressure.Text = omr.vs_blood_pressure;
            //lbl_vs_bmi.Text = omr.vs_BMI;
            //lbl_vs_spo2.Text = omr.vs_spO2;
            //lbl_vs_pulse.Text = omr.vs_pulse;

            //btnCancel.Visible = false;
            //txt_amendReason.Visible = false;

            if (omr.status == DocumentStatus.FINAL)
            {
                loadFormView(omr);
            }

            else if (omr.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(omr);
                //btnAmend.Visible = false;
                //loadDataToControls(omr);
                //btnPrint.Visible = false;
            }
        }
        private void LoadFormEdit(Omr omr)
        {
            try
            {
                DisabledControl(true);
                //I.
                Patient patient = Patient.Instance();
                if (DataHelpers.CalculateAge(patient.date_of_birth) >= 18)
                {
                    habits_field.Visible = true;

                    BindRadioButton("rad_habits_smoking_" + omr.habits_smoking);

                    if (omr.habits_smoking != null)
                    {
                        if (omr.habits_smoking)
                        {
                            txt_habits_smoking_pack.Value = omr.habits_smoking_pack;
                        }
                    }


                    BindRadioButton("rad_habits_alcohol_" + omr.habits_alcohol);

                    if (omr.habits_alcohol != null)
                    {
                        if (omr.habits_alcohol)
                        {
                            txt_habits_alcohol_note.Value = omr.habits_alcohol_note;
                        }
                    }

                    BindRadioButton("rad_habits_drugs_" + omr.habits_drugs);
                    if (omr.habits_drugs != null)
                    {
                        if (omr.habits_drugs)
                        {
                            txt_habits_drugs_note.Value = omr.habits_drugs_note;
                        }
                    }

                    BindRadioButton("rad_habits_physical_exercise_" + omr.habits_physical_exercise);
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
                txt_chief_complaint.Value = omr.chief_complain;

                // II. Bệnh sử/ Medical History:
                // 1.Bệnh sử hiện tại / Current Medical History:
                txt_medical_history.Value = omr.medical_history;

                txt_current_medication.Value = omr.current_medication;

                // 2.Tiền sử bệnh/ Antecedent Medical History:
                txt_personal.Value = omr.personal;

                BindRadioButton("rad_allergy_" + omr.allergy);
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

                BindRadioButton("rad_psy_consult_required_" + omr.psy_consult_required);

                //if(omr1.psy_consult_required != null)
                //{
                //    if (omr1.psy_consult_required)
                //    {
                //        rad_psy_consult_required2.Checked = true;
                //    }
                //}

                txt_laboratory_indications_results.Value = omr.laboratory_indications_results;
                txt_additional_investigation.Value = omr.additional_investigation;
                // V.Kết luận/ Conclusion:
                //txtDiagnosis.Text = omr1.diagnosis;
                txt_initial_diagnosis.Value = omr.initial_diagnosis;
                txt_diagnosis.Value = omr.diagnosis;
                txt_differential_diagnosis.Value = omr.differential_diagnosis;
                txt_associated_conditions.Value = omr.associated_conditions;


                BindRadioButton("rad_treatment_code_" + omr.treatment_code);

                // 5.Current medications
                txt_medicine.Value = omr.medicine;

                BindRadioButton("rad_spec_opinion_requested_" + omr.spec_opinion_requested);

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
            catch (Exception ex)
            {
                Session["PageNotFound"] = ex;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }

            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }
        private void loadFormView(Omr omr)
        {
            lbl_chief_complaint.Text = WebHelpers.GetValue(omr.chief_complain);
            lbl_current_medication.Text = WebHelpers.GetValue(omr.chief_complain);
            lbl_medical_history.Text = WebHelpers.GetValue(omr.medical_history);
            lbl_personal.Text = WebHelpers.GetValue(omr.personal);

            if (omr.allergy != null)
            {
                lbl_allergy.Text = omr.allergy ? "" : "Không/ No";
                if (omr.allergy) { lbl_allergy.Text += omr.allergy_note; }
            }
            lbl_family.Text = WebHelpers.GetValue(omr.family);
            lbl_immunization.Text = WebHelpers.GetValue(omr.immunization);
            lbl_physical_examination.Text = DataHelpers.FormatPhysicalExamination(omr.physical_examination);
            if (omr.psy_consult_required != null)
            {
                lbl_psy_consult_required.Text = omr.psy_consult_required ? "" : "Không/ No";

            }
            lbl_laboratory_indications_results.Text = WebHelpers.GetValue(omr.laboratory_indications_results);
            lbl_additional_investigation.Text = WebHelpers.GetValue(omr.additional_investigation);
            lbl_initial_diagnosis.Text = WebHelpers.GetValue(omr.initial_diagnosis);
            lbl_diagnosis.Text = WebHelpers.GetValue(omr.diagnosis);
            lbl_differential_diagnosis.Text = WebHelpers.GetValue(omr.differential_diagnosis);
            lbl_associated_conditions.Text = WebHelpers.GetValue(omr.associated_conditions);
            lbl_treatment.Text = WebHelpers.GetValue(omr.treatment_desc);

            if (omr.spec_opinion_requested != null)
            {
                lbl_spec_opinion_requested.Text = omr.spec_opinion_requested ? "" : "Không/ No";
                if (omr.spec_opinion_requested)
                {
                    lbl_spec_opinion_requested.Text += " " + omr.spec_opinion_requested_note;
                }
            }
            lbl_specific_education_required.Text = WebHelpers.GetValue(omr.specific_education_required);
            lbl_next_appointment.Text = WebHelpers.GetValue(omr.next_appointment);

            DisabledControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
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

            txt_chief_complaint.Visible = txt_current_medication.Visible = txt_medical_history.Visible =  txt_personal.Visible = txt_habits_smoking_pack.Visible = txt_habits_alcohol_note.Visible = txt_allergy_note.Visible = Visible;
            txt_habits_drugs_note.Visible = txt_habits_phy_exer_note.Visible = txt_habits_other.Visible = txt_immunization.Visible = disabled;
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

            foreach (var prop in omr.GetType().GetProperties())
            {
                var control1 = FindControl("txt_" + prop.Name);
                var control2 = FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = !disabled;
                } else if(control2 != null)
                {
                    control2.Visible = disabled;
                }
            }

            //if (omr.GetType().GetProperty(col.ToString()) != null)
            //    {
            //        // if (tbl.Rows[0].Field<dynamic>(col) != null)
            //        {
            //            //string temp2 = obj.GetType().GetProperty(col.ToString()).Name.ToString();
            //            //string temp1 =  tbl.Rows[0].Field<dynamic>(col);
            //            //obj.GetType().GetProperty(col.ToString()).SetValue(obj, tbl.Rows[0].Field<dynamic>(col));
            //            var field = tbl.Rows[0].Field<dynamic>(col);

            //            obj.GetType().GetProperty(col.ToString()).SetValue(obj, field);
            //        }
            //    }

            //txt_initial_diagnosis.Visible = txt_diagnosis.Visible = txt_differential_diagnosis.Visible = txt_associated_conditions.Visible = treatmentWrapper.Visible = SpecOpinionRequestedWrapper.Visible = txt_specific_education_required.Visible = txt_next_appointment.Visible = disabled;
            //lbl_initial_diagnosis.Visible = lbl_diagnosis.Visible = lbl_differential_diagnosis.Visible = lbl_associated_conditions.Visible = lbl_treatment.Visible = lbl_spec_opinion_requested.Visible = lbl_specific_education_required.Visible = lbl_next_appointment.Visible = !disabled;
        }

        /// <summary>
        /// Chi khi DocumentStatus = DRAFT thi Button nay moi thuc hien Action.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e) 
        {
            if (Page.IsValid)
            {
                omr = new Omr(Request.QueryString["docId"]);
                omr.status = DocumentStatus.DRAFT;
                omr.user_name = (string)Session["UserID"];

                UpdateData(omr);
            }
            else
            {
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
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                omr = new Omr(Request.QueryString["docId"]);
                omr.status = DocumentStatus.FINAL;
                omr.user_name = (string)Session["UserID"];

                UpdateData(omr);
            }
            else
            {
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
            omr.amend_reason = txt_amendReason.Text;

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
            omr.vs_temperature = lbl_vs_temperature.Text;
            omr.vs_weight = lbl_vs_weight.Text;
            omr.vs_height = lbl_vs_height.Text;
            omr.vs_BMI = lbl_vs_bmi.Text;
            omr.vs_pulse = lbl_vs_pulse.Text;
            omr.vs_heart_rate = lbl_vs_heart_rate.Text;
            omr.vs_respiratory_rate = lbl_vs_respiratory_rate.Text;
            omr.vs_blood_pressure = lbl_vs_blood_pressure.Text;
            omr.vs_spO2 = lbl_vs_spo2.Text;
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
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_amendReason.Text.Length > 3;
        }

        protected void btnPrint_ServerClick(object sender, EventArgs e)
        {
            omr = new Omr(Request.QueryString["docId"]);
            LoadDataToPrint(omr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
    }
}
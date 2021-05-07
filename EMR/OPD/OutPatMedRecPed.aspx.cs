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

            loadDataToOMRControls(pomr);
        }

        public void loadDataToOMRControls(POMR pomr)
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
                if(pomr.allergy != null)
                {
                    if (bool.Parse(pomr.allergy))
                    {
                        rad_allergy2.Checked = true;
                        txt_allergy_note.Value = pomr.allergy_note;
                    }
                    else
                    {
                        rad_allergy1.Checked = true;
                    }
                }

                txt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(pomr.physical_examination);

                txt_laboratory_indications_results.Value = pomr.laboratory_indications_results;
                txt_initial_diagnosis.Value = pomr.initial_diagnosis;
                txt_differential_diagnosis.Value = pomr.differential_diagnosis;
                txt_associated_conditions.Value = pomr.associated_conditions;

                foreach (KeyValuePair<string, string> code in POMR.TREATMENT_CODE)
                {
                    try
                    {
                        ((HtmlInputRadioButton)FindControl("rad_treatment_code_" + code.Key.ToLower())).Checked = true;
                    }
                    catch (Exception ex) { }
                }

                if (pomr.spec_opinion_requested != null)
                {
                    if (bool.Parse(pomr.spec_opinion_requested))
                    {
                        rad_spec_opinion_requested2.Checked = true;
                        txt_spec_opinion_requested_note.Value = pomr.spec_opinion_requested_note;
                    }
                    else
                    {
                        rad_spec_opinion_requested2.Checked = true;
                    }
                }

                if (pomr.bool_next_appointment != null)
                {
                    if (bool.Parse(pomr.bool_next_appointment))
                    {
                        rad_next_appointment1.Checked = true;
                        try
                        {
                            dtpk_date_next_appointment.SelectedDate = DateTime.Parse(pomr.date_next_appointment);
                        }catch(Exception ex) { }
                    }
                    else
                    {
                        rad_next_appointment2.Checked = true;
                        txt_next_appointment.Value = pomr.txt_next_appointment;
                    }
                }

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (pomr.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDelete.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }

                else if (pomr.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            } catch (Exception ex) { }
        }

        protected void DisabledControl(bool disabled)
        {
            txt_chief_complaint.Disabled = disabled;
            txt_current_medication.Disabled = disabled;
            txt_medical_history.Disabled = disabled;
            txt_personal.Disabled = disabled;
            txt_family.Disabled = disabled;
            rad_allergy1.Disabled = disabled;
            rad_allergy2.Disabled = disabled;
            txt_allergy_note.Disabled = disabled;
            txt_vs_temperature.Disabled = true;
            txt_vs_heart_rate.Disabled = true;
            txt_vs_weight.Disabled = true;
            txt_vs_respiratory_rate.Disabled = true;
            txt_vs_height.Disabled = true;
            txt_vs_blood_pressure.Disabled = true;
            txt_vs_spO2.Disabled = true;
            txt_vs_pulse.Disabled = true;
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
            txt_medication.Disabled = disabled;
            txt_transfer.Disabled = disabled;
            rad_spec_opinion_requested1.Disabled = disabled;
            rad_spec_opinion_requested2.Disabled = disabled;
            txt_spec_opinion_requested_note.Disabled = disabled;
            txt_specific_education_required.Disabled = disabled;

            rad_next_appointment1.Disabled = disabled;
            WebHelpers.DisabledDatimePicker(dtpk_date_next_appointment, disabled);

            rad_next_appointment2.Disabled = disabled;
            txt_next_appointment.Disabled = disabled;
            
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            pomr = new POMR(DataHelpers.varDocId);
            pomr.status = DocumentStatus.FINAL;
            pomr.user_name = (string)Session["UserID"];

            UpdateData(pomr);
        }

        public void UpdateData(POMR pomr)
        {
            pomr.amend_reason = txt_amendReason.Value;
            pomr.chief_complaint = txt_chief_complaint.Value;
            pomr.medical_history = txt_medical_history.Value;
            pomr.current_medication = txt_current_medication.Value;
            pomr.personal = txt_personal.Value;
            pomr.family = txt_family.Value;

            if (rad_allergy2.Checked)
            { pomr.allergy = false; pomr.allergy_note = txt_allergy_note.Value; }
            else if (rad_allergy2.Checked)
            { pomr.allergy = true; }

            pomr.physical_examination = txt_physical_examination.Value;
            pomr.laboratory_indications_results = txt_laboratory_indications_results.Value;
            pomr.initial_diagnosis = txt_initial_diagnosis.Value;
            pomr.differential_diagnosis = txt_differential_diagnosis.Value;
            pomr.associated_conditions = txt_associated_conditions.Value;

            foreach (KeyValuePair<string, string> code in DocumentCode.TriageCode)
            {
                if (((HtmlInputRadioButton)FindControl("rad_triage_code_" + code.Key.ToLower())).Checked)
                {
                    pomr.treatment_code = code.Key;
                    pomr.treatment_desc = code.Value;
                    break;
                }
            }

            if (rad_spec_opinion_requested1.Checked)
            {
                pomr.spec_opinion_requested = false;
            }
            else if (rad_spec_opinion_requested2.Checked)
            {
                pomr.spec_opinion_requested = true;
                pomr.spec_opinion_requested_note = txt_spec_opinion_requested_note.Value;
            }

            if (rad_next_appointment1.Checked)
            {
                pomr.bool_next_appointment = true;
                pomr.txt_next_appointment = null;

                if (dtpk_date_next_appointment.SelectedDate != null)
                {
                    pomr.date_next_appointment = DataHelpers.ConvertSQLDateTime(dtpk_date_next_appointment.SelectedDate);
                }
            }
            else if(rad_next_appointment2.Checked)
            {
                pomr.bool_next_appointment = false;
                pomr.txt_next_appointment = txt_next_appointment.Value;
            }

            if (pomr.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            pomr = new POMR(DataHelpers.varDocId);
            pomr.status = DocumentStatus.DRAFT;
            pomr.user_name = (string)Session["UserID"];

            UpdateData(pomr);
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
    }
}
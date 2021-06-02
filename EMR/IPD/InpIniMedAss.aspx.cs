using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class InpIniMedAss : Page
    {
        Iima iima;
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

            iima = new Iima(DataHelpers.varDocId);
            loadDataToOMRControls(iima);
        }

        public void loadDataToOMRControls(Iima iima)
        {
            try
            {
                txt_chief_complaint.Value = iima.chief_complaint;
                txt_cur_med_history.Value = iima.cur_med_history;
                txt_cur_medication.Value = iima.cur_medication;
                txt_personal.Value = iima.personal;

                if (iima.habits_smoking != null)
                {
                    if (
                        (iima.habits_smoking))
                    {
                        rad_habits_smoking2.Checked = true;
                        txt_habits_smoking_pack.Value = iima.habits_smoking_pack;
                    }
                    else
                    {
                        rad_habits_smoking1.Checked = true;
                    }
                }

                if (iima.habits_alcohol != null)
                {
                    if (iima.habits_alcohol)
                    {
                        rad_habits_alcohol2.Checked = true;
                        txt_habits_alcohol_note.Value = iima.habits_alcohol_note;
                    }
                    else
                    {
                        rad_habits_alcohol1.Checked = true;
                    }
                }

                if (iima.habits_drugs != null)
                {
                    if (iima.habits_drugs)
                    {
                        rad_habits_drugs2.Checked = true;
                        txt_habits_drugs_note.Value = iima.habits_drugs_note;
                    }
                    else
                    {
                        rad_habits_drugs1.Checked = true;
                    }
                }

                if (iima.habits_physical_exercise != null)
                {
                    if (iima.habits_physical_exercise)
                    {
                        rad_habits_physical_exercise2.Checked = true;
                        txt_habits_phy_exer_note.Value = iima.habits_phy_exer_note;
                    }
                    else
                    {
                        rad_habits_physical_exercise1.Checked = true;
                    }
                }

                txt_habits_other.Value = iima.habits_other;

                if (iima.allergy != null)
                {
                    if (iima.allergy)
                    {
                        rad_allergy2.Checked = true;
                        txt_allergy_note.Value = iima.allergy_note;
                    }
                    else
                    {
                        rad_allergy1.Checked = true;
                    }
                }

                txt_family.Value = iima.family;
                txt_immunization.Value = iima.immunization;
                txt_vs_temperature.Value = iima.vs_temperature;
                txt_vs_heart_rate.Value = iima.vs_heart_rate;
                txt_vs_weight.Value = iima.vs_weight;
                txt_vs_height.Value = iima.vs_height;
                txt_vs_respiratory_rate.Value = iima.vs_respiratory_rate;
                txt_vs_BMI.Value = iima.vs_BMI;
                txt_vs_blood_pressure.Value = iima.vs_blood_pressure;
                txt_vs_spO2.Value = iima.vs_spO2;
                txt_vs_pulse.Value = iima.vs_pulse;
                txt_physical_exam.Value = iima.physical_exam;
                if(iima.psy_consul_required != null)
                {
                    if (iima.psy_consul_required)
                    {
                        rad_psy_consult_required2.Checked = true;
                    } else
                    {
                        rad_psy_consult_required1.Checked = true;
                    }
                }
                txt_laboratory_result.Value = iima.laboratory_result;
                txt_add_investigation.Value = iima.add_investigation;
                txt_initial_diagnosis.Value = iima.initial_diagnosis;
                txt_diagnosis.Value = iima.diagnosis;
                txt_diff_diagnosis.Value = iima.diff_diagnosis;
                txt_associated_conditions.Value = iima.associated_conditions;
                txt_treatment_plan.Value = iima.treatment_plan;
                txt_discharge_plan.Value = iima.discharge_plan;

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (iima.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }

                else if (iima.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void DisabledControl(bool disabled)
        {
            //txt_chief_complaint.Disabled = disabled;
            //txt_cur_med_history.Disabled = disabled;
            //txt_cur_medication.Disabled = disabled;
            //txt_personal.Disabled = disabled;
            

        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            iima = new Iima(DataHelpers.varDocId);
            iima.status = DocumentStatus.FINAL;
            iima.user_name = (string)Session["UserID"];

            UpdateData(iima);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            iima = new Iima(DataHelpers.varDocId);
            iima.status = DocumentStatus.DRAFT;
            iima.user_name = (string)Session["UserID"];

            UpdateData(iima);
        }

        public void UpdateData(Iima iima)
        {

            iima.amend_reason = txt_amendReason.Value;
            iima.chief_complaint = txt_chief_complaint.Value;
            iima.cur_med_history = txt_cur_med_history.Value;
            iima.cur_medication = txt_cur_medication.Value;
            iima.personal = txt_personal.Value;

            if (rad_habits_smoking1.Checked)
            {
                iima.habits_smoking = false;
            } else if (rad_habits_smoking2.Checked)
            {
                iima.habits_smoking = true;
                iima.habits_smoking_pack = txt_habits_smoking_pack.Value;
            }

            if (rad_habits_alcohol1.Checked)
            {
                iima.habits_alcohol = false;
            }
            else if (rad_habits_alcohol2.Checked)
            {
                iima.habits_alcohol = true;
                iima.habits_alcohol_note = txt_habits_alcohol_note.Value;
            }

            if (rad_habits_drugs1.Checked)
            {
                iima.habits_drugs = false;
            }
            else if (rad_habits_drugs2.Checked)
            {
                iima.habits_drugs = true;
                iima.habits_drugs_note = txt_habits_drugs_note.Value;
            }

            if (rad_habits_physical_exercise1.Checked)
            {
                iima.habits_physical_exercise = false;
            }
            else if (rad_habits_physical_exercise2.Checked)
            {
                iima.habits_physical_exercise = true;
                iima.habits_phy_exer_note = txt_habits_phy_exer_note.Value;
            }

            iima.habits_other = txt_habits_other.Value;

            if (rad_allergy1.Checked)
            {
                iima.allergy = false;
            }
            else if (rad_allergy2.Checked)
            {
                iima.allergy = true;
                iima.allergy_note = txt_allergy_note.Value;
            }

            iima.family = txt_family.Value;
            iima.immunization = txt_immunization.Value;
            iima.vs_temperature = txt_vs_temperature.Value;
            iima.vs_heart_rate = txt_vs_heart_rate.Value;
            iima.vs_weight = txt_vs_weight.Value;
            iima.vs_height = txt_vs_height.Value;
            iima.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            iima.vs_BMI = txt_vs_BMI.Value;
            iima.vs_blood_pressure = txt_vs_blood_pressure.Value;
            iima.vs_spO2 = txt_vs_spO2.Value;
            iima.vs_pulse = txt_vs_pulse.Value;
            iima.physical_exam = txt_physical_exam.Value;
            
            if (rad_psy_consult_required1.Checked)
            {
                iima.psy_consul_required = false;
            } else if (rad_psy_consult_required2.Checked)
            {
                iima.psy_consul_required = true;
            }

            iima.laboratory_result = txt_laboratory_result.Value;
            iima.add_investigation = txt_add_investigation.Value;
            iima.initial_diagnosis = txt_initial_diagnosis.Value;
            iima.diagnosis = txt_diagnosis.Value;
            iima.diff_diagnosis = txt_diff_diagnosis.Value;
            iima.associated_conditions = txt_associated_conditions.Value;
            iima.treatment_plan = txt_treatment_plan.Value;
            iima.discharge_plan = txt_discharge_plan.Value;

            if (iima.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Iima.Delete((string)Session["UserID"], Request.QueryString["vpid"]);
        }
    }
}
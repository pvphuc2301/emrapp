using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class OutPatMedRec : System.Web.UI.Page
    {
        string amendReason = "";
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

            // Get du lieu tu API to Object
            OutpatientMedicalRecord omr1 = new OutpatientMedicalRecord(DataHelpers.varDocId);

            // Fill du lieu tu Object to Controls.
            loadDataToOMRControls(omr1);
        }

        public void loadDataToOMRControls(OutpatientMedicalRecord omr1)
        {
            // I. Lý do đến khám/ Chief complaint:
            txtChiefComplaint.Value = omr1.chief_complain;

            // II. Bệnh sử/ Medical History:
            // 1.Bệnh sử hiện tại / Current Medical History:
            txtMedicalHistory.Value = omr1.medical_history;
            txtCurrentMedication.Value = omr1.current_medication;

            // 2.Tiền sử bệnh/ Antecedent Medical History:
            txtPersonal.Value = omr1.personal;

            if (bool.Parse(omr1.habits_smoking))
            {
                rad_habits_smoking2.Checked = true;
                txt_habits_smoking_pack.Value = omr1.habits_smoking_pack;
            }
            else
            {
                rad_habits_smoking1.Checked = true;
            }

            if (bool.Parse(omr1.habits_alcohol))
            {
                rad_habits_alcohol2.Checked = true;
                txt_habits_alcohol_note.Value = omr1.habits_alcohol_note;
            }
            else
            {
                rad_habits_alcohol1.Checked = true;
            }

            if (bool.Parse(omr1.habits_drugs))
            {
                rad_habits_drugs2.Checked = true;
                txt_habits_drugs_note.Value = omr1.habits_drugs_note;
            }
            else
            {
                rad_habits_drugs1.Checked = true;
            }

            if (bool.Parse(omr1.habits_physical_exercise))
            {
                rad_habits_physical_exercise2.Checked = true;
                txt_habits_phy_exer_note.Value = omr1.habits_phy_exer_note;
            }
            else
            {
                rad_habits_physical_exercise1.Checked = true;
            }

            txt_habits_other.Value = omr1.habits_other;
            if (bool.Parse(omr1.allergy))
            {
                radAllergy2.Checked = true;
                txtAllergyNote.Value = omr1.allergy_note;
            }
            else
            {
                radAllergy1.Checked = true;
            }
            
            txtFamily.Value = omr1.family;
            txtImmunization.Value = omr1.immunization;

            // III.Khám bệnh/ Physical Examination:
            // DẤU HIỆU SINH TỒN/ VITAL SIGNS:
            txtTemperature.Value = omr1.vs_temperature;
            txtHeartRate.Value = omr1.vs_heart_rate;
            txtWeight.Value = omr1.vs_weight;
            txtRespiratoryRate.Value = omr1.vs_respiratory_rate;
            txtHeight.Value = omr1.vs_height;
            txtBloodPressure.Value = omr1.vs_blood_pressure;
            txtBmi.Value = omr1.vs_BMI;
            txtSpo2.Value = omr1.vs_spO2;
            txt_pulse.Value = omr1.vs_pulse;

            txt_physical_examination.Value = DataHelpers.FormatPhysicalExamination(omr1.physical_examination);
            if (bool.Parse(omr1.psy_consult_required))
            {
                rad_psy_consult_required2.Checked = true;
            }
            else
            {
                rad_psy_consult_required1.Checked = true;
            }
            txt_laboratory_indications_results.Value = omr1.laboratory_indications_results;
            txt_additional_investigation.Value = omr1.additional_investigation;
            // V.Kết luận/ Conclusion:
            //txtDiagnosis.Text = omr1.diagnosis;
            txt_initial_diagnosis.Value = omr1.initial_diagnosis;
            txt_diagnosis.Value = omr1.diagnosis;
            txtDiffesrentialDiagnosis.Value = omr1.differential_diagnosis;
            txt_associated_conditions.Value = omr1.associated_conditions;
            string _varTreatmentCode = omr1.treatment_code;
            if (_varTreatmentCode == "OPD")
                radTreatment1.Checked = true;
            else if (_varTreatmentCode == "IPD")
                radTreatment2.Checked = true;
            else if (_varTreatmentCode == "TRF")
                radTreatment3.Checked = true;

            // 5.Current medications
            txtMedicine.Value = omr1.medicine;

            if (bool.Parse(omr1.spec_opinion_requested))
            {
                rad_spec_opinion_requested2.Checked = true;
                txt_spec_opinion_requested_note.Value = omr1.spec_opinion_requested_note;
            }
            else
            { rad_spec_opinion_requested1.Checked = true; }

            txt_specific_education_required.Value = omr1.specific_education_required;
            txt_next_appointment.Value = omr1.next_appointment;

            btnCancel.Visible = false;

            if (omr1.status == DocumentStatus.FINAL)
            {
                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDelete.Visible = false;
                btnCancel.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);

            }
            else if (omr1.status == DocumentStatus.DRAFT)
            {
                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        protected void DisabledControl(bool disabled)
        {
            txtChiefComplaint.Disabled = disabled;
            txtCurrentMedication.Disabled = disabled;
            txtMedicalHistory.Disabled = disabled;
            txtPersonal.Disabled = disabled;
            txt_habits_smoking_pack.Disabled = disabled;
            txt_habits_alcohol_note.Disabled = disabled;
            txtAllergyNote.Disabled = disabled;
            txt_habits_drugs_note.Disabled = disabled;
            txt_habits_phy_exer_note.Disabled = disabled;
            txt_habits_other.Disabled = disabled;
            txtAllergyNote.Disabled = disabled;
            txtImmunization.Disabled = disabled;
            txtFamily.Disabled = disabled;
            txt_physical_examination.Disabled = disabled;
            txt_laboratory_indications_results.Disabled = disabled;
            txt_additional_investigation.Disabled = disabled;
            txt_initial_diagnosis.Disabled = disabled;
            txt_diagnosis.Disabled = disabled;
            txtDiffesrentialDiagnosis.Disabled = disabled;
            txt_associated_conditions.Disabled = disabled;
            txtMedicine.Disabled = disabled;
            txt_spec_opinion_requested_note.Disabled = disabled;
            txt_specific_education_required.Disabled = disabled;
            txt_next_appointment.Disabled = disabled;

            rad_habits_smoking1.Disabled = disabled;
            rad_habits_smoking2.Disabled = disabled;
            rad_habits_alcohol1.Disabled = disabled;
            rad_habits_alcohol2.Disabled = disabled;
            rad_habits_drugs1.Disabled = disabled;
            rad_habits_drugs2.Disabled = disabled;
            rad_habits_physical_exercise1.Disabled = disabled;
            rad_habits_physical_exercise2.Disabled = disabled;
            radAllergy1.Disabled = disabled;
            radAllergy2.Disabled = disabled;
            rad_psy_consult_required1.Disabled = disabled;
            rad_psy_consult_required2.Disabled = disabled;
            radTreatment1.Disabled = disabled;
            radTreatment2.Disabled = disabled;
            radTreatment3.Disabled = disabled;
            rad_spec_opinion_requested1.Disabled = disabled;
            rad_spec_opinion_requested2.Disabled = disabled;

            txtTemperature.Disabled = true;
            txtWeight.Disabled = true;
            txtHeight.Disabled = true;
            txtHeartRate.Disabled = true;
            txtRespiratoryRate.Disabled = true;
            txtBloodPressure.Disabled = true;
            txtSpo2.Disabled = true;
            txt_pulse.Disabled = true;
        }

        /// <summary>
        /// Chi khi DocumentStatus = DRAFT thi Button nay moi thuc hien Action.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e) 
        {
            //btnComplete.Enabled = btnSave.Enabled = btnDelete.Enabled = true;
            //btnAmend.Enabled = btnCancel.Enabled = false;
            amendReason = "";
            
            UpdateData(DataHelpers.varDocId, DataHelpers.varUseName, DocumentStatus.DRAFT, amendReason);
            
        }
       /// <summary>
       /// DocumentStatus = Final, muon chinh sua du lieu --> thuc hien Button nay, de bat trang thai Edit cho tat ca TextBox.
       /// </summary>
       /// <param name="sender"></param>
       /// <param name="e"></param>
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            AmendReason amendReason = (AmendReason)Page.LoadControl("~/UserControls/AmendReason.ascx");
            amendReason.Load(AmendReasonPlaceHolder);

            btnComplete.Visible = true;
            btnComplete.Attributes["disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            UpdateData(DataHelpers.varDocId, (string)Session["UserID"], DocumentStatus.FINAL, amendReason);
        }
        protected void UpdateData(string varDocID, string varUseName, string varStatus, string varAmendReason)
        {
            string _notification = "";

            string _varTreatmentCode = "";
            if (radTreatment1.Checked) _varTreatmentCode = "OPD";
            else if (radTreatment2.Checked) _varTreatmentCode = "IPD";
            else if (radTreatment3.Checked) _varTreatmentCode = "TRF";

            OutpatientMedicalRecord omr2 = new OutpatientMedicalRecord(
                varDocID,
                varUseName,
                varStatus,
                "",
                txtChiefComplaint.Value,
                txtMedicalHistory.Value,
                txtPersonal.Value,
                rad_habits_smoking2.Checked,
                txt_habits_smoking_pack.Value,
                rad_habits_alcohol2.Checked,
                txt_habits_alcohol_note.Value,
                rad_habits_drugs2.Checked,
                txt_habits_drugs_note.Value,
                rad_habits_physical_exercise2.Checked,
                txt_habits_phy_exer_note.Value,
                txt_habits_other.Value,
                radAllergy2.Checked,
                txtAllergyNote.Value,
                txtFamily.Value,
                txtImmunization.Value,
                txtCurrentMedication.Value,
                txtTemperature.Value,
                txtHeartRate.Value,
                txtWeight.Value,
                txtHeight.Value,
                txtRespiratoryRate.Value,
                txtBmi.Value,
                txtBloodPressure.Value,
                txtSpo2.Value,
                txt_pulse.Value,
                txt_physical_examination.Value,
                rad_psy_consult_required2.Checked,
                txt_laboratory_indications_results.Value,
                txt_additional_investigation.Value,
                txt_initial_diagnosis.Value,
                txt_diagnosis.Value,
                txtDiffesrentialDiagnosis.Value,
                txt_associated_conditions.Value,
                _varTreatmentCode,
                "",
                txtMedicine.Value,
                rad_spec_opinion_requested2.Checked,
                txt_spec_opinion_requested_note.Value,
                txt_specific_education_required.Value,
                txt_next_appointment.Value);

            if (omr2.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;

            DisabledControl(true);
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Print/OutPatMedRec.aspx");
        }
    }
}
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
    public partial class DischargeSummary : System.Web.UI.Page
    {
        Diss diss;
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
            if (Request.QueryString["vpid"] != null) DataHelpers.varPVId = Request.QueryString["vpid"];
            
            diss = new Diss(DataHelpers.varDocId);
            loadDataToOMRControls(diss);

        }

        public void loadDataToOMRControls(Diss diss)
        {
            try
            {
                BindRadioButton("rad_disc_reason_code_" + diss.disc_reason_code);

                WebHelpers.BindDateTimePicker(dpk_date_of_hospital, diss.date_of_hospital);
                
                WebHelpers.BindDateTimePicker(dpk_date_of_discharge, diss.date_of_discharge);
                //1
                txt_admission_reason.Value = diss.admission_reason;
                //2
                txt_icd10_diagnosis.Value = diss.icd10_diagnosis;
                txt_associated_diagnosis.Value = diss.associated_diagnosis;
                //3
                txt_cur_med_history.Value = diss.cur_med_history;
                txt_ant_med_history.Value = diss.ant_med_history;
                //4
                txt_physical_finding.Value = diss.physical_finding;
                //5
                txt_lab_result.Value = diss.lab_result;
                BindRadioButton("rad_patho_result_code_" + diss.patho_result_code);
                
                //6
                txt_proce_performed.Value = diss.proce_performed;
                //7
                txt_treatment.Value = diss.treatment;
                //8
                txt_evolution.Value = diss.evolution;
                //9
                txt_disc_condition.Value = diss.disc_condition;
                //10
                if (diss.disc_reason_code == "DAMA")
                {
                    txt_disc_medication.Visible = false;
                }
                else { 
                    txt_disc_medication.Value = diss.disc_medication;
                }
                //11
                txt_follow_up_instruc.Value = diss.follow_up_instruc;
                //12
                txt_special_diet.Value = diss.special_diet;
                //13
                WebHelpers.BindDateTimePicker(dpk_next_consult_date, diss.next_consult_date);
                txt_next_consult_doctor.Value = diss.next_consult_doctor;

                //dama
                txt_dama.Value = diss.dama;
                txt_dama_note.Value = diss.dama_note;

                // transfer
                txt_trans_to_hospital.Value = diss.trans_to_hospital;
                txt_transfer_reason.Value = diss.transfer_reason;

                WebHelpers.BindDateTimePicker(dpk_signed_date, diss.signed_date);
                txt_signed_doctor.Value = diss.signed_doctor;


                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (diss.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                    LoadDataToPrint(diss);
                }
                else if (diss.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }

            }
            catch (Exception ex)
            {

            }
        }

        private void LoadDataToPrint(Diss diss)
        {
            Patient patient = Patient.Instance();
            PatientVisit patientVisit = PatientVisit.Instance(Request["pvid"]);

            prt_fullname.InnerText = string.Format("{0} ({1}) - {2}", patient.GetFullName(), patient.title_l, patient.gender_l);
            prt_DOB.InnerText = "DOB: " + WebHelpers.FormatDateTime(patient.date_of_birth);
            prt_vpid.InnerText = string.Format("{0} - {1} - {2}", patient.visible_patient_id, patientVisit.visit_type, patientVisit.visit_code);
            prt_barcode.Text = patient.visible_patient_id;

            prt_date_of_hospital.Value = WebHelpers.FormatDateTime(diss.date_of_hospital);
            prt_date_of_discharge.Value = WebHelpers.FormatDateTime(diss.date_of_discharge);
            //1
            prt_admission_reason.Value = diss.admission_reason;
            //2
            prt_icd10_diagnosis.Value = diss.icd10_diagnosis;
            //3
            prt_cur_med_history.Value = diss.cur_med_history;
            //4
            prt_physical_finding.Value = diss.physical_finding;
            //5
            prt_lab_result.Value = diss.lab_result;
            //6
            prt_proce_performed.Value = diss.proce_performed;
            //7
            prt_treatment.Value = diss.treatment;
            //8
            prt_evolution.Value = diss.evolution;
            //9
            prt_disc_condition.Value = diss.disc_condition;
            //10
            prt_disc_medication.Value = diss.disc_medication;

            prt_follow_up_instruc.Visible = false;
            prt_special_diet.Visible = false;
            prt_next_consult.Visible = false;
            prt_dama.Visible = false;
            prt_trans_to_hospital.Visible = false;
            prt_transfer_reason.Visible = false;
            prt_disc_medication.Visible = false;

            if (diss.disc_reason_code == "DAMA")
            {
                //10
                prt_dama.Visible = true;
                prt_dama.Value = diss.dama;
                
            }
            else if(diss.disc_reason_code == "TRANSFER")
            {
                //10
                prt_disc_medication.Visible = true;
                prt_disc_medication.Value = diss.disc_medication;
                //11
                prt_trans_to_hospital.Visible = true;
                prt_trans_to_hospital.Value = diss.trans_to_hospital;

                prt_transfer_reason.Visible = true;
                prt_transfer_reason.Value = diss.transfer_reason;
            } else if (diss.disc_reason_code == "AMA")
            {
                //10
                prt_disc_medication.Visible = true;
                prt_disc_medication.Value = diss.disc_medication;
                //11
                prt_follow_up_instruc.Visible = true;
                prt_follow_up_instruc.Value = diss.follow_up_instruc;
                //12
                prt_special_diet.Visible = true;
                prt_special_diet.Value = diss.special_diet;
                //13
                prt_next_consult.Visible = true;
                prt_next_consult.Value = WebHelpers.FormatDateTime(diss.next_consult_date, "dd-MM-yyy") + " " + diss.next_consult_doctor;
            }

            prt_signature1.Content = WebHelpers.GetSignatureTemplate1("Ngày/ <span class='text-primary'>Date</span>: __-__-20__", "Bác sỹ điều trị/ <span class='text-primary'> Attending Physician:<span>", "", "", "", "");

        }

        private bool CheckFieldsValid()
        {
            if (!rad_disc_reason_code_ama.Checked || !rad_disc_reason_code_dama.Checked || rad_disc_reason_code_transfer.Checked)
            {
                return false;
            }
            return true;
        }

        protected void DisabledControl(bool disabled)
        {
            foreach (KeyValuePair<string, string> code in Diss.DISC_REASON_CODE)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_disc_reason_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            WebHelpers.DisabledDateTimePicker(dpk_date_of_hospital, disabled);
            WebHelpers.DisabledDateTimePicker(dpk_date_of_discharge, disabled);
            txt_admission_reason.Disabled = disabled;
            txt_icd10_diagnosis.Disabled = disabled;
            txt_associated_diagnosis.Disabled = disabled;
            txt_cur_med_history.Disabled = disabled;
            txt_ant_med_history.Disabled = disabled;
            txt_physical_finding.Disabled = disabled;
            txt_lab_result.Disabled = disabled;

            foreach (KeyValuePair<string, string> code in Diss.PATHO_RESULT_CODE)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_patho_result_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            txt_proce_performed.Disabled = disabled;
            txt_treatment.Disabled = disabled;
            txt_evolution.Disabled = disabled;
            txt_disc_condition.Disabled = disabled;

            //10
            txt_disc_medication.Disabled = disabled;
            //11
            txt_follow_up_instruc.Disabled = disabled;
            txt_special_diet.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dpk_next_consult_date, disabled);
            txt_next_consult_doctor.Disabled = disabled;
            txt_trans_to_hospital.Disabled = disabled;
            txt_transfer_reason.Disabled = disabled;
            //
            WebHelpers.DisabledDateTimePicker(dpk_signed_date, disabled);
            txt_signed_doctor.Disabled = disabled;

            //if(diss.disc_reason_code == "TRANSFER")
            //{
            //    txt_trans_to_hospital.Disabled = disabled;
            //    txt_disc_medication.Disabled = disabled;
            //    txt_transfer_reason.Disabled = disabled;
            //}
            //else if (diss.disc_reason_code == "AMA")
            //{
            //    txt_follow_up_instruc.Disabled = disabled;
            //    txt_special_diet.Disabled = disabled;
            //    txt_disc_medication.Disabled = disabled;
            //    WebHelpers.DisabledDateTimePicker(dpk_next_consult_date, disabled);
            //    txt_next_consult_doctor.Disabled = disabled;
            //}
            //else 
            
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                diss = new Diss(Request.QueryString["docId"]);
                diss.status = DocumentStatus.FINAL;
                diss.user_name = (string)Session["UserID"];

                UpdateData(diss);
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                diss = new Diss(Request.QueryString["docId"]);
                diss.status = DocumentStatus.DRAFT;
                diss.user_name = (string)Session["UserID"];

                UpdateData(diss);
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        public void UpdateData(Diss diss)
        {
            diss.amend_reason = txt_amendReason.Value;

            diss.disc_reason_code = GetRadioButton("rad_disc_reason_code_", Diss.DISC_REASON_CODE);
            if (diss.disc_reason_code != null) diss.disc_reason_desc = Diss.DISC_REASON_CODE[diss.disc_reason_code];

            diss.date_of_hospital = DataHelpers.ConvertSQLDateTime(dpk_date_of_hospital.SelectedDate);
            diss.date_of_discharge = DataHelpers.ConvertSQLDateTime(dpk_date_of_discharge.SelectedDate);
            diss.admission_reason = txt_admission_reason.Value;
            diss.icd10_diagnosis = txt_icd10_diagnosis.Value;
            diss.associated_diagnosis = txt_associated_diagnosis.Value;
            diss.cur_med_history = txt_cur_med_history.Value;
            diss.ant_med_history = txt_ant_med_history.Value;
            diss.physical_finding = txt_physical_finding.Value;
            diss.lab_result = txt_lab_result.Value;

            diss.patho_result_code = GetRadioButton("rad_patho_result_code_", Diss.PATHO_RESULT_CODE);
            if (diss.patho_result_code != null) diss.patho_result_desc = Diss.PATHO_RESULT_CODE[diss.patho_result_code];

            diss.proce_performed = txt_proce_performed.Value;
            diss.treatment = txt_treatment.Value;
            diss.evolution = txt_evolution.Value;
            diss.disc_condition = txt_disc_condition.Value;
            diss.disc_medication = txt_disc_medication.Value;

            if (diss.disc_reason_code == "TRANSFER")
            {
                diss.disc_medication = txt_disc_medication.Value;
                diss.trans_to_hospital = txt_trans_to_hospital.Value;
                diss.transfer_reason = txt_transfer_reason.Value;

                //
                diss.next_consult_date = null;
                diss.next_consult_doctor = null;
                diss.dama = null;
                diss.dama_note = null;

            }
            else if (diss.disc_reason_code == "AMA") 
            {
                diss.disc_medication = txt_disc_medication.Value;
                diss.follow_up_instruc = txt_follow_up_instruc.Value;
                diss.special_diet = txt_special_diet.Value;
                diss.next_consult_date = DataHelpers.ConvertSQLDateTime(dpk_next_consult_date.SelectedDate);
                diss.next_consult_doctor = txt_next_consult_doctor.Value;

                //
                diss.transfer_reason = null;
                diss.trans_to_hospital = null;
            }
            else if (diss.disc_reason_code == "DAMA")
            {
                diss.dama = txt_dama.Value;
                diss.dama_note = txt_dama_note.Value;

                //
                diss.next_consult_date = null;
                diss.next_consult_doctor = null;
                diss.transfer_reason = null;
                diss.trans_to_hospital = null;
            }

            diss.signed_date = DataHelpers.ConvertSQLDateTime(dpk_signed_date.SelectedDate);
            diss.signed_doctor = txt_signed_doctor.Value;

            dynamic result = diss.Update();

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
        public void BindRadioButton(dynamic value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputRadioButton)FindControl(value)).Checked = true;
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"]);

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

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
    }
}
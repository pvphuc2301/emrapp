﻿using Newtonsoft.Json;
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
        public string UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserID();
            if (!IsPostBack)
            {
                Initial();
            }

            if (Request["__EVENTTARGET"] == "discReasonCode_Change")
            {
                LoadDischargeReason(Request["__EVENTARGUMENT"]);
            }
        }

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpid"] != null) DataHelpers.varPVId = Request.QueryString["vpid"];

            diss = new Diss(DataHelpers.varDocId);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;

            prt_barcode.Text = Patient.Instance().visible_patient_id;

            if (diss.status == DocumentStatus.FINAL)
            {
                LoadFormView(diss);
            }
            else if (diss.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(diss);
            }
        }
        private void LoadFormView(Diss diss)
        {
            lbl_disc_reason_desc.Text = WebHelpers.GetValue(diss.disc_reason_desc);
            lbl_date_of_hospital.Text = WebHelpers.FormatDateTime(diss.date_of_hospital);
            lbl_date_of_discharge.Text = WebHelpers.FormatDateTime(diss.date_of_discharge);
            lbl_admission_reason.Text = WebHelpers.GetValue(diss.admission_reason);
            lbl_icd10_diagnosis.Text = WebHelpers.GetValue(diss.icd10_diagnosis);
            lbl_associated_diagnosis.Text = WebHelpers.GetValue(diss.associated_diagnosis);
            lbl_cur_med_history.Text = WebHelpers.GetValue(diss.cur_med_history);
            lbl_ant_med_history.Text = WebHelpers.GetValue(diss.ant_med_history);
            lbl_physical_finding.Text = WebHelpers.GetValue(diss.physical_finding);
            lbl_lab_result.Text = WebHelpers.GetValue(diss.lab_result);
            lbl_patho_result_desc.Text = WebHelpers.GetValue(diss.patho_result_desc);
            lbl_proce_performed.Text = WebHelpers.GetValue(diss.proce_performed);
            lbl_treatment.Text = WebHelpers.GetValue(diss.treatment);
            lbl_evolution.Text = WebHelpers.GetValue(diss.evolution);
            lbl_disc_condition.Text = WebHelpers.GetValue(diss.disc_condition);
            lbl_disc_medication.Text = WebHelpers.GetValue(diss.disc_medication);
            lbl_follow_up_instruc.Text = WebHelpers.GetValue(diss.follow_up_instruc);
            lbl_special_diet.Text = WebHelpers.GetValue(diss.special_diet);
            lbl_next_consult_date.Text = WebHelpers.FormatDateTime(diss.next_consult_date);
            lbl_next_consult_doctor.Text = WebHelpers.GetValue(diss.next_consult_doctor);
            lbl_dama.Text = WebHelpers.GetValue(diss.dama);
            lbl_dama_note.Text = WebHelpers.GetValue(diss.dama_note);
            lbl_transfer_reason.Text = WebHelpers.GetValue(diss.transfer_reason);
            lbl_trans_to_hospital.Text = WebHelpers.GetValue(diss.trans_to_hospital);
            lbl_signed_date.Text = WebHelpers.FormatDateTime(diss.signed_date);
            lbl_signed_doctor.Text = WebHelpers.GetValue(diss.signed_doctor);

            LoadDischargeReason(diss.disc_reason_code);

            //
            LoadFormControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void LoadFormEdit(Diss diss)
        {
            LoadDischargeReason(diss.disc_reason_code);
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
            else
            {
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
            //
            LoadFormControl(false);

            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }
        private void LoadFormPrint(Diss diss)
        {
            Patient patient = Patient.Instance();
            PatientVisit patientVisit = PatientVisit.Instance(Request["pvid"]);

            prt_fullname.InnerText = string.Format("{0} - {1}", patient.GetFullName(), patient.gender_l);
            prt_DOB.InnerText = "DOB: " + WebHelpers.FormatDateTime(patient.date_of_birth);
            prt_vpid.InnerText = string.Format("{0} - {1} - {2}", patient.visible_patient_id, patientVisit.visit_type, patientVisit.visit_code);
            prt_barcode.Text = patient.visible_patient_id;

            prt_date_of_hospital.Text = WebHelpers.FormatDateTime(diss.date_of_hospital);

            prt_date_of_discharge.Text = WebHelpers.FormatDateTime(diss.date_of_discharge);
            //1
            prt_admission_reason.Text = diss.admission_reason;
            //2
            prt_icd10_diagnosis.Text = diss.icd10_diagnosis;
            //3
            prt_cur_med_history.Text = diss.cur_med_history;
            //4
            prt_physical_finding.Text = diss.physical_finding;
            //5
            prt_lab_result.Text = diss.lab_result;
            //6
            prt_proce_performed.Text = diss.proce_performed;
            //7
            prt_treatment.Text = diss.treatment;
            //8
            prt_evolution.Text = diss.evolution;
            //9
            prt_disc_condition.Text = diss.disc_condition;
            //10
            prt_disc_medication.Text = diss.disc_medication;

            prt_follow_up_instruc.Visible = false;
            prt_special_diet.Visible = false;
            prt_next_consult.Visible = false;
            prt_dama.Visible = false;
            prt_trans_to_hospital.Visible = false;
            prt_transfer_reason.Visible = false;
            prt_disc_medication.Visible = false;

            prt_dama_title.Visible = prt_disc_medication_title.Visible = prt_trans_to_hospital_title.Visible = prt_transfer_reason_title.Visible = prt_follow_up_instruc_title.Visible = prt_special_diet_title.Visible = prt_next_consult_title.Visible = false;


            if (diss.disc_reason_code == "DAMA")
            {
                //10
                prt_dama_title.Visible = prt_dama.Visible = true;
                prt_dama.Text = diss.dama;

            }
            else if (diss.disc_reason_code == "TRANSFER")
            {
                //10
                prt_disc_medication.Visible = prt_disc_medication_title.Visible = true;
                prt_disc_medication.Text = diss.disc_medication;
                //11
                prt_trans_to_hospital.Visible = prt_trans_to_hospital_title.Visible = true;
                prt_trans_to_hospital.Text = diss.trans_to_hospital;

                prt_transfer_reason.Visible = prt_transfer_reason_title.Visible = true;
                prt_transfer_reason.Text = diss.transfer_reason;
            } else if (diss.disc_reason_code == "AMA")
            {
                //10
                prt_disc_medication.Visible = prt_disc_medication_title.Visible = true;
                prt_disc_medication.Text = diss.disc_medication;
                //11
                prt_follow_up_instruc.Visible = prt_follow_up_instruc_title.Visible = true;
                prt_follow_up_instruc.Text = diss.follow_up_instruc;
                //12
                prt_special_diet.Visible = prt_special_diet_title.Visible = true;
                prt_special_diet.Text = diss.special_diet;
                //13
                prt_next_consult.Visible = prt_next_consult_title.Visible = true;
                prt_next_consult.Text = WebHelpers.FormatDateTime(diss.next_consult_date) + " " + diss.next_consult_doctor;
            }

        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                diss = new Diss(Request.QueryString["docId"]);
                diss.status = DocumentStatus.FINAL;
                diss.user_name = (string)Session["UserID"];

                UpdateData(diss);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                diss = new Diss(Request.QueryString["docId"]);
                diss.status = DocumentStatus.DRAFT;
                diss.user_name = (string)Session["UserID"];

                UpdateData(diss);
            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            diss = new Diss(Request.QueryString["docId"]);

            amendReasonWraper.Visible = true;
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            LoadFormEdit(diss);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        public void UpdateData(Diss diss)
        {
            diss.amend_reason = txt_amend_reason.Text;

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

            dynamic result = diss.Update()[0];

            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                Initial();
            }
            else
            {
                Session["PageNotFound"] = result;
                Response.Redirect("../Other/PageNotFound.aspx", false);
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
            diss = new Diss(Request.QueryString["docId"]);
            LoadFormPrint(diss);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }

        #region Authen
        private void CheckUserID()
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);
        }
        #endregion

        #region Functions
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
        private void LoadDischargeReason(string value)
        {
            value = value.ToLower();
            if (value == "dama")
            {
                dama_field.Visible = true;
                //-----------------------------
                disc_medication_field.Visible = false;
                transfer_field.Visible = false;
                follow_up_field.Visible = false;
                special_diet_field.Visible = false;
                next_consultation_field.Visible = false;
            }
            else if (value == "transfer")
            {
                disc_medication_field.Visible = true;
                transfer_field.Visible = true;

                //-----------------------------
                follow_up_field.Visible = false;
                special_diet_field.Visible = false;
                next_consultation_field.Visible = false;
                dama_field.Visible = false;

            }
            else if (value == "ama")
            {
                disc_medication_field.Visible = true;
                follow_up_field.Visible = true;
                special_diet_field.Visible = true;
                next_consultation_field.Visible = true;

                //-----------------------------
                transfer_field.Visible = false;
                dama_field.Visible = false;

            }
        }
        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in diss.GetType().GetProperties())
            {
                var control1 = FindControl(prop.Name + "_wrapper");
                var control2 = FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = !disabled;
                }
                if (control2 != null)
                {
                    control2.Visible = disabled;
                }
            }
        }
        #endregion

        #region Validations
        protected void disc_reason_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_disc_reason_code_ama.Checked || rad_disc_reason_code_dama.Checked || rad_disc_reason_code_transfer.Checked;
        }
        protected void disc_reason_code_ama_ServerChange(object sender, EventArgs e)
        {
            LoadDischargeReason("AMA");
        }

        protected void disc_reason_code_dama_ServerChange(object sender, EventArgs e)
        {
            LoadDischargeReason("DAMA");
        }

        protected void disc_reason_code_transfer_ServerChange(object sender, EventArgs e)
        {
            LoadDischargeReason("TRANSFER");
        }
        #endregion
    }
}
﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR.OPD
{
    public partial class MedRecForVac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);

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


            try
            {
                Mrfv mrfv = new Mrfv(Request.QueryString["docId"]);

                vs_temperature.Text = mrfv.vs_temperature;
                vs_heart_rate.Text = mrfv.vs_heart_rate;
                vs_weight.Text = mrfv.vs_weight;
                vs_height.Text = mrfv.vs_height;
                vs_respiratory_rate.Text = mrfv.vs_respiratory_rate;
                vs_BMI.Text = mrfv.vs_BMI;
                vs_blood_pressure.Text = mrfv.vs_blood_pressure;
                vs_spO2.Text = mrfv.vs_spO2;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (mrfv.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mrfv, WebHelpers.LoadFormControl(form1, mrfv, ControlState.View, (string)Session["location"]));

                }
                else if (mrfv.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mrfv, WebHelpers.LoadFormControl(form1, mrfv, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, mrfv.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        private void BindingDataForm(Mrfv mrfv, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(mrfv);
            }
            else
            {
                BindingDataFormView(mrfv);
            }
        }
        private void BindingDataFormEdit(Mrfv mrfv)
        {
            txt_chief_complaint.Value = mrfv.chief_complaint;
            txt_cur_med_history.Value = mrfv.cur_med_history;
            txt_cur_medications.Value = mrfv.cur_medications;
            txt_personal.Value = mrfv.personal;
            txt_family.Value = mrfv.family;

            BindRadioButton("rad_allergy_" + mrfv.allergy);
            if (mrfv.allergy) { txt_allergy_note.Value = mrfv.allergy_text; }


            txt_scr_before_vacc_1.Value = mrfv.scr_before_vacc_1;
            txt_scr_before_vacc_2.Value = mrfv.scr_before_vacc_2;
            txt_scr_before_vacc_3.Value = mrfv.scr_before_vacc_3;
            txt_scr_before_vacc_4.Value = mrfv.scr_before_vacc_4;
            txt_scr_before_vacc_5.Value = mrfv.scr_before_vacc_5;
            txt_scr_before_vacc_6.Value = mrfv.scr_before_vacc_6;
            txt_scr_before_vacc_7.Value = mrfv.scr_before_vacc_7;
            txt_scr_before_vacc_8.Value = mrfv.scr_before_vacc_8;

            _BindGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine));

            btn_grid_appointed_vaccine_add.Visible = true;
            grid_appointed_vaccine.Columns[4].Visible = true;

            txt_additional_investigations.Value = mrfv.additional_investigations;
            txt_initial_diagnosis.Value = mrfv.initial_diagnosis;
            txt_differential_diagnosis.Value = mrfv.differential_diagnosis;
            txt_associated_conditions.Value = mrfv.associated_conditions;

            BindRadioButton("rad_treatment_code_" + mrfv.treatment_code);
            BindRadioButton("rad_spec_opinion_req_" + mrfv.spec_opinion_req);
            if (mrfv.spec_opinion_req) { txt_spec_opinion_req_text.Value = mrfv.spec_opinion_req_text; }

            txt_pecific_edu_req.Value = mrfv.pecific_edu_req;
            txt_next_appointment.Value = mrfv.next_appointment;
        }
         private void BindingDataFormView(Mrfv mrfv)
        {
            lbl_chief_complaint.Text = WebHelpers.GetValue(mrfv.chief_complaint);
            lbl_cur_med_history.Text = WebHelpers.GetValue(mrfv.cur_med_history);
            lbl_cur_medications.Text = WebHelpers.GetValue(mrfv.cur_medications);
            lbl_personal.Text = WebHelpers.GetValue(mrfv.personal);
            lbl_family.Text = WebHelpers.GetValue(mrfv.family);
            
            if(mrfv.allergy != null)
            {
                lbl_allergy.Text = mrfv.allergy ? "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.GetValue(mrfv.allergy_text) : "Không/ No";
            }

            //vital signs

            lbl_scr_before_vacc_1.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_1);
            lbl_scr_before_vacc_2.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_2);
            lbl_scr_before_vacc_3.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_3);
            lbl_scr_before_vacc_4.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_4);
            lbl_scr_before_vacc_5.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_5);
            lbl_scr_before_vacc_6.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_6);
            lbl_scr_before_vacc_7.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_7);
            lbl_scr_before_vacc_8.Text = WebHelpers.GetValue(mrfv.scr_before_vacc_8);
            
            // Appointed Vaccine
            _BindGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine));
            WebHelpers.DisabledGridView(grid_appointed_vaccine, true);
            btn_grid_appointed_vaccine_add.Visible = false;
            grid_appointed_vaccine.Columns[4].Visible = false;

            lbl_additional_investigations.Text = WebHelpers.GetValue(mrfv.additional_investigations);

            lbl_initial_diagnosis.Text = WebHelpers.GetValue(mrfv.initial_diagnosis);
            lbl_differential_diagnosis.Text = WebHelpers.GetValue(mrfv.differential_diagnosis);
            lbl_associated_conditions.Text = WebHelpers.GetValue(mrfv.associated_conditions);
            lbl_treatment_desc.Text = WebHelpers.GetValue(mrfv.treatment_desc);

            if(mrfv.spec_opinion_req != null)
            {
                lbl_spec_opinion_req.Text = mrfv.spec_opinion_req ? "Không/ No" : "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.GetValue(mrfv.spec_opinion_req_text);
            }

            lbl_pecific_edu_req.Text = WebHelpers.GetValue(mrfv.pecific_edu_req);
            lbl_next_appointment.Text = WebHelpers.GetValue(mrfv.next_appointment);
        }
        private void BindingDataFormPrint(Mrfv mrfv)
        {
            Patient patient = Patient.Instance();
            PatientVisit patientVisit = PatientVisit.Instance();

            prt_barcode.Text = prt_vpid.Text = patient.visible_patient_id;
            prt_fullname.Text = patient.GetFullName();
            prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
            prt_gender.Text = patient.gender_l;
            prt_day_of_visit.Text = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
            prt_pid.Text = patient.visible_patient_id;
            prt_chief_complaint.Text = mrfv.chief_complaint;
            prt_cur_med_history.Text = mrfv.cur_med_history;
            prt_cur_medications.Text = mrfv.cur_medications;
            prt_personal.Text = mrfv.personal;
            prt_family.Text = mrfv.family;

            prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true }, mrfv.allergy, "display: grid; grid-template-columns: 1fr 1fr");

            if (mrfv.allergy != null)
            {
                if (mrfv.allergy) { prt_allergy_note.Text = mrfv.allergy_text; } else { prt_allergy_note.Visible = false; }
            }

            prt_vs_temperature.Text = mrfv.vs_temperature;
            prt_vs_weight.Text = mrfv.vs_weight;
            prt_vs_height.Text = mrfv.vs_height;
            prt_vs_BMI.Text = mrfv.vs_BMI;
            prt_pulse.Text = mrfv.vs_pulse;
            prt_vs_respiratory_rate.Text = mrfv.vs_respiratory_rate;
            prt_vs_blood_pressure.Text = mrfv.vs_blood_pressure;
            prt_vs_spO2.Text = mrfv.vs_spO2;

            prt_scr_before_vacc_1.Text += mrfv.scr_before_vacc_1;
            prt_scr_before_vacc_2.Text += mrfv.scr_before_vacc_2;
            prt_scr_before_vacc_3.Text += mrfv.scr_before_vacc_3;
            prt_scr_before_vacc_4.Text += mrfv.scr_before_vacc_4;
            prt_scr_before_vacc_5.Text += mrfv.scr_before_vacc_5;
            prt_scr_before_vacc_6.Text += mrfv.scr_before_vacc_6;
            prt_scr_before_vacc_7.Text += mrfv.scr_before_vacc_7;
            prt_scr_before_vacc_8.Text += mrfv.scr_before_vacc_8;

            DataTable tb = WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine);
            if(tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    HtmlTableRow tr = new HtmlTableRow();
                    HtmlTableCell td;
                    for (int i = 0; i < prt_appointed_vaccine.Rows[0].Cells.Count; i++)
                    {
                        var temp = prt_appointed_vaccine.Rows[0].Cells[i];
                        string colName = temp.Attributes["data-field"];
                        td = new HtmlTableCell();
                        td.InnerText = row[colName].ToString();
                        if (temp.Attributes["data-align"] != null) td.Attributes.Add("class", "text-" + temp.Attributes["data-align"]);
                        tr.Cells.Add(td);
                    }
                    prt_appointed_vaccine.Rows.Add(tr);

                }
            }


            prt_additional_investigations.Text = mrfv.additional_investigations;
            prt_initial_diagnosis.Text = mrfv.initial_diagnosis;
            prt_differential_diagnosis.Text = mrfv.differential_diagnosis;
            prt_associated_conditions.Text = mrfv.associated_conditions;

            prt_treatment.Text = WebHelpers.CreateOptions(Mrfv.TREATMENT_CODE, mrfv.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr");
            //
            prt_spec_opinion_req.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true }, mrfv.spec_opinion_req, "display: grid; grid-template-columns: 1fr 1fr");


            if (mrfv.spec_opinion_req != null)
            {
                if (mrfv.spec_opinion_req)
                {
                    prt_spec_opinion_req_text.Text = mrfv.spec_opinion_req_text;
                }
                else
                {
                    prt_spec_opinion_req_text.Visible = false;
                }
            }
            //
            prt_specific_edu_req.Text = mrfv.pecific_edu_req;
            prt_next_appointment.Text = mrfv.next_appointment;

        }

        protected void grid_appointed_vaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }

        protected void btn_grid_appointed_vaccine_add_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState[grid_appointed_vaccine.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_appointed_vaccine.ID], grid_appointed_vaccine, Iina.SKIN_ANNO);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
               Mrfv  mrfv = new Mrfv(DataHelpers.varDocId);
                mrfv.status = DocumentStatus.FINAL;
                mrfv.user_name = (string)Session["UserID"];

                UpdateData(mrfv);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Mrfv mrfv = new Mrfv(DataHelpers.varDocId);
                mrfv.status = DocumentStatus.DRAFT;
                mrfv.user_name = (string)Session["UserID"];

                UpdateData(mrfv);
            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            Mrfv mrfv = new Mrfv(Request.QueryString["docId"]);
            string emp_id = (string)Session["emp_id"];

            if (WebHelpers.CanOpenForm(Page, mrfv.document_id, mrfv.status, emp_id, (string)Session["location"]))
            {

                txt_amend_reason.Text = "";
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, mrfv, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(mrfv);
                //get access button
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Mrfv mrfv = new Mrfv(Request.QueryString["docId"]);
            BindingDataFormPrint(mrfv);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Mrfv.Delete((string)Session["UserId"], Request.QueryString["docId"]);

                if (result[0].Status == System.Net.HttpStatusCode.OK)
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

        #region METHODS
        public void UpdateData(Mrfv mrfv)
        {
            try
            {
                mrfv.amend_reason = txt_amend_reason.Text;
                mrfv.chief_complaint = txt_chief_complaint.Value;
                mrfv.cur_med_history = txt_cur_med_history.Value;
                mrfv.cur_medications = txt_cur_medications.Value;
                mrfv.personal = txt_personal.Value;
                mrfv.family = txt_family.Value;

                mrfv.allergy = GetRadioButton("rad_allergy_");
                mrfv.allergy_text = txt_allergy_note.Value;

                mrfv.vs_temperature = vs_temperature.Text;
                mrfv.vs_heart_rate = vs_heart_rate.Text;
                mrfv.vs_weight = vs_weight.Text;
                mrfv.vs_height = vs_height.Text;
                mrfv.vs_respiratory_rate = vs_respiratory_rate.Text;
                mrfv.vs_BMI = vs_BMI.Text;
                mrfv.vs_blood_pressure = vs_blood_pressure.Text;
                mrfv.vs_spO2 = vs_spO2.Text;
                mrfv.vs_pulse = vs_pulse.Text;

                mrfv.scr_before_vacc_1 = txt_scr_before_vacc_1.Value;
                mrfv.scr_before_vacc_2 = txt_scr_before_vacc_2.Value;
                mrfv.scr_before_vacc_3 = txt_scr_before_vacc_3.Value;
                mrfv.scr_before_vacc_4 = txt_scr_before_vacc_4.Value;
                mrfv.scr_before_vacc_5 = txt_scr_before_vacc_5.Value;
                mrfv.scr_before_vacc_6 = txt_scr_before_vacc_6.Value;
                mrfv.scr_before_vacc_7 = txt_scr_before_vacc_7.Value;
                mrfv.scr_before_vacc_8 = txt_scr_before_vacc_8.Value;

                DataTable appointed_vaccine_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in Mrfv.APPOINTED_VACCINE)
                {
                    appointed_vaccine_tb.Columns.Add(col.Key);
                }
                mrfv.appointed_vaccine = WebHelpers.GetJSONFromTable(grid_appointed_vaccine, appointed_vaccine_tb);

                mrfv.additional_investigations = txt_additional_investigations.Value;
                mrfv.initial_diagnosis = txt_initial_diagnosis.Value;
                mrfv.differential_diagnosis = txt_differential_diagnosis.Value;
                mrfv.associated_conditions = txt_associated_conditions.Value;

                mrfv.treatment_code = GetRadioButton("rad_treatment_code_", Mrfv.TREATMENT_CODE);
                if(mrfv.treatment_code != null) { mrfv.treatment_desc = Mrfv.TREATMENT_CODE[mrfv.treatment_code]; }

                mrfv.spec_opinion_req = GetRadioButton("rad_spec_opinion_req_");
                mrfv.spec_opinion_req_text = txt_spec_opinion_req_text.Value;
                
                mrfv.pecific_edu_req = txt_pecific_edu_req.Value;
                mrfv.next_appointment = txt_next_appointment.Value;

                dynamic result = mrfv.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                    Initial();
                }
            }
            catch (Exception ex) {
                WebHelpers.SendError(Page, ex);
            }
        }
        private dynamic GetRadioButton(string radio_name)
        {
            if (((HtmlInputRadioButton)FindControl(radio_name + "True")).Checked)
            {
                return true;
            }
            else if (((HtmlInputRadioButton)FindControl(radio_name + "False")).Checked)
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
        private void _BindGridView(GridView gridView, DataTable dataSource)
        {
            try
            {
                ViewState[gridView.ID] = dataSource;
                gridView.DataSource = (DataTable)ViewState[gridView.ID];
                gridView.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
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

        private void DeleteGridViewRow(GridView gridView, int rowIndex)
        {
            UpdateLastRow(grid_appointed_vaccine, Mrnv.AppointedVaccine);

            DataTable dt = ViewState[gridView.ID] as DataTable;
            dt.Rows[rowIndex].Delete();

            _BindGridView(gridView, dt);
        }

        private void UpdateLastRow(GridView gridView, Dictionary<string, string> cols)
        {
            DataTable table = (DataTable)ViewState[gridView.ID];

            if (table.Rows.Count <= 0)
            {
                foreach (KeyValuePair<string, string> col in cols)
                {
                    table.Columns.Add(col.Key);
                }
            }

            for (int i = 0; i < gridView.Rows[gridView.Rows.Count - 1].Cells.Count; i++)
            {
                try
                {
                    if (gridView.Rows[gridView.Rows.Count - 1].Cells[i].Controls[1] is TextField)
                    {
                        TextField text2 = gridView.Rows[gridView.Rows.Count - 1].Cells[i].Controls[1] as TextField;

                        table.Rows[gridView.Rows.Count - 1][text2.DataKey] = text2.Value;
                    }
                }
                catch (Exception ex) { }
            }

            ViewState[gridView.ID] = table;
        }

        #endregion
    }
}
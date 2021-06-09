using Newtonsoft.Json;
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
        Mrfv mrfv;
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

            mrfv = new Mrfv(DataHelpers.varDocId);
            loadDataToControls(mrfv);
        }

        public void loadDataToControls(Mrfv mrfv)
        {
            try
            {
                txt_chief_complaint.Value = mrfv.chief_complaint;
                txt_cur_med_history.Value = mrfv.cur_med_history;
                txt_cur_medications.Value = mrfv.cur_medications;
                txt_personal.Value = mrfv.personal;
                txt_family.Value = mrfv.family;

                BindRadioButton("rad_allergy_" + mrfv.allergy);
                if(mrfv.allergy) { txt_allergy_note.Value = mrfv.allergy_text; }

                txt_vs_temperature.Value = mrfv.vs_temperature;
                txt_vs_heart_rate.Value = mrfv.vs_heart_rate;
                txt_vs_weight.Value = mrfv.vs_weight;
                txt_vs_height.Value = mrfv.vs_height;
                txt_vs_respiratory_rate.Value = mrfv.vs_respiratory_rate;
                txt_vs_BMI.Value = mrfv.vs_BMI;
                txt_vs_blood_pressure.Value = mrfv.vs_blood_pressure;
                txt_vs_spO2.Value = mrfv.vs_spO2;

                txt_scr_before_vacc_1.Value = mrfv.scr_before_vacc_1;
                txt_scr_before_vacc_2.Value = mrfv.scr_before_vacc_2;
                txt_scr_before_vacc_3.Value = mrfv.scr_before_vacc_3;
                txt_scr_before_vacc_4.Value = mrfv.scr_before_vacc_4;
                txt_scr_before_vacc_5.Value = mrfv.scr_before_vacc_5;
                txt_scr_before_vacc_6.Value = mrfv.scr_before_vacc_6;
                txt_scr_before_vacc_7.Value = mrfv.scr_before_vacc_7;
                txt_scr_before_vacc_8.Value = mrfv.scr_before_vacc_8;

                _BindGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine));
                
                txt_additional_investigations.Value = mrfv.additional_investigations;
                txt_initial_diagnosis.Value = mrfv.initial_diagnosis;
                txt_differential_diagnosis.Value = mrfv.differential_diagnosis;
                txt_associated_conditions.Value = mrfv.associated_conditions;

                BindRadioButton("rad_treatment_code_" + mrfv.treatment_code);
                BindRadioButton("rad_spec_opinion_req_" + mrfv.spec_opinion_req);
                if(mrfv.spec_opinion_req) { txt_spec_opinion_req_text.Value = mrfv.spec_opinion_req_text; }
                
                txt_pecific_edu_req.Value = mrfv.pecific_edu_req;
                txt_next_appointment.Value = mrfv.next_appointment;

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (mrfv.status == DocumentStatus.FINAL)
                {

                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                    loadDataToPrint(mrfv);
                }

                else if (mrfv.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }

            } catch (Exception ex)
            {

            }
        }

        private void loadDataToPrint(Mrfv mrfv)
        {
            Patient patient = Patient.Instance();
            PatientVisit patientVisit = PatientVisit.Instance(Request["pvid"]);
            prt_patient_label.PID = patient.visible_patient_id;

            prt_fullname.Value = patient.GetFullName();
            prt_dob.Value = WebHelpers.FormatDateTime(patient.date_of_birth);
            prt_gender.Value = patient.gender_l;
            prt_day_of_visit.Value = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
            prt_pid.Value = patient.visible_patient_id;
            prt_chief_complaint.Value = mrfv.chief_complaint;
            prt_cur_med_history.Value = mrfv.cur_med_history;
            prt_cur_medications.Value = mrfv.cur_medications;
            prt_personal.Value = mrfv.personal;
            prt_family.Value = mrfv.family;
            
            prt_allergy.Options = WebHelpers.CreateOptions(
                new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, 
                new Option { Text = "Có/ <span class='text-primary'>Yes</span>:", Value = true });
            
            prt_allergy.SelectedValue = mrfv.allergy;

            if (mrfv.allergy != null)
            {
                if (mrfv.allergy) { prt_allergy_note.Value = mrfv.allergy_text; } else { prt_allergy_note.Visible = false; }
            }

            prt_vs_temperature.Text = mrfv.vs_temperature;
            prt_vs_weight.Text = mrfv.vs_weight;
            prt_vs_height.Text = mrfv.vs_height;
            prt_vs_BMI.Text = mrfv.vs_BMI;
            prt_pulse.Text = mrfv.vs_pulse;
            prt_vs_respiratory_rate.Text = mrfv.vs_respiratory_rate;
            prt_vs_blood_pressure.Text = mrfv.vs_blood_pressure;
            prt_vs_spO2.Text = mrfv.vs_spO2;
            prt_scr_before_vacc_1.Value = mrfv.scr_before_vacc_1;
            prt_scr_before_vacc_2.Title += mrfv.scr_before_vacc_2;
            prt_scr_before_vacc_3.Title += mrfv.scr_before_vacc_3;
            prt_scr_before_vacc_4.Title += mrfv.scr_before_vacc_4;
            prt_scr_before_vacc_5.Value = mrfv.scr_before_vacc_5;
            prt_scr_before_vacc_6.Value = mrfv.scr_before_vacc_6;
            prt_scr_before_vacc_7.Value = mrfv.scr_before_vacc_7;
            prt_scr_before_vacc_8.Value = mrfv.scr_before_vacc_8;

            DataTable tb = WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine);
            foreach(DataRow row in tb.Rows)
            {
                HtmlTableRow tr = new HtmlTableRow();
                HtmlTableCell td;
                for (int i = 0; i < prt_appointed_vaccine.Rows[0].Cells.Count; i++)
                {
                    var temp = prt_appointed_vaccine.Rows[0].Cells[i];
                    string colName = temp.Attributes["data-field"];
                    td = new HtmlTableCell();
                    td.InnerText = row[colName].ToString();
                    if(temp.Attributes["data-align"] != null) td.Attributes.Add("class", "text-" + temp.Attributes["data-align"]);
                    tr.Cells.Add(td);
                }
                prt_appointed_vaccine.Rows.Add(tr);



                //cell.InnerText = row["drug_name"].ToString();

                //tr.Cells.Add(cell);
                //cell = new HtmlTableCell();
                //cell.InnerText = row["strength"].ToString();
                //tr.Cells.Add(cell);

                //cell = new HtmlTableCell();
                //cell.InnerText = row["router"].ToString();
                //tr.Cells.Add(cell);

                //cell = new HtmlTableCell();
                //cell.InnerText = row["reason"].ToString();
                //tr.Cells.Add(cell);
            }

            prt_additional_investigations.Value = mrfv.additional_investigations;
            prt_initial_diagnosis.Value = mrfv.initial_diagnosis;
            prt_differential_diagnosis.Value = mrfv.differential_diagnosis;
            prt_associated_conditions.Value = mrfv.associated_conditions;

            Option[] treatments = new Option[3];
            
            for (int index = 0; index < Mrfv.TREATMENT_CODE.Count; index++)
            {
                var item = Mrfv.TREATMENT_CODE.ElementAt(index);
                treatments[index] = new Option { Text = item.Value, Value = item.Key };
            }
            prt_treatment.Options = WebHelpers.CreateOptions(treatments);
            prt_treatment.SelectedValue = mrfv.treatment_code;
            //
            prt_spec_opinion_req.Options = WebHelpers.CreateOptions(
                new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false },
                new Option { Text = "Có/ <span class='text-primary'>Yes</span>:", Value = true });

            prt_spec_opinion_req.SelectedValue = mrfv.spec_opinion_req;
            if(mrfv.spec_opinion_req != null)
            {
                if (mrfv.spec_opinion_req)
                {
                    prt_spec_opinion_req_text.Value = mrfv.spec_opinion_req_text;
                }
                else
                {
                    prt_spec_opinion_req_text.Visible = false;
                }
            }
            //
            prt_specific_edu_req.Value = mrfv.pecific_edu_req;
            prt_next_appointment.Value = mrfv.next_appointment;

            prt_signature1.Content = WebHelpers.GetSignatureTemplate1("", "Bác sĩ điều trị/ <span class='text-primary'>Attending doctor</span>", "", "(Họ tên, chữ ký & MSNV)", "(Full name, Signature & ID)", "");
        }

        protected void DisabledControl(bool disabled)
        {
            txt_chief_complaint.Disabled = disabled;
            txt_cur_med_history.Disabled = disabled;
            txt_cur_medications.Disabled = disabled;

            txt_personal.Disabled = disabled;
            txt_family.Disabled = disabled;

            rad_allergy_true.Disabled = disabled;
            rad_allergy_false.Disabled = disabled;
            txt_allergy_note.Disabled = disabled;

            txt_vs_temperature.Disabled = true;
            txt_vs_heart_rate.Disabled = true;
            txt_vs_weight.Disabled = true;
            txt_vs_height.Disabled = true;
            txt_vs_respiratory_rate.Disabled = true;
            txt_vs_BMI.Disabled = true;
            txt_vs_blood_pressure.Disabled = true;
            txt_vs_spO2.Disabled = true;
            txt_vs_pulse.Disabled = true;

            txt_scr_before_vacc_1.Disabled = disabled;
            txt_scr_before_vacc_2.Disabled = disabled;
            txt_scr_before_vacc_3.Disabled = disabled;
            txt_scr_before_vacc_4.Disabled = disabled;
            txt_scr_before_vacc_5.Disabled = disabled;
            txt_scr_before_vacc_6.Disabled = disabled;
            txt_scr_before_vacc_7.Disabled = disabled;
            txt_scr_before_vacc_8.Disabled = disabled;

            WebHelpers.DisabledGridView(grid_appointed_vaccine, disabled);
            btn_grid_appointed_vaccine_add.Visible = !disabled;

            txt_additional_investigations.Disabled = disabled;
            txt_initial_diagnosis.Disabled = disabled;
            txt_differential_diagnosis.Disabled = disabled;
            txt_associated_conditions.Disabled = disabled;

            DisabledRadioButton("rad_treatment_code_", Mrfv.TREATMENT_CODE, disabled);

            rad_spec_opinion_req_true.Disabled = disabled;
            rad_spec_opinion_req_false.Disabled = disabled;
            txt_spec_opinion_req_text.Disabled = disabled;

            txt_pecific_edu_req.Disabled = disabled;
            txt_next_appointment.Disabled = disabled;
        }

        
        protected void grid_appointed_vaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btn_grid_appointed_vaccine_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[grid_appointed_vaccine.ID];

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in Mrnv.AppointedVaccine)
                    {
                        table.Columns.Add(col.Key);
                    }
                }

                for (int r = 0; r < grid_appointed_vaccine.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_appointed_vaccine.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (grid_appointed_vaccine.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_appointed_vaccine.Rows[r].Cells[i].Controls[1] as TextField;

                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                        }
                        catch (Exception ex) { }
                    }
                }

                DataRow dtRow = table.NewRow();

                dtRow = table.NewRow();
                table.Rows.Add(dtRow);

                _BindGridView(grid_appointed_vaccine, table);
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (CheckFieldsValid())
            {
                mrfv = new Mrfv(DataHelpers.varDocId);
                mrfv.status = DocumentStatus.FINAL;
                mrfv.user_name = (string)Session["UserID"];

                UpdateData(mrfv);
            }
            else
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);

                RequiredFieldValidator.Value = "true";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (CheckFieldsValid())
            {
                mrfv = new Mrfv(DataHelpers.varDocId);
                mrfv.status = DocumentStatus.DRAFT;
                mrfv.user_name = (string)Session["UserID"];

                UpdateData(mrfv);
            }
            else
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);

                RequiredFieldValidator.Value = "true";
            }
        }

        private bool CheckFieldsValid()
        {
            return true;
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "Disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;
            txt_amendReason.Visible = true;

            DisabledControl(false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            txt_amendReason.Visible = false;

            DisabledControl(true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Mrfv.Delete((string)Session["UserId"], Request.QueryString["vpid"])[0] == "OK")
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
        }

        public void UpdateData(Mrfv mrfv)
        {
            try
            {
                mrfv.amend_reason = txt_amendReason.Value;
                mrfv.chief_complaint = txt_chief_complaint.Value;
                mrfv.cur_med_history = txt_cur_med_history.Value;
                mrfv.cur_medications = txt_cur_medications.Value;
                mrfv.personal = txt_personal.Value;
                mrfv.family = txt_family.Value;

                mrfv.allergy = GetRadioButton("rad_allergy_");

                if (mrfv.allergy)
                {
                    mrfv.allergy_text = txt_allergy_note.Value;
                }
                else 
                {
                    mrfv.allergy_text = null;
                }

                mrfv.vs_temperature = txt_vs_temperature.Value;
                mrfv.vs_heart_rate = txt_vs_heart_rate.Value;
                mrfv.vs_weight = txt_vs_weight.Value;
                mrfv.vs_height = txt_vs_height.Value;
                mrfv.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                mrfv.vs_BMI = txt_vs_BMI.Value;
                mrfv.vs_blood_pressure = txt_vs_blood_pressure.Value;
                mrfv.vs_spO2 = txt_vs_spO2.Value;
                mrfv.vs_pulse = txt_vs_pulse.Value;

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
                if (mrfv.spec_opinion_req)
                {
                    mrfv.spec_opinion_req_text = txt_spec_opinion_req_text.Value;
                }
                else
                {
                    mrfv.spec_opinion_req_text = null;
                }

                mrfv.pecific_edu_req = txt_pecific_edu_req.Value;
                mrfv.next_appointment = txt_next_appointment.Value;

                dynamic result = mrfv.Update();

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
            catch (Exception ex) { }
        }

        #region METHODS
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
        #endregion
    }
}
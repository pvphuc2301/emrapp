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

                if(mrfv.allergy != null)
                {
                    if (bool.Parse(mrfv.allergy))
                    {
                        rad_allergy2.Checked = true;
                        txt_allergy_note.Value = mrfv.allergy_text;
                    }
                    else
                    {
                        rad_allergy1.Checked = true;
                    }
                }

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

                foreach (KeyValuePair<string, string> code in Mrfv.TREATMENT_CODE)
                {
                    try
                    {
                        ((HtmlInputRadioButton)FindControl("rad_treatment_code_" + code.Key.ToLower())).Checked = true;
                    }
                    catch (Exception ex) { }
                }

                if(mrfv.spec_opinion_req != null)
                {
                    if (bool.Parse(mrfv.spec_opinion_req))
                    {
                        rad_spec_opinion_req2.Checked = true;
                        txt_spec_opinion_req_text.Value =       mrfv.spec_opinion_req_text;
                    }
                    else
                    {
                        rad_spec_opinion_req1.Checked = true;
                    }
                }

                txt_pecific_edu_req.Value = mrfv.pecific_edu_req;
                txt_next_appointment.Value = mrfv.next_appointment;

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (mrfv.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;
                    btnCancel.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
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

        protected void DisabledControl(bool disabled)
        {
            txt_chief_complaint.Disabled = disabled;
            txt_cur_med_history.Disabled = disabled;
            txt_cur_medications.Disabled = disabled;
            txt_personal.Disabled = disabled;
            txt_family.Disabled = disabled;
            rad_allergy1.Disabled = disabled;
            rad_allergy2.Disabled = disabled;
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
            txt_additional_investigations.Disabled = disabled;
            txt_initial_diagnosis.Disabled = disabled;
            txt_differential_diagnosis.Disabled = disabled;
            txt_associated_conditions.Disabled = disabled;
            rad_treatment_code_TRF.Disabled = disabled;
            rad_treatment_code_OPD.Disabled = disabled;
            rad_treatment_code_IPD.Disabled = disabled;
            rad_spec_opinion_req1.Disabled = disabled;
            rad_spec_opinion_req2.Disabled = disabled;
            txt_spec_opinion_req_text.Disabled = disabled;
            txt_pecific_edu_req.Disabled = disabled;
            txt_next_appointment.Disabled = disabled;
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
                //dtRow["time"] = DateTime.Now.ToString("HH:mm");
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
            if (Mrfv.Delete((string)Session["UserId"])[0] == WebHelpers.ResponseStatus.OK)
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

                if (rad_allergy2.Checked)
                {
                    mrfv.allergy = true;
                    mrfv.allergy_text = txt_allergy_note.Value;
                }
                if (rad_allergy1.Checked)
                {
                    mrfv.allergy = false;
                    mrfv.allergy_text = "";
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

                foreach (KeyValuePair<string, string> code in Mrfv.TREATMENT_CODE)
                {
                    if (((HtmlInputRadioButton)FindControl("rad_treatment_code_" + code.Key.ToLower())).Checked)
                    {
                        mrfv.treatment_code = code.Key;
                        mrfv.treatment_desc = code.Value;
                    }
                }
                if (rad_spec_opinion_req2.Checked)
                {
                    mrfv.spec_opinion_req = true;
                    mrfv.spec_opinion_req_text = txt_spec_opinion_req_text.Value;
                }
                if (rad_spec_opinion_req1.Checked)
                {
                    mrfv.spec_opinion_req = false;
                    mrfv.spec_opinion_req_text = "";
                }
                mrfv.pecific_edu_req = txt_pecific_edu_req.Value;
                mrfv.next_appointment = txt_next_appointment.Value;

                if (mrfv.Update()[0] == WebHelpers.ResponseStatus.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS, 100000);

                    Initial();
                }
            }
            catch (Exception ex) { }
        }
    }
}
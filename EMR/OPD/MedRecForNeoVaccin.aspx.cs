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
    public partial class MedRecForNeoVaccin : System.Web.UI.Page
    {
        Mrnv mrnv;
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

            mrnv = new Mrnv(DataHelpers.varDocId);
            loadDataToMRVNControls(mrnv);
        }

        public void loadDataToMRVNControls(Mrnv mrnv)
        {
            try
            {
                lbl_Fullname.Text=lbPatientName.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
                lbDoB.Text = WebHelpers.FormatDateTime(DataHelpers.patient.date_of_birth) + "| " + DataHelpers.patient.gender_l;
                lbl_dob1.Text = WebHelpers.FormatDateTime(DataHelpers.patient.date_of_birth);
                lbl_Gender.Text= DataHelpers.patient.gender_l;
                lbl_PID.Text = lbPID.Text = DataHelpers.patient.visible_patient_id;
                lbl_VisitDate.Text = WebHelpers.FormatDateTime(DataHelpers.patientVisit.actual_visit_date_time);
                txt_amendReason.Visible = false;
                //lbl_chief_complaint.Text = 
                    txt_chief_complaint.Value = mrnv.chief_complaint;
                //lbl_cur_med_history.Text = 
                    txt_cur_med_history.Value = mrnv.cur_med_history;
                //lbl_cur_medications.Text = 
                    txt_cur_medications.Value = mrnv.cur_medications;
                //lbl_personal.Text = 
                    txt_personal.Value = mrnv.personal;
                //lbl_family.Text = 
                    txt_family.Value = mrnv.family;
                if (mrnv.allergy != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_allergy_" + (mrnv.allergy))).Checked = true;
                    //((HtmlInputCheckBox)FindControl("lbl_allergy_" + (mrnv.allergy))).Checked = true;
                }
                //lbl_allergy_text.Text = 
                    txt_allergy_note.Value = mrnv.allergy_text;
                //lbl_vs_temperature.Text = 
                    txt_vs_temperature.Value = mrnv.vs_temperature;
                //lbl_vs_heart_rate.Text = 
                    txt_vs_heart_rate.Value = mrnv.vs_heart_rate;
                //lbl_vs_weight.Text = 
                    txt_vs_weight.Value = mrnv.vs_weight;
                //lbl_vs_height.Text = 
                    txt_vs_height.Value = mrnv.vs_height;
                //lbl_vs_respiratory_rate.Text = 
                    txt_vs_respiratory_rate.Value = mrnv.vs_respiratory_rate;
                //lbl_vs_BMI.Text = 
                    txt_vs_BMI.Value = mrnv.vs_BMI;
                //lbl_vs_blood_pressure.Text = 
                    txt_vs_blood_pressure.Value = mrnv.vs_blood_pressure;
                //lbl_vs_SpO2.Text = 
                    txt_vs_spO2.Value = mrnv.vs_SpO2;
                //lbl_vs_pulse.Text = 
                txt_vs_pulse.Value = mrnv.vs_pulse;
                //lbl_scr_before_vacc_1.Text = 
                    txt_scr_before_vacc_1.Value = mrnv.scr_before_vacc_1;
                //lbl_scr_before_vacc_2.Text = 
                    txt_scr_before_vacc_2.Value = mrnv.scr_before_vacc_2;
                //lbl_scr_before_vacc_3.Text = 
                    txt_scr_before_vacc_3.Value = mrnv.scr_before_vacc_3;
                //lbl_scr_before_vacc_4.Text = 
                    txt_scr_before_vacc_4.Value = mrnv.scr_before_vacc_4;
                //lbl_scr_before_vacc_5.Text = 
                    txt_scr_before_vacc_5.Value = mrnv.scr_before_vacc_5;
                //lbl_scr_before_vacc_6.Text = 
                    txt_scr_before_vacc_6.Value = mrnv.scr_before_vacc_6;
                //lbl_scr_before_vacc_7.Text = 
                    txt_scr_before_vacc_7.Value = mrnv.scr_before_vacc_7;
                //lbl_scr_before_vacc_8.Text = 
                    txt_scr_before_vacc_8.Value = mrnv.scr_before_vacc_8;
                //lbl_scr_before_vacc_9.Text = 
                    txt_scr_before_vacc_9.Value = mrnv.scr_before_vacc_9;

                _BindGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrnv.appointed_vaccine));
                //_BindGridView(lbl_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrnv.appointed_vaccine));

                lbl_additional_investigations.Text = txt_additional_investigations.Value = mrnv.additional_investigations;
                lbl_initial_diagnosis.Text = txt_initial_diagnosis.Value = mrnv.initial_diagnosis;
                lbl_differential_diagnosis.Text = txt_differential_diagnosis.Value = mrnv.differential_diagnosis;
                lbl_differential_diagnosis.Text = txt_associated_conditions.Value = mrnv.associated_conditions;
                if (mrnv.treatment_code != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_treatment_code_" + mrnv.treatment_code)).Checked = true;
                    ((HtmlInputCheckBox)FindControl("lbl_treatment_code_" + mrnv.treatment_code)).Checked = true;
                }
                if (mrnv.spec_opinion_req != null)
                {
                    ((HtmlInputRadioButton)FindControl("rad_spec_opinion_req_" + (mrnv.spec_opinion_req))).Checked = true;
                    ((HtmlInputCheckBox)FindControl("lbl_spec_opinion_req_" + (mrnv.spec_opinion_req))).Checked = true;
                }
                lbl_spec_opinion_req_text.Text = txt_spec_opinion_req_text.Value = mrnv.spec_opinion_req_text;
                lbl_pecific_edu_req.Text = txt_pecific_edu_req.Value = mrnv.pecific_edu_req;
                lbl_next_appointment.Text = txt_next_appointment.Value = mrnv.next_appointment;

                btnCancel.Visible = false;
                if (mrnv.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;
                    
                    btnDeleteModal.Visible = false;
                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }

                else if (mrnv.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }

            }
            catch (Exception ex)
            {

            }
        }
        public void UpdateData(Mrnv mrnv)
        {
            try
            {
                mrnv.chief_complaint = txt_chief_complaint.Value;
                mrnv.cur_med_history = txt_cur_med_history.Value;
                mrnv.cur_medications = txt_cur_medications.Value;
                mrnv.personal = txt_personal.Value;
                mrnv.family = txt_family.Value;
                if (rad_allergy_True.Checked)
                {
                    mrnv.allergy = true;
                    mrnv.allergy_text = txt_allergy_note.Value;
                }
                if (rad_allergy_False.Checked)
                {
                    mrnv.allergy = false;
                    mrnv.allergy_text = "";
                }
                mrnv.vs_temperature = txt_vs_temperature.Value;
                mrnv.vs_heart_rate = txt_vs_heart_rate.Value;
                mrnv.vs_weight = txt_vs_weight.Value;
                mrnv.vs_height = txt_vs_height.Value;
                mrnv.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                mrnv.vs_BMI = txt_vs_BMI.Value;
                mrnv.vs_blood_pressure = txt_vs_blood_pressure.Value;
                mrnv.vs_SpO2 = txt_vs_spO2.Value;
                mrnv.vs_pulse = txt_vs_pulse.Value;
                mrnv.scr_before_vacc_1 = txt_scr_before_vacc_1.Value;
                mrnv.scr_before_vacc_2 = txt_scr_before_vacc_2.Value;
                mrnv.scr_before_vacc_3 = txt_scr_before_vacc_3.Value;
                mrnv.scr_before_vacc_4 = txt_scr_before_vacc_4.Value;
                mrnv.scr_before_vacc_5 = txt_scr_before_vacc_5.Value;
                mrnv.scr_before_vacc_6 = txt_scr_before_vacc_6.Value;
                mrnv.scr_before_vacc_7 = txt_scr_before_vacc_7.Value;
                mrnv.scr_before_vacc_8 = txt_scr_before_vacc_8.Value;
                mrnv.scr_before_vacc_9 = txt_scr_before_vacc_9.Value;

                DataTable appointed_vaccine_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in Mrnv.AppointedVaccine)
                {
                    appointed_vaccine_tb.Columns.Add(col.Key);
                }
                mrnv.appointed_vaccine = WebHelpers.GetJSONFromTable(grid_appointed_vaccine, appointed_vaccine_tb);

                mrnv.additional_investigations = txt_additional_investigations.Value;
                mrnv.initial_diagnosis = txt_initial_diagnosis.Value;
                mrnv.differential_diagnosis = txt_differential_diagnosis.Value;
                mrnv.associated_conditions = txt_associated_conditions.Value;

                foreach (KeyValuePair<string, string> code in Mrnv.TREATMENT_CODE)
                {
                    if (((HtmlInputRadioButton)FindControl("rad_treatment_code_" + code.Key.ToLower())).Checked)
                    {
                        mrnv.treatment_code = code.Key;
                        mrnv.treatment_desc = code.Value;
                    }
                }
                if (rad_spec_opinion_req_True.Checked)
                {
                    mrnv.spec_opinion_req = true;
                    mrnv.spec_opinion_req_text = txt_spec_opinion_req_text.Value;
                }
                if (rad_spec_opinion_req_False.Checked)
                {
                    mrnv.spec_opinion_req = false;
                    mrnv.spec_opinion_req_text = "";
                }
                mrnv.pecific_edu_req = txt_pecific_edu_req.Value;
                mrnv.next_appointment = txt_next_appointment.Value;

                dynamic result = mrnv.Update()[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 100000);

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



        protected void DisabledControl(bool disabled)
        {
            txt_chief_complaint.Disabled = disabled;
            txt_cur_med_history.Disabled = disabled;
            txt_cur_medications.Disabled = disabled;
            txt_personal.Disabled = disabled;
            txt_family.Disabled = disabled;
            rad_allergy_False.Disabled = disabled;
            rad_allergy_True.Disabled = disabled;
            txt_allergy_note.Disabled = disabled;
            txt_vs_temperature.Disabled = disabled;
            txt_vs_heart_rate.Disabled = disabled;
            txt_vs_weight.Disabled = disabled;
            txt_vs_height.Disabled = disabled;
            txt_vs_respiratory_rate.Disabled = disabled;
            txt_vs_BMI.Disabled = disabled;
            txt_vs_blood_pressure.Disabled = disabled;
            txt_vs_spO2.Disabled = disabled;
            txt_vs_pulse.Disabled = disabled;
            txt_scr_before_vacc_1.Disabled = disabled;
            txt_scr_before_vacc_2.Disabled = disabled;
            txt_scr_before_vacc_3.Disabled = disabled;
            txt_scr_before_vacc_4.Disabled = disabled;
            txt_scr_before_vacc_5.Disabled = disabled;
            txt_scr_before_vacc_6.Disabled = disabled;
            txt_scr_before_vacc_7.Disabled = disabled;
            txt_scr_before_vacc_8.Disabled = disabled;
            txt_scr_before_vacc_9.Disabled = disabled;
            WebHelpers.DisabledGridView(grid_appointed_vaccine, disabled);
            btn_grid_appointed_vaccine_add.Visible = !disabled;
            txt_additional_investigations.Disabled = disabled;
            txt_differential_diagnosis.Disabled = disabled;
            txt_associated_conditions.Disabled = disabled;
            rad_treatment_code_TRF.Disabled = disabled;
            rad_treatment_code_OPD.Disabled = disabled;
            rad_treatment_code_IPD.Disabled = disabled;
            rad_spec_opinion_req_True.Disabled = disabled;
            rad_spec_opinion_req_False.Disabled = disabled;
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

        protected void btn_grid_appointedVaccine_add_Click(object sender, EventArgs e)
        {

        }
        protected void btn_grid_appointedVaccine_Del_Click(object sender, EventArgs e)
        {

        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            txt_amendReason.Visible = true;

            btnComplete.Visible = true;
            btnComplete.Attributes["disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                mrnv = new Mrnv(DataHelpers.varDocId);

                mrnv.user_name = (string)Session["UserID"];
                mrnv.status = DocumentStatus.DRAFT;

                UpdateData(mrnv);
            }
            else
            {
                RequiredFieldValidator.Value = errors;

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private string checkValidField()
        {
            return "";
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                mrnv = new Mrnv(DataHelpers.varDocId);

                mrnv.user_name = (string)Session["UserID"];
                mrnv.status = DocumentStatus.FINAL;

                UpdateData(mrnv);
            }
            else
            {
                RequiredFieldValidator.Value = errors;

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = IniMedAssForNeoInpatient.Delete((string)Session["UserId"], Request.QueryString["docId"]);

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
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            txt_amendReason.Visible = false;

            DisabledControl(true);
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
        protected void gridappointed_vaccine_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                    }
                }
            }
        }
        protected void gridappointed_vaccine_RowUpdating(object sender, GridViewUpdateEventArgs e)

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
        protected void grid_appointed_vaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }
        private void DeleteGridViewRow(GridView gridView, int rowIndex)
        {
            DataTable dt = ViewState[gridView.ID] as DataTable;
            dt.Rows[rowIndex].Delete();

            _BindGridView(gridView, dt);
        }
        protected void DisabledGridView(GridView gridView, bool disabled)
        {
            try
            {
                for (int r = 0; r < gridView.Rows.Count; r++)
                {
                    for (int i = 0; i < gridView.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (gridView.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = gridView.Rows[r].Cells[i].Controls[1] as TextField;
                                text2.Disabled = disabled;
                            }
                        }
                        catch (Exception ex) { }
                    }
                }
                ((Button)FindControl("btn_" + gridView.ID + "_add")).Visible = !disabled;


            }
            catch (Exception ex) { }

        }
    }
}
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
    public partial class MedRecForNeoVaccin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) return;
            
            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Mrnv mrnv, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(mrnv);
            }
            else
            {
                BindingDataFormView(mrnv);
            }
        }
        private void BindingDataFormEdit(Mrnv mrnv)
        {
            try
            {
                txt_amend_reason.Text = "";
                txt_chief_complaint.Value = mrnv.chief_complaint;
                txt_cur_med_history.Value = mrnv.cur_med_history;
                txt_cur_medications.Value = mrnv.cur_medications;
                txt_personal.Value = mrnv.personal;
                txt_family.Value = mrnv.family;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + mrnv.allergy);
                txt_allergy_note.Value = WebHelpers.GetBool(mrnv.allergy, mrnv.allergy_text, "");

                vs_temperature.Text = mrnv.vs_temperature;
                vs_heart_rate.Text = mrnv.vs_heart_rate;
                vs_weight.Text = mrnv.vs_weight;
                vs_respiratory_rate.Text = mrnv.vs_respiratory_rate;
                vs_height.Text = mrnv.vs_height;
                vs_blood_pressure.Text = mrnv.vs_blood_pressure;
                vs_BMI.Text = mrnv.vs_BMI;
                vs_spO2.Text = mrnv.vs_SpO2;
                vs_pulse.Text = mrnv.vs_pulse;
                WebHelpers.VisibleControl(true, btnUpdateVitalSigns);

                txt_scr_before_vacc_1.Value = mrnv.scr_before_vacc_1;
                txt_scr_before_vacc_2.Value = mrnv.scr_before_vacc_2;
                txt_scr_before_vacc_3.Value = mrnv.scr_before_vacc_3;
                txt_scr_before_vacc_4.Value = mrnv.scr_before_vacc_4;
                txt_scr_before_vacc_5.Value = mrnv.scr_before_vacc_5;
                txt_scr_before_vacc_6.Value = mrnv.scr_before_vacc_6;
                txt_scr_before_vacc_7.Value = mrnv.scr_before_vacc_7;
                txt_scr_before_vacc_8.Value = mrnv.scr_before_vacc_8;
                txt_scr_before_vacc_9.Value = mrnv.scr_before_vacc_9;

                ViewState[grid_appointed_vaccine.ID] = WebHelpers.BindingDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrnv.appointed_vaccine), Mrnv.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);

                txt_additional_investigations.Value = mrnv.additional_investigations;
                txt_initial_diagnosis.Value = mrnv.initial_diagnosis;
                txt_differential_diagnosis.Value = mrnv.differential_diagnosis;
                txt_associated_conditions.Value = mrnv.associated_conditions;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + mrnv.treatment_code);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_" + mrnv.spec_opinion_req);
                txt_spec_opinion_req_text.Value = WebHelpers.GetBool(mrnv.spec_opinion_req, mrnv.spec_opinion_req_text, "");

                txt_pecific_edu_req.Value = mrnv.pecific_edu_req;
                txt_next_appointment.Value = mrnv.next_appointment;

                DataObj.Value = JsonConvert.SerializeObject(mrnv);
                WebHelpers.AddScriptFormEdit(Page, mrnv, (string)Session["emp_id"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Mrnv mrnv)
        {
            try
            {

                //I
                lbl_chief_complaint.Text = WebHelpers.FormatString(mrnv.chief_complaint);
                //II
                //1
                lbl_cur_med_history.Text = WebHelpers.FormatString(mrnv.cur_med_history);
                lbl_cur_medications.Text = WebHelpers.FormatString(mrnv.cur_medications);
                //2
                lbl_personal.Text = WebHelpers.FormatString(mrnv.personal);
                lbl_family.Text = WebHelpers.FormatString(mrnv.family);

                if (mrnv.allergy != null)
                {
                    lbl_allergy.Text = mrnv.allergy ? "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.FormatString(mrnv.allergy_text) : "Không/ No";
                }

                //vital signs
                vs_temperature.Text = WebHelpers.FormatString(mrnv.vs_temperature);
                vs_weight.Text = WebHelpers.FormatString(mrnv.vs_weight);
                vs_height.Text = WebHelpers.FormatString(mrnv.vs_height);
                vs_BMI.Text = WebHelpers.FormatString(mrnv.vs_BMI);
                vs_pulse.Text = WebHelpers.FormatString(mrnv.vs_pulse);
                vs_respiratory_rate.Text = WebHelpers.FormatString(mrnv.vs_respiratory_rate);
                vs_blood_pressure.Text = WebHelpers.FormatString(mrnv.vs_blood_pressure);
                vs_spO2.Text = WebHelpers.FormatString(mrnv.vs_SpO2);
                WebHelpers.VisibleControl(false, btnUpdateVitalSigns);

                lbl_scr_before_vacc_1.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_1);
                lbl_scr_before_vacc_2.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_2);
                lbl_scr_before_vacc_3.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_3);
                lbl_scr_before_vacc_4.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_4);
                lbl_scr_before_vacc_5.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_5);
                lbl_scr_before_vacc_6.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_6);
                lbl_scr_before_vacc_7.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_7);
                lbl_scr_before_vacc_8.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_8);
                lbl_scr_before_vacc_9.Text = WebHelpers.FormatString(mrnv.scr_before_vacc_9);
                    
                // Appointed Vaccine
                WebHelpers.LoadDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrnv.appointed_vaccine), Mrnv.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);

                lbl_additional_investigations.Text = WebHelpers.FormatString(mrnv.additional_investigations);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(mrnv.initial_diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.FormatString(mrnv.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.FormatString(mrnv.associated_conditions);
                lbl_treatment_desc.Text = WebHelpers.FormatString(mrnv.treatment_desc);
                lbl_next_appointment.Text = WebHelpers.FormatString(mrnv.next_appointment);
                if (mrnv.spec_opinion_req != null)
                {
                    lbl_spec_opinion_req.Text = mrnv.spec_opinion_req ? "Không/ No" : "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.FormatString(mrnv.spec_opinion_req_text);
                }

                lbl_pecific_edu_req.Text = WebHelpers.FormatString(mrnv.pecific_edu_req);
                lbl_next_appointment.Text = WebHelpers.FormatString(mrnv.next_appointment);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }

        }
        private void BindingDataFormPrint(Mrnv mrnv)
        {
            try
            {
                allergy_note.Visible= spec_opinion_req.Visible = false;
                Patient patient = Patient.Instance();
                PatientVisit patientVisit = PatientVisit.Instance();

                prt_barcode.Text = prt_vpid.Text = patient.visible_patient_id;
                prt_fullname.Text = patient.GetFullName();
                prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
                prt_gender.Text = patient.gender_l;
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
                prt_pid.Text = patient.visible_patient_id;
                prt_chief_complaint.Text = mrnv.chief_complaint;
                prt_cur_med_history.Text = mrnv.cur_med_history;
                prt_cur_medications.Text = mrnv.cur_medications;
                prt_personal.Text = mrnv.personal;
                prt_family.Text = mrnv.family;

                prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true }, mrnv.allergy, "display: grid; grid-template-columns: 1fr 1fr");

                if (mrnv.allergy != null)
                {
                    if (mrnv.allergy == true) 
                    { 
                        prt_allergy_note.Text = mrnv.allergy_text;
                        allergy_note.Visible = true;
                    } 
                    
                }
                //prt_allergy_note.Text = mrnv.allergy_text;
                prt_vs_temperature.Text = mrnv.vs_temperature;
                prt_vs_weight.Text = mrnv.vs_weight;
                prt_vs_height.Text = mrnv.vs_height;
                prt_vs_BMI.Text = mrnv.vs_BMI;
                prt_pulse.Text = mrnv.vs_pulse;
                prt_vs_respiratory_rate.Text = mrnv.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = mrnv.vs_blood_pressure;
                prt_vs_spO2.Text = mrnv.vs_SpO2;

                prt_scr_before_vacc_1.Text += mrnv.scr_before_vacc_1;
                prt_scr_before_vacc_2.Text += mrnv.scr_before_vacc_2;
                prt_scr_before_vacc_3.Text += mrnv.scr_before_vacc_3;
                prt_scr_before_vacc_4.Text += mrnv.scr_before_vacc_4;
                prt_scr_before_vacc_5.Text += mrnv.scr_before_vacc_5;
                prt_scr_before_vacc_6.Text += mrnv.scr_before_vacc_6;
                prt_scr_before_vacc_7.Text += mrnv.scr_before_vacc_7;
                prt_scr_before_vacc_8.Text += mrnv.scr_before_vacc_8;
                prt_scr_before_vacc_9.Text += mrnv.scr_before_vacc_9;

                string json_appointed_vaccine = mrnv.appointed_vaccine;
                prt_appointed_vaccine.DataSource = JsonConvert.DeserializeObject<DataTable>(json_appointed_vaccine);
                prt_appointed_vaccine.DataBind();

                prt_additional_investigations.Text = mrnv.additional_investigations;
                prt_initial_diagnosis.Text = mrnv.initial_diagnosis;
                prt_differential_diagnosis.Text = mrnv.differential_diagnosis;
                prt_associated_conditions.Text = mrnv.associated_conditions;

                prt_treatment.Text = WebHelpers.CreateOptions(Mrnv.TREATMENT_CODE, mrnv.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr");
                //
                prt_spec_opinion_req.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true }, mrnv.spec_opinion_req, "display: grid; grid-template-columns: 1fr 1fr");


                if (mrnv.spec_opinion_req != null)
                {
                    if (mrnv.spec_opinion_req==true)
                    {
                        prt_spec_opinion_req_text.Text = mrnv.spec_opinion_req_text;
                        spec_opinion_req.Visible = true;
                    }
                }
                //
                prt_specific_edu_req.Text = mrnv.pecific_edu_req;
                prt_next_appointment.Text = mrnv.next_appointment;

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }

        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Mrnv mrnv = new Mrnv(DataHelpers.varDocId);
                mrnv.status = DocumentStatus.FINAL;
                
                UpdateData(mrnv);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Mrnv mrnv = new Mrnv(DataHelpers.varDocId);
                mrnv.status = DocumentStatus.DRAFT;

                UpdateData(mrnv);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Mrnv.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Mrnv mrnv = new Mrnv(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, mrnv, ControlState.Edit, (string)Session["location"], (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(mrnv);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                Mrnv mrnv = new Mrnv(Request.QueryString["docId"]);
                BindingDataFormPrint(mrnv);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        protected void btnUpdateVitalSigns_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic response = VitalSign.Update(PatientVisit.Instance().patient_visit_id, PatientVisit.Instance().visit_type);
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        protected void grid_appointed_vaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_appointed_vaccine_add_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState[grid_appointed_vaccine.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_appointed_vaccine.ID], grid_appointed_vaccine, Mrnv.APPOINTED_VACCINE);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
        }
        #endregion

        #region Functions
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                Mrnv mrnv = new Mrnv(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (mrnv.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mrnv, WebHelpers.LoadFormControl(form1, mrnv, ControlState.View, (string)Session["location"], (string)Session["access_authorize"]));
                }
                else if (mrnv.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mrnv, WebHelpers.LoadFormControl(form1, mrnv, ControlState.Edit, (string)Session["location"], (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, mrnv.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public void UpdateData(Mrnv mrnv)
        {
            try
            {
                
                //I
                mrnv.chief_complaint = txt_chief_complaint.Value;
                //I
                //1
                mrnv.cur_med_history = txt_cur_med_history.Value;
                mrnv.cur_medications = txt_cur_medications.Value;
                //2
                mrnv.personal = txt_personal.Value;
                mrnv.family = txt_family.Value;
                mrnv.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                mrnv.allergy_text = txt_allergy_note.Value;
                //III
                mrnv.vs_temperature = vs_temperature.Text;
                mrnv.vs_heart_rate = vs_heart_rate.Text;
                mrnv.vs_weight = vs_weight.Text;
                mrnv.vs_height = vs_height.Text;
                mrnv.vs_respiratory_rate = vs_respiratory_rate.Text;
                mrnv.vs_BMI = vs_BMI.Text;
                mrnv.vs_blood_pressure = vs_blood_pressure.Text;
                mrnv.vs_SpO2 = vs_spO2.Text;
                mrnv.vs_pulse = vs_pulse.Text;
                //
                mrnv.scr_before_vacc_1 = txt_scr_before_vacc_1.Value;
                mrnv.scr_before_vacc_2 = txt_scr_before_vacc_2.Value;
                mrnv.scr_before_vacc_3 = txt_scr_before_vacc_3.Value;
                mrnv.scr_before_vacc_4 = txt_scr_before_vacc_4.Value;
                mrnv.scr_before_vacc_5 = txt_scr_before_vacc_5.Value;
                mrnv.scr_before_vacc_6 = txt_scr_before_vacc_6.Value;
                mrnv.scr_before_vacc_7 = txt_scr_before_vacc_7.Value;
                mrnv.scr_before_vacc_8 = txt_scr_before_vacc_8.Value;
                mrnv.scr_before_vacc_9 = txt_scr_before_vacc_9.Value;
                //IV
                mrnv.appointed_vaccine = WebHelpers.GetDataGridView(grid_appointed_vaccine, Mrnv.APPOINTED_VACCINE);

                mrnv.additional_investigations = txt_additional_investigations.Value;
                //V
                mrnv.initial_diagnosis = txt_initial_diagnosis.Value;
                mrnv.differential_diagnosis = txt_differential_diagnosis.Value;
                mrnv.associated_conditions = txt_associated_conditions.Value;

                mrnv.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", Mrnv.TREATMENT_CODE);
                mrnv.treatment_desc = WebHelpers.GetDicDesc(mrnv.treatment_code, Mrnv.TREATMENT_CODE);

                mrnv.spec_opinion_req = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_");
                mrnv.spec_opinion_req_text = txt_spec_opinion_req_text.Value;

                mrnv.pecific_edu_req = txt_pecific_edu_req.Value;
                mrnv.next_appointment = txt_next_appointment.Value;

                if (JsonConvert.SerializeObject(mrnv) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                mrnv.amend_reason = txt_amend_reason.Text;
                mrnv.user_name = (string)Session["UserID"];

                dynamic result = mrnv.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);

                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion
    }
}
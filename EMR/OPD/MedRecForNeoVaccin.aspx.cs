using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

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

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + mrnv.allergy, "false");
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
                //next_appointment
                DataObj.Value = JsonConvert.SerializeObject(mrnv);
                Session["docid"] = mrnv.document_id;
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
                    lbl_spec_opinion_req.Text = WebHelpers.GetBool(mrnv.spec_opinion_req, "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.FormatString(mrnv.spec_opinion_req_text));
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

                prt_vpid.Text = patient.visible_patient_id;
                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);

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

                prt_scr_before_vacc_1.Text = $"1. Tình trạng sức khỏe chưa ổn định/ <span class='text-primary'>Unstable health condition:</span> {mrnv.scr_before_vacc_1}";
                prt_scr_before_vacc_2.Text = $"2. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class='text-primary'>Fever / Hypothermia (Fever:temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span> {mrnv.scr_before_vacc_2}";
                prt_scr_before_vacc_3.Text = $"3. Khóc bé hoặc không khóc/ <span class='text-primary'>Cry or unable to cry:</span>{mrnv.scr_before_vacc_3}";
                prt_scr_before_vacc_4.Text = $"4. Da, môi không hồng/ Fever/ <span class='text-primary'>Skin and lips are not pink:</span> {mrnv.scr_before_vacc_4}";
                prt_scr_before_vacc_5.Text = $"5. Bú kém hoặc bỏ bú/ <span class='text-primary'>Poor breastfeeding or breastfeeding refusal:</span> {mrnv.scr_before_vacc_5}";
                prt_scr_before_vacc_6.Text = $"6. Tuổi thai < 28 tuần/ <span class='text-primary'>Gestational age < 28 weeks:</span> {mrnv.scr_before_vacc_6}";
                prt_scr_before_vacc_7.Text = $"7. Trẻ < 34 tuần tuổi/ <span class='text-primary'>Children < 34 weeks old:</span> {mrnv.scr_before_vacc_7}";
                prt_scr_before_vacc_8.Text = $"8. Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-)/ <span class='text-primary'>Child's weight < 2000g, his/her morther HbsAg (-):</span> {mrnv.scr_before_vacc_8}";
                prt_scr_before_vacc_9.Text = $"9. Các chống chỉ định khác, nếu có ghi rõ/<span class='text-primary'>Other contraindications, if yes specified:</span> {mrnv.scr_before_vacc_9}";

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
                Mrnv mrnv = new Mrnv(Request.QueryString["docId"]);
                mrnv.status = DocumentStatus.FINAL;
                
                UpdateData(mrnv);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Mrnv mrnv = new Mrnv(Request.QueryString["docId"]);
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
                WebHelpers.LoadFormControl(form1, mrnv, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
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

        protected void btnUpdateVitalSigns_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic response = VitalSign.Update(PatientVisit.Instance().patient_visit_id, PatientVisit.Instance().visit_type);
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic vs = JsonConvert.DeserializeObject(response.Data);

                    LoadVitalSigns(vs);
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        public void LoadVitalSigns(dynamic vs)
        {
            vs_temperature.Text = WebHelpers.FormatString(vs.vs_temperature);
            vs_heart_rate.Text = WebHelpers.FormatString(vs.vs_heart_rate);
            vs_weight.Text = WebHelpers.FormatString(vs.vs_weight);
            vs_respiratory_rate.Text = WebHelpers.FormatString(vs.vs_respiratory_rate);
            vs_height.Text = WebHelpers.FormatString(vs.vs_height);
            vs_BMI.Text = WebHelpers.FormatString(vs.vs_BMI);
            vs_blood_pressure.Text = WebHelpers.FormatString(vs.vs_blood_pressure);
            vs_spO2.Text = WebHelpers.FormatString(vs.vs_spO2);
            vs_pulse.Text = WebHelpers.FormatString(vs.pulse);
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
            //if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            //if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            //if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                Mrnv mrnv;
                if (Request.QueryString["docIdLog"] != null)
                {
                    mrnv = new Mrnv(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    mrnv = new Mrnv(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();
                
                //if ((string)Session["Transaction"] == "Add")
                //{
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), ScriptKey.SHOW_POPUP, "setTimeout(()=> { RefreshClick() },0);", true);
                //    mrnv.treatment_code = "OPD";
                //    mrnv.treatment_desc = WebHelpers.GetDicDesc(mrnv.treatment_code, Mrnv.TREATMENT_CODE);
                //    mrnv.spec_opinion_req = false;
                //}

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (mrnv.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mrnv, WebHelpers.LoadFormControl(form1, mrnv, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(mrnv);
                }
                else if (mrnv.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mrnv, WebHelpers.LoadFormControl(form1, mrnv, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, mrnv.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        private void loadRadGridHistoryLog()
        {
            DataTable dt = Mrnv.Logs(Request.QueryString["docId"]);
            RadGrid1.DataSource = dt;
            DateTime last_updated_date_time = new DateTime();
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("created_date_time");
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("modified_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("modified_date_time");
            }

            Session["signature_doctor"] = last_updated_doctor;
            RadLabel1.Text = $"Last updated by {last_updated_doctor} on " + WebHelpers.FormatDateTime(last_updated_date_time, "dd-MM-yyyy HH:mm");
            RadGrid1.DataBind();
        }

        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended by";
            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted by";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved by";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                result += $" {created_name} on {created_date_time}";
            }
            else
            {
                result += $" {modified_name} on {modified_date_time}";
            }
            return result;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/OPD/MedRecForNeoVaccin.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}&docIdLog={doc_log_id}";

                Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/OPD/MedRecForNeoVaccin.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
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

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
    }
}
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
    public partial class MedRecForVacV10 : System.Web.UI.Page
    {
        PatientInfo patientInfo;
        PatientVisitInfo patientVisitInfo;
        public string PAGE_URL { get; set; }
        public string loc { get; set; }
        public string locChanged { get; set; }
        public string varDocID { get; set; }
        public string varDocIdLog { get; set; }
        public string varModelID { get; set; }
        public string varPVID { get; set; }
        public string varVPID { get; set; }
        public string varPID { get; set; }

        public string SignatureDate { get; set; }
        public string SignatureName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) return;

            varDocID = Request.QueryString["docId"];
            varDocIdLog = Request.QueryString["docIdLog"];
            varModelID = Request.QueryString["modelId"];
            varPVID = Request.QueryString["pvId"];
            varVPID = Request.QueryString["vpId"];
            varPID = Request.QueryString["pId"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            string url = Request.RawUrl.Split('.')[0];
            var urlArr = url.Split('/');
            url = urlArr[urlArr.Length - 1];

            PAGE_URL = $"/OPD/{url}.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }

        }
        private void LoadPatientInfo()
        {
            lblFirstName.Text = patientInfo.first_name_l;
            lblLastName.Text = patientInfo.last_name_l;
            lblGender.Text = patientInfo.gender_l;

            WebHelpers.ConvertDateTime(patientInfo.DOB, out bool isValid, out string DOB, "dd-MM-yyyy");
            lblDoB.Text = DOB + " (" + patientInfo.Age + "t)";

            lblPatientAddress.Text = patientInfo.Address;
            lblContactPerson.Text = patientInfo.Contact;

            lblVisitCode.Text = patientVisitInfo.VisitCode;

            WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
            lblVisitDate.Text = ActualVisitDateTime;
        }
        #region Binding Data
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
            try
            {
                btnVSFreeText.Visible = true;
                btnUpdateVitalSign.Visible = true;
                txt_amend_reason.Text = "";
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(mrfv.chief_complaint);
                txt_cur_med_history.Value = WebHelpers.TextToHtmlTag(mrfv.cur_med_history);
                txt_cur_medications.Value = WebHelpers.TextToHtmlTag(mrfv.cur_medications);
                txt_personal.Value = WebHelpers.TextToHtmlTag(mrfv.personal);
                txt_family.Value = WebHelpers.TextToHtmlTag(mrfv.family);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + mrfv.allergy, "false");
                if (rad_allergy_true.Checked)
                {
                    txt_allergy_note.Value = WebHelpers.TextToHtmlTag(mrfv.allergy_text);
                }

                //
                txt_vs_temperature.Disabled
                 = txt_vs_weight.Disabled
                 = txt_vs_height.Disabled
                 = txt_vs_bmi.Disabled
                 = txt_vs_pulse.Disabled
                 = txt_vs_heart_rate.Disabled
                 = txt_vs_respiratory_rate.Disabled
                 = txt_vs_blood_pressure.Disabled
                 = txt_vs_spO2.Disabled
                 = !cbVSFreeText.Checked;

                txt_vs_temperature.Value = mrfv.vs_temperature;
                txt_vs_heart_rate.Value = mrfv.vs_heart_rate;
                txt_vs_weight.Value = mrfv.vs_weight;
                txt_vs_respiratory_rate.Value = mrfv.vs_respiratory_rate;
                txt_vs_height.Value = mrfv.vs_height;
                txt_vs_blood_pressure.Value = mrfv.vs_blood_pressure;
                txt_vs_bmi.Value = mrfv.vs_BMI;
                txt_vs_spO2.Value = mrfv.vs_SpO2;
                txt_vs_pulse.Value = mrfv.vs_pulse;

                txt_scr_before_vacc_1.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_1);
                txt_scr_before_vacc_2.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_2);
                txt_scr_before_vacc_3.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_3);
                txt_scr_before_vacc_4.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_4);
                txt_scr_before_vacc_5.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_5);
                txt_scr_before_vacc_6.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_6);
                txt_scr_before_vacc_7.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_7);
                txt_scr_before_vacc_8.Value = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_8);

                ViewState[grid_appointed_vaccine.ID] = WebHelpers.BindingDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine), Mrfv.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);

                txt_additional_investigations.Value = WebHelpers.TextToHtmlTag(mrfv.additional_investigations);
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(mrfv.initial_diagnosis);
                txt_differential_diagnosis.Value = WebHelpers.TextToHtmlTag(mrfv.differential_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(mrfv.associated_conditions);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + mrfv.treatment_code, "opd");

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_" + mrfv.spec_opinion_req, "false");
                txt_spec_opinion_req_text.Value = WebHelpers.GetBool(mrfv.spec_opinion_req, WebHelpers.TextToHtmlTag(mrfv.spec_opinion_req_text), "");

                txt_pecific_edu_req.Value = mrfv.pecific_edu_req;
                txt_next_appointment.Value = mrfv.next_appointment;

                DataObj.Value = JsonConvert.SerializeObject(mrfv);
                Session["docid"] = mrfv.document_id;
                WebHelpers.AddScriptFormEdit(Page, mrfv, (string)Session["emp_id"], loc);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Mrfv mrfv)
        {
            try
            {
                btnVSFreeText.Visible = false;
                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(mrfv.chief_complaint);
                lbl_cur_med_history.Text = WebHelpers.TextToHtmlTag(mrfv.cur_med_history);
                lbl_cur_medications.Text = WebHelpers.TextToHtmlTag(mrfv.cur_medications);
                lbl_personal.Text = WebHelpers.TextToHtmlTag(mrfv.personal);
                lbl_family.Text = WebHelpers.TextToHtmlTag(mrfv.family);

                if (mrfv.allergy != null)
                {
                    lbl_allergy.Text = mrfv.allergy ? "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.TextToHtmlTag(mrfv.allergy_text) : "Không/ No";
                }

                //vital signs
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);

                lbl_vs_temperature.Text = mrfv.vs_temperature + " °C";
                lbl_vs_weight.Text = mrfv.vs_weight + " Kg";
                lbl_vs_height.Text = mrfv.vs_height + " cm";
                lbl_vs_BMI.Text = mrfv.vs_BMI + " (Kg/m 2)";
                lbl_vs_pulse.Text = mrfv.vs_pulse + " cm";
                lbl_vs_heart_rate.Text = mrfv.vs_heart_rate + " /phút (m)";
                lbl_vs_respiratory_rate.Text = mrfv.vs_respiratory_rate + " /phút (m)";
                lbl_vs_blood_pressure.Text = mrfv.vs_blood_pressure + " mmHg";
                lbl_vs_spO2.Text = mrfv.vs_SpO2 + " %";

                //
                lbl_scr_before_vacc_1.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_1);
                lbl_scr_before_vacc_2.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_2);
                lbl_scr_before_vacc_3.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_3);
                lbl_scr_before_vacc_4.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_4);
                lbl_scr_before_vacc_5.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_5);
                lbl_scr_before_vacc_6.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_6);
                lbl_scr_before_vacc_7.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_7);
                lbl_scr_before_vacc_8.Text = WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_8);

                // Appointed Vaccine
                WebHelpers.LoadDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine), Mrfv.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);

                lbl_additional_investigations.Text = WebHelpers.TextToHtmlTag(mrfv.additional_investigations);

                lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(mrfv.initial_diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(mrfv.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(mrfv.associated_conditions);
                lbl_treatment_desc.Text = WebHelpers.TextToHtmlTag(mrfv.treatment_desc);

                if (mrfv.spec_opinion_req != null)
                {
                    lbl_spec_opinion_req.Text = WebHelpers.GetBool(mrfv.spec_opinion_req, "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.TextToHtmlTag(mrfv.spec_opinion_req_text), "Không/ No");
                }

                lbl_pecific_edu_req.Text = WebHelpers.TextToHtmlTag(mrfv.pecific_edu_req);
                lbl_next_appointment.Text = WebHelpers.TextToHtmlTag(mrfv.next_appointment);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Mrfv mrfv)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);
                WebHelpers.gen_BarCode(patientInfo.visible_patient_id, BarCode);

                prt_vpid.Text = patientInfo.visible_patient_id;

                prt_fullname.Text = patientInfo.FullName + $" ({patientInfo.Title})";
                prt_dob.Text = WebHelpers.FormatDateTime(patientInfo.date_of_birth);
                prt_gender.Text = patientInfo.Gender;
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(patientVisitInfo.actual_visit_date_time);
                prt_pid.Text = patientInfo.visible_patient_id;
                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(mrfv.chief_complaint);
                prt_cur_med_history.Text = WebHelpers.TextToHtmlTag(mrfv.cur_med_history);
                prt_cur_medications.Text = WebHelpers.TextToHtmlTag(mrfv.cur_medications);
                prt_personal.Text = WebHelpers.TextToHtmlTag(mrfv.personal);
                prt_family.Text = WebHelpers.TextToHtmlTag(mrfv.family);

                prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true }, mrfv.allergy, "display: grid; grid-template-columns: 1fr 1fr");

                if (mrfv.allergy != null)
                {
                    if (mrfv.allergy)
                    {
                        prt_allergy_note_wrapper.Visible = true;
                        prt_allergy_note.Text = WebHelpers.TextToHtmlTag(mrfv.allergy_text);
                    }
                    else
                    {
                        prt_allergy_note_wrapper.Visible = false;
                    }
                }

                prt_vs_temperature.Text = mrfv.vs_temperature;
                prt_vs_weight.Text = mrfv.vs_weight;
                prt_vs_height.Text = mrfv.vs_height;
                prt_vs_BMI.Text = mrfv.vs_BMI;
                prt_pulse.Text = mrfv.vs_heart_rate;
                prt_vs_respiratory_rate.Text = mrfv.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = mrfv.vs_blood_pressure;
                prt_vs_spO2.Text = mrfv.vs_SpO2;

                prt_scr_before_vacc_1.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_1);
                prt_scr_before_vacc_2.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_2);
                prt_scr_before_vacc_3.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_3);
                prt_scr_before_vacc_4.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_4);
                prt_scr_before_vacc_5.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_5);
                prt_scr_before_vacc_6.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_6);
                prt_scr_before_vacc_7.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_7);
                prt_scr_before_vacc_8.Text += WebHelpers.TextToHtmlTag(mrfv.scr_before_vacc_8);

                DataTable appointed_vaccine = WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine);

                if (appointed_vaccine != null)
                {
                    foreach (DataRow row in appointed_vaccine.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;

                        //
                        td = new HtmlTableCell();

                        td.InnerText = Convert.ToString(row["drug_name"]);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerText = row["strength"].ToString();
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerText = row["router"].ToString();
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerText = row["reason"].ToString();
                        tr.Cells.Add(td);

                        prt_appointed_vaccine.Rows.Add(tr);
                    }
                }

                prt_additional_investigations.Text = WebHelpers.TextToHtmlTag(mrfv.additional_investigations);
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(mrfv.initial_diagnosis);
                prt_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(mrfv.differential_diagnosis);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(mrfv.associated_conditions);

                prt_treatment.Text = WebHelpers.CreateOptions(Mrfv.TREATMENT_CODE, mrfv.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr");
                //
                prt_spec_opinion_req.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class='text-primary'>No</span>", Value = false }, new Option { Text = "Có/ <span class='text-primary'>Yes</span>", Value = true }, mrfv.spec_opinion_req, "display: grid; grid-template-columns: 1fr 1fr");

                if (mrfv.spec_opinion_req != null)
                {
                    if (mrfv.spec_opinion_req)
                    {
                        prt_spec_opinion_req_wrapper.Visible = true;
                        prt_spec_opinion_req_text.Text = WebHelpers.TextToHtmlTag(mrfv.spec_opinion_req_text);
                    }
                    else
                    {
                        prt_spec_opinion_req_wrapper.Visible = false;
                    }
                }
                //
                prt_specific_edu_req.Text = WebHelpers.TextToHtmlTag(mrfv.pecific_edu_req);
                prt_next_appointment.Text = $"● Hẹn lần khám tới/ <span class='text-primary'>Next appointment: </span>{WebHelpers.TextToHtmlTag(mrfv.next_appointment)}";
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Mrfv mrfv = new Mrfv(varDocID, loc);
                mrfv.status = DocumentStatus.FINAL;

                UpdateData(mrfv);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Mrfv mrfv = new Mrfv(varDocID, loc);
                mrfv.status = DocumentStatus.DRAFT;

                UpdateData(mrfv);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Mrfv.Delete((string)Session["UserId"], Request.QueryString["docId"], loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);

                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Mrfv mrfv = new Mrfv(Request.QueryString["docId"], loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, mrfv, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(mrfv);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
        }

        protected void grid_appointed_vaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_appointed_vaccine_add_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState[grid_appointed_vaccine.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_appointed_vaccine.ID], grid_appointed_vaccine, Mrfv.APPOINTED_VACCINE);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }

        public void LoadVitalSigns(dynamic vs)
        {
            txt_vs_temperature.Value = vs.vs_temperature;
            txt_vs_heart_rate.Value = vs.vs_heart_rate;
            txt_vs_weight.Value = vs.vs_weight;
            txt_vs_respiratory_rate.Value = vs.vs_respiratory_rate;
            txt_vs_height.Value = vs.vs_height;
            txt_vs_bmi.Value = vs.vs_BMI;
            txt_vs_blood_pressure.Value = vs.vs_blood_pressure;
            txt_vs_spO2.Value = vs.vs_spO2;
            txt_vs_pulse.Value = vs.pulse;
        }
        #endregion

        #region Functions
        public void Initial()
        {
            try
            {
                Mrfv mrfv;


                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    mrfv = new Mrfv(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    mrfv = new Mrfv(Request.QueryString["docId"], loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Mrfv.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                txt_vs_temperature.Value = mrfv.vs_temperature;
                txt_vs_heart_rate.Value = mrfv.vs_heart_rate;
                txt_vs_weight.Value = mrfv.vs_weight;
                txt_vs_respiratory_rate.Value = mrfv.vs_respiratory_rate;
                txt_vs_height.Value = mrfv.vs_height;
                txt_vs_bmi.Value = mrfv.vs_BMI;
                txt_vs_blood_pressure.Value = mrfv.vs_blood_pressure;
                txt_vs_spO2.Value = mrfv.vs_SpO2;
                txt_vs_pulse.Value = mrfv.vs_pulse;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (mrfv.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(mrfv, WebHelpers.LoadFormControl(form1, mrfv, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    BindingDataFormPrint(mrfv);

                }
                else if (mrfv.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(mrfv, WebHelpers.LoadFormControl(form1, mrfv, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, mrfv.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = mrfv.status,
                    AccessGroup = (string)Session["group_access"],
                    AccessAuthorize = (string)Session["access_authorize"],
                    IsSameCompanyCode = loc == locChanged,
                    IsViewLog = varDocIdLog != null
                });
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();
                string url = PAGE_URL + $"&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        public void UpdateData(Mrfv mrfv)
        {
            try
            {

                mrfv.chief_complaint = txt_chief_complaint.Value;
                mrfv.cur_med_history = txt_cur_med_history.Value;
                mrfv.cur_medications = txt_cur_medications.Value;
                mrfv.personal = txt_personal.Value;
                mrfv.family = txt_family.Value;

                mrfv.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                if (rad_allergy_true.Checked)
                    mrfv.allergy_text = txt_allergy_note.Value;

                mrfv.vs_temperature = txt_vs_temperature.Value;
                mrfv.vs_heart_rate = txt_vs_heart_rate.Value;
                mrfv.vs_weight = txt_vs_weight.Value;
                mrfv.vs_height = txt_vs_height.Value;
                mrfv.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                mrfv.vs_BMI = txt_vs_bmi.Value;
                mrfv.vs_blood_pressure = txt_vs_blood_pressure.Value;
                mrfv.vs_SpO2 = txt_vs_spO2.Value;
                mrfv.vs_pulse = txt_vs_pulse.Value;

                mrfv.scr_before_vacc_1 = txt_scr_before_vacc_1.Value;
                mrfv.scr_before_vacc_2 = txt_scr_before_vacc_2.Value;
                mrfv.scr_before_vacc_3 = txt_scr_before_vacc_3.Value;
                mrfv.scr_before_vacc_4 = txt_scr_before_vacc_4.Value;
                mrfv.scr_before_vacc_5 = txt_scr_before_vacc_5.Value;
                mrfv.scr_before_vacc_6 = txt_scr_before_vacc_6.Value;
                mrfv.scr_before_vacc_7 = txt_scr_before_vacc_7.Value;
                mrfv.scr_before_vacc_8 = txt_scr_before_vacc_8.Value;

                mrfv.appointed_vaccine = WebHelpers.GetDataGridView(grid_appointed_vaccine, Mrfv.APPOINTED_VACCINE);

                mrfv.additional_investigations = txt_additional_investigations.Value;
                mrfv.initial_diagnosis = txt_initial_diagnosis.Value;
                mrfv.differential_diagnosis = txt_differential_diagnosis.Value;
                mrfv.associated_conditions = txt_associated_conditions.Value;

                mrfv.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", Mrfv.TREATMENT_CODE);
                mrfv.treatment_desc = WebHelpers.GetDicDesc(mrfv.treatment_code, Mrfv.TREATMENT_CODE);

                mrfv.spec_opinion_req = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_");
                if (rad_spec_opinion_req_true.Checked)
                    mrfv.spec_opinion_req_text = txt_spec_opinion_req_text.Value;

                mrfv.pecific_edu_req = txt_pecific_edu_req.Value;
                mrfv.next_appointment = txt_next_appointment.Value;

                if (JsonConvert.SerializeObject(mrfv) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                mrfv.amend_reason = txt_amend_reason.Text;
                mrfv.user_name = (string)Session["UserID"];

                dynamic result = mrfv.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Initial();
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);
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
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
        }

        protected void btnVSFreeText_Click(object sender, EventArgs e)
        {
            cbVSFreeText.Checked = !cbVSFreeText.Checked;
            txt_vs_temperature.Disabled
                 = txt_vs_weight.Disabled
                 = txt_vs_height.Disabled
                 //= txt_vs_bmi.Disabled
                 = txt_vs_pulse.Disabled
                 = txt_vs_heart_rate.Disabled
                 = txt_vs_respiratory_rate.Disabled
                 = txt_vs_blood_pressure.Disabled
                 = txt_vs_spO2.Disabled
                 = !cbVSFreeText.Checked;
        }

        protected void btnUpdateVitalSign_Click(object sender, EventArgs e)
        {
            try
            {
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);
                dynamic response = VitalSign.Update(patientVisitInfo.patient_visit_id, patientVisitInfo.visit_type, loc);
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic vs = JsonConvert.DeserializeObject(response.Data);
                    LoadVitalSigns(vs);
                }
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
    }
}
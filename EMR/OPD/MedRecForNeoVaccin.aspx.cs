using EMR.Classes;
using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Model;
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
    public partial class MedRecForNeoVaccin : EmrPage, IEmrFormModel<MrnvModel>
    {
        public override string form_url { get; set; } = $"OPD/{nameof(MedRecForNeoVaccin)}";
        public MrnvModel Model { get; set; }
        public override dynamic InitModel()
        {
            Model = new MrnvModel(varDocID, Location, varDocIdLog);
            return Model;
        }
        #region Binding Data
        public override void BindingDataFormView()
        {
            try
            {
                LoadBarCode();

                btnVSFreeText.Visible = false;
                //I
                lbl_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                //II
                //1
                lbl_cur_med_history.Text = WebHelpers.TextToHtmlTag(Model.cur_med_history);
                lbl_cur_medications.Text = WebHelpers.TextToHtmlTag(Model.cur_medications);
                //2
                lbl_personal.Text = WebHelpers.TextToHtmlTag(Model.personal);
                lbl_family.Text = WebHelpers.TextToHtmlTag(Model.family);

                lbl_allergy.Text = WebHelpers.GetBool(Model.allergy, "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.TextToHtmlTag(Model.allergy_text));

                //vital signs
                lbl_vs_temperature.Text = Model.vs_temperature + " °C";
                lbl_vs_weight.Text = Model.vs_weight + " Kg";
                lbl_vs_height.Text = Model.vs_height + " cm";
                lbl_vs_BMI.Text = Model.vs_BMI + " (Kg/m 2)";
                lbl_vs_pulse.Text = Model.vs_pulse + " cm";
                lbl_vs_heart_rate.Text = Model.vs_heart_rate;
                lbl_vs_respiratory_rate.Text = Model.vs_respiratory_rate + " /phút (m)";
                lbl_vs_blood_pressure.Text = Model.vs_blood_pressure + " mmHg";
                lbl_vs_spO2.Text = Model.vs_SpO2 + " %";
                WebHelpers.VisibleControl(false, btnUpdateVitalSign);

                lbl_scr_before_vacc_1.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_1);
                lbl_scr_before_vacc_2.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_2);
                lbl_scr_before_vacc_3.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_3);
                lbl_scr_before_vacc_4.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_4);
                lbl_scr_before_vacc_5.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_5);
                lbl_scr_before_vacc_6.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_6);
                lbl_scr_before_vacc_7.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_7);
                lbl_scr_before_vacc_8.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_8);
                lbl_scr_before_vacc_9.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_9);

                // Appointed Vaccine
                WebHelpers.LoadDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(Model.appointed_vaccine), MrnvDictionary.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);

                lbl_additional_investigations.Text = WebHelpers.TextToHtmlTag(Model.additional_investigations);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                lbl_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions);
                lbl_treatment_desc.Text = WebHelpers.TextToHtmlTag(Model.treatment_desc);
                lbl_next_appointment.Text = WebHelpers.TextToHtmlTag(Model.next_appointment);

                lbl_spec_opinion_req.Text = WebHelpers.GetBool(Model.spec_opinion_req, "Có, ghi rõ/ Yes, specify <br>" + WebHelpers.TextToHtmlTag(Model.spec_opinion_req_text));

                lbl_pecific_edu_req.Text = WebHelpers.TextToHtmlTag(Model.pecific_edu_req);
                lbl_next_appointment.Text = WebHelpers.TextToHtmlTag(Model.next_appointment);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormEdit()
        {
            try
            {
                btnVSFreeText.Visible = true;

                txt_amend_reason.Text = "";
                txt_chief_complaint.Value = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                txt_cur_med_history.Value = WebHelpers.TextToHtmlTag(Model.cur_med_history);
                txt_cur_medications.Value = WebHelpers.TextToHtmlTag(Model.cur_medications);
                txt_personal.Value = WebHelpers.TextToHtmlTag(Model.personal);
                txt_family.Value = WebHelpers.TextToHtmlTag(Model.family);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + Model.allergy, "false");
                if (rad_allergy_true.Checked)
                {
                    txt_allergy_note.Value = WebHelpers.TextToHtmlTag(Model.allergy_text);
                }

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

                txt_vs_temperature.Value = Model.vs_temperature;
                txt_vs_heart_rate.Value = Model.vs_heart_rate;
                txt_vs_weight.Value = Model.vs_weight;
                txt_vs_respiratory_rate.Value = Model.vs_respiratory_rate;
                txt_vs_height.Value = Model.vs_height;
                txt_vs_blood_pressure.Value = Model.vs_blood_pressure;
                txt_vs_bmi.Value = Model.vs_BMI;
                txt_vs_spO2.Value = Model.vs_SpO2;
                txt_vs_pulse.Value = Model.vs_pulse;

                WebHelpers.VisibleControl(true, btnUpdateVitalSign);

                txt_scr_before_vacc_1.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_1);
                txt_scr_before_vacc_2.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_2);
                txt_scr_before_vacc_3.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_3);
                txt_scr_before_vacc_4.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_4);
                txt_scr_before_vacc_5.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_5);
                txt_scr_before_vacc_6.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_6);
                txt_scr_before_vacc_7.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_7);
                txt_scr_before_vacc_8.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_8);
                txt_scr_before_vacc_9.Value = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_9);

                ViewState[grid_appointed_vaccine.ID] = WebHelpers.BindingDataGridView(grid_appointed_vaccine, WebHelpers.GetJSONToDataTable(Model.appointed_vaccine), MrnvDictionary.APPOINTED_VACCINE, btn_grid_appointed_vaccine_add);

                txt_additional_investigations.Value = WebHelpers.TextToHtmlTag(Model.additional_investigations);
                txt_initial_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                txt_differential_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                txt_associated_conditions.Value = WebHelpers.TextToHtmlTag(Model.associated_conditions);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_treatment_code_" + Model.treatment_code);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_" + Model.spec_opinion_req);
                if (rad_spec_opinion_req_true.Checked)
                    txt_spec_opinion_req_text.Value = WebHelpers.GetBool(Model.spec_opinion_req, Model.spec_opinion_req_text, "");
                //
                txt_pecific_edu_req.Value = WebHelpers.TextToHtmlTag(Model.pecific_edu_req);
                txt_next_appointment.Value = WebHelpers.TextToHtmlTag(Model.next_appointment);
                //next_appointment
                //DataObj.Value = JsonConvert.SerializeObject(mrnv);
                //Session["docid"] = mrnv.document_id;
                //WebHelpers.AddScriptFormEdit(Page, mrnv, (string)Session["emp_id"], loc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormPrint()
        {
            try
            {
                #region Patient Info
                prt_vpid.Text = Patient.visible_patient_id;

                LoadBarCode();

                prt_fullname.Text = Patient.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth);
                prt_gender.Text = Patient.Gender;
                prt_day_of_visit.Text = WebHelpers.FormatDateTime(PatientVisit.actual_visit_date_time);
                prt_pid.Text = Patient.visible_patient_id;
                #endregion

                //allergy_note.Visible = spec_opinion_req.Visible = false;
                
                prt_chief_complaint.Text = WebHelpers.TextToHtmlTag(Model.chief_complaint);
                prt_cur_med_history.Text = WebHelpers.TextToHtmlTag(Model.cur_med_history);
                prt_cur_medications.Text = WebHelpers.TextToHtmlTag(Model.cur_medications);
                prt_personal.Text = WebHelpers.TextToHtmlTag(Model.personal);
                prt_family.Text = WebHelpers.TextToHtmlTag(Model.family);

                prt_allergy_true.Text
                    = prt_allergy_false.Text
                    = "❏";
                BindingLabel($"{nameof(Model.allergy)}_{Model.allergy}", "☒");
                prt_allergy_text.Text = WebHelpers.TextToHtmlTag(Model.allergy_text);

                prt_vs_temperature.Text = Model.vs_temperature;
                prt_vs_weight.Text = Model.vs_weight;
                prt_vs_height.Text = Model.vs_height;
                prt_vs_BMI.Text = Model.vs_BMI;
                prt_hear_rate.Text = Model.vs_heart_rate;

                prt_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = Model.vs_blood_pressure;
                prt_vs_spO2.Text = Model.vs_SpO2;

                prt_scr_before_vacc_1.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_1);
                prt_scr_before_vacc_2.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_2);
                prt_scr_before_vacc_3.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_3);
                prt_scr_before_vacc_4.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_4);
                prt_scr_before_vacc_5.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_5);
                prt_scr_before_vacc_6.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_6);
                prt_scr_before_vacc_7.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_7);
                prt_scr_before_vacc_8.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_8);
                prt_scr_before_vacc_9.Text = WebHelpers.TextToHtmlTag(Model.scr_before_vacc_9);

                DataTable appointed_vaccine = WebHelpers.GetJSONToDataTable(Model.appointed_vaccine);

                if (appointed_vaccine != null)
                {
                    foreach (DataRow row in appointed_vaccine.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;

                        //
                        td = new HtmlTableCell();

                        td.InnerHtml = Convert.ToString(row["drug_name"]);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerHtml = row["strength"].ToString();
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerHtml = row["router"].ToString();
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        td.InnerHtml = row["reason"].ToString();
                        tr.Cells.Add(td);

                        prt_appointed_vaccine.Rows.Add(tr);
                    }
                }

                prt_additional_investigations.Text = WebHelpers.TextToHtmlTag(Model.additional_investigations);
                prt_initial_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.initial_diagnosis);
                prt_differential_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.differential_diagnosis);
                prt_associated_conditions.Text = WebHelpers.TextToHtmlTag(Model.associated_conditions);

                foreach (var item in MrnvDictionary.TREATMENT_CODE)
                {
                    BindingLabel($"{nameof(Model.treatment_code)}_{item.Key}", "❏");
                }
                BindingLabel($"{nameof(Model.treatment_code)}_{Model.treatment_code}", "☒");
                //
                prt_spec_opinion_req_true.Text
                    = prt_spec_opinion_req_false.Text
                    = "❏";
                BindingLabel($"{nameof(Model.spec_opinion_req)}_{Model.spec_opinion_req}", "☒");
                prt_spec_opinion_req_text.Text = WebHelpers.TextToHtmlTag(Model.spec_opinion_req_text);

                prt_specific_edu_req.Text = WebHelpers.TextToHtmlTag(Model.pecific_edu_req);
                prt_next_appointment.Text = WebHelpers.TextToHtmlTag(Model.next_appointment);

                uplPrintPage.Update();
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingControlToModel()
        {
            //I
            Model.chief_complaint = txt_chief_complaint.Value;
            //I
            //1
            Model.cur_med_history = txt_cur_med_history.Value;
            Model.cur_medications = txt_cur_medications.Value;
            //2
            Model.personal = txt_personal.Value;
            Model.family = txt_family.Value;
            Model.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
            Model.allergy_text = txt_allergy_note.Value;
            //III
            Model.vs_temperature = txt_vs_temperature.Value;
            Model.vs_heart_rate = txt_vs_heart_rate.Value;
            Model.vs_weight = txt_vs_weight.Value;
            Model.vs_height = txt_vs_height.Value;
            Model.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            Model.vs_BMI = txt_vs_bmi.Value;
            Model.vs_blood_pressure = txt_vs_blood_pressure.Value;
            Model.vs_SpO2 = txt_vs_spO2.Value;
            Model.vs_pulse = txt_vs_pulse.Value;
            //
            Model.scr_before_vacc_1 = txt_scr_before_vacc_1.Value;
            Model.scr_before_vacc_2 = txt_scr_before_vacc_2.Value;
            Model.scr_before_vacc_3 = txt_scr_before_vacc_3.Value;
            Model.scr_before_vacc_4 = txt_scr_before_vacc_4.Value;
            Model.scr_before_vacc_5 = txt_scr_before_vacc_5.Value;
            Model.scr_before_vacc_6 = txt_scr_before_vacc_6.Value;
            Model.scr_before_vacc_7 = txt_scr_before_vacc_7.Value;
            Model.scr_before_vacc_8 = txt_scr_before_vacc_8.Value;
            Model.scr_before_vacc_9 = txt_scr_before_vacc_9.Value;
            //IV
            Model.appointed_vaccine = WebHelpers.GetDataGridView(grid_appointed_vaccine, MrnvDictionary.APPOINTED_VACCINE);

            Model.additional_investigations = txt_additional_investigations.Value;
            //V
            Model.initial_diagnosis = txt_initial_diagnosis.Value;
            Model.differential_diagnosis = txt_differential_diagnosis.Value;
            Model.associated_conditions = txt_associated_conditions.Value;

            Model.treatment_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_treatment_code_", MrnvDictionary.TREATMENT_CODE);
            Model.treatment_desc = WebHelpers.GetDicDesc(Model.treatment_code, MrnvDictionary.TREATMENT_CODE);

            Model.spec_opinion_req = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spec_opinion_req_");
            Model.spec_opinion_req_text = txt_spec_opinion_req_text.Value;

            Model.pecific_edu_req = txt_pecific_edu_req.Value;
            Model.next_appointment = txt_next_appointment.Value;

            Model.amend_reason = txt_amend_reason.Text;
        }
        #endregion
        #region Events
        public void LoadVitalSigns(dynamic vs)
        {
            txt_vs_temperature.Value = WebHelpers.FormatString(vs.vs_temperature);
            txt_vs_heart_rate.Value = WebHelpers.FormatString(vs.vs_heart_rate);
            txt_vs_weight.Value = WebHelpers.FormatString(vs.vs_weight);
            txt_vs_respiratory_rate.Value = WebHelpers.FormatString(vs.vs_respiratory_rate);
            txt_vs_height.Value = WebHelpers.FormatString(vs.vs_height);
            txt_vs_bmi.Value = WebHelpers.FormatString(vs.vs_BMI);
            txt_vs_blood_pressure.Value = WebHelpers.FormatString(vs.vs_blood_pressure);
            txt_vs_spO2.Value = WebHelpers.FormatString(vs.vs_spO2);
            txt_vs_pulse.Value = WebHelpers.FormatString(vs.pulse);
        }
        protected void grid_appointed_vaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        protected void btn_grid_appointed_vaccine_add_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState[grid_appointed_vaccine.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_appointed_vaccine.ID], grid_appointed_vaccine, MrnvDictionary.APPOINTED_VACCINE);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion
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
                PatientVisit = new PatientVisitInfo(varPVID, Location);
                dynamic response = VitalSign.Update(PatientVisit.patient_visit_id, PatientVisit.visit_type, Location);
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic vs = JsonConvert.DeserializeObject(response.Data);
                    LoadVitalSigns(vs);
                }
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex); 
            }
        }
        public override void PostBackEventHandler()
        {

        }
        private void LoadBarCode()
        {
            IBarcodeGenerator barcodeGenerator = new BarcodeGenerator();
            BarCode.Controls.Clear();
            BarCode.Controls.Add(barcodeGenerator.Generator(Patient.visible_patient_id));
        }
    }
}
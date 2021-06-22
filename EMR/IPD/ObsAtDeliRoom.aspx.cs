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

namespace EMR
{
    public partial class ObstetricObservationAtDeliveryRoom : System.Web.UI.Page
    {
        #region Variables
        Oadr oadr;
        #endregion

        #region Page Lifecycle
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);
            if (!IsPostBack)
            {
                Initial();
            }
        }
        #endregion

        #region Binding Data
        private void BindingDataFormEdit(Oadr oadr)
        {
            WebHelpers.BindDateTimePicker(dtpk_admis_delivery, oadr.admis_delivery);
            txt_obs_name.Value = oadr.obs_name;
            txt_obs_initial.Value = oadr.obs_initial;
            WebHelpers.BindDateTimePicker(dtpk_delivery_at, oadr.delivery_at);
            txt_apgar_score_1.Value = oadr.apgar_score_1;
            txt_apgar_score_5.Value = oadr.apgar_score_5;
            txt_apgar_score_10.Value = oadr.apgar_score_10;
            txt_weight_of_birth.Value = oadr.weight_of_birth;
            txt_length_of_birth.Value = oadr.length_of_birth;
            txt_head_circum.Value = oadr.head_circum;

            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_birth_defect_" + oadr.birth_defect);
            txt_birth_defect_note.Value = oadr.birth_defect_note;

            //Neonatal status after birth
            txt_neonatal_status.Value = oadr.neonatal_status;
            //Intervention and results
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_intervention_" + oadr.intervention);
            txt_intervention_note.Value = oadr.intervention_note;
            //2
            
            //placenta_deli
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_placenta_deli_" + oadr.placenta_deli);
            WebHelpers.BindDateTimePicker(dtpk_pacental_deli_dt, oadr.pacental_deli_dt);
            //
            txt_placenta_deli_mode.Value = oadr.placenta_deli_mode;
            txt_weight_of_birth.Value = oadr.weight_of_birth;
            //
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_umbilical_coil_" + oadr.umbilical_coil);
            txt_umbilical_length.Value = oadr.umbilical_length;
            txt_blood_loss.Value = oadr.blood_loss;
            //
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_p_intervention_" + oadr.p_intervention);
            txt_p_intervention_note.Value = oadr.p_intervention_note;
            //
            txt_spO2.Value = oadr.spO2;
            txt_temp.Value = oadr.temp;
            txt_bp.Value = oadr.bp;
            txt_hr.Value = oadr.hr;
            txt_rr.Value = oadr.rr;
            //
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_delivery_mode_code_" + oadr.delivery_mode_code);

            if (oadr.delivery_mode_code == "S")
            {
                WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_section_code_" + oadr.section_code);
            }else if (oadr.delivery_mode_code == "V")
            {
                WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_vaginal_deli_code_" + oadr.vaginal_deli_code);
            }
            txt_interven_reason.Value = oadr.interven_reason;
            WebHelpers.DataBind(form2, new HtmlInputCheckBox(), "cb_pre_intact_" + oadr.pre_intact);
            WebHelpers.DataBind(form2, new HtmlInputCheckBox(), "cb_pre_lacera_" + oadr.pre_lacera);
            txt_pre_lacera_degree.Value = oadr.pre_lacera_degree;
            WebHelpers.DataBind(form2, new HtmlInputCheckBox(), "cb_pre_episiotomy_" + oadr.pre_episiotomy);
            txt_pre_episiotomy_st.Value = oadr.pre_episiotomy_st;
            //
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_cervix_intact_" + oadr.cervix_intact);
            txt_preo_diagnosis.Value = oadr.preo_diagnosis;
            txt_post_diagnosis.Value = oadr.post_diagnosis;
            //
            ViewState[grid_operations.ID] = WebHelpers.DataBind(grid_operations, WebHelpers.GetJSONToDataTable(oadr.operations));
            WebHelpers.DisabledGridView(grid_operations, false);

            //
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_sur_incident_" + oadr.sur_incident);
            txt_sur_incident_note.Value = oadr.sur_incident_note;
            WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_sur_complication_" + oadr.sur_incident);
            txt_sur_complication_note.Value = oadr.sur_complication_note;
            //
            txt_treatment_plan.Value = oadr.treatment_plan;
        }
        private void BindingDataFormView(Oadr oadr)
        {
            lbl_admis_delivery.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(oadr.admis_delivery, "dd-MM-yyyy HH:mm"));
            lbl_obs_name.Text = WebHelpers.FormatString(oadr.obs_name);
            lbl_obs_initial.Text = WebHelpers.FormatString(oadr.obs_initial);
            lbl_delivery_at.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(oadr.delivery_at, "dd-MM-yyyy HH:mm"));
            lbl_apgar_score_1.Text = WebHelpers.FormatString(oadr.apgar_score_1, null) + " điểm/ points";
            lbl_apgar_score_5.Text = WebHelpers.FormatString(oadr.apgar_score_5) + " điểm/ points";
            lbl_apgar_score_10.Text = WebHelpers.FormatString(oadr.apgar_score_10) + " điểm/ points";

            lbl_weight_of_birth.Text = WebHelpers.FormatString(oadr.weight_of_birth) + " gram";
            lbl_length_of_birth.Text = WebHelpers.FormatString(oadr.length_of_birth) + " cm";
            lbl_head_circum.Text = WebHelpers.FormatString(oadr.head_circum) + " cm";

            lbl_singleton_sex_code.Text = WebHelpers.FormatString(oadr.singleton_sex_desc);
            lbl_multiple_sex.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(oadr.multiple_sex));

            lbl_birth_defect.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.birth_defect, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(oadr.birth_defect_note)));

            lbl_neonatal_status.Text = WebHelpers.FormatString(oadr.neonatal_status);

            lbl_intervention.Text = WebHelpers.GetBool(oadr.intervention, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(oadr.intervention_note));

            //2. Sổ nhau/ Placenta delivery

            lbl_placenta_deli.Text = WebHelpers.GetBool(oadr.placenta_deli, WebHelpers.FormatString("Bằng tay/ Manual"), WebHelpers.FormatString("Tự nhiên/ Spontaneous"));
            lbl_pacental_deli_dt.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(oadr.pacental_deli_dt, "dd-MM-yyyy HH:mm"));

            lbl_placenta_deli_mode.Text = WebHelpers.FormatString(oadr.placenta_deli_mode);
            lbl_placenta_weight.Text = WebHelpers.FormatString(oadr.placenta_weight) + " gram";

            lbl_umbilical_coil.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.umbilical_coil));
            
            lbl_umbilical_length.Text = WebHelpers.FormatString(oadr.umbilical_length) + " cm";
            lbl_blood_loss.Text = WebHelpers.FormatString(oadr.blood_loss) + " ml";

            lbl_p_intervention.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.p_intervention, "Có, chi tiết/ Yes, specify: " + WebHelpers.FormatString(oadr.p_intervention_note)));

            //3.
            lbl_spO2.Text = WebHelpers.FormatString(oadr.spO2) + " %";
            lbl_temp.Text = WebHelpers.FormatString(oadr.temp) + " °C";
            lbl_BP.Text = WebHelpers.FormatString(oadr.bp) + " mmHg";
            lbl_HR.Text = WebHelpers.FormatString(oadr.hr) + " lần/phút/ bpm";
            lbl_RR.Text = WebHelpers.FormatString(oadr.rr) + " lần/phút/ bpm";
            lbl_delivery_mode_desc.Text = WebHelpers.FormatString(oadr.delivery_mode_desc);
            lbl_interven_reason.Text = WebHelpers.FormatString(oadr.interven_reason);



            lbl_pre_intact.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.pre_intact, "True", "No"));
            
            if (oadr.pre_lacera != null)
            {
                lbl_pre_intact.Text += " " + WebHelpers.FormatString(WebHelpers.GetBool(oadr.pre_lacera, "True", "No")) + " " + oadr.pre_lacera_degree;
            }
            if(oadr.pre_episiotomy != null)
            {
                lbl_pre_intact.Text += " " + WebHelpers.FormatString(WebHelpers.GetBool(oadr.pre_episiotomy, "True", "No")) + " " + oadr.pre_episiotomy_st;
            }

            lbl_cervix_intact.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.cervix_intact, "Nguyên vẹn/ Intact", "Rách/ Laceration"));

            //4.
            lbl_preo_diagnosis.Text = WebHelpers.FormatString(oadr.preo_diagnosis);
            lbl_post_diagnosis.Text = WebHelpers.FormatString(oadr.post_diagnosis);

            ViewState[grid_operations.ID] = WebHelpers.DataBind(grid_operations, WebHelpers.GetJSONToDataTable(oadr.operations));
            WebHelpers.DisabledGridView(grid_operations, true);

            lbl_sur_incident.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.sur_incident, "Có, ghi rõ/ Yes, specify: " + oadr.sur_incident_note));

            lbl_sur_complication.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.sur_complication, "Có, ghi rõ/ Yes, specify: " + oadr.sur_complication_note));

            //5.
            lbl_treatment_plan.Text = WebHelpers.FormatString(oadr.treatment_plan);
        }
        private void BindingDataFormPrint(Oadr oadr)
        {
            //Patient patient = Patient.Instance();
            //PatientVisit patientVisit = PatientVisit.Instance();
            //prt_fullname.Text = patient.GetFullName() + " " + patient.title_l;
            //prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth) + " | " + patient.GetGender();
            //prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;

            //prt_day_of_visit.Text = WebHelpers.FormatDateTime(patientVisit.actual_visit_date_time);
            //prt_chief_complaint.Text = omr1.chief_complain;
            //prt_medical_history.Text = omr1.medical_history;
            //prt_personal.Text = omr1.personal;
            //prt_family.Text = omr1.family;
            //prt_immunization.Text = omr1.immunization;
            //prt_current_medication.Text = omr1.current_medication;
            ////IV.
            ////1.
            //prt_vs_temperature.Text = omr1.vs_temperature;
            //prt_vs_weight.Text = omr1.vs_weight;
            //prt_vs_height.Text = omr1.vs_height;
            //prt_vs_BMI.Text = omr1.vs_BMI;
            //prt_pulse.Text = omr1.vs_pulse;
            //prt_vs_respiratory_rate.Text = omr1.vs_respiratory_rate;
            //prt_vs_blood_pressure.Text = omr1.vs_blood_pressure;
            //prt_vs_spO2.Text = omr1.vs_spO2;
            ////2.
            //prt_physical_examination.Text = DataHelpers.FormatPhysicalExamination(omr1.physical_examination);

            //prt_psy_consult_required.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, omr.psy_consult_required, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

            //prt_laboratory_indications_results.Text = omr1.laboratory_indications_results;
            //prt_additional_investigation.Text = omr1.additional_investigation;
            //prt_initial_diagnosis.Text = omr1.initial_diagnosis;
            //prt_diagnosis.Text = omr1.diagnosis;
            //prt_differential_diagnosis.Text = omr1.differential_diagnosis;
            //prt_associated_conditions.Text = omr1.associated_conditions;

            //prt_treatment.Text = WebHelpers.CreateOptions(Omr.TREATMENT_CODE, (string)omr.treatment_code, "display: grid; grid-template-columns: 1fr 1fr 1fr;");

            //if (omr.treatment_code == "OPD")
            //{ prt_medicine.Text = omr.medicine; }

            //prt_spec_opinion_requested.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có/ Yes", Value = true }, omr.spec_opinion_requested, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

            //if (omr.spec_opinion_requested != null)
            //{
            //    if (omr.spec_opinion_requested)
            //    {
            //        prt_spec_opinion_requested_note.Text = omr.spec_opinion_requested_note;
            //    }
            //}

            //prt_specific_education_required.Text = omr.specific_education_required;

            //prt_next_appointment.Text = omr1.next_appointment;
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                oadr = new Oadr(DataHelpers.varDocId);
                oadr.status = DocumentStatus.FINAL;
                oadr.user_name = (string)Session["UserID"];

                UpdateData(oadr);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            oadr = new Oadr(Request.QueryString["docId"]);

            txt_amend_reason.Text = "";

            WebHelpers.VisibleControl(false, btnAmend, btnPrint);

            WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper, btn_grid_operations_add);

            WebHelpers.LoadFormControl(form2, oadr, ControlState.Edit);

            BindingDataFormEdit(oadr);

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                oadr = new Oadr(Request.QueryString["docId"]);
                oadr.status = DocumentStatus.DRAFT;
                oadr.user_name = (string)Session["UserID"];

                UpdateData(oadr);
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            oadr = new Oadr(Request.QueryString["docId"]);
            BindingDataFormPrint(oadr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Oadr.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        protected void btn_grid_operations_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_operations.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_operations.ID], grid_operations, Oadr.OPERATION);
        }
        protected void grid_operations_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[grid_operations.ID] = WebHelpers.DeleteRow((DataTable)ViewState[grid_operations.ID], grid_operations, e.RowIndex);
        }
        #endregion

        #region Methods
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                oadr = new Oadr(Request.QueryString["docId"]);

                amendReasonWraper.Visible = false;
                btnCancel.Visible = false;
                prt_barcode.Text = Patient.Instance().visible_patient_id;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (oadr.status == DocumentStatus.FINAL)
                {
                    BindingDataFormView(oadr);

                    WebHelpers.VisibleControl(true, btnAmend, btnPrint);
                    WebHelpers.VisibleControl(false, btnComplete, btnSave, btnDeleteModal, btn_grid_operations_add);

                    WebHelpers.LoadFormControl(form2, oadr, ControlState.View);
                }
                else if (oadr.status == DocumentStatus.DRAFT)
                {
                    BindingDataFormEdit(oadr);

                    WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                    WebHelpers.VisibleControl(true, btnComplete, btnSave, btnDeleteModal);

                    WebHelpers.LoadFormControl(form2, oadr, ControlState.Edit);
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public void UpdateData(Oadr oadr)
        {
            try
            {
                oadr.amend_reason = txt_amend_reason.Text;
                oadr.admis_delivery = DataHelpers.ConvertSQLDateTime(dtpk_admis_delivery.SelectedDate);
                oadr.obs_name = txt_obs_name.Value;
                oadr.obs_initial = txt_obs_initial.Value;
                oadr.delivery_at = DataHelpers.ConvertSQLDateTime(dtpk_delivery_at.SelectedDate);
                oadr.apgar_score_1 = txt_apgar_score_1.Value;
                oadr.apgar_score_5 = txt_apgar_score_5.Value;
                oadr.apgar_score_10 = txt_apgar_score_10.Value;
                oadr.weight_of_birth = txt_weight_of_birth.Value;
                oadr.length_of_birth = txt_length_of_birth.Value;
                oadr.head_circum = txt_head_circum.Value;
                //
                if (rad_singleton_sex_code_m.Checked)
                {
                    oadr.singleton_sex_code = "M";
                    oadr.singleton_sex_desc = Oadr.SEX_CODE[oadr.singleton_sex_code];
                }
                else if (rad_singleton_sex_code_f.Checked)
                {
                    oadr.singleton_sex_code = "F";
                    oadr.singleton_sex_desc = Oadr.SEX_CODE[oadr.singleton_sex_code];
                }
                //
                oadr.multiple_sex = WebHelpers.GetData(form2, new HtmlInputCheckBox(), "cb_multiple_sex_", Oadr.SEX_CODE, "cde");
                //
                oadr.birth_defect = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_birth_defect_");
                oadr.birth_defect_note = txt_birth_defect_note.Value;
                //
                oadr.neonatal_status = txt_neonatal_status.Value;
                //
                oadr.intervention = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_intervention_");
                oadr.intervention_note = txt_intervention_note.Value;
                //
                oadr.placenta_deli = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_placenta_deli_");
                oadr.pacental_deli_dt = DataHelpers.ConvertSQLDateTime(dtpk_pacental_deli_dt.SelectedDate);
                //
                oadr.placenta_deli_mode = txt_placenta_deli_mode.Value;
                oadr.placenta_weight = txt_placenta_weight.Value;
                //
                oadr.umbilical_coil = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_umbilical_coil_");
                oadr.umbilical_length = txt_umbilical_length.Value;
                oadr.blood_loss = txt_blood_loss.Value;
                //
                oadr.p_intervention = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_p_intervention_");
                oadr.p_intervention_note = txt_p_intervention_note.Value;
                //
                oadr.spO2 = txt_spO2.Value;
                oadr.temp = txt_temp.Value;
                oadr.bp = txt_bp.Value;
                oadr.hr = txt_hr.Value;
                oadr.rr = txt_rr.Value;
                //
                oadr.delivery_mode_code = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_delivery_mode_code_", Oadr.DELIVERY_MODE_CODE);
                
                if (oadr.delivery_mode_code != null)
                {
                    oadr.delivery_mode_desc = Oadr.DELIVERY_MODE_CODE[oadr.delivery_mode_code];

                    if (oadr.delivery_mode_code == "S")
                    {
                        oadr.section_code = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_section_code_", Oadr.SECTION_CODE);
                        if (oadr.section_code != null)
                        {
                            oadr.section_desc = Oadr.SECTION_CODE[oadr.section_code];
                        }
                    }
                    else if (oadr.delivery_mode_code == "V")
                    {
                        oadr.vaginal_deli_code = oadr.section_code = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_vaginal_deli_code_", Oadr.VAGINAL_DELI_CODE);
                        if (oadr.vaginal_deli_code != null)
                        {
                            oadr.vaginal_deli_desc = Oadr.VAGINAL_DELI_CODE[oadr.vaginal_deli_code];
                        }
                    }
                    //
                }
                //
                oadr.interven_reason = txt_interven_reason.Value;
                //
                oadr.pre_intact = WebHelpers.GetData(form2, new HtmlInputCheckBox(), "cb_pre_intact_");
                oadr.pre_lacera = WebHelpers.GetData(form2, new HtmlInputCheckBox(), "cb_pre_lacera_", true);
                oadr.pre_lacera_degree = txt_pre_lacera_degree.Value;
                oadr.pre_episiotomy = WebHelpers.GetData(form2, new HtmlInputCheckBox(), "cb_pre_episiotomy_", true);
                oadr.pre_episiotomy_st = txt_pre_episiotomy_st.Value;
                //
                oadr.cervix_intact = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_cervix_intact_");
                //
                oadr.preo_diagnosis = txt_preo_diagnosis.Value;
                oadr.post_diagnosis = txt_post_diagnosis.Value;

                //
                oadr.sur_incident = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_sur_incident_");
                oadr.sur_incident_note = txt_sur_incident_note.Value;
                //
                oadr.operations = WebHelpers.GetDataGridView(grid_operations, Oadr.OPERATION);

                //
                oadr.sur_complication = WebHelpers.GetData(form2, new HtmlInputRadioButton(), "rad_sur_complication_");
                
                oadr.sur_complication_note = txt_sur_complication_note.Value;
                //
                oadr.treatment_plan = txt_treatment_plan.Value;

                dynamic result = oadr.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                    Initial();
                }
                else
                {
                    WebHelpers.SendError(Page, result.Message);
                }
            }
            catch (Exception ex) {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        #region Validations
        protected void placenta_deli_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_placenta_deli_false.Checked || rad_placenta_deli_true.Checked;
        }
        protected void p_intervention_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_p_intervention_false.Checked || rad_p_intervention_true.Checked;
        }
        #endregion
    }
}
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
        Oadr oadr; string UserID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserID();

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

            oadr = new Oadr(Request.QueryString["docId"]);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;
            prt_barcode.Text = Patient.Instance().visible_patient_id;
            if (oadr.status == DocumentStatus.FINAL)
            {
                loadFormView(oadr);
            }
            else if (oadr.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(oadr);
            }
        }

        #region Load Forms
        private void LoadFormEdit(Oadr oadr)
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

            if (oadr.birth_defect != null)
            {
                rad_birth_defect2.Checked = oadr.birth_defect;
                txt_birth_defect_note.Value = oadr.birth_defect_note;
            }
            //Neonatal status after birth
            txt_neonatal_status.Value = oadr.neonatal_status;
            //Intervention and results
            if (oadr.intervention != null)
            {
                if (oadr.intervention)
                {
                    rad_birth_defect2.Checked = true;
                    txt_birth_defect_note.Value = oadr.intervention_note;
                }
                else
                {
                    rad_birth_defect1.Checked = true;
                }
            }

            //
            if (oadr.placenta_deli != null)
            {
                if (oadr.placenta_deli)
                {
                    rad_placenta_deli1.Checked = true;
                }
                else
                {
                    rad_placenta_deli2.Checked = true;
                }
            }

            if (oadr.singleton_sex_code == "M")
            {
                rad_singleton_sex_code1.Checked = true;
            }
            else if (oadr.singleton_sex_code == "F")
            {
                rad_singleton_sex_code2.Checked = true;
            }

            foreach (DataRow row in WebHelpers.GetJSONToDataTable(oadr.multiple_sex).Rows)
            {
                ((HtmlInputCheckBox)FindControl("cb_multiple_sex_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }

            if (oadr.birth_defect != null)
            {
                if (oadr.birth_defect)
                {
                    rad_birth_defect1.Checked = true;
                }
                else
                {
                    rad_birth_defect2.Checked = true;
                    txt_birth_defect_note.Value = oadr.birth_defect_note;
                }
            }

            WebHelpers.BindDateTimePicker(dtpk_pacental_deli_dt, oadr.pacental_deli_dt);

            txt_placenta_deli_mode.Value = oadr.placenta_deli_mode;
            txt_placenta_weight.Value = oadr.placenta_weight;
            txt_weight_of_birth.Value = oadr.weight_of_birth;

            if (oadr.umbilical_coil != null)
            {
                if (oadr.umbilical_coil)
                {
                    rad_umbilical_coil2.Checked = true;
                }
                else
                {
                    rad_umbilical_coil1.Checked = true;
                }
            }
            txt_umbilical_length.Value = oadr.umbilical_length;

            if (oadr.intervention != null)
            {
                if (oadr.intervention)
                {
                    rad_intervention2.Checked = true;
                    txt_intervention_note.Value = oadr.intervention_note;
                }
                else
                {
                    rad_intervention1.Checked = true;
                }
            }

            txt_blood_loss.Value = oadr.blood_loss;
            if (oadr.p_intervention != null)
            {
                if (oadr.p_intervention)
                {
                    rad_p_intervention2.Checked = true;
                    txt_p_intervention_note.Value = oadr.p_intervention_note;
                }
                else
                {
                    rad_p_intervention1.Checked = true;
                }
            }
            txt_spO2.Value = oadr.spO2;
            txt_temp.Value = oadr.temp;
            txt_BP.Value = oadr.bp;
            txt_HR.Value = oadr.hr;
            txt_RR.Value = oadr.rr;

            if (oadr.delivery_mode_code == Oadr.DELIVERY_MODE_CODE["S"])
            {
                rad_delivery_mode_code_s.Checked = true;

                if (oadr.section_code == "EM")
                {
                    rad_section_code_em.Checked = true;
                }
                else if (oadr.section_code == "EL")
                {
                    rad_section_code_el.Checked = true;
                }
            }
            else if (oadr.delivery_mode_code == "V")
            {
                rad_delivery_mode_code_v.Checked = true;

                if (oadr.vaginal_deli_code == "V")
                {
                    rad_vaginal_deli_code_v.Checked = true;
                }
                else if (oadr.vaginal_deli_code == "F")
                {
                    rad_vaginal_deli_code_f.Checked = true;
                }
                if (oadr.vaginal_deli_code == "S")
                {
                    rad_vaginal_deli_code_s.Checked = true;
                }
            }

            txt_interven_reason.Value = oadr.interven_reason;
            if (oadr.pre_intact != null)
            {
                if (oadr.pre_intact) { cb_pre_intact.Checked = true; }
            }

            if (oadr.pre_lacera != null)
            {
                if (oadr.pre_lacera) { cb_pre_lacera.Checked = true; txt_pre_lacera_degree.Value = oadr.pre_lacera_degree; }
            }

            if (oadr.pre_episiotomy != null)
            {
                if (oadr.pre_episiotomy) { cb_pre_episiotomy.Checked = true; txt_pre_episiotomy_st.Value = oadr.pre_episiotomy_st; }
            }

            if (oadr.cervix_intact != null)
            {
                if (oadr.cervix_intact) { rad_cervix_intact1.Checked = true; }
                else { rad_cervix_intact2.Checked = true; }
            }

            txt_preo_diagnosis.Value = oadr.preo_diagnosis;
            txt_post_diagnosis.Value = oadr.post_diagnosis;

            _BindGridView(grid_operations, WebHelpers.GetJSONToDataTable(oadr.operations));

            //DataTable operations_tb = new DataTable();
            //foreach (KeyValuePair<string, string> col in Oadr.TABLE.OPERATION)
            //{
            //    operations_tb.Columns.Add(col.Key);
            //}
            //oadr.operations = WebHelpers.GetJSONFromTable(grid_operations, operations_tb);

            if (oadr.sur_incident != null)
            {
                if (oadr.sur_incident) { rad_sur_incident2.Checked = true; txt_sur_incident_note.Value = oadr.sur_incident_note; }
                else { rad_sur_incident1.Checked = true; }
            }

            if (oadr.sur_complication != null)
            {
                if (oadr.sur_complication) { rad_sur_complication2.Checked = true; txt_sur_complication_note.Value = oadr.sur_complication_note; }
                else { rad_sur_complication1.Checked = true; }
            }

            txt_treatment_plan.Value = oadr.treatment_plan;

            LoadFormControl(false);
            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }
        private void loadFormView(Oadr oadr)
        {
            //1
            //lbl_chief_complain.Text = WebHelpers.GetValue(omr.chief_complain);
            //lbl_current_medication.Text = WebHelpers.GetValue(omr.current_medication);
            ////2
            //lbl_personal.Text = WebHelpers.GetValue(omr.personal);
            //if (DataHelpers.CalculateAge(DataHelpers.patient.date_of_birth) >= 18)
            //{
            //    habits_field.Visible = true;


            //    lbl_habits_smoking.Text = omr.habits_smoking != null && omr.habits_smoking ? "Có, ghi số gói trong năm/ Yes, specify pack years: " + WebHelpers.GetValue(omr.habits_smoking_pack) : "Không/ No";
            //    lbl_habits_alcohol.Text = omr.habits_alcohol != null && omr.habits_alcohol ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(omr.habits_alcohol_note) : "Không/ No";
            //    lbl_habits_drugs.Text = omr.habits_drugs != null && omr.habits_drugs ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(omr.habits_drugs_note) : "Không/ No";
            //    lbl_habits_physical_exercise.Text = omr.habits_physical_exercise != null && omr.habits_physical_exercise ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(omr.habits_phy_exer_note) : "Không/ No";
            //    lbl_habits_other.Text = WebHelpers.GetValue(omr.habits_other);
            //}
            //else
            //{
            //    habits_field.Visible = false;
            //}

            //lbl_medical_history.Text = WebHelpers.GetValue(omr.medical_history);

            //if (omr.allergy != null)
            //{
            //    lbl_allergy.Text = omr.allergy ? "Có, ghi rõ/ Yes, specify: " + WebHelpers.GetValue(omr.allergy_note) : "Không/ No";
            //}
            //else
            //{
            //    omr.allergy_note = "—";
            //}

            //lbl_family.Text = WebHelpers.GetValue(omr.family);
            //lbl_immunization.Text = WebHelpers.GetValue(omr.immunization);

            //vs_temperature.Text = WebHelpers.GetValue(omr.vs_temperature);
            //vs_weight.Text = WebHelpers.GetValue(omr.vs_weight);
            //vs_height.Text = WebHelpers.GetValue(omr.vs_height);
            //vs_bmi.Text = WebHelpers.GetValue(omr.vs_BMI);
            //vs_pulse.Text = WebHelpers.GetValue(omr.vs_pulse);
            //vs_heart_rate.Text = WebHelpers.GetValue(omr.vs_heart_rate);
            //vs_respiratory_rate.Text = WebHelpers.GetValue(omr.vs_respiratory_rate);
            //vs_blood_pressure.Text = WebHelpers.GetValue(omr.vs_blood_pressure);
            //vs_spo2.Text = WebHelpers.GetValue(omr.vs_spO2);

            //lbl_physical_examination.Text = DataHelpers.FormatPhysicalExamination(omr.physical_examination);

            //if (omr.treatment_code != null)
            //{
            //    if (omr.treatment_code == "OPD")
            //    {
            //        lbl_medicine.Text = WebHelpers.GetValue(omr.medicine);
            //    }
            //}

            //if (omr.psy_consult_required != null)
            //{
            //    lbl_psy_consult_required.Text = omr.psy_consult_required ? "Có/ Yes" : "Không/ No";
            //}
            //else
            //{
            //    lbl_psy_consult_required.Text = "—";
            //}

            //lbl_laboratory_indications_results.Text = WebHelpers.GetValue(omr.laboratory_indications_results);
            //lbl_additional_investigation.Text = WebHelpers.GetValue(omr.additional_investigation);
            //lbl_initial_diagnosis.Text = WebHelpers.GetValue(omr.initial_diagnosis);
            //lbl_diagnosis.Text = WebHelpers.GetValue(omr.diagnosis);
            //lbl_differential_diagnosis.Text = WebHelpers.GetValue(omr.differential_diagnosis);
            //lbl_associated_conditions.Text = WebHelpers.GetValue(omr.associated_conditions);
            //lbl_treatment_code.Text = WebHelpers.GetValue(omr.treatment_desc);

            //if (omr.spec_opinion_requested != null)
            //{
            //    lbl_spec_opinion_requested.Text = omr.spec_opinion_requested ? "Có, ghi rõ/ Yes, specify: " + omr.spec_opinion_requested_note : "Không/ No";
            //}
            //else { lbl_spec_opinion_requested.Text = "—"; }

            //lbl_specific_education_required.Text = WebHelpers.GetValue(omr.specific_education_required);
            //lbl_next_appointment.Text = WebHelpers.GetValue(omr.next_appointment);

            //LoadFormControl(true);

            //btnComplete.Visible = false;
            //btnSave.Visible = false;
            //btnDeleteModal.Visible = false;
            //btnUpdateVitalSign.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void LoadFormPrint(Oadr oadr)
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

            amendReasonWraper.Visible = true;
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            LoadFormEdit(oadr);
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
            LoadFormPrint(oadr);

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
            try
            {
                DataTable table = (DataTable)ViewState[grid_operations.ID];

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in Oadr.TABLE.OPERATION)
                    {
                        table.Columns.Add(col.Key);
                    }
                }

                for (int r = 0; r < grid_operations.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_operations.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (grid_operations.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_operations.Rows[r].Cells[i].Controls[1] as TextField;

                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                            else if (grid_operations.Rows[r].Cells[i].Controls[1] is RadDateTimePicker)
                            {
                                RadDateTimePicker dtpk = grid_operations.Rows[r].Cells[i].Controls[1] as RadDateTimePicker;
                                table.Rows[r][dtpk.ID] = DateTime.Parse(dtpk.SelectedDate.ToString());
                            }
                        }
                        catch { }
                    }
                }

                DataRow dtRow = table.NewRow();

                dtRow = table.NewRow();
                table.Rows.Add(dtRow);

                _BindGridView(grid_operations, table);
            }
            catch (Exception ex)
            {

            }
        }
        #endregion

        #region Functions
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

                if (rad_singleton_sex_code1.Checked)
                {
                    oadr.singleton_sex_code = "M";
                    oadr.singleton_sex_desc = Oadr.SEX_CODE[oadr.singleton_sex_code];
                }
                else if (rad_singleton_sex_code2.Checked)
                {
                    oadr.singleton_sex_code = "F";
                    oadr.singleton_sex_desc = Oadr.SEX_CODE[oadr.singleton_sex_code];
                }

                DataTable multiple_sex = new DataTable();
                multiple_sex.Columns.Add("cde");
                multiple_sex.Columns.Add("desc");
                DataRow multiple_sex_row;

                if (cb_multiple_sex_m.Checked)
                {
                    multiple_sex_row = multiple_sex.NewRow();
                    multiple_sex_row["cde"] = "M";
                    multiple_sex_row["desc"] = Oadr.SEX_CODE["M"];
                    multiple_sex.Rows.Add(multiple_sex_row);
                }
                if (cb_multiple_sex_f.Checked)
                {
                    multiple_sex_row = multiple_sex.NewRow();
                    multiple_sex_row["cde"] = "F";
                    multiple_sex_row["desc"] = Oadr.SEX_CODE["F"];
                    multiple_sex.Rows.Add(multiple_sex_row);
                }

                oadr.multiple_sex = WebHelpers.GetDataTableToJSON(multiple_sex);

                //
                oadr.birth_defect = null;
                if (rad_birth_defect1.Checked)
                {
                    oadr.birth_defect = false;
                }
                else if (rad_birth_defect2.Checked)
                {
                    oadr.birth_defect = true;
                    oadr.birth_defect_note = txt_birth_defect_note.Value;
                }
                //
                oadr.neonatal_status = txt_neonatal_status.Value;
                //
                oadr.intervention = null;
                if (rad_intervention1.Checked)
                {
                    oadr.intervention = false;
                }
                else if (rad_intervention2.Checked)
                {
                    oadr.intervention = true;
                    oadr.intervention_note = txt_intervention_note.Value;
                }
                //
                oadr.placenta_deli = null;
                if (rad_placenta_deli1.Checked)
                {
                    oadr.placenta_deli = true;
                }
                else if (rad_placenta_deli2.Checked)
                {
                    oadr.placenta_deli = false;
                }
                oadr.pacental_deli_dt = DataHelpers.ConvertSQLDateTime(dtpk_pacental_deli_dt.SelectedDate);
                //
                oadr.placenta_deli_mode = txt_placenta_deli_mode.Value;
                oadr.placenta_weight = txt_placenta_weight.Value;
                //
                if (rad_umbilical_coil1.Checked)
                {
                    oadr.umbilical_coil = false;
                }
                else if (rad_umbilical_coil2.Checked)
                {
                    oadr.umbilical_coil = true;
                }
                //
                oadr.umbilical_length = txt_umbilical_length.Value;
                oadr.blood_loss = txt_blood_loss.Value;
                //
                if (rad_p_intervention1.Checked)
                {
                    oadr.p_intervention = false;
                }
                else if (rad_p_intervention2.Checked)
                {
                    oadr.p_intervention = true;
                    oadr.p_intervention_note = txt_p_intervention_note.Value;
                }
                //
                oadr.spO2 = txt_spO2.Value;
                oadr.temp = txt_temp.Value;
                oadr.bp = txt_BP.Value;
                oadr.hr = txt_HR.Value;
                oadr.rr = txt_RR.Value;
                //
                if (rad_delivery_mode_code_v.Checked)
                {
                    oadr.delivery_mode_code = "V";
                    oadr.delivery_mode_desc = Oadr.DELIVERY_MODE_CODE[oadr.delivery_mode_code];

                    if (rad_vaginal_deli_code_f.Checked)
                    {
                        oadr.vaginal_deli_code = "F";
                        oadr.vaginal_deli_desc = Oadr.VAGINAL_DELI_CODE[oadr.vaginal_deli_code];
                    }
                    else if (rad_vaginal_deli_code_v.Checked)
                    {
                        oadr.vaginal_deli_code = "V";
                        oadr.vaginal_deli_desc = Oadr.VAGINAL_DELI_CODE[oadr.vaginal_deli_code];
                    }
                    else if (rad_vaginal_deli_code_s.Checked)
                    {
                        oadr.vaginal_deli_code = "S";
                        oadr.vaginal_deli_desc = Oadr.VAGINAL_DELI_CODE[oadr.vaginal_deli_code];
                    }
                }
                else if (rad_delivery_mode_code_s.Checked)
                {
                    oadr.delivery_mode_code = "S";
                    oadr.delivery_mode_desc = Oadr.DELIVERY_MODE_CODE[oadr.delivery_mode_code];

                    if (rad_section_code_el.Checked)
                    {
                        oadr.section_code = "EL";
                        oadr.section_desc = Oadr.SECTION_CODE[oadr.section_code];
                    }
                    else if (rad_section_code_em.Checked)
                    {
                        oadr.section_code = "EM";
                        oadr.section_desc = Oadr.SECTION_CODE[oadr.section_code];
                    }
                }

                //
                oadr.interven_reason = txt_interven_reason.Value;
                //

                if (cb_pre_intact.Checked)
                {
                    oadr.pre_intact = true;
                }
                else { oadr.pre_intact = false; }

                if (cb_pre_lacera.Checked)
                {
                    oadr.pre_lacera = true;
                    oadr.pre_lacera_degree = txt_pre_lacera_degree.Value;
                }
                else
                {
                    oadr.pre_lacera = false;
                }

                if (cb_pre_episiotomy.Checked)
                {
                    oadr.pre_episiotomy = true;
                    oadr.pre_episiotomy_st = txt_pre_episiotomy_st.Value;
                }
                else
                {
                    oadr.pre_episiotomy = false;
                }
                //
                if (rad_cervix_intact1.Checked)
                {
                    oadr.cervix_intact = true;
                }
                else if (rad_cervix_intact2.Checked)
                {
                    oadr.cervix_intact = false;
                }

                //
                oadr.preo_diagnosis = txt_preo_diagnosis.Value;
                oadr.post_diagnosis = txt_post_diagnosis.Value;

                //
                if (rad_sur_incident1.Checked)
                {
                    oadr.sur_incident = false;
                }
                else if (rad_sur_incident2.Checked)
                {
                    oadr.sur_incident = true;
                    oadr.sur_incident_note = txt_sur_incident_note.Value;
                }
                //
                DataTable operations_tb = new DataTable();
                foreach (KeyValuePair<string, string> col in Oadr.TABLE.OPERATION)
                {
                    operations_tb.Columns.Add(col.Key);
                }
                oadr.operations = WebHelpers.GetJSONFromTable(grid_operations, operations_tb);

                //
                if (rad_sur_complication1.Checked)
                {
                    oadr.sur_complication = false;
                }
                else if (rad_sur_complication2.Checked)
                {
                    oadr.sur_complication = true;
                    oadr.sur_complication_note = txt_sur_complication_note.Value;
                }
                //
                oadr.treatment_plan = txt_treatment_plan.Value;

                if (oadr.Update()[0] == "OK")
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS, 100000);

                    Initial();
                }
            }
            catch (Exception ex) { }
        }
        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in oadr.GetType().GetProperties())
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

        #region Session
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

    }
}
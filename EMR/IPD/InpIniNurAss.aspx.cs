using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class InpatientInitialNursingAssessment : System.Web.UI.Page
    {
        Iina iina;
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

            iina = new Iina(DataHelpers.varDocId);
            loadDataToControls(iina);
        }
        public void loadDataToControls(Iina iina)
        {
            try
            {
                //residence
                BindRadioButton("rad_residence_code_" + iina.residence_code);
                txt_residence_other.Value = iina.residence_other;
                //language
                BindRadioButton("rad_language_code_" + iina.language_code);
                txt_language_other.Value = iina.language_other;
                //
                BindRadioButton("rad_req_interpreter_" + iina.req_interpreter);
                //
                BindRadioButton("rad_religion_code_" + iina.religion_code);
                //
                BindRadioButton("rad_spiritual_couns_" + iina.spiritual_couns);
                txt_occupation.Value = iina.occupation;
                //
                BindRadioButton("rad_living_status_code_" + iina.living_status_code);
                txt_living_status_note.Value = iina.living_status_note;
                //
                BindRadioButton("rad_hospital_concern_code_" + iina.hospital_concern_code);
                txt_hospital_concern_other.Value = iina.hospital_concern_other;
                //
                txt_accompanied.Value = iina.accompanied;
                //
                txt_relationship.Value = iina.relationship;
                //
                BindRadioButton("rad_admit_from_code_" + iina.admit_from_code);
                //
                BindCheckBox("cb_arrived_code_", iina.arrived);
                //
                txt_admission_reason.Value = iina.admission_reason;
                //
                txt_previous_admission.Value = iina.previous_admission;
                //
                BindRadioButton("rad_past_med_history_" + iina.past_med_history);
                txt_past_med_history_note.Value = iina.past_med_history_note;
                //
                BindRadioButton("rad_past_sur_history_" + iina.past_sur_history);
                txt_past_sur_history_note.Value = iina.past_sur_history_note;
                //
                BindCheckBox("cb_substance_abuse_", iina.substance_abuse);
                txt_substance_abuse_other.Value = iina.substance_abuse_other;
                //
                BindRadioButton("rad_previous_document_" + iina.previous_document);
                txt_previous_document_note.Value = iina.previous_document_note;
                //
                BindRadioButton("rad_cur_home_medication_" + iina.cur_home_medication);
                //
                BindRadioButton("rad_allergy_" + iina.allergy);
                txt_allergy_note.Value = iina.allergy_note;
                //
                BindCheckBox("cb_high_risk_patient_", iina.high_risk_patient);
                //
                txt_vs_temperature.Value = iina.vs_temperature;
                txt_vs_heart_rate.Value = iina.vs_heart_rate;
                txt_vs_weight.Value = iina.vs_weight;
                txt_vs_respiratory_rate.Value = iina.vs_respiratory_rate;
                txt_vs_height.Value = iina.vs_height;
                txt_vs_blood_pressure.Value = iina.vs_blood_pressure;
                txt_vs_BMI.Value = iina.vs_BMI;
                txt_vs_spO2.Value = iina.vs_spO2;
                txt_vs_pulse.Value = iina.vs_pulse;

                //2.
                BindCheckBox("cb_respiratory_system_", iina.respiratory_system);
                BindRadioButton("rad_cough_" + iina.cough);
                BindRadioButton("rad_pro_cough_note_" + iina.pro_cough);
                txt_pro_cough_note.Value = iina.pro_cough_note;
                BindRadioButton("rad_pulse_code_" + iina.pulse_code);
                BindCheckBox("cb_presence_", iina.presence);
                BindCheckBox("cb_extremities_", iina.extremities);
                //4.
                BindCheckBox("cb_oriented_", iina.oriented);
                BindCheckBox("cb_mental_status_", iina.mental_status);
                txt_mental_status_other.Value = iina.mental_status_other;
                BindRadioButton("rad_hearing_code_" + iina.hearing_code);
                BindRadioButton("rad_vision_code_" + iina.vision_code);
                txt_vision_other.Value = iina.vision_other;
                BindRadioButton("rad_speech_code_" + iina.speech_code);
                //5.
                BindRadioButton("rad_diet_code_" + iina.diet_code);
                txt_diet_other.Value = iina.diet_other;
                BindRadioButton("rad_diet_pre_code_" + iina.diet_pre_code);
                BindRadioButton("rad_ng_tube_" + iina.ng_tube);
                BindCheckBox("cb_gastrostomy_" + iina.gastrostomy);
                BindCheckBox("cb_size_" + iina.size);
                txt_size_note.Value = iina.size_note;
                WebHelpers.BindDateTimePicker(dpk_last_date_changed, iina.last_date_changed);
                txt_food_dislike.Value = iina.food_dislike;
                BindRadioButton("rad_bowel_elimination_code_" + iina.bowel_elimination_code);
                BindRadioButton("rad_stool_consistency_code_" + iina.stool_consistency_code);
                BindRadioButton("rad_gas_presence_code_" + iina.gas_presence_code);
                //6.
                BindRadioButton("rad_bmi_out_range_" + iina.bmi_out_range);
                BindRadioButton("rad_loss_weight_" + iina.loss_weight);
                BindRadioButton("rad_reduce_dietary_" + iina.loss_weight);
                BindRadioButton("rad_severely_ill_" + iina.severely_ill);

                //BindCheckBox("cb_nutrition_normal_" + iina.nutrition_normal);
                //BindCheckBox("cb_nutrition_score1_" + iina.nutrition_score1);

                BindCheckBox("cb_nutrition_score1_", iina.nutrition_score1);
                BindCheckBox("cb_nutrition_score2_", iina.nutrition_score2);
                BindCheckBox("cb_nutrition_score3_", iina.nutrition_score3);
                txt_nutrition_score.Text = iina.nutrition_score;

                BindCheckBox("cb_severity_score1_", iina.severity_score1);
                BindCheckBox("cb_severity_score2_", iina.severity_score2);
                BindCheckBox("cb_severity_score3_", iina.severity_score3);
                txt_severity_score.Value = iina.severity_score;

                BindCheckBox("cb_younger_70_" + iina.younger_70);
                BindCheckBox("cb_older_70_" + iina.older_70);
                txt_age_score.Value = iina.age_score;

                txt_total_nutri_score.Value = iina.total_nutri_score;

                //7
                BindCheckBox("cb_urination_", iina.urination);

                BindCheckBox("cb_inter_catheter_" + iina.inter_catheter);
                txt_inter_catheter_note.Value = iina.inter_catheter_note;

                BindCheckBox("cb_ind_catheter_" + iina.ind_catheter);
                txt_ind_catheter_size.Value = iina.ind_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_ind_catheter_date, iina.ind_catheter_date);

                BindCheckBox("cb_sup_catheter_" + iina.sup_catheter);
                txt_sup_catheter_size.Value = iina.sup_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_last_sup_catheter_date, iina.last_sup_catheter_date);

                BindRadioButton("rad_menstruation_code_" + iina.menstruation_code);
                txt_cycle_day.Value = iina.cycle_day;

                txt_last_mens_period.Value = iina.last_mens_period;

                BindCheckBox("cb_not_pregnancy_" + iina.not_pregnancy);
                BindCheckBox("cb_pre_pregnancy_" + iina.pre_pregnancy);
                txt_para.Value = iina.para;
                BindCheckBox("cb_cur_pregnancy_" + iina.cur_pregnancy);
                txt_pregnancy_week.Value = iina.pregnancy_week;

                BindRadioButton("rad_contraception_" + iina.contraception_code);
                txt_contraception_other.Value = iina.contraception_other;

                //8
                BindCheckBox("cb_mus_history_" + iina.mus_history);

                BindCheckBox("cb_paralysis_" + iina.paralysis);
                txt_paralysis_note.Value = iina.paralysis_note;
                BindCheckBox("cb_amputation_" + iina.amputation);
                txt_amputation_note.Value = iina.amputation_note;
                BindCheckBox("cb_contracture_" + iina.contracture);
                txt_contracture_note.Value = iina.contracture_note;
                BindCheckBox("cb_prosthesis_" + iina.prosthesis);
                txt_prosthesis_note.Value = iina.prosthesis_note;

                //9
                BindRadioButton("rad_cur_in_pain_" + iina.cur_in_pain);
                txt_p_location_1.Value = iina.p_location_1;
                txt_p_location_2.Value = iina.p_location_2;
                txt_p_location_3.Value = iina.p_location_3;

                txt_q_location_1.Value = iina.q_location_1;
                txt_q_location_2.Value = iina.q_location_2;
                txt_q_location_3.Value = iina.q_location_3;

                txt_r_location_1.Value = iina.r_location_1;
                txt_r_location_2.Value = iina.r_location_2;
                txt_r_location_3.Value = iina.r_location_3;

                txt_s_location_1.Value = iina.s_location_1;
                txt_s_location_2.Value = iina.s_location_2;
                txt_s_location_3.Value = iina.s_location_3;

                txt_t_location_1.Value = iina.t_location_1;
                txt_t_location_2.Value = iina.t_location_2;
                txt_t_location_3.Value = iina.t_location_3;

                BindRadioButton("rad_using_pain_killer_" + iina.using_pain_killer);

                txt_pain_killer_name.Value = iina.pain_killer_name;
                txt_pa_comment.Value = iina.pa_comment;

                //10
                BindCheckBox("cb_condition_" + iina.condition);

                BindCheckBox("cb_wounds_" + iina.wounds);

                _BindGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(iina.skin_anno));

                foreach (KeyValuePair<string, string> code in Iina.SENSORY_CODE)
                {
                    try
                    {
                        ListItem item = new ListItem();
                        item.Value = code.Key.ToString();
                        item.Text = code.Value;

                        select_sensory_code.Items.Add(item);
                    }
                    catch (Exception ex) { }
                }

                foreach (KeyValuePair<string, string> code in Iina.MOISTURE_CODE)
                {
                    try
                    {
                        ListItem item = new ListItem();
                        item.Value = code.Key.ToString();
                        item.Text = code.Value;

                        select_moisture_code.Items.Add(item);
                    }
                    catch (Exception ex) { }
                }

                foreach (KeyValuePair<string, string> code in Iina.ACTIVITY_CODE)
                {
                    try
                    {
                        ListItem item = new ListItem();
                        item.Value = code.Key.ToString();
                        item.Text = code.Value;

                        select_activity_code.Items.Add(item);
                    }
                    catch (Exception ex) { }
                }

                foreach (KeyValuePair<string, string> code in Iina.MOBILITY_CODE)
                {
                    try
                    {
                        ListItem item = new ListItem();
                        item.Value = code.Key.ToString();
                        item.Text = code.Value;

                        select_mobility_code.Items.Add(item);
                    }
                    catch (Exception ex) { }
                }

                foreach (KeyValuePair<string, string> code in Iina.NUTRITION_CODE)
                {
                    try
                    {
                        ListItem item = new ListItem();
                        item.Value = code.Key.ToString();
                        item.Text = code.Value;

                        select_nutrition_code.Items.Add(item);
                    }
                    catch (Exception ex) { }
                }

                foreach (KeyValuePair<string, string> code in Iina.FRICTION_CODE)
                {
                    try
                    {
                        ListItem item = new ListItem();
                        item.Value = code.Key.ToString();
                        item.Text = code.Value;

                        select_friction_code.Items.Add(item);
                    }
                    catch (Exception ex) { }
                }

                BindSelectOption(select_sensory_code, iina.sensory_code);
                BindSelectOption(select_moisture_code, iina.moisture_code);
                BindSelectOption(select_activity_code, iina.activity_code);
                BindSelectOption(select_mobility_code, iina.mobility_code);
                BindSelectOption(select_nutrition_code, iina.nutrition_code);
                BindSelectOption(select_friction_code, iina.friction_code);
                txt_total_score.Value = iina.total_score;

                txt_pres_sore_risk_code.Value = iina.pres_sore_risk_desc;
                txt_preven_action.Value = iina.preven_action;

                //11

                BindRadioButton("rad_bathing_code_" + iina.bathing_code);
                BindRadioButton("rad_oral_care_code_" + iina.oral_care_code);
                BindRadioButton("rad_dentures_code_" + iina.dentures_code);
                BindRadioButton("rad_toilet_use_code_" + iina.toilet_use_code);
                BindRadioButton("rad_dressing_code_" + iina.dressing_code);
                BindRadioButton("rad_eating_code_" + iina.eating_code);
                BindRadioButton("rad_turning_bed_code_" + iina.turning_bed_code);
                BindRadioButton("rad_ambulation_code_" + iina.ambulation_code);
                BindRadioButton("rad_sleep_code_" + iina.sleep_code);

                txt_medication_used.Value = iina.medication_used;

                BindRadioButton("rad_fall_history_code_" + iina.fall_history_code);
                BindRadioButton("rad_secon_diagnosis_code_" + iina.secon_diagnosis_code);
                BindRadioButton("rad_ambulation_code_" + iina.ambulation_code);
                BindRadioButton("rad_intra_therapy_code_" + iina.intra_therapy_code);
                BindRadioButton("rad_gait_trans_code_" + iina.gait_trans_code);
                BindRadioButton("rad_fr_mental_status_code_" + iina.fr_mental_status_code);

                txt_fr_total_score.Value = iina.fr_total_score;

                BindRadioButton("rad_involvement_" + iina.involvement);
                BindRadioButton("rad_req_med_equipment_" + iina.req_med_equipment);
                BindRadioButton("rad_req_foll_care_" + iina.req_foll_care);
                BindRadioButton("rad_suicidal_referral_" + iina.suicidal_referral);
                BindRadioButton("rad_alone_reduce_functional_" + iina.alone_reduce_functional);
                BindRadioButton("rad_ref_physiotherapist_" + iina.ref_physiotherapist);
                BindRadioButton("rad_ref_speech_therapist_" + iina.ref_speech_therapist);
                BindRadioButton("rad_ref_dietician_" + iina.ref_dietician);
                BindRadioButton("rad_ref_psychologist_" + iina.ref_psychologist);
                BindRadioButton("rad_ref_other_hospital_" + iina.ref_other_hospital);
                BindRadioButton("rad_support_at_home_" + iina.support_at_home);
                BindRadioButton("rad_req_transportation_" + iina.req_transportation);
                BindRadioButton("rad_stairs_climb_home_" + iina.stairs_climb_home);

                txt_dis_planning.Value = iina.dis_planning;
                txt_dis_management.Value = iina.dis_management;

                WebHelpers.BindDateTimePicker(dtpk_assess_date_time, iina.assess_date_time);

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (iina.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }

                else if (iina.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void DisabledControl(bool v)
        {
            
        }

        //public void BindRadioButton(dynamic value, bool isString)
        //{
        //    if (FindControl(value) != null)
        //    {
        //        ((HtmlInputRadioButton)FindControl(value)).Checked = true;
        //    }
        //}

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

        public void BindRadioButton(dynamic value)
        {
            if(FindControl(value) != null)
            {
                ((HtmlInputRadioButton)FindControl(value)).Checked = true;
            }
        }

        public void BindSelectOption(HtmlSelect htmlSelect, string value)
        {
            var item = htmlSelect.Items.FindByValue(value);
            if (item != null)
            {
                item.Selected = true;
            }
        }

        public void BindCheckBox(string cb_name, string value, string key = "code")
        {
            if(value != null && cb_name != null)
            {
                foreach (DataRow row in WebHelpers.GetJSONToDataTable(value).Rows)
                {
                    try
                    {
                        ((HtmlInputCheckBox)FindControl(cb_name + row.Field<dynamic>(key).ToLower())).Checked = true;
                    }
                    catch(Exception ex)
                    {
                    }
                    
                }
            }
        }

        public void BindCheckBox(string value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputCheckBox)FindControl(value)).Checked = true;
            }
        }

        protected void btn_grid_skin_anno_add_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState[grid_skin_anno.ID];
                if (table == null) table = new DataTable();

                if (table.Rows.Count <= 0)
                {
                    foreach (KeyValuePair<string, string> col in Iina.SKIN_ANNO)
                    {
                        table.Columns.Add(col.Key);
                    }
                }

                for (int r = 0; r < grid_skin_anno.Rows.Count; r++)
                {
                    for (int i = 0; i < grid_skin_anno.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (grid_skin_anno.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = grid_skin_anno.Rows[r].Cells[i].Controls[1] as TextField;
                                table.Rows[r][text2.DataKey] = text2.Value;
                            }
                        }
                        catch { }
                    }
                }

                DataRow dtRow = table.NewRow();

                dtRow = table.NewRow();
                table.Rows.Add(dtRow);

                _BindGridView(grid_skin_anno, table);
            }
            catch (Exception ex)
            {

            }
        }

        protected void grid_skin_anno_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridViewRow((GridView)sender, e.RowIndex);
        }

        private void DeleteGridViewRow(GridView gridView, int rowIndex)
        {
            DataTable dt = ViewState[gridView.ID] as DataTable;
            dt.Rows[rowIndex].Delete();

            _BindGridView(gridView, dt);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var errors = new List<string>();

            checkValidField(errors);

            if (errors.Count <= 0)
            {
                iina = new Iina(Request["docID"]);

                iina.user_name = (string)Session["UserID"];
                iina.status = DocumentStatus.DRAFT;

                if (UpdateData(iina) == WebHelpers.ResponseStatus.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);
                }
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);
            }
        }

        private string UpdateData(Iina iina)
        {
            try
            {
                iina.residence_code = GetRadioButton("rad_residence_code_", Iina.RESIDENCE_CODE);
                if(iina.residence_code != null) iina.residence_desc = Iina.RESIDENCE_CODE[iina.residence_code];
                iina.residence_other = txt_residence_other.Value;
                //
                iina.language_code = GetRadioButton("rad_language_code_", Iina.LANGUAGE_CODE);
                if (iina.language_code != null) iina.language_desc = Iina.LANGUAGE_CODE[iina.language_code];
                iina.language_other = txt_language_other.Value;
                //
                iina.req_interpreter = GetRadioButton("rad_req_interpreter_");
                //
                iina.religion_code = GetRadioButton("rad_religion_code_", Iina.RELIGION_CODE);
                if (iina.religion_code != null) iina.religion_desc = Iina.RELIGION_CODE[iina.religion_code];
                //iina.religion_other =
                //
                iina.spiritual_couns = GetRadioButton("rad_spiritual_couns_");
                //
                iina.occupation = txt_occupation.Value;
                //
                iina.living_status_code = GetRadioButton("rad_living_status_code_", Iina.LIVING_STATUS_CODE);
                if (iina.living_status_code != null) iina.living_status_desc = Iina.LIVING_STATUS_CODE[iina.living_status_code];
                iina.living_status_note = txt_living_status_note.Value;
                //
                iina.hospital_concern_code = GetRadioButton("rad_hospital_concern_code_", Iina.HOSPITAL_CONCERN_CODE);
                if (iina.hospital_concern_code != null) iina.hospital_concern_desc = Iina.HOSPITAL_CONCERN_CODE[iina.hospital_concern_code];
                iina.hospital_concern_other = txt_hospital_concern_other.Value;
                //
                iina.accompanied = txt_accompanied.Value;
                //
                iina.relationship = txt_relationship.Value;
                //checked
                //B. BỆNH SỬ/ MEDICAL HISTORY
                iina.admit_from_code = GetRadioButton("rad_admit_from_code_", Iina.ADMIT_FROM_CODE);
                if (iina.admit_from_code != null) iina.admit_from_desc = Iina.ADMIT_FROM_CODE[iina.admit_from_code];
                iina.admit_from_other = txt_admit_from_other.Value;
                //
                iina.admission_reason = txt_admission_reason.Value;
                //
                //iina.previous_admission = txt_previous_admission.Value;
                //
                iina.past_med_history = GetRadioButton("rad_past_med_history_");
                iina.past_med_history_note = txt_past_med_history_note.Value;
                //
                iina.past_sur_history = GetRadioButton("rad_past_sur_history_");
                iina.past_sur_history_note = txt_past_sur_history_note.Value;
                //
                iina.substance_abuse = GetCheckBox("cb_substance_abuse_", Iina.SUBSTANCE_ABUSE);
                iina.substance_abuse_other = txt_substance_abuse_other.Value;
                //
                iina.previous_document = GetRadioButton("rad_previous_document_");
                iina.previous_document_note = txt_previous_document_note.Value;
                //
                iina.cur_home_medication = GetRadioButton("rad_cur_home_medication_");
                //
                iina.allergy = GetRadioButton("rad_allergy_");
                iina.allergy_note = txt_allergy_note.Value;
                //
                iina.high_risk_patient = GetCheckBox("cb_high_risk_patient_", Iina.HIGH_RISK_PATIENT_CODE);
                //C
                //1
                iina.vs_temperature = txt_vs_temperature.Value;
                iina.vs_heart_rate = txt_vs_heart_rate.Value;
                iina.vs_weight = txt_vs_weight.Value;
                iina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                iina.vs_height = txt_vs_height.Value;
                iina.vs_blood_pressure = txt_vs_blood_pressure.Value;
                iina.vs_BMI = txt_vs_BMI.Value;
                iina.vs_spO2 = txt_vs_spO2.Value;
                iina.vs_pulse = txt_vs_pulse.Value;
                //2
                iina.respiratory_system = GetCheckBox("cb_respiratory_system_", Iina.RESPIRATORY_SYSTEM_CODE);
                iina.cough = GetRadioButton("rad_cough_");
                iina.pro_cough = GetRadioButton("rad_pro_cough_");
                iina.pro_cough_note = txt_pro_cough_note.Value;
                //3
                iina.pulse_code = GetRadioButton("rad_pulse_code_", Iina.PULSE_CODE);
                iina.presence = GetCheckBox("cb_presence_", Iina.PRESENCE_CODE);
                iina.extremities = GetCheckBox("cb_extremities_", Iina.EXTREMITIES_CODE);
                //4
                iina.oriented = GetCheckBox("cb_oriented_", Iina.ORIENTED_CODE);
                iina.mental_status = GetCheckBox("cb_mental_status_", Iina.MENTAL_STATUS_CODE);
                iina.mental_status_other = txt_mental_status_other.Value;

                iina.hearing_code = GetRadioButton("rad_hearing_code_", Iina.HEARING_CODE);
                if (iina.hearing_code != null) iina.hearing_desc = Iina.HEARING_CODE[iina.hearing_code];

                iina.vision_code = GetRadioButton("rad_vision_code_", Iina.VISION_CODE);
                if (iina.vision_code != null) iina.vision_desc = Iina.VISION_CODE[iina.vision_code];

                iina.speech_code = GetRadioButton("rad_speech_code_", Iina.SPEECH_CODE);
                if (iina.speech_code != null) iina.speech_desc = Iina.SPEECH_CODE[iina.speech_code];
                //5
                iina.diet_code = GetRadioButton("rad_diet_code_", Iina.DIET_CODE);
                if (iina.diet_code != null) iina.diet_desc = Iina.DIET_CODE[iina.diet_code];
                iina.diet_other = txt_diet_other.Value;
                iina.diet_pre_code = GetRadioButton("rad_diet_pre_code_", Iina.DIET_PRE_CODE);
                if (iina.diet_pre_code != null) iina.diet_pre_desc = Iina.DIET_PRE_CODE[iina.diet_pre_code];

                iina.ng_tube = GetRadioButton("rad_ng_tube_");
                iina.gastrostomy = GetCheckBox("cb_gastrostomy_");
                iina.size = GetCheckBox("cb_size_");
                iina.size_note = txt_size_note.Value;
                iina.last_date_changed = DataHelpers.ConvertSQLDateTime(dpk_last_date_changed.SelectedDate);
                iina.food_dislike = txt_food_dislike.Value;

                iina.bowel_elimination_code = GetRadioButton("rad_bowel_elimination_code_", Iina.BOWEL_ELIMINATION_CODE);
                if (iina.bowel_elimination_code != null) iina.bowel_elimination_desc = Iina.BOWEL_ELIMINATION_CODE[iina.bowel_elimination_code];

                iina.stool_consistency_code = GetRadioButton("rad_stool_consistency_code_", Iina.STOOL_CONSISTENCY_CODE);
                if (iina.stool_consistency_code != null) iina.stool_consistency_desc = Iina.STOOL_CONSISTENCY_CODE[iina.stool_consistency_code];

                iina.gas_presence_code = GetRadioButton("rad_gas_presence_code_", Iina.GAS_PRESENCE_CODE);
                if (iina.gas_presence_code != null) iina.gas_presence_desc = Iina.GAS_PRESENCE_CODE[iina.gas_presence_code];
                //6
                iina.bmi_out_range = GetRadioButton("rad_bmi_out_range_");
                iina.loss_weight = GetRadioButton("rad_loss_weight_");
                iina.reduce_dietary = GetRadioButton("rad_reduce_dietary_");
                iina.severely_ill = GetRadioButton("rad_severely_ill_");
                //table 2
                iina.nutrition_normal = GetCheckBox("cb_nutrition_normal_");
                iina.nutrition_score1 = GetCheckBox("cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);
                iina.nutrition_score1 = GetCheckBox("cb_nutrition_score1_", Iina.NUTRITION_SCORE1_CODE);
                iina.nutrition_score2 = GetCheckBox("cb_nutrition_score2_", Iina.NUTRITION_SCORE2_CODE);
                iina.nutrition_score3 = GetCheckBox("cb_nutrition_score3_", Iina.NUTRITION_SCORE3_CODE);
                iina.nutrition_score = txt_nutrition_score.Text;
                //
                // mising Điểm = 0 / Score = 0
                iina.severity_score1 = GetCheckBox("cb_severity_score1_", Iina.SEVERITY_SCORE1_CODE);
                iina.severity_score2 = GetCheckBox("cb_severity_score2_", Iina.SEVERITY_SCORE2_CODE);
                iina.severity_score3 = GetCheckBox("cb_severity_score3_", Iina.SEVERITY_SCORE3_CODE);
                iina.severity_score = txt_severity_score.Value;
                //Age
                iina.younger_70 = GetCheckBox("cb_younger_70_");
                iina.older_70 = GetCheckBox("cb_older_70_");
                iina.age_score = txt_age_score.Value;
                iina.total_nutri_score = txt_total_nutri_score.Value;
                //7
                iina.urination = GetCheckBox("cb_urination_", Iina.URINATION_CODE);
                iina.inter_catheter = GetCheckBox("cb_inter_catheter_");
                iina.inter_catheter_note = txt_inter_catheter_note.Value;

                iina.ind_catheter = GetCheckBox("cb_ind_catheter_");
                iina.ind_catheter_size = txt_ind_catheter_size.Value;
                iina.ind_catheter_date = dpk_ind_catheter_date.SelectedDate;

                iina.sup_catheter = GetCheckBox("cb_sup_catheter_");
                iina.sup_catheter_size = txt_sup_catheter_size.Value;
                iina.last_sup_catheter_date = dpk_last_sup_catheter_date.SelectedDate;


                iina.menstruation_code = GetRadioButton("rad_menstruation_code_", Iina.MENSTRUATION_CODE);
                if(iina.menstruation_code != null) { iina.menstruation_code = Iina.MENSTRUATION_CODE[iina.menstruation_code]; }
                iina.cycle_day = txt_cycle_day.Value;
                iina.last_mens_period = txt_last_mens_period.Value;

                iina.not_pregnancy = GetCheckBox("cb_not_pregnancy_");
                iina.pre_pregnancy = GetCheckBox("cb_pre_pregnancy_");
                iina.para = txt_para.Value;
                iina.cur_pregnancy = GetCheckBox("cb_cur_pregnancy_");
                iina.pregnancy_week = txt_pregnancy_week.Value;
                
                iina.contraception_code = GetRadioButton("cb_contraception_code_", Iina.CONTRACEPTION_CODE);
                iina.contraception_other = txt_contraception_other.Value;
                //8
                iina.mus_history = GetCheckBox("cb_mus_history_", Iina.MUS_HISTORY);

                iina.paralysis = GetCheckBox("cb_paralysis_");
                iina.paralysis_note = txt_paralysis_note.Value;

                iina.amputation = GetCheckBox("cb_amputation_");
                iina.amputation_note = txt_amputation_note.Value;

                iina.contracture = GetCheckBox("cb_contracture_");
                iina.contracture_note = txt_contracture_note.Value;

                iina.prosthesis = GetCheckBox("cb_prosthesis_");
                iina.prosthesis_note = txt_prosthesis_note.Value;
                //9
                iina.cur_in_pain = GetRadioButton("rad_cur_in_pain_");
                iina.p_location_1 = txt_p_location_1.Value;
                iina.p_location_2 = txt_p_location_2.Value;
                iina.p_location_3 = txt_p_location_3.Value;

                iina.q_location_1 = txt_q_location_1.Value;
                iina.q_location_2 = txt_q_location_2.Value;
                iina.q_location_3 = txt_q_location_3.Value;

                iina.r_location_1 = txt_r_location_1.Value;
                iina.r_location_2 = txt_r_location_2.Value;
                iina.r_location_3 = txt_r_location_3.Value;

                iina.s_location_1 = txt_s_location_1.Value;
                iina.s_location_2 = txt_s_location_2.Value;
                iina.s_location_3 = txt_s_location_3.Value;

                iina.t_location_1 = txt_t_location_1.Value;
                iina.t_location_2 = txt_t_location_2.Value;
                iina.t_location_3 = txt_t_location_3.Value;

                iina.using_pain_killer = GetRadioButton("rad_using_pain_killer_");
                iina.pain_killer_name = txt_pain_killer_name.Value;
                iina.pa_comment = txt_pa_comment.Value;
                //10
                iina.condition = GetCheckBox("cb_condition_", Iina.CONDITION_CODE);

                iina.wounds = GetCheckBox("cb_wounds_", Iina.WOUNDS_CODE);

                iina.skin_anno = WebHelpers.GetJSONFromTable(grid_skin_anno, Iina.SKIN_ANNO);

                iina.sensory_code = Request.Form.Get("select_sensory_code");
                if (iina.sensory_code != null) iina.sensory_desc = Iina.SENSORY_CODE[iina.sensory_code];

                iina.moisture_code = Request.Form.Get("select_moisture_code");
                if (iina.moisture_code != null) iina.moisture_desc = Iina.MOISTURE_CODE[iina.moisture_code];

                iina.activity_code = Request.Form.Get("select_activity_code");
                if (iina.activity_code != null) iina.activity_desc = Iina.ACTIVITY_CODE[iina.activity_code];

                iina.mobility_code = Request.Form.Get("select_mobility_code");
                if (iina.mobility_code != null) iina.mobility_desc = Iina.MOBILITY_CODE[iina.mobility_code];

                iina.nutrition_code = Request.Form.Get("select_nutrition_code");
                if (iina.nutrition_code != null) iina.nutrition_desc = Iina.NUTRITION_CODE[iina.nutrition_code];

                iina.friction_code = Request.Form.Get("select_friction_code");
                if (iina.friction_code != null) iina.friction_desc = Iina.FRICTION_CODE[iina.friction_code];

                iina.total_score = txt_total_score.Value;
                iina.preven_action = txt_preven_action.Value;
                //11
                iina.bathing_code = GetRadioButton("rad_bathing_code_", Iina.BATHING_CODE);
                if (iina.bathing_code != null) iina.bathing_desc = Iina.BATHING_CODE[iina.bathing_code];

                iina.oral_care_code = GetRadioButton("rad_oral_care_code_", Iina.ORAL_CARE_CODE);
                if (iina.oral_care_code != null) iina.oral_care_desc = Iina.ORAL_CARE_CODE[iina.oral_care_code];

                iina.dentures_code = GetRadioButton("rad_dentures_code_", Iina.DENTURES_CODE);
                if (iina.dentures_code != null) iina.dentures_desc = Iina.DENTURES_CODE[iina.dentures_code];


                iina.toilet_use_code = GetRadioButton("rad_toilet_use_code_", Iina.TOILET_USE_CODE);
                if (iina.toilet_use_code != null) iina.toilet_use_desc = Iina.TOILET_USE_CODE[iina.toilet_use_code];

                iina.dressing_code = GetRadioButton("rad_dressing_code_", Iina.DRESSING_CODE);
                if (iina.dressing_code != null) iina.dressing_desc = Iina.DRESSING_CODE[iina.dressing_code];

                iina.eating_code = GetRadioButton("rad_eating_code_", Iina.EATING_CODE);
                if (iina.eating_code != null) iina.eating_desc = Iina.EATING_CODE[iina.eating_code];

                iina.turning_bed_code = GetRadioButton("rad_turning_bed_code_", Iina.TURNING_BED_CODE);
                if (iina.turning_bed_code != null) iina.turning_bed_desc = Iina.TURNING_BED_CODE[iina.turning_bed_code];

                iina.ambulation_code = GetRadioButton("rad_ambulation_code_", Iina.AMBULATION_CODE);
                if (iina.ambulation_code != null) iina.ambulation_desc = Iina.AMBULATION_CODE[iina.ambulation_code];

                iina.sleep_code = GetRadioButton("rad_sleep_code_", Iina.SLEEP_CODE);
                if (iina.sleep_code != null) iina.sleep_desc = Iina.SLEEP_CODE[iina.sleep_code];


                iina.medication_used = txt_medication_used.Value;
                //12
                iina.fall_history_code = GetRadioButton("rad_fall_history_code_", Iina.FALL_HISTORY_CODE);
                if (iina.fall_history_code != null) iina.fall_history_desc = Iina.FALL_HISTORY_CODE[iina.fall_history_code];

                iina.secon_diagnosis_code = GetRadioButton("rad_secon_diagnosis_code_", Iina.SECON_DIAGNOSIS_CODE);
                if (iina.secon_diagnosis_code != null) iina.secon_diagnosis_desc = Iina.SECON_DIAGNOSIS_CODE[iina.secon_diagnosis_code];

                iina.ambula_aids_code = GetRadioButton("rad_ambula_aids_code_", Iina.AMBULA_AIDS_CODE);
                if (iina.ambula_aids_code != null) iina.ambula_aids_desc = Iina.AMBULA_AIDS_CODE[iina.ambula_aids_code];

                iina.intra_therapy_code = GetRadioButton("rad_intra_therapy_code_", Iina.INTRA_THERAPY_CODE);
                if (iina.intra_therapy_code != null) iina.intra_therapy_desc = Iina.INTRA_THERAPY_CODE[iina.intra_therapy_code];

                iina.gait_trans_code = GetRadioButton("rad_gait_trans_code_", Iina.GAIT_TRANS_CODE);
                if (iina.gait_trans_code != null) iina.gait_trans_desc = Iina.GAIT_TRANS_CODE[iina.gait_trans_code];

                iina.fr_mental_status_code = GetRadioButton("rad_fr_mental_status_code_", Iina.FR_MENTAL_STATUS_CODE);
                if (iina.fr_mental_status_code != null) iina.fr_mental_status_desc = Iina.FR_MENTAL_STATUS_CODE[iina.fr_mental_status_code];

                iina.fr_total_score = txt_fr_total_score.Value;
                //D
                iina.involvement = GetRadioButton("rad_involvement_");
                iina.req_med_equipment = GetRadioButton("rad_req_med_equipment_");
                iina.req_foll_care = GetRadioButton("rad_req_foll_care_");
                iina.suicidal_referral = GetRadioButton("rad_suicidal_referral_");
                iina.alone_reduce_functional = GetRadioButton("rad_alone_reduce_functional_");
                iina.ref_physiotherapist = GetRadioButton("rad_ref_physiotherapist_");
                iina.ref_speech_therapist = GetRadioButton("rad_ref_speech_therapist_");
                iina.ref_dietician = GetRadioButton("rad_ref_dietician_");
                iina.ref_psychologist = GetRadioButton("rad_ref_psychologist_");
                iina.ref_other_hospital = GetRadioButton("rad_other_hospital_");
                iina.support_at_home = GetRadioButton("rad_support_at_home_");
                iina.req_transportation = GetRadioButton("rad_req_transportation_");
                iina.stairs_climb_home = GetRadioButton("rad_stairs_climb_home_");
                iina.dis_planning = txt_dis_planning.Value;
                iina.dis_management = txt_dis_management.Value;
                iina.assess_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assess_date_time.SelectedDate);

                return iina.Update()[0];
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        private dynamic GetCheckBox(string id)
        {
            bool flag = false;
            if ((HtmlInputCheckBox)FindControl(id + "True") != null)
            {
                if (((HtmlInputCheckBox)FindControl(id + "True")).Checked)
                {
                    flag = true;
                }
            }
            else if ((HtmlInputCheckBox)FindControl(id + "False") != null)
            {
                if (((HtmlInputCheckBox)FindControl(id + "False")).Checked)
                {
                    flag = false;
                }
            }
            else { return null; }

            return flag;
        }

        private dynamic GetCheckBox(string checkbox, Dictionary<string, string> value)
        {
            DataTable table = new DataTable();
            table.Columns.Add("code");
            table.Columns.Add("desc");

            foreach (KeyValuePair<string, string> code in value)
            {
                try
                {
                    if (((HtmlInputCheckBox)FindControl(checkbox + code.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();

                        dtRow = table.NewRow();
                        dtRow["code"] = code.Key;
                        dtRow["desc"] = code.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex) { }
            }
            return JsonConvert.SerializeObject(table);
        }

        private dynamic GetRadioButton(string radio_name)
        {
            if (((HtmlInputRadioButton)FindControl(radio_name + "True")).Checked)
            {
                return true;
            }else if(((HtmlInputRadioButton)FindControl(radio_name + "False")).Checked)
            {
                return false;
            }
            else { return null; }
        }

        private string GetRadioButton(string radio_name, Dictionary<string, string> value)
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

        private void GetRadioButton(string radio_name, Dictionary<int, string> value)
        {
            foreach (KeyValuePair<int, string> code in value)
            {
                try
                {
                    if (((HtmlInputRadioButton)FindControl(radio_name + code.Key)).Checked)
                    {

                    }
                }
                catch (Exception ex) { }
            }
        }

        private void checkValidField(List<string> errors)
        {
            
        }
    }
}
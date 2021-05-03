using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class EmergencyTriageAndNursingAssessmentRecord : System.Web.UI.Page
    {
        Ena ena;

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

            ena = new Ena(DataHelpers.varDocId);

            loadDataToControls(ena);
        }

        private void Btn_Click(object sender, EventArgs e)
        {

        }

        public void loadDataToControls(Ena ena)
        {
            //Triage Date Time
            if(ena.triage_time != null)
            {
                dpk_triage_time.SelectedDate = DateTime.Parse(ena.triage_time);
                tpk_triage_time.SelectedTime = TimeSpan.Parse(DateTime.Parse(ena.triage_time).ToString("HH:mm:ss"));
            }

            //Triage Area #
            txt_triage_area.Value = ena.triage_area;

            //Chief complaint
            txt_chief_complaint.Value = ena.chief_complaint;

            //
            if (ena.triage_code != null)
            {
                switch (int.Parse(ena.triage_code))
                {
                    case 1:
                        rad_triage_code1.Checked = true;
                        break;
                    case 2:
                        rad_triage_code2.Checked = true;
                        break;
                    case 3:
                        rad_triage_code3.Checked = true;
                        break;
                    case 4:
                        rad_triage_code4.Checked = true;
                        break;
                }
            }

            #region Mode of arrival
            ((HtmlInputRadioButton)FindControl("rad_arrival_mode_code_" + ena.arrival_mode_code)).Checked = true;
            #endregion

            ////Past Medical History
            txt_past_medical_history.Value = ena.past_medical_history;

            ////Narrative
            txt_narrative.Value = ena.narrative;

            ////Vital signs
            txt_vs_temperature.Value = ena.vs_temperature;
            txt_vs_heart_rate.Value = ena.vs_heart_rate;
            txt_vs_weight.Value = ena.vs_weight;
            txt_vs_respiratory_rate.Value = ena.vs_respiratory_rate;
            txt_vs_height.Value = ena.vs_height;
            txt_vs_blood_pressure.Value = ena.vs_blood_pressure;
            txt_vs_bmi.Value = ena.vs_bmi;
            txt_vs_spo2.Value = ena.vs_spo2;
            txt_vs_head_circum.Value = ena.vs_head_circum;

            //
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.loc_avpu).Rows)
            {
                   ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_loc_avpu_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }

            //Pain assess
            txt_pain_onset.Value = ena.pain_onset;
            txt_pain_location.Value = ena.pain_location;
            txt_pain_duration.Value = ena.pain_duration;
            txt_pain_radiation.Value = ena.pain_radiation;
            txt_pain_score.Value = ena.pain_score;

            //allergy
            txt_allergy.Value = ena.allergy;

            //medications used
            txt_current_medication.Value = ena.current_medication;

            //
            #region skin integrity
            foreach(DataRow row in WebHelpers.GetJSONToDataTable(ena.skin_integrity).Rows)
            {
                ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_skin_integrity_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }
            #endregion

            #region Communicable disease screening 
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.com_dis_src).Rows)
            {
                ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_com_dis_src_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }
            #endregion

            #region discharge plainning
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.discharge_plan).Rows)
            {
                ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_discharge_plan_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }
            #endregion

            #region General appearance
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.general_appearance).Rows)
            {
                ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_general_appearance_" + row.Field<dynamic>("cde").ToLower())).Checked = true;
            }
            #endregion

            txt_eye.Value = ena.eye;
            txt_voice.Value = ena.voice;
            txt_motion.Value = ena.motion;

            //
            cb_alert.Checked = bool.Parse(ena.alert);
            cb_coma.Checked = bool.Parse(ena.coma);
            cb_others.Checked = bool.Parse(ena.others);
            txt_str_others.Value = ena.str_others;

            #region respiratory
            foreach (DataRow row in WebHelpers.GetJSONToDataTable(ena.respiratory).Rows)
            {
                ((System.Web.UI.HtmlControls.HtmlInputCheckBox)FindControl("cb_respiratory_" + row.Field<dynamic>("code").ToLower())).Checked = true;
            }
            #endregion

            #region rhythm
            cb_rhythm_regular.Checked = bool.Parse(ena.rhythm_regular);
            cb_rhythm_inregular.Checked = bool.Parse(ena.rhythm_inregular);
            cb_rhythm_others.Checked = bool.Parse(ena.rhythm_others);
            txt_rhythm_str_others.Value = ena.rhythm_str_others;
            #endregion

            #region  psychosocial
            cb_psychosocial.Checked = bool.Parse(ena.psychosocial);
            cb_psychosocial_others.Checked = bool.Parse(ena.psychosocial_others);
            txt_psychosocial_str_others.Value = ena.psychosocial_str_others;
            #endregion

            #region lmp
            cb_lmp.Checked = bool.Parse(ena.lmp);
            txt_lmP_note.Value = ena.lmP_note;
            txt_para.Value = ena.para;
            txt_abortions.Value = ena.abortions;
            #endregion

            #region Intervention Procedure

            if(ena.blood_glucose_date_time != null)
            {
                dpk_blood_glucose_date_time.SelectedDate = DateTime.Parse(ena.blood_glucose_date_time);
                tpk_blood_glucose_date_time.SelectedTime = TimeSpan.Parse(DateTime.Parse(ena.blood_glucose_date_time).ToString("HH:mm:ss"));
            }
            txt_blood_glucose_note.Value = ena.blood_glucose_note;

            if(ena.ecg_date_time != null)
            {
                dpk_ecg_date_time.SelectedDate = DateTime.Parse(ena.ecg_date_time);
                tpk_ecg_date_time.SelectedTime = TimeSpan.Parse(DateTime.Parse(ena.ecg_date_time).ToString("HH:mm:ss"));
            }
            txt_ecg_note.Value = ena.ecg_note;

            if(ena.urine_cath_date_time != null)
            {
                dpk_urine_cath_date_time.SelectedDate = DateTime.Parse(ena.urine_cath_date_time);
                tpk_urine_cath_date_time.SelectedTime = TimeSpan.Parse(DateTime.Parse(ena.urine_cath_date_time).ToString("HH:mm:ss"));
            }
            txt_urine_cath_note.Value = ena.urine_cath_note;

            if (ena.splint_cast_dressing_date_time != null)
            {
                dpk_splint_cast_dressing_date_time.SelectedDate = DateTime.Parse(ena.splint_cast_dressing_date_time);
                tpk_splint_cast_dressing_date_time.SelectedTime = TimeSpan.Parse(DateTime.Parse(ena.splint_cast_dressing_date_time).ToString("HH:mm:ss"));
            }
            txt_splint_cast_dressing_note.Value = ena.splint_cast_dressing_note;

            if (ena.procedure_other_date_time != null)
            {
                dpk_procedure_other_date_time.SelectedDate = DateTime.Parse(ena.procedure_other_date_time);
                tpk_procedure_other_date_time.SelectedTime = TimeSpan.Parse(DateTime.Parse(ena.procedure_other_date_time).ToString("HH:mm:ss"));
            }
            txt_procedure_other_note.Value = ena.procedure_other_note;

            #endregion

            #region assessment_system

            ViewState["AssessmentSystem"] = WebHelpers.GetJSONToDataTable(ena.assessment_system);
            _BindAssessmentSystem();

            #endregion

            //Disposition after discharge
            if (ena.dis_after_discharge_code == "H")
            {
                rad_cde_after_discharge1.Checked = true;
            }
            else if (ena.dis_after_discharge_code == "O")
            {
                rad_cde_after_discharge2.Checked = true;
            }

            //People will look after patient after discharge
            txt_caregiver_after_discharge.Value = ena.caregiver_after_discharge;

            //Language Barriers:
            txt_btc_language_note.Value = ena.btc_language_note;
            if (bool.Parse(ena.btc_language))
            {
                rad_btc_language2.Checked = true;
            }
            else { rad_btc_language1.Checked = true; }

            //Cognitive Barriers
            txt_btc_cognitive_note.Value = ena.btc_cognitive_note;
            if (bool.Parse(ena.btc_cognitive))
            {
                rad_btc_cognitive2.Checked = true;
            }
            else { rad_btc_cognitive1.Checked = true; }

            //Sensory Barriers
            txt_btc_sensory_note.Value = ena.btc_sensory_note;
            if (bool.Parse(ena.btc_cognitive))
            {
                rad_btc_sensory2.Checked = true;
            }
            else { rad_btc_sensory1.Checked = true; }

            //Religious Barriers
            txt_btc_religious_note.Value = ena.btc_religious_note;
            if (bool.Parse(ena.btc_religious))
            {
                rad_btc_religious2.Checked = true;
            }
            else { rad_btc_religious1.Checked = true; }

            //Cultural Barriers
            txt_btc_cultural_note.Value = ena.btc_cultural_note;
            if (bool.Parse(ena.btc_cultural))
            {
                rad_btc_cultural2.Checked = true;
            }
            else { rad_btc_cultural1.Checked = true; }


            

            //#region Direct Medication &IV fluids Order

            //DataTable direct_medication = WebHelpers.GetJSONToDataTable(ena.direct_medication);

            //for (int i = 0; i < direct_medication.Rows.Count; i++)
            //{
            //    row = new TableRow();

            //    //Time
            //    RadTimePicker radTime = new RadTimePicker();
            //    radTime.SelectedTime = TimeSpan.Parse(direct_medication.Rows[i].Field<dynamic>("dir_med_time"));
            //    radTime.Width = 110;
            //    cell = new TableCell();
            //    cell.Controls.Add(radTime);
            //    row.Cells.Add(cell);

            //    //IV Fluids
            //    TextField dir_medication = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    dir_medication.Value = direct_medication.Rows[i].Field<dynamic>("dir_medication");
            //    cell = new TableCell();
            //    cell.Controls.Add(dir_medication);
            //    row.Cells.Add(cell);

            //    //Dose
            //    TextField dir_med_dose = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    dir_med_dose.Value = direct_medication.Rows[i].Field<dynamic>("dir_med_dose");
            //    cell = new TableCell();
            //    cell.Controls.Add(dir_med_dose);
            //    row.Cells.Add(cell);

            //    //Route
            //    TextField dir_med_route = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    dir_med_route.Value = direct_medication.Rows[i].Field<dynamic>("dir_med_route");
            //    cell = new TableCell();
            //    cell.Controls.Add(dir_med_route);
            //    row.Cells.Add(cell);

            //    //Rate
            //    TextField rate = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    //bp.Value = assessment_system.Rows[i].Field<dynamic>("bp");
            //    cell = new TableCell();
            //    cell.Controls.Add(rate);
            //    row.Cells.Add(cell);

            //    //Doctor
            //    TextField dir_med_doctor = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    dir_med_doctor.Value = direct_medication.Rows[i].Field<dynamic>("dir_med_doctor");
            //    cell = new TableCell();
            //    cell.Controls.Add(dir_med_doctor);
            //    row.Cells.Add(cell);

            //    //Commend
            //    TextField comment = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    //gcs.Value = assessment_system.Rows[i].Field<dynamic>("gcs");
            //    cell = new TableCell();
            //    cell.Controls.Add(comment);
            //    row.Cells.Add(cell);

            //    //Time
            //    TextField dir_med_time2 = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    dir_med_time2.Value = direct_medication.Rows[i].Field<dynamic>("dir_med_time2");
            //    cell = new TableCell();
            //    cell.Controls.Add(dir_med_time2);
            //    row.Cells.Add(cell);

            //    //RN's Initial
            //    TextField dir_med_initial = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    dir_med_initial.Value = direct_medication.Rows[i].Field<dynamic>("dir_med_initial");
            //    cell = new TableCell();
            //    cell.Controls.Add(dir_med_initial);
            //    row.Cells.Add(cell);

            //    Trash trash = (Trash)Page.LoadControl("~/icons/Trash.ascx");
            //    cell = new TableCell();
            //    cell.Controls.Add(trash);
            //    row.Cells.Add(cell);

            //    tb_direct_medication.Rows.Add(row);
            //}

            //row = new TableRow();
            //cell = new TableCell();

            //LinkButton linkButton = new LinkButton();

            ////plusCircle = (PlusCircle)Page.LoadControl("~/icons/PlusCircle.ascx");
            //linkButton.Text = "Add row";
            //linkButton.CssClass = "btn btn-sm btn-outline-primary";
            ////linkButton.Controls.Add(plusCircle);

            //cell.ColumnSpan = 4;
            //cell.Controls.Add(linkButton);
            //row.Cells.Add(cell);
            //tb_direct_medication.Rows.Add(row);

            //#endregion

            ////Discharged
            //if (ena.discharge_date_time != null)
            //{
            //    dpk_discharge_date_time.SelectedDate = DateTime.Parse(ena.discharge_date_time);
            //    //tpk_discharge_date_time.SelectedTime = TimeSpan.Parse(ena.discharge_date_time.ToString("HH:mm:ss"));
            //    txt_discharge_by.Value = ena.discharge_by;
            //}
            ////missing  Home - Against Medical Advice/AMA - Dead

            ////Admited
            //if (ena.admited_date_time != null)
            //{
            //    dpk_admited_date_time.SelectedDate = DateTime.Parse(ena.admited_date_time);
            //    tpk_admited_date_time.SelectedTime = TimeSpan.Parse(ena.admited_date_time.ToString("HH:mm:ss"));
            //    txt_admited_by.Value = ena.admited_by;
            //    txt_receiving_unit.Value = ena.receiving_unit;
            //}

            //// Transfer to
            //txt_transfer_to.Value = ena.transfer_to;
            //txt_transfer_by.Value = ena.transfer_by;

            //// Time notified to Doctor
            //if(ena.noticed_time != null)
            //{
            //    dpk_noticed_time.SelectedDate = DateTime.Parse(ena.noticed_time);
            //    //tpk_noticed_time.SelectedTime = TimeSpan.Parse(ena.noticed_time.ToString("HH:mm:ss"));
            //}

            //#region NURSING NOTES
            //DataTable nursing_note = WebHelpers.GetJSONToDataTable(ena.nursing_note);

            //for (int i = 0; i < nursing_note.Rows.Count; i++)
            //{
            //    row = new TableRow();

            //    RadDatePicker radDate = new RadDatePicker();
            //    RadTimePicker radTime =  new RadTimePicker();
            //    TextField patient_condition = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
            //    TextField signature_name = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");

            //    radDate.SelectedDate = nursing_note.Rows[i].Field<dynamic>("date_time");
            //    radTime.SelectedTime = TimeSpan.Parse(nursing_note.Rows[i].Field<dynamic>("date_time").ToString("HH:mm:ss"));
            //    patient_condition.Value = nursing_note.Rows[i].Field<dynamic>("patient_condition");
            //    signature_name.Value = nursing_note.Rows[i].Field<dynamic>("signature_name");

            //    radDate.Width = 120;
            //    radTime.Width = 110;

            //    cell = new TableCell();
            //    cell.Controls.Add(radDate);
            //    cell.Controls.Add(radTime);
            //    row.Cells.Add(cell);

            //    cell = new TableCell();
            //    cell.Controls.Add(patient_condition);
            //    row.Cells.Add(cell);

            //    cell = new TableCell();
            //    cell.Controls.Add(signature_name);
            //    row.Cells.Add(cell);

            //    Trash trash = (Trash)Page.LoadControl("~/icons/Trash.ascx");
            //    cell = new TableCell();
            //    cell.Controls.Add(trash);
            //    row.Cells.Add(cell);
            //    tb_nursing_note.Rows.Add(row);
            //}

            //row = new TableRow();
            //cell = new TableCell();

            //linkButton = new LinkButton();

            ////plusCircle = (PlusCircle)Page.LoadControl("~/icons/PlusCircle.ascx");
            //linkButton.Text = "Add row";
            //linkButton.CssClass = "btn btn-sm btn-outline-primary";
            ////linkButton.Controls.Add(plusCircle);

            //cell.ColumnSpan = 4;
            //cell.Controls.Add(linkButton);
            //row.Cells.Add(cell);
            //tb_nursing_note.Rows.Add(row);

            //#endregion

            //btnCancel.Visible = false;
            //    //amendReasonBox.Visible = false;
            //    if (ena.status == DocumentStatus.FINAL)
            //    {
            //        btnComplete.Visible = false;
            //        btnSave.Visible = false;
            //        btnDelete.Visible = false;
            //        btnCancel.Visible = false;

            //        btnAmend.Visible = true;
            //        btnPrint.Visible = true;

            //        DisabledControl(true);
            //    }
            //    else if (ena.status == DocumentStatus.DRAFT)
            //    {

            //        btnAmend.Visible = false;
            //        btnPrint.Visible = false;
            //    }

        }

        protected void DisabledControl(bool disabled)
        {
            //txt_chief_complaint.Disabled = disabled;

            //rad_triage_code1.Disabled = disabled;
            //rad_triage_code2.Disabled = disabled;
            //rad_triage_code3.Disabled = disabled;
            //rad_triage_code4.Disabled = disabled;
            //rad_triage_code5.Disabled = disabled;

            //rad_arrival_mode_code1.Disabled = disabled;
            //rad_arrival_mode_code2.Disabled = disabled;
            //rad_arrival_mode_code3.Disabled = disabled;

            //txt_past_medical_history.Disabled = disabled;
            //txt_narrative.Disabled = disabled;

            //txt_vs_temperature.Disabled = disabled;
            //txt_vs_heart_rate.Disabled = disabled;
            //txt_vs_weight.Disabled = disabled;
            //txt_vs_respiratory_rate.Disabled = disabled;
            //txt_vs_height.Disabled = disabled;
            //txt_vs_blood_pressure.Disabled = disabled;
            //txt_vs_bmi.Disabled = disabled;
            //txt_vs_spo2.Disabled = disabled;
            //txt_vs_head_circum.Disabled = disabled;

            ////
            //cb_loc_avpu_a.Disabled = disabled;
            //cb_loc_avpu_v.Disabled = disabled;
            //cb_loc_avpu_p.Disabled = disabled;
            //cb_loc_avpu_u.Disabled = disabled;

            //txt_pain_onset.Disabled = disabled;
            //txt_pain_location.Disabled = disabled;
            //txt_pain_duration.Disabled = disabled;
            //txt_pain_radiation.Disabled = disabled;
            //txt_pain_score.Disabled = disabled;

            //txt_allergy.Disabled = disabled;
            //txt_current_medication.Disabled = disabled;

            ////Skin Integrity
            //cb_cde_l.Disabled = disabled;
            //cb_cde_a.Disabled = disabled;
            //cb_cde_s.Disabled = disabled;
            //cb_cde_b.Disabled = disabled;
            //cb_cde_d.Disabled = disabled;
            //cb_cde_h.Disabled = disabled;

            ////Communicable disease screening
            //cb_com_dis_src_f.Disabled = disabled;
            //cb_com_dis_src_c.Disabled = disabled;
            //cb_com_dis_src_r.Disabled = disabled;
            //cb_com_dis_src_s.Disabled = disabled;
            //cb_com_dis_src_t.Disabled = disabled;

            //// Discharge Planning
            //cb_cde_la.Disabled = disabled;
            //cb_cde_ra.Disabled = disabled;
            //cb_cde_hf.Disabled = disabled;

            //// Disposition after discharge
            //rad_cde_after_discharge1.Disabled = disabled;
            //rad_cde_after_discharge2.Disabled = disabled;

            //// People who will look after patient after discharge
            //txt_caregiver_after_discharge.Disabled = disabled;

            ////
            //rad_btc_language1.Disabled = disabled;
            //rad_btc_language2.Disabled = disabled;
            //txt_btc_language_note.Disabled = disabled;

            ////
            //rad_btc_cognitive1.Disabled = disabled;
            //rad_btc_cognitive2.Disabled = disabled;
            //txt_btc_cognitive_note.Disabled = disabled;

            ////
            //rad_btc_sensory1.Disabled = disabled;
            //rad_btc_sensory2.Disabled = disabled;
            //txt_btc_sensory_note.Disabled = disabled;

            ////
            //rad_btc_religious1.Disabled = disabled;
            //rad_btc_religious2.Disabled = disabled;
            //txt_btc_religious_note.Disabled = disabled;

            ////
            //rad_btc_cultural1.Disabled = disabled;
            //rad_btc_cultural2.Disabled = disabled;
            //txt_btc_cultural_note.Disabled = disabled;

            ////
            //cb_cde_p.Disabled = disabled;
            //cb_cde_c.Disabled = disabled;
            //cb_cde_t.Disabled = disabled;

            ////
            //txt_eye.Disabled = disabled;
            //txt_voice.Disabled = disabled;
            //txt_motion.Disabled = disabled;

            ////
            //cb_alert.Disabled = disabled;
            //cb_coma.Disabled = disabled;
            //cb_others.Disabled = disabled;
            //txt_str_others.Disabled = disabled;

            ////missing

            //// Respiratory
            //cb_respiratory_reg.Disabled = disabled;
            //cb_respiratory_nre.Disabled = disabled;
            //cb_respiratory_tac.Disabled = disabled;
            //cb_respiratory_sha.Disabled = disabled;
            //cb_respiratory_lab.Disabled = disabled;

            ////missing
            //cb_respiratory_cou.Disabled = disabled;
            //cb_respiratory_spu.Disabled = disabled;
            ////missing

            ////Rhythm
            //cb_rhythm_regular.Disabled = disabled;
            //cb_rhythm_inregular.Disabled = disabled;
            //cb_rhythm_others.Disabled = disabled;
            //txt_rhythm_str_others.Disabled = disabled;

            ////Psychosocial
            //cb_psychosocial.Disabled = disabled;
            //cb_psychosocial_others.Disabled = disabled;
            //txt_psychosocial_str_others.Disabled = disabled;

            ////Other systems
            //cb_other_systems_normal.Disabled = disabled;
            //cb_other_systems_abnormal.Disabled = disabled;
            //txt_others_systems_str.Disabled = disabled;

            ////
            //cb_lmp.Disabled = disabled;
            //txt_lmP_note.Disabled = disabled;
            //txt_para.Disabled = disabled;
            //txt_abortions.Disabled = disabled;

            //Direct Medication & IV fluids Order
            


        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                ena = new Ena(DataHelpers.varDocId);

                ena.user_name = (string)Session["UserID"];
                ena.status = DocumentStatus.DRAFT;

                if (dpk_triage_time.SelectedDate != null && tpk_triage_time.SelectedTime != null)
                {
                    string date = DateTime.Parse(dpk_triage_time.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(tpk_triage_time.SelectedTime.ToString()).ToString("HH:mm:ss");

                    ena.admited_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }

                ena.triage_area = txt_triage_area.Value;

                ena.chief_complaint = txt_chief_complaint.Value;

                if (rad_triage_code1.Checked)
                {
                    ena.triage_code = "1";
                }
                else if (rad_triage_code2.Checked)
                {
                    ena.triage_code = "2";
                }
                else if (rad_triage_code3.Checked)
                {
                    ena.triage_code = "3";
                }
                else if (rad_triage_code4.Checked)
                {
                    ena.triage_code = "4";
                }

                if (rad_arrival_mode_code_WAL.Checked)
                {
                    ena.arrival_mode_code = "WAL";
                }
                else if (rad_arrival_mode_code_WHE.Checked)
                {
                    ena.arrival_mode_code = "WHE";
                }
                else if (rad_arrival_mode_code_AMB.Checked)
                {
                    ena.arrival_mode_code = "AMB";
                }

                //
                ////Past Medical History
                ena.past_medical_history = txt_past_medical_history.Value;

                ////Narrative
                ena.narrative = txt_narrative.Value;

                ////Vital signs
                ena.vs_temperature = txt_vs_temperature.Value;
                ena.vs_heart_rate = txt_vs_heart_rate.Value;
                ena.vs_weight = txt_vs_weight.Value;
                ena.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                ena.vs_height = txt_vs_height.Value;
                ena.vs_blood_pressure = txt_vs_blood_pressure.Value;
                ena.vs_bmi = txt_vs_bmi.Value;
                ena.vs_spo2 = txt_vs_spo2.Value;
                ena.vs_head_circum = txt_vs_head_circum.Value;

                #region loc avpu
                DataTable loc_avpu = new DataTable();
                loc_avpu.Columns.Add("cde");
                loc_avpu.Columns.Add("desc");
                DataRow dataRow;

                if (cb_loc_avpu_a.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.A.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.A.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                if (cb_loc_avpu_p.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.P.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.P.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                if (cb_loc_avpu_p.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.U.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.U.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                if (cb_loc_avpu_p.Checked)
                {
                    dataRow = loc_avpu.NewRow();
                    dataRow["cde"] = DocumentCode.LocAVPU.V.code;
                    dataRow["desc"] = DocumentCode.LocAVPU.V.desc;
                    loc_avpu.Rows.Add(dataRow);
                }
                ena.loc_avpu = WebHelpers.GetDataTableToJSON(loc_avpu);
                #endregion

                #region Pain assess
                ena.pain_onset = txt_pain_onset.Value;
                ena.pain_location = txt_pain_location.Value;
                ena.pain_duration = txt_pain_duration.Value;
                ena.pain_radiation = txt_pain_radiation.Value;
                ena.pain_score = txt_pain_score.Value;
                #endregion

                #region skin integrity

                DataTable skin_integrity = new DataTable();
                skin_integrity.Columns.Add("cde");
                skin_integrity.Columns.Add("desc");
                DataRow skin_integrity_row;

                if (cb_skin_integrity_a.Checked)
                {
                    skin_integrity_row = skin_integrity.NewRow();
                    skin_integrity_row["cde"] = "A";
                    skin_integrity_row["desc"] = "Trầy xước/Abrasion (A)";
                    skin_integrity.Rows.Add(skin_integrity_row);
                }

                if (cb_skin_integrity_b.Checked)
                {
                    skin_integrity_row = skin_integrity.NewRow();
                    skin_integrity_row["cde"] = "B";
                    skin_integrity_row["desc"] = "Bỏng/Burn (B)";
                    skin_integrity.Rows.Add(skin_integrity_row);
                }

                if (cb_skin_integrity_b.Checked)
                {
                    skin_integrity_row = skin_integrity.NewRow();
                    skin_integrity_row["cde"] = "D";
                    skin_integrity_row["desc"] = "Biến dạng/Deformity (D)";
                    skin_integrity.Rows.Add(skin_integrity_row);
                }

                if (cb_skin_integrity_h.Checked)
                {
                    skin_integrity_row = skin_integrity.NewRow();
                    skin_integrity_row["cde"] = "D";
                    skin_integrity_row["desc"] = "Loét/ Ulceration (U)";
                    skin_integrity.Rows.Add(skin_integrity_row);
                }

                if (cb_skin_integrity_l.Checked)
                {
                    skin_integrity_row = skin_integrity.NewRow();
                    skin_integrity_row["cde"] = "D";
                    skin_integrity_row["desc"] = "Rách da/Laceration (L)";
                    skin_integrity.Rows.Add(skin_integrity_row);
                }

                if (cb_skin_integrity_s.Checked)
                {
                    skin_integrity_row = skin_integrity.NewRow();
                    skin_integrity_row["cde"] = "D";
                    skin_integrity_row["desc"] = "Bong gân Sprain/ Căng cơ Strain (S)";
                    skin_integrity.Rows.Add(skin_integrity_row);
                }

                #endregion

                #region Communicable disease screening
                DataTable com_dis_src = new DataTable();
                com_dis_src.Columns.Add("cde");
                com_dis_src.Columns.Add("desc");
                DataRow com_dis_src_row;

                if (cb_com_dis_src_f.Checked)
                {
                    com_dis_src_row = com_dis_src.NewRow();
                    com_dis_src_row["cde"] = DocumentCode.ComDisSrc.F.code;
                    com_dis_src_row["desc"] = DocumentCode.ComDisSrc.F.desc;
                    com_dis_src.Rows.Add(com_dis_src);
                }
                if (cb_com_dis_src_r.Checked)
                {
                    com_dis_src_row = com_dis_src.NewRow();
                    com_dis_src_row["cde"] = DocumentCode.ComDisSrc.R.code;
                    com_dis_src_row["desc"] = DocumentCode.ComDisSrc.R.desc;
                    com_dis_src.Rows.Add(com_dis_src);
                }
                if (cb_com_dis_src_t.Checked)
                {
                    com_dis_src_row = com_dis_src.NewRow();
                    com_dis_src_row["cde"] = DocumentCode.ComDisSrc.T.code;
                    com_dis_src_row["desc"] = DocumentCode.ComDisSrc.T.desc;
                    com_dis_src.Rows.Add(com_dis_src);
                }
                if (cb_com_dis_src_s.Checked)
                {
                    com_dis_src_row = com_dis_src.NewRow();
                    com_dis_src_row["cde"] = DocumentCode.ComDisSrc.S.code;
                    com_dis_src_row["desc"] = DocumentCode.ComDisSrc.S.desc;
                    com_dis_src.Rows.Add(com_dis_src);
                }
                if (cb_com_dis_src_c.Checked)
                {
                    com_dis_src_row = com_dis_src.NewRow();
                    com_dis_src_row["cde"] = DocumentCode.ComDisSrc.C.code;
                    com_dis_src_row["desc"] = DocumentCode.ComDisSrc.C.desc;
                    com_dis_src.Rows.Add(com_dis_src);
                }
                #endregion

                #region Discharge Planning
                DataTable discharge_plan = new DataTable();
                discharge_plan.Columns.Add("cde");
                discharge_plan.Columns.Add("desc");
                DataRow discharge_plan_row;

                if (cb_discharge_plan_hf.Checked)
                {
                    discharge_plan_row = discharge_plan.NewRow();
                    discharge_plan_row["cde"] = DocumentCode.DischargePlan.HF.code;
                    discharge_plan_row["desc"] = DocumentCode.DischargePlan.HF.desc;
                    discharge_plan.Rows.Add(discharge_plan_row);
                }

                if (cb_discharge_plan_ra.Checked)
                {
                    discharge_plan_row = discharge_plan.NewRow();
                    discharge_plan_row["cde"] = DocumentCode.DischargePlan.RA.code;
                    discharge_plan_row["desc"] = DocumentCode.DischargePlan.RA.desc;
                    discharge_plan.Rows.Add(discharge_plan_row);
                }

                if (cb_discharge_plan_la.Checked)
                {
                    discharge_plan_row = discharge_plan.NewRow();
                    discharge_plan_row["cde"] = DocumentCode.DischargePlan.LA.code;
                    discharge_plan_row["desc"] = DocumentCode.DischargePlan.LA.desc;
                    discharge_plan.Rows.Add(discharge_plan_row);
                }

                #endregion

                #region General Appearance
                DataTable general_appearance = new DataTable();
                general_appearance.Columns.Add("cde");
                general_appearance.Columns.Add("desc");
                DataRow general_appearance_row;

                if (cb_general_appearance_p.Checked)
                {
                    general_appearance_row = general_appearance.NewRow();
                    general_appearance_row["cde"] = DocumentCode.GeneralAppearance.P.code;
                    general_appearance_row["desc"] = DocumentCode.GeneralAppearance.P.desc;
                    general_appearance.Rows.Add(general_appearance_row);
                }

                if (cb_general_appearance_t.Checked)
                {
                    general_appearance_row = general_appearance.NewRow();
                    general_appearance_row["cde"] = DocumentCode.GeneralAppearance.T.code;
                    general_appearance_row["desc"] = DocumentCode.GeneralAppearance.T.desc;
                    general_appearance.Rows.Add(general_appearance_row);
                }

                if (cb_general_appearance_c.Checked)
                {
                    general_appearance_row = general_appearance.NewRow();
                    general_appearance_row["cde"] = DocumentCode.GeneralAppearance.C.code;
                    general_appearance_row["desc"] = DocumentCode.GeneralAppearance.C.desc;
                    general_appearance.Rows.Add(general_appearance_row);
                }

                #endregion

                ena.alert = cb_alert.Checked;
                ena.coma = cb_coma.Checked;
                ena.others = cb_others.Checked;
                ena.str_others = txt_str_others.Value;

                #region respiratory
                DataTable respiratory = new DataTable();
                respiratory.Columns.Add("code");
                respiratory.Columns.Add("desc");
                DataRow respiratory_row;

                if (cb_respiratory_reg.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.REG.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.REG.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                if (cb_respiratory_nre.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.NRE.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.NRE.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                if (cb_respiratory_tac.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.TAC.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.TAC.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                if (cb_respiratory_spu.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.SPU.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.SPU.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                if (cb_respiratory_cou.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.COU.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.COU.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                if (cb_respiratory_sha.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.SHA.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.SHA.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                if (cb_respiratory_ret.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.RET.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.RET.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                if (cb_respiratory_oth.Checked)
                {
                    respiratory_row = respiratory.NewRow();
                    respiratory_row["code"] = DocumentCode.Respiratory.LAB.code;
                    respiratory_row["desc"] = DocumentCode.Respiratory.LAB.desc;
                    respiratory.Rows.Add(respiratory_row);
                }
                #endregion

                #region rhythm
                ena.rhythm_regular = cb_rhythm_regular.Checked;
                ena.rhythm_inregular = cb_rhythm_inregular.Checked;
                ena.rhythm_others = cb_rhythm_others.Checked;
                ena.rhythm_str_others = txt_rhythm_str_others.Value;
                #endregion

                #region psychosocial
                ena.psychosocial = cb_psychosocial.Checked;
                ena.psychosocial_others = cb_psychosocial_others.Checked;
                ena.psychosocial_str_others = txt_psychosocial_str_others.Value;
                #endregion

                #region lmp
                ena.lmp = cb_lmp.Checked;
                ena.lmP_note = txt_lmP_note.Value;
                ena.para = txt_para.Value;
                ena.abortions = txt_abortions.Value;
                #endregion

                #region Intervention Procedure
                if (dpk_blood_glucose_date_time.SelectedDate != null && tpk_blood_glucose_date_time.SelectedTime != null)
                {
                    string date = DateTime.Parse(dpk_blood_glucose_date_time.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(tpk_blood_glucose_date_time.SelectedTime.ToString()).ToString("HH:mm:ss");
                    ena.blood_glucose_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }
                ena.blood_glucose_note = txt_blood_glucose_note.Value;

                if (dpk_ecg_date_time.SelectedDate != null && tpk_ecg_date_time.SelectedTime != null)
                {
                    string date = DateTime.Parse(dpk_ecg_date_time.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(tpk_ecg_date_time.SelectedTime.ToString()).ToString("HH:mm:ss");
                    ena.ecg_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }
                ena.ecg_note = txt_ecg_note.Value;

                if (dpk_urine_cath_date_time.SelectedDate != null && tpk_urine_cath_date_time.SelectedTime != null)
                {
                    string date = DateTime.Parse(dpk_urine_cath_date_time.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(tpk_urine_cath_date_time.SelectedTime.ToString()).ToString("HH:mm:ss");

                    ena.urine_cath_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }
                ena.urine_cath_note = txt_urine_cath_note.Value;

                if (dpk_splint_cast_dressing_date_time.SelectedDate != null && tpk_splint_cast_dressing_date_time.SelectedTime != null)
                {
                    string date = DateTime.Parse(dpk_splint_cast_dressing_date_time.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(tpk_splint_cast_dressing_date_time.SelectedTime.ToString()).ToString("HH:mm:ss");

                    ena.splint_cast_dressing_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }
                ena.splint_cast_dressing_note = txt_splint_cast_dressing_note.Value;

                if (dpk_procedure_other_date_time.SelectedDate != null && tpk_procedure_other_date_time.SelectedTime != null)
                {
                    string date = DateTime.Parse(dpk_procedure_other_date_time.SelectedDate.ToString()).ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(tpk_triage_time.SelectedTime.ToString()).ToString("HH:mm:ss");

                    ena.procedure_other_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Parse(date + " " + time));
                }
                ena.procedure_other_note = txt_procedure_other_note.Value;

                #endregion

            }
            catch (Exception ex)
            {

            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
        }

        protected void btnAssessmentSystemAddRow_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)ViewState["AssessmentSystem"];
                DataRow dtRow = table.NewRow();
                
                //for(int r = 0; r < gridAssessmentSystem.Rows.Count; r++)
                //{
                //    for (int i = 0; i < gridAssessmentSystem.Rows[r].Cells.Count; i++)
                //    {
                //        try
                //        {
                //            TextField text2 = gridAssessmentSystem.Rows[r].Cells[i].Controls[1] as TextField;
                //            //dtRow[text2.DataKey] = text2.Value;

                //            table.Rows[r][text2.DataKey] = text2.Value;
                //        }
                //        catch { }
                //    }
                //}

                dtRow = table.NewRow();
                table.Rows.Add(dtRow);

                ViewState["AssessmentSystem"] = table;

                _BindAssessmentSystem();

            }
            catch
            {

            }
        }

        private void _BindAssessmentSystem()
        {
            try
            {
                gridAssessmentSystem.DataSource = (DataTable)ViewState["AssessmentSystem"];
                gridAssessmentSystem.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                //string servicename = ((TextBox)gridAssessmentSystem.FooterRow.FindControl("txtService")).Text;
                //string filePath = ((FileUpload)gridAssessmentSystem.FooterRow.FindControl("fuService")).FileName;
                //bOService.Service_name = servicename;
                //bOService.Service_image = "../images/service/" + filePath;
                //if (File.Exists(Server.MapPath("~/images/service/" + filePath)))
                //{
                //}
                //else
                //{
                //    ((FileUpload)gridService.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
                //}
                //((FileUpload)gridAssessmentSystem.FooterRow.FindControl("fuService")).SaveAs(Server.MapPath("~/images/service/" + filePath));
                //dALService.SetService(bOService);
                _BindAssessmentSystem();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gridService_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //try
            //{
            //    gridService.EditIndex = e.NewEditIndex;
            _BindAssessmentSystem();
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
        }

        protected void gridService_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                //string servicename = ((TextBox)gridAssessmentSystem.Rows[e.RowIndex].FindControl("txtService")).Text;
                //string filePath = ((FileUpload)gridAssessmentSystem.Rows[e.RowIndex].FindControl("fuService")).FileName;

                _BindAssessmentSystem();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
        }

        protected void gridAssessmentSystem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["AssessmentSystem"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["AssessmentSystem"] = dt;
            _BindAssessmentSystem();
        }

        protected void gridAssessmentSystem_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void gridAssessmentSystem_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Retrieve the table from the session object.
            //DataTable dt = (DataTable)ViewState["AssessmentSystem"];

            ////Update the values.
            //GridViewRow row = gridAssessmentSystem.Rows[e.RowIndex];
            //dt.Rows[row.DataItemIndex]["Id"] = ((TextBox)(row.Cells[1].Controls[0])).Text;
            //dt.Rows[row.DataItemIndex]["Description"] = ((TextBox)(row.Cells[2].Controls[0])).Text;
            //dt.Rows[row.DataItemIndex]["IsComplete"] = ((CheckBox)(row.Cells[3].Controls[0])).Checked;

            ////Reset the edit index.
            //gridAssessmentSystem.EditIndex = -1;
        }
    }
}
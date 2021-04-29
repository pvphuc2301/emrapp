using System;
using System.Data;
using System.Web.UI;
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

        public void loadDataToControls(Ena ena)
        {
            //Triage Date Time

            //Triage Area #

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
            //Mode of arrival
            if (ena.arrival_mode_code == "WAL")
            {
                rad_arrival_mode_code1.Checked = true;
            }
            else if (ena.arrival_mode_code == "WHE")
            {
                rad_arrival_mode_code2.Checked = true;
            }
            else if (ena.arrival_mode_code == "AMB")
            {
                rad_arrival_mode_code3.Checked = true;
            }

            //Past Medical History
            txt_past_medical_history.Value = ena.past_medical_history;

            //Vital signs
            txt_vs_temperature.Value = ena.vs_temperature;
            txt_vs_heart_rate.Value = ena.vs_heart_rate;
            txt_vs_weight.Value = ena.vs_weight;
            txt_vs_respiratory_rate.Value = ena.vs_respiratory_rate;
            txt_vs_height.Value = ena.vs_height;
            txt_vs_blood_pressure.Value = ena.vs_blood_pressure;
            txt_vs_bmi.Value = ena.vs_bmi;
            txt_vs_spo2.Value = ena.vs_spo2;
            txt_vs_head_circum.Value = ena.vs_head_circum;

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

            //skin integrity

            #region Communicable disease screening 
            DataTable comDisSrc = WebHelpers.GetJSONToDataTable(ena.discharge_plan);
            for (int i = 0; i < comDisSrc.Rows.Count; i++)
            {
                string cde = comDisSrc.Rows[i].Field<dynamic>("cde");
                if (cde == "F")
                {
                    cb_com_dis_src_f.Checked = true;
                }
                else if (cde == "T")
                {
                    cb_com_dis_src_t.Checked = true;
                }
                else if (cde == "R")
                {
                    cb_com_dis_src_r.Checked = true;
                }
                else if (cde == "C")
                {
                    cb_com_dis_src_c.Checked = true;
                }
                else if (cde == "S")
                {
                    cb_com_dis_src_s.Checked = true;
                }
            }

            #endregion

            #region discharge plainning

            DataTable dischargePlaining = WebHelpers.GetJSONToDataTable(ena.discharge_plan);
            for (int i = 0; i < dischargePlaining.Rows.Count; i++)
            {
                string cde = dischargePlaining.Rows[i].Field<dynamic>("cde");
                if (cde == DocumentCode.DischargePlan.LA)
                {
                    cb_cde_la.Checked = true;
                }
                else if (cde == DocumentCode.DischargePlan.RA)
                {
                    cb_cde_ra.Checked = true;
                }
                else if (cde == DocumentCode.DischargePlan.HF)
                {
                    cb_cde_hf.Checked = true;
                }
            }

            #endregion

            #region General appearance
            DataTable GeneralAppearance = WebHelpers.GetJSONToDataTable(ena.general_appearance);
            for (int i = 0; i < GeneralAppearance.Rows.Count; i++)
            {
                string cde = GeneralAppearance.Rows[i].Field<dynamic>("cde");
                if (cde == "P")
                {
                    cb_cde_p.Checked = true;
                }
                else if (cde == "C")
                {
                    cb_cde_c.Checked = true;
                }
                else if (cde == "T")
                {
                    cb_cde_t.Checked = true;
                }
            }
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


            //Neuro
            //Glasgow coma scale/ GCS
            txt_eye.Value = ena.eye;
            txt_voice.Value = ena.voice;
            txt_motion.Value = ena.motion;

            //Respiratory
            DataTable Respiratory = WebHelpers.GetJSONToDataTable(ena.respiratory);
            for (int i = 0; i < Respiratory.Rows.Count; i++)
            {
                string cde = Respiratory.Rows[i].Field<dynamic>("code");
                if (cde == "REG")
                {
                    cb_respiratory_reg.Checked = true;
                }
                else if (cde == "NRE")
                {
                    cb_respiratory_nre.Checked = true;
                }
                else if (cde == "TAC")
                {
                    cb_respiratory_tac.Checked = true;
                }
                else if (cde == "TAC")
                {
                    cb_respiratory_tac.Checked = true;
                }
            }



            //

            //Disposition after discharge

            // Skin Integrity

            // Communicable disease screening

            //txt_disposition_after_discharge_code.Value = ena.disposition_after_discharge_code;

            # region Direct Medication & IV fluids Order

            DataTable assessment_system = WebHelpers.GetJSONToDataTable(ena.assessment_system);

            TableRow row;
            TableCell cell;

            for (int i = 0; i < assessment_system.Rows.Count; i++)
            {

                row = new TableRow();

                RadTimePicker radTime = new RadTimePicker();
                
                radTime.SelectedTime = TimeSpan.Parse(assessment_system.Rows[i].Field<dynamic>("time"));
                
                radTime.Width = 110;

                cell = new TableCell();
                cell.Controls.Add(radTime);
                row.Cells.Add(cell);

                //cell = new TableCell();
                //cell.Controls.Add(patient_condition);
                //row.Cells.Add(cell);

                // Time RR (l/p)
                TextField rrlp = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                rrlp.Value = assessment_system.Rows[i].Field<dynamic>("rrlp");
                cell = new TableCell();
                cell.Controls.Add(rrlp);
                row.Cells.Add(cell);

                // O2Sat (%)
                TextField o2sat = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                o2sat.Value = assessment_system.Rows[i].Field<dynamic>("o2sat");
                cell = new TableCell();
                cell.Controls.Add(o2sat);
                row.Cells.Add(cell);

                // HR (bpm)
                TextField hr = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                hr.Value = assessment_system.Rows[i].Field<dynamic>("hr");
                cell = new TableCell();
                cell.Controls.Add(hr);
                row.Cells.Add(cell);

                // BP (mmhg)
                TextField bp = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                bp.Value = assessment_system.Rows[i].Field<dynamic>("bp");
                cell = new TableCell();
                cell.Controls.Add(bp);
                row.Cells.Add(cell);

                // Temp (0C)
                TextField temp = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                temp.Value = assessment_system.Rows[i].Field<dynamic>("temp");
                cell = new TableCell();
                cell.Controls.Add(temp);
                row.Cells.Add(cell);

                // GCS
                TextField gcs = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                gcs.Value = assessment_system.Rows[i].Field<dynamic>("gcs");
                cell = new TableCell();
                cell.Controls.Add(gcs);
                row.Cells.Add(cell);

                // Pain /10
                TextField pain = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                pain.Value = assessment_system.Rows[i].Field<dynamic>("pain");
                cell = new TableCell();
                cell.Controls.Add(pain);
                row.Cells.Add(cell);

                // ATS scale
                TextField ats = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                ats.Value = assessment_system.Rows[i].Field<dynamic>("ats");
                cell = new TableCell();
                cell.Controls.Add(ats);
                row.Cells.Add(cell);

                // Re-Assessment & Intervention
                TextField intervention = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                intervention.Value = assessment_system.Rows[i].Field<dynamic>("intervention");
                cell = new TableCell();
                cell.Controls.Add(intervention);
                row.Cells.Add(cell);

                // RN's Initial 
                TextField initial = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                initial.Value = assessment_system.Rows[i].Field<dynamic>("initial");
                cell = new TableCell();
                cell.Controls.Add(initial);
                row.Cells.Add(cell);


                Trash trash = (Trash)Page.LoadControl("~/icons/Trash.ascx");
                cell = new TableCell();
                cell.Controls.Add(trash);
                row.Cells.Add(cell);


                tb_assessment_system.Rows.Add(row);
            }

            row = new TableRow();
            cell = new TableCell();

            LinkButton linkButton = new LinkButton();

            PlusCircle plusCircle = (PlusCircle)Page.LoadControl("~/icons/PlusCircle.ascx");
            linkButton.Text = "Add row";
            linkButton.CssClass = "btn btn-sm btn-outline-primary";
            linkButton.Controls.Add(plusCircle);

            cell.ColumnSpan = 4;
            cell.Controls.Add(linkButton);
            row.Cells.Add(cell);
            tb_assessment_system.Rows.Add(row);

            #endregion

            //Discharged
            if (ena.discharge_date_time != null)
            {
                dpk_discharge_date_time.SelectedDate = DateTime.Parse(ena.discharge_date_time);
                //tpk_discharge_date_time.SelectedTime = TimeSpan.Parse(ena.discharge_date_time.ToString("HH:mm:ss"));
                txt_discharge_by.Value = ena.discharge_by;
            }
            //missing  Home - Against Medical Advice/AMA - Dead

            //Admited
            if (ena.admited_date_time != null)
            {
                dpk_admited_date_time.SelectedDate = DateTime.Parse(ena.admited_date_time);
                tpk_admited_date_time.SelectedTime = TimeSpan.Parse(ena.admited_date_time.ToString("HH:mm:ss"));
                txt_admited_by.Value = ena.admited_by;
                txt_receiving_unit.Value = ena.receiving_unit;
            }

            // Transfer to
            txt_transfer_to.Value = ena.transfer_to;
            txt_transfer_by.Value = ena.transfer_by;

            // Time notified to Doctor
            if(ena.noticed_time != null)
            {
                dpk_noticed_time.SelectedDate = DateTime.Parse(ena.noticed_time);
                //tpk_noticed_time.SelectedTime = TimeSpan.Parse(ena.noticed_time.ToString("HH:mm:ss"));
            }

            #region NURSING NOTES
            DataTable nursing_note = WebHelpers.GetJSONToDataTable(ena.nursing_note);

            for (int i = 0; i < nursing_note.Rows.Count; i++)
            {

                row = new TableRow();

                RadDatePicker radDate = new RadDatePicker();
                RadTimePicker radTime =  new RadTimePicker();
                TextField patient_condition = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");
                TextField signature_name = (TextField)Page.LoadControl("~/UserControls/TextField.ascx");

                radDate.SelectedDate = nursing_note.Rows[i].Field<dynamic>("date_time");
                radTime.SelectedTime = TimeSpan.Parse(nursing_note.Rows[i].Field<dynamic>("date_time").ToString("HH:mm:ss"));
                patient_condition.Value = nursing_note.Rows[i].Field<dynamic>("patient_condition");
                signature_name.Value = nursing_note.Rows[i].Field<dynamic>("signature_name");

                radDate.Width = 120;
                radTime.Width = 110;

                cell = new TableCell();
                cell.Controls.Add(radDate);
                cell.Controls.Add(radTime);
                row.Cells.Add(cell);

                cell = new TableCell();
                cell.Controls.Add(patient_condition);
                row.Cells.Add(cell);

                cell = new TableCell();
                cell.Controls.Add(signature_name);
                row.Cells.Add(cell);

                Trash trash = (Trash)Page.LoadControl("~/icons/Trash.ascx");
                cell = new TableCell();
                cell.Controls.Add(trash);
                row.Cells.Add(cell);
                tb_nursing_note.Rows.Add(row);
            }

            row = new TableRow();
            cell = new TableCell();

            linkButton = new LinkButton();
            
            plusCircle = (PlusCircle)Page.LoadControl("~/icons/PlusCircle.ascx");
            linkButton.Text = "Add row";
            linkButton.CssClass = "btn btn-sm btn-outline-primary";
            linkButton.Controls.Add(plusCircle);

            cell.ColumnSpan = 4;
            cell.Controls.Add(linkButton);
            row.Cells.Add(cell);
            tb_nursing_note.Rows.Add(row);
            
            #endregion


            btnCancel.Visible = false;
                //amendReasonBox.Visible = false;
                if (ena.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDelete.Visible = false;
                    btnCancel.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }
                else if (ena.status == DocumentStatus.DRAFT)
                {

                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            
        }
        protected void DisabledControl(bool disabled)
        {
            txt_chief_complaint.Disabled = disabled;

            rad_triage_code1.Disabled = disabled;
            rad_triage_code2.Disabled = disabled;
            rad_triage_code3.Disabled = disabled;
            rad_triage_code4.Disabled = disabled;
            rad_triage_code5.Disabled = disabled;

            rad_arrival_mode_code1.Disabled = disabled;
            rad_arrival_mode_code2.Disabled = disabled;
            rad_arrival_mode_code3.Disabled = disabled;

            txt_past_medical_history.Disabled = disabled;
            txt_vs_temperature.Disabled = disabled;
            txt_vs_heart_rate.Disabled = disabled;
            txt_vs_weight.Disabled = disabled;
            txt_vs_respiratory_rate.Disabled = disabled;
            txt_vs_height.Disabled = disabled;
            txt_vs_blood_pressure.Disabled = disabled;
            txt_vs_bmi.Disabled = disabled;
            txt_vs_spo2.Disabled = disabled;
            txt_vs_head_circum.Disabled = disabled;

            txt_pain_onset.Disabled = disabled;
            txt_pain_location.Disabled = disabled;
            txt_pain_duration.Disabled = disabled;
            txt_pain_radiation.Disabled = disabled;
            txt_pain_score.Disabled = disabled;

            txt_allergy.Disabled = disabled;
            txt_current_medication.Disabled = disabled;

            cb_com_dis_src_f.Disabled = disabled;
            cb_com_dis_src_c.Disabled = disabled;
            cb_com_dis_src_r.Disabled = disabled;
            cb_com_dis_src_s.Disabled = disabled;
            cb_com_dis_src_t.Disabled = disabled;

            // Discharge Planning
            cb_cde_la.Disabled = disabled;
            cb_cde_ra.Disabled = disabled;
            cb_cde_hf.Disabled = disabled;

            // Disposition after discharge
            rad_cde_after_discharge1.Disabled = disabled;
            rad_cde_after_discharge2.Disabled = disabled;

            // People who will look after patient after discharge
            txt_caregiver_after_discharge.Disabled = disabled;

            //
            rad_btc_language1.Disabled = disabled;
            rad_btc_language2.Disabled = disabled;
            txt_btc_language_note.Disabled = disabled;

            //
            rad_btc_cognitive1.Disabled = disabled;
            rad_btc_cognitive2.Disabled = disabled;
            txt_btc_cognitive_note.Disabled = disabled;

            //
            rad_btc_sensory1.Disabled = disabled;
            rad_btc_sensory2.Disabled = disabled;
            txt_btc_sensory_note.Disabled = disabled;

            //
            rad_btc_religious1.Disabled = disabled;
            rad_btc_religious2.Disabled = disabled;
            txt_btc_religious_note.Disabled = disabled;

            //
            rad_btc_cultural1.Disabled = disabled;
            rad_btc_cultural2.Disabled = disabled;
            txt_btc_cultural_note.Disabled = disabled;

            //
            cb_cde_p.Disabled = disabled;
            cb_cde_c.Disabled = disabled;
            cb_cde_t.Disabled = disabled;

            //
            txt_eye.Disabled = disabled;
            txt_voice.Disabled = disabled;
            txt_motion.Disabled = disabled;

            //missing

            // Respiratory
            cb_respiratory_reg.Disabled = disabled;
            cb_respiratory_nre.Disabled = disabled;
            cb_respiratory_tac.Disabled = disabled;
            cb_respiratory_sha.Disabled = disabled;
            cb_respiratory_lab.Disabled = disabled;
            //missing
            cb_respiratory_cou.Disabled = disabled;
            cb_respiratory_spu.Disabled = disabled;
            //missing



        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ena = new Ena(DataHelpers.varDocId);

            ena.user_name = (string)Session["UserID"];
            ena.status = DocumentStatus.DRAFT;

            ena.chief_complaint = txt_chief_complaint.Value;

            if (ena.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
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
    }
}
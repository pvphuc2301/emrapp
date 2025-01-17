﻿using EMR.Classes;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.IPD
{
    public partial class ObsGynIniAss : System.Web.UI.Page
    {
        Ogia ogia;
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

            PAGE_URL = $"/IPD/{url}.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
                SetDefaultValue();
            }

            PostBackEvent();
        }

        private void SetDefaultValue()
        {
            if (RadGrid1.Items.Count <= 1)
            {
                rad_infected_with_covid_false.Checked = true;
            }
        }

        #region Binding Data
        private void BindingDataForm(Ogia ogia, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(ogia);
            }
            else
            {
                BindingDataFormView(ogia);
            }
        }
        private void BindingDataFormEdit(Ogia ogia)
        {
            try
            {
                txt_amend_reason.Text = "";
                if (string.IsNullOrEmpty(ogia.obs_history)) { ogia.obs_history = Ogia.OBS_HISTORY_TEMPLATE; }

                is_obs_gyn_change(ogia.is_obs_gyn);

                //if (ogia.is_obs_gyn)
                //{
                txt_reason_admission.Value = ogia.reason_admission;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_is_obs_gyn_" + ogia.is_obs_gyn);
                txt_lmp_from.Value = ogia.lmp_from;
                txt_lmp_to.Value = ogia.lmp_to;
                txt_ges_age_days.Value = Convert.ToString(ogia.ges_age_days);
                txt_ges_age_weeks.Value = Convert.ToString(ogia.ges_age_weeks);
                txt_prenatal_visit.Value = ogia.prenatal_visit;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_tetanus_vaccination_" + ogia.tetanus_vaccination);
                txt_tetanus_vaccin_time.Value = ogia.tetanus_vaccin_time;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gbs_disease_" + ogia.gbs_disease);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gbs_bacteriuria_" + ogia.gbs_bacteriuria);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gbs_vaginal_" + ogia.gbs_vaginal);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ges_diabetes_" + ogia.ges_diabetes);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_other_ges_abnormal_" + ogia.other_ges_abnormal);

                txt_other_ges_abnormal_note.Value = ogia.other_ges_abnormal_note;

                WebHelpers.DataBind(dtpk_labor_trig_at_time, ogia.labor_trig_at_time);

                txt_preliminary_signs.Value = ogia.preliminary_signs;
                txt_progression.Value = ogia.progression;
                txt_obs_cur_medication.Value = ogia.obs_cur_medication;

                //2
                //External exam
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_obs_pre_cicatrice_" + ogia.obs_pre_cicatrice);
                tetanus_vaccination_change(Convert.ToString(ogia.tetanus_vaccination));
                txt_obs_uterine_shape.Value = ogia.obs_uterine_shape;
                txt_obs_posture.Value = ogia.obs_posture;
                txt_obs_fundal_height.Value = ogia.obs_fundal_height;
                txt_obs_abdominal_circum.Value = ogia.obs_abdominal_circum;
                txt_obs_uterine_con.Value = ogia.obs_uterine_con;
                txt_obs_fetal_heart_rate.Value = ogia.obs_fetal_heart_rate;
                txt_obs_breasts.Value = ogia.obs_breasts;

                //Internal exam
                txt_obs_vulva.Value = ogia.obs_vulva;
                txt_obs_vagina.Value = ogia.obs_vagina;
                txt_obs_perineum.Value = ogia.obs_perineum;
                txt_obs_cervix.Value = ogia.obs_cervix;
                txt_obs_adnexa.Value = ogia.obs_adnexa;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_obs_mem_condition_code_" + ogia.obs_mem_condition_code);

                obs_mem_condition_code_change(ogia.obs_mem_condition_code);

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_obs_mem_con_attri_code_" + ogia.obs_mem_con_attri_code);

                WebHelpers.BindDateTimePicker(dtpk_obs_rup_of_mem_at, ogia.obs_rup_of_mem_at);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_obs_feat_amniotic_", WebHelpers.GetJSONToDataTable(ogia.obs_feat_amniotic));

                txt_obs_color_amniotic.Value = ogia.obs_color_amniotic;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_obs_presentation_code_" + ogia.obs_presentation_code);
                txt_obs_presentation_other.Value = ogia.obs_presentation_other;
                txt_obs_fetal_position.Value = ogia.obs_fetal_position;
                txt_obs_pelvic_exam.Value = ogia.obs_pelvic_exam;
                txt_obs_bishop_score.Value = ogia.obs_bishop_score;

                //}
                //else
                //{
                txt_gyn_med_history.Value = ogia.gyn_med_history;
                txt_gyn_cur_medication.Value = ogia.gyn_cur_medication;
                //III
                //2
                //External exam
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_gyn_abdo_sur_scars_" + ogia.gyn_abdo_sur_scars);
                txt_gyn_reason.Value = ogia.gyn_reason;
                txt_gyn_uterine_height.Value = ogia.gyn_uterine_height;
                //Internal exam
                txt_gyn_vulva.Value = ogia.gyn_vulva;
                txt_gyn_perineum.Value = ogia.gyn_perineum;
                txt_gyn_vagina.Value = ogia.gyn_vagina;
                txt_gyn_discharge.Value = ogia.gyn_discharge;
                txt_gyn_cervix.Value = ogia.gyn_cervix;
                txt_gyn_adnexa.Value = ogia.gyn_adnexa;
                txt_gyn_douglas_pouchs.Value = ogia.gyn_douglas_pouchs;

                //}

                //gyn_med_history ? gyn_cur_medication

                //2 Antecedent medical history
                txt_personal.Value = ogia.personal;

                //Update V2.0
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = false;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_" + ogia.infected_with_covid);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + ogia.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + ogia.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + ogia.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + ogia.not_yet_vaccinations);

                txt_other_vaccinations.Value = ogia.other_vaccinations;

                txt_family.Value = ogia.family;

                //3 Gynecological history
                txt_age_of_menarhce.Value = ogia.age_of_menarhce;
                txt_menstrual_cycle.Value = Convert.ToString(ogia.menstrual_cycle);
                txt_length_of_period.Value = ogia.length_of_period;
                txt_amount_mens_blood.Value = ogia.amount_mens_blood;
                txt_marriage_age.Value = Convert.ToString(ogia.marriage_age);
                txt_age_menopause.Value = ogia.age_menopause;
                txt_previous_gyn_diseases.Value = ogia.previous_gyn_diseases;

                //4
                WebHelpers.DataBind(grid_obs_history, WebHelpers.GetJSONToDataTable(ogia.obs_history));
                WebHelpers.DisabledGridView(grid_obs_history, false);
                grid_obs_history.Columns[grid_obs_history.Columns.Count - 1].Visible = true;
                //III
                //1 General exam
                txt_general_appearance.Value = ogia.general_appearance;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_edema_" + ogia.edema);
                txt_edema_note.Value = ogia.edema_note;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_obs_rup_of_mem_code_" + ogia.obs_rup_of_mem_code);

                txt_cardio_system.Value = ogia.cardio_system;
                txt_respiratory_system.Value = ogia.respiratory_system;
                txt_digestive_system.Value = ogia.digestive_system;
                txt_nervous_system.Value = ogia.nervous_system;
                txt_uro_system.Value = ogia.uro_system;
                txt_mus_system.Value = ogia.mus_system;
                txt_otorhinolaryngology.Value = ogia.otorhinolaryngology;
                txt_integumentary_system.Value = ogia.integumentary_system;
                txt_ophthalmology.Value = ogia.ophthalmology;
                txt_other_findings.Value = ogia.other_findings;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_psy_consul_required_" + ogia.psy_consul_required);

                //IV.
                txt_lab_result.Value = ogia.lab_result;
                txt_add_investigations.Value = ogia.add_investigations;
                //V.
                txt_initial_diagnosis.Value = ogia.initial_diagnosis;
                txt_diagnosis.Value = ogia.diagnosis;
                txt_diff_diagnosis.Value = ogia.diff_diagnosis;
                txt_associated_conditions.Value = ogia.associated_conditions;
                txt_treatment_plan.Value = ogia.treatment_plan;
                txt_discharge_plan.Value = ogia.discharge_plan;

                DataObj.Value = JsonConvert.SerializeObject(ogia);
                Session["docid"] = ogia.document_id;
                WebHelpers.AddScriptFormEdit(Page, ogia, (string)Session["emp_id"], loc);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Ogia ogia)
        {
            try
            {

                LoadBarCode();

                lbl_reason_admission.Text = WebHelpers.FormatString(ogia.reason_admission);
                lbl_is_obs_gyn.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.is_obs_gyn, "SẢN KHOA/ OBSTETRICS", "PHỤ KHOA/ GYNECOLOGY"));

                is_obs_gyn_change(ogia.is_obs_gyn);

                //if (ogia.is_obs_gyn)
                //{
                lbl_lmp_from.Text = WebHelpers.FormatString(ogia.lmp_from);
                lbl_lmp_to.Text = WebHelpers.FormatString(ogia.lmp_to);
                lbl_ges_age_weeks.Text = $"{WebHelpers.FormatString(ogia.ges_age_weeks)} tuần/ weeks {WebHelpers.FormatString(ogia.ges_age_days)} ngày/ days";
                lbl_prenatal_visit.Text = WebHelpers.FormatString(ogia.prenatal_visit);

                tetanus_vaccination_change(Convert.ToString(ogia.tetanus_vaccination));

                lbl_tetanus_vaccination.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.tetanus_vaccination, $"Có/ Yes {WebHelpers.FormatString(ogia.tetanus_vaccin_time)} lần/ times", "Chưa/ Not yet"));

                lbl_gbs_disease.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.gbs_disease));
                lbl_gbs_bacteriuria.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.gbs_bacteriuria));

                lbl_gbs_vaginal.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.gbs_vaginal));

                lbl_ges_diabetes.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.ges_diabetes));
                lbl_other_ges_abnormal.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.other_ges_abnormal, $"Có/ Yes {ogia.other_ges_abnormal_note}"));
                lbl_labor_trig_at_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(ogia.labor_trig_at_time, "dd-MM-yyyy HH:mm"));
                lbl_preliminary_signs.Text = WebHelpers.FormatString(ogia.preliminary_signs);
                lbl_progression.Text = WebHelpers.FormatString(ogia.progression);
                lbl_obs_cur_medication.Text = WebHelpers.FormatString(ogia.obs_cur_medication);

                //2.
                lbl_obs_pre_cicatrice.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.obs_pre_cicatrice, "Yes", "No"));
                lbl_obs_uterine_shape.Text = WebHelpers.FormatString(ogia.obs_uterine_shape);
                lbl_obs_posture.Text = WebHelpers.FormatString(ogia.obs_posture) + " cm";
                lbl_obs_fundal_height.Text = WebHelpers.FormatString(ogia.obs_fundal_height) + " cm";
                lbl_obs_abdominal_circum.Text = WebHelpers.FormatString(ogia.obs_abdominal_circum);
                lbl_obs_uterine_con.Text = WebHelpers.FormatString(ogia.obs_uterine_con);
                lbl_obs_fetal_heart_rate.Text = WebHelpers.FormatString(ogia.obs_fetal_heart_rate) + " lần/phút/ bpm";
                lbl_obs_breasts.Text = WebHelpers.FormatString(ogia.obs_breasts);

                //
                lbl_obs_vulva.Text = WebHelpers.FormatString(ogia.obs_vulva);
                lbl_obs_vagina.Text = WebHelpers.FormatString(ogia.obs_vagina);
                lbl_obs_perineum.Text = WebHelpers.FormatString(ogia.obs_perineum);
                lbl_obs_cervix.Text = WebHelpers.FormatString(ogia.obs_cervix);
                lbl_obs_adnexa.Text = WebHelpers.FormatString(ogia.obs_adnexa);

                obs_mem_condition_code_change(ogia.obs_mem_condition_code);
                if (ogia.obs_mem_condition_code == "RU")
                {
                    lbl_obs_rup_of_mem_at.Text = WebHelpers.FormatDateTime(ogia.obs_rup_of_mem_at);
                }
                else if (ogia.obs_mem_condition_code == "IN")
                {
                    lbl_obs_mem_con_attri_desc.Text = ogia.obs_mem_con_attri_desc;
                }

                lbl_obs_mem_condition_code.Text = WebHelpers.FormatString(ogia.obs_mem_condition_desc);

                lbl_obs_rup_of_mem_code.Text = WebHelpers.FormatString(ogia.obs_rup_of_mem_desc);

                lbl_obs_feat_amniotic.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(ogia.obs_feat_amniotic));

                lbl_obs_color_amniotic.Text = WebHelpers.FormatString(ogia.obs_color_amniotic);

                lbl_obs_presentation_code.Text = ogia.obs_presentation_desc + (ogia.obs_presentation_code == "OTH" ? WebHelpers.FormatString(ogia.obs_presentation_other) : "");

                lbl_obs_fetal_position.Text = WebHelpers.FormatString(ogia.obs_fetal_position);
                lbl_obs_pelvic_exam.Text = WebHelpers.FormatString(ogia.obs_pelvic_exam);
                lbl_obs_bishop_score.Text = WebHelpers.FormatString(ogia.obs_bishop_score) + " điểm/ points";

                //}
                //else
                //{
                lbl_gyn_med_history.Text = WebHelpers.FormatString(ogia.gyn_med_history);
                lbl_gyn_cur_medication.Text = WebHelpers.FormatString(ogia.gyn_cur_medication);

                //2
                //External exam
                lbl_gyn_abdo_sur_scars.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.gyn_abdo_sur_scars));
                lbl_gyn_reason.Text = WebHelpers.FormatString(ogia.gyn_reason);
                lbl_gyn_uterine_height.Text = WebHelpers.FormatString(ogia.gyn_uterine_height);
                //Internal Examination
                lbl_gyn_vulva.Text = WebHelpers.FormatString(ogia.gyn_vulva);
                lbl_gyn_perineum.Text = WebHelpers.FormatString(ogia.gyn_perineum);
                lbl_gyn_vagina.Text = WebHelpers.FormatString(ogia.gyn_vagina);
                lbl_gyn_discharge.Text = WebHelpers.FormatString(ogia.gyn_discharge);
                lbl_gyn_cervix.Text = WebHelpers.FormatString(ogia.gyn_cervix);
                lbl_gyn_adnexa.Text = WebHelpers.FormatString(ogia.gyn_adnexa);
                lbl_gyn_douglas_pouchs.Text = WebHelpers.FormatString(ogia.gyn_douglas_pouchs);
                //}
                //2
                lbl_personal.Text = WebHelpers.FormatString(ogia.personal);
                cb_received_1_dose_true.Disabled
                    = cb_received_2_dose_true.Disabled
                    = cb_received_additional_true.Disabled
                    = cb_not_yet_vaccinations_true.Disabled
                    = true;

                lbl_infected_with_covid.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.infected_with_covid));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_1_dose_" + ogia.received_1_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_2_dose_" + ogia.received_2_dose);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_received_additional_" + ogia.received_additional);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_yet_vaccinations_" + ogia.not_yet_vaccinations);

                lbl_other_vaccinations.Text = ogia.other_vaccinations;

                lbl_family.Text = WebHelpers.FormatString(ogia.family);
                //3
                lbl_age_of_menarhce.Text = WebHelpers.FormatString(ogia.age_of_menarhce);
                lbl_menstrual_cycle.Text = WebHelpers.FormatString(ogia.menstrual_cycle);
                lbl_length_of_period.Text = WebHelpers.FormatString(ogia.length_of_period);
                lbl_amount_mens_blood.Text = WebHelpers.FormatString(ogia.amount_mens_blood);
                lbl_marriage_age.Text = WebHelpers.FormatString(ogia.marriage_age);
                lbl_age_menopause.Text = WebHelpers.FormatString(ogia.age_menopause);
                lbl_previous_gyn_diseases.Text = WebHelpers.FormatString(ogia.previous_gyn_diseases);
                //4.
                WebHelpers.DataBind(grid_obs_history, WebHelpers.GetJSONToDataTable(ogia.obs_history));
                WebHelpers.DisabledGridView(grid_obs_history, true);
                grid_obs_history.Columns[grid_obs_history.Columns.Count - 1].Visible = true;
                //III.
                lbl_general_appearance.Text = WebHelpers.FormatString(ogia.general_appearance);
                lbl_edema.Text = WebHelpers.GetBool(ogia.edema, "Yes", "No");

                lbl_edema_note.Text = WebHelpers.FormatString(ogia.edema_note);
                lbl_cardio_system.Text = WebHelpers.FormatString(ogia.cardio_system);
                lbl_respiratory_system.Text = WebHelpers.FormatString(ogia.respiratory_system);
                lbl_digestive_system.Text = WebHelpers.FormatString(ogia.digestive_system);
                lbl_nervous_system.Text = WebHelpers.FormatString(ogia.nervous_system);
                lbl_uro_system.Text = WebHelpers.FormatString(ogia.uro_system);
                lbl_mus_system.Text = WebHelpers.FormatString(ogia.mus_system);
                lbl_otorhinolaryngology.Text = WebHelpers.FormatString(ogia.otorhinolaryngology);
                lbl_integumentary_system.Text = WebHelpers.FormatString(ogia.integumentary_system);
                lbl_ophthalmology.Text = WebHelpers.FormatString(ogia.ophthalmology);
                lbl_other_findings.Text = WebHelpers.FormatString(ogia.other_findings);
                lbl_psy_consul_required.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.psy_consul_required, "Yes", "No"));

                //IV
                lbl_lab_result.Text = WebHelpers.FormatString(ogia.lab_result);
                lbl_add_investigations.Text = WebHelpers.FormatString(ogia.add_investigations);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.FormatString(ogia.initial_diagnosis);
                lbl_diagnosis.Text = WebHelpers.FormatString(ogia.diagnosis);
                lbl_diff_diagnosis.Text = WebHelpers.FormatString(ogia.diff_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.FormatString(ogia.associated_conditions);
                lbl_treatment_plan.Text = WebHelpers.FormatString(ogia.treatment_plan);
                lbl_discharge_plan.Text = WebHelpers.FormatString(ogia.discharge_plan);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }

        }
        private void BindingDataFormPrint(Ogia ogia)
        {
            try
            {
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                LoadBarCode();

                prt_fullname.InnerText = string.Format("{0} - {1}", patientInfo.FullName, patientInfo.Gender);

                prt_DOB.InnerText = "DOB: " + WebHelpers.FormatDateTime(patientInfo.DOB, "dd-MM-yyyy", "");

                prt_vpid.InnerText = string.Format("{0} - {1} - {2}", patientInfo.visible_patient_id, patientVisitInfo.visit_type, patientVisitInfo.visit_code);

                prt_reason_admission.Text = ogia.reason_admission;

                div_obs.Visible
                    = div_for_obstetric.Visible
                    = div_gyn.Visible
                    = div_for_gyneacology.Visible
                    = false;

                if (ogia.is_obs_gyn != null)
                {
                    if (ogia.is_obs_gyn == true)
                    {
                        prt_title.Text = "SẢN KHOA/ <span class=\"en\">OBSTETRICS</span>";
                        div_obs.Visible = true;
                        div_for_obstetric.Visible = true;
                    }
                    else
                    {
                        prt_title.Text = "PHỤ KHOA/ <span class=\"en\">GYNECOLOGY</span>";
                        div_gyn.Visible = true;
                        div_for_gyneacology.Visible = true;
                    }
                }
                //if (ogia.is_obs_gyn == null)
                //{
                //    lbl_is_obs_gyn.Text = "——";
                //}
                prt_lmp_from.Text = WebHelpers.FormatString(ogia.lmp_from, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_lmp_to.Text = WebHelpers.FormatString(ogia.lmp_to, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_ges_age_days.Text = WebHelpers.FormatString(Convert.ToString(ogia.ges_age_days), "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_ges_age_weeks.Text = WebHelpers.FormatString(Convert.ToString(ogia.ges_age_weeks), "&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_prenatal_visit.Text = ogia.prenatal_visit;

                prt_tetanus_vaccination.Text = WebHelpers.CreateOptions(new Option { Text = "Chưa/ <span class=\"en\">Not yet</span>", Value = false }, new Option { Text = "Có/ <span class=\"en\">yes</span>, " + ogia.tetanus_vaccin_time + " Lần/<span class=\"en\">times</span>", Value = true }, ogia.tetanus_vaccination, "display: grid;grid-template-columns:200px auto;");

                prt_gbs_disease.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"en\">No</span>", Value = false }, new Option { Text = "Có/ <span class=\"en\">Yes</span>", Value = true }, ogia.gbs_disease, "display: grid;grid-template-columns:1fr 1fr;");

                prt_gbs_bacteriuria.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"en\">No</span>", Value = false }, new Option { Text = "Có/ <span class=\"en\">Yes</span>", Value = true }, ogia.gbs_bacteriuria, "display: grid;grid-template-columns:1fr 1fr;");

                prt_gbs_vaginal.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"en\">No</span>", Value = false }, new Option { Text = "Có/ <span class=\"en\">Yes</span>", Value = true }, ogia.gbs_vaginal, "display: grid;grid-template-columns:1fr 1fr;");

                //fixed
                prt_ges_diabetes.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"en\">No</span>", Value = false }, new Option { Text = "Có/ <span class=\"en\">Yes</span>", Value = true }, ogia.ges_diabetes, "display: grid;grid-template-columns:150px auto;");

                prt_other_ges_abnormal.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"en\">No</span>", Value = false }, new Option { Text = "Có, chi tiết/ <span class=\"en\">Yes, specify: </span>" + ogia.other_ges_abnormal_note, Value = true }, ogia.other_ges_abnormal, "display: grid;grid-template-columns:150px auto;");

                dynamic labor_trig_at_time = WebHelpers.ConvertDateTime(ogia.labor_trig_at_time, out bool IsValidDateTime);

                if (IsValidDateTime)
                {
                    prt_labor_trig_at_time.Text = labor_trig_at_time.ToString("HH") + "&nbsp;giờ/ <span class=\"en\">hour </span>"
                                                + labor_trig_at_time.ToString("mm") + "&nbsp;phút/ <span class=\"en\">minute</span>&nbsp;"
                                                + labor_trig_at_time.ToString("dd/MM/yyyy");
                }

                //if (ogia.labor_trig_at_time != null)
                //{
                //    string labor_trig_at_time_temp = ogia.labor_trig_at_time.ToString("dd/mm/yyyy hh:mm:ss tt");

                //    if (labor_trig_at_time_temp == "01/00/0001 12:00:00 AM")
                //    {
                //        prt_labor_trig_at_time.Text = "........giờ/ hour " + "........phút/ minute";
                //    }
                //    else
                //    {
                //        prt_labor_trig_at_time.Text = ogia.labor_trig_at_time.ToString("HH") + "giờ/ hour "
                //                                + ogia.labor_trig_at_time.ToString("mm") + "phút/ minute"
                //                                + ogia.labor_trig_at_time.ToString("DD/mm/yyyy");
                //    }
                //}

                prt_preliminary_signs.Text = ogia.preliminary_signs;
                prt_obs_cur_medication.Text = ogia.obs_cur_medication;
                prt_gyn_med_history.Text = ogia.gyn_med_history;
                prt_gyn_cur_medication.Text = ogia.gyn_cur_medication;
                prt_personal.Text = ogia.personal;
                prt_infected_with_covid_false.Text
                    = prt_infected_with_covid_true.Text
                    = prt_received_1_dose_true.Text
                    = prt_received_2_dose_true.Text
                    = prt_received_additional_true.Text
                    = prt_not_yet_vaccinations_true.Text
                    = "❏";

                Label infected_with_covid = FindControl("prt_infected_with_covid_" + ogia.infected_with_covid);
                if (infected_with_covid != null) infected_with_covid.Text = "☒";

                Label received_1_dose = FindControl("prt_received_1_dose_" + ogia.received_1_dose);
                if (received_1_dose != null) received_1_dose.Text = "☒";

                Label received_2_dose = FindControl("prt_received_2_dose_" + ogia.received_2_dose);
                if (received_2_dose != null) received_2_dose.Text = "☒";

                Label received_additional = FindControl("prt_received_additional_" + ogia.received_additional);
                if (received_additional != null) received_additional.Text = "☒";

                Label not_yet_vaccinations = FindControl("prt_not_yet_vaccinations_" + ogia.not_yet_vaccinations);
                if (not_yet_vaccinations != null) not_yet_vaccinations.Text = "☒";

                prt_other_vaccinations.Text = "• Tiêm vắc xin khác (ghi rõ)/ <span class=\"en\">Other vaccinations (specify)</span>: " + ogia.other_vaccinations;

                prt_family.Text = ogia.family;
                prt_age_of_menarhce.Text = WebHelpers.FormatString(ogia.age_of_menarhce, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_menstrual_cycle.Text = WebHelpers.FormatString(Convert.ToString(ogia.menstrual_cycle), "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_length_of_period.Text = WebHelpers.FormatString(ogia.length_of_period, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_amount_mens_blood.Text = ogia.amount_mens_blood;
                prt_marriage_age.Text = Convert.ToString(ogia.marriage_age);
                prt_age_menopause.Text = ogia.age_menopause;
                prt_previous_gyn_diseases.Text = ogia.previous_gyn_diseases;

                DataTable obs_history = WebHelpers.GetJSONToDataTable(ogia.obs_history);

                if (obs_history != null)
                {
                    foreach (DataRow row in obs_history.Rows)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;
                        HtmlGenericControl p;
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["label"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["grav_1"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["grav_2"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["grav_3"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["grav_4"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["grav_5"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(row["grav_6"]) };
                        td.Controls.Add(p);
                        tr.Cells.Add(td);

                        prt_obs_history.Rows.Add(tr);
                    }
                }

                prt_general_appearance.Text = ogia.general_appearance;

                prt_edema.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"en\">No</span>", Value = false }, new Option { Text = "Có, chi tiết/ <span class=\"en\">Yes, specify: </span>" + WebHelpers.GetBool(ogia.edema, ogia.edema_note, ""), Value = true }, ogia.edema, "display: grid;grid-template-columns:150px auto;");

                prt_cardio_system.Text = ogia.cardio_system;
                prt_respiratory_system.Text = ogia.respiratory_system;
                prt_digestive_system.Text = ogia.digestive_system;

                prt_nervous_system.Text = ogia.nervous_system;

                prt_uro_system.Text = ogia.uro_system;
                prt_mus_system.Text = ogia.mus_system;
                prt_otorhinolaryngology.Text = ogia.otorhinolaryngology;
                prt_integumentary_system.Text = ogia.integumentary_system;
                prt_ophthalmology.Text = ogia.ophthalmology;
                prt_other_findings.Text = ogia.other_findings;
                //prt_integumentary_system.Text = ogia.integumentary_system;

                prt_psy_consul_required.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ <span class=\"en\">No</span>", Value = false }, new Option { Text = "Có/ <span class=\"en\">Yes</span>", Value = true }, ogia.psy_consul_required, "display: grid; grid-template-columns:auto 1fr; gap:6px");

                {
                    Control control = FindControl("prt_obs_pre_cicatrice_" + ogia.obs_pre_cicatrice);
                    if (control != null)
                    {
                        (control as Label).Text = "☒";
                    }
                }

                prt_obs_uterine_shape.Text = WebHelpers.FormatString(ogia.obs_uterine_shape, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_obs_posture.Text = ogia.obs_posture;
                prt_obs_fundal_height.Text = WebHelpers.FormatString(ogia.obs_fundal_height, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_obs_abdominal_circum.Text = WebHelpers.FormatString(ogia.obs_abdominal_circum, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_obs_uterine_con.Text = ogia.obs_uterine_con;
                prt_obs_fetal_heart_rate.Text = WebHelpers.FormatString(ogia.obs_fetal_heart_rate, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_obs_breasts.Text = WebHelpers.FormatString(ogia.obs_breasts, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_obs_bishop_score.Text = WebHelpers.FormatString(ogia.obs_bishop_score, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_obs_vulva.Text = ogia.obs_vulva;
                prt_obs_vagina.Text = ogia.obs_vagina;
                prt_obs_perineum.Text = ogia.obs_perineum;
                prt_obs_cervix.Text = ogia.obs_cervix;
                prt_obs_adnexa.Text = ogia.obs_adnexa;

                prt_obs_mem_condition_code.Text = WebHelpers.CreateOptions(new Option { Text = "Nguyên vẹn/ <span class=\"en\">Intact</span>", Value = "IN" }, new Option { Text = "Đã vỡ/ <span class=\"en\">Ruptured</span>", Value = "RU" }, ogia.obs_mem_condition_code, "display: grid;grid-template-columns:150px auto;");

                obs_mem_condition_code_ru_field.Visible = ogia.obs_mem_condition_code == "RU";

                if (ogia.obs_mem_condition_code == "RU")
                {
                    DateTime? obs_rup_of_mem_at = WebHelpers.ConvertDateTime(ogia.obs_rup_of_mem_at, out bool IsValidDateTime1);
                    if (IsValidDateTime1)
                    {
                        prt_obs_rup_of_mem_at.Text = $"{ WebHelpers.FormatDateTime(obs_rup_of_mem_at, "HH")} giờ/ <span class=\"en\">hour</span> { WebHelpers.FormatDateTime(obs_rup_of_mem_at, "mm")} phút/ <span class=\"en\">minute</span> ngày/ <span class=\"en\">date</span> { WebHelpers.FormatDateTime(obs_rup_of_mem_at, "dd/MM/yyyy")}";
                    }
                    prt_obs_rup_of_mem_code.Text = WebHelpers.CreateOptions(new Option { Text = "Tự nhiên/ <span class=\"en\">Spontaneous</span>", Value = "IN" }, new Option { Text = "Can thiệp/ <span class=\"en\">Interventional</span>", Value = "RU" }, ogia.obs_rup_of_mem_code, "display: grid;grid-template-columns:200px auto;");
                }

                DataTable obs_feat_amniotic = WebHelpers.GetJSONToDataTable(ogia.obs_feat_amniotic);
                if (obs_feat_amniotic != null)
                {
                    foreach (DataRow row in obs_feat_amniotic.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_obs_feat_amniotic_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☒";
                        }
                    }
                }

                {
                    Control control = FindControl("prt_obs_presentation_code_" + ogia.obs_presentation_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☒";
                    }
                }

                prt_obs_fetal_position.Text = ogia.obs_fetal_position;
                prt_obs_pelvic_exam.Text = ogia.obs_pelvic_exam;

                {
                    Control control = FindControl("prt_gyn_abdo_sur_scars_" + ogia.gyn_abdo_sur_scars);
                    if (control != null)
                    {
                        (control as Label).Text = "☒";
                        prt_gyn_reason.Text = ogia.gyn_reason;
                    }
                }

                prt_gyn_uterine_height.Text = ogia.gyn_uterine_height;
                prt_gyn_vulva.Text = ogia.gyn_vulva;
                prt_gyn_perineum.Text = ogia.gyn_perineum;
                prt_gyn_vagina.Text = ogia.gyn_vagina;
                prt_gyn_discharge.Text = ogia.gyn_discharge;
                prt_gyn_cervix.Text = ogia.gyn_cervix;
                prt_gyn_uterus.Text = ogia.gyn_uterus;
                prt_gyn_adnexa.Text = ogia.gyn_adnexa;
                prt_gyn_douglas_pouchs.Text = ogia.gyn_douglas_pouchs;
                prt_lab_result.Text = ogia.lab_result;
                prt_add_investigations.Text = ogia.add_investigations;
                prt_initial_diagnosis.Text = ogia.initial_diagnosis;
                //prt_diagnosis.Text = ogia.diagnosis;
                prt_diff_diagnosis.Text = ogia.diff_diagnosis;
                prt_associated_conditions.Text = ogia.associated_conditions;
                prt_treatment_plan.Text = ogia.treatment_plan;
                prt_discharge_plan.Text = ogia.discharge_plan;
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
                Ogia ogia = new Ogia(varDocID, loc);
                ogia.status = DocumentStatus.FINAL;

                UpdateData(ogia);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Ogia ogia = new Ogia(varDocID, loc);
                ogia.status = DocumentStatus.DRAFT;

                UpdateData(ogia);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Ogia.Delete((string)Session["UserID"], Request.QueryString["docid"], loc)[0];
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
                Ogia ogia = new Ogia(Request.QueryString["docId"], loc);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, ogia, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(ogia);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }

        private void PostBackEvent()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "obs_mem_condition_code_change":
                    obs_mem_condition_code_change(Request["__EVENTARGUMENT"]);
                    break;
                case "is_obs_gyn_change":
                    is_obs_gyn_change(Request["__EVENTARGUMENT"]);
                    break;
                case "rad_tetanus_vaccination_change":
                    tetanus_vaccination_change(Request["__EVENTARGUMENT"]);
                    break;

            }
        }

        private void tetanus_vaccination_change(string v)
        {
            if (string.IsNullOrEmpty(v))
            {
                rad_tetanus_vaccination_false.Checked = rad_tetanus_vaccination_true.Checked = tetanus_vaccin_time_field.Visible = false;
                return;
            }

            WebHelpers.VisibleControl(Convert.ToBoolean(v), tetanus_vaccin_time_field);
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Functions
        private void UpdateData(Ogia ogia)
        {
            try
            {

                //I
                ogia.reason_admission = txt_reason_admission.Value;
                //II
                ogia.is_obs_gyn = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_is_obs_gyn_");

                if (ogia.is_obs_gyn == true)
                {
                    ogia.lmp_from = txt_lmp_from.Value;
                    ogia.lmp_to = txt_lmp_to.Value;

                    ogia.ges_age_weeks = DataHelpers.ConvertToInt(txt_ges_age_weeks.Value);

                    ogia.ges_age_days = DataHelpers.ConvertToInt(txt_ges_age_days.Value);

                    ogia.prenatal_visit = txt_prenatal_visit.Value;
                    ogia.tetanus_vaccination = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_tetanus_vaccination_");
                    ogia.tetanus_vaccin_time = txt_tetanus_vaccin_time.Value;
                    ogia.gbs_disease = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gbs_disease_");
                    ogia.gbs_bacteriuria = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gbs_bacteriuria_");
                    ogia.gbs_vaginal = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gbs_vaginal_");
                    ogia.ges_diabetes = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ges_diabetes_");
                    ogia.other_ges_abnormal = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_other_ges_abnormal_");
                    ogia.other_ges_abnormal_note = txt_other_ges_abnormal_note.Value;
                    ogia.labor_trig_at_time = DataHelpers.ConvertSQLDateTime(dtpk_labor_trig_at_time.SelectedDate);
                    ogia.preliminary_signs = txt_preliminary_signs.Value;
                    ogia.progression = txt_progression.Value;
                    ogia.obs_cur_medication = txt_obs_cur_medication.Value;
                    //III
                    //1
                    //2
                    //External exam
                    ogia.obs_pre_cicatrice = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_obs_pre_cicatrice_");
                    ogia.obs_uterine_shape = txt_obs_uterine_shape.Value;
                    ogia.obs_posture = txt_obs_posture.Value;
                    ogia.obs_fundal_height = txt_obs_fundal_height.Value;
                    ogia.obs_abdominal_circum = txt_obs_abdominal_circum.Value;
                    ogia.obs_uterine_con = txt_obs_uterine_con.Value;
                    ogia.obs_fetal_heart_rate = txt_obs_fetal_heart_rate.Value;
                    ogia.obs_breasts = txt_obs_breasts.Value;
                    //Internal exam
                    ogia.obs_vulva = txt_obs_vulva.Value;
                    ogia.obs_vagina = txt_obs_vagina.Value;
                    ogia.obs_perineum = txt_obs_perineum.Value;
                    ogia.obs_cervix = txt_obs_cervix.Value;
                    ogia.obs_adnexa = txt_obs_adnexa.Value;

                    ogia.obs_mem_condition_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_obs_mem_condition_code_", Ogia.OBS_MEM_CONDITION_CODE);
                    ogia.obs_mem_condition_desc = WebHelpers.GetDicDesc(ogia.obs_mem_condition_code, Ogia.OBS_MEM_CONDITION_CODE);

                    ogia.obs_mem_con_attri_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_obs_mem_con_attri_code_", Ogia.OBS_MEM_CON_ATTRI_CODE);
                    ogia.obs_mem_con_attri_desc = WebHelpers.GetDicDesc(ogia.obs_mem_con_attri_code, Ogia.OBS_MEM_CON_ATTRI_CODE);

                    ogia.obs_rup_of_mem_at = DataHelpers.ConvertSQLDateTime(dtpk_obs_rup_of_mem_at.SelectedDate);

                    ogia.obs_rup_of_mem_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_obs_rup_of_mem_code_", Ogia.OBS_RUP_OF_MEM_CODE);
                    ogia.obs_rup_of_mem_desc = WebHelpers.GetDicDesc(ogia.obs_rup_of_mem_code, Ogia.OBS_RUP_OF_MEM_CODE);

                    ogia.obs_feat_amniotic = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_obs_feat_amniotic_", Ogia.OBS_FEAT_AMNIOTIC);
                    ogia.obs_color_amniotic = txt_obs_color_amniotic.Value;
                    ogia.obs_presentation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_obs_presentation_code_", Ogia.OBS_PRESENTATION_CODE);
                    ogia.obs_presentation_desc = WebHelpers.GetDicDesc(ogia.obs_presentation_code, Ogia.OBS_PRESENTATION_CODE);

                    if (ogia.obs_presentation_code == "O")
                    { ogia.obs_presentation_other = txt_obs_presentation_other.Value; }

                    ogia.obs_fetal_position = txt_obs_fetal_position.Value;
                    ogia.obs_pelvic_exam = txt_obs_pelvic_exam.Value;
                    ogia.obs_bishop_score = txt_obs_bishop_score.Value;
                    //IV
                    //V

                    // set null
                    ogia.gyn_med_history = null;
                    ogia.gyn_cur_medication = null;
                    ogia.gyn_abdo_sur_scars = null;
                    ogia.gyn_reason = null;
                    ogia.gyn_uterine_height = null;
                    ogia.gyn_vulva = null;
                    ogia.gyn_perineum = null;
                    ogia.gyn_vagina = null;
                    ogia.gyn_discharge = null;
                    ogia.gyn_cervix = null;
                    //ogia.gyn_uterus = null;
                    ogia.gyn_adnexa = null;
                    ogia.gyn_douglas_pouchs = null;
                }
                else if (ogia.is_obs_gyn == false)
                {
                    //II
                    //1
                    ogia.gyn_med_history = txt_gyn_med_history.Value;
                    ogia.gyn_cur_medication = txt_gyn_cur_medication.Value;
                    //2
                    //3
                    //4
                    //III
                    //1
                    //2
                    //External exam
                    ogia.gyn_abdo_sur_scars = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_gyn_abdo_sur_scars_");
                    ogia.gyn_reason = txt_gyn_reason.Value;
                    ogia.gyn_uterine_height = txt_gyn_uterine_height.Value;
                    //Internal exam
                    ogia.gyn_vulva = txt_gyn_vulva.Value;
                    ogia.gyn_perineum = txt_gyn_perineum.Value;
                    ogia.gyn_vagina = txt_gyn_vagina.Value;
                    ogia.gyn_discharge = txt_gyn_discharge.Value;
                    ogia.gyn_cervix = txt_gyn_cervix.Value;
                    //ogia.gyn_uterus = txt_gyn_uterus ?
                    ogia.gyn_adnexa = txt_gyn_adnexa.Value;
                    ogia.gyn_douglas_pouchs = txt_gyn_douglas_pouchs.Value;

                    //set null
                    ogia.obs_cur_medication = null;
                    ogia.obs_pre_cicatrice = null;
                    ogia.obs_uterine_shape = null;
                    ogia.obs_posture = null;
                    ogia.obs_fundal_height = null;
                    ogia.obs_abdominal_circum = null;
                    ogia.obs_uterine_con = null;
                    ogia.obs_fetal_heart_rate = null;
                    ogia.obs_breasts = null;
                    ogia.obs_vulva = null;
                    ogia.obs_vagina = null;
                    ogia.obs_perineum = null;
                    ogia.obs_cervix = null;
                    ogia.obs_adnexa = null;
                    ogia.obs_mem_condition_code = null;
                    ogia.obs_mem_condition_desc = null;
                    ogia.obs_feat_amniotic = null;
                    ogia.obs_color_amniotic = null;
                    ogia.obs_presentation_code = null;
                    ogia.obs_presentation_desc = null;
                    ogia.obs_presentation_other = null;
                    ogia.obs_fetal_position = null;
                    ogia.obs_pelvic_exam = null;
                    ogia.obs_bishop_score = null;
                    ogia.labor_trig_at_time = null;
                }

                //2
                ogia.personal = txt_personal.Value;

                //Update v2.0
                ogia.infected_with_covid = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_infected_with_covid_");
                ogia.received_1_dose = cb_received_1_dose_true.Checked;
                ogia.received_2_dose = cb_received_2_dose_true.Checked;
                ogia.received_additional = cb_received_additional_true.Checked;
                ogia.other_vaccinations = txt_other_vaccinations.Value;
                ogia.not_yet_vaccinations = cb_not_yet_vaccinations_true.Checked;

                ogia.family = txt_family.Value;
                ogia.gyn_abdo_sur_scars = cb_gyn_abdo_sur_scars_true.Checked;

                //3
                ogia.age_of_menarhce = txt_age_of_menarhce.Value;
                ogia.menstrual_cycle = DataHelpers.ConvertToInt(txt_menstrual_cycle.Value);
                ogia.length_of_period = txt_length_of_period.Value;
                ogia.amount_mens_blood = txt_amount_mens_blood.Value;
                ogia.marriage_age = DataHelpers.ConvertToInt(txt_marriage_age.Value);
                ogia.age_menopause = txt_age_menopause.Value;
                ogia.previous_gyn_diseases = txt_previous_gyn_diseases.Value;
                //4
                ogia.obs_history = WebHelpers.GetDataGridView(grid_obs_history, Ogia.OBS_HISTORY);
                //III
                //1
                ogia.general_appearance = txt_general_appearance.Value;
                ogia.edema = cb_edema_true.Checked;
                ogia.edema_note = txt_edema_note.Value;
                ogia.cardio_system = txt_cardio_system.Value;
                ogia.respiratory_system = txt_respiratory_system.Value;
                ogia.digestive_system = txt_digestive_system.Value;

                ogia.nervous_system = txt_nervous_system.Value;
                ogia.uro_system = txt_uro_system.Value;
                ogia.mus_system = txt_mus_system.Value;
                ogia.otorhinolaryngology = txt_otorhinolaryngology.Value;
                ogia.integumentary_system = txt_integumentary_system.Value;
                ogia.ophthalmology = txt_ophthalmology.Value;
                ogia.other_findings = txt_other_findings.Value;
                ogia.psy_consul_required = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_psy_consul_required_");
                //IV
                //V
                ogia.lab_result = txt_lab_result.Value;
                ogia.add_investigations = txt_add_investigations.Value;
                ogia.initial_diagnosis = txt_initial_diagnosis.Value;
                ogia.diagnosis = txt_diagnosis.Value;
                ogia.diff_diagnosis = txt_diff_diagnosis.Value;
                ogia.associated_conditions = txt_associated_conditions.Value;
                ogia.treatment_plan = txt_treatment_plan.Value;
                ogia.discharge_plan = txt_discharge_plan.Value;

                if (JsonConvert.SerializeObject(ogia) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                ogia.amend_reason = txt_amend_reason.Text;
                ogia.user_name = (string)Session["UserID"];

                dynamic result = ogia.Update(loc)[0];

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
        private void obs_mem_condition_code_change(string args)
        {
            in_field.Visible = ru_field.Visible = false;
            if (args == null) return;
            switch (args.ToUpper())
            {
                case "IN":
                    in_field.Visible = true;
                    break;
                case "RU":
                    ru_field.Visible = true;
                    break;
            }
        }
        private void is_obs_gyn_change(dynamic is_obs_gyn)
        {
            if (is_obs_gyn == null) return;
            if (bool.Parse(Convert.ToString(is_obs_gyn)))
            {
                WebHelpers.VisibleControl(false, gynecology_field, gynecology_field1, gynecology_field2);
                WebHelpers.VisibleControl(true, obstetrics_field, obstetrics_field1, obstetrics_field2);
            }
            else
            {
                WebHelpers.VisibleControl(true, gynecology_field, gynecology_field1, gynecology_field2);
                WebHelpers.VisibleControl(false, obstetrics_field, obstetrics_field1, obstetrics_field2);
            }
        }
        private void Initial()
        {
            try
            {

                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);
                if (varDocIdLog != null)
                {
                    ogia = new Ogia(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    ogia = new Ogia(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                //loadRadGridHistoryLog();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Ogia.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);

                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

                if (ogia.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(ogia, WebHelpers.LoadFormControl(form1, ogia, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    lblPid.Text = varVPID;
                    BindingDataFormPrint(ogia);
                }
                else if (ogia.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(ogia, WebHelpers.LoadFormControl(form1, ogia, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                //WebHelpers.getAccessButtons(form1, ogia.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

                WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
                {
                    Form = form1,
                    DocStatus = ogia.status,
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
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }
        protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        {
            (sender as HyperLink).NavigateUrl = PAGE_URL;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/IPD/ObsGynIniAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&loc={loc}&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Console.WriteLine(Request.QueryString);

            string url = $"/IPD/ObsGynIniAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&loc={loc}";
            Response.Redirect(url);
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        #endregion

        #region Validation
        protected void is_obs_gyn_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_is_obs_gyn_false.Checked || rad_is_obs_gyn_true.Checked;
        }
        #endregion

        public class Obs_Feat_Amniotic
        {
            public string code { get; set; }
            public string desc { get; set; }
        }
        public class Multiple_Sex
        {
            public string cde { get; set; }
            public string desc { get; set; }
        }

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"], loc);

        }
        private void LoadBarCode()
        {
            IBarcodeGenerator barcodeGenerator = new BarcodeGenerator();
            BarCode.Controls.Clear();
            BarCode.Controls.Add(barcodeGenerator.Generator(patientInfo.visible_patient_id));
        }
    }
}
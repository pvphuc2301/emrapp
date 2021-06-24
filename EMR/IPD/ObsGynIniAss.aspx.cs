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

namespace EMR.IPD
{
    public partial class ObsGynIniAss : System.Web.UI.Page
    {
        #region Variables
        Ogia ogia;
        #endregion
        
        #region Page Lifecycle
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);
            if (!IsPostBack)
            {
                Initial();
            }
            PostBackEvent();
        }
        #endregion

        #region Binding Data
        private void BindingDataForm(Ogia ogia, ControlState state)
        {
            if(state == ControlState.Edit && DataHelpers._LOCATION == Session["location"])
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
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "localStorage_setItem", $"window.sessionStorage.setItem('{ogia}', '{JsonConvert.SerializeObject(ogia)}');", true);

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
                //gyn_med_history ? gyn_cur_medication
                txt_personal.Value = ogia.personal;
                txt_family.Value = ogia.family;
                txt_age_of_menarhce.Value = ogia.age_of_menarhce;
                txt_menstrual_cycle.Value = Convert.ToString(ogia.menstrual_cycle);
                txt_length_of_period.Value = ogia.length_of_period;
                txt_amount_mens_blood.Value = ogia.amount_mens_blood;
                txt_marriage_age.Value = Convert.ToString(ogia.marriage_age);
                txt_age_menopause.Value = ogia.age_menopause;
                txt_previous_gyn_diseases.Value = ogia.previous_gyn_diseases;
                //?obs_history

                WebHelpers.DataBind(grid_obs_history, WebHelpers.GetJSONToDataTable(ogia.obs_history));

                txt_general_appearance.Value = ogia.general_appearance;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_edema_true_", ogia.edema);

                txt_edema_note.Value = ogia.edema_note;
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
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_obs_pre_cicatrice_", ogia.obs_pre_cicatrice);

                txt_obs_uterine_shape.Value = ogia.obs_uterine_shape;
                txt_obs_posture.Value = ogia.obs_posture;
                txt_obs_fundal_height.Value = ogia.obs_fundal_height;
                txt_obs_abdominal_circum.Value = ogia.obs_abdominal_circum;
                txt_obs_uterine_con.Value = ogia.obs_uterine_con;
                txt_obs_fetal_heart_rate.Value = ogia.obs_fetal_heart_rate;
                txt_obs_breasts.Value = ogia.obs_breasts;

                txt_obs_vulva.Value = ogia.obs_vulva;
                txt_obs_vagina.Value = ogia.obs_vagina;
                txt_obs_perineum.Value = ogia.obs_perineum;
                txt_obs_cervix.Value = ogia.obs_cervix;
                txt_obs_adnexa.Value = ogia.obs_adnexa;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_obs_mem_condition_code_" + ogia.obs_mem_condition_code);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_obs_feat_amniotic_", ogia.obs_feat_amniotic);

                txt_obs_color_amniotic.Value = ogia.obs_color_amniotic;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_obs_presentation_code_" + ogia.obs_presentation_code);
                txt_obs_presentation_other.Value = ogia.obs_presentation_other;
                txt_obs_fetal_position.Value = ogia.obs_fetal_position;
                txt_obs_pelvic_exam.Value = ogia.obs_pelvic_exam;
                txt_obs_bishop_score.Value = ogia.obs_bishop_score;

                txt_lab_result.Value = ogia.lab_result;
                txt_add_investigations.Value = ogia.add_investigations;
                txt_initial_diagnosis.Value = ogia.initial_diagnosis;
                txt_diagnosis.Value = ogia.diagnosis;
                txt_diff_diagnosis.Value = ogia.diff_diagnosis;
                txt_associated_conditions.Value = ogia.associated_conditions;
                txt_treatment_plan.Value = ogia.treatment_plan;
                txt_discharge_plan.Value = ogia.discharge_plan;

            } catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Ogia ogia)
        {
            try { 

                lbl_reason_admission.Text = WebHelpers.GetValue(ogia.reason_admission);
                lbl_is_obs_gyn.Text = WebHelpers.GetValue(WebHelpers.GetBool(ogia.is_obs_gyn, "SẢN KHOA/ OBSTETRICS", "PHỤ KHOA/ GYNECOLOGY"));

                if (ogia.is_obs_gyn)
                {
                    lbl_lmp_from.Text = WebHelpers.FormatString(ogia.lmp_from);
                    lbl_lmp_to.Text = WebHelpers.FormatString(ogia.lmp_to);
                    lbl_ges_age_weeks.Text = $"{WebHelpers.FormatString(ogia.ges_age_weeks.ToString())} tuần/ weeks {WebHelpers.FormatString(ogia.ges_age_days.ToString())} ngày/ days";
                    lbl_prenatal_visit.Text = WebHelpers.FormatString(ogia.prenatal_visit);
                    lbl_tetanus_vaccination.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.tetanus_vaccination, $"Có/ Yes {WebHelpers.FormatString(ogia.tetanus_vaccin_time)} lần/ times"));
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
                    //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_obs_pre_cicatrice_" + ogia.obs_pre_cicatrice);
                    lbl_obs_pre_cicatrice.Text = WebHelpers.GetValue(WebHelpers.GetBool(ogia.obs_pre_cicatrice, "Yes", "No"));
                    lbl_obs_uterine_shape.Text = WebHelpers.GetValue(ogia.obs_uterine_shape);
                    lbl_obs_posture.Text = WebHelpers.GetValue(ogia.obs_posture) + " cm";
                    lbl_obs_fundal_height.Text = WebHelpers.GetValue(ogia.obs_fundal_height) + " cm";
                    lbl_obs_abdominal_circum.Text = WebHelpers.GetValue(ogia.obs_abdominal_circum);
                    lbl_obs_uterine_con.Text = WebHelpers.GetValue(ogia.obs_uterine_con);
                    lbl_obs_fetal_heart_rate.Text = WebHelpers.GetValue(ogia.obs_fetal_heart_rate) + " lần/phút/ bpm";
                    lbl_obs_breasts.Text = WebHelpers.GetValue(ogia.obs_breasts);

                    //
                    lbl_obs_vulva.Text = WebHelpers.GetValue(ogia.obs_vulva);
                    lbl_obs_vagina.Text = WebHelpers.GetValue(ogia.obs_vagina);
                    lbl_obs_perineum.Text = WebHelpers.GetValue(ogia.obs_perineum);
                    lbl_obs_cervix.Text = WebHelpers.GetValue(ogia.obs_cervix);
                    lbl_obs_adnexa.Text = WebHelpers.GetValue(ogia.obs_adnexa);

                    //lbl_obs_mem_condition_code

                    lbl_obs_feat_amniotic.Text = WebHelpers.GetValue(WebHelpers.DisplayCheckBox(ogia.obs_feat_amniotic));

                    lbl_obs_color_amniotic.Text = WebHelpers.GetValue(ogia.obs_color_amniotic);

                    lbl_obs_presentation_code.Text = ogia.obs_presentation_desc + (ogia.obs_presentation_code == "OTH" ? WebHelpers.GetValue(ogia.obs_presentation_other) : "");

                    lbl_obs_fetal_position.Text = WebHelpers.GetValue(ogia.obs_adnexa);
                    lbl_obs_pelvic_exam.Text = WebHelpers.GetValue(ogia.obs_adnexa);
                    lbl_obs_bishop_score.Text = WebHelpers.GetValue(ogia.obs_adnexa) + " điểm/ points";

                    WebHelpers.VisibleControl(false, gynecology_field, gynecology_field1, gynecology_field2);
                }
                else
                {
                    lbl_gyn_med_history.Text = WebHelpers.GetValue(ogia.gyn_med_history);
                    lbl_gyn_cur_medication.Text = WebHelpers.GetValue(ogia.gyn_cur_medication);
                    
                    //2
                    //External exam
                    lbl_gyn_abdo_sur_scars.Text = WebHelpers.FormatString(WebHelpers.GetBool(ogia.gyn_abdo_sur_scars));
                    lbl_gyn_reason.Text = WebHelpers.GetValue(ogia.gyn_reason);
                    lbl_gyn_uterine_height.Text = WebHelpers.GetValue(ogia.gyn_uterine_height);
                    //Internal Examination
                    lbl_gyn_vulva.Text = WebHelpers.GetValue(ogia.gyn_vulva);
                    lbl_gyn_perineum.Text = WebHelpers.GetValue(ogia.gyn_perineum);
                    lbl_gyn_vagina.Text = WebHelpers.GetValue(ogia.gyn_vagina);
                    lbl_gyn_discharge.Text = WebHelpers.GetValue(ogia.gyn_discharge);
                    lbl_gyn_cervix.Text = WebHelpers.GetValue(ogia.gyn_cervix);
                    lbl_gyn_adnexa.Text = WebHelpers.GetValue(ogia.gyn_adnexa);
                    lbl_gyn_douglas_pouchs.Text = WebHelpers.GetValue(ogia.gyn_douglas_pouchs);
                }
                //2
                lbl_personal.Text = WebHelpers.GetValue(ogia.personal);
                lbl_family.Text = WebHelpers.GetValue(ogia.family);
                //3
                lbl_age_of_menarhce.Text = WebHelpers.FormatString(ogia.age_of_menarhce);
                lbl_menstrual_cycle.Text = WebHelpers.FormatString(ogia.menstrual_cycle.ToString());
                lbl_length_of_period.Text = WebHelpers.FormatString(ogia.length_of_period);
                lbl_amount_mens_blood.Text = WebHelpers.FormatString(ogia.amount_mens_blood);
                lbl_marriage_age.Text = WebHelpers.FormatString(ogia.marriage_age.ToString());
                lbl_age_menopause.Text = WebHelpers.FormatString(ogia.age_menopause);
                lbl_previous_gyn_diseases.Text = WebHelpers.FormatString(ogia.previous_gyn_diseases);
                //4.
                ViewState[grid_obs_history.ID] = WebHelpers.DataBind(grid_obs_history, WebHelpers.GetJSONToDataTable(ogia.obs_history));
                
                //III.
                lbl_general_appearance.Text = WebHelpers.GetValue(ogia.general_appearance);
                lbl_edema.Text = WebHelpers.GetBool(ogia.edema, "Yes", "No");
                lbl_edema_note.Text = WebHelpers.GetValue(ogia.edema_note);
                lbl_cardio_system.Text = WebHelpers.GetValue(ogia.cardio_system);
                lbl_respiratory_system.Text = WebHelpers.GetValue(ogia.respiratory_system);
                lbl_digestive_system.Text = WebHelpers.GetValue(ogia.digestive_system);
                lbl_uro_system.Text = WebHelpers.GetValue(ogia.uro_system);
                lbl_mus_system.Text = WebHelpers.GetValue(ogia.mus_system);
                lbl_otorhinolaryngology.Text = WebHelpers.GetValue(ogia.otorhinolaryngology);
                lbl_integumentary_system.Text = WebHelpers.GetValue(ogia.integumentary_system);
                lbl_ophthalmology.Text = WebHelpers.GetValue(ogia.ophthalmology);
                lbl_other_findings.Text = WebHelpers.GetValue(ogia.other_findings);
                lbl_psy_consul_required.Text = WebHelpers.GetValue(WebHelpers.GetBool(ogia.psy_consul_required, "Yes", "No"));

                //IV
                lbl_lab_result.Text = WebHelpers.GetValue(ogia.lab_result);
                lbl_add_investigations.Text = WebHelpers.GetValue(ogia.add_investigations);
                //V
                lbl_initial_diagnosis.Text = WebHelpers.GetValue(ogia.initial_diagnosis);
                lbl_diagnosis.Text = WebHelpers.GetValue(ogia.diagnosis);
                lbl_diff_diagnosis.Text = WebHelpers.GetValue(ogia.diff_diagnosis);
                lbl_associated_conditions.Text = WebHelpers.GetValue(ogia.associated_conditions);
                lbl_treatment_plan.Text = WebHelpers.GetValue(ogia.treatment_plan);
                lbl_discharge_plan.Text = WebHelpers.GetValue(ogia.discharge_plan);

            } catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }

        }
        private void BindingDataFormPrint(Ogia ogia)
        {
            Patient patient = Patient.Instance();
            //prt_pid.Text = prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;

            //prt_fullname.Text = patient.GetFullName();

            //prt_diagnosis.Text = uusr.diagnosis;
            //prt_left_kidney.Text = uusr.left_kidney;
            //prt_right_kidney.Text = uusr.right_kidney;
            //prt_urinary_bladder.Text = uusr.urinary_bladder;
            //prt_prostate.Text = uusr.prostate;
            //prt_post_void_resi_volume.Text = uusr.post_void_resi_volume;
            //prt_conclusion.Text = uusr.conclusion;
            //prt_recommendation.Text = uusr.recommendation;

        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ogia = new Ogia(DataHelpers.varDocId);
                ogia.status = DocumentStatus.FINAL;
                ogia.user_name = (string)Session["UserID"];

                UpdateData(ogia);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ogia = new Ogia(DataHelpers.varDocId);
                ogia.status = DocumentStatus.DRAFT;
                ogia.user_name = (string)Session["UserID"];

                UpdateData(ogia);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Ogia.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                WebHelpers.SendError(Page, result.ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            ogia = new Ogia(Request.QueryString["docId"]);
            txt_amend_reason.Text = "";
            WebHelpers.VisibleControl(false, btnAmend, btnPrint);
            WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

            //load form control
            WebHelpers.LoadFormControl(form1, ogia, ControlState.Edit, (string)Session["location"]);
            //binding data
            BindingDataFormEdit(ogia);
            //get access button
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ogia = new Ogia(Request.QueryString["docId"]);
            BindingDataFormPrint(ogia);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
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
            }
        }
        #endregion

        #region Functions
        private void UpdateData(Ogia ogia)
        {
            try
            {
                ogia.amend_reason = txt_amend_reason.Text;
                //I
                ogia.reason_admission = txt_reason_admission.Value;
                //II
                ogia.is_obs_gyn = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_is_obs_gyn_");
                
                if(ogia.is_obs_gyn == true)
                {
                    ogia.lmp_from = txt_lmp_from.Value;
                    ogia.lmp_to = txt_lmp_to.Value;
                    ogia.ges_age_weeks = int.Parse(txt_ges_age_weeks.Value);
                    ogia.ges_age_days = int.Parse(txt_ges_age_days.Value);
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
                    if (ogia.obs_mem_condition_code != null) ogia.obs_mem_condition_desc = Ogia.OBS_MEM_CONDITION_CODE[ogia.obs_mem_condition_code];
                    ogia.obs_feat_amniotic = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_obs_feat_amniotic_", Ogia.OBS_FEAT_AMNIOTIC);
                    ogia.obs_color_amniotic = txt_obs_color_amniotic.Value;
                    ogia.obs_presentation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_obs_presentation_code_", Ogia.OBS_PRESENTATION_CODE);
                    if (ogia.obs_presentation_code != null) ogia.obs_presentation_desc = Ogia.OBS_PRESENTATION_CODE[ogia.obs_presentation_code];
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
                else if(ogia.is_obs_gyn == false)
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
                ogia.family = txt_family.Value;
                ogia.gyn_abdo_sur_scars = cb_gyn_abdo_sur_scars_true.Checked;

                //3
                ogia.age_of_menarhce = txt_age_of_menarhce.Value;
                ogia.menstrual_cycle = int.Parse(txt_menstrual_cycle.Value);
                ogia.length_of_period = txt_length_of_period.Value;
                ogia.amount_mens_blood = txt_amount_mens_blood.Value;
                ogia.marriage_age = int.Parse(txt_marriage_age.Value);
                ogia.age_menopause = txt_age_menopause.Value;
                ogia.previous_gyn_diseases = txt_previous_gyn_diseases.Value;
                //4
                ogia.obs_history = WebHelpers.GetDataGridView(grid_obs_history, Ogia.OBS_HISTORY);
                //III
                //1
                ogia.general_appearance = txt_general_appearance.Value;
                ogia.edema = txt_edema_note.Value;
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

                dynamic result = ogia.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);
                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void obs_mem_condition_code_change(dynamic args)
        {
            in_field.Visible = ru_field.Visible = false;
            switch (args)
            {
                case "in":
                    in_field.Visible = true;
                    break;
                case "ru":
                    ru_field.Visible = true;
                    break;
            }
        }
        private void is_obs_gyn_change(dynamic is_obs_gyn)
        {
            if (bool.Parse(is_obs_gyn.ToString()))
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
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                ogia = new Ogia(Request.QueryString["docId"]);

                //prt_barcode.Text = Patient.Instance().visible_patient_id;
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper, ru_field, in_field);
                is_obs_gyn_change(ogia.is_obs_gyn);

                if (ogia.status == DocumentStatus.FINAL)
                {
                    WebHelpers.LoadFormControl(form1, ogia, ControlState.View, (string)Session["location"]);
                    BindingDataForm(ogia, ControlState.View);

                    //WebHelpers.VisibleControl(false, btnComplete, btnSave, btnDeleteModal);
                    //WebHelpers.VisibleControl(true, btnAmend, btnPrint);
                }
                else if (ogia.status == DocumentStatus.DRAFT)
                {
                    WebHelpers.LoadFormControl(form1, ogia, ControlState.Edit, (string)Session["location"]);
                    BindingDataForm(ogia, ControlState.Edit);

                    //WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                    //WebHelpers.VisibleControl(true, btnComplete, btnSave, btnDeleteModal);
                }

                //WebHelpers.getAccessForm(form1, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion

        #region Validation
        protected void is_obs_gyn_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_is_obs_gyn_false.Checked || rad_is_obs_gyn_true.Checked;
        }
        #endregion

    }
}
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
        Ogia ogia;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initial();
            }
        }

        private void Initial()
        {
            ogia = new Ogia(Request.QueryString["docId"]);
            loadDataToControls(ogia);
        }

        private void loadDataToControls(Ogia ogia)
        {
            txt_reason_admission.Value = ogia.reason_admission;
            BindRadioButton("rad_is_obs_gyn_" + ogia.is_obs_gyn);
            txt_lmp_from.Value = ogia.lmp_from;
            txt_lmp_to.Value = ogia.lmp_to;
            txt_ges_age_days.Value = Convert.ToString(ogia.ges_age_days);
            txt_ges_age_weeks.Value = Convert.ToString(ogia.ges_age_weeks);
            txt_prenatal_visit.Value = ogia.prenatal_visit;
            BindRadioButton("rad_tetanus_vaccination_" + ogia.tetanus_vaccination);
            txt_tetanus_vaccin_time.Value = ogia.tetanus_vaccin_time;
            BindRadioButton("rad_gbs_disease_" + ogia.gbs_disease);
            BindRadioButton("rad_gbs_bacteriuria_" + ogia.gbs_bacteriuria);
            BindRadioButton("rad_gbs_vaginal_" + ogia.gbs_vaginal);
            BindRadioButton("rad_ges_diabetes_" + ogia.ges_diabetes);
            BindRadioButton("rad_other_ges_abnormal_" + ogia.other_ges_abnormal);
            txt_other_ges_abnormal_note.Value = ogia.other_ges_abnormal_note;
            WebHelpers.BindDateTimePicker(dtpk_labor_trig_at_time, ogia.labor_trig_at_time);
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

            _BindGridView(grid_obs_history, WebHelpers.GetJSONToDataTable(ogia.obs_history));

            txt_general_appearance.Value = ogia.general_appearance;
            BindCheckBox("cb_edema_true_" + ogia.edema);
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
            BindRadioButton("rad_psy_consul_required_" + ogia.psy_consul_required);


            BindCheckBox("cb_obs_pre_cicatrice_" + ogia.obs_pre_cicatrice);
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

            BindRadioButton("rad_obs_mem_condition_code_" + ogia.obs_mem_condition_code);

            BindCheckBox("cb_obs_feat_amniotic_", ogia.obs_feat_amniotic);


            txt_obs_color_amniotic.Value = ogia.obs_color_amniotic;
            BindRadioButton("rad_obs_presentation_code_" + ogia.obs_presentation_code);
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

            btnCancel.Visible = false;
            txt_amendReason.Visible = false;

            if (ogia.status == DocumentStatus.FINAL)
            {
                loadDataToFormPrint(ogia);

                btnComplete.Visible = false;
                btnSave.Visible = false;
                btnDeleteModal.Visible = false;

                btnAmend.Visible = true;
                btnPrint.Visible = true;

                DisabledControl(true);
            }
            else if (ogia.status == DocumentStatus.DRAFT)
            {

                btnAmend.Visible = false;
                btnPrint.Visible = false;
            }
        }

        private void loadDataToFormPrint(Ogia ogia)
        {
            //prt_reason_admission.Text = string.Format("{0}", string.IsNullOrEmpty(ogia.reason_admission) ? "Không" : ogia.reason_admission);
            //if (ogia.is_obs_gyn != null)
            //{
            //    prt_is_obs_gyn.Text = string.Format("{0}", ogia.is_obs_gyn ? "Sản khoa/ Obstetrics" : "Phụ khoa/ Gynecology");
            //}

            //lbl_labor_trig_at_time.Text = string.Format("{0} giờ/ hour {1} phút/minute,ngày/ date {2}/{3}/{4}", 1, 2, 3, 4, 5);
            //prt_preliminary_signs.Text = ogia.preliminary_signs;

            //if (ogia.tetanus_vaccination != null)
            //{
            //    prt_tetanus_vaccination_true.Text = string.Format("{0} Có/yes, {1} Lần/times", ogia.tetanus_vaccination ? "☒" : "❏", ogia.tetanus_vaccin_time);

            //    prt_tetanus_vaccination_false.Text = string.Format("{0} Chưa/ Not yet", !ogia.tetanus_vaccination ? "☒" : "❏");
            //}
            //if (ogia.gbs_disease != null)
            //{
            //    prt_gbs_disease_true.Text = string.Format("{0} Có/ Yes", ogia.gbs_disease ? "☒" : "❏");

            //    prt_gbs_disease_false.Text = string.Format("{0} Không/ No", !ogia.gbs_disease ? "☒" : "❏");
            //}
            //if (ogia.gbs_bacteriuria != null)
            //{
            //    prt_gbs_bacteriuria_true.Text = string.Format("{0} Có/ Yes", ogia.gbs_bacteriuria ? "☒" : "❏");

            //    prt_gbs_bacteriuria_false.Text = string.Format("{0} Không/ No", !ogia.gbs_bacteriuria ? "☒" : "❏");
            //}

            //if (ogia.gbs_vaginal != null)
            //{
            //    prt_gbs_vaginal_true.Text = string.Format("{0} Có/ Yes", ogia.gbs_vaginal ? "☒" : "❏");

            //    prt_gbs_vaginal_false.Text = string.Format("{0} Không/ No", !ogia.gbs_vaginal ? "☒" : "❏");
            //}

            //if (ogia.ges_diabetes != null)
            //{
            //    prt_ges_diabetes_true.Text = string.Format("{0} Có/ Yes", ogia.ges_diabetes ? "☒" : "❏");

            //    prt_ges_diabetes_false.Text = string.Format("{0} Không/ No", !ogia.ges_diabetes ? "☒" : "❏");
            //}

            //if (ogia.other_ges_abnormal != null)
            //{
            //    prt_other_ges_abnormal_true.Text = string.Format("{0} Có/ Yes", ogia.other_ges_abnormal ? "☒" : "❏");

            //    prt_other_ges_abnormal_false.Text = string.Format("{0} Không/ No", !ogia.other_ges_abnormal ? "☒" : "❏");
            //}
            
            //prt_progression.Text = ogia.progression;
            //prt_obs_cur_medication.Text = ogia.obs_cur_medication;

            //prt_personal.Text = ogia.personal;
            //prt_family.Text = ogia.family;
            
            //prt_age_menopause.InnerHtml = ogia.age_menopause;
            //prt_previous_gyn_diseases.InnerHtml = ogia.previous_gyn_diseases;

            //prt_age_of_menarche.InnerHtml = string.Format("- Tuổi dậy thì/ Age of menarche: {0}, Chu kỳ kinh/ Menstrual cycle: {1} ngày/ day(s). Số ngày hành kinh/ Length of period: {2} ngày / day(s), Lượng máu kinh / Amount of menstrual blood: {3}", ogia.age_of_menarhce, ogia.menstrual_cycle, ogia.length_of_period, ogia.amount_mens_blood);

            //prt_marriage_age.InnerHtml = ogia.marriage_age == null ? null : string.Format("- Tuổi kết hôn/ Marriage age: {0}", Convert.ToString(ogia.marriage_age));

            //prt_age_menopause.InnerHtml = ogia.age_menopause == null ? null : string.Format("- Tuổi mãn kinh/ Age of menopause: {0}", ogia.age_menopause);

            //prt_previous_gyn_diseases.InnerHtml = string.Format("- Những bệnh phụ khoa đã mắc trước đây/ Previous gynecological diseases: {0}", ogia.previous_gyn_diseases);


            //prt_general_appearance.InnerHtml = string.Format("");
            //prt_edema_true.InnerHtml = string.Format("{0} Có, chi tiết/ Yes, specify", ogia.edema ? "☒" : "❏");
            //prt_edema_false.InnerHtml = string.Format("{0} Không/ No", !ogia.edema ? "☒" : "❏");


        }

        private void DisabledControl(bool disabled)
        {
            txt_reason_admission.Disabled = disabled;
            rad_is_obs_gyn_false.Disabled = disabled;
        }

        private void _BindGridView(GridView gridView, DataTable dataSource)
        {
            try
            {
                if (dataSource != null)
                {
                    ViewState[gridView.ID] = dataSource;
                    gridView.DataSource = (DataTable)ViewState[gridView.ID];
                    gridView.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void BindCheckBox(string value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputCheckBox)FindControl(value)).Checked = true;
            }
        }
        public void BindCheckBox(string cb_name, string value, string key = "code")
        {
            if (value != null && cb_name != null)
            {
                foreach (DataRow row in WebHelpers.GetJSONToDataTable(value).Rows)
                {
                    try
                    {
                        ((HtmlInputCheckBox)FindControl(cb_name + row.Field<dynamic>(key).ToLower())).Checked = true;
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }
        public void BindRadioButton(dynamic value)
        {
            if (FindControl(value) != null)
            {
                ((HtmlInputRadioButton)FindControl(value)).Checked = true;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Ogia.Delete((string)Session["UserId"], Request.QueryString["docId"])[0].Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                ogia = new Ogia(Request.QueryString["docId"]);

                ogia.user_name = (string)Session["UserID"];
                ogia.status = DocumentStatus.DRAFT;

                UpdateData(ogia);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        private void UpdateData(Ogia ogia)
        {
            try
            {
                ogia.amend_reason = txt_amendReason.Value;
                ogia.reason_admission = txt_reason_admission.Value;
                ogia.is_obs_gyn = GetRadioButton("rad_is_obs_gyn_");

                if(ogia.is_obs_gyn == true)
                {
                    ogia.lmp_from = txt_lmp_from.Value;
                    ogia.lmp_to = txt_lmp_to.Value;
                    ogia.ges_age_weeks = int.Parse(txt_ges_age_weeks.Value);
                    ogia.ges_age_days = int.Parse(txt_ges_age_days.Value);
                    ogia.prenatal_visit = txt_prenatal_visit.Value;
                    ogia.tetanus_vaccination = GetRadioButton("rad_tetanus_vaccination_");
                    ogia.tetanus_vaccin_time = txt_tetanus_vaccin_time.Value;
                    ogia.gbs_disease = GetRadioButton("rad_gbs_disease_");
                    ogia.gbs_bacteriuria = GetRadioButton("rad_gbs_bacteriuria_");
                    ogia.gbs_vaginal = GetRadioButton("rad_gbs_vaginal_");
                    ogia.ges_diabetes = GetRadioButton("rad_ges_diabetes_");
                    ogia.other_ges_abnormal = GetRadioButton("rad_other_ges_abnormal_");
                    ogia.other_ges_abnormal_note = txt_other_ges_abnormal_note.Value;
                    ogia.labor_trig_at_time = DataHelpers.ConvertSQLDateTime(dtpk_labor_trig_at_time.SelectedDate);
                    ogia.preliminary_signs = txt_preliminary_signs.Value;
                    ogia.progression = txt_progression.Value;
                    ogia.obs_cur_medication = txt_obs_cur_medication.Value;
                    ogia.personal = txt_personal.Value;
                    ogia.family = txt_family.Value;
                    ogia.age_of_menarhce = txt_age_of_menarhce.Value;
                    ogia.menstrual_cycle = int.Parse(txt_menstrual_cycle.Value);
                    ogia.length_of_period = txt_length_of_period.Value;
                    ogia.amount_mens_blood = txt_amount_mens_blood.Value;
                    ogia.marriage_age = int.Parse(txt_marriage_age.Value);
                    ogia.age_menopause = txt_age_menopause.Value;
                    ogia.previous_gyn_diseases = txt_previous_gyn_diseases.Value;

                    ogia.obs_history = WebHelpers.GetJSONFromTable(grid_obs_history, Ogia.OBS_HISTORY);

                    ogia.general_appearance = txt_general_appearance.Value;
                    ogia.edema = txt_edema_note.Value;
                    ogia.edema = GetCheckBox("rad_edema_");
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
                    ogia.psy_consul_required = GetRadioButton("rad_psy_consul_required_");
                    ogia.obs_pre_cicatrice = GetCheckBox("cb_obs_pre_cicatrice_");
                    ogia.obs_uterine_shape = txt_obs_uterine_shape.Value;
                    ogia.obs_posture = txt_obs_posture.Value;
                    ogia.obs_fundal_height = txt_obs_fundal_height.Value;
                    ogia.obs_abdominal_circum = txt_obs_abdominal_circum.Value;
                    ogia.obs_uterine_con = txt_obs_uterine_con.Value;
                    ogia.obs_fetal_heart_rate = txt_obs_fetal_heart_rate.Value;
                    ogia.obs_breasts = txt_obs_breasts.Value;
                    ogia.obs_vulva = txt_obs_vulva.Value;
                    ogia.obs_vagina = txt_obs_vagina.Value;
                    ogia.obs_perineum = txt_obs_perineum.Value;
                    ogia.obs_cervix = txt_obs_cervix.Value;
                    ogia.obs_adnexa = txt_obs_adnexa.Value;
                    ogia.obs_mem_condition_code = GetRadioButton("rad_obs_mem_condition_code_", Ogia.OBS_MEM_CONDITION_CODE);
                    if (ogia.obs_mem_condition_code != null) ogia.obs_mem_condition_desc = Ogia.OBS_MEM_CONDITION_CODE[ogia.obs_mem_condition_code];
                    ogia.obs_feat_amniotic = GetCheckBox("cb_obs_feat_amniotic_", Ogia.OBS_FEAT_AMNIOTIC);
                    ogia.obs_color_amniotic = txt_obs_color_amniotic.Value;
                    ogia.obs_presentation_code = GetRadioButton("rad_obs_presentation_code_", Ogia.OBS_PRESENTATION_CODE);
                    if (ogia.obs_presentation_code != null) ogia.obs_presentation_desc = Ogia.OBS_PRESENTATION_CODE[ogia.obs_presentation_code];
                    if (ogia.obs_presentation_code == "O")
                    { ogia.obs_presentation_other = txt_obs_presentation_other.Value; }
                    
                    ogia.obs_fetal_position = txt_obs_fetal_position.Value;
                    ogia.obs_pelvic_exam = txt_obs_pelvic_exam.Value;
                    ogia.obs_bishop_score = txt_obs_bishop_score.Value;
                    ogia.lab_result = txt_lab_result.Value;
                    ogia.add_investigations = txt_add_investigations.Value;
                    ogia.initial_diagnosis = txt_initial_diagnosis.Value;
                    ogia.diagnosis = txt_diagnosis.Value;
                    ogia.diff_diagnosis = txt_diff_diagnosis.Value;
                    ogia.associated_conditions = txt_associated_conditions.Value;
                    ogia.treatment_plan = txt_treatment_plan.Value;
                    ogia.discharge_plan = txt_discharge_plan.Value;

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
                    ogia.gyn_med_history = txt_gyn_med_history.Value;
                    ogia.gyn_cur_medication = txt_gyn_cur_medication.Value;
                    ogia.gyn_abdo_sur_scars = GetCheckBox("cb_gyn_abdo_sur_scars_");
                    ogia.gyn_reason = txt_gyn_reason.Value;
                    ogia.gyn_uterine_height = txt_gyn_uterine_height.Value;
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
                }

                dynamic result = ogia.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);
                }
                else
                {
                    Session["PageNotFound"] = result;
                    Response.Redirect("../Other/PageNotFound.aspx", false);
                }
            }
            catch (Exception ex)
            {

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
        private dynamic GetRadioButton(string radio_name, Dictionary<string, string> value)
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
        private string checkValidField()
        {
            string errors = "";
            return errors;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {

        }

        private dynamic GetRadioButton(string radio_name)
        {
            if (((HtmlInputRadioButton)FindControl(radio_name + "true")).Checked)
            {
                return true;
            }
            else if (((HtmlInputRadioButton)FindControl(radio_name + "false")).Checked)
            {
                return false;
            }
            else { return null; }
        }
    }
}
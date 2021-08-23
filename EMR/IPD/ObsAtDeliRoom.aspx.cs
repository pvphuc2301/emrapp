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
        #endregion

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

            PAGE_URL = $"/IPD/ObsAtDeliRoom.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Oadr oadr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(oadr);
            }
            else
            {
                BindingDataFormView(oadr);
            }
        }
        private void BindingDataFormEdit(Oadr oadr)
        {
            try
            {
                txt_amend_reason.Text = "";
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

                WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_singleton_sex_code_" + oadr.singleton_sex_code);
                
                WebHelpers.DataBind(form2, new HtmlInputCheckBox(), "cb_multiple_sex_", WebHelpers.GetJSONToDataTable(oadr.multiple_sex), "cde");

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
                txt_placenta_weight.Value = oadr.placenta_weight;
                //
                WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_umbilical_coil_" + oadr.umbilical_coil);
                txt_umbilical_length.Value = oadr.umbilical_length;
                txt_blood_loss.Value = oadr.blood_loss;
                //
                WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_p_intervention_" + oadr.p_intervention);
                txt_p_intervention_note.Value = WebHelpers.TextToHtmlTag(oadr.p_intervention_note);
                //3
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
                }
                else if (oadr.delivery_mode_code == "V")
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
                txt_preo_diagnosis.Value = WebHelpers.TextToHtmlTag(oadr.preo_diagnosis);
                txt_post_diagnosis.Value = WebHelpers.TextToHtmlTag(oadr.post_diagnosis);
                //
                ViewState[grid_operations.ID] = WebHelpers.BindingDataGridView(grid_operations, WebHelpers.GetJSONToDataTable(oadr.operations), Oadr.OPERATION, btn_grid_operations_add);
                //
                WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_sur_incident_" + oadr.sur_incident);
                txt_sur_incident_note.Value = WebHelpers.TextToHtmlTag(oadr.sur_incident_note);
                WebHelpers.DataBind(form2, new HtmlInputRadioButton(), "rad_sur_complication_" + oadr.sur_incident);
                txt_sur_complication_note.Value = WebHelpers.TextToHtmlTag(oadr.sur_complication_note);
                //5
                txt_treatment_plan.Value = WebHelpers.TextToHtmlTag(oadr.treatment_plan);

                Session["docid"] = oadr.document_id;
                WebHelpers.AddScriptFormEdit(Page, oadr, (string)Session["emp_id"], loc);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        private void BindingDataFormView(Oadr oadr)
        {
            try
            {
                lbl_admis_delivery.Text = WebHelpers.FormatDateTime(oadr.admis_delivery, "dd-MM-yyyy HH:mm");
                lbl_obs_name.Text = WebHelpers.TextToHtmlTag(oadr.obs_name);
                lbl_obs_initial.Text = WebHelpers.TextToHtmlTag(oadr.obs_initial);
                lbl_delivery_at.Text = WebHelpers.FormatDateTime(oadr.delivery_at, "dd-MM-yyyy HH:mm");
                lbl_apgar_score_1.Text = WebHelpers.TextToHtmlTag(oadr.apgar_score_1) + " điểm/ points";
                lbl_apgar_score_5.Text = WebHelpers.TextToHtmlTag(oadr.apgar_score_5) + " điểm/ points";
                lbl_apgar_score_10.Text = WebHelpers.TextToHtmlTag(oadr.apgar_score_10) + " điểm/ points";

                lbl_weight_of_birth.Text = WebHelpers.TextToHtmlTag(oadr.weight_of_birth) + " gram";
                lbl_length_of_birth.Text = WebHelpers.TextToHtmlTag(oadr.length_of_birth) + " cm";
                lbl_head_circum.Text = WebHelpers.TextToHtmlTag(oadr.head_circum) + " cm";

                lbl_singleton_sex_code.Text = WebHelpers.TextToHtmlTag(oadr.singleton_sex_desc);
                lbl_multiple_sex.Text = WebHelpers.DisplayCheckBox(oadr.multiple_sex);

                lbl_birth_defect.Text = WebHelpers.GetBool(oadr.birth_defect, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(oadr.birth_defect_note));

                lbl_neonatal_status.Text = WebHelpers.TextToHtmlTag(oadr.neonatal_status);

                lbl_intervention.Text = WebHelpers.GetBool(oadr.intervention, "Có, ghi rõ/ Yes, specify: " + WebHelpers.TextToHtmlTag(oadr.intervention_note));

                //2. Sổ nhau/ Placenta delivery

                lbl_placenta_deli.Text = WebHelpers.GetBool(oadr.placenta_deli, "Bằng tay/ Manual", "Tự nhiên/ Spontaneous");
                lbl_pacental_deli_dt.Text = WebHelpers.FormatDateTime(oadr.pacental_deli_dt, "dd-MM-yyyy HH:mm");

                lbl_placenta_deli_mode.Text = WebHelpers.TextToHtmlTag(oadr.placenta_deli_mode);
                lbl_placenta_weight.Text = WebHelpers.TextToHtmlTag(oadr.placenta_weight) + " gram";

                lbl_umbilical_coil.Text = WebHelpers.GetBool(oadr.umbilical_coil);

                lbl_umbilical_length.Text = oadr.umbilical_length + " cm";
                lbl_blood_loss.Text = oadr.blood_loss + " ml";

                lbl_p_intervention.Text = WebHelpers.GetBool(oadr.p_intervention, "Có, chi tiết/ Yes, specify: " + WebHelpers.TextToHtmlTag(oadr.p_intervention_note));

                //3.
                lbl_spO2.Text = oadr.spO2 + " %";
                lbl_temp.Text = oadr.temp + " °C";
                lbl_BP.Text = oadr.bp + " mmHg";
                lbl_HR.Text = oadr.hr + " lần/phút/ bpm";
                lbl_RR.Text = oadr.rr + " lần/phút/ bpm";
                lbl_delivery_mode_desc.Text = WebHelpers.TextToHtmlTag(oadr.delivery_mode_desc);
                lbl_interven_reason.Text = WebHelpers.TextToHtmlTag(oadr.interven_reason);

                lbl_pre_intact.Text = WebHelpers.GetBool(oadr.pre_intact, "True", "No");

                if (oadr.pre_lacera != null)
                {
                    lbl_pre_intact.Text += " " + WebHelpers.GetBool(oadr.pre_lacera, "True", "No") + " " + oadr.pre_lacera_degree;
                }
                if (oadr.pre_episiotomy != null)
                {
                    lbl_pre_intact.Text += " " + WebHelpers.FormatString(WebHelpers.GetBool(oadr.pre_episiotomy, "True", "No")) + " " + oadr.pre_episiotomy_st;
                }

                lbl_cervix_intact.Text = WebHelpers.GetBool(oadr.cervix_intact, "Nguyên vẹn/ Intact", "Rách/ Laceration");

                //4.
                lbl_preo_diagnosis.Text = WebHelpers.TextToHtmlTag(oadr.preo_diagnosis);
                lbl_post_diagnosis.Text = WebHelpers.TextToHtmlTag(oadr.post_diagnosis);

                WebHelpers.LoadDataGridView(grid_operations, WebHelpers.GetJSONToDataTable(oadr.operations), Oadr.OPERATION, btn_grid_operations_add);

                lbl_sur_incident.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.sur_incident, "Có, ghi rõ/ Yes, specify: " + oadr.sur_incident_note));

                lbl_sur_complication.Text = WebHelpers.FormatString(WebHelpers.GetBool(oadr.sur_complication, "Có, ghi rõ/ Yes, specify: " + oadr.sur_complication_note));

                //5.
                lbl_treatment_plan.Text = WebHelpers.FormatString(oadr.treatment_plan);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormPrint(Oadr oadr)
        {
            try
            {
                
                //prt_vpid.Text = Patient.Instance().visible_patient_id;
                //WebHelpers.gen_BarCode(Patient.Instance().visible_patient_id, BarCode);

                //if(oadr.admis_delivery != null)
                //{
                //    prt_hour.Text = oadr.admis_delivery.ToString("HH");
                //    prt_minute.Text = oadr.admis_delivery.ToString("mm");
                //    prt_date.Text = oadr.admis_delivery.ToString("dd-MMM-yyyy");
                //}

                //prt_obs_name.Text = oadr.obs_name;
                //prt_obs_initial.Text = oadr.obs_initial;

                //if(oadr.delivery_at != null)
                //{
                //    prt_hour_d.Text = oadr.delivery_at.ToString("HH");
                //    prt_minute_d.Text = oadr.delivery_at.ToString("mm");
                //    prt_date_d.Text = oadr.delivery_at.ToString("dd-MMM-yyyy");
                //}

                //prt_apgar_score_1.Text = oadr.apgar_score_1;
                //prt_apgar_score_5.Text = oadr.apgar_score_5;
                //prt_apgar_score_10.Text = oadr.apgar_score_10;
                //prt_weight_of_birth.Text = oadr.weight_of_birth;
                //prt_length_of_birth.Text = oadr.length_of_birth;
                //prt_head_circum.Text = oadr.head_circum;
                //if (oadr.singleton_sex_code != null)
                //{
                //    if (oadr.singleton_sex_code == "M")
                //    {
                //        prt_singleton_sex_code_M.Text = "☒";
                //        prt_singleton_sex_code_F.Text = "❏";
                //    }
                //    if (oadr.singleton_sex_code == "F")
                //    {
                //        prt_singleton_sex_code_M.Text = "❏";
                //        prt_singleton_sex_code_F.Text = "☒";
                //    }
                //}
                //if (oadr.singleton_sex_code == null && oadr.singleton_sex_code == "")
                //{
                //    prt_singleton_sex_code_M.Text = "❏";
                //    prt_singleton_sex_code_F.Text = "❏";
                //}
                //string multiple_sex_temp = oadr.multiple_sex;
                //if (multiple_sex_temp != null)
                //{
                //    List<Multiple_Sex> multiple_sex_temps = JsonConvert.DeserializeObject<List<Multiple_Sex>>(multiple_sex_temp);
                //    prt_multiple_sex_M.Text = "❏";
                //    prt_multiple_sex_F.Text = "❏";
                //    foreach (Multiple_Sex MS in multiple_sex_temps)
                //    {
                //        string cde = MS.cde;
                //        if (cde != null)
                //        {
                //            if (cde == "M")
                //            {
                //                prt_multiple_sex_M.Text = "☒";
                //            }
                //            if (cde == "F")
                //            {
                //                prt_multiple_sex_F.Text = "☒";
                //            }
                //        }
                //    }
                //}
                //if (multiple_sex_temp == null || multiple_sex_temp == "")
                //{
                //    prt_multiple_sex_M.Text = "❏";
                //    prt_multiple_sex_F.Text = "❏";
                //}

                //if (oadr.birth_defect != null)
                //{
                //    if (oadr.birth_defect = true)
                //    {
                //        prt_birth_defect_True.Text = "☒";
                //        prt_birth_defect_False.Text = "❏";
                //    }
                //    if (oadr.birth_defect = false)
                //    {
                //        prt_birth_defect_True.Text = "❏";
                //        prt_birth_defect_False.Text = "☒";
                //    }
                //}
                //if (oadr.birth_defect == null && oadr.birth_defect == "")
                //{
                //    prt_birth_defect_True.Text = "❏";
                //    prt_birth_defect_False.Text = "❏";
                //}
                //prt_birth_defect_note.Text = oadr.birth_defect_note;
                //prt_neonatal_status.Text = oadr.neonatal_status;
                //if (oadr.intervention != null)
                //{
                //    if (oadr.intervention = true)
                //    {
                //        prt_intervention_True.Text = "☒";
                //        prt_intervention_False.Text = "❏";
                //    }
                //    if (oadr.intervention = false)
                //    {
                //        prt_intervention_True.Text = "❏";
                //        prt_intervention_False.Text = "☒";
                //    }
                //}
                //if (oadr.intervention == null && oadr.intervention == "")
                //{
                //    prt_intervention_True.Text = "❏";
                //    prt_intervention_False.Text = "❏";
                //}
                //prt_intervention_note.Text = oadr.intervention_note;
                //if (oadr.placenta_deli != null)
                //{
                //    if (oadr.placenta_deli = true)
                //    {
                //        prt_placenta_deli_M.Text = "☒";
                //        prt_placenta_deli_S.Text = "❏";
                //    }
                //    if (oadr.placenta_deli = false)
                //    {
                //        prt_placenta_deli_M.Text = "❏";
                //        prt_placenta_deli_S.Text = "☒";
                //    }
                //}
                //if (oadr.placenta_deli == null && oadr.placenta_deli == "")
                //{
                //    prt_placenta_deli_M.Text = "❏";
                //    prt_placenta_deli_S.Text = "❏";
                //}

                //if(oadr.pacental_deli_dt != null)
                //{
                //    prt_pdt_hour.Text = oadr.pacental_deli_dt.ToString("HH");
                //    prt_pdt_minute.Text = oadr.pacental_deli_dt.ToString("mm");
                //    prt_pdt_date.Text = oadr.pacental_deli_dt.ToString("dd/MM/yyyy");
                //}

                //prt_placenta_deli_mode.Text = oadr.placenta_deli_mode;
                //prt_placenta_weight.Text = oadr.placenta_weight+" gram";

                //if (oadr.umbilical_coil != null)
                //{
                //    if (oadr.umbilical_coil = true)
                //    {
                //        prt_umbilical_coil_True.Text = "☒";
                //    }
                //    else
                //    {
                //        prt_umbilical_coil_False.Text = "☒";
                //    }
                //}

                //prt_umbilical_length.Text = oadr.umbilical_length;
                //prt_blood_loss.Text = oadr.blood_loss;
                //if (oadr.p_intervention != null)
                //{
                //    if (oadr.p_intervention = true)
                //    {
                //        prt_p_intervention_True.Text = "☒";
                //        prt_p_intervention_False.Text = "❏";
                //    }
                //    if (oadr.p_intervention = false)
                //    {
                //        prt_p_intervention_True.Text = "❏";
                //        prt_p_intervention_False.Text = "☒";
                //    }
                //}
                //if (oadr.p_intervention == null && oadr.p_intervention == "")
                //{
                //    prt_p_intervention_True.Text = "❏";
                //    prt_p_intervention_False.Text = "❏";
                //}
                //prt_p_intervention_note.Text = oadr.p_intervention_note;
                //prt_spO2.Text = oadr.spO2;
                //prt_temp.Text = oadr.temp;
                //prt_BP.Text = oadr.bp;
                //prt_HR.Text = oadr.hr;
                //prt_RR.Text = oadr.rr;
                //if (oadr.delivery_mode_code != null)
                //{
                //    if (oadr.delivery_mode_code == "S")
                //    {
                //        prt_delivery_mode_desc.Text = oadr.delivery_mode_desc;
                //        prt_dl_desc.Text = oadr.section_desc;
                //    }
                //    if (oadr.delivery_mode_code == "V")
                //    {
                //        prt_delivery_mode_desc.Text = oadr.delivery_mode_desc;
                //        prt_dl_desc.Text = oadr.vaginal_deli_desc;

                //    }
                //}
                //if (oadr.pre_intact = true)
                //{
                //    prt_pre_intact.Text = "☒";
                //}
                //if (oadr.pre_intact = false)
                //{
                //    prt_pre_intact.Text = "❏";
                //}
                //if (oadr.pre_lacera = true)
                //{
                //    prt_pre_lacera.Text = "☒";
                //    prt_pre_lacera_degree.Text = oadr.pre_lacera_degree;
                //}
                //if (oadr.pre_lacera = false)
                //{
                //    prt_pre_lacera.Text = "❏";
                //}
                //if (oadr.pre_episiotomy = true)
                //{
                //    prt_pre_episiotomy.Text = "☒";
                //    prt_pre_episiotomy_st.Text = oadr.pre_episiotomy_st;
                //}
                //if (oadr.pre_episiotomy = false)
                //{
                //    prt_pre_episiotomy.Text = "❏";
                //}
                //if (oadr.cervix_intact = true)
                //{
                //    prt_cervix_intact_True.Text = "☒";
                //    prt_cervix_intact_False.Text = "❏";
                //}
                //if (oadr.cervix_intact = false)
                //{
                //    prt_cervix_intact_True.Text = "❏";
                //    prt_cervix_intact_False.Text = "☒";
                //}
                //prt_preo_diagnosis.Text = oadr.preo_diagnosis;
                //prt_post_diagnosis.Text = oadr.post_diagnosis;
                //string json_operations = oadr.operations;
                //prt_operations.DataSource = JsonConvert.DeserializeObject<DataTable>(json_operations);
                //prt_operations.DataBind();
                //if (oadr.sur_incident = true)
                //{
                //    prt_sur_incident_True.Text = "☒";
                //    prt_sur_incident_note.Text = oadr.sur_incident_note;
                //    prt_sur_incident_False.Text = "❏";

                //}
                //if (oadr.sur_incident = false)
                //{
                //    prt_sur_incident_False.Text = "☒";
                //    prt_sur_incident_True.Text = "❏";

                //}
                //if (oadr.sur_complication = true)
                //{
                //    prt_sur_complication_True.Text = "☒";
                //    prt_sur_complication_note.Text = oadr.sur_complication_note;
                //    prt_sur_complication_False.Text = "❏";
                //}
                //if (oadr.sur_complication = false)
                //{
                //    prt_sur_complication_False.Text = "☒";
                //    prt_sur_complication_True.Text = "❏";
                //}
                //prt_treatment_plan.Text = oadr.treatment_plan;
                //DateTime signature_date = (DateTime)Session["signature_date"];

                //prt_signature_name.Text = (string)Session["signature_name"];
                //prt_signature_date.Text = signature_date.ToString("dd/MM/yyyy");
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                oadr = new Oadr(varDocID, loc);
                oadr.status = DocumentStatus.FINAL;
                
                UpdateData(oadr);
                WebHelpers.clearSessionDoc(Page, varDocID, loc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                oadr = new Oadr(varDocID, loc);
                oadr.status = DocumentStatus.DRAFT;
                
                UpdateData(oadr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try { 
                dynamic result = Oadr.Delete((string)Session["UserId"], varDocID, loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, varDocID, loc);

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
            if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
            {
                Oadr oadr = new Oadr(varDocID, loc);
                
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form2, oadr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(oadr);
                //get access button
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
            WebHelpers.clearSessionDoc(Page, varDocID, loc);
        }
        protected void btn_grid_operations_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_operations.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_operations.ID], grid_operations, Oadr.OPERATION);
        }
        protected void grid_operations_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[grid_operations.ID] = WebHelpers.DeleteRow((DataTable)ViewState[grid_operations.ID], grid_operations, e.RowIndex);
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        }
        #endregion

        #region Functions
        public void Initial()
        {
            try
            {
                
                patientInfo = new PatientInfo(varPID);
                patientVisitInfo = new PatientVisitInfo(varPVID, loc);

                if (varDocIdLog != null)
                {
                    oadr = new Oadr(varDocIdLog, true, loc);
                    currentLog.Visible = true;
                }
                else
                {
                    oadr = new Oadr(varDocID, loc);
                    currentLog.Visible = false;
                }

                LoadPatientInfo();
                //loadRadGridHistoryLog();

                RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Oadr.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
                SignatureDate = _SignatureDate;
                SignatureName = _SignatureName;

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                
                if (oadr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(oadr, WebHelpers.LoadFormControl(form2, oadr, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                    lblPid.Text = varVPID;
                    BindingDataFormPrint(oadr);
                }
                else if (oadr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(oadr, WebHelpers.LoadFormControl(form2, oadr, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form2, oadr.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);
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

                string url = $"/IPD/ObsAtDeliRoom.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&loc={loc}&docIdLog={doc_log_id}";

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/IPD/ObsAtDeliRoom.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";
            Response.Redirect(url);
        }
        public void UpdateData(Oadr oadr)
        {
            try
            {
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
                oadr.pre_intact = WebHelpers.GetData(form2, new HtmlInputCheckBox(), "cb_pre_intact_", true);
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

                if (JsonConvert.SerializeObject(oadr) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES); return;
                }

                oadr.amend_reason = txt_amend_reason.Text;
                oadr.user_name = (string)Session["UserID"];

                dynamic result = oadr.Update(loc)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);

                    Initial();
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
        public class Multiple_Sex
        {
            public string cde { get; set; }
            public string desc { get; set; }
        }

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, varDocID, loc);

        }

        protected void grid_operations_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //If Salary is less than 10000 than set the row Background Color to Cyan  

                var check = e.Row.FindControl("date_time_check");
                if(check != null)
                {
                    HiddenField control = check as HiddenField;
                    RadDateTimePicker radDateTimePicker = e.Row.FindControl("date_time") as RadDateTimePicker;
                    if (radDateTimePicker != null)
                    {
                        var result = WebHelpers.ConvertDateTime(control.Value, out bool isValid, out string datetime);
                        if (isValid)
                        {
                            radDateTimePicker.SelectedDate = result;
                        }
                    }
                }
                
            }
        }
    }
}
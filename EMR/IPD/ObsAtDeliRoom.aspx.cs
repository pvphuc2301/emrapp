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
        Oadr oadr;
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

            oadr = new Oadr(DataHelpers.varDocId);

            loadDataToOMRControls(oadr);
        }

        public void loadDataToOMRControls(Oadr oadr)
        {
            try
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
                if(oadr.placenta_deli != null)
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

                if(oadr.singleton_sex_code == "M")
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

                if(oadr.delivery_mode_code == Oadr.DELIVERY_MODE_CODE["S"])
                {
                    rad_delivery_mode_code_s.Checked = true;

                    if(oadr.section_code == "EM")
                    {
                        rad_section_code_em.Checked = true;
                    } else if (oadr.section_code == "EL")
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
                if(oadr.pre_intact != null)
                {
                    if (oadr.pre_intact) { cb_pre_intact.Checked = true; }
                }

                if (oadr.pre_lacera != null)
                {
                    if (oadr.pre_lacera) { cb_pre_lacera.Checked = true; txt_pre_lacera_degree.Value = oadr.pre_lacera_degree; }
                }

                if(oadr.pre_episiotomy != null)
                {
                    if (oadr.pre_episiotomy) { cb_pre_episiotomy.Checked = true; txt_pre_episiotomy_st.Value = oadr.pre_episiotomy_st; }
                }

                if(oadr.cervix_intact != null)
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

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;
                
                if (oadr.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;
                    btnCancel.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }
                else if (oadr.status == DocumentStatus.DRAFT)
                {

                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void DisabledControl(bool disabled)
        {
            WebHelpers.DisabledDateTimePicker(dtpk_admis_delivery, disabled);
            txt_obs_name.Disabled = disabled;
            txt_obs_initial.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dtpk_delivery_at, disabled);
            txt_apgar_score_1.Disabled = disabled;
            txt_apgar_score_5.Disabled = disabled;
            txt_apgar_score_10.Disabled = disabled;
            txt_weight_of_birth.Disabled = disabled;
            txt_length_of_birth.Disabled = disabled;
            txt_head_circum.Disabled = disabled;
            rad_singleton_sex_code1.Disabled = disabled;
            rad_singleton_sex_code2.Disabled = disabled;
            rad_birth_defect1.Disabled = disabled;
            cb_multiple_sex_m.Disabled = disabled;
            cb_multiple_sex_f.Disabled = disabled;
            rad_birth_defect2.Disabled = disabled;
            txt_birth_defect_note.Disabled = disabled;
            txt_neonatal_status.Disabled = disabled;
            rad_intervention1.Disabled = disabled;
            rad_intervention2.Disabled = disabled;
            txt_intervention_note.Disabled = disabled;
            txt_p_intervention_note.Disabled = disabled;
            rad_placenta_deli1.Disabled = disabled;
            rad_placenta_deli2.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dtpk_pacental_deli_dt, disabled);
            txt_placenta_deli_mode.Disabled = disabled;
            txt_placenta_weight.Disabled = disabled;
            rad_umbilical_coil1.Disabled = disabled;
            rad_umbilical_coil2.Disabled = disabled;
            txt_umbilical_length.Disabled = disabled;
            txt_blood_loss.Disabled = disabled;
            rad_p_intervention1.Disabled = disabled;
            rad_p_intervention2.Disabled = disabled;
            txt_spO2.Disabled = disabled;
            txt_temp.Disabled = disabled;
            txt_BP.Disabled = disabled;
            txt_HR.Disabled = disabled;
            txt_RR.Disabled = disabled;

            foreach (KeyValuePair<string, string> code in Oadr.DELIVERY_MODE_CODE)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_delivery_mode_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            foreach (KeyValuePair<string, string> code in Oadr.SECTION_CODE)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_section_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            foreach (KeyValuePair<string, string> code in Oadr.VAGINAL_DELI_CODE)
            {
                try
                {
                    ((HtmlInputRadioButton)FindControl("rad_vaginal_deli_code_" + code.Key.ToLower())).Disabled = disabled;
                }
                catch (Exception ex) { }
            }

            txt_interven_reason.Disabled = disabled;
            cb_pre_intact.Disabled = disabled;
            cb_pre_lacera.Disabled = disabled;
            txt_pre_lacera_degree.Disabled = disabled;
            cb_pre_episiotomy.Disabled = disabled;
            txt_pre_episiotomy_st.Disabled = disabled;

            rad_cervix_intact1.Disabled = disabled;
            rad_cervix_intact2.Disabled = disabled;
            txt_preo_diagnosis.Disabled = disabled;
            txt_post_diagnosis.Disabled = disabled;
            WebHelpers.DisabledGridView(grid_operations, disabled);
            btn_grid_operations_add.Visible = !disabled;

            rad_sur_incident1.Disabled = disabled;
            rad_sur_incident2.Disabled = disabled;
            txt_sur_incident_note.Disabled = disabled;
            rad_sur_complication1.Disabled = disabled;
            rad_sur_complication2.Disabled = disabled;
            txt_sur_complication_note.Disabled = disabled;
            txt_treatment_plan.Disabled = disabled;
        }

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

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            oadr = new Oadr(DataHelpers.varDocId);
            oadr.status = DocumentStatus.FINAL;
            oadr.user_name = (string)Session["UserID"];

            UpdateData(oadr);
        }

        public void UpdateData(Oadr oadr)
        {
            try
            {
                oadr.amend_reason = txt_amendReason.Value;
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

                if (rad_singleton_sex_code1.Checked) {
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
                } else if (rad_birth_defect2.Checked)
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

                if (oadr.Update()[0] == WebHelpers.ResponseStatus.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS, 100000);

                    Initial();
                }
            }
            catch (Exception ex) { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            oadr = new Oadr(DataHelpers.varDocId);

            oadr.user_name = (string)Session["UserID"];
            oadr.status = DocumentStatus.DRAFT;

            UpdateData(oadr);
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "Disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            txt_amendReason.Visible = true;

            DisabledControl(false);
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            txt_amendReason.Visible = false;

            DisabledControl(true);
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Oadr.Delete((string)Session["UserID"], Request.QueryString["vpid"])[0] == WebHelpers.ResponseStatus.OK)
            {

            }
        }
    }
}
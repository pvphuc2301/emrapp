using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR.OPD
{
    public partial class MedRecForVac : System.Web.UI.Page
    {
        Mrfv mrfv;
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

            mrfv = new Mrfv(DataHelpers.varDocId);
            loadDataToOMRControls(mrfv);
        }

        public void loadDataToOMRControls(Mrfv mrfv)
        {
            try
            {
                txt_chief_complaint.Value = mrfv.chief_complaint;
                txt_cur_med_history.Value = mrfv.cur_med_history;
                txt_cur_medication.Value = mrfv.cur_medication;
                txt_personal.Value = mrfv.personal;
                txt_family.Value = mrfv.family;

                if(mrfv.allergy != null)
                {
                    if (bool.Parse(mrfv.allergy))
                    {
                        rad_allergy2.Checked = true;
                        txt_allergy_note.Value = mrfv.allergy_text;
                    }
                    else
                    {
                        rad_allergy1.Checked = true;
                    }
                }

                txt_vs_temperature.Value = mrfv.vs_temperature;
                txt_vs_heart_rate.Value = mrfv.vs_heart_rate;
                txt_vs_weight.Value = mrfv.vs_weight;
                txt_vs_height.Value = mrfv.vs_height;
                txt_vs_respiratory_rate.Value = mrfv.vs_respiratory_rate;
                txt_vs_BMI.Value = mrfv.vs_BMI;
                txt_vs_blood_pressure.Value = mrfv.vs_blood_pressure;
                txt_vs_spO2.Value = mrfv.vs_spO2;
                txt_scr_before_vacc_1.Value = mrfv.scr_before_vacc_1;
                txt_scr_before_vacc_2.Value = mrfv.scr_before_vacc_2;
                txt_scr_before_vacc_3.Value = mrfv.scr_before_vacc_3;
                txt_scr_before_vacc_4.Value = mrfv.scr_before_vacc_4;
                txt_scr_before_vacc_5.Value = mrfv.scr_before_vacc_5;
                txt_scr_before_vacc_6.Value = mrfv.scr_before_vacc_6;
                txt_scr_before_vacc_7.Value = mrfv.scr_before_vacc_7;
                txt_scr_before_vacc_8.Value = mrfv.scr_before_vacc_8;

                _BindGridView(grid_appointedVaccine, WebHelpers.GetJSONToDataTable(mrfv.appointed_vaccine));

                foreach (KeyValuePair<string, string> code in Mrfv.TREATMENT_CODE)
                {
                    try
                    {
                        ((HtmlInputRadioButton)FindControl("rad_treatment_code_" + code.Key.ToLower())).Checked = true;
                    }
                    catch (Exception ex) { }
                }

            } catch (Exception ex)
            {

            }
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

        protected void btn_grid_appointedVaccine_add_Click(object sender, EventArgs e)
        {

        }
    }
}
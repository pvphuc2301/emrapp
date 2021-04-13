using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class OutPathIniNurAss : System.Web.UI.Page
    {
        public OutPatIniNurAss outPatIniNurAss;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="datetime">
        /// type: dynamic
        /// </param>
        /// <returns>
        /// type: dynamic
        /// format to sql datetime: yyyy-MM-dd HH:mm:ss.fff
        /// 
        /// </returns>
        public dynamic sqlFormattedDate(dynamic datetime)
        {
            DateTime _dateTime = Convert.ToDateTime(datetime);
           return _dateTime.ToString("yyyy-MM-ddHH:mm:ss.fff");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["outPatIniNurAss"] != null)
            {
                outPatIniNurAss = (OutPatIniNurAss)HttpContext.Current.Session["outPatIniNurAss"];
            }

            if (!IsPostBack)
            {
                outPatIniNurAss = new OutPatIniNurAss();

                string docId = Request.QueryString["docid"];

                string _jsonData = WebHelpers.GetAPI("api/oina/" + docId);

                DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);

                WebHelpers.BindingDatafield(db, outPatIniNurAss);

                txtTemperature.Value = outPatIniNurAss.vs_temperature;
                txtHeartRate.Value = outPatIniNurAss.vs_heart_rate;
                txtWeight.Value = outPatIniNurAss.vs_weight;
                txtRespiratoryRate.Value = outPatIniNurAss.vs_respiratory_rate;
                txtHeight.Value = outPatIniNurAss.vs_height;
                txtBloodPressure.Value = outPatIniNurAss.vs_blood_pressure;
                txtBmi.Value = outPatIniNurAss.vs_BMI;
                txtSpo2.Value = outPatIniNurAss.vs_spO2;

                txtHeadCircumference.Value = outPatIniNurAss.pulse;

                txtChiefComplaint.Value = outPatIniNurAss.chief_complaint;
                //lblChiefComplaint.InnerHtml = outPatIniNurAss.chief_complaint;
                
                //allergy
                if (outPatIniNurAss.allergy == "True") { radAllergy2.Checked = true; txtAllergy.Value = outPatIniNurAss.allergy_note; } else { radAllergy1.Checked = true; }
                if (outPatIniNurAss.mental_status == "True") { radMentalStatus1.Checked = true; } else { radMentalStatus2.Checked = true; txtMentalStatus.Value = outPatIniNurAss.mental_status_note; }
                if (outPatIniNurAss.fall_risk == "True") { radFrms1.Checked = true; txtFrms.Value = outPatIniNurAss.fall_risk_assistance; } else { radFrms2.Checked = true; txtFrms.Disabled = false; }
                //mental status
                txtPainCore.Value = outPatIniNurAss.paint_score_code;

                if (outPatIniNurAss.nutrition_status_code == "N") { rad_nss2.Checked = true; }
                else if (outPatIniNurAss.nutrition_status_code == "O") { rad_nss3.Checked = true; }
                else if (outPatIniNurAss.nutrition_status_code == "U") { rad_nss1.Checked = true; }

                if (outPatIniNurAss.housing_code == "ALN") { rad_housing1.Checked = true; }
                else if (outPatIniNurAss.housing_code == "REL") { rad_housing2.Checked = true; }

                if (outPatIniNurAss.prioritization_code == "IM") { rad_prior1.Checked = true; }
                else if (outPatIniNurAss.prioritization_code == "WA") { rad_prior2.Checked = true; }

                btnCancel.Visible = false;

                if (outPatIniNurAss.status == "FINAL")
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDelete.Visible = false;

                    txtTemperature.Disabled = false;
                    txtHeartRate.Disabled = false;
                    txtWeight.Disabled = false;
                    txtRespiratoryRate.Disabled = false;
                    txtHeight.Disabled = false;
                    txtBloodPressure.Disabled = false;
                    txtBmi.Disabled = false;
                    txtSpo2.Disabled = false;
                    txtHeadCircumference.Disabled = false;
                    txtChiefComplaint.Disabled = false;

                    radAllergy1.Disabled = false;
                    radAllergy2.Disabled = false;

                    radMentalStatus1.Disabled = false;
                    radMentalStatus2.Disabled = false;

                    txtPainCore.Disabled = false;

                    radFrms1.Disabled = false;
                    radFrms2.Disabled = false;

                    rad_nss1.Enabled = false;
                    rad_nss2.Enabled = false;
                    rad_nss3.Enabled = false;

                    rad_housing1.Enabled = false;
                    rad_housing2.Enabled = false;
                    rad_prior1.Enabled = false;
                    rad_prior2.Enabled = false;
                }

                else if (outPatIniNurAss.status == "DRAFT")
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }

                HttpContext.Current.Session["outPatIniNurAss"] = outPatIniNurAss;
            }
        }

        //protected void btnAmend_Click(object sender, EventArgs e)
        //{
        //    btnCancel.Visible = true;
        //    btnComplete.Visible = true;

        //    //ChangeControlState(true);
        //}

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            txtTemperature.Disabled = true;
            txtHeartRate.Disabled = true;
            txtWeight.Disabled = true;
            txtRespiratoryRate.Disabled = true;
            txtHeight.Disabled = true;
            txtBloodPressure.Disabled = true;
            txtBmi.Disabled = true;
            txtSpo2.Disabled = true;
            txtHeadCircumference.Disabled = true;
            txtChiefComplaint.Disabled = true;

            radAllergy1.Disabled = true;
            radAllergy2.Disabled = true;

            radMentalStatus1.Disabled = true;
            radMentalStatus2.Disabled = true;

            txtPainCore.Disabled = true;

            radFrms1.Disabled = true;
            radFrms2.Disabled = true;

            rad_nss1.Enabled = true;
            rad_nss2.Enabled = true;
            rad_nss3.Enabled = true;

            rad_housing1.Enabled = true;
            rad_housing2.Enabled = true;
            rad_prior1.Enabled = true;
            rad_prior2.Enabled = true;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            outPatIniNurAss.status = "FINAL";

            outPatIniNurAss.vs_temperature = txtTemperature.Value;

            outPatIniNurAss.vs_heart_rate = txtHeartRate.Value;
            outPatIniNurAss.vs_weight = txtWeight.Value;
            outPatIniNurAss.vs_respiratory_rate = txtRespiratoryRate.Value;
            outPatIniNurAss.vs_height = txtHeight.Value;
            outPatIniNurAss.vs_blood_pressure = txtBloodPressure.Value;
            outPatIniNurAss.vs_BMI = txtBmi.Value;
            outPatIniNurAss.vs_spO2 = txtSpo2.Value;
            outPatIniNurAss.pulse = txtHeadCircumference.Value;

            outPatIniNurAss.chief_complaint = txtChiefComplaint.Value;
            outPatIniNurAss.allergy = radAllergy2.Checked;
            outPatIniNurAss.mental_status = radMentalStatus1.Checked;
            outPatIniNurAss.fall_risk = radFrms2.Checked;
            outPatIniNurAss.paint_score_code = txtPainCore.Value;

            if(rad_nss1.Checked) { outPatIniNurAss.nutrition_status_code = "U"; }
            else if(rad_nss2.Checked) { outPatIniNurAss.nutrition_status_code = "N"; }
            else if(rad_nss3.Checked) { outPatIniNurAss.nutrition_status_code = "O"; }
            
            if(rad_housing1.Checked) { outPatIniNurAss.housing_code = "ALN"; }
            else { outPatIniNurAss.nutrition_status_code = "REL"; }

            if (rad_prior1.Checked) { outPatIniNurAss.prioritization_code = "IM"; }
            else if (rad_prior2.Checked) { outPatIniNurAss.prioritization_code = "WA"; }

            outPatIniNurAss.assessment_date_time = sqlFormattedDate(outPatIniNurAss.assessment_date_time);

            OutPatIniNurAssPOST outPatIniNurAssPOST = new OutPatIniNurAssPOST();

            WebHelpers.CopyProperties(outPatIniNurAss, outPatIniNurAssPOST);
            outPatIniNurAssPOST.user_name = "my.nguyen";

            WebHelpers.PostAPI("api/oina/edit", outPatIniNurAssPOST);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            outPatIniNurAss.status = "DRAFT";
            
            outPatIniNurAss.vs_temperature = txtTemperature.Value;
            
            outPatIniNurAss.vs_heart_rate = txtHeartRate.Value;
            outPatIniNurAss.vs_weight = txtWeight.Value;
            outPatIniNurAss.vs_respiratory_rate = txtRespiratoryRate.Value;
            outPatIniNurAss.vs_height = txtHeight.Value;
            outPatIniNurAss.vs_blood_pressure = txtBloodPressure.Value;
            outPatIniNurAss.vs_BMI = txtBmi.Value;
            outPatIniNurAss.vs_spO2 = txtSpo2.Value;
            outPatIniNurAss.pulse = txtHeadCircumference.Value;

            outPatIniNurAss.chief_complaint = txtChiefComplaint.Value;
            outPatIniNurAss.allergy = radAllergy2.Checked;
            outPatIniNurAss.mental_status = radMentalStatus1.Checked;
            outPatIniNurAss.fall_risk = radFrms2.Checked;
            outPatIniNurAss.paint_score_code = txtPainCore.Value;

            if (rad_nss1.Checked) { outPatIniNurAss.nutrition_status_code = "U"; }
            else if (rad_nss2.Checked) { outPatIniNurAss.nutrition_status_code = "N"; }
            else if (rad_nss3.Checked) { outPatIniNurAss.nutrition_status_code = "O"; }

            if (rad_housing1.Checked) { outPatIniNurAss.housing_code = "ALN"; }
            else { outPatIniNurAss.housing_code = "REL"; }

            if (rad_prior1.Checked) { outPatIniNurAss.prioritization_code = "IM"; }
            else if (rad_prior2.Checked) { outPatIniNurAss.prioritization_code = "WA"; }

            outPatIniNurAss.assessment_date_time = sqlFormattedDate(outPatIniNurAss.assessment_date_time);

            OutPatIniNurAssPOST outPatIniNurAssPOST = new OutPatIniNurAssPOST();

            WebHelpers.CopyProperties(outPatIniNurAss, outPatIniNurAssPOST);
            outPatIniNurAssPOST.user_name = "my.nguyen";
            outPatIniNurAssPOST.assessment_date_time = "2021-04-13T07:02:54.969Z";

            //
            WebHelpers.PostAPI("api/oina/edit", outPatIniNurAssPOST);
            
            WebHelpers.PostAPI("api/oina/log/" + outPatIniNurAssPOST.document_id);

        }
    }
}
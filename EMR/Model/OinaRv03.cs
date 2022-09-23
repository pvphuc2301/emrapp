using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Telerik.Web.UI.Map;

namespace EMR.Model
{
    public class OinaRv03 : OinaRv01
    {
        /// <summary>
        /// <b>Description: </b> <br/> 
        /// <b>Version: </b> RV03 <br/>
        /// <b>Author: </b>phut.phan <br/>
        /// <b>Created Date: </b> 23/9/2022<br/>
        /// </summary>
        public string pain_assessment_type { get; set; }
        public OinaRv03(string document_id, string location) : base(document_id, location)
        {
        }

        public OinaRv03(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }
    }
    public class OinaRv01 : EmrDocument
    {
        #region Properties
        public override string api => "api/oina";
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic pulse { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic allergy { get; set; }
        public string allergy_note { get; set; }
        public dynamic mental_status { get; set; }
        public string mental_status_note { get; set; }
        public dynamic paint_score_code { get; set; }
        public dynamic paint_score_description { get; set; }
        public dynamic fall_risk { get; set; }
        public dynamic fall_risk_assistance { get; set; }
        public dynamic nutrition_status_code { get; set; }
        public dynamic nutrition_status_description { get; set; }
        public dynamic housing_code { get; set; }
        public string housing_description { get; set; }
        public dynamic prioritization_code { get; set; }
        public string prioritization_description { get; set; }
        public dynamic assessment_date_time { get; set; }
        public dynamic model_id { get; set; }
        public dynamic patient_visit_id { get; set; }
        public dynamic document_type_rcd { get; set; }

        //Update 21.2.2022
        public dynamic communicable_disease_screening { get; set; }
        public dynamic barrier_to_care { get; set; }
        public dynamic fall_risk_factors { get; set; }
        public dynamic fall_risk_questions { get; set; }
        public dynamic intervention { get; set; }
        public dynamic nutritional_status_screening { get; set; }
        public dynamic nutritional_status { get; set; }
        public dynamic nutritional_conclude { get; set; }
        public dynamic patient_education_needs { get; set; }
        public dynamic immediate_consulting_requirement { get; set; }
        public dynamic flacc { get; set; }
        public dynamic flacc_conclude { get; set; }
        public dynamic npass { get; set; }
        public dynamic npass_conclude { get; set; }
        public dynamic document_version { get; set; }
        #endregion
        public OinaRv01(string document_id, string location) : base(document_id, location)
        {
        }

        public OinaRv01(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }
    }
}

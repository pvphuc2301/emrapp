using Newtonsoft.Json;
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
        public FLACC FLACC()
        {
            dynamic result = JsonConvert.DeserializeObject(flacc);
            return new FLACC()
            {
                face = flacc.face != null && flacc.face != "" ? flacc.face : 0,
                legs = flacc.legs != null && flacc.legs != "" ? flacc.legs : 0,
                activity = flacc.activity != null && flacc.activity != "" ? flacc.activity : 0,
                cry = flacc.cry != null && flacc.cry != "" ? flacc.cry : 0,
                consolability = flacc.consolability != null && flacc.consolability != "" ? flacc.consolability : 0
            };
        }
        public COMMUNICABLE_DISEASE_SCREENING COMMUNICABLE_DISEASE_SCREENING()
        {
            dynamic result = JsonConvert.DeserializeObject(communicable_disease_screening);
            return new COMMUNICABLE_DISEASE_SCREENING()
            {
                high_fever = result.high_fever,
                contact_infectious_disease = result.contact_infectious_disease,
                close_contact = result.close_contact,
                injectious_risk = result.injectious_risk
            };
        }
        public BARRIER_TO_CARE BARRIER_TO_CARE()
        {
            dynamic result = JsonConvert.DeserializeObject(barrier_to_care);
            return new BARRIER_TO_CARE()
            {
                btc_language = result.btc_language,
                btc_language_note = result.btc_language_note,
                btc_cognitive = result.btc_cognitive,
                btc_cognitive_note = result.btc_cognitive_note,
                btc_sensory = result.btc_sensory,
                btc_sensory_note = result.btc_sensory_note,
                btc_religious = result.btc_religious,
                btc_religious_note = result.bitcoin_religious_note,
                btc_cultural = result.btc_cultural,
                btc_cultural_note = result.bitcoin_cultural_note
            };
        }
        public static double? WeightChangeCal(double previous_weight, double current_weight)
        {
            if (previous_weight <= 0)
            {
                return null;
            }
            return Math.Abs(Math.Round(((current_weight - previous_weight) * 100) / previous_weight, 1));
        }

        public static double BmiCal(double vs_weight, double vs_height)
        {
            return Math.Round(( vs_weight / ((vs_height / 100) * (vs_height / 100))),1);
        }

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
        public string chief_complaint { get; set; }
        public bool? allergy { get; set; }
        public string allergy_note { get; set; }
        public bool? mental_status { get; set; }
        public string mental_status_note { get; set; }
        public string paint_score_code { get; set; }
        public string paint_score_description { get; set; }
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
        public string fall_risk_factors { get; set; }
        public string fall_risk_questions { get; set; }
        public string intervention { get; set; }
        public string nutritional_status_screening { get; set; }
        public string nutritional_status { get; set; }
        public dynamic nutritional_conclude { get; set; }
        public string patient_education_needs { get; set; }
        public string immediate_consulting_requirement { get; set; }
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

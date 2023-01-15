using EMR.Model;
using Newtonsoft.Json.Linq;

namespace EMR.Data.AIH.Model
{
    public class OmrModel : EmrDocument
    {
        public OmrModel()
        {
        }

        public OmrModel(string document_id, string location) : base(document_id, location)
        {
        }

        public OmrModel(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        public override string api => "api/omr";
        #region Properties
        public dynamic asessment_date_time { get; set; }
        public dynamic chief_complain { get; set; }
        public dynamic medical_history { get; set; }
        public dynamic personal { get; set; }
        public dynamic habits_smoking { get; set; }
        public dynamic habits_smoking_pack { get; set; }
        public dynamic habits_alcohol { get; set; }
        public dynamic habits_alcohol_note { get; set; }
        public dynamic habits_drugs { get; set; }
        public dynamic habits_drugs_note { get; set; }
        public dynamic habits_physical_exercise { get; set; }
        public dynamic habits_phy_exer_note { get; set; }
        public dynamic habits_other { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_note { get; set; }
        public dynamic family { get; set; }
        public dynamic immunization { get; set; }
        public dynamic current_medication { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_spO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic physical_examination { get; set; }
        public dynamic psy_consult_required { get; set; }
        public dynamic laboratory_indications_results { get; set; }
        public dynamic additional_investigation { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic differential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_code { get; set; }
        public dynamic treatment_desc { get; set; }
        public dynamic medicine { get; set; }
        public dynamic spec_opinion_requested { get; set; }
        public dynamic spec_opinion_requested_note { get; set; }
        public dynamic specific_education_required { get; set; }

        public dynamic next_appointment { get; set; }

        //Update V2.0
        public dynamic infected_with_covid { get; set; }
        public dynamic received_1_dose { get; set; }
        public dynamic received_2_dose { get; set; }
        public dynamic received_additional { get; set; }
        // public dynamic other_vaccinations { get; set; } load immunization
        public dynamic not_yet_vaccinations { get; set; }
        public string nutrition_screening { get; set; }
        public string nutrition_screening_code { get; set; }
        public string nutrition_screening_desc { get; set; }
        #endregion
        protected override void DefaultDocument()
        {

        }
        public void SetDefaultDocument(string location, string patient_visit_id)
        {
            infected_with_covid = false;
            var result = WebHelpers.GetAPI($"api/emr/nutrition-status/{location}/{patient_visit_id}");
            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                var data = result.Data;
                JObject resJson = JObject.Parse(data);
                nutrition_screening = resJson["nutritional_status"].ToString();
            }
        }
    }
}

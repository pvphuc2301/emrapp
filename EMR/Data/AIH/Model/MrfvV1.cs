using EMR.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Model
{
    public class MrfvV1 : EmrDocument
    {
        public MrfvV1()
        {
        }

        public MrfvV1(string document_id, string location) : base(document_id, location)
        {
        }

        public MrfvV1(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        protected override void DefaultDocument()
        {
            infected_with_covid = false;
        }
        public override string api => "api/mrfv";
        #region properties
        public dynamic chief_complaint { get; set; }
        public dynamic cur_med_history { get; set; }
        public dynamic cur_medications { get; set; }
        public dynamic personal { get; set; }
        public dynamic family { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_text { get; set; }
        public dynamic vs_temperature { get; set; }
        public dynamic vs_heart_rate { get; set; }
        public dynamic vs_weight { get; set; }
        public dynamic vs_height { get; set; }
        public dynamic vs_respiratory_rate { get; set; }
        public dynamic vs_BMI { get; set; }
        public dynamic vs_blood_pressure { get; set; }
        public dynamic vs_SpO2 { get; set; }
        public dynamic vs_pulse { get; set; }
        public dynamic scr_before_vacc_1 { get; set; }
        public dynamic scr_before_vacc_2 { get; set; }
        public dynamic scr_before_vacc_3 { get; set; }
        public dynamic scr_before_vacc_4 { get; set; }
        public dynamic scr_before_vacc_5 { get; set; }
        public dynamic scr_before_vacc_6 { get; set; }
        public dynamic scr_before_vacc_7 { get; set; }
        public dynamic scr_before_vacc_8 { get; set; }
        public dynamic appointed_vaccine { get; set; }
        public dynamic additional_investigations { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic differential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic treatment_code { get; set; }
        public dynamic treatment_desc { get; set; }
        public dynamic spec_opinion_req { get; set; }
        public dynamic spec_opinion_req_text { get; set; }
        public dynamic pecific_edu_req { get; set; }
        public dynamic next_appointment { get; set; }
        //Update V2.0
        public dynamic infected_with_covid { get; set; }
        public dynamic received_1_dose { get; set; }
        public dynamic received_2_dose { get; set; }
        public dynamic received_additional { get; set; }
        public dynamic other_vaccinations { get; set; }
        public dynamic not_yet_vaccinations { get; set; }
        #endregion
    }
}

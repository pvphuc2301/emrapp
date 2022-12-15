using EMR.Model;

namespace EMR.Data.AIH.Model
{
    public class MrnvV1 : EmrDocument
    {
        public MrnvV1()
        {
        }

        public MrnvV1(string document_id, string location) : base(document_id, location)
        {
        }

        public MrnvV1(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        public override string api => "api/mrnv";
        #region Properties
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
        public dynamic scr_before_vacc_9 { get; set; }
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

        protected override void DefaultDocument()
        {

        }
        #endregion
    }
}

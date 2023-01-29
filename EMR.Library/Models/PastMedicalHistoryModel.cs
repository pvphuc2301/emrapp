using System;

namespace EMR.Library.Models
{
    public class PastMedicalHistoryModel
    {
        public string patient_id { get; set; }
        public string patient_visit_id { get; set; }
        public string visit_type { get; set; }
        public string visit_code { get; set; }
        public DateTime actual_visit_date_time { get; set; }    
        public DateTime closure_date_time { get; set; }
        public string caregiver_name_e { get; set; }
        public string caregiver_name_l { get; set; }
        public string specialty_name_e { get; set; }
        public string specialty_name_l { get; set; }
        public string medical_history { get; set; }
        public string diagnosis { get; set; }
    }
}

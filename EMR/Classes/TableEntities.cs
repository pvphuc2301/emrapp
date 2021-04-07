using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EMR
{
    
    public partial class OutpatientMedicalRecord
    {
        public void OutpatientMedicalRecord_View() { }
        public void OutpatientMedicalRecord_Insert() { }

        public void OutpatientMedicalRecord_Update() { }

        public void  OutpatientMedicalRecord_Delete() { }

        public dynamic document_id { get; set; }

        public dynamic model_id { get; set; }

        public dynamic patient_visit_id { get; set; }


        public dynamic status { get; set; }


        public dynamic created_user_id { get; set; }
        public dynamic created_name_e { get; set; }


        public dynamic created_name_l { get; set; }

        public dynamic created_date_time { get; set; }

        public dynamic modified_date_time { get; set; }


        public dynamic submited_user_id { get; set; }


        public dynamic submited_name_e { get; set; }


        public dynamic submited_name_l { get; set; }

        public dynamic submited_date_time { get; set; }

        public dynamic signed_user_id { get; set; }


        public dynamic signed_name_e { get; set; }


        public dynamic signed_name_l { get; set; }

        public dynamic signed_date_time { get; set; }

        public dynamic chief_complain { get; set; }

        public dynamic medical_history { get; set; }

        public dynamic personal { get; set; }

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

        public dynamic laboratory_indications_results { get; set; }

        public dynamic additional_investigation { get; set; }

        public dynamic initial_diagnosis { get; set; }

        public dynamic diagnosis { get; set; }

        public dynamic differential_diagnosis { get; set; }

        public dynamic associated_conditions { get; set; }

        public dynamic medicine { get; set; }

        public dynamic specialized_opinion_pequested { get; set; }

        public dynamic specific_education_required { get; set; }

        public dynamic next_appointment { get; set; }


        public dynamic DOCUMENTID { get; set; }
       
     }


}
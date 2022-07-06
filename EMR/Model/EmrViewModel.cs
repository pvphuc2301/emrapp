using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class EmrViewModel : EmrDocument
    {
        #region Props
        public override string api { get => "api/emr"; }
        public dynamic evaluation_time { get; set; }
        public dynamic chief_complaint { get; set; }
        public dynamic chief_complaint_code { get; set; }
        public dynamic chief_complaint_desc { get; set; }
        public dynamic history_of_present { get; set; }
        public dynamic past_med_his_meds { get; set; }
        public dynamic past_med_his_surs { get; set; }
        public dynamic habits { get; set; }
        public dynamic habits_other { get; set; }
        public dynamic home_medications { get; set; }
        public dynamic allergies { get; set; }
        public dynamic relevant_family_history { get; set; }
        public dynamic finding { get; set; }
        public dynamic required_code { get; set; }
        public dynamic required_text { get; set; }
        public dynamic investigations_results { get; set; }
        public dynamic initial_diagnosis { get; set; }
        public dynamic diferential_diagnosis { get; set; }
        public dynamic associated_conditions { get; set; }
        public dynamic comfirmed_diagnosis { get; set; }
        public dynamic specialist_opinion { get; set; }
        public dynamic name_of_specialist { get; set; }
        public dynamic time_contaced { get; set; }
        public dynamic time_provided { get; set; }
        public dynamic spec_opinion_summarised { get; set; }
        public dynamic treatment { get; set; }
        public dynamic progress_note { get; set; }
        public dynamic conclusions { get; set; }
        public dynamic discharge { get; set; }
        public dynamic prescription { get; set; }
        public dynamic specify_care_instructions { get; set; }
        public dynamic discharge_time { get; set; }
        public dynamic referred_to_OPD { get; set; }
        public dynamic referred_to_OPD_text { get; set; }
        public dynamic hospitalisation_required { get; set; }
        public dynamic reason { get; set; }
        public dynamic ward { get; set; }
        public dynamic time_of_leaving_emergency { get; set; }
        public dynamic emergency_surgery { get; set; }
        public dynamic pre_operative_diagnosis { get; set; }
        public dynamic brief_summary { get; set; }
        public dynamic time_of_leaving_emer_e { get; set; }
        public dynamic transfer_hospital { get; set; }
        public dynamic reason_for_transfer { get; set; }
        public dynamic status_before_transfer { get; set; }
        public dynamic time_of_leaving_emer_a { get; set; }
        public dynamic patient_discharge { get; set; }
        public dynamic txt_patient_discharge { get; set; }
        public dynamic icd_10 { get; set; }
        public dynamic model_id { get; set; }
        public dynamic patient_visit_id { get; set; }
        public dynamic created_user_id { get; set; }
        public dynamic created_name_e { get; set; }
        public dynamic created_name_l { get; set; }
        public dynamic created_date_time { get; set; }
        public dynamic modified_user_id { get; set; }
        public dynamic modified_name_e { get; set; }
        public dynamic modified_name_l { get; set; }
        public dynamic modified_date_time { get; set; }
        public dynamic submited_user_id { get; set; }
        public dynamic submited_name_e { get; set; }
        public dynamic submited_name_l { get; set; }
        public dynamic submited_date_time { get; set; }
        public dynamic signed_user_id { get; set; }
        public dynamic signed_name_e { get; set; }
        public dynamic signed_name_l { get; set; }
        public dynamic signed_date_time { get; set; }
        public dynamic delete_user_id { get; set; }
        public dynamic delete_name_e { get; set; }
        public dynamic delete_name_l { get; set; }
        public dynamic delete_date_time { get; set; }
        public dynamic document_type_rcd { get; set; }
        public dynamic documentid { get; set; }
        //Update V2.0
        public dynamic infected_with_covid { get; set; }
        public dynamic received_1_dose { get; set; }
        public dynamic received_2_dose { get; set; }
        public dynamic received_additional { get; set; }
        public dynamic other_vaccinations { get; set; }
        public dynamic not_yet_vaccinations { get; set; }
        #endregion
        public EmrViewModel(string document_id, string location) : base(document_id, location)
        {
        }

        public EmrViewModel(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }
    }
}

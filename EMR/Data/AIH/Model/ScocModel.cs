using EMR.Model;
using System;

namespace EMR.Data.AIH.Model
{
    public class ScocModel : EmrDocument
    {
        public ScocModel()
        {
        }

        public ScocModel(string document_id, string location) : base(document_id, location)
        {
        }

        public ScocModel(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        public override string api => "api/scoc";
        #region Properties
        public dynamic model_id { get; set; }
        public dynamic patient_id { get; set; }
        public dynamic document_type_rcd { get; set; }
        public dynamic documentid { get; set; }
        public dynamic allergy { get; set; }
        public dynamic allergy_note { get; set; }
        public dynamic remarkable { get; set; }
        public dynamic past_history { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic cur_treatment { get; set; }
        public dynamic cur_care_plans { get; set; }
        public dynamic recommendation { get; set; }
        #endregion

        protected override void DefaultDocument()
        {

        }
    }
}

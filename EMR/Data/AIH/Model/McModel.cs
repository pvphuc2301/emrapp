using EMR.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Model
{
    public class McModel : EmrDocument
    {
        public override string api => "api/mc";
        #region Properties
        public dynamic chief_complain { get; set; }
        public dynamic history_present_illness { get; set; }
        public dynamic past_history { get; set; }
        public dynamic clinical_findings { get; set; }
        public dynamic para_clinical_investigations { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic treatment { get; set; }
        public dynamic treatment_period { get; set; }
        public dynamic recommendation { get; set; }
        public dynamic treatment_plan { get; set; }
        #endregion
        
        public McModel(string document_id, string location) : base(document_id, location)
        {
        }
        public McModel(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        protected override void DefaultDocument()
        {

        }
    }
}

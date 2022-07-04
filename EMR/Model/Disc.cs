using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class Disc : EmrDocument
    {
        #region Properties
        public override string api { get => "api/disc"; }
        public dynamic no_discharge { get; set; }
        public dynamic disc_ward_code { get; set; }
        public dynamic disc_ward_desc { get; set; }
        public dynamic no_health_insurance { get; set; }
        public dynamic valid_from { get; set; }
        public dynamic disc_date_time { get; set; }
        public dynamic diagnosis { get; set; }
        public dynamic disc_medication { get; set; }
        public dynamic followup_instruc { get; set; }
        public dynamic notes { get; set; }
        public dynamic signature_date { get; set; }
        #endregion
        public Disc(string document_id, string location) : base(document_id, location)
        {
        }

        public Disc(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }
    }
}

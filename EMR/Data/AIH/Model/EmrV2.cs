using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Model
{
    public class EmrV2 : EmrV1
    {
        public EmrV2()
        {
        }

        public EmrV2(string document_id, string location) : base(document_id, location)
        {
        }

        public EmrV2(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }
        #region
        public string transfer_hospital_name { get; set; }
        public string transfer_hospital_employee { get; set; }
        public string transfer_hospital_phone { get; set; }
        #endregion
    }
}

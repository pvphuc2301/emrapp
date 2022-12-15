using EMR.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;
using Telerik.Web.UI.Map;

namespace EMR.Data.AIH.Model
{
    public class Adre : EmrDocument
    {
        public bool IsFirstCreated(string location) => Logs(location)?.Rows.Count == 1;
        public Adre()
        {
        }

        public Adre(string document_id, string location)
        {
            this.document_id = Guid.Parse(document_id);
        }

        public Adre(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        public override string api => "api/admis";
        #region Properties
        public string admitting_doctor { get; set; }
        public dynamic time_of_admission { get; set; }
        public string expected_duration_hospital { get; set; }
        public string diagnosis_on_admission { get; set; }
        public string isolation_request { get; set; }
        public string admission_department_code { get; set; }
        public string admission_department_desc { get; set; }
        public string admission_department_note { get; set; }
        public string primary_doctor { get; set; }
        public string for_surgical_cases { get; set; }
        public string name_of_expected { get; set; }
        public string other_information_code { get; set; }
        public string other_information_specify { get; set; }
        public string special_request_code { get; set; }
        public string special_request_specify { get; set; }
        #endregion
        protected override void DefaultDocument()
        {

        }
    }
}

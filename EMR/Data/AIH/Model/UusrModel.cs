using EMR.Model;

namespace EMR.Data.AIH.Model
{
    public class UusrModel : EmrDocument
    {
        public UusrModel()
        {
        }

        public UusrModel(string document_id, string location) : base(document_id, location)
        {
        }

        public UusrModel(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        public override string api => "api/uusr";
        #region Properties
        public dynamic diagnosis { get; set; }
        public dynamic left_kidney { get; set; }
        public dynamic right_kidney { get; set; }
        public dynamic urinary_bladder { get; set; }
        public dynamic prostate { get; set; }
        public dynamic post_void_resi_volume { get; set; }
        public dynamic conclusion { get; set; }
        public dynamic recommendation { get; set; }
        #endregion
        protected override void DefaultDocument()
        {

        }
    }
}

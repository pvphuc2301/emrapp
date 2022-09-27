using Newtonsoft.Json;
using System;

namespace EMR.Model
{
    public class COMMUNICABLE_DISEASE_SCREENING
    {
        public bool? high_fever { get; set; }
        public bool? contact_infectious_disease { get; set; }
        public bool? close_contact { get; set; }
        public bool? injectious_risk { get; set; }
        public COMMUNICABLE_DISEASE_SCREENING() { }
        public COMMUNICABLE_DISEASE_SCREENING(string value)
        {
            dynamic result = JsonConvert.DeserializeObject(value);
            high_fever = result.high_fever;
            contact_infectious_disease = result.contact_infectious_disease;
            close_contact = result.close_contact;
            injectious_risk = result.injectious_risk;
        }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
}

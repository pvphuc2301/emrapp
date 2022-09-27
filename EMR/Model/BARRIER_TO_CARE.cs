using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class BARRIER_TO_CARE
    {
        public bool? btc_language { get; set; }
        public string btc_language_note { get; set; }
        public bool? btc_cognitive { get; set; }
        public string btc_cognitive_note { get; set; }
        public bool? btc_sensory { get; set; }
        public string btc_sensory_note { get; set; }
        public bool? btc_religious { get; set; }
        public string btc_religious_note { get; set; }
        public bool? btc_cultural { get; set; }
        public string btc_cultural_note { get; set; }
        public BARRIER_TO_CARE() { }
        public BARRIER_TO_CARE(string value)
        {
            dynamic result = JsonConvert.DeserializeObject(value);
            btc_language = result.btc_language;
            btc_language_note = result.btc_language_note;
            btc_cognitive = result.btc_cognitive;
            btc_cognitive_note = result.btc_cognitive_note;
            btc_sensory = result.btc_sensory;
            btc_sensory_note = result.btc_sensory_note;
            btc_religious = result.btc_religious;
            btc_religious_note = result.btc_religious_note;
            btc_cultural = result.btc_cultural;
            btc_cultural_note = result.btc_cultural_note;
        }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
}

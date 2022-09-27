using Newtonsoft.Json;

namespace EMR.Model
{
    public class FALL_RISK_QUESTION
    {
        public bool? fallen { get; set; }
        public bool? feel_unsteady { get; set; }
        public bool? worry_about_falling { get; set; }
        public FALL_RISK_QUESTION() { }
        public FALL_RISK_QUESTION(string value)
        {
            dynamic result = JsonConvert.DeserializeObject(value);
            fallen = result.fallen;
            feel_unsteady = result.feel_unsteady;
            worry_about_falling = result.worry_about_falling;
        }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
}

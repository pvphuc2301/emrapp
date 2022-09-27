using Newtonsoft.Json;

namespace EMR.Model
{
    public class NUTRITION_SCREENING
    {
        public dynamic previous_weight { get; set; }
        public dynamic weight_change { get; set; }
        public NUTRITION_SCREENING() { }
        public NUTRITION_SCREENING(string value)
        {
            dynamic result = JsonConvert.DeserializeObject(value);
            previous_weight = result.previous_weight;
            weight_change = result.weight_change;
        }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
}

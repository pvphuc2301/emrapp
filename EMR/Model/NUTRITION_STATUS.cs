using Newtonsoft.Json;
using System;

namespace EMR.Model
{
    public class NUTRITION_STATUS
    {
        public dynamic ns_code { get; set; }
        public dynamic ns_score { get; set; }
        public dynamic loss_weight { get; set; }
        public dynamic food_intake { get; set; }
        public dynamic total_score { get; set; }
        public NUTRITION_STATUS() { }
        public NUTRITION_STATUS(string value)
        {
            try
            {
                dynamic result = JsonConvert.DeserializeObject(value);
                ns_code = result.ns_code;
                ns_score = result.ns_score;
                loss_weight = result.loss_weight;
                food_intake = result.food_intake;
                total_score = result.total_score;
            } catch(Exception ex) { Console.WriteLine(ex.Message); }
            
        }
        public static int? CalculateTotalScore(object ns_score, object loss_weight, object food_intake)
        {
            if (ns_score == null && loss_weight == null && food_intake == null)
            {
                return null;
            }

            int total_score = 0;

            if(ns_score != null && int.TryParse(Convert.ToString(ns_score), out int ns_score_parsed))
            {
                total_score += ns_score_parsed;
            }

            if (loss_weight != null && int.TryParse(Convert.ToString(loss_weight), out int loss_weight_parsed))
            {
                total_score += loss_weight_parsed;
            }

            if (food_intake != null && int.TryParse(Convert.ToString(food_intake), out int food_intake_parsed))
            {
                total_score += food_intake_parsed;
            }

            return total_score;
        }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
}

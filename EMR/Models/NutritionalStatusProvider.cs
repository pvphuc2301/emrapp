using System;
using Newtonsoft.Json.Linq;

namespace EMR.Models
{
    public class NutritionalStatusProvider
    {
        public static bool IsRiskofMalnutrition(int score)
        {
            if (score < 2)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public static NutritionalStatus ConvertToObject(string json)
        {
            JObject JObject = JObject.Parse(json);

            NutritionalStatus nutritionalStatus = new NutritionalStatus();
            try
            {
                if (int.TryParse(JObject["total_score"].ToString(), out int total_score))
                {
                    nutritionalStatus.total_score = total_score;
                }
            }
            catch (Exception)
            {

            }
            return nutritionalStatus;
        }
    }
}

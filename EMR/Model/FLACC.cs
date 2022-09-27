using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class FLACC
    {
        public dynamic face { get; set; }
        public dynamic legs { get; set; }
        public dynamic activity { get; set; }
        public dynamic cry { get; set; }
        public dynamic consolability { get; set; }
        public dynamic total_score { get; set; }
        public FLACC() { }
        public FLACC(string value)
        {
            dynamic result = JsonConvert.DeserializeObject(value);
            face = result.face;
            legs = result.legs;
            activity = result.activity;
            cry = result.cry;
            consolability = result.consolability;
            total_score = result.total_score;
        }
        public static int? CalculateTotalScore(string face, string legs, string activity, string cry, string consolability)
        {
            
            if (string.IsNullOrEmpty(face)
                && string.IsNullOrEmpty(legs)
                && string.IsNullOrEmpty(activity)
                && string.IsNullOrEmpty(cry)
                && string.IsNullOrEmpty(consolability))
            {
                return null;
            }

            int total_score = 0;

            if (int.TryParse(face, out int face_parsed))
            {
                total_score += face_parsed;
            };

            if (int.TryParse(legs, out int legs_parsed))
            {
                total_score += legs_parsed;
            };

            if (int.TryParse(activity, out int activity_parsed))
            {
                total_score += activity_parsed;
            };

            if (int.TryParse(cry, out int cry_parsed))
            {
                total_score += cry_parsed;
            };

            if (int.TryParse(consolability, out int consolability_parsed))
            {
                total_score += consolability_parsed;
            };

            return total_score;
        }
        public static string GetConclude(int? total_score)
        {
            if (total_score != null)
            {
                switch (total_score)
                {
                    case 0:
                        return "Không đau/ No pain (0)";
                    case 1:
                    case 2:
                    case 3:
                        return "Đau nhẹ/ Slight pain (1 - 3)";
                    case 4:
                    case 5:
                    case 6:
                        return "Đau vừa/ Considerable pain (4 - 6)";
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                        return "Rất đau/ Worst pain (7 - 10)";
                }
            }
            return null;
        }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
}

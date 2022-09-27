using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Telerik.Windows.Documents.Spreadsheet.Expressions.Functions;

namespace EMR.Model
{
    public class NPASS
    {
        public dynamic crying { get; set; }
        public dynamic behavior { get; set; }
        public dynamic facial_expression { get; set; }
        public dynamic extremities_tone { get; set; }
        public dynamic vital_signs { get; set; }
        public dynamic gestation_3 { get; set; }
        public dynamic gestation_2 { get; set; }
        public dynamic gestation_1 { get; set; }
        public dynamic total_score { get; set; }
        public NPASS() { }
        public NPASS(string value)
        {
            dynamic result = JsonConvert.DeserializeObject(value);
            crying = result.crying;
            behavior = result.behavior;
            facial_expression = result.facial_expression;
            extremities_tone = result.extremities_tone;
            vital_signs = result.vital_signs;
            gestation_3 = result.gestation_3;
            gestation_2 = result.gestation_2;
            gestation_1 = result.gestation_1;
            total_score = result.total_score;
        }
        public static int? CalculateTotalScore(string crying, string behavior, string facial_expression, string extremities_tone, string vital_signs, string gestation_3, string gestation_2, string gestation_1)
        {
            if (string.IsNullOrEmpty(crying)
                && string.IsNullOrEmpty(behavior)
                && string.IsNullOrEmpty(facial_expression)
                && string.IsNullOrEmpty(extremities_tone)
                && string.IsNullOrEmpty(vital_signs)
                && string.IsNullOrEmpty(gestation_3)
                && string.IsNullOrEmpty(gestation_2)
                && string.IsNullOrEmpty(gestation_1))
            {
                return null;
            }

            int npass_crying = 0;
            int npass_behavior = 0;
            int npass_facial_expression = 0;
            int npass_extremities_tone = 0;
            int npass_vital_signs = 0;
            int npass_gestation_3 = 0;
            int npass_gestation_2 = 0;
            int npass_gestation_1 = 0;
            int npass_total_score = 0;

            if (int.TryParse(crying, out int crying_parsed))
            {
                npass_crying = crying_parsed;
            };

            if (int.TryParse(behavior, out int npass_behavior_parsed))
            {
                npass_behavior = npass_behavior_parsed;
            }

            if(int.TryParse(facial_expression, out int facial_expression_parsed))
            {
                npass_facial_expression = facial_expression_parsed;
            }

            if (int.TryParse(extremities_tone, out int extremities_tone_parsed))
            {
                npass_extremities_tone = extremities_tone_parsed;
            }

            if (int.TryParse(vital_signs, out int vital_signs_parsed))
            {
                npass_vital_signs = vital_signs_parsed;
            }

            if (int.TryParse(gestation_3, out int npass_gestation_3_parsed))
            {
                npass_gestation_3 = npass_gestation_3_parsed;
            }

            if (int.TryParse(gestation_2, out int npass_gestation_2_parsed))
            {
                npass_gestation_2 = npass_gestation_2_parsed;
            }

            if (int.TryParse(gestation_1, out int npass_gestation_1_parsed))
            {
                npass_gestation_1 = npass_gestation_1_parsed;
            }

            npass_total_score = npass_crying + npass_behavior + npass_facial_expression + npass_extremities_tone + npass_vital_signs + npass_gestation_3 + npass_gestation_2 + npass_gestation_1;
            
            return npass_total_score;
        }
        public static string GetConclude(int? total_score)
        {
            if (total_score != null)
            {
                if (total_score > 3)
                {
                    return "Đau vừa - nhiều/ Considerable - Serious pain";
                }
                else if (total_score > 0)
                {
                    return "Đau nhẹ/ Slight pain (1 - 3)";
                }
                else if (total_score == 0)
                {
                    return "Không đau/ No pain";
                }
            }
            return null;
        }
        public override string ToString() => JsonConvert.SerializeObject(this);
    }
}

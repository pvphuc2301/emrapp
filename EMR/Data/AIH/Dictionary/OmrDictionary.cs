using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Dictionary
{
    public class OmrDictionary
    {
        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };
        public static Dictionary<string, string> NUTRITIONAL_CONSULTATION_REQUIRED = new Dictionary<string, string>()
        {
            { "N", "Có/ Yes" },
            { "Y", "Không, lý do/ No, reason" }
        };
    }
}

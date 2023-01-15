using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Dictionary
{
    public class MrfvDictionary
    {
        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };
        public static Dictionary<string, string> APPOINTED_VACCINE = new Dictionary<string, string>()
        {
            { "id", "" },
            { "drug_name", "" },
            { "strength", "" },
            { "router", "" },
            { "reason", "" },
        };
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Dictionary
{
    public class PomrDictionary
    {
        public static Dictionary<string, string> TREATMENT_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Ngoại trú/Ambulatory care" },
            { "IPD", "Nhập viện/Admission" },
            { "TRF", "Chuyển viện/Transfer" },
        };
    }
}

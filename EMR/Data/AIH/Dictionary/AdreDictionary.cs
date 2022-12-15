using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Dictionary
{
    public class AdreDictionary
    {
        public const string ADMISSION_DEPARTMENT_DAY = "DAY";
        public const string ADMISSION_DEPARTMENT_MED = "MED";
        public const string ADMISSION_DEPARTMENT_SUR = "SUR";
        public const string ADMISSION_DEPARTMENT_OBG = "OBG";
        public const string ADMISSION_DEPARTMENT_ICU = "ICU";
        public const string ADMISSION_DEPARTMENT_PED = "PED";
        public const string ADMISSION_DEPARTMENT_DEL = "DEL";
        public const string ADMISSION_DEPARTMENT_OPE = "OPE";
        public const string ADMISSION_DEPARTMENT_OTH = "OTH";
        public static Dictionary<string, string> ADMISSION_DEPARTMENT = new Dictionary<string, string>()
        {
            { ADMISSION_DEPARTMENT_DAY , "Daycare ward" },
            { ADMISSION_DEPARTMENT_MED, "Medical ward" },
            { ADMISSION_DEPARTMENT_SUR, "Surgery ward" },
            { ADMISSION_DEPARTMENT_OBG, "OBG ward" },
            { ADMISSION_DEPARTMENT_ICU, "ICU" },
            { ADMISSION_DEPARTMENT_PED, "Pediatric ward" },
            { ADMISSION_DEPARTMENT_DEL, "Delivery suite" },
            { ADMISSION_DEPARTMENT_OPE, "Operating Theatre/OT" },
            { ADMISSION_DEPARTMENT_OTH, "Other" },
        };
        public const string ISOLATION_REQUEST_N = "N";
        public const string ISOLATION_REQUEST_Y = "Y";
        public static Dictionary<string, string> ISOLATION_REQUEST = new Dictionary<string, string>()
        {
            { ISOLATION_REQUEST_N, "Không/ No" },
            { ISOLATION_REQUEST_Y, "Có/ Yes" }
        };
        public const string FOR_SURGICAL_CASES_N = "N";
        public const string FOR_SURGICAL_CASES_Y = "Y";
        public static Dictionary<string, string> FOR_SURGICAL_CASES = new Dictionary<string, string>()
        {
            { FOR_SURGICAL_CASES_N, "Không/ No" },
            { FOR_SURGICAL_CASES_Y, "Có/ Yes" }
        };
        public const string OTHER_INFORMATION_N = "N";
        public const string OTHER_INFORMATION_Y = "Y";
        public static Dictionary<string, string> OTHER_INFORMATION = new Dictionary<string, string>()
        {
            { OTHER_INFORMATION_N, "Không/ No" },
            { OTHER_INFORMATION_Y, "Có/ Yes" }
        };
        public const string SPECIAL_REQUEST_N = "N";
        public const string SPECIAL_REQUEST_Y = "Y";
        public static Dictionary<string, string> SPECIAL_REQUEST = new Dictionary<string, string>()
        {
            { SPECIAL_REQUEST_N, "Không/ No" },
            { SPECIAL_REQUEST_Y, "Có/ Yes" }
        };
    }
}

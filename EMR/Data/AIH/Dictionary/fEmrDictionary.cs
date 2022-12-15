using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Dictionary
{
    public class fEmrDictionary
    {
        public static Dictionary<string, string> CHIEF_COMPLAINT_CODE = new Dictionary<string, string>()
        {
            { "R", "Resuscitation/ Hồi sức" },
            { "E", "Emergency/ Cấp cứu" },
            { "U", "Urgent/ Khẩn trương" },
            { "L", "Less urgent/ Trì hoãn" },
            { "N", "Non-Urgent/ Không cấp cứu" },
        };
        //public class PatientPischarge
        public static Dictionary<string, string> PATIENT_DISCHARGE = new Dictionary<string, string>()
        {
            { "IMP", "Improved/ Có cải thiện" },
            { "UNC", "Unchanged/ Không thay đổi" },
            { "UNS", "Unstable/ Không ổn định" }
        };
        //public class Habits
        public static Dictionary<string, string> HABITS = new Dictionary<string, string>()
        {
            { "A", "Alcohol/ Rượu" },
            { "S", "Smoking/ Thuốc lá" },
            { "D", "Drugs/ Chất gây nghiện" },
            { "O", "Other, specify/ Khác ghi rõ" }
        };
        public static Dictionary<string, string> TREATMENT = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "DateTime" },
            { "medication", "" },
            { "dose", "" },
            { "route", "" },
            { "comment", "" },
        };
        public static Dictionary<string, string> PROGRESS_NOTE = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "DateTime" },
            { "progress", "" },
            { "appropriate_order", "" },
        };
    }
}

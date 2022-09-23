using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class PAIN_ASSESSMENT_TYPE {
        public const string NumericAndFaces = "NaF";
        public const string FLACC = "FLACC";
        public const string N_PASS = "NPASS";
        public const string Non_Verbal = "NONV";
    }

    public class EmrDictionary
    {
        #region 
        public static Dictionary<string, string> NUTRITION_STATUS_CODE = new Dictionary<string, string>()
        {
            { "U", "Suy dinh dưỡng/ Undernutrition" },
            { "O", "Thừa cân hoặc béo phì/ Overweight or obesity" },
            { "N", "Bình thường/ Normal" },
        };

        public static Dictionary<string, string> PAINT_SCORE_CODE = new Dictionary<string, string>()
        {
            { "0", "Không đau/ No hurt" },
            { "1", "Đau rất ít/ Little hurt" },
            { "2", "Đau nhẹ/ Slight hurt" },
            { "3", "Đau vừa/ Considerable hurt" },
            { "4", "Đau nhiều/ Serious hurt" },
            { "5", "Rất đau/ Worst hurt" },
        };

        public static Dictionary<string, string> HOUSING_CODE = new Dictionary<string, string>()
        {
            { "ALN", "Sống một mình<div> Lives alone</div>" },
            { "REL", "Sống với người thân<div> With relatives</div>" },
        };

        public static Dictionary<string, string> PRIORITIZATION_CODE = new Dictionary<string, string>()
        {
            { "IM", "Cần được khám ngay/ Immediate consulting requirement" },
            { "WA", "Có thể chờ khám trong khoảng thời gian xác định/ Be able to wait for consultation at a specific time" },
        };
        #endregion

        public static Dictionary<string, string> DISC_WARD_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "K18", "Khoa Nhi – Săn sóc đặc biệt sơ sinh" },
            { "K03", "Khoa Nội Tổng Hợp" },
            { "K26", "Khoa Gây mê – Hồi sức" },
            { "K19", "Khoa Ngoại Tổng Hợp" },
            { "K02", "Khoa Cấp cứu" },
            { "K27", "Khoa Sản – Phụ khoa" },
            { "K48", "Khoa Hồi sức tích cực – Chống độc" },
        };
        #region Emergency Medical Record (Assessment)
        public static Dictionary<string, string> ChiefComplaintCode = new Dictionary<string, string>()
        {
            { "R", "Resuscitation/ Hồi sức" },
            { "E", "Emergency/ Cấp cứu" },
            { "U", "Urgent/ Khẩn trương" },
            { "L", "Less urgent/ Trì hoãn" },
            { "N", "Non-Urgent/ Không cấp cứu" },
        };
        //public class PatientPischarge
        public static Dictionary<string, string> PatientDischarge = new Dictionary<string, string>()
        {
            { "IMP", "Improved/ Có cải thiện" },
            { "UNC", "Unchanged/ Không thay đổi" },
            { "UNS", "Unstable/ Không ổn định" }
        };
        //public class Habits
        public static Dictionary<string, string> Habits = new Dictionary<string, string>()
        {
            { "A", "Alcohol/ Rượu" },
            { "S", "Smoking/ Thuốc lá" },
            { "D", "Drugs/ Chất gây nghiện" },
            { "O", "Other, specify/ Khác ghi rõ" }
        };
        public static Dictionary<string, string> Treatment = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "DateTime" },
            { "medication", "" },
            { "dose", "" },
            { "route", "" },
            { "comment", "" },
        };
        public static Dictionary<string, string> ProgressNote = new Dictionary<string, string>()
        {
            { "id", "" },
            { "time", "DateTime" },
            { "progress", "" },
            { "appropriate_order", "" },
        };
        #endregion
    }
}

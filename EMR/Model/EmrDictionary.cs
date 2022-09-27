using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class PRIORITIZATION_CODE
    {
        public const string IMMEDIATE_CONSULTING_REQUIREMENT = "IM";
        public const string BE_ABLE_TO_WAIT_FOR_CONSULTATION_AT_A_SPECIFIC_TIME = "WA";
    }
    public class PAIN_ASSESSMENT_TYPE {
        public const string NumericAndFaces = "NaF";
        public const string FLACC = "FLACC";
        public const string N_PASS = "NPASS";
        public const string Non_Verbal = "NONV";
    }

    public class EmrDictionary
    {
        #region
        public static Dictionary<string, string> PATIENT_EDUCATION_NEEDS = new Dictionary<string, string>()
        {
            { "FAL", "Phòng ngừa té ngã/ Fall risk prevention" },
            { "WOU", "Chăm sóc vết thương/ Wound care" },
            { "DIE", "Chế độ ăn uống/ Diet" },
            { "PAI", "Đau/ Pain" },
            { "OTH", "" },
        };
        public static Dictionary<string, string> IM_CONSUL_REQ = new Dictionary<string, string>()
        {
            { "EME", "Tình trạng nặng cần xử lí ngay/ Emergency cases" },
            { "CHI", "Trẻ em dưới 6 tuổi/ Children are under 6 years of age" },
            { "SER", "Người khuyết tật nặng/ Servere disabilities" },
            { "PAT", "Người bệnh trên 80 tuổi/ Patient are over 80 years of age" },
            { "PRE", "Phụ nữ có thai trên 24 tuần/ Prenancy is over 24 weeks" },
            { "BOO", "Người bệnh có hẹn/ Booked appointment patients" },
            { "OTH", "" },
        };
        public static Dictionary<string, string> INTERVENTION = new Dictionary<string, string>()
        {
            { "UNI", "Phòng ngừa té ngã thường quy/ Universe fall risk prevention" },
            { "STI", "Dán sticker nguy cơ ngã/ Stick fall-risk on patient's shirt" },
            { "EDU", "Thông báo nguy cơ té ngã cho người bệnh/ người nhà/ Educate the fall risk to patient/ Relatives" },
            { "ASS", "Trợ giúp người bệnh di chuyển, đi lại/ Assist patient with transfer/ ambulation" },
            { "STR", "Cung cấp dụng cụ hỗ trợ di chuyển (Băng ca, xe đẩy...)/ Assist patient with transfer/ ambulation (Stretcher, wheelchair)" },
            { "EPA", "Hướng dẫn ba mẹ/ người thân bệnh nhi luôn quan sát bé cẩn thận và luôn ở cùng bé/ Educate Parents to keep an eye on their children closely and never let him/her alone" },
            { "INS", "Hướng dẫn ba mẹ/ người thân bệnh nhi hạn chế cho bé chạy nhảy/ Instruct Parents/ accompanying family members limit the child to run." },
            { "ENC", "Khuyến khích di chuyển bằng nôi/ xe nôi đối với trẻ sơ sinh và nhủ nhi/ Encourage parents/ Caregivers to use cribs for newborn/ neonatal in moving" },
            { "PFR", "Đeo vòng tay nguy cơ ngã khi/ Place Fall Risk ID bracelet on patient in cases of" }
        };
        public static Dictionary<string, string> FALL_RISK_FACTORS = new Dictionary<string, string>()
        {
            { "AGR", "Tuổi > 65/ Age > 65" },
            { "PRE", "Phụ nữ có thai/ Pregnant women" },
            { "INA", "Không có khả năng đứng lên từ ghế/ Inability to rise from a chair." },
            { "POD", "Mất trí nhớ/ Presence of dementia" },
            { "IMP", "Giảm/ Mất thị lực/ Patients with visual impairments" },
            { "EAR", "Bệnh nhân có vấn đề về tai có triệu chứng chóng mặt/ Patients have ear problems with complaints of dizziness and/or vertigo." },
            { "PSY", "Đang sử dụng bất kỳ thuốc thuộc nhóm an thần/ Any Administered Psycholeptics: Diazepam, Tofisopam, Eszopiclone, Midazolam, Rotudin, Etifoxine chlorhydrate" },
            { "ADE", "Đang sử dụng bất kỳ thuốc thuộc nhóm chống trầm cảm/ Any Administered Antidepressant: Citalopram, SERTRAline, Amitriptyline, Mirtazapine" },
            { "APS", "Đang sử dụng bất kỳ thuốc thuộc nhóm điều trị loạn thần/ Any administered antipsychotic: Haloperidol, Olanzapine, Quetiapine, Risperidone, Olanzapine, Quetiapine" },
            { "ACO", "Đang sử dụng bất kỳ thuốc chống đông máu/ Any administered anticoagulant: Heparin Sodium, Anoxaparin, Rivaroxaban, Acenocoumarol..." },
            { "ALE", "Tuổi < 3/ Age < 3" },
            { "AMB", "Sử dụng phương tiện hỗ trợ đi lại (gậy/nạng/khung tập đi)/ Ambulatory devices (canes, crutches, and walkers)" },
            { "PAT", "Dáng đi yếu hoặc mất thăng bằng/ Patients with gait or balance disturbances" },
            { "AEP", "Đang sử dụng bất kỳ loại thuốc thuộc nhóm chống động kinh, chống co giật/ Any administered Antiepileptics, Anticonvulsants: Cardamazepine, Divolproex Sodium, Gabapentin, Lamotrigine, Phenobarbital, Phenytoin, Topiramate, Valproic Acid, Levetiracetam, Pregabalin" },
            { "AHY", "Đang sử dụng bất kỳ thuốc thuộc nhóm điều trị tăng huyết áp/ Any administered Antihypertensive Medication: Captopril, Perindopril and amlodipine, Irbesartan and diuretics, Valsartan, Nifedipine, Lisinopril, Furosemide + Spironolacton, BISOprolol, METOprolol succinate..." },
            { "NFR", "Không có yếu tố nguy cơ/ No fall risk." },
        };

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
            { "ALN", "Sống một mình/ Lives alone" },
            { "REL", "Sống với người thân/ With relatives" },
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

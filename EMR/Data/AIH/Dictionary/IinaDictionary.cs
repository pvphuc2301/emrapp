using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Dictionary
{
    public class IinaDictionary
    {
        public static Dictionary<string, string> PRES_SORE_RISK_CODE = new Dictionary<string, string>()
        {
            { "H", "Cao/ High" },
            { "L", "Thấp/ Low" },
            { "V", "Rất cao/ Very high" },
        };
        public static Dictionary<string, string> RESIDENCE_CODE = new Dictionary<string, string>()
        {
            { "VNM", "Việt Nam" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> ARRIVED = new Dictionary<string, string>()
        {
            { "W", "Tự đi được/ Walking" },
            { "WC", "Bằng xe lăn/ Wheelchair" },
            { "S", "Bằng băng ca/ Stretcher" },
        };
        public static Dictionary<string, string> LANGUAGE_CODE = new Dictionary<string, string>()
        {
            { "VI", "Tiếng Việt" },
            { "EN", "Tiếng Anh" },
            { "OTH", "Tiếng khác" },
        };
        public static Dictionary<string, string> RELIGION_CODE = new Dictionary<string, string>()
        {
            { "CH", "Thiên chúa giáo" },
            { "BH", "Phật giáo/ Buddhism" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> LIVING_STATUS_CODE = new Dictionary<string, string>()
        {
            { "ALN", "Một mình/ Alone" },
            { "WTH", "Với vợ, chồng, con, anh, chị, em ruột/ With spouse, children, sibling" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> PULSE_CODE = new Dictionary<string, string>()
        {
            { "I", "Không đều/Irregular" },
            { "R", "Đều/ Regular" },
        };
        public static Dictionary<string, string> SUBSTANCE_ABUSE = new Dictionary<string, string>()
        {
            { "A", "Rượu bia/ Acohol" },
            { "OTH", "Khác/ Other" },
            { "S", "Hút thuốc/ Smoking" },
        };
        public static Dictionary<string, string> HOSPITAL_CONCERN_CODE = new Dictionary<string, string>()
        {
            { "NON", "Không/ None" },
            { "WOR", "Lo âu/ Worriedness" },
            { "OTH", "Khác/ Others" },
            { "REL", "Gia đình, các mối quan hệ/ Family, relationship issues" },
            { "FIN", "Tài chính/ Financial" },
        };
        public static Dictionary<string, string> ADMIT_FROM_CODE = new Dictionary<string, string>()
        {
            { "OTH", "Khác/Referral" },
            { "ER", "Khoa cấp cứu/ ER" },
            { "OPD", "Khoa khám bệnh/ OPD" },
            { "VD", "Bác sĩ hơp tác/ Visiting Doctor" },
        };
        public static Dictionary<string, string> FR_MENTAL_STATUS_CODE = new Dictionary<string, string>()
        {
            { "0", "Hiểu được giới hạn bản thân/Understands limitations = 0" },
            { "15", "Không hiểu được giới hạn bản thân/Does not understand limitation = 15" },
        };
        public static Dictionary<string, string> GAIT_TRANS_CODE = new Dictionary<string, string>()
        {
            { "0", "Bình thường, nằm tại giường/Normal, bedrest = 0" },
            { "10", "Yếu/Weak = 10" },
            { "20", "Suy yếu/Impaired = 20" },
        };
        public static Dictionary<string, string> INTRA_THERAPY_CODE = new Dictionary<string, string>()
        {
            { "0", "Không/No = 0" },
            { "20", "Có/Yes = 20" },
        };

        public static Dictionary<string, string> AMBULATION_CODE = new Dictionary<string, string>()
        {
            { "BF", "Liệt giường/ Bedfast" },
            { "NA", "Cần hỗ trợ (ghi rõ)/ Need assistance (specify)" },
            { "IN", "Tự đi/ Independent" },
        };

        public static Dictionary<string, string> AMBULA_AIDS_CODE = new Dictionary<string, string>()
        {
            { "0", "Không di chuyển, nằm tại giường, điều dưỡng hỗ trợ/ None, bedrest, wheelchair, nurse assist = 0" },
            { "15", "Nạng, thiết bị hỗ trợ đi lại/Crutches, cane walker = 15" },
            { "30", "Sử dụng vật dụng hỗ trợ/Furniture = 30" },
        };

        public static Dictionary<string, string> SECON_DIAGNOSIS_CODE = new Dictionary<string, string>()
        {
            { "0", "Không/No = 0" },
            { "15", "Có/Yes = 15" },
        };
        public static Dictionary<string, string> FALL_HISTORY_CODE = new Dictionary<string, string>()
        {
            { "0", "Không/No = 0" },
            { "25", "Có/Yes = 25" },
        };

        public static Dictionary<string, string> URINATION_CODE = new Dictionary<string, string>()
        {
            { "DY", "Khó tiểu/ Dysuria" },
            { "FR", "Thường xuyên/ Frequency" },
            { "IN", "Không kiểm soát/ Incontinece" },
            { "NM", "Không có vấn đề/ Normal" },
            { "NO", "Tiểu đêm/ Nocturia" },
        };

        public static Dictionary<string, string> NUTRITION_SCORE1_CODE = new Dictionary<string, string>()
        {
            { "1", "Sụt cân > 5% trong 3 tháng Weight loss > 5% in 3 months" },
            { "2", "Ăn ít 50%-75% so với nhu cầu ăn bình thường trong tuần qua Food intake below 50 - 75% of normal requirement in preceding week" },
        };

        public static Dictionary<string, string> NUTRITION_SCORE2_CODE = new Dictionary<string, string>()
        {
            { "1", "Sụt cân > 5% trong 2 tháng Weight loss > 5% in 2 months" },
            { "2", "BMI 18.5-20.5 và tổng trạng suy yếu BMI 18.5 - 20.5 and impaired general condition" },
            { "3", "Ăn ít 25%-50% so với nhu cầu ăn bình thường trong tuần qua Food intake 25–50% of normal requirement in preceding week" },
        };

        public static Dictionary<string, string> NUTRITION_SCORE3_CODE = new Dictionary<string, string>()
        {
            { "1", "Sụt cân > 5% trong 1 tháng Weight loss > 5% in 1 month" },
            { "2", "BMI < 18.5 và tổng trạng suy yếu BMI < 18.5 and impaired general condition" },
            { "3", "Ăn ít 0-25% so với nhu cầu ăn bình thường trong tuần qua Food intake 0-25% of normal requirement in preceding week" },
        };

        public static Dictionary<string, string> SEVERITY_SCORE1_CODE = new Dictionary<string, string>()
        {
            { "1", "Gãy khớp háng/ Hip fracture" },
            { "2", "Bệnh mãn tính có kèm theo biến chứng/ Chronic disease with complications" },
            { "3", "Viêm phổi tắc nghẽn mãn tính/ COPD" },
            { "4", "NB yếu nhưng có thể di chuyển được/ The patient is weak but can move out of bed" },
        };

        public static Dictionary<string, string> SEVERITY_SCORE2_CODE = new Dictionary<string, string>()
        {
            { "1", "Có phẫu thuật ở bụng/ Major abdominal surgery" },
            { "2", "Đột quị/ Stroke" },
            { "3", "Viêm phổi nặng/ Severe pneumonia" },
            { "4", "Bệnh ác tính huyết học/ Hematologic malignancy" },
            { "5", "NB nằm liệt giường/ The patient is bedridden" },
        };

        public static Dictionary<string, string> SEVERITY_SCORE3_CODE = new Dictionary<string, string>()
        {
            { "1", "Chấn thương đầu/ Head injury" },
            { "2", "Ghép tủy xương/ Bone marrow transplantation" },
            { "3", "Bệnh nhân chăm sóc chuyên sâu (APACHE> 10)/ Intensive care patients (APACHE > 10)" },
        };

        public static Dictionary<string, string> HIGH_RISK_PATIENT_CODE = new Dictionary<string, string>()
        {
            { "CH", "Trẻ em (< hoặc 8 tuổi)/ Children (<8 years old)" },
            { "SDP", "Những người bệnh tàn tật năng/ Severely disabled patients" },
            { "ELD", "Người cao tuổi (80 tuổi hoặc hơn)/ Elderly people (80 years old or above)" },
            { "HRF", "Những người bệnh có nguy cơ té ngã cao/ Patients with high risk of falls" },
            { "CCP", "Những người bệnh lú lẫn/hôn mê/ Confused or comatose patients" },
            { "RES", "Người bệnh bị kìm giữ/ Restrained patients" },
            { "HRT", "Người bệnh đang điều trị có nguy cơ cao (như chạy thận nhân tạo, hóa trị liệu..)/ Patients that receiving high-risk treatments (such as dialysis, chemotherapy…)" },
        };

        public static Dictionary<string, string> RESPIRATORY_SYSTEM_CODE = new Dictionary<string, string>()
        {
            { "N", "Không có vấn đề/ Normal" },
            { "D", "Khó thở/ Dyspnea" },
            { "O", "Khó thở nằm/ Orthopnea" },
            { "W", "Khó thở khò khè/ Wheeze" },
            { "C", "Da xanh tái/ Cyanosis" },
        };

        public static Dictionary<string, string> PRESENCE_CODE = new Dictionary<string, string>()
        {
            { "CP", "Đau ngực/ Chest pain" },
            { "DI", "Chóng mặt/ Dizzinness" },
            { "CA", "Đau bắp chân/ Calf pain" },
            { "PE", "Phù ngoại biên/ Peripheral edema" },
        };

        public static Dictionary<string, string> EXTREMITIES_CODE = new Dictionary<string, string>()
        {
            { "WA", "Ấm/ Warm" },
            { "CO", "Lạnh/ Cold" },
            { "CL", "Ẩm ướt/ Clammy" },
            { "CY", "Xanh tái/ Cyanosed" },
        };

        public static Dictionary<string, string> ORIENTED_CODE = new Dictionary<string, string>()
        {
            { "DAY", "Ngày/ Day" },
            { "TIME", "Thời gian/ Time" },
            { "PER", "Người/ Person" },
            { "PLA", "Nơi/ Place" },
            { "NA", "Không định hướng được/ Not all all" },
        };

        public static Dictionary<string, string> MENTAL_STATUS_CODE = new Dictionary<string, string>()
        {
            { "AL", "Tỉnh táo/ Alert" },
            { "CF", "Nhầm lẫn/ Confused" },
            { "AG", "Kích động/ Agitated" },
            { "FR", "Quấy/ Fretful" },
            { "OTH", "Khác/ Other" },
            { "DE", "Trầm cảm/ Depressed" },
            { "LE", "Lơ mơ/ Lethargic" },
        };

        public static Dictionary<string, string> HEARING_CODE = new Dictionary<string, string>()
        {
            { "N", "Bình thường/ Normal" },
            { "HI", "Khiếm thính/ Hearing impaired" },
            { "HA", "Dùng máy trợ thính (Trái/Phải)/ Uses hearing aid (Left/Right)" },
        };

        public static Dictionary<string, string> DIET_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "BF", "Bú bình/ Bottle feeding" },
            { "TBF", "Bú mẹ hoàn toàn/ Total breast feeding" },
            { "OTH", "Khác/ Other" },
        };

        public static Dictionary<string, string> DIET_PRE_CODE = new Dictionary<string, string>()
        {
            { "V", "Nôn/ Vomiting" },
            { "N", "Buồn nôn/ Nausea" },
            { "S", "Nuốt khó (chuyển đến chuyên gia trị liệu)/ Swalloing difficulties (refer to therapist)" },
        };

        public static Dictionary<string, string> BOWEL_ELIMINATION_CODE = new Dictionary<string, string>()
        {
            { "TWO", "2 lần/ ngày (2 times/day)" },
            { "ONE", "1 lần/ ngày (1 time/day)" },
            { "EOD", "Cách ngày/ Every other day" },
            { "OTH", "Khác/ Other" },
        };

        public static Dictionary<string, string> STOOL_CONSISTENCY_CODE = new Dictionary<string, string>()
        {
            { "H", "Cứng/ Hard" },
            { "F", "Có hình dạng/ Formed" },
            { "L", "Lỏng/ Loose" },
            { "W", "Phân nước/ Watery" },
        };

        public static Dictionary<string, string> GAS_PRESENCE_CODE = new Dictionary<string, string>()
        {
            { "N", "Bình thường/ Normal" },
            { "I", "Không kiểm soát/ Incontinence" },
            { "S", "Hậu môn nhân tạo/ Stoma" },
        };

        public static Dictionary<string, string> VISION_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "GL", "Đeo kính/ Glasses" },
            { "CL", "Kính sát tròng/ Contact lenses" },
            { "OTH", "Khác/ Other" },
        };

        public static Dictionary<string, string> SPEECH_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "SL", "Nói lắp/ Slurred" },
            { "AP", "Chứng mất ngôn ngữ/ Aphasic" },
            { "NC", "Không giao tiếp (Bất tỉnh or mê)/ Non-communicative(Unconscious )" },
            { "SI", "Khiếm ngôn/ Speech impaired" },
            { "NV", "Chưa biết nói/ Non-verbal" },
        };

        public static Dictionary<string, string> MENSTRUATION_CODE = new Dictionary<string, string>()
        {
            { "ME", "Mãn kinh/ Menopause" },
            { "AM", "Vô kinh/ Amenorrhea" },
            { "CY", "Chu kỳ (ngày)/ Cycle (day)" },
        };

        public static Dictionary<string, string> CONTRACEPTION_CODE = new Dictionary<string, string>()
        {
            { "NO", "Không/ No" },
            { "PILL", "Thuốc ngừa thai/ Contraceptive pill" },
            { "OTH", "Khác/ Other" },
            { "DEV", "Dụng cụ ngừa thai đặt trong tử cung/ Intrauterine Device" },
        };

        public static Dictionary<string, string> MUS_HISTORY = new Dictionary<string, string>()
        {
            { "JP", "Đau khớp/ Joint pain" },
            { "MS", "Sự co rút cơ/ Muscle spasms" },
            { "NM", "Bình thường/ Normal" },
            { "JS", "Sưng khớp/ Joint swelling" },
        };

        public static Dictionary<string, string> CONDITION_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "PA", "Tái/ Pale" },
            { "FL", "Đỏ/ Flush" },
            { "JA", "Vàng da/ Jaundiced" },
            { "DR", "Khô/ Dry" },
            { "OI", "Nhờn/ Oily" },
            { "SW", "Nhiều mồ hôi/ Sweaty" },
            { "RA", "Phát ban/ Rash" },
        };

        public static Dictionary<string, string> WOUNDS_CODE = new Dictionary<string, string>()
        {
            { "1", "Máu tụ (1)/ Haematoma" },
            { "2", "Sự thâm tím (2)/ Bruises" },
            { "3", "Rách (3)/ Laceration" },
            { "4", "Sẹo (4)/ Scar" },
            { "5", "Phỏng (5)/ Burn" },
            { "6", "Loét do tỳ đè (6)/ Pressure sore" },
        };

        public static Dictionary<string, string> BATHING_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự tắm/ Independent" },
            { "AS", "Cần sự hỗ trợ khi tắm/ Assisted in shower" },
            { "DB", "Tự tắm tại giường/ Dependent in bed" },
            { "AB", "Hỗ trợ tắm tại giường/ Assisted in bed" },
        };

        public static Dictionary<string, string> ORAL_CARE_CODE = new Dictionary<string, string>()
        {
            { "AB", "Hỗ trợ đánh răng/ Assisted to brush teeth" },
            { "PU", "Chỉ chuẩn bị đồ dùng/ Prepare utensils only" },
            { "OC", "Tự làm/ Independent" },
            { "OTH", "." }
        };

        public static Dictionary<string, string> DENTURES_CODE = new Dictionary<string, string>()
        {
            { "P", "Từng phần/ Partial" },
            { "L", "Hàm dưới/ Lower" },
            { "N", "Không có/ None" },
            { "U", "Hàm trên/ Upper" },
        };

        public static Dictionary<string, string> TOILET_USE_CODE = new Dictionary<string, string>()
        {
            { "AC", "Cần hỗ trợ trên ghế dùng để tiểu tiện trong phòng/ Assisted on the commode" },
            { "AT", "Cần hỗ trợ khi đi vệ sinh/ Assisted to the toilet" },
            { "BU", "Bô dùng tại giường/ Bedpan/urine bottle" },
            { "CA", "Ống thông tiểu/ Urinary catheter" },
            { "DI", "Tã/ Diaper" },
            { "IN", "Tự vệ sinh/ Independent" },
            { "UC", "Ống thông tiểu đặt ngoài bàng quang/ Urinary condom" },
        };

        public static Dictionary<string, string> DRESSING_CODE = new Dictionary<string, string>()
        {
            { "WA", "Cần hỗ trợ/ With assistance" },
            { "IN", "Tự làm/ Independent" },
        };

        public static Dictionary<string, string> EATING_CODE = new Dictionary<string, string>()
        {
            { "DP", "Phụ thuộc về tư thế/ Dependon position" },
            { "TU", "Cho ăn qua ống/ NG tube/Gastrostomy" },
            { "DA", "Phụ thuộc về ăn uống/ Dependent to eat" },
            { "IN", "Tự ăn/ Independent" },
        };

        public static Dictionary<string, string> TURNING_BED_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự xoay sở/ Independent" },
            { "DN", "Không tự xoay sở/ Does not turn independently" },
        };

        //public static Dictionary<string, string> AMBULATION_CODE = new Dictionary<string, string>()
        //{
        //    { "BF", "Liệt giường/ Bedfast" },
        //    { "NA", "Cần hỗ trợ (ghi rõ)/ Need assistance (specify)" },
        //    { "IN", "Tự đi/ Independent" },
        //};

        public static Dictionary<string, string> SLEEP_CODE = new Dictionary<string, string>()
        {
            { "PFA", "Khó ngủ/ Problem to fall asleep" },
            { "PST", "Khó ngủ say/ Problem to sleep through" },
            { "NM", "Bình thường/ Normal" },
            { "AE", "Thức sớm/ Awake early" },
        };

        public static Dictionary<string, string> SENSORY_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Giới hạn hoàn toàn/ Completely limited" },
            { "2", "2_Giới hạn nhiều/ Very limited" },
            { "3", "3_Giới hạn ít/ Slightly limited" },
            { "4", "4_Không giới hạn/ No limitations" },
        };

        public static Dictionary<string, string> MOISTURE_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Liên tục ẩm/ Constantly moist" },
            { "2", "2_Thường ẩm/ Often moist" },
            { "3", "3_Thỉnh thoảng ẩm/ Occasionally moist" },
            { "4", "4_Hiếm khi ẩm/ Rarely moist" },
        };

        public static Dictionary<string, string> ACTIVITY_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Nằm liệt giường/ Bedfast" },
            { "2", "2_Cố định trên ghế/ Chairfast" },
            { "3", "3_Thỉnh thoảng đi lại Walks/ occasionally moist" },
            { "4", "4_Đi lại thường xuyên/ Walks frequently" },
        };

        public static Dictionary<string, string> MOBILITY_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Hoàn toàn bất động/ Completely immobile" },
            { "2", "2_Rất hạn chế/ Very limited" },
            { "3", "3_Ít hạn chế/ Slightly limited" },
            { "4", "4_Không giới hạn/ No limitations" },
        };

        public static Dictionary<string, string> NUTRITION_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Rất kém/ Very poor" },
            { "2", "2_Có thể không đầy đủ/ Probably inadequate" },
            { "3", "3_Đầy đủ/ Adequate" },
            { "4", "4_Hoàn hảo/ Excellent" },
        };

        public static Dictionary<string, string> FRICTION_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "1", "1_Có vấn đề/ Problem" },
            { "2", "2_Vấn đề tiềm ẩn/ Potential problem" },
            { "3", "3_Không có vấn đề/ No problem" },
        };

        public static Dictionary<string, string> SKIN_ANNO = new Dictionary<string, string>()
        {
            { "id", "" },
            { "location", "" },
            { "type", "" },
        };
    }
}

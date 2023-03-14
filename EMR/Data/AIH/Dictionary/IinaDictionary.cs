using EMR.Data.Shared.Services;
using EMR.icons;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web.Services.Description;
using Telerik.Web;
using Telerik.Web.UI.HtmlChart;
using Telerik.Web.UI.Map;
using Telerik.Windows.Documents.Model.Drawing.Charts;
using Telerik.Windows.Documents.Spreadsheet.Expressions.Functions;

namespace EMR.Data.AIH.Dictionary
{
    public class IinaDictionary
    {
        #region I. THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ GENERAL PATIENT INFORMATION
        public static Dictionary<string, string> RESIDENCE_CODE = new Dictionary<string, string>()
        {
            { "VNM", "Việt Nam" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> LANGUAGE_CODE = new Dictionary<string, string>()
        {
            { "VI", "Tiếng Việt" },
            { "EN", "Tiếng Anh" },
            { "OTH", "Tiếng khác" },
        };
        public static Dictionary<string, string> RELIGION_CODE = new Dictionary<string, string>()
        {
            { "BH", "Phật giáo/ Buddhism" },
            { "CH", "Thiên chúa giáo/ Catholic" },
            { "OTH", "Khác" },
        };
        public static Dictionary<string, string> LIVING_STATUS_CODE = new Dictionary<string, string>()
        {
            { "ALN", "Một mình/ Alone" },
            { "WTH", "Gia đình/ Family" },
            { "OTH", "Khác/ Other" },
        };
        public static Dictionary<string, string> HOSPITAL_CONCERN_CODE = new Dictionary<string, string>()
        {
            { "NON", "Không/ None" },
            { "REL", "Gia đình, các mối quan hệ/ Family, relationship issues" },
            { "FIN", "Tài chính/ Financial" },
            { "WOR", "Lo âu/ Worriedness" },
            { "OTH", "Khác/ Others" },
        };
        #endregion

        #region II. BỆNH SỬ/ MEDICAL HISTORY
        public static Dictionary<string, string> ADMIT_FROM_CODE = new Dictionary<string, string>()
        {
            { "OPD", "Khoa khám bệnh/ OPD" },
            { "ER", "Khoa cấp cứu/ Emergency" },
            { "VD", "Bác sĩ hợp tác/ Visiting Doctor" },
            { "OTH", "Khác/Referral" },
        };
        public const string ARRIVED_W = "W";
        public const string ARRIVED_WC = "WC";
        public const string ARRIVED_S = "S";
        public const string ARRIVED_O = "O";
        public static Dictionary<string, string> ARRIVED = new Dictionary<string, string>()
        {
            { ARRIVED_W, "Tự đi được/ Walking" },
            { ARRIVED_WC, "Bằng xe lăn/ Wheelchair" },
            { ARRIVED_S, "Bằng băng ca/ Stretcher" },
            { ARRIVED_O, "Khác/ Other" },
        };
        public const string SUBSTANCE_ABUSE_S = "S";
        public const string SUBSTANCE_ABUSE_A = "A";
        public const string SUBSTANCE_ABUSE_OTH = "OTH";
        public static Dictionary<string, string> SUBSTANCE_ABUSE = new Dictionary<string, string>()
        {
            { "S", "Hút thuốc/ Smoking" },
            { "A", "Rượu bia/ Acohol" },
            { "OTH", "Khác/ Other" },
        };

        public static Dictionary<string, string> HIGH_RISK_PATIENT_CODE = new Dictionary<string, string>()
        {
            //{ "HRT", "Người bệnh đang điều trị có nguy cơ cao (như chạy thận nhân tạo, hóa trị liệu..)/ Patients that receiving high-risk treatments (such as dialysis, chemotherapy…)" },
            { "HRT", "Người bệnh đang điều trị hóa trị liệu/ Patients are receiving chemotherapy" },
            //{ "ELD", "Người cao tuổi (80 tuổi hoặc hơn)/ Elderly people (80 years old or above)" },
            { "ELD", "Người cao tuổi (≥ 80 tuổi)/ Elderlies (≥ 80 years)" },
            { "WIL", "Sản phụ đang chuyển dạ/ Women in labor" }, //+
            { "ROS", "Người bệnh có nguy cơ tự tử hoặc tự làm hại bản thân/ Patients are at risk of suicide or seft-harm" }, //+
            //{ "SDP", "Những người bệnh tàn tật năng/ Severely disabled patients" },
            { "SDP", "Người bệnh tàn tật nặng/ Severe disabled patients" },
            //{ "CCP", "Những người bệnh lú lẫn/hôn mê/ Confused or comatose patients" },
            { "CCP", "Người bệnh lú lẫn/hôn mê/ Confused or comatose patients" },
            { "PSP", "Sản phụ có thai lưu/ sảy thai/ chấm dứt thai kỳ/ Patient with stillbirth pregnancy/ abortion/ experiencing terminations in pregnancy" }, //+
            { "RES", "Người bệnh bị kìm giữ/ Restrained patients" },
            //{ "HRF", "Những người bệnh có nguy cơ té ngã cao/ Patients with high risk of falls" },
            { "HRF", "Người bệnh có tiền sử té ngã/ Patient has a history of falls" },
            { "ISC", "Người bệnh suy giảm miễn dịch/ Patients whose immune systems are compromised" }
            //{ "CH", "Trẻ em (< hoặc 8 tuổi)/ Children (<8 years old)" }, //-
        };
        #endregion

        #region III. ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ NURSING ASSESSMENT
        public static Dictionary<string, string> RESPIRATORY_SYSTEM_CODE = new Dictionary<string, string>()
        {
            { "N", "Không có vấn đề/ Normal" },
            { "D", "Khó thở/ Dyspnea" },
            { "O", "Khó thở nằm/ Orthopnea" },
            { "W", "Khó thở khò khè/ Wheeze" },
            { "C", "Da xanh tái/ Cyanosis" },
        };
        
        public static Dictionary<string, string> PULSE_CODE = new Dictionary<string, string>()
        {
            { "R", "Đều/ Regular" },
            { "I", "Không đều/Irregular" },
        };

        // Tình trạng/ Condition
        public static Dictionary<string, string> PRESENCE_CODE = new Dictionary<string, string>()
        {
            { "CP", "Đau ngực/ Chest pain" },
            { "DI", "Chóng mặt/ Dizzinness" },
            { "CA", "Đau bắp chân/ Calf pain" },
            { "PE", "Phù ngoại biên/ Peripheral edema" },
        };

        public const string EXTREMITIES_CODE_WA = "WA";
        public const string EXTREMITIES_CODE_CO = "CO";
        public const string EXTREMITIES_CODE_CL = "CL";
        public const string EXTREMITIES_CODE_CY = "CY";
        public const string EXTREMITIES_CODE_OT = "OT";
        public static Dictionary<string, string> EXTREMITIES_CODE = new Dictionary<string, string>()
        {
            { EXTREMITIES_CODE_WA, "Ấm/ Warm" },
            { EXTREMITIES_CODE_CO, "Lạnh/ Cold" },
            { EXTREMITIES_CODE_CL, "Ẩm ướt/ Clammy" },
            { EXTREMITIES_CODE_CY, "Xanh tái/ Cyanosed" },
            { EXTREMITIES_CODE_OT, "Khác/ Other" } // 10/3/2023
        };
        #endregion

        public static Dictionary<string, string> PRES_SORE_RISK_CODE = new Dictionary<string, string>()
        {
            { "H", "Cao/ High" },
            { "L", "Thấp/ Low" },
            { "V", "Rất cao/ Very high" },
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

        #region 4. Hệ thần kinh cảm giác/ Neurosensory system
        public static Dictionary<string, string> ORIENTED_CODE = new Dictionary<string, string>()
        {
            { "PLA", "Nơi/ Place" },
            { "DAY", "Ngày/ Day" },
            { "TIME", "Thời gian/ Time" },
            { "PER", "Người/ Person" },
            { "NA", "Không định hướng được/ Disoriented" },
        };
        public static Dictionary<string, string> MENTAL_STATUS_CODE = new Dictionary<string, string>()
        {
            { "AL", "Tỉnh táo/ Alert" },
            { "CF", "Nhầm lẫn/ Confused" },
            { "AG", "Kích động/ Agitated" },
            { "AN", "Lo âu/ Anxious" }, // 10/3/2023
            { "DE", "Trầm cảm/ Depressed" },
            { "OTH", "Khác/ Other" },

            //{ "FR", "Quấy/ Fretful" }, // 10/3/2023
            //{ "LE", "Lơ mơ/ Lethargic" }, // 10/3/2023
        };
        public static Dictionary<string, string> HEARING_CODE = new Dictionary<string, string>()
        {
            { "N", "Bình thường/ Normal" },
            { "HI", "Khiếm thính/ Hearing impaired" },
            { "HA", "Dùng máy trợ thính (Trái/Phải)/ Uses hearing aid (Left/Right)" },
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
            { "SI", "Khiếm ngôn/ Speech impaired" },
            { "NV", "Chưa biết nói/ Non-verbal" },
            { "NC", "Không giao tiếp (Bất tỉnh or mê)/ Non-communicative(Unconscious )" },
        };
        #endregion

        #region 5. Hệ tiêu hóa/ Gastrointestinal system
        /// <summary>
        /// Update TBF: Đang cho con bú/ breast feeding
        /// </summary>
        public static Dictionary<string, string> DIET_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            { "BF", "Bú bình/ Bottle feeding" },
            //{ "TBF", "Bú mẹ hoàn toàn/ Total breast feeding" },
            { "TBF", "Đang cho con bú/ breast feeding" },
            { "OTH", "Khác/ Other" },
        };
        /// <summary>
        /// Update S: Nuốt khó/ Dysphagia
        /// </summary>
        public static Dictionary<string, string> DIET_PRE_CODE = new Dictionary<string, string>()
        {
            { "V", "Nôn/ Vomiting" },
            { "N", "Buồn nôn/ Nausea" },
            //{ "S", "Nuốt khó (chuyển đến chuyên gia trị liệu)/ Swalloing difficulties (refer to therapist)" },
            { "S", "Nuốt khó/ Dysphagia" },
        };
        public static Dictionary<string, string> BOWEL_ELIMINATION_CODE = new Dictionary<string, string>()
        {
            { "TWO", "2 lần/ ngày (2 times/day)" },
            { "ONE", "1 lần/ ngày (1 time/day)" },
            { "EOD", "Cách ngày/ Every other day" },
            { "OTH", "Khác/ Other" },
        };
        /// <summary>
        /// - Tính chất phân/ Stool characteristis
        /// </summary>
        public static Dictionary<string, string> STOOL_CONSISTENCY_CODE = new Dictionary<string, string>()
        {
            { "H", "Cứng/ Hard" },
            //{ "F", "Có hình dạng/ Formed" },
            { "F", "Có hình dạng/ Shape" },
            { "L", "Lỏng/ Loose" },
            { "W", "Phân nước/ Watery" },
        };
        /// <summary>
        /// - Tình trạng hiện có/ Current condition <br/>
        /// </summary>
        public static Dictionary<string, string> GAS_PRESENCE_CODE = new Dictionary<string, string>()
        {
            { "N", "Bình thường/ Normal" },
            { "I", "Không kiểm soát/ Incontinence" },
            //{ "S", "Hậu môn nhân tạo/ Stoma" },
            { "S", "Artificial anus" },
        };
        #endregion

        #region 6. Hệ tiết niệu sinh dục/ Genitourinary system
        public static Dictionary<string, string> URINATION_CODE = new Dictionary<string, string>()
        {
            //{ "NM", "Không có vấn đề/ Normal" },
            { "NM", "Bình thường/ Normal" },
            { "NO", "Tiểu đêm/ Nocturia" },
            { "DY", "Khó tiểu/ Dysuria" },
            //{ "FR", "Thường xuyên/ Frequency" },
            { "IN", "Không kiểm soát/ Incontinece" },
        };

        public static Dictionary<string, string> MENSTRUATION_CODE = new Dictionary<string, string>()
        {
            { "AM", "Vô kinh/ Amenorrhea" },
            { "ME", "Mãn kinh/ Menopause" },
            { "CY", "Chu kỳ (ngày)/ Cycle (day)" },
        };

        #endregion


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

        #region 9. Da & Nguy cơ loét tỳ đè/ Skin & Pressure ulcer risk
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
            //{ "6", "Loét do tỳ đè (6)/ Pressure sore" },
            { "6", "Loét do tỳ đè (6)/ Pressure ulcer" },
        };
        #endregion

        #region 10. Khả năng thực hiện những sinh hoạt hàng ngày/ Ability to perform activities of daily living
        public static Dictionary<string, string> BATHING_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự tắm/ Independent" },
            //{ "AS", "Cần sự hỗ trợ khi tắm/ Assisted in shower" },
            { "AS", "Cần sự hỗ trợ khi tắm/ Assisted bathing" },
            //{ "AB", "Hỗ trợ tắm tại giường/ Assisted in bed" },
            { "AB", "Hỗ trợ tắm tại giường/ Assisted bedside bathing" },
            //{ "DB", "Tự tắm tại giường/ Dependent in bed" },
            { "DB", "Tự tắm tại giường/ Bedside self-bathing" },
        };

        public static Dictionary<string, string> ORAL_CARE_CODE = new Dictionary<string, string>()
        {
            { "OC", "Tự làm/ Independent" },
            //{ "PU", "Chỉ chuẩn bị đồ dùng/ Prepare utensils only" },
            { "PU", "Chỉ chuẩn bị đồ dùng/ Oral care kit prepared only" },
            { "AB", "Hỗ trợ đánh răng/ Assisted toothbrushing" },
            //{ "OTH", "." }
        };

        public static Dictionary<string, string> DENTURES_CODE = new Dictionary<string, string>()
        {
            { "N", "Không có/ None" },
            //{ "U", "Hàm trên/ Upper" },
            { "U", "Hàm trên/ Maxilla" },
            //{ "L", "Hàm dưới/ Lower" },
            { "L", "Hàm dưới/ Mandible" },
            { "P", "Từng phần/ Partial" },
        };

        public static Dictionary<string, string> TOILET_USE_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự vệ sinh/ Independent" },
            //{ "AT", "Cần hỗ trợ khi đi vệ sinh/ Assisted to the toilet" },
            { "AT", "Cần hỗ trợ khi đi vệ sinh/ Assisted for the toilet use" },
            { "AC", "Cần hỗ trợ trên ghế dùng để tiểu tiện trong phòng/ Assisted on the commode" },
            { "DI", "Tã/ Diaper" },
            { "BU", "Bô dùng tại giường/ Bedpan/urine bottle" },
            { "CA", "Ống thông tiểu/ Urinary catheter" },
            //{ "UC", "Ống thông tiểu đặt ngoài bàng quang/ Urinary condom" },
            { "UC", "Ống thông tiểu đặt ngoài bàng quang/ Urethral catheter" },
        };

        public static Dictionary<string, string> DRESSING_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự làm/ Independent" },
            //{ "WA", "Cần hỗ trợ/ With assistance" },
            { "WA", "Cần hỗ trợ/ Assistance needed" },
        };

        public static Dictionary<string, string> EATING_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự ăn/ Independent" },
            //{ "DP", "Phụ thuộc về tư thế/ Dependon position" },
            { "DP", "Phụ thuộc về tư thế/ Depend on position" },
            { "DA", "Phụ thuộc về ăn uống/ Dependent to eat" },
            { "TU", "Cho ăn qua ống/ NG tube/Gastrostomy" },
        };

        public static Dictionary<string, string> TURNING_BED_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự xoay sở/ Independent" },
            //{ "DN", "Không tự xoay sở/ Does not turn independently" },
            { "DN", "Không tự xoay trở/ Unable to reposition" },
        };

        public static Dictionary<string, string> AMBULATION_CODE = new Dictionary<string, string>()
        {
            { "IN", "Tự đi/ Independent" },
            //{ "BF", "Liệt giường/ Bedfast" },
            { "BF", "Liệt giường/ Bedridden" },
            { "NA", "Cần hỗ trợ (ghi rõ)/ Need assistance (specify)" },
        };
        //public static Dictionary<string, string> AMBULATION_CODE = new Dictionary<string, string>()
        //{
        //    { "BF", "Liệt giường/ Bedfast" },
        //    { "NA", "Cần hỗ trợ (ghi rõ)/ Need assistance (specify)" },
        //    { "IN", "Tự đi/ Independent" },
        //};

        public static Dictionary<string, string> SLEEP_CODE = new Dictionary<string, string>()
        {
            { "NM", "Bình thường/ Normal" },
            //{ "AE", "Thức sớm/ Awake early" },
            { "AE", "Thức sớm/ Wake up early" },
            //{ "PFA", "Khó ngủ/ Problem to fall asleep" },
            { "PFA", "Khó ngủ/ Sleep disturbances" },
            //{ "PST", "Khó ngủ say/ Problem to sleep through" },
            { "PST", "Khó ngủ say/ Insomnia" },
        };
        #endregion

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

        #region 
        public const string INSTRUCTIONS_PROVIDED_TO_PAT = "PAT";
        public const string INSTRUCTIONS_PROVIDED_TO_REL = "REL";
        public const string INSTRUCTIONS_PROVIDED_TO_OTH = "OTH";
        public const string INSTRUCTIONS_PROVIDED_TO_NAP = "NAP";
        public static Dictionary<string, string> INSTRUCTIONS_PROVIDED_TO = new Dictionary<string, string>()
        {
            { INSTRUCTIONS_PROVIDED_TO_PAT, "Người bệnh/ Patient" },
            { INSTRUCTIONS_PROVIDED_TO_REL, "Thân nhân/ Relative" },
            { INSTRUCTIONS_PROVIDED_TO_OTH, "Khác/ Other" },
            { INSTRUCTIONS_PROVIDED_TO_NAP, "Không áp dụng/ Not applicable" },
        };
        public static Dictionary<string, string> PERSONNEL = new Dictionary<string, string>()
        {
            { "STA", "Giới thiệu với ĐD phụ trách và nhân viên khác/ Introduction to a nurse in charge and other staff" },
            { "PAT", "Giới thiệu với NB khác/ Introduction to other patients" },
        };
        public static Dictionary<string, string> PHYSICAL_FACILITIES = new Dictionary<string, string>()
        {
            { "BEL", "Vị trí giường/ Bed location" },
            { "BAT", "Phòng tắm/nhà vệ sinh/ Bathroom/toilet" },
            { "TEL", "Sử dụng tivi/ Use of television" },
            { "TEP", "Sử dụng điện thoại/ Use of telephone" },
            { "NCS", "Hệ thống gọi điều dưỡng/ Nurse call system" },
            { "MCO", "Trạm điều dưỡng và quầy chính/ Nurse station and main counter" }
        };
        public static Dictionary<string, string> POLICIES_AND_PROCEDURE = new Dictionary<string, string>()
        {
            { "VIH", "Khách thăm bệnh, giờ thăm/ Visitors and visiting hours" },
            { "PCC", "Thẻ chăm bệnh/ Patient care card" },
            { "PUN", "Đồng phục người bệnh/ Patient uniform" },
            { "MSE", "Dịch vụ ăn uống/ Meal service" },
            { "PPP", "Quy trình trước và sau phẫu thuật, nếu có/ Pre and postoperative procedures (if available)" },
            { "WCN", "Số liên lạc với khoa/phòng/ Ward contact number" },
        };
        public static Dictionary<string, string> SAFETY_PRECAUTIONS = new Dictionary<string, string>()
        {
            { "LFE", "Vị trí cửa thoát hiểm/ Location of fire exits" },
            { "FPR", "Biện pháp phòng ngừa té ngã/ Fall precaution" },
            { "IWB", "Sử dụng vòng đeo tay nhận diện/ Use of an identification wrist band" },
            { "NSH", "Nguy cơ cháy-Không hút thuốc trong phạm vi bệnh viện/ Fire risk – No smoking hospital" },
        };
        public const string VB_DENTURES_NO = "NO";
        public const string VB_DENTURES_YES = "YES";
        public const string VB_DENTURES_WPA = "WPA";
        public const string VB_DENTURES_WRE = "WRE";
        public const string VB_DENTURES_MAX = "MAX";
        public const string VB_DENTURES_MAN = "MAN";
        public const string VB_DENTURES_PAR = "PAR";

        public static Dictionary<string, string> VB_DENTURES = new Dictionary<string, string>()
        {
            { VB_DENTURES_NO, "Không/ No" },
            { VB_DENTURES_YES, "Có/ Yes" },
            { VB_DENTURES_WPA, "NB giữ/ With patient" },
            { VB_DENTURES_WRE, "Thân nhân giữ/ With relative" },
            { VB_DENTURES_MAX, "Hàm trên/ Maxilla" },
            { VB_DENTURES_MAN, "Hàm dưới/ Mandible" },
            { VB_DENTURES_PAR, "Từng phần/ Partial" },
        };
        public const string VB_HEARING_AID_NO = "NO";
        public const string VB_HEARING_AID_YES = "YES";
        public const string VB_HEARING_AID_WPA = "WPA";
        public const string VB_HEARING_AID_WRE = "WRE";
        public const string VB_HEARING_AID_LEF = "LEF";
        public const string VB_HEARING_AID_RIG = "RIG";
        public static Dictionary<string, string> VB_HEARING_AID = new Dictionary<string, string>()
        {
            { VB_HEARING_AID_NO, "Không/ No" },
            { VB_HEARING_AID_YES, "Có/ Yes" },
            { VB_HEARING_AID_WPA, "NB giữ/ With patient" },
            { VB_HEARING_AID_WRE, "Thân nhân giữ/ With relative" },
            { VB_HEARING_AID_LEF, "Trái/ Left" },
            { VB_HEARING_AID_RIG, "Phải/ Right" },
        };
        public const string VB_EYEGLASSES_NO = "NO";
        public const string VB_EYEGLASSES_YES = "YES";
        public const string VB_EYEGLASSES_WPA = "WPA";
        public const string VB_EYEGLASSES_WRE = "WRE";
        public static Dictionary<string, string> VB_EYEGLASSES = new Dictionary<string, string>()
        {
            { VB_EYEGLASSES_NO, "Không/ No" },
            { VB_EYEGLASSES_YES, "Có/ Yes" },
            { VB_EYEGLASSES_WPA, "NB giữ/ With patient" },
            { VB_EYEGLASSES_WRE, "Thân nhân giữ/ With relative" }
        };
        public const string VB_CONTACT_LENSES_NO = "NO";
        public const string VB_CONTACT_LENSES_YES = "YES";
        public const string VB_CONTACT_LENSES_WPA = "WPA";
        public const string VB_CONTACT_LENSES_WRE = "WRE";
        public static Dictionary<string, string> VB_CONTACT_LENSES = new Dictionary<string, string>()
        {
            { VB_CONTACT_LENSES_NO, "Không/ No" },
            { VB_CONTACT_LENSES_YES, "Có/ Yes" },
            { VB_CONTACT_LENSES_WPA, "NB giữ/ With patient" },
            { VB_CONTACT_LENSES_WRE, "Thân nhân giữ/ With relative" }
        };
        public const string VB_CASH_JEWELRY_NO = "NO";
        public const string VB_CASH_JEWELRY_YES = "YES";
        public const string VB_CASH_JEWELRY_WPA = "WPA";
        public const string VB_CASH_JEWELRY_WRE = "WRE";
        public const string VB_CASH_JEWELRY_HSB = "HSB";
        public static Dictionary<string, string> VB_CASH_JEWELRY = new Dictionary<string, string>()
        {
            { VB_CASH_JEWELRY_NO, "Không/ No" },
            { VB_CASH_JEWELRY_YES, "Có/ Yes" },
            { VB_CASH_JEWELRY_WPA, "NB giữ/ With patient" },
            { VB_CASH_JEWELRY_WRE, "Thân nhân giữ/ With relative" },
            { VB_CASH_JEWELRY_HSB, "Trong tủ đầu giường phòng/ In the hospital safety box" },
        };
        //public static Dictionary<string, string> physical_facilities = new Dictionary<string, string>()
        //{
        //    { "", "" },
        //};
        //public static Dictionary<string, string> physical_facilities = new Dictionary<string, string>()
        //{
        //    { "", "" },
        //};
        //public static Dictionary<string, string> physical_facilities = new Dictionary<string, string>()
        //{
        //    { "", "" },
        //};
        //public static Dictionary<string, string> physical_facilities = new Dictionary<string, string>()
        //{
        //    { "", "" },
        //};
        #endregion
    }
}

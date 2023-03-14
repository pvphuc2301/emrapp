﻿using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Data.Shared.Models;
using EMR.Data.Shared.Services;
using EMR.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static Telerik.Web.UI.OrgChartStyles;

namespace EMR
{
    public partial class InpIniNurAssRV05 : EmrPageV01
    {
        public override string form_url { get; set; } = "IPD/InpIniNurAssRV05";
        public IinaModel Model { get; set; }
        protected override Control DisplayLogHistory => lblLogHistory;
        protected override Control SaveControl => btnSave;
        protected override Control DeleteControl => btnDelete;
        protected override Control AmendControl => btnAmend;
        protected override Control PrintControl => btnPrint;
        protected override Control CancelControl => btnCancel;
        protected override Control CompleteControl => btnComplete;

        public override dynamic InitModel()
        {
            Model = new IinaModel(varDocID);
            return Model;
            //return Model = new IinaModel(varDocID, Location, varDocIdLog);
        }
        public override dynamic GetModel()
        {
            if (varDocIdLog == null)
            {
                Model = EmrService<IinaModel>.Get(Guid.Parse(varDocID), Location);
            }
            else
            {
                Model = EmrService<IinaModel>.GetLog(Guid.Parse(varDocIdLog), Location);
            }

            #region I. THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ GENERAL PATIENT INFORMATION
            Model.residence_code = "VNM"; //1
            Model.residence_desc = "Việt Nam";

            Model.language_code = "VI"; //1
            Model.language_desc = "Tiếng Việt";

            Model.req_interpreter = true;

            Model.religion_code = "BH"; //1
            Model.religion_desc = "Phật giáo/ Buddhism";

            Model.spiritual_couns = true; //1

            Model.occupation = "Occupation";

            Model.living_status_code = "ALN";//1
            Model.living_status_desc = "Một mình/ Alone";

            Model.hospital_concern_code = "NON";//1

            Model.contact_name = "Nguyen Van Teo";
            Model.contact_relationship = "Nguoi than";

            Model.accompanied = "Nguyen Van Ti";
            Model.relationship = "Me";

            #endregion

            #region II.	BỆNH SỬ/ MEDICAL HISTORY
            Model.admit_from_code = "OPD";//1
            //Model.admit_from_code = "ER";//2
            //Model.admit_from_code = "VD";//3
            //Model.admit_from_code = "OTH";//4
            //Model.admit_from_other = "Unknown";//4

            Model.arrived = "[{\"code\":\"W\",\"desc\":\"Tự đi được/ Walking\"},{\"code\":\"WC\",\"desc\":\"Bằng xe lăn/ Wheelchair\"},{\"code\":\"S\",\"desc\":\"Bằng băng ca/ Stretcher\"},{\"code\":\"O\",\"desc\":\"None\"}]";
            Model.admission_reason = "Dau dau";
            Model.past_med_history = false; //1
            //Model.past_med_history = true; //2
            //Model.past_med_history_note = "past_med_history_note"; //2

            Model.past_sur_history = false; //1
            //Model.past_sur_history = true; //2
            //Model.past_sur_history_note = "past_sur_history_note"; //2
            
            Model.substance_abuse = "[{\"code\":\"S\",\"desc\":\"Hút thuốc/ Smoking\"},{\"code\":\"A\",\"desc\":\"Rượu bia/ Acohol\"},{\"code\":\"OTH\",\"desc\":\"Khác/ Other\"}]";
            Model.substance_abuse_other = "substance_abuse_other";

            //Model.previous_document = false; //1
            Model.previous_document = true; //2
            Model.previous_document_note = "previous_document_note"; //2
            Model.cur_home_medication = false; //1
            //Model.cur_home_medication = true; //2

            Model.allergy = false;
            Model.allergy_note = "Tôm/ Shrimp";

            //Model.is_high_risk_patient = false; //1
            Model.is_high_risk_patient = true; //2
            Model.high_risk_patient = "[{\"code\":\"HRT\",\"desc\":\"Người bệnh đang điều trị hóa trị liệu/ Patients are receiving chemotherapy\"},{\"code\":\"ELD\",\"desc\":\"Người cao tuổi (≥ 80 tuổi)/ Elderlies (≥ 80 years)\"},{\"code\":\"WIL\",\"desc\":\"Sản phụ đang chuyển dạ/ Women in labor\"},{\"code\":\"ROS\",\"desc\":\"Người bệnh có nguy cơ tự tử hoặc tự làm hại bản thân/ Patients are at risk of suicide or seft-harm\"},{\"code\":\"SDP\",\"desc\":\"Người bệnh tàn tật nặng/ Severe disabled patients\"},{\"code\":\"CCP\",\"desc\":\"Người bệnh lú lẫn/hôn mê/ Confused or comatose patients\"},{\"code\":\"PSP\",\"desc\":\"Sản phụ có thai lưu/ sảy thai/ chấm dứt thai kỳ/ Patient with stillbirth pregnancy/ abortion/ experiencing terminations in pregnancy\"},{\"code\":\"RES\",\"desc\":\"Người bệnh bị kìm giữ/ Restrained patients\"},{\"code\":\"HRF\",\"desc\":\"Người bệnh có tiền sử té ngã/ Patient has a history of falls\"},{\"code\":\"ISC\",\"desc\":\"Người bệnh suy giảm miễn dịch/ Patients whose immune systems are compromised\"}]";

            #endregion

            #region III. ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ NURSING ASSESSMENT
            Model.vs_temperature = "36.8";
            Model.vs_weight = "60";
            Model.vs_height = "165";
            Model.vs_BMI = "22.0";
            Model.vs_heart_rate = "85";
            Model.vs_respiratory_rate = "20";
            Model.vs_blood_pressure = "120/80";
            Model.vs_spO2 = "98";

            Model.respiratory_system = "[{\"code\":\"N\",\"desc\":\"Không có vấn đề/ Normal\"},{\"code\":\"D\",\"desc\":\"Khó thở/ Dyspnea\"},{\"code\":\"O\",\"desc\":\"Khó thở nằm/ Orthopnea\"},{\"code\":\"W\",\"desc\":\"Khó thở khò khè/ Wheeze\"},{\"code\":\"C\",\"desc\":\"Da xanh tái/ Cyanosis\"}]";
            Model.cough = false;
            Model.pro_cough = false; //1
            
            Model.pro_cough = true; //2
            Model.pro_cough_note = "pro_cough_note"; //2

            Model.pulse_code = "R";

            Model.presence = "[{\"code\":\"CP\",\"desc\":\"Đau ngực/ Chest pain\"},{\"code\":\"DI\",\"desc\":\"Chóng mặt/ Dizzinness\"},{\"code\":\"CA\",\"desc\":\"Đau bắp chân/ Calf pain\"},{\"code\":\"PE\",\"desc\":\"Phù ngoại biên/ Peripheral edema\"}]";
            Model.extremities = "[{\"code\":\"WA\",\"desc\":\"Ấm/ Warm\"},{\"code\":\"CO\",\"desc\":\"Lạnh/ Cold\"},{\"code\":\"CL\",\"desc\":\"Ẩm ướt/ Clammy\"},{\"code\":\"CY\",\"desc\":\"Xanh tái/ Cyanosed\"},{\"code\":\"OT\",\"desc\":\"Khác/ Other\"}]";
            Model.extremities_specify = "extremities_specify";
            //4.
            Model.oriented = "[{\"code\":\"PLA\",\"desc\":\"Nơi/ Place\"},{\"code\":\"DAY\",\"desc\":\"Ngày/ Day\"},{\"code\":\"TIME\",\"desc\":\"Thời gian/ Time\"},{\"code\":\"PER\",\"desc\":\"Người/ Person\"},{\"code\":\"NA\",\"desc\":\"Không định hướng được/ Disoriented\"},]";
            //Model.mental_status = "[{\"code\":\"\",\"desc\":\"\"},{\"code\":\"\",\"desc\":\"\"},{\"code\":\"\",\"desc\":\"\"},{\"code\":\"\",\"desc\":\"\"},{\"code\":\"\",\"desc\":\"\"},{\"code\":\"\",\"desc\":\"\"}]";

            #endregion

            Model.gas_presence_code = "S";
            Model.gas_presence_note = "gas_presence_note";

            #region IV. KẾ HOẠCH XUẤT VIỆN/ DISCHARGE PLAN

            Model.involvement = false;
            Model.req_med_equipment = false;
            Model.req_foll_care = false;
            Model.suicidal_referral = false;
            Model.alone_reduce_functional = false;
            Model.ref_physiotherapist = false;
            Model.ref_speech_therapist = false;
            Model.ref_dietician = false;
            Model.ref_psychologist = false;
            Model.ref_other_hospital = false;
            Model.support_at_home = false;
            Model.req_transportation = false;
            Model.stairs_climb_home = false;

            Model.dis_planning = "Discharge planing test";
            Model.reassessment = "Reassessment test";

            #endregion

            #region V. HƯỚNG DẪN NGƯỜI BỆNH VỀ NHỮNG TIỆN NGHI TRONG PHÒNG VÀ CÁC DỊCH VỤ/ PATIENT GUIDES TO ROOM FACILITIES AND SERVICES
            Model.instructions_provided_to = "[{\"code\":\"PAT\",\"desc\":\"Người bệnh/ Patient\"},{\"code\":\"REL\",\"desc\":\"Thân nhân/ Relative\"},{\"code\":\"OTH\",\"desc\":\"test other\"},{\"code\":\"NAP\",\"desc\":\"Không áp dụng/ Not applicable\"}]";
            Model.personnel = "[{\"code\":\"STA\",\"desc\":\"Giới thiệu với ĐD phụ trách và nhân viên khác/ Introduction to a nurse in charge and other staff\"},{\"code\":\"PAT\",\"desc\":\"Giới thiệu với NB khác/ Introduction to other patients\"}]";
            Model.physical_facilities = "[{\"code\":\"BEL\",\"desc\":\"Vị trí giường/ Bed location\"},{\"code\":\"BAT\",\"desc\":\"Phòng tắm/nhà vệ sinh/ Bathroom/toilet\"},{\"code\":\"TEL\",\"desc\":\"Sử dụng tivi/ Use of television\"},{\"code\":\"TEP\",\"desc\":\"Sử dụng điện thoại/ Use of telephone\"},{\"code\":\"NCS\",\"desc\":\"Hệ thống gọi điều dưỡng/ Nurse call system\"},{\"code\":\"MCO\",\"desc\":\"Trạm điều dưỡng và quầy chính/ Nurse station and main counter\"}]";
            Model.policies_and_procedure = "[{\"code\":\"VIH\",\"desc\":\"Khách thăm bệnh, giờ thăm/ Visitors and visiting hours\"},{\"code\":\"PCC\",\"desc\":\"Thẻ chăm bệnh/ Patient care card\"},{\"code\":\"PUN\",\"desc\":\"Đồng phục người bệnh/ Patient uniform\"},{\"code\":\"MSE\",\"desc\":\"Dịch vụ ăn uống/ Meal service\"},{\"code\":\"PPP\",\"desc\":\"Quy trình trước và sau phẫu thuật, nếu có/ Pre and postoperative procedures (if available)\"},{\"code\":\"WCN\",\"desc\":\"Số liên lạc với khoa/phòng/ Ward contact number\"}]";
            Model.safety_precautions = "[{\"code\":\"LFE\",\"desc\":\"Vị trí cửa thoát hiểm/ Location of fire exits\"},{\"code\":\"FPR\",\"desc\":\"Biện pháp phòng ngừa té ngã/ Fall precaution\"},{\"code\":\"IWB\",\"desc\":\"Sử dụng vòng đeo tay nhận diện/ Use of an identification wrist band\"},{\"code\":\"NSH\",\"desc\":\"Nguy cơ cháy-Không hút thuốc trong phạm vi bệnh viện/ Fire risk – No smoking hospital\"}]";
            //Model.vb_dentures = "[{\"code\":\"NO\",\"desc\":\"Không/ No\"}]";
            Model.vb_dentures = "[{\"code\":\"YES\",\"desc\":\"Có/ Yes\"},{\"code\":\"WPA\",\"desc\":\"NB giữ/ With patient\"},{\"code\":\"WRE\",\"desc\":\"Thân nhân giữ/ With relative\"},{\"code\":\"MAX\",\"desc\":\"Hàm trên/ Maxilla\"},{\"code\":\"MAN\",\"desc\":\"Hàm dưới/ Mandible\"},{\"code\":\"PAR\",\"desc\":\"Từng phần/ Partial\"}]";
            //Model.vb_hearing_aid = "[{\"code\":\"NO\",\"desc\":\"Không/ No\"}]";
            Model.vb_hearing_aid = "[{\"code\":\"YES\",\"desc\":\"Có/ Yes\"},{\"code\":\"WPA\",\"desc\":\"NB giữ/ With patient\"},{\"code\":\"WRE\",\"desc\":\"Thân nhân giữ/ With relative\"},{\"code\":\"LEF\",\"desc\":\"Trái/ Left\"},{\"code\":\"RIG\",\"desc\":\"Phải/ Right\"}]";
            //Model.vb_eyeglasses = "[{\"code\":\"NO\",\"desc\":\"Không/ No\"}]";
            Model.vb_eyeglasses = "[{\"code\":\"YES\",\"desc\":\"Có/ Yes\"},{\"code\":\"WPA\",\"desc\":\"NB giữ/ With patient\"},{\"code\":\"WRE\",\"desc\":\"Thân nhân giữ/ With relative\"}]";
            //Model.vb_contact_lenses = "[{\"code\":\"NO\",\"desc\":\"Không/ No\"}]";
            Model.vb_contact_lenses = "[{\"code\":\"YES\",\"desc\":\"Có/ Yes\"},{\"code\":\"WPA\",\"desc\":\"NB giữ/ With patient\"},{\"code\":\"WRE\",\"desc\":\"Thân nhân giữ/ With relative\"}]";
            //Model.vb_cash_jewelry = "[{\"code\":\"NO\",\"desc\":\"Không/ No\"}]";
            Model.vb_cash_jewelry = "[{\"code\":\"YES\",\"desc\":\"Có/ Yes\"},{\"code\":\"WPA\",\"desc\":\"NB giữ/ With patient\"},{\"code\":\"WRE\",\"desc\":\"Thân nhân giữ/ With relative\"},{\"code\":\"HSB\",\"desc\":\"Trong tủ đầu giường phòng/ In the hospital safety box\"}]";
            Model.vb_other = "iphone";
            #endregion
            return Model;
        }
        public override void LoadPatient()
        {
            if (uc_patientInfo.Patient == null)
            {
                uc_patientInfo.Patient = PatientService.GetPatient(Guid.Parse(varPID));
                IEnumerable<PatientVisitInfo> PatientVisit = PatientService.GetPatientVisit(Guid.Parse(varPVID), Location);
                uc_patientInfo.PatientVisit = PatientVisit.FirstOrDefault();
            }
        }
        public override void SetDefaultModel()
        {
            IEnumerable<IinaModel> Logs = EmrService<IinaModel>.GetLogs(Guid.Parse(varDocID), Location);
            if (Logs.Count() == 1)
            {
                Model.pain_annotation = "{\"type\":\"OHAnnotationModel\",\"version\":\"1.0\",\"dataURI\":\"data:image/png;base64,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p/RXaXFUES55TP/LwzP0l6+89C9tRVufgu6cL+1XO6CzfPUJ/U0/YY/IaBBDBv3NM9oap1obTn1yPNhM5coO0l98TtJunZczGUc9QtcINgJzkt6ae81b81HN1tw4bc076rj+zGc+c2s+Otz6zu/8znEO3/Vd37V15zvfedyrePnLX74190a3HvzgB2/NjdPW3Jvdmjf4rc///M/feshDHrI1N0ojnqO85gS7NXcktj7xiU9szY301nxktjU3BFvzDrA1J74R9wd/8Ae35sZua26MxvkizDvg1nz0uTX3mLfmBvlT5CL/fKS0NTfY41z6j3jEI7bmxnVr3hHHtXln3ZqP4oasc2O3NTeAW/MR49bd7na3rbmBG3GCuTHZetjDHrY1d1q25kR36uqnYm58tuYjsq35SGTr0Y9+9CgTkOfzn//8rbmx33rc4x435Jkbja25wd+ak9rW3FCNeEAWsn/Hd3zH1txAbM2N5tb97ne/rbkR2br73e++Ne8Ao67mhmlcn5Ph1tyobM2N7NbciG7NiXSEH/iBHxj5SGPuOGzNjdXWox71qK25wTmV06dCXPrNjebWd3/3d2/NDem4Pierrcc+9rFb81Hp1vd8z/eMvOZEN8pP2hXq9J73vOfWnOxGenPjvDUn9q0nP/nJQ+dAWzn//PO35g7C1hVXXHHq6qeC/triBRdcsDU3wqeufjLIM3c4t+Yj+BFvTjBbD33oQ7fmjuSpGJ+MufHdmhvorbkxH+VPv2WYO1xb55133mgXFfMR6NbcWRj14h45tWvQ3sk8d95G+cxHmeP6k570pNHe9Sd1rj3OnZytOfGMupmT0ZBtTiqjH4mnnJZBeWjX9KZr+pB01ePcIRntRN+bj9a3XvWqV4372vqcMLfmDt7IY05M4/oiqMNLLrlk66yzzhpx507HqTtbW894xjNGW3vkIx852jjZ//N//s9bt771rYc+gTb3oAc9aNT3s571rFNXPxXSYBek+e3f/u1bc6Ic1/UrumiT+pS+dZvb3Gb0JdAf5k7M1n3uc5/R9+cOzri+DOpq7mBu3e52t/uk9qv89ae5EzRsgDYCc0dotGt1MncituaOyagjMrIJc8d6a+5YjLhPfepTt84555xRL42dcdFFF416OypszIdljFx5mzx8owteKu+bt8n7rNPwewGP35Sj0XWm53m+1o5N0Umb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\",\"objects\":[],\"nextFootnoteIndex\":1}";
                Model.skin_anno_data = "{\"type\":\"OHAnnotationModel\",\"version\":\"1.0\",\"dataURI\":\"data:image/png;base64,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\",\"objects\":[],\"nextFootnoteIndex\":1}";

            }
        }
        public override bool LoadFormControl(ControlState state)
        {
            bool Visible = (AccessAuthorize == ACCESS_AUTHORIZE.FULL_ACCESS && !IsLocationChanged && state == ControlState.Edit && !IsViewLog) ? true : false;
            
            lbl_dis_planning.Visible
                = lbl_ng_tube.Visible
                = lbl_diet_desc.Visible
                = lbl_urination.Visible
                = lbl_menstruation_code.Visible
                = lbl_not_pregnancy.Visible
                = lbl_contraception_code.Visible
                = lbl_inter_catheter.Visible
                = lbl_ind_catheter_size.Visible
                = lbl_ind_catheter_date.Visible
                = lbl_sup_catheter_size.Visible
                = lbl_food_dislike.Visible
                = lbl_bowel_elimination_desc.Visible
                = lbl_stool_consistency_desc.Visible
                = lbl_gas_presence_desc.Visible
                = lbl_oriented.Visible
                = lbl_is_high_risk_patient.Visible
                = lbl_high_risk_patient.Visible
                = lbl_assess_date_time.Visible

                = lbl_mus_history.Visible
                = lbl_paralysis.Visible
                = lbl_amputation.Visible
                = lbl_contracture.Visible
                = lbl_prosthesis.Visible
                = lbl_cur_in_pain.Visible
                = lbl_using_pain_killer.Visible
                = lbl_pain_killer_name.Visible
                = lbl_pa_comment.Visible

                = lbl_condition.Visible
                = lbl_wounds.Visible

                = lbl_sensory_code.Visible
                = lbl_moisture_code.Visible
                = lbl_activity_code.Visible
                = lbl_mobility_code.Visible
                = lbl_nutrition_code.Visible
                = lbl_friction_code.Visible
                = lbl_preven_action.Visible

                = lbl_bathing_desc.Visible
                = lbl_oral_care_desc.Visible
                = lbl_dentures_desc.Visible
                = lbl_toilet_use_desc.Visible
                = lbl_dressing_desc.Visible
                = lbl_eating_desc.Visible
                = lbl_turning_bed_desc.Visible
                = lbl_ambulation_desc.Visible
                = lbl_sleep_desc.Visible
                = lbl_hearing_code.Visible
                = lbl_vision_code.Visible
                = lbl_speech_code.Visible
                = lbl_pulse_desc.Visible
                = lbl_presence.Visible
                = lbl_extremities.Visible
                = lbl_respiratory_system.Visible
                = lbl_cough.Visible
                = lbl_pro_cough.Visible
                = lbl_vs_temperature.Visible
                = lbl_vs_heart_rate.Visible
                = lbl_vs_weight.Visible
                = lbl_vs_respiratory_rate.Visible
                = lbl_vs_height.Visible
                = lbl_vs_blood_pressure.Visible
                = lbl_vs_BMI.Visible
                = lbl_vs_spO2.Visible
                = lbl_residence_desc.Visible
                = lbl_language_desc.Visible
                = lbl_req_interpreter.Visible
                = lbl_religion_code.Visible
                = lbl_spiritual_couns.Visible
                = lbl_occupation.Visible
                = lbl_living_status_desc.Visible
                = lbl_hospital_concern_desc.Visible
                = lbl_contact_name.Visible
                = lbl_contact_relationship.Visible
                = lbl_accompanied.Visible
                = lbl_relationship.Visible
                = lbl_admit_from_desc.Visible
                = lbl_arrived.Visible
                = lbl_admission_reason.Visible
                = lbl_past_med_history.Visible
                = lbl_past_sur_history.Visible
                = lbl_substance_abuse.Visible
                = lbl_previous_document.Visible
                = lbl_cur_home_medication.Visible
                = lbl_allergy.Visible
                = lbl_high_risk_patient.Visible

                = lbl_fall_history_desc.Visible
                = lbl_secon_diagnosis_desc.Visible
                = lbl_ambula_aids_desc.Visible
                = lbl_intra_therapy_desc.Visible
                = lbl_gait_trans_desc.Visible
                = lbl_fr_mental_status_desc.Visible
                = lbl_reassessment.Visible
                = lbl_mental_status.Visible
                = !Visible;

            gait_trans_code_wrapper.Visible
                = dtpk_assess_date_time.Visible
                = admit_from_desc_wrapper.Visible
                = arrived_wrapper.Visible
                = admission_reason_wrapper.Visible
                = past_med_history_wrapper.Visible
                = past_sur_history_wrapper.Visible
                = substance_abuse_wrapper.Visible
                = previous_document_wrapper.Visible
                = cur_home_medication_wrapper.Visible
                = allergy_wrapper.Visible
                = high_risk_patient_wrapper.Visible
                = is_high_risk_patient_wrapper.Visible
                = high_risk_patient_wrapper.Visible

                = residence_desc_wrapper.Visible
                = language_desc_wrapper.Visible
                = req_interpreter_wrapper.Visible
                = religion_code_wrapper.Visible
                = spiritual_couns_wrapper.Visible
                = occupation_wrapper.Visible
                = living_status_code_wrapper.Visible
                = hospital_concern_code_wrapper.Visible
                = contact_name_wrapper.Visible
                = contact_relationship_wrapper.Visible
                = accompanied_wrapper.Visible
                = relationship_wrapper.Visible

                = pulse_code_wrapper.Visible
                = presence_wrapper.Visible
                = extremities_wrapper.Visible
                = respiratory_system_wrapper.Visible
                = cough_wrapper.Visible
                = pro_cough_wrapper.Visible
                = vs_temperature_wrapper.Visible
                = vs_heart_rate_wrapper.Visible
                = vs_weight_wrapper.Visible
                = vs_respiratory_rate_wrapper.Visible
                = vs_height_wrapper.Visible
                = vs_blood_pressure_wrapper.Visible
                = vs_BMI_wrapper.Visible
                = vs_spO2_wrapper.Visible

                = speech_code_wrapper.Visible
                = vision_code_wrapper.Visible
                = hearing_code_wrapper.Visible
                = mental_status_wrapper.Visible
                = oriented_wrapper.Visible
                = ng_tube_wrapper.Visible
                = urination_wrapper.Visible
                = inter_catheter_wrapper.Visible
                = menstruation_code_wrapper.Visible
                = not_pregnancy_wrapper.Visible
                = contraception_code_wrapper.Visible
                = ind_catheter_size_wrapper.Visible
                = ind_catheter_date_wrapper.Visible
                = last_sup_catheter_date_wrapper.Visible
                = txt_food_dislike.Visible
                = bowel_elimination_code_wrapper.Visible
                = stool_consistency_code_wrapper.Visible
                = gas_presence_code_wrapper.Visible

                = mus_history_wrapper.Visible
                = paralysis_wrapper.Visible
                = amputation_wrapper.Visible
                = contracture_wrapper.Visible
                = prosthesis_wrapper.Visible

                = cur_in_pain_wrapper.Visible
                = using_pain_killer_wrapper.Visible
                = txt_pain_killer_name.Visible
                = txt_pa_comment.Visible
                

                = condition_wrapper.Visible
                = wounds_wrapper.Visible

                = select_sensory_code.Visible
                = select_moisture_code.Visible
                = select_activity_code.Visible
                = select_mobility_code.Visible
                = select_nutrition_code.Visible
                = select_friction_code.Visible
                = txt_preven_action.Visible

                = bathing_code_wrapper.Visible
                = oral_care_code_wrapper.Visible
                = dentures_code_wrapper.Visible
                = toilet_use_code_wrapper.Visible
                = dressing_code_wrapper.Visible
                = eating_code_wrapper.Visible
                = turning_bed_code_wrapper.Visible
                = ambulation_code_wrapper.Visible
                = sleep_code_wrapper.Visible

                = fall_history_code_wrapper.Visible
                = secon_diagnosis_code_wrapper.Visible
                = ambula_aids_code_wrapper.Visible
                = intra_therapy_code_wrapper.Visible
                = fr_mental_status_code_wrapper.Visible
                = Visible;

            return Visible;
        }
        public override void BindingDataFormEdit()
        {
            try
            {
                Patient = PatientService.GetPatient(Guid.Parse(varPID));
                vb_dentures_wrapper.Visible = false;
                vb_hearing_aid_wrapper.Visible = false;
                vb_eyeglasses_wrapper.Visible = false;
                vb_contact_lenses_wrapper.Visible = false;
                vb_cash_jewelry_wrapper.Visible = false;
                txt_bowel_elimination_specify.Visible = false;
                txt_gas_presence_note.Visible = false;
                female_patient_wrapper.Visible = false;

                #region ...
                txt_amend_reason.Text = "";

                pain_annotation_base64.Value = JsonConvert.DeserializeObject(Model.pain_annotation).dataURI;
                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(Model.skin_anno_data).dataURI;

                //residence
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_residence_code_" + Model.residence_code);
                if (rad_residence_code_oth.Checked)
                {
                    txt_residence_other.Value = Model.residence_other;
                }
                //language
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_language_code_" + Model.language_code);
                if (rad_language_code_oth.Checked)
                {
                    txt_language_other.Value = Model.language_other;
                }
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_interpreter_" + Model.req_interpreter);
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_religion_code_" + Model.religion_code);
                if (rad_religion_code_oth.Checked)
                {
                    txt_religion_other.Value = Model.religion_other;
                }
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_spiritual_couns_" + Model.spiritual_couns);
                txt_occupation.Value = Model.occupation;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_living_status_code_" + Model.living_status_code);
                if (rad_living_status_code_oth.Checked)
                {
                    txt_living_status_note.Value = Model.living_status_note;
                }
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hospital_concern_code_" + Model.hospital_concern_code);
                if (rad_hospital_concern_code_oth.Checked)
                {
                    txt_hospital_concern_other.Value = Model.hospital_concern_other;
                }
                //
                txt_accompanied.Value = Model.accompanied;
                //
                txt_relationship.Value = Model.relationship;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_admit_from_code_" + Model.admit_from_code);
                if (rad_admit_from_code_oth.Checked)
                {
                    txt_admit_from_other.Value = Model.admit_from_other;
                }
                //
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_arrived_code_", WebHelpers.GetJSONToDataTable(Model.arrived));
                if(Model.arrived != null)
                {
                    BindingInputCheckBox(nameof(Model.arrived), JsonConvert.DeserializeObject<IEnumerable<EmrDicItem>>(Model.arrived), (EmrDicItem item) =>
                    {
                        if (item.code == IinaDictionary.ARRIVED_O)
                        {
                            txt_arrived_other.Visible = true;
                            txt_arrived_other.Value = item.desc;
                        }
                    });
                }
                //
                txt_admission_reason.Value = Model.admission_reason;
                //
                lbl_previous_admission.Text = Model.previous_admission;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_past_med_history_" + Model.past_med_history);
                if (rad_past_med_history_true.Checked)
                {
                    txt_past_med_history_note.Value = Model.past_med_history_note;
                }
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_past_sur_history_" + Model.past_sur_history);
                if (rad_past_sur_history_true.Checked)
                {
                    txt_past_sur_history_note.Value = Model.past_sur_history_note;
                }
                //
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_substance_abuse_", WebHelpers.GetJSONToDataTable(Model.substance_abuse));
                if (cb_substance_abuse_oth.Checked)
                {
                    substance_abuse_other_wrapper.Visible = true;
                    txt_substance_abuse_other.Value = Model.substance_abuse_other;
                }
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_previous_document_" + Model.previous_document);
                txt_previous_document_note.Value = Model.previous_document_note;
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cur_home_medication_" + Model.cur_home_medication);
                //
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + Model.allergy);
                if (rad_allergy_true.Checked)
                {
                    txt_allergy_note.Value = Model.allergy_note;
                }

                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_high_risk_patient_", WebHelpers.GetJSONToDataTable(Model.high_risk_patient));
                BindingInputRadioButton(nameof(Model.is_high_risk_patient) + "_" + Model.is_high_risk_patient);
                if (rad_is_high_risk_patient_true.Checked)
                {
                    BindingInputCheckBox(nameof(Model.high_risk_patient), WebHelpers.GetJSONToDataTable(Model.high_risk_patient));
                }

                //
                txt_vs_temperature.Value = Model.vs_temperature;
                txt_vs_heart_rate.Value = Model.vs_heart_rate;
                txt_vs_weight.Value = Model.vs_weight;
                txt_vs_respiratory_rate.Value = Model.vs_respiratory_rate;
                txt_vs_height.Value = Model.vs_height;
                txt_vs_blood_pressure.Value = Model.vs_blood_pressure;
                txt_vs_bmi.Value = Model.vs_BMI;
                txt_vs_spO2.Value = Model.vs_spO2;
                //txt_vs_pulse.Value = Model.vs_pulse;

                //2.
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_respiratory_system_", WebHelpers.GetJSONToDataTable(Model.respiratory_system));
                
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cough_" + Model.cough);
                
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_pro_cough_" + Model.pro_cough);
                
                txt_pro_cough_note.Value = Model.pro_cough_note;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_pulse_code_" + Model.pulse_code);
                
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_presence_", WebHelpers.GetJSONToDataTable(Model.presence));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_extremities_", WebHelpers.GetJSONToDataTable(Model.extremities));
                if (cb_extremities_ot.Checked)
                {
                    txt_extremities_specify.Visible = true;
                    txt_extremities_specify.Value = Model.extremities_specify;
                }
                //4.
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_oriented_", WebHelpers.GetJSONToDataTable(Model.oriented));
                
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_mental_status_", WebHelpers.GetJSONToDataTable(Model.mental_status));
                if (cb_mental_status_oth.Checked)
                {
                    txt_mental_status_other.Value = Model.mental_status_other;
                }
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_hearing_code_" + Model.hearing_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_vision_code_" + Model.vision_code);
                txt_vision_other.Value = Model.vision_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_speech_code_" + Model.speech_code);
                //5.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_diet_code_" + Model.diet_code);
                txt_diet_other.Value = Model.diet_other;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_diet_pre_code_" + Model.diet_pre_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ng_tube_" + Model.ng_tube);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_gastrostomy_" + Model.gastrostomy);
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_size_" + Model.size);
                cb_size_true.Disabled = cb_gastrostomy_true.Disabled = false;
                txt_size_note.Value = Model.size_note;
                WebHelpers.BindDateTimePicker(dpk_last_date_changed, Model.last_date_changed);
                txt_food_dislike.Value = Model.food_dislike;
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bowel_elimination_code_" + Model.bowel_elimination_code);
                if (rad_bowel_elimination_code_oth.Checked)
                {
                    txt_bowel_elimination_specify.Visible = true;
                    txt_bowel_elimination_specify.Value = Model.bowel_elimination_specify;
                }
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_stool_consistency_code_" + Model.stool_consistency_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gas_presence_code_" + Model.gas_presence_code);
                BindingInputRadioButton(nameof(Model.gas_presence_code) + "_" + Model.gas_presence_code);
                if (rad_gas_presence_code_s.Checked)
                {
                    txt_gas_presence_note.Visible = true;
                    txt_gas_presence_note.Value = Model.gas_presence_note;
                }
                #region 6. Hệ tiết niệu sinh dục/ Genitourinary system
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_urination_", WebHelpers.GetJSONToDataTable(Model.urination));
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_inter_catheter_" + Model.inter_catheter);
                txt_inter_catheter_note.Value = Model.inter_catheter_note;

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_ind_catheter_" + Model.ind_catheter);
                txt_ind_catheter_size.Value = Model.ind_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_ind_catheter_date, Model.ind_catheter_date);

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_sup_catheter_" + Model.sup_catheter);
                txt_sup_catheter_size.Value = Model.sup_catheter_size;
                WebHelpers.BindDateTimePicker(dpk_last_sup_catheter_date, Model.last_sup_catheter_date);

                if(Patient.gender_e == "Female")
                {
                    female_patient_wrapper.Visible = true;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_menstruation_code_" + Model.menstruation_code);
                    txt_cycle_day.Value = Convert.ToString(Model.cycle_day);

                    txt_last_mens_period.Value = Model.last_mens_period;

                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_not_pregnancy_" + Model.not_pregnancy);
                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_pre_pregnancy_" + Model.pre_pregnancy);
                    txt_para.Value = Model.para;
                    WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_cur_pregnancy_" + Model.cur_pregnancy);
                    txt_pregnancy_week.Value = Model.pregnancy_week;

                    WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_contraception_code_" + Model.contraception_code);
                    txt_contraception_other.Value = Model.contraception_other;
                }

                #endregion

                #region 
                //6.
                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bmi_out_range_" + Model.bmi_out_range);
                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_loss_weight_" + Model.loss_weight);
                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_reduce_dietary_" + Model.loss_weight);
                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_severely_ill_" + Model.severely_ill);

                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_normal_" + Model.nutrition_normal);
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_" + Model.nutrition_score1);

                //if (Model.nutrition_normal != null)
                //{
                //    cb_nutrition_normal_true.Checked = Model.nutrition_normal;
                //}
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_", WebHelpers.GetJSONToDataTable(Model.nutrition_score1));
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score2_", WebHelpers.GetJSONToDataTable(Model.nutrition_score2));
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_nutrition_score3_", WebHelpers.GetJSONToDataTable(Model.nutrition_score3));
                //nutrition_score.Text = Model.nutrition_score;

                //if (Model.normal_nutrition_req != null)
                //{
                //    cb_normal_nutrition_req_true.Checked = (bool)Model.normal_nutrition_req;
                //}
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score1_", WebHelpers.GetJSONToDataTable(Model.severity_score1));
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score2_", WebHelpers.GetJSONToDataTable(Model.severity_score2));
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_severity_score3_", WebHelpers.GetJSONToDataTable(Model.severity_score3));
                //severity_score.Text = Convert.ToString(Model.severity_score);

                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_younger_70_" + Model.younger_70);
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_older_70_" + Model.older_70);
                //age_score.Text = Convert.ToString(Model.age_score);

                //total_nutri_score.Text = Convert.ToString(Model.total_nutri_score);

                #endregion

                //8
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_mus_history_", WebHelpers.GetJSONToDataTable(Model.mus_history));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_paralysis_" + Model.paralysis);
                txt_paralysis_note.Value = Model.paralysis_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_amputation_" + Model.amputation);
                txt_amputation_note.Value = Model.amputation_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_contracture_" + Model.contracture);
                txt_contracture_note.Value = Model.contracture_note;
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_prosthesis_" + Model.prosthesis);
                txt_prosthesis_note.Value = Model.prosthesis_note;

                //9
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_cur_in_pain_" + Model.cur_in_pain);
                txt_p_location_1.Value = Model.p_location_1;
                txt_p_location_2.Value = Model.p_location_2;
                txt_p_location_3.Value = Model.p_location_3;

                txt_q_location_1.Value = Model.q_location_1;
                txt_q_location_2.Value = Model.q_location_2;
                txt_q_location_3.Value = Model.q_location_3;

                txt_r_location_1.Value = Model.r_location_1;
                txt_r_location_2.Value = Model.r_location_2;
                txt_r_location_3.Value = Model.r_location_3;

                txt_s_location_1.Value = Model.s_location_1;
                txt_s_location_2.Value = Model.s_location_2;
                txt_s_location_3.Value = Model.s_location_3;

                txt_t_location_1.Value = Model.t_location_1;
                txt_t_location_2.Value = Model.t_location_2;
                txt_t_location_3.Value = Model.t_location_3;

                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_using_pain_killer_" + Model.using_pain_killer);

                WebHelpers.VisibleControl(true, pain_annotation_undo, pain_annotation_redo, pain_annotation_pencilWrapper);

                txt_pain_killer_name.Value = Model.pain_killer_name;
                txt_pa_comment.Value = Model.pa_comment;

                //10
                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_condition_", WebHelpers.GetJSONToDataTable(Model.condition));

                WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_wounds_", WebHelpers.GetJSONToDataTable(Model.wounds));

                ViewState[grid_skin_anno.ID] = WebHelpers.BindingDataGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(Model.skin_anno), IinaDictionary.SKIN_ANNO, btn_grid_skin_anno_add);

                WebHelpers.DataBind(form1, select_sensory_code, IinaDictionary.SENSORY_CODE, Model.sensory_code);
                WebHelpers.DataBind(form1, select_moisture_code, IinaDictionary.MOISTURE_CODE, Model.moisture_code);
                WebHelpers.DataBind(form1, select_activity_code, IinaDictionary.ACTIVITY_CODE, Model.activity_code);
                WebHelpers.DataBind(form1, select_mobility_code, IinaDictionary.MOBILITY_CODE, Model.mobility_code);
                WebHelpers.DataBind(form1, select_nutrition_code, IinaDictionary.NUTRITION_CODE, Model.nutrition_code);
                WebHelpers.DataBind(form1, select_friction_code, IinaDictionary.FRICTION_CODE, Model.friction_code);

                total_score.Text = Model.total_score;

                pres_sore_risk_desc.Text = Model.pres_sore_risk_desc;
                txt_preven_action.Value = Model.preven_action;

                //11
                #region 10. Khả năng thực hiện những sinh hoạt hàng ngày/ Ability to perform activities of daily living
                BindingInputRadioButton(nameof(Model.bathing_code) + "_" + Model.bathing_code);
                BindingInputRadioButton(nameof(Model.oral_care_code) + "_" + Model.oral_care_code);
                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_bathing_code_" + Model.bathing_code);
                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_oral_care_code_" + Model.oral_care_code);
                txt_oral_care_note.Value = Model.oral_care_note;

                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_dentures_code_" + Model.dentures_code);
                BindingInputRadioButton(nameof(Model.dentures_code) + "_" + Model.dentures_code);

                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_toilet_use_code_" + Model.toilet_use_code);
                BindingInputRadioButton(nameof(Model.toilet_use_code) + "_" + Model.toilet_use_code);

                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_dressing_code_" + Model.dressing_code);
                BindingInputRadioButton(nameof(Model.dressing_code) + "_" + Model.dressing_code);

                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_eating_code_" + Model.eating_code);
                BindingInputRadioButton(nameof(Model.eating_code) + "_" + Model.eating_code);

                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_turning_bed_code_" + Model.turning_bed_code);
                BindingInputRadioButton(nameof(Model.turning_bed_code) + "_" + Model.turning_bed_code);

                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ambulation_code_" + Model.ambulation_code);
                BindingInputRadioButton(nameof(Model.ambulation_code) + "_" + Model.ambulation_code);
                if (rad_ambulation_code_na.Checked) { txt_ambulation_note.Value = Model.ambulation_note; }
                
                //WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_sleep_code_" + Model.sleep_code);
                BindingInputRadioButton(nameof(Model.sleep_code) + "_" + Model.sleep_code);

                txt_medication_used.Value = Model.medication_used;
                #endregion
                //12
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fall_history_code_" + Model.fall_history_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_secon_diagnosis_code_" + Model.secon_diagnosis_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ambula_aids_code_" + Model.ambula_aids_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_intra_therapy_code_" + Model.intra_therapy_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_gait_trans_code_" + Model.gait_trans_code);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fr_mental_status_code_" + Model.fr_mental_status_code);

                fr_total_score.Text = Convert.ToString(Model.fr_total_score);

                //D
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_involvement_" + Model.involvement);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_med_equipment_" + Model.req_med_equipment);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_foll_care_" + Model.req_foll_care);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_suicidal_referral_" + Model.suicidal_referral);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_alone_reduce_functional_" + Model.alone_reduce_functional);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_physiotherapist_" + Model.ref_physiotherapist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_speech_therapist_" + Model.ref_speech_therapist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_dietician_" + Model.ref_dietician);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_psychologist_" + Model.ref_psychologist);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_ref_other_hospital_" + Model.ref_other_hospital);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_support_at_home_" + Model.support_at_home);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_req_transportation_" + Model.req_transportation);
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_stairs_climb_home_" + Model.stairs_climb_home);

                //E
                txt_dis_planning.Value = Model.dis_planning;
                //F
                //txt_dis_management.Value = Model.dis_management;

                WebHelpers.BindDateTimePicker(dtpk_assess_date_time, Model.assess_date_time);

                pain_annotation_img.Src = JObject.Parse(Model.pain_annotation).dataURI;

                skin_anno_data_img.Src = JObject.Parse(Model.skin_anno_data).dataURI;


                //
                //WebHelpers.DataBind(form1, new HtmlInputCheckBox(), "cb_instructions_provided_to_", JsonConvert.DeserializeObject<DataTable>(Model.instructions_provided_to));
                #endregion

                txt_contact_name.Value = Model.contact_name;
                txt_contact_relationship.Value = Model.contact_relationship;

                txt_reassessment.Value = Model.reassessment;

                if(Model.instructions_provided_to != null)
                {
                    BindingInputCheckBox(nameof(Model.instructions_provided_to), JsonConvert.DeserializeObject<IEnumerable<EmrDicItem>>(Model.instructions_provided_to), (EmrDicItem item) =>
                    {
                        if(item.code == IinaDictionary.INSTRUCTIONS_PROVIDED_TO_OTH)
                        {
                            instructions_provided_to_oth_wrapper.Visible = true;
                            txt_instructions_provided_to_oth.Value = item.desc;
                        }
                    });
                }

                BindingInputCheckBox(nameof(Model.personnel), JsonConvert.DeserializeObject<DataTable>(Model.personnel));
                BindingInputCheckBox(nameof(Model.physical_facilities), JsonConvert.DeserializeObject<DataTable>(Model.physical_facilities));
                BindingInputCheckBox(nameof(Model.policies_and_procedure), JsonConvert.DeserializeObject<DataTable>(Model.policies_and_procedure));
                BindingInputCheckBox(nameof(Model.safety_precautions), JsonConvert.DeserializeObject<DataTable>(Model.safety_precautions));

                #region vb_dentures
                if(Model.vb_dentures !=null)
                {
                    var vb_dentures = JsonConvert.DeserializeObject<IEnumerable<EmrDicItem>>(Model.vb_dentures);

                    if(vb_dentures.FirstOrDefault(i => i.code == IinaDictionary.VB_DENTURES_YES) != null)
                    {
                        rad_vb_dentures_yes.Checked = true;
                        vb_dentures_wrapper.Visible = true;
                        foreach(var item in vb_dentures)
                        {
                            BindingInputCheckBox(nameof(Model.vb_dentures) + "_" + item.code);
                        }
                    }
                    else if (vb_dentures.FirstOrDefault(i => i.code == IinaDictionary.VB_DENTURES_NO) != null)
                    {
                        rad_vb_dentures_no.Checked = true;
                    }
                }
                #endregion

                #region vb_hearing_aid
                if(Model.vb_hearing_aid != null)
                {
                    var vb_hearing_aid = JsonConvert.DeserializeObject<IEnumerable<EmrDicItem>>(Model.vb_hearing_aid);

                    if (vb_hearing_aid.FirstOrDefault(i => i.code == IinaDictionary.VB_HEARING_AID_YES) != null)
                    {
                        rad_vb_hearing_aid_yes.Checked = true;
                        vb_hearing_aid_wrapper.Visible = true;
                        foreach (var item in vb_hearing_aid)
                        {
                            BindingInputCheckBox(nameof(Model.vb_hearing_aid) + "_" + item.code);
                        }
                    }
                    else if (vb_hearing_aid.FirstOrDefault(i => i.code == IinaDictionary.VB_HEARING_AID_NO) != null)
                    {
                        rad_vb_hearing_aid_no.Checked = true;
                    }
                }
                #endregion

                #region vb_eyeglasses
                if(Model.vb_eyeglasses != null)
                {
                    var vb_eyeglasses = JsonConvert.DeserializeObject<IEnumerable<EmrDicItem>>(Model.vb_eyeglasses);

                    if (vb_eyeglasses.FirstOrDefault(i => i.code == IinaDictionary.VB_EYEGLASSES_YES) != null)
                    {
                        rad_vb_eyeglasses_yes.Checked = true;
                        vb_eyeglasses_wrapper.Visible = true;
                        foreach (var item in vb_eyeglasses)
                        {
                            BindingInputCheckBox(nameof(Model.vb_eyeglasses) + "_" + item.code);
                        }
                    }
                    else if (vb_eyeglasses.FirstOrDefault(i => i.code == IinaDictionary.VB_EYEGLASSES_NO) != null)
                    {
                        rad_vb_eyeglasses_no.Checked = true;
                    }
                }
                #endregion

                #region vb_contact_lenses
                if(Model.vb_contact_lenses != null)
                {
                    var vb_contact_lenses = JsonConvert.DeserializeObject<IEnumerable<EmrDicItem>>(Model.vb_contact_lenses);

                    if (vb_contact_lenses.FirstOrDefault(i => i.code == IinaDictionary.VB_CONTACT_LENSES_YES) != null)
                    {
                        rad_vb_contact_lenses_yes.Checked = true;
                        vb_contact_lenses_wrapper.Visible = true;
                        foreach (var item in vb_contact_lenses)
                        {
                            BindingInputCheckBox(nameof(Model.vb_contact_lenses) + "_" + item.code);
                        }
                    }
                    else if (vb_contact_lenses.FirstOrDefault(i => i.code == IinaDictionary.VB_CONTACT_LENSES_NO) != null)
                    {
                        rad_vb_contact_lenses_no.Checked = true;
                    }
                }
                #endregion

                #region vb_cash_jewelry
                if(Model.vb_cash_jewelry != null)
                {
                    var vb_cash_jewelry = JsonConvert.DeserializeObject<IEnumerable<EmrDicItem>>(Model.vb_cash_jewelry);

                    if (vb_cash_jewelry.FirstOrDefault(i => i.code == IinaDictionary.VB_CASH_JEWELRY_YES) != null)
                    {
                        rad_vb_cash_jewelry_yes.Checked = true;
                        vb_cash_jewelry_wrapper.Visible = true;
                        foreach (var item in vb_cash_jewelry)
                        {
                            BindingInputCheckBox(nameof(Model.vb_cash_jewelry) + "_" + item.code);
                        }
                    }
                    else if (vb_cash_jewelry.FirstOrDefault(i => i.code == IinaDictionary.VB_CASH_JEWELRY_NO) != null)
                    {
                        rad_vb_cash_jewelry_no.Checked = true;
                    }
                }
                #endregion

                txt_vb_other.Value = Model.vb_other;

                WebHelpers.VisibleControl(true, pain_annotation_undo, skin_anno_data_undo, pain_annotation_redo, skin_anno_data_redo, pain_annotation_pencilWrapper, skin_anno_data_pencil_wrapper);

                DataObj.Value = JsonConvert.SerializeObject(Model);

                Session["docid"] = Model.document_id;
                WebHelpers.AddScriptFormEdit(Page, Model, (string)Session["emp_id"], Location);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormView()
        {
            try
            {
                pain_annotation_base64.Value = JsonConvert.DeserializeObject(Model.pain_annotation).dataURI;
                skin_anno_data_base64.Value = JsonConvert.DeserializeObject(Model.skin_anno_data).dataURI;

                lbl_residence_desc.Text = WebHelpers.FormatString(Model.residence_desc) + (Model.residence_code == "OTH" ? WebHelpers.FormatString(Model.residence_other) : "");
                lbl_language_desc.Text = WebHelpers.FormatString(Model.language_desc) + (Model.language_code == "OTH" ? WebHelpers.FormatString(Model.language_other) : "");
                lbl_req_interpreter.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_interpreter));
                lbl_religion_code.Text = WebHelpers.FormatString(Model.religion_desc) + (Model.religion_code == "OTH" ? WebHelpers.FormatString(Model.religion_other) : "");
                lbl_spiritual_couns.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.spiritual_couns));
                lbl_occupation.Text = WebHelpers.FormatString(Model.occupation);
                lbl_living_status_desc.Text = WebHelpers.FormatString(Model.living_status_desc) + (Model.living_status_code == "OTH" ? WebHelpers.FormatString(Model.living_status_note) : "");
                lbl_hospital_concern_desc.Text = WebHelpers.FormatString(Model.hospital_concern_desc) + (Model.hospital_concern_code == "OTH" ? WebHelpers.FormatString(Model.hospital_concern_other) : "");
                lbl_accompanied.Text = WebHelpers.FormatString(Model.accompanied);
                lbl_relationship.Text = WebHelpers.FormatString(Model.relationship);
                //B
                lbl_admit_from_desc.Text = WebHelpers.FormatString(Model.admit_from_desc) + ": " + (Model.admit_from_code == "OTH" ? WebHelpers.FormatString(Model.admit_from_other) : "");
                lbl_arrived.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.arrived));
                lbl_admission_reason.Text = WebHelpers.FormatString(Model.admission_reason);
                lbl_previous_admission.Text = WebHelpers.FormatString(Model.previous_admission);
                lbl_past_med_history.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.past_med_history));
                lbl_past_sur_history.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.past_sur_history));

                DataTable substance_abuse = WebHelpers.GetJSONToDataTable(Model.substance_abuse);
                lbl_substance_abuse.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(substance_abuse, out int oth_index));

                if (oth_index != -1)
                {
                    lbl_substance_abuse.Text += "&nbsp;" + Model.substance_abuse_other;
                }

                lbl_previous_document.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.previous_document, "Có, ghi rõ/ Yes, specify: " + WebHelpers.FormatString(Model.previous_document_note)));

                lbl_cur_home_medication.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cur_home_medication, "Có/ Yes (Tham khảo đơn thuốc đính kèm)/ If, yes please refer to the prescription attached"));
                lbl_allergy.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.allergy, "Có (ghi rõ)/ Yes (specify): " + Model.allergy_note));
                lbl_high_risk_patient.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.high_risk_patient));
                //C
                //1
                lbl_vs_temperature.Text = WebHelpers.FormatString(Model.vs_temperature) + " °C";
                lbl_vs_weight.Text = WebHelpers.FormatString(Model.vs_weight) + " Kg";
                lbl_vs_height.Text = WebHelpers.FormatString(Model.vs_height) + " cm";
                lbl_vs_BMI.Text = WebHelpers.FormatString(Model.vs_BMI) + " Kg/m <sup>2</sup>";
                lbl_vs_heart_rate.Text = WebHelpers.FormatString(Model.vs_heart_rate) + " /phút (m)";
                lbl_vs_respiratory_rate.Text = WebHelpers.FormatString(Model.vs_respiratory_rate) + " /phút (m)";
                lbl_vs_blood_pressure.Text = WebHelpers.FormatString(Model.vs_blood_pressure) + " mmHg";
                lbl_vs_spO2.Text = WebHelpers.FormatString(Model.vs_spO2) + " %";
                //lbl_vs_pulse.Text = WebHelpers.FormatString(Model.vs_pulse) + " cm";
                //2
                lbl_respiratory_system.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.respiratory_system));
                lbl_cough.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cough));
                lbl_pro_cough.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cough, "Có đờm/ Productive (ghi rõ màu/ tính chất/ số lượng)/ (Specify color/ nature/ amount)" + Model.pro_cough_note, "Không có đờm/ Unproductive cough"));

                //3
                lbl_pulse_desc.Text = WebHelpers.FormatString(Model.pulse_desc);
                lbl_presence.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.presence));
                lbl_extremities.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.extremities));
                //4
                lbl_oriented.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.oriented));
                lbl_mental_status.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.mental_status));
                lbl_hearing_code.Text = WebHelpers.FormatString(Model.hearing_desc);

                lbl_vision_code.Text = WebHelpers.FormatString(Model.vision_desc) + (Model.vision_code == "OTH" ? WebHelpers.FormatString(Model.vision_other) : "");
                lbl_speech_code.Text = WebHelpers.FormatString(Model.speech_desc);
                //5
                lbl_diet_desc.Text = WebHelpers.FormatString(Model.diet_desc);
                lbl_diet_pre_desc.Text = WebHelpers.FormatString(Model.diet_pre_desc);
                lbl_ng_tube.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ng_tube, "Ống thông/ NG Tube"));
                cb_gastrostomy_true.Disabled = true;
                if (Model.gastrostomy != null) cb_gastrostomy_true.Checked = Model.gastrostomy;
                cb_size_true.Disabled = true;
                if (Model.size != null) cb_size_true.Checked = Model.size;
                lbl_size_note.Text = WebHelpers.FormatString(Model.size_note);
                lbl_food_dislike.Text = WebHelpers.FormatString(Model.food_dislike);
                lbl_last_date_changed.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.last_date_changed));

                lbl_bowel_elimination_desc.Text = WebHelpers.FormatString(Model.bowel_elimination_desc);
                lbl_stool_consistency_desc.Text = WebHelpers.FormatString(Model.stool_consistency_desc);
                lbl_gas_presence_desc.Text = WebHelpers.FormatString(Model.gas_presence_desc);
                //6
                //lbl_bmi_out_range.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.bmi_out_range));
                //lbl_loss_weight.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.loss_weight));
                //lbl_reduce_dietary.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.reduce_dietary));
                //lbl_severely_ill.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.severely_ill));
                ////table 2
                //if (ShowFinalScreening(Model))
                //{
                //    //Nutrition status
                //    //
                //    cb_nutrition_normal_true.Visible = false;
                //    if (Model.nutrition_normal != null) cb_nutrition_normal_true.Checked = Model.nutrition_normal;
                //    lbl_nutrition_score1.Text = WebHelpers.DisplayCheckBox(Model.nutrition_score1);
                //    lbl_nutrition_score2.Text = WebHelpers.DisplayCheckBox(Model.nutrition_score2);
                //    lbl_nutrition_score3.Text = WebHelpers.DisplayCheckBox(Model.nutrition_score3);
                //    nutrition_score.Text = WebHelpers.FormatString(Convert.ToString(Model.nutrition_score));
                //    //
                //    //Severity of disease
                //    cb_normal_nutrition_req_true.Visible = false;
                //    //if (Model.nutrition_normal != null) cb_nutrition_normal_true.Checked = Model.nutrition_normal;
                //    lbl_severity_score1.Text = WebHelpers.DisplayCheckBox(Model.severity_score1);
                //    lbl_severity_score2.Text = WebHelpers.DisplayCheckBox(Model.severity_score2);
                //    lbl_severity_score3.Text = WebHelpers.DisplayCheckBox(Model.severity_score3);
                //    severity_score.Text = WebHelpers.FormatString(Convert.ToString(Model.severity_score));
                //    //
                //    //Age
                //    //
                //    WebHelpers.VisibleControl(false, cb_younger_70_true, cb_older_70_true);
                //    if (Model.younger_70 != null) cb_younger_70_true.Checked = Model.younger_70;
                //    if (Model.older_70 != null) cb_older_70_true.Checked = Model.older_70;
                //    age_score.Text = WebHelpers.FormatString(Convert.ToString(Model.age_score));
                //    //
                //    //Total score
                //    //

                //    total_nutri_score.Text = WebHelpers.FormatString(Model.total_nutri_score);
                //}
                //
                //7
                lbl_urination.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.urination));
                WebHelpers.VisibleControl(false, cb_inter_catheter_true, cb_ind_catheter_true, cb_sup_catheter_true);
                if (Model.inter_catheter != null) { cb_inter_catheter_true.Checked = Model.inter_catheter; }
                if (Model.ind_catheter != null) { cb_ind_catheter_true.Checked = Model.ind_catheter; }
                lbl_ind_catheter_size.Text = WebHelpers.FormatString(Model.ind_catheter_size);
                lbl_ind_catheter_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.ind_catheter_date));
                if (Model.sup_catheter != null) { cb_sup_catheter_true.Checked = Model.sup_catheter; }
                lbl_sup_catheter_size.Text = WebHelpers.FormatString(Model.sup_catheter_size);
                lbl_last_sup_catheter_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.last_sup_catheter_date));
                //
                lbl_menstruation_code.Text = $"{WebHelpers.FormatString(Model.menstruation_desc)} {WebHelpers.FormatString(Model.cycle_day)} Ngày đầu của kỳ kinh cuối/ Last menstrual period started {WebHelpers.FormatString(Model.last_mens_period)}";

                lbl_not_pregnancy.Text = $"{WebHelpers.FormatString(WebHelpers.GetBool(Model.not_pregnancy))} Đã từng mang thai trước đây/ Previous pregnancy: {WebHelpers.FormatString(WebHelpers.GetBool(Model.pre_pregnancy))} PARA {WebHelpers.FormatString(Model.para)} Hiện đang mang thai/ Current pregnancy: {WebHelpers.FormatString(WebHelpers.GetBool(Model.cur_pregnancy))} {WebHelpers.FormatString(Model.pregnancy_week)} tuần/ week";

                lbl_contraception_code.Text = $"{WebHelpers.FormatString(Model.contraception_desc)} {WebHelpers.FormatString(Model.contraception_other)}";

                //8
                lbl_mus_history.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.mus_history));
                lbl_paralysis.Text = "Liệt/ (1/2 người/2 chi/4 chi)/ Paralysis (Hemi/Para/Tetra): " + WebHelpers.FormatString(WebHelpers.GetBool(Model.paralysis)) + WebHelpers.FormatString(Model.paralysis_note);
                lbl_amputation.Text = $"Đoạn chi/ Amputation: {WebHelpers.FormatString(WebHelpers.GetBool(Model.amputation))} {WebHelpers.FormatString(Model.ambulation_note)}";
                lbl_contracture.Text = $"Cơ bắp co rút/ Contracture: {WebHelpers.FormatString(WebHelpers.GetBool(Model.contracture))} {WebHelpers.FormatString(Model.contracture_note)}";
                lbl_prosthesis.Text = $"Lắp bộ phận giả/ Prosthesis: {WebHelpers.FormatString(WebHelpers.GetBool(Model.prosthesis))} {WebHelpers.FormatString(Model.prosthesis_note)}";
                //9
                lbl_cur_in_pain.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.cur_in_pain));
                lbl_p_location_1.Text = WebHelpers.FormatString(Model.p_location_1);
                lbl_p_location_2.Text = WebHelpers.FormatString(Model.p_location_2);
                lbl_p_location_3.Text = WebHelpers.FormatString(Model.p_location_3);

                lbl_q_location_1.Text = WebHelpers.FormatString(Model.q_location_1);
                lbl_q_location_2.Text = WebHelpers.FormatString(Model.q_location_2);
                lbl_q_location_3.Text = WebHelpers.FormatString(Model.q_location_3);

                lbl_r_location_1.Text = WebHelpers.FormatString(Model.r_location_1);
                lbl_r_location_2.Text = WebHelpers.FormatString(Model.r_location_2);
                lbl_r_location_3.Text = WebHelpers.FormatString(Model.r_location_3);

                lbl_s_location_1.Text = WebHelpers.FormatString(Model.s_location_1);
                lbl_s_location_2.Text = WebHelpers.FormatString(Model.s_location_2);
                lbl_s_location_3.Text = WebHelpers.FormatString(Model.s_location_3);

                lbl_t_location_1.Text = WebHelpers.FormatString(Model.t_location_1);
                lbl_t_location_2.Text = WebHelpers.FormatString(Model.t_location_2);
                lbl_t_location_3.Text = WebHelpers.FormatString(Model.t_location_3);

                lbl_using_pain_killer.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.using_pain_killer));
                lbl_pain_killer_name.Text = WebHelpers.FormatString(Model.pain_killer_name);
                lbl_pa_comment.Text = WebHelpers.FormatString(Model.pa_comment);

                //10

                lbl_condition.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.condition));

                lbl_wounds.Text = WebHelpers.FormatString(WebHelpers.DisplayCheckBox(Model.wounds));

                WebHelpers.LoadDataGridView(grid_skin_anno, WebHelpers.GetJSONToDataTable(Model.skin_anno), IinaDictionary.SKIN_ANNO, btn_grid_skin_anno_add);

                lbl_sensory_code.Text = WebHelpers.FormatString(Model.sensory_desc);
                lbl_moisture_code.Text = WebHelpers.FormatString(Model.moisture_desc);
                lbl_activity_code.Text = WebHelpers.FormatString(Model.activity_desc);
                lbl_mobility_code.Text = WebHelpers.FormatString(Model.mobility_desc);
                lbl_nutrition_code.Text = WebHelpers.FormatString(Model.nutrition_desc);
                lbl_friction_code.Text = WebHelpers.FormatString(Model.friction_desc);

                total_score.Text = WebHelpers.FormatString(Model.total_score);
                pres_sore_risk_desc.Text = WebHelpers.FormatString(Model.pres_sore_risk_desc);
                lbl_preven_action.Text = WebHelpers.FormatString(Model.preven_action);

                //11 - Checked
                lbl_bathing_desc.Text = WebHelpers.FormatString(Model.bathing_desc);
                lbl_oral_care_desc.Text = WebHelpers.FormatString(Model.oral_care_desc);
                lbl_dentures_desc.Text = WebHelpers.FormatString(Model.dentures_desc);
                lbl_toilet_use_desc.Text = WebHelpers.FormatString(Model.toilet_use_desc);
                lbl_dressing_desc.Text = WebHelpers.FormatString(Model.dressing_desc);
                lbl_eating_desc.Text = WebHelpers.FormatString(Model.eating_desc);
                lbl_turning_bed_desc.Text = WebHelpers.FormatString(Model.turning_bed_desc);
                lbl_ambulation_desc.Text = WebHelpers.FormatString(Model.ambulation_desc);
                lbl_sleep_desc.Text = WebHelpers.FormatString(Model.sleep_desc);
                lbl_medication_used.Text = WebHelpers.FormatString(Model.medication_used);
                //12 - Checked
                lbl_fall_history_desc.Text = WebHelpers.FormatString(Model.fall_history_desc);
                lbl_secon_diagnosis_desc.Text = WebHelpers.FormatString(Model.secon_diagnosis_desc);
                lbl_ambula_aids_desc.Text = WebHelpers.FormatString(Model.ambula_aids_desc);
                lbl_intra_therapy_desc.Text = WebHelpers.FormatString(Model.intra_therapy_desc);
                lbl_gait_trans_desc.Text = WebHelpers.FormatString(Model.gait_trans_desc);
                lbl_fr_mental_status_desc.Text = WebHelpers.FormatString(Model.fr_mental_status_desc);
                fr_total_score.Text = WebHelpers.FormatString(Model.fr_total_score);
                //D.
                lbl_involvement.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.involvement));
                lbl_req_med_equipment.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_med_equipment));
                lbl_req_foll_care.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_foll_care));
                lbl_suicidal_referral.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.suicidal_referral));
                lbl_ref_physiotherapist.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_physiotherapist));
                lbl_ref_speech_therapist.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_speech_therapist));
                lbl_ref_dietician.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_dietician));
                lbl_ref_psychologist.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_psychologist));
                lbl_ref_other_hospital.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.ref_other_hospital));
                lbl_support_at_home.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.support_at_home));
                lbl_req_transportation.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.req_transportation));
                lbl_stairs_climb_home.Text = WebHelpers.FormatString(WebHelpers.GetBool(Model.stairs_climb_home));
                //E
                lbl_dis_planning.Text = WebHelpers.FormatString(Model.dis_planning);
                //F
                //lbl_dis_management.Text = WebHelpers.FormatString(Model.dis_management);
                lbl_assess_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(Model.assess_date_time, "dd-MMM-yyyy HH:mm"));

                pain_annotation_img.Src = JObject.Parse(Model.pain_annotation).dataURI;

                skin_anno_data_img.Src = JObject.Parse(Model.skin_anno_data).dataURI;

                WebHelpers.VisibleControl(false, pain_annotation_undo, skin_anno_data_undo, pain_annotation_redo, skin_anno_data_redo, pain_annotation_pencilWrapper, skin_anno_data_pencil_wrapper);

                //final_screening_field.Visible = iina.bmi_out_range || iina.loss_weight || iina.reduce_dietary || iina.severely_ill;

                //final_screening_field.Visible = ShowFinalScreening(Model);

                PrintDocument(null, null);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        public override void BindingDataFormPrint()
        {
            //try
            //{
            Patient = PatientService.GetPatient(Guid.Parse(varPID));
            PatientVisit = PatientService.GetPatientVisit(Guid.Parse(varPVID), Location).FirstOrDefault();

            prt_fullname.Text = Patient.FullName;
                prt_dob.Text = WebHelpers.FormatDateTime(Patient.DOB, "dd/MM/yyyy");
                prt_gender.Text = Patient.Gender;
                prt_pid.Text = Patient.visible_patient_id;

                prt_date_of_admission.Text = WebHelpers.FormatDateTime(PatientVisit.ActualVisitDateTime, "dd/MM/yyyy");
                prt_time_of_admission.Text = WebHelpers.FormatDateTime(PatientVisit.ActualVisitDateTime, "HH:mm");
            prt_assess_date.Text = WebHelpers.FormatDateTime(Model.assess_date_time, "dd/MM/yyyy");
            prt_assess_time.Text = WebHelpers.FormatDateTime(Model.assess_date_time, "HH:mm");

            prt_occupation.Text = Model.occupation;
                //{
                //    var control = FindControl("prt_religion_code_" + Model.religion_code);
                //    if (control != null)
                //    {
                //        (control as Label).Text = "☑";
                //        if (Model.religion_code == "OTH")
                //        {
                //            prt_religion_code_oth.Text = Model.religion_other;
                //        }
                //    }
                //}

                {
                    var control = FindControl("prt_spiritual_couns_" + Model.spiritual_couns);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_occupation.Text = Model.occupation;

                {
                    var control = FindControl("prt_living_status_code_" + Model.living_status_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.living_status_code == "OTH")
                        {
                            prt_living_status_note.Text = Model.living_status_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_hospital_concern_code_" + Model.hospital_concern_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.hospital_concern_code == "OTH")
                        {
                            prt_hospital_concern_other.Text = Model.hospital_concern_other;
                        }
                    }
                }

                prt_contact_name.Text = Patient.Contact;
                prt_relationship_type_rcd.Text = Patient.Relationship;

                prt_accompanied.Text = Model.accompanied;
                prt_relationship.Text = Model.relationship;

            //Model.accompanied

            //II. Bệnh sử/ medical history

            var admit_from_code = FindControl("prt_admit_from_code_" + Model.admit_from_code);
            if (admit_from_code != null)
            {
                (admit_from_code as Label).Text = "☑";
                if (Model.admit_from_code == "OTH")
                {
                    prt_admit_from_other.Text = Model.admit_from_other;
                }
            }
            #region...

            
            DataTable arrived = WebHelpers.GetJSONToDataTable(Model.arrived);
            if (arrived != null)
            {
                foreach (DataRow row in arrived.Rows)
                {
                    string code = Convert.ToString(row["code"]);
                    Control control = FindControl("prt_arrived_" + code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }
            }
            

            prt_admission_reason.Text = Model.admission_reason;

                {
                    var control = FindControl("prt_previous_admission_" + !string.IsNullOrEmpty(Model.previous_admission));
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        prt_previous_admission.Text = Model.previous_admission;
                    }
                }

                {
                    var control = FindControl("prt_past_med_history_" + Model.past_med_history);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.past_med_history)
                        {
                            prt_past_med_history_note.Text = Model.past_med_history_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_past_sur_history_" + Model.past_sur_history);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.past_sur_history)
                        {
                            prt_past_sur_history_note.Text = Model.past_sur_history_note;
                        }
                    }
                }

                DataTable substance_abuse = WebHelpers.GetJSONToDataTable(Model.substance_abuse);
                if (substance_abuse != null)
                {
                    foreach (DataRow row in substance_abuse.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_substance_abuse_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                            if (code == "OTH")
                            {
                                prt_substance_abuse_other.Text = Model.substance_abuse_other;
                            }
                        }
                    }
                }

                {
                    var control = FindControl("prt_previous_document_" + Model.previous_document);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.previous_document)
                        {
                            prt_previous_document_note.Text = Model.previous_document_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_cur_home_medication_" + Model.cur_home_medication);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_allergy_" + Model.allergy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.allergy)
                        {
                            prt_allergy_note.Text = Model.allergy_note;
                        }
                    }
                }

                DataTable high_risk_patient = WebHelpers.GetJSONToDataTable(Model.high_risk_patient);
                if (high_risk_patient != null)
                {
                    foreach (DataRow row in high_risk_patient.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_high_risk_patient_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                #endregion

                //C. Đánh giá của điều dưỡng/ Nursing assessment

                #region 1. Dấu hiệu sinh tồn và các chỉ số đo lường/ Vital signs and standard measurements

                prt_vs_temperature.Text = Model.vs_temperature;
                prt_vs_heart_rate.Text = Model.vs_heart_rate;
                prt_vs_blood_pressure.Text = Model.vs_blood_pressure;
                prt_vs_respiratory_rate.Text = Model.vs_respiratory_rate;
                prt_vs_weight.Text = Model.vs_weight;
                prt_vs_height.Text = Model.vs_height;
                prt_vs_BMI.Text = Model.vs_BMI;

                #endregion

                #region 2. Hệ hô hấp/ Respiratory system

                DataTable respiratory_system = WebHelpers.GetJSONToDataTable(Model.respiratory_system);
                if (respiratory_system != null)
                {
                    foreach (DataRow row in respiratory_system.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_respiratory_system_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                {
                    var control = FindControl("prt_cough_" + Model.cough);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_pro_cough_" + Model.pro_cough);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.pro_cough)
                        {
                            prt_pro_cough_note.Text = Model.pro_cough_note;
                        }
                    }
                }

                #endregion

                #region 3. Hệ tim mạch/ Cardiovascular system

                {
                    var control = FindControl("prt_pulse_code_" + Model.pulse_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                DataTable presence = WebHelpers.GetJSONToDataTable(Model.presence);
                if (presence != null)
                {
                    foreach (DataRow row in presence.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_presence_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable extremities = WebHelpers.GetJSONToDataTable(Model.extremities);
                if (extremities != null)
                {
                    foreach (DataRow row in extremities.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_extremities_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                #endregion

                #region 4. Hệ thần kinh cảm giác/ Neurosensory system

                DataTable oriented = WebHelpers.GetJSONToDataTable(Model.oriented);
                if (oriented != null)
                {
                    foreach (DataRow row in oriented.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_oriented_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable mental_status = WebHelpers.GetJSONToDataTable(Model.mental_status);
                if (mental_status != null)
                {
                    foreach (DataRow row in mental_status.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_mental_status_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                            if (code == "OTH")
                            {
                                prt_mental_status_other.Text = Model.mental_status_other;
                            }
                        }
                    }
                }

                {
                    var control = FindControl("prt_hearing_code_" + Model.hearing_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_vision_code_" + Model.vision_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_speech_code_" + Model.speech_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                #endregion

                #region 5. Hệ tiêu hóa/ Gastrointestinal system

                {
                    var control = FindControl("prt_diet_code_" + Model.diet_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.diet_code == "OTH")
                        {
                            prt_diet_other.Text = Model.diet_other;
                        }
                    }
                }

                {
                    var control = FindControl("prt_diet_pre_code_" + Model.diet_pre_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    if (Model.ng_tube != null)
                    {
                        if (!Model.ng_tube)
                        {
                            prt_ng_tube_false.Text = "☑";
                        }
                    }
                }

                {
                    var control = FindControl("prt_gastrostomy_" + Model.gastrostomy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    if (Model.size != null)
                    {
                        if (Model.size)
                        {
                            prt_size_true.Text = "☑";
                        }
                    }
                }

                prt_size_note.Text = WebHelpers.FormatString(Model.size_note, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                prt_last_date_changed.Text = WebHelpers.FormatDateTime(Model.last_date_changed, "dd/MM/yyyy");
                prt_food_dislike.Text = Model.food_dislike;

                {
                    var control = FindControl("prt_bowel_elimination_code_" + Model.bowel_elimination_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_stool_consistency_code_" + Model.stool_consistency_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_gas_presence_code_" + Model.gas_presence_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                #endregion

                #region 6. Đánh giá dinh dưỡng ban đầu/ Initial Nutrition Assessment

            //    string[] initialTemp = new string[4]
            //    {
            //        "prt_bmi_out_range_" + Model.bmi_out_range,
            //        "prt_loss_weight_" + Model.loss_weight,
            //        "prt_reduce_dietary_" + Model.reduce_dietary,
            //        "prt_severely_ill_" + Model.severely_ill

            //    };

            //    foreach (var i in initialTemp)
            //    {
            //        var control = FindControl(i);
            //        if (control != null)
            //        {
            //            (control as Label).Text = "✓";
            //        }
            //    }

            //    string[] finalTemp = new string[3]
            //    {
            //        "prt_nutrition_normal_" + Model.nutrition_normal,
            //        "prt_normal_nutrition_req_" + Model.normal_nutrition_req,
            //        "prt_younger_70_" + Model.younger_70

            //    };

            //    foreach (var i in finalTemp)
            //    {
            //        var control = FindControl(i);
            //        if (control != null)
            //        {
            //            (control as Label).Text = "☑";
            //        }
            //    }
            
            //    DataTable nutrition_score1 = WebHelpers.GetJSONToDataTable(Model.nutrition_score1);
            //    if (nutrition_score1 != null)
            //    {
            //        foreach (DataRow row in nutrition_score1.Rows)
            //        {
            //            string code = Convert.ToString(row["code"]);
            //            Control control = FindControl("prt_nutrition_score1_" + code);
            //            if (control != null)
            //            {
            //                (control as Label).Text = "☑";
            //            }
            //        }
            //    }

            

            //DataTable nutrition_score2 = WebHelpers.GetJSONToDataTable(Model.nutrition_score2);
            //    if (nutrition_score2 != null)
            //    {
            //        foreach (DataRow row in nutrition_score2.Rows)
            //        {
            //            string code = Convert.ToString(row["code"]);
            //            Control control = FindControl("prt_nutrition_score2_" + code);
            //            if (control != null)
            //            {
            //                (control as Label).Text = "☑";
            //            }
            //        }
            //    }

            //    DataTable nutrition_score3 = WebHelpers.GetJSONToDataTable(Model.nutrition_score3);
            //    if (nutrition_score3 != null)
            //    {
            //        foreach (DataRow row in nutrition_score3.Rows)
            //        {
            //            string code = Convert.ToString(row["code"]);
            //            Control control = FindControl("prt_nutrition_score3_" + code);
            //            if (control != null)
            //            {
            //                (control as Label).Text = "☑";
            //            }
            //        }
            //    }

            //    DataTable severity_score1 = WebHelpers.GetJSONToDataTable(Model.severity_score1);
            //    if (severity_score1 != null)
            //    {
            //        foreach (DataRow row in severity_score1.Rows)
            //        {
            //            string code = Convert.ToString(row["code"]);
            //            Control control = FindControl("prt_severity_score1_" + code);
            //            if (control != null)
            //            {
            //                (control as Label).Text = "☑";
            //            }
            //        }
            //    }

            //    DataTable severity_score2 = WebHelpers.GetJSONToDataTable(Model.severity_score2);
            //    if (severity_score2 != null)
            //    {
            //        foreach (DataRow row in severity_score2.Rows)
            //        {
            //            string code = Convert.ToString(row["code"]);
            //            Control control = FindControl("prt_severity_score2_" + code);
            //            if (control != null)
            //            {
            //                (control as Label).Text = "☑";
            //            }
            //        }
            //    }

            //    DataTable severity_score3 = WebHelpers.GetJSONToDataTable(Model.severity_score3);
            //    if (severity_score3 != null)
            //    {
            //        foreach (DataRow row in severity_score3.Rows)
            //        {
            //            string code = Convert.ToString(row["code"]);
            //            Control control = FindControl("prt_severity_score3_" + code);
            //            if (control != null)
            //            {
            //                (control as Label).Text = "☑";
            //            }
            //        }
            //    }

            //    {
            //        var control = FindControl("prt_older_70_" + Model.older_70);
            //        if (control != null)
            //        {
            //            (control as Label).Text = "x";
            //        }
            //    }

            //    prt_nutrition_score.Text = Model.nutrition_score;
            //    prt_severity_score.Text = Model.severity_score;
            //    prt_age_score.Text = Model.age_score;

            //    prt_total_nutri_score.Text = Model.total_nutri_score;

                #endregion

                #region 7. Hệ tiết niệu sinh dục/ Genitourinary system

                DataTable urination = WebHelpers.GetJSONToDataTable(Model.urination);
                if (urination != null)
                {
                    foreach (DataRow row in urination.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_urination_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                {
                    var control = FindControl("prt_inter_catheter_" + Model.inter_catheter);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.ind_catheter)
                        {
                            prt_inter_catheter_note.Text = Model.inter_catheter_note;
                        }
                    }
                }

                {
                    var control = FindControl("prt_ind_catheter_" + Model.ind_catheter);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_ind_catheter_size.Text = Convert.ToString(Model.ind_catheter_size);
                    prt_ind_catheter_date.Text = WebHelpers.FormatDateTime(Model.ind_catheter_date, "dd/MM/yyyy");
                }

                {
                    var control = FindControl("prt_sup_catheter_" + Model.sup_catheter);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_sup_catheter_size.Text = Convert.ToString(Model.sup_catheter_size);
                    prt_last_sup_catheter_date.Text = WebHelpers.FormatDateTime(Model.last_sup_catheter_date, "dd/MM/yyyy");
                }

                {
                    var control = FindControl("prt_menstruation_code_" + Model.menstruation_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_cycle_day.Text = Model.cycle_day;
                }

                {

                    dynamic datetime = WebHelpers.ConvertDateTime(Model.last_mens_period, out bool isValid);
                    if (isValid)
                    {
                        prt_last_mens_period.Text = WebHelpers.FormatDateTime(datetime, "dd/MM/yyyy");
                    }
                    else
                    {
                        prt_last_mens_period.Text = datetime;
                    }
                }

                {
                    var control = FindControl("prt_not_pregnancy_" + Model.not_pregnancy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                {
                    var control = FindControl("prt_pre_pregnancy_" + Model.pre_pregnancy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_para.Text = Model.para;

                {
                    var control = FindControl("prt_cur_pregnancy_" + Model.cur_pregnancy);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                    prt_pregnancy_week.Text = Model.pregnancy_week;
                }

                {
                    var control = FindControl("prt_contraception_code_" + Model.contraception_code);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                        if (Model.contraception_code == "OTH")
                        {
                            prt_contraception_other.Text = Model.contraception_other;
                        }
                    }
                }

                #endregion

                #region 8. Hệ cơ - xương khớp/ Musculoskeletal system

                DataTable mus_history = WebHelpers.GetJSONToDataTable(Model.mus_history);
                if (mus_history != null)
                {
                    foreach (DataRow row in mus_history.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_mus_history_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                string[] musTemp = new string[4]
                {
                    "prt_paralysis_" + Model.paralysis,
                    "prt_amputation_" + Model.amputation,
                    "prt_contracture_" + Model.contracture,
                    "prt_prosthesis_" + Model.prosthesis
                };

                foreach (var i in musTemp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_paralysis_note.Text = Model.paralysis_note;

                prt_amputation_note.Text = Model.amputation_note;

                prt_contracture_note.Text = Model.contracture_note;

                prosthesis_note.Text = Model.prosthesis_note;

                #endregion

                #region 9. Đau/ Pain

                //9

                {
                    var control = FindControl("prt_cur_in_pain_" + Model.cur_in_pain);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_p_location_1.Text = Model.p_location_1;
                prt_p_location_2.Text = Model.p_location_2;
                prt_p_location_3.Text = Model.p_location_3;

                prt_q_location_1.Text = Model.q_location_1;
                prt_q_location_2.Text = Model.q_location_2;
                prt_q_location_3.Text = Model.q_location_3;

                prt_r_location_1.Text = Model.r_location_1;
                prt_r_location_2.Text = Model.r_location_2;
                prt_r_location_3.Text = Model.r_location_3;

                prt_s_location_1.Text = Model.s_location_1;
                prt_s_location_2.Text = Model.s_location_2;
                prt_s_location_3.Text = Model.s_location_3;

                prt_t_location_1.Text = Model.t_location_1;
                prt_t_location_2.Text = Model.t_location_2;
                prt_t_location_3.Text = Model.t_location_3;

                imageTemp.Src = JObject.Parse(Model.pain_annotation).dataURI;

                {
                    var control = FindControl("prt_using_pain_killer_" + Model.using_pain_killer);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

                prt_pain_killer_name.Text = Model.pain_killer_name;
                prt_pa_comment.Text = Model.pa_comment;

                #endregion

                #region 10. Da & Nguy cơ loét tỳ đè/ Skin & Pressure Sore Risk

                DataTable condition = WebHelpers.GetJSONToDataTable(Model.condition);
                if (condition != null)
                {
                    foreach (DataRow row in condition.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_condition_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable wounds = WebHelpers.GetJSONToDataTable(Model.wounds);
                if (wounds != null)
                {
                    foreach (DataRow row in wounds.Rows)
                    {
                        string code = Convert.ToString(row["code"]);
                        Control control = FindControl("prt_wounds_" + code);
                        if (control != null)
                        {
                            (control as Label).Text = "☑";
                        }
                    }
                }

                DataTable skin_anno = WebHelpers.GetJSONToDataTable(Model.skin_anno);

                if (skin_anno != null)
                {
                    HtmlTableRow tr1 = new HtmlTableRow();
                    HtmlTableCell td1;
                    HtmlGenericControl p;

                    string location = "";
                    string type = "";

                    if (skin_anno.Rows.Count > 0)
                    {
                        location = Convert.ToString(skin_anno.Rows[0]["location"]);
                        type = Convert.ToString(skin_anno.Rows[0]["type"]);
                    }

                    //
                    td1 = new HtmlTableCell();
                    p = new HtmlGenericControl("lable") { InnerHtml = location };
                    td1.Controls.Add(p);
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);
                    //
                    td1 = new HtmlTableCell();
                    p = new HtmlGenericControl("lable") { InnerHtml = type };
                    td1.Controls.Add(p);
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);

                    td1 = new HtmlTableCell();
                    td1.InnerHtml = "<img style='width: 250px' src='" + JObject.Parse(Model.skin_anno_data).dataURI + "'>";
                    td1.Width = "300px";
                    td1.RowSpan = skin_anno.Rows.Count;
                    tr1.Cells.Add(td1);

                    prt_skin_anno.Rows.Add(tr1);

                    for (int i = 1; i < skin_anno.Rows.Count; i++)
                    {
                        HtmlTableRow tr = new HtmlTableRow();
                        HtmlTableCell td;

                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(skin_anno.Rows[i]["location"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);
                        //
                        td = new HtmlTableCell();
                        p = new HtmlGenericControl("lable") { InnerHtml = Convert.ToString(skin_anno.Rows[i]["type"]) };
                        td.Controls.Add(p);
                        td.Align = "Center";
                        tr.Cells.Add(td);

                        prt_skin_anno.Rows.Add(tr);
                    }

                }
                else
                {
                    HtmlTableRow tr1 = new HtmlTableRow();
                    HtmlTableCell td1;
                    //
                    td1 = new HtmlTableCell();
                    td1.InnerText = "";
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);
                    //
                    td1 = new HtmlTableCell();
                    td1.InnerText = "";
                    td1.Align = "Center";
                    tr1.Cells.Add(td1);

                    td1 = new HtmlTableCell();
                    td1.InnerHtml = "<img style='width: 300px' src='" + JObject.Parse(Model.skin_anno_data).dataURI + "'>";
                    td1.Width = "300px";
                    tr1.Cells.Add(td1);

                    prt_skin_anno.Rows.Add(tr1);
                }

                prt_sensory_code.Text = Model.sensory_code;
                prt_moisture_code.Text = Model.moisture_code;
                prt_activity_code.Text = Model.activity_code;
                prt_mobility_code.Text = Model.mobility_code;
                prt_nutrition_code.Text = Model.nutrition_code;
                prt_friction_code.Text = Model.friction_code;
                prt_total_score.Text = Model.total_score;

                prt_preven_action.Text = Model.preven_action;

                #endregion

                #region 11. Khả năng thực hiện những sinh hoạt hàng ngày/ Ability to perform daily activities.

                prt_medication_used.Text = Model.medication_used;

                #endregion
                
                //12
                prt_fall_history_code.Text = Model.fall_history_code;
                prt_secon_diagnosis_code.Text = Model.secon_diagnosis_code;
                prt_ambula_aids_code.Text = Model.ambula_aids_code;
                prt_intra_therapy_code.Text = Model.intra_therapy_code;
                prt_gait_trans_code.Text = Model.gait_trans_code;
                prt_fr_mental_status_code.Text = Model.fr_mental_status_code;
                prt_fr_total_score.Text = Model.fr_total_score;
                
                string[] temp = new string[17] {
                    //11
                    "prt_pres_sore_risk_code_" + Model.pres_sore_risk_code,
                    "prt_bathing_code_" + Model.bathing_code,
                    "prt_oral_care_code_" + Model.oral_care_code,
                    "prt_dentures_code_" + Model.dentures_code,
                    "prt_toilet_use_code_" + Model.toilet_use_code,
                    "prt_dressing_code_" + Model.dressing_code,
                    "prt_eating_code_" + Model.eating_code,
                    "prt_turning_bed_code_" + Model.turning_bed_code,
                    "prt_ambulation_code_" + Model.ambulation_code,
                    "prt_sleep_code_" + Model.sleep_code,
                    "prt_medication_used_" + Model.medication_used,
                    //12
                    "prt_fall_history_code_" + Model.fall_history_code,
                    "prt_secon_diagnosis_code_" + Model.secon_diagnosis_code,
                    "prt_ambula_aids_code_" + Model.ambula_aids_code,
                    "prt_intra_therapy_code_" + Model.intra_therapy_code,
                    "prt_gait_trans_code_" + Model.gait_trans_code,
                    "prt_fr_mental_status_code_" + Model.fr_mental_status_code
                };

                foreach (var i in temp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "☑";
                    }
                }

            //D
            string[] dischargePlanTemp = new string[13] {
                    "prt_involvement_" + Model.involvement,
                    "prt_req_med_equipment_" + Model.req_med_equipment,
                    "prt_req_foll_care_" + Model.req_foll_care,
                    "prt_suicidal_referral_" + Model.suicidal_referral,
                    "prt_alone_reduce_functional_" + Model.alone_reduce_functional,
                    "prt_ref_physiotherapist_" + Model.ref_physiotherapist,
                    "prt_ref_speech_therapist_" + Model.ref_speech_therapist,
                    "prt_ref_dietician_" + Model.ref_dietician,
                    "prt_ref_psychologist_" + Model.ref_psychologist,
                    "prt_ref_other_hospital_" + Model.ref_other_hospital,
                    "prt_support_at_home_" + Model.support_at_home,
                    "prt_req_transportation_" + Model.req_transportation,
                    "prt_stairs_climb_home_" + Model.stairs_climb_home
                };

                foreach (var i in dischargePlanTemp)
                {
                    var control = FindControl(i);
                    if (control != null)
                    {
                        (control as Label).Text = "✓";
                    }
                }

                //E
                //E
                prt_dis_planning.Text = Model.dis_planning;
                //F
                prt_dis_management.Text = Model.dis_management;

            //}
            //catch (Exception ex)
            //{
            //    WebHelpers.SendError(Page, ex);
            //}

        }

        protected void btn_grid_skin_anno_add_Click(object sender, EventArgs e)
        {
            ViewState[grid_skin_anno.ID] = WebHelpers.AddRow((DataTable)ViewState[grid_skin_anno.ID], grid_skin_anno, IinaDictionary.SKIN_ANNO);
        }
        protected void grid_skin_anno_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState[((GridView)sender).ID] = WebHelpers.DeleteRow((DataTable)ViewState[((GridView)sender).ID], (GridView)sender, e.RowIndex);
        }
        public override void BindingControlToModel()
        {
            Model.residence_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_residence_code_", IinaDictionary.RESIDENCE_CODE);
            Model.residence_desc = WebHelpers.GetDicDesc(Model.residence_code, IinaDictionary.RESIDENCE_CODE);

            Model.residence_other = txt_residence_other.Value;
            //
            Model.language_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_language_code_", IinaDictionary.LANGUAGE_CODE);
            Model.language_desc = WebHelpers.GetDicDesc(Model.language_code, IinaDictionary.LANGUAGE_CODE);
            Model.language_other = txt_language_other.Value;
            //
            Model.req_interpreter = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_interpreter_");
            //
            Model.religion_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_religion_code_", IinaDictionary.RELIGION_CODE);
            Model.religion_desc = WebHelpers.GetDicDesc(Model.religion_code, IinaDictionary.RELIGION_CODE);
            Model.religion_other = txt_religion_other.Value;
            //
            Model.spiritual_couns = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_spiritual_couns_");
            //
            Model.occupation = txt_occupation.Value;
            //
            Model.living_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_living_status_code_", IinaDictionary.LIVING_STATUS_CODE);
            Model.living_status_desc = WebHelpers.GetDicDesc(Model.living_status_code, IinaDictionary.LIVING_STATUS_CODE);
            Model.living_status_note = txt_living_status_note.Value;
            //
            Model.hospital_concern_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_hospital_concern_code_", IinaDictionary.HOSPITAL_CONCERN_CODE);
            Model.hospital_concern_desc = WebHelpers.GetDicDesc(Model.hospital_concern_code, IinaDictionary.HOSPITAL_CONCERN_CODE);
            Model.hospital_concern_other = txt_hospital_concern_other.Value;
            //
            Model.accompanied = txt_accompanied.Value;
            //
            Model.relationship = txt_relationship.Value;
            //checked
            //B. BỆNH SỬ/ MEDICAL HISTORY
            Model.admit_from_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_admit_from_code_", IinaDictionary.ADMIT_FROM_CODE);
            Model.admit_from_desc = WebHelpers.GetDicDesc(Model.admit_from_code, IinaDictionary.ADMIT_FROM_CODE);

            if (Model.admit_from_code == "OTH") Model.admit_from_other = txt_admit_from_other.Value;

            Model.arrived = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_arrived_code_", IinaDictionary.ARRIVED);
            //
            Model.admission_reason = txt_admission_reason.Value;
            //
            //Model.previous_admission = txt_previous_admission.Value;
            //
            Model.past_med_history = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_past_med_history_");
            Model.past_med_history_note = txt_past_med_history_note.Value;
            //
            Model.past_sur_history = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_past_sur_history_");
            Model.past_sur_history_note = txt_past_sur_history_note.Value;
            //
            Model.substance_abuse = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_substance_abuse_", IinaDictionary.SUBSTANCE_ABUSE);
            Model.substance_abuse_other = txt_substance_abuse_other.Value;
            //
            Model.previous_document = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_previous_document_");
            Model.previous_document_note = txt_previous_document_note.Value;
            //
            Model.cur_home_medication = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cur_home_medication_");
            //
            Model.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
            Model.allergy_note = txt_allergy_note.Value;
            //
            Model.high_risk_patient = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_high_risk_patient_", IinaDictionary.HIGH_RISK_PATIENT_CODE);
            //C
            //1
            Model.vs_temperature = txt_vs_temperature.Value;
            Model.vs_heart_rate = txt_vs_heart_rate.Value;
            Model.vs_weight = txt_vs_weight.Value;
            Model.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
            Model.vs_height = txt_vs_height.Value;
            Model.vs_blood_pressure = txt_vs_blood_pressure.Value;
            Model.vs_BMI = txt_vs_bmi.Value;
            Model.vs_spO2 = txt_vs_spO2.Value;
            //Model.vs_pulse = txt_vs_pulse.Value;
            //2
            Model.respiratory_system = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_respiratory_system_", IinaDictionary.RESPIRATORY_SYSTEM_CODE);
            Model.cough = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cough_");
            Model.pro_cough = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_pro_cough_");
            Model.pro_cough_note = txt_pro_cough_note.Value;
            //3
            Model.pulse_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_pulse_code_", IinaDictionary.PULSE_CODE);
            Model.pulse_desc = WebHelpers.GetDicDesc(Model.pulse_code, IinaDictionary.PULSE_CODE);

            Model.presence = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_presence_", IinaDictionary.PRESENCE_CODE);
            Model.extremities = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_extremities_", IinaDictionary.EXTREMITIES_CODE);
            //4 - passed
            Model.oriented = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_oriented_", IinaDictionary.ORIENTED_CODE);
            Model.mental_status = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_mental_status_", IinaDictionary.MENTAL_STATUS_CODE);
            Model.mental_status_other = txt_mental_status_other.Value;

            Model.hearing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_hearing_code_", IinaDictionary.HEARING_CODE);
            Model.hearing_desc = WebHelpers.GetDicDesc(Model.hearing_code, IinaDictionary.HEARING_CODE);

            Model.vision_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_vision_code_", IinaDictionary.VISION_CODE);
            Model.vision_desc = WebHelpers.GetDicDesc(Model.vision_code, IinaDictionary.VISION_CODE);
            Model.vision_other = txt_vision_other.Value;

            Model.speech_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_speech_code_", IinaDictionary.SPEECH_CODE);
            Model.speech_desc = WebHelpers.GetDicDesc(Model.speech_code, IinaDictionary.SPEECH_CODE);
            //5 - passed
            Model.diet_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_diet_code_", IinaDictionary.DIET_CODE);
            Model.diet_desc = WebHelpers.GetDicDesc(Model.diet_code, IinaDictionary.DIET_CODE);
            Model.diet_other = txt_diet_other.Value;
            Model.diet_pre_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_diet_pre_code_", IinaDictionary.DIET_PRE_CODE);
            Model.diet_pre_desc = WebHelpers.GetDicDesc(Model.diet_pre_code, IinaDictionary.DIET_PRE_CODE);

            Model.ng_tube = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ng_tube_");
            Model.gastrostomy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_gastrostomy_", true);
            Model.size = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_size_", true);
            Model.size_note = txt_size_note.Value;
            Model.last_date_changed = DataHelpers.ConvertSQLDateTime(dpk_last_date_changed.SelectedDate);
            Model.food_dislike = txt_food_dislike.Value;

            Model.bowel_elimination_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bowel_elimination_code_", IinaDictionary.BOWEL_ELIMINATION_CODE);
            Model.bowel_elimination_desc = WebHelpers.GetDicDesc(Model.bowel_elimination_code, IinaDictionary.BOWEL_ELIMINATION_CODE);

            Model.stool_consistency_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_stool_consistency_code_", IinaDictionary.STOOL_CONSISTENCY_CODE);
            if (Model.stool_consistency_code != null) Model.stool_consistency_desc = IinaDictionary.STOOL_CONSISTENCY_CODE[Model.stool_consistency_code];

            Model.gas_presence_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gas_presence_code_", IinaDictionary.GAS_PRESENCE_CODE);
            Model.gas_presence_desc = WebHelpers.GetDicDesc(Model.gas_presence_code, IinaDictionary.GAS_PRESENCE_CODE);
            //6
            //Model.bmi_out_range = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bmi_out_range_");
            //Model.loss_weight = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_loss_weight_");
            //Model.reduce_dietary = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_reduce_dietary_");
            //Model.severely_ill = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_severely_ill_");
            //table 2
            //Model.nutrition_normal = cb_nutrition_normal_true.Checked;
            //Model.nutrition_score1 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score1_", IinaDictionary.NUTRITION_SCORE1_CODE);
            //Model.nutrition_score2 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score2_", IinaDictionary.NUTRITION_SCORE2_CODE);
            //Model.nutrition_score3 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_nutrition_score3_", IinaDictionary.NUTRITION_SCORE3_CODE);
            //Model.nutrition_score = nutrition_score.Text;
            ////
            //// mising Điểm = 0 / Score = 0
            //Model.normal_nutrition_req = cb_normal_nutrition_req_true.Checked;
            //Model.severity_score1 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score1_", IinaDictionary.SEVERITY_SCORE1_CODE);
            //Model.severity_score2 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score2_", IinaDictionary.SEVERITY_SCORE2_CODE);
            //Model.severity_score3 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_severity_score3_", IinaDictionary.SEVERITY_SCORE3_CODE);
            //Model.severity_score = severity_score.Text;
            ////Age
            //Model.younger_70 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_younger_70_", true);
            //Model.older_70 = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_older_70_", true);
            //Model.age_score = age_score.Text;
            //Model.total_nutri_score = total_nutri_score.Text;

            //7
            Model.urination = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_urination_", IinaDictionary.URINATION_CODE);
            Model.inter_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_inter_catheter_", true);
            Model.inter_catheter_note = txt_inter_catheter_note.Value;

            Model.ind_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_ind_catheter_", true);
            Model.ind_catheter_size = txt_ind_catheter_size.Value;
            Model.ind_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_ind_catheter_date.SelectedDate);

            Model.sup_catheter = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_sup_catheter_", true);
            Model.sup_catheter_size = txt_sup_catheter_size.Value;
            Model.last_sup_catheter_date = DataHelpers.ConvertSQLDateTime(dpk_last_sup_catheter_date.SelectedDate);

            Model.menstruation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_menstruation_code_", IinaDictionary.MENSTRUATION_CODE);
            Model.menstruation_desc = WebHelpers.GetDicDesc(Model.menstruation_code, IinaDictionary.MENSTRUATION_CODE);

            Model.cycle_day = txt_cycle_day.Value;
            Model.last_mens_period = txt_last_mens_period.Value;

            Model.not_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_not_pregnancy_", true);
            Model.pre_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_pre_pregnancy_", true);
            Model.para = txt_para.Value;
            Model.cur_pregnancy = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_cur_pregnancy_", true);
            Model.pregnancy_week = txt_pregnancy_week.Value;

            Model.contraception_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_contraception_code_", IinaDictionary.CONTRACEPTION_CODE);
            Model.contraception_desc = WebHelpers.GetDicDesc(Model.contraception_code, IinaDictionary.CONTRACEPTION_CODE);
            Model.contraception_other = txt_contraception_other.Value;

            //8 - Passed
            Model.mus_history = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_mus_history_", IinaDictionary.MUS_HISTORY);

            Model.paralysis = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_paralysis_", true);
            Model.paralysis_note = txt_paralysis_note.Value;

            Model.amputation = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_amputation_", true);
            Model.amputation_note = txt_amputation_note.Value;

            Model.contracture = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_contracture_", true);
            Model.contracture_note = txt_contracture_note.Value;

            Model.prosthesis = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_prosthesis_", true);
            Model.prosthesis_note = txt_prosthesis_note.Value;

            //9 - Passed
            Model.cur_in_pain = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_cur_in_pain_");
            Model.p_location_1 = txt_p_location_1.Value;
            Model.p_location_2 = txt_p_location_2.Value;
            Model.p_location_3 = txt_p_location_3.Value;

            Model.q_location_1 = txt_q_location_1.Value;
            Model.q_location_2 = txt_q_location_2.Value;
            Model.q_location_3 = txt_q_location_3.Value;

            Model.r_location_1 = txt_r_location_1.Value;
            Model.r_location_2 = txt_r_location_2.Value;
            Model.r_location_3 = txt_r_location_3.Value;

            Model.s_location_1 = txt_s_location_1.Value;
            Model.s_location_2 = txt_s_location_2.Value;
            Model.s_location_3 = txt_s_location_3.Value;

            Model.t_location_1 = txt_t_location_1.Value;
            Model.t_location_2 = txt_t_location_2.Value;
            Model.t_location_3 = txt_t_location_3.Value;

            Model.using_pain_killer = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_using_pain_killer_");
            Model.pain_killer_name = txt_pain_killer_name.Value;
            Model.pa_comment = txt_pa_comment.Value;
            //10 - Passed
            Model.condition = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_condition_", IinaDictionary.CONDITION_CODE);

            Model.wounds = WebHelpers.GetData(form1, new HtmlInputCheckBox(), "cb_wounds_", IinaDictionary.WOUNDS_CODE);

            Model.skin_anno = WebHelpers.GetDataGridView(grid_skin_anno, IinaDictionary.SKIN_ANNO);

            Model.sensory_code = Request.Form.Get("select_sensory_code");
            Model.sensory_desc = WebHelpers.GetDicDesc(Model.sensory_code, IinaDictionary.SENSORY_CODE);

            Model.moisture_code = Request.Form.Get("select_moisture_code");
            Model.moisture_desc = WebHelpers.GetDicDesc(Model.moisture_code, IinaDictionary.MOISTURE_CODE);

            Model.activity_code = Request.Form.Get("select_activity_code");
            Model.activity_desc = WebHelpers.GetDicDesc(Model.activity_code, IinaDictionary.ACTIVITY_CODE);

            Model.mobility_code = Request.Form.Get("select_mobility_code");
            Model.mobility_desc = WebHelpers.GetDicDesc(Model.mobility_code, IinaDictionary.MOBILITY_CODE);

            Model.nutrition_code = Request.Form.Get("select_nutrition_code");
            Model.nutrition_desc = WebHelpers.GetDicDesc(Model.nutrition_code, IinaDictionary.NUTRITION_CODE);

            Model.friction_code = Request.Form.Get("select_friction_code");
            Model.friction_desc = WebHelpers.GetDicDesc(Model.friction_code, IinaDictionary.FRICTION_CODE);

            Model.total_score = Convert.ToString(GetTotalScore());

            //
            Model.pres_sore_risk_code = GetPresSoreRiskCode(int.Parse(Model.total_score));
            Model.pres_sore_risk_desc = WebHelpers.GetDicDesc(Model.pres_sore_risk_code, IinaDictionary.PRES_SORE_RISK_CODE);

            Model.preven_action = txt_preven_action.Value;
            //11 - Passed
            Model.bathing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_bathing_code_", IinaDictionary.BATHING_CODE);
            Model.bathing_desc = WebHelpers.GetDicDesc(Model.bathing_code, IinaDictionary.BATHING_CODE);

            Model.oral_care_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_oral_care_code_", IinaDictionary.ORAL_CARE_CODE);
            Model.oral_care_desc = WebHelpers.GetDicDesc(Model.oral_care_code, IinaDictionary.ORAL_CARE_CODE);
            Model.oral_care_note = txt_oral_care_note.Value;

            Model.dentures_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_dentures_code_", IinaDictionary.DENTURES_CODE);
            Model.dentures_desc = WebHelpers.GetDicDesc(Model.dentures_code, IinaDictionary.DENTURES_CODE);

            Model.toilet_use_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_toilet_use_code_", IinaDictionary.TOILET_USE_CODE);
            Model.toilet_use_desc = WebHelpers.GetDicDesc(Model.toilet_use_code, IinaDictionary.TOILET_USE_CODE);

            Model.dressing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_dressing_code_", IinaDictionary.DRESSING_CODE);
            Model.dressing_desc = WebHelpers.GetDicDesc(Model.dressing_code, IinaDictionary.DRESSING_CODE);

            Model.eating_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_eating_code_", IinaDictionary.EATING_CODE);
            Model.eating_desc = WebHelpers.GetDicDesc(Model.eating_code, IinaDictionary.EATING_CODE);

            Model.turning_bed_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_turning_bed_code_", IinaDictionary.TURNING_BED_CODE);
            Model.turning_bed_desc = WebHelpers.GetDicDesc(Model.turning_bed_code, IinaDictionary.TURNING_BED_CODE);

            Model.ambulation_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ambulation_code_", IinaDictionary.AMBULATION_CODE);
            Model.ambulation_desc = WebHelpers.GetDicDesc(Model.ambulation_code, IinaDictionary.AMBULATION_CODE);

            Model.ambulation_note = txt_ambulation_note.Value;

            Model.sleep_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_sleep_code_", IinaDictionary.SLEEP_CODE);
            Model.sleep_desc = WebHelpers.GetDicDesc(Model.sleep_code, IinaDictionary.SLEEP_CODE);

            Model.medication_used = txt_medication_used.Value;
            //12
            Model.fall_history_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_history_code_", IinaDictionary.FALL_HISTORY_CODE);
            Model.fall_history_desc = WebHelpers.GetDicDesc(Model.fall_history_code, IinaDictionary.FALL_HISTORY_CODE);

            Model.secon_diagnosis_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_secon_diagnosis_code_", IinaDictionary.SECON_DIAGNOSIS_CODE);
            Model.secon_diagnosis_desc = WebHelpers.GetDicDesc(Model.secon_diagnosis_code, IinaDictionary.SECON_DIAGNOSIS_CODE);

            Model.ambula_aids_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ambula_aids_code_", IinaDictionary.AMBULA_AIDS_CODE);
            Model.ambula_aids_desc = WebHelpers.GetDicDesc(Model.ambula_aids_code, IinaDictionary.AMBULA_AIDS_CODE);

            Model.intra_therapy_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_intra_therapy_code_", IinaDictionary.INTRA_THERAPY_CODE);
            Model.intra_therapy_desc = WebHelpers.GetDicDesc(Model.intra_therapy_code, IinaDictionary.INTRA_THERAPY_CODE);

            Model.gait_trans_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_gait_trans_code_", IinaDictionary.GAIT_TRANS_CODE);
            Model.gait_trans_desc = WebHelpers.GetDicDesc(Model.gait_trans_code, IinaDictionary.GAIT_TRANS_CODE);

            Model.fr_mental_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fr_mental_status_code_", IinaDictionary.FR_MENTAL_STATUS_CODE);
            Model.fr_mental_status_desc = WebHelpers.GetDicDesc(Model.fr_mental_status_code, IinaDictionary.FR_MENTAL_STATUS_CODE);

            Model.fr_total_score = fr_total_score.Text;
            //D
            Model.involvement = FindHtmlInputRadioButton(nameof(Model.involvement)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_involvement_");
            Model.req_med_equipment = FindHtmlInputRadioButton(nameof(Model.req_med_equipment)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_med_equipment_");
            Model.req_foll_care = FindHtmlInputRadioButton(nameof(Model.req_foll_care)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_foll_care_");
            Model.suicidal_referral = FindHtmlInputRadioButton(nameof(Model.suicidal_referral)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_suicidal_referral_");
            Model.alone_reduce_functional = FindHtmlInputRadioButton(nameof(Model.alone_reduce_functional)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_alone_reduce_functional_");
            Model.ref_physiotherapist = FindHtmlInputRadioButton(nameof(Model.ref_physiotherapist)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_physiotherapist_");
            Model.ref_speech_therapist = FindHtmlInputRadioButton(nameof(Model.ref_speech_therapist)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_speech_therapist_");
            Model.ref_dietician = FindHtmlInputRadioButton(nameof(Model.ref_dietician)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_dietician_");
            Model.ref_psychologist = FindHtmlInputRadioButton(nameof(Model.ref_psychologist)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_psychologist_");
            Model.ref_other_hospital = FindHtmlInputRadioButton(nameof(Model.ref_other_hospital)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_ref_other_hospital_");
            Model.support_at_home = FindHtmlInputRadioButton(nameof(Model.support_at_home)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_support_at_home_");
            Model.req_transportation = FindHtmlInputRadioButton(nameof(Model.req_transportation)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_req_transportation_");
            Model.stairs_climb_home = FindHtmlInputRadioButton(nameof(Model.stairs_climb_home)); //WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_stairs_climb_home_");
            Model.dis_planning = txt_dis_planning.Value;
            //Model.dis_management = txt_dis_management.Value;
            Model.assess_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assess_date_time.SelectedDate);

            Model.pain_annotation = "{\"dataURI\":\"" + pain_annotation_base64.Value + "\"}";

            Model.skin_anno_data = "{\"dataURI\":\"" + skin_anno_data_base64.Value + "\"}";

            //if (JsonConvert.SerializeObject(iina) == DataObj.Value)
            //{
            //    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
            //}

            Model.amend_reason = txt_amend_reason.Text;


            // update
            if (dtpk_arrival_date_time.SelectedDate != null)
            {
                Model.arrival_date_time = (DateTime)dtpk_arrival_date_time.SelectedDate;
            }
            Model.contact_name = txt_contact_name.Value;
            Model.contact_relationship = txt_contact_relationship.Value;
            // test oth arrived


            //V. HƯỚNG DẪN NGƯỜI BỆNH VỀ NHỮNG TIỆN NGHI TRONG PHÒNG VÀ CÁC DỊCH VỤ/ PATIENT GUIDES TO ROOM FACILITIES AND SERVICES
            #region instructions_provided_to
            DataTable instructions_provided_to = FindHtmlInputCheckBox(form1, nameof(Model.instructions_provided_to), IinaDictionary.INSTRUCTIONS_PROVIDED_TO, (KeyValuePair<string, object> dictionary) =>
            {
                if (Convert.ToString(dictionary.Key) == IinaDictionary.INSTRUCTIONS_PROVIDED_TO_OTH)
                {
                    return txt_instructions_provided_to_oth.Value;
                }
                return null;
            });
            if (instructions_provided_to.Rows.Count > 0)
            {
                Model.instructions_provided_to = JsonConvert.SerializeObject(instructions_provided_to);
            }
            #endregion

            #region personnel
            DataTable personnel = FindHtmlInputCheckBox(nameof(Model.personnel), IinaDictionary.PERSONNEL);
            if (personnel.Rows.Count > 0)
            {
                Model.personnel = JsonConvert.SerializeObject(personnel);
            }
            #endregion

            #region physical_facilities
            DataTable physical_facilities = FindHtmlInputCheckBox(nameof(Model.physical_facilities), IinaDictionary.PHYSICAL_FACILITIES);
            if (physical_facilities.Rows.Count > 0)
            {
                Model.physical_facilities = JsonConvert.SerializeObject(physical_facilities);
            }
            #endregion

            #region policies_and_procedure
            DataTable policies_and_procedure = FindHtmlInputCheckBox(nameof(Model.policies_and_procedure), IinaDictionary.POLICIES_AND_PROCEDURE);
            if (policies_and_procedure.Rows.Count > 0)
            {
                Model.policies_and_procedure = JsonConvert.SerializeObject(policies_and_procedure);
            }
            #endregion

            #region safety_precautions
            DataTable safety_precautions = FindHtmlInputCheckBox(nameof(Model.safety_precautions), IinaDictionary.SAFETY_PRECAUTIONS);
            if (safety_precautions.Rows.Count > 0)
            {
                Model.safety_precautions = JsonConvert.SerializeObject(safety_precautions);
            }
            #endregion

            //

        }
        #region METHODS
        //public void Initial()
        //{
        //    try
        //    {
        //        patientInfo = new PatientInfo(varPID);
        //        patientVisitInfo = new PatientVisitInfo(varPVID, loc);

        //        if (varDocIdLog != null)
        //        {
        //            iina = new Iina(varDocIdLog, true, loc);
        //            currentLog.Visible = true;
        //        }
        //        else
        //        {
        //            iina = new Iina(varDocID, loc);
        //            currentLog.Visible = false;
        //        }

        //        LoadPatientInfo();
        //        //loadRadGridHistoryLog();

        //        RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Iina.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
        //        SignatureDate = _SignatureDate;
        //        SignatureName = _SignatureName;

        //        WebHelpers.setBmi(bmiStr, iina.vs_BMI);

        //        iina.pain_annotation = WebHelpers.getPainAnnotation(iina.pain_annotation);

        //        iina.skin_anno_data = WebHelpers.getSkinAnnoData(iina.skin_anno_data);

        //        WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

        //        if (iina.status == DocumentStatus.FINAL)
        //        {
        //            BindingDataForm(iina, WebHelpers.LoadFormControl(form1, iina, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
        //            lblPid.Text = varVPID;
        //        }
        //        else if (iina.status == DocumentStatus.DRAFT)
        //        {
        //            BindingDataForm(iina, WebHelpers.LoadFormControl(form1, iina, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
        //        }

        //        //WebHelpers.getAccessButtons(form1, iina.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

        //        final_screening_field.Visible = ShowFinalScreening(iina);

        //        WebHelpers.getAccessButtons(new Model.AccessButtonInfo()
        //        {
        //            Form = form1,
        //            DocStatus = iina.status,
        //            AccessGroup = (string)Session["group_access"],
        //            AccessAuthorize = (string)Session["access_authorize"],
        //            IsSameCompanyCode = loc == locChanged,
        //            IsViewLog = varDocIdLog != null
        //        });
        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}
        //private void LoadPatientInfo()
        //{
        //    lblFirstName.Text = patientInfo.first_name_l;
        //    lblLastName.Text = patientInfo.last_name_l;
        //    lblGender.Text = patientInfo.gender_l;

        //    WebHelpers.ConvertDateTime(patientInfo.DOB, out bool isValid, out string DOB, "dd-MM-yyyy");
        //    lblDoB.Text = DOB + " (" + patientInfo.Age + "t)";

        //    lblPatientAddress.Text = patientInfo.Address;
        //    lblContactPerson.Text = patientInfo.Contact;

        //    lblVisitCode.Text = patientVisitInfo.VisitCode;

        //    WebHelpers.ConvertDateTime(patientVisitInfo.ActualVisitDateTime, out bool isValid1, out string ActualVisitDateTime, "dd-MM-yyyy");
        //    lblVisitDate.Text = ActualVisitDateTime;
        //}

        //protected string GetLogUrl(object doc_log_id)
        //{
        //    return PAGE_URL + $"&docIdLog={doc_log_id}";
        //}
        //protected void LinkViewLastestVersion_Load(object sender, EventArgs e)
        //{
        //    (sender as HyperLink).NavigateUrl = PAGE_URL;
        //}
        //protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        //{
        //    string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
        //    return result;
        //}
        //protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        //{
        //    GridDataItem item = (e.Item as GridDataItem);
        //    if (e.CommandName.Equals("Open"))
        //    {
        //        string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

        //        string url = $"/IPD/InpIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&docIdLog={doc_log_id}";

        //        Response.Redirect(url);
        //    }
        //}
        //protected void RadButton1_Click(object sender, EventArgs e)
        //{
        //    string url = $"/IPD/InpIniNurAss.aspx?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}";
        //    Response.Redirect(url);
        //}
        //private bool ShowFinalScreening(IinaModel iina)
        //{
        //    if (iina.bmi_out_range != null) { if (iina.bmi_out_range) return true; }
        //    if (iina.loss_weight != null) { if (iina.loss_weight) return true; }
        //    if (iina.reduce_dietary != null) { if (iina.reduce_dietary) return true; }
        //    if (iina.severely_ill != null) { if (iina.severely_ill) return true; }
        //    return false;
        //}
        private string GetPresSoreRiskCode(int score)
        {
            if (score <= 10)
            {
                return "V";
            }
            else if (score <= 17)
            {
                return "H";
            }
            else
            {
                return "L";
            }
        }
        private int GetTotalScore()
        {
            int totalScore = 0;

            if (!string.IsNullOrEmpty(select_sensory_code.Value))
            {
                totalScore += int.Parse(select_sensory_code.Value);
            }
            if (!string.IsNullOrEmpty(select_moisture_code.Value))
            {
                totalScore += int.Parse(select_moisture_code.Value);
            }
            if (!string.IsNullOrEmpty(select_activity_code.Value))
            {
                totalScore += int.Parse(select_activity_code.Value);
            }
            if (!string.IsNullOrEmpty(select_mobility_code.Value))
            {
                totalScore += int.Parse(select_mobility_code.Value);
            }
            if (!string.IsNullOrEmpty(select_nutrition_code.Value))
            {
                totalScore += int.Parse(select_nutrition_code.Value);
            }
            if (!string.IsNullOrEmpty(select_friction_code.Value))
            {
                totalScore += int.Parse(select_friction_code.Value);
            }
            return totalScore;
        }
        //private void update_total_nutri_score()
        //{
        //    int nutritionScore = string.IsNullOrEmpty(nutrition_score.Text) ? 0 : int.Parse(nutrition_score.Text);
        //    int severityScore = string.IsNullOrEmpty(severity_score.Text) ? 0 : int.Parse(severity_score.Text);
        //    int ageScore = string.IsNullOrEmpty(age_score.Text) ? 0 : int.Parse(age_score.Text);
        //    int total = nutritionScore + severityScore + ageScore;
        //    total_nutri_score.Text = Convert.ToString(total);
        //}
        public override void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                //case "initial_screening_change":
                //    initial_screening_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                //    break;
                //case "nutrition_status_change":
                //    nutrition_status_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                //    break;
                //case "severity_of_disease_change":
                //    severity_of_disease_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                //    break;
                //case "age_change":
                //    age_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                //    break;
                case "total_score_change":
                    total_score_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                    break;
                case "fr_total_score_change":
                    fr_total_score_change(Convert.ToString(Request["__EVENTARGUMENT"]));
                    break;

                case "vb_dentures_change":
                    vb_dentures_wrapper.Visible = rad_vb_dentures_yes.Checked;
                    break;
                case "vb_hearing_aid_change":
                    vb_hearing_aid_wrapper.Visible = rad_vb_hearing_aid_yes.Checked;
                    break;
                case "vb_eyeglasses_change":
                    vb_eyeglasses_wrapper.Visible = rad_vb_eyeglasses_yes.Checked;
                    break;
                case "vb_contact_lenses_change":
                    vb_contact_lenses_wrapper.Visible = rad_vb_contact_lenses_yes.Checked;
                    break;
                case "vb_cash_jewelry_change":
                    vb_cash_jewelry_wrapper.Visible = rad_vb_cash_jewelry_yes.Checked;
                    break;
                case "instructions_provided_to_oth_change":
                    instructions_provided_to_oth_wrapper.Visible = cb_instructions_provided_to_oth.Checked;
                    break;
                case "arrived_o_change":
                    txt_arrived_other.Visible = cb_arrived_o.Checked;
                    break;
                case "substance_abuse_other_change":
                    substance_abuse_other_wrapper.Visible = cb_substance_abuse_oth.Checked;
                    break;
                case "is_high_risk_patient_change":
                    is_high_risk_patient_true_wrapper.Visible = rad_is_high_risk_patient_true.Checked;
                    break;
                case "extremities_ot_change":
                    txt_extremities_specify.Visible = cb_extremities_ot.Checked;
                    break;
                case "bowel_elimination_change":
                    txt_bowel_elimination_specify.Visible = rad_bowel_elimination_code_oth.Checked;
                    break;
                case "gas_presence_code_change":
                    txt_gas_presence_note.Visible = rad_gas_presence_code_s.Checked;
                    break;
            }
        }
        private void fr_total_score_change(string v)
        {
            int frTotalScore = 0;

            if (rad_fall_history_code_25.Checked) frTotalScore += 25;

            if (rad_secon_diagnosis_code_15.Checked) frTotalScore += 15;

            if (rad_ambula_aids_code_15.Checked) frTotalScore += 15;
            else if (rad_ambula_aids_code_30.Checked) frTotalScore += 30;

            if (rad_intra_therapy_code_20.Checked) frTotalScore += 20;

            if (rad_gait_trans_code_10.Checked) frTotalScore += 10;
            else if (rad_gait_trans_code_20.Checked) frTotalScore += 20;

            if (rad_fr_mental_status_code_15.Checked) frTotalScore += 15;

            fr_total_score.Text = Convert.ToString(frTotalScore);
        }
        private void total_score_change(string v)
        {
            int totalScore = GetTotalScore();

            pres_sore_risk_desc.Text = IinaDictionary.PRES_SORE_RISK_CODE[GetPresSoreRiskCode(totalScore)];

            total_score.Text = Convert.ToString(totalScore);
        }
        //protected void age_change(string v)
        //{
        //    try
        //    {
        //        age_score.Text = cb_older_70_true.Checked ? "1" : "0";
        //        update_total_nutri_score();
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}
        //protected void severity_of_disease_change(string v)
        //{
        //    int score = 0;

        //    try
        //    {
        //        if (cb_severity_score1_1.Checked || cb_severity_score1_2.Checked || cb_severity_score1_3.Checked || cb_severity_score1_4.Checked)
        //        {
        //            score += 1;
        //        }
        //        if (cb_severity_score2_1.Checked || cb_severity_score2_2.Checked || cb_severity_score2_3.Checked || cb_severity_score2_4.Checked || cb_severity_score2_5.Checked)
        //        {
        //            score += 2;
        //        }
        //        if (cb_severity_score3_1.Checked || cb_severity_score3_2.Checked || cb_severity_score3_3.Checked)
        //        {
        //            score += 3;
        //        }
        //        severity_score.Text = Convert.ToString(score);
        //        update_total_nutri_score();
        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.Notification(Page, "function severity_of_disease_change catched error" + ex.Message);
        //    }
        //}
        //protected void nutrition_status_change(string v)
        //{
        //    int score = 0;

        //    try
        //    {
        //        if (cb_nutrition_score1_1.Checked || cb_nutrition_score1_2.Checked)
        //        {
        //            score += 1;
        //        }
        //        if (cb_nutrition_score2_1.Checked || cb_nutrition_score2_2.Checked || cb_nutrition_score2_3.Checked)
        //        {
        //            score += 2;
        //        }
        //        if (cb_nutrition_score3_1.Checked || cb_nutrition_score3_2.Checked || cb_nutrition_score3_3.Checked)
        //        {
        //            score += 3;
        //        }
        //        nutrition_score.Text = Convert.ToString(score);
        //        update_total_nutri_score();
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}
        //protected void initial_screening_change(string v)
        //{
        //    if (rad_bmi_out_range_true.Checked || rad_loss_weight_true.Checked || rad_reduce_dietary_true.Checked || rad_severely_ill_true.Checked)
        //    {
        //        final_screening_field.Visible = true;
        //    }
        //    else
        //    {
        //        final_screening_field.Visible = false;
        //    }
        //}
        
        #endregion

        #region Validations
        protected void allergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_allergy_true.Checked || rad_allergy_false.Checked;
        }
        protected void alone_reduce_functional_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_alone_reduce_functional_true.Checked || rad_alone_reduce_functional_false.Checked;
        }
        //protected void bmi_out_range_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    args.IsValid = rad_bmi_out_range_true.Checked || rad_bmi_out_range_false.Checked;
        //}
        protected void rad_cough_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_cough_true.Checked || rad_cough_false.Checked;
        }
        protected void cur_home_medication_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_cur_home_medication_true.Checked || rad_cur_home_medication_false.Checked;
        }
        protected void cur_in_pain_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_cur_in_pain_true.Checked || rad_cur_in_pain_false.Checked;
        }
        protected void involvement_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_involvement_true.Checked || rad_involvement_false.Checked;
        }
        //protected void loss_weight_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    args.IsValid = rad_loss_weight_true.Checked || rad_loss_weight_false.Checked;
        //}
        protected void ng_tube_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_ng_tube_true.Checked || rad_ng_tube_false.Checked;
        }
        protected void past_sur_history_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_past_sur_history_true.Checked || rad_past_sur_history_false.Checked;
        }
        protected void past_med_history_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_past_med_history_true.Checked || rad_past_med_history_false.Checked;
        }
        protected void previous_document_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_previous_document_true.Checked || rad_previous_document_false.Checked;
        }
        protected void pro_cough_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_pro_cough_true.Checked || rad_pro_cough_false.Checked;
        }
        protected void rad_ref_other_hospital_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_ref_other_hospital_true.Checked || rad_ref_other_hospital_false.Checked;
        }
        protected void using_pain_killer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_using_pain_killer_true.Checked || rad_using_pain_killer_false.Checked;
        }

        #endregion

        protected void instructions_provided_to_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_instructions_provided_to_pat.Checked 
                || cb_instructions_provided_to_rel.Checked
                || cb_instructions_provided_to_oth.Checked
                || cb_instructions_provided_to_nap.Checked;
        }
        protected void personnel_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_personnel_pat.Checked
                || cb_personnel_sta.Checked;
        }
        protected void physical_facilities_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_physical_facilities_bel.Checked
                || cb_physical_facilities_bat.Checked
                || cb_physical_facilities_tel.Checked
                || cb_physical_facilities_tep.Checked
                || cb_physical_facilities_ncs.Checked
                || cb_physical_facilities_mco.Checked;
        }
        protected void policies_and_procedure_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_policies_and_procedure_vih.Checked
                || cb_policies_and_procedure_pcc.Checked
                || cb_policies_and_procedure_pun.Checked
                || cb_policies_and_procedure_mse.Checked
                || cb_policies_and_procedure_ppp.Checked
                || cb_policies_and_procedure_wcn.Checked;
        }
        protected void safety_precautions_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cb_safety_precautions_lfe.Checked
                || cb_safety_precautions_fpr.Checked
                || cb_safety_precautions_iwb.Checked
                || cb_safety_precautions_nsh.Checked;
        }
        protected void vb_dentures_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_vb_dentures_no.Checked
                || rad_vb_dentures_yes.Checked;
        }
        protected void vb_hearing_aid_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_vb_hearing_aid_no.Checked
                || rad_vb_hearing_aid_yes.Checked;
        }
        protected void vb_eyeglasses_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_vb_eyeglasses_no.Checked
                || rad_vb_eyeglasses_yes.Checked;
        }
        protected void vb_contact_lenses_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_vb_contact_lenses_no.Checked
                || rad_vb_contact_lenses_yes.Checked;
        }
        protected void vb_cash_jewelry_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_vb_cash_jewelry_no.Checked
                || rad_vb_cash_jewelry_yes.Checked;
        }
        
    }
}
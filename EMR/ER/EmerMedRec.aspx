<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerMedRec.aspx.cs" Inherits="EMR.ER.EmerMedRec" ValidateRequest="false" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <script>
        function changeValue(a, b) {
            document.getElementById(b).value = document.getElementById(a).innerHTML;
        }
    </script>
    <style>
        .dg-1 {
            display: grid;
            width: 100%;
            grid-template-columns: 200px 1fr;
        }
        .cursor-wait {
            pointer-events: none;
            background-color: #007bff;
            border-color: #007bff;
            opacity: .65;
        }
        @media only screen and (max-width: 600px) {
          .dg-1 {
            display: block !important;
          }
        }
    </style>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <style>
    .cssclsNoPrint .table-bordered td,
    .cssclsNoPrint .table-bordered th {
        border-color: #ddd;
    }
    @page {
        margin-top: 10px;
    }
    #print_content {
		    line-height: initial !important;
	    }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel runat="server" ID="uplPrintPage">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div style="height: 18px;"><span style="font-size: 12pt; font-weight: bold">PHIẾU ĐÁNH GIÁ BỆNH NHÂN TẠI KHOA CẤP CỨU</span></div>
                                                <div style="height: 18px;"><i style="font-size: 11pt; font-weight: bold; color: #0070c0">EMERGENCY MEDICAL ASSESSMENT</i></div>
                                                <div style="height: 15px" ><span style="font-size: 10pt">(Do bác sĩ cấp cứu điền trước khi bệnh nhân rời khỏi khoa cấp cứu)</span></div>
                                                <div style="height: 15px;"><span style="font-size: 10pt; color: #0070c0"><i>(To be completed by the Emergency Doctor before discharge from Emergency)</i></span></div>
                                            </div>
                                            <div></div>
                                        </div>
                                        <div style="height: 12px; position: relative;">
                                            <span style="position:absolute; left: 0; top: 50%; width: 190px; border: 2px solid #e20e5a; display: inline-block;"></span>
                                            <span style="position:absolute; left: 190px; top: 50%; right: 0; border: 2px solid #007297; display: inline-block;"></span>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" runat="server" id="print_content">
                                        <div style="display: grid; grid-template-columns: 280px 1fr; grid-gap: 12px;">
                                            <div>
                                                <div style="border: 1px dashed #000; padding: 6px; display: grid; grid-gap: 6px">
                                                    <div>Họ tên: <asp:Label runat="server" ID="prt_patient_name"/></div>
                                                    <div>Ngày sinh: <asp:Label runat="server" ID="prt_dob"/></div>
                                                    <div>Giới tính: <asp:Label runat="server" ID="prt_gender"/></div>
                                                    <div>PID: <asp:Label runat="server" ID="prt_pid"/></div>
                                                </div>
                                            </div>
                                            <div>
                                                <div><span style="font-weight: bold">Ngày, giờ bắt đầu đánh giá: </span><asp:Label runat="server" ID="prt_evaluation_time"></asp:Label></div>
                                                <div class="en"><span style="font-weight: bold"><i>Starting date, time of the assessment</i></span></div>
                                                <div><span style="font-weight: bold">Lý do đến khám/ <span  class="en">Chief complaint:</span></span></div>
                                                <asp:Label runat="server" ID="prt_chief_complaint"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: repeat(5, 1fr);">
                                            <div>
                                                <asp:Label ID="prt_chief_complaint_code_r" runat="server" />
                                                <span>Hồi sức</span>
                                                <div class="en" style="margin-left: 16px;">Resuscitation</div>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_chief_complaint_code_e" runat="server" />
                                                <span>Cấp cứu</span>
                                                <div class="en" style="margin-left: 16px;">Emergency</div>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_chief_complaint_code_u" runat="server" />
                                                <span>Khẩn trương</span>
                                                <div class="en" style="margin-left: 16px;">Urgent</div>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_chief_complaint_code_l" runat="server" />
                                                <span>Trì hoãn</span>
                                                <div class="en" style="margin-left: 16px;">Less urgent</div>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_chief_complaint_code_n" runat="server" />
                                                <span>Không cấp cứu</span>
                                                <div class="en" style="margin-left: 16px;">Non-Urgent</div>
                                            </div>
                                        </div>
                                        <div>
                                            <div><span style="text-decoration: underline"><span style="font-weight: bold">Bệnh sử</span>/ <span class="en">History of present illness </span><span style="font-weight: bold">(HPI)</span></span></div>
                                            <asp:Label runat="server" ID="prt_history_of_present"></asp:Label>
                                        </div>
                                        <div><span style="text-decoration: underline"><span style="font-weight: bold">Tiền sử bệnh</span>/ <span class="en">Past medical history </span><span style="font-weight: bold">(PMH)</span></span></div>
                                        <div>
                                            <span style="font-weight: bold">Nội/ <span class="en">Meds: </span></span>
                                            <asp:Label runat="server" ID="prt_past_med_his_meds"></asp:Label>
                                        </div>
                                        <div>
                                            <span style="font-weight: bold">Ngoại/ <span class="en">Surgical: </span></span>
                                            <asp:Label runat="server" ID="prt_past_med_his_surs"></asp:Label>
                                        </div>
                                        <div style="margin-left: 10px">
                                            <div style="height: 32px">• Đã từng nhiễm COVID-19 trong vòng 6 tháng qua/  <span class="en">Have been infected with COVID-19 within the last 6 months:</span></div>
                                            <div style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px; margin-left: 100px">
                                                <div><asp:Label runat="server" ID="prt_infected_with_covid_true" Text="❏"/>&nbsp;Có/ <span class="en">Yes</span></div>
                                                <div><asp:Label runat="server" ID="prt_infected_with_covid_false" Text="❏"/>&nbsp;Không/ <span class="en">No</span></div>
                                            </div>
                                            <div>• Tiền sử tiêm chủng/ <span class="en">Immunization history:</span></div>
                                            <div>- Tiêm vắc xin phòng COVID-19/ <span class="en">COVID-19 vaccination:</span></div>
                                            <div style="display: grid; grid-template-columns: 1fr auto;">
                                                <div><asp:Label runat="server" ID="prt_received_1_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 1/ <span class="en">Received 1<sup>st</sup> dose</span></div>
                                                <div><asp:Label runat="server" ID="prt_received_2_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 2/ <span class="en">Received 2<sup>nd</sup> dose</span></div>
                                                <div><asp:Label runat="server" ID="prt_received_additional_true" Text="❏"/>&nbsp;Đã tiêm mũi bổ sung, nhắc lại/ <span class="en">Received additional, booster dose</span></div>
                                                <div><asp:Label runat="server" ID="prt_not_yet_vaccinations_true" Text="❏"/>&nbsp;Chưa tiêm/ <span class="en">Not yet</span></div>
                                            </div>
                                            <div style="margin-left: 6px;"><asp:Label runat="server" ID="prt_other_vaccinations"/></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: repeat(3, 1fr) auto; grid-gap: 6px;">
                                            <div>
                                                <span style="text-decoration: underline"><span style="font-weight: bold">Thói quen</span>/ <span class="en">Habits:</span></span>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" ID="prt_habits_a" Text="❏"/>&nbsp;Rượu/ <span class="en">Alcohol</span>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" ID="prt_habits_s" Text="❏"/>&nbsp;Thuốc lá/ <span class="en">Smoking</span>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" ID="prt_habits_d" Text="❏"/>&nbsp;Chất gây nghiện/ <span class="en">Drugs</span>
                                            </div>
                                        </div>
                                        <div><span style="font-weight: bold">Khác, ghi rõ</span>/ <span class="en">Other, specify: </span><asp:Label runat="server" ID="prt_habits_other"></asp:Label></div>
                                        <div><span style="text-decoration: underline"><span style="font-weight: bold">Thuốc dùng tại nhà</span>/ <span class="en" style="margin-right: 4px">Home medications:</span></span><asp:Label runat="server" ID="prt_home_medications"></asp:Label></div>
                                        <div><span style="text-decoration: underline"><span style="font-weight: bold">Tiền sử dị ứng</span>/ <span class="en" style="margin-right: 4px">Allergies:</span></span><asp:Label runat="server" ID="prt_allergies"></asp:Label></div>
                                        <div><span style="text-decoration: underline"><span style="font-weight: bold">Tiền sử bệnh người thân</span>/ <span class="en" style="margin-right: 4px">Relevant family history:</span></span><asp:Label runat="server" ID="prt_relevant_family_history"></asp:Label></div>
                                        <div><span style="text-decoration: underline"><span style="font-weight: bold">Khám lâm sàng liên quan</span>/ <span class="en" style="margin-right: 4px">Physical examination:</span></span><asp:Label runat="server" ID="Label4"></asp:Label></div>
                                        <div><span style="font-weight: bold">• Kết quả tìm thấy</span>/ <span class="en" style="margin-right: 4px">Findings (General and Diagnostic support):</span></div>
                                        <div ><asp:Label runat="server" ID="prt_finding"></asp:Label></div>
                                        <div><span style="font-weight: bold">• Yêu cầu khám chuyên khoa tâm lý</span>/ <span class="en" style="margin-right: 4px">Psychological assessment required:</span></div>
                                        <div style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px; margin-left: 16px">
                                            <div>
                                                <asp:Label ID="prt_required_code_false" runat="server" Text="❏" />
                                                <span>Không</span>/ <span class="en">No</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_required_code_true" runat="server" Text="❏" />
                                                <span>Có, ghi rõ</span>/ <span class="en" style="margin-right: 4px">Yes, specify:</span>
                                                <asp:Label runat="server" ID="prt_required_text"></asp:Label>
                                            </div>
                                        </div>
                                        <div><span style="text-decoration: underline"><span style="font-weight: bold">Kết quả khảo sát</span>/ <span class="en" style="margin-right: 4px">Investigations Results (Labs, imaging...):</span></span></div>
                                        <div ><asp:Label runat="server" ID="prt_investigations_results"></asp:Label></div>
                                        <div ><span style="text-decoration: underline"><span style="font-weight: bold">Chẩn đoán sơ bộ</span>/ <span class="en" style="margin-right: 4px">Initial diagnosis: </span></span><asp:Label runat="server" ID="prt_initial_diagnosis"></asp:Label></div>
                                        <div ><span style="text-decoration: underline"><span style="font-weight: bold">Chẩn đoán xác định</span>/ <span class="en" style="margin-right: 4px">Diagnosis: </span></span><asp:Label runat="server" ID="prt_comfirmed_diagnosis"></asp:Label></div>
                                        <div ><span style="text-decoration: underline"><span style="font-weight: bold">Chẩn đoán phân biệt</span>/ <span class="en" style="margin-right: 4px">Diferential diagnosis: </span></span><asp:Label runat="server" ID="prt_diferential_diagnosis"></asp:Label></div>
                                        <div ><span style="text-decoration: underline"><span style="font-weight: bold">Bệnh kèm theo</span>/ <span class="en" style="margin-right: 4px">Associated conditions: </span></span><asp:Label runat="server" ID="prt_associated_conditions"></asp:Label></div>
                                        
                                        <div style="display: grid; grid-template-columns: auto 100px 1fr; grid-gap: 6px">
                                            <div><span style="text-decoration: underline">Ý kiến của bác sỹ chuyên khoa/ <span class="en" style="margin-right: 4px">Specialist opinion:</span></span><asp:Label runat="server" ID="Label3"></asp:Label></div>
                                            <div>
                                                <asp:Label ID="prt_specialist_opinion_false" runat="server" Text="❏" />
                                                <span>Không</span>/ <span class="en" style="margin-right: 4px">No</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_specialist_opinion_true" runat="server" Text="❏" />
                                                <span>Có</span>/ <span class="en" style="margin-right: 4px">Yes</span>
                                                <asp:Label runat="server" ID="Label7"></asp:Label>
                                            </div>
                                        </div>
                                        <div  runat="server" id="specialist_opinion_collapse" style="margin-left: 10px">
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 6px">
                                                <div>
                                                    <div>* Tên của bác sĩ chuyên khoa/ khoa:</div>
                                                    <div class="en" style="margin-left: 12px"><span>Name of the specialist/ Department</span></div>
                                                </div>
                                                <asp:Label runat="server" ID="prt_name_of_specialist"></asp:Label>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 1fr 1fr; grid-gap: 6px">
                                                <div><span>* Giờ liên hệ</span>/ <span class="en" style="margin-right: 4px">Time contaced:</span><asp:Label runat="server" ID="prt_time_contaced"></asp:Label></div>
                                                <div><span>* Giờ khám</span>/ <span class="en" style="margin-right: 4px">Time provided:</span><asp:Label runat="server" ID="prt_time_provided"></asp:Label></div>
                                            </div>
                                            <div><span>* Tóm tắt ý kiến của bác sỹ chuyên khoa</span>/ <span class="en" style="margin-right: 4px">Specialist opinion summarised:</span><asp:Label runat="server" ID="prt_spec_opinion_summarised"></asp:Label></div>
                                        </div>
                                        <%--Care Plan--%>
                                        <div ><span style="text-decoration: underline"><span style="font-weight: bold">Kế hoạch chăm sóc</span>/ <span class="en">Care Plan</span></span></div>
                                        <div style="margin-left: 16px"><span style="font-weight: bold">1. Điều trị tại khoa cấp cứu</span>/ <span class="en">Treatment in Emergency:</span></div>
                                        <table class="table-bordered" runat="server" id="prt_treatment">
                                            <tr>
                                                <td style="width: 150px" class="text-center"><span class="en" style="font-weight: bold">Time</span></td>
                                                <td style="width: 200px" class="text-center"><span class="en" style="font-weight: bold">Medication and Fluid</span></td>
                                                <td style="width: 100px" class="text-center"><span class="en" style="font-weight: bold">Dose</span></td>
                                                <td style="width: 100px" class="text-center"><span class="en" style="font-weight: bold">Route</span></td>
                                                <td style="width: 221px" class="text-center"><span class="en" style="font-weight: bold">Comments</span></td>
                                            </tr>
                                        </table>
                                        <%--Progress Note--%>
                                        <div style="margin-left: 16px"><span style="font-weight: bold">Diễn tiến</span>/ <span class="en">Progress Note</span></div>
                                        <table  class="table-bordered mt-1 mb-1" runat="server" id="prt_progress_note">
                                            <tr>
                                                <td style="width: 150px" class="text-center"><span class="en" style="font-weight: bold">Time</span></td>
                                                <td style="width: 310px" class="text-center"><span class="en" style="font-weight: bold">Progress</span></td>
                                                <td style="width: 310px" class="text-center"><span class="en" style="font-weight: bold">Order</span></td>
                                            </tr>
                                        </table>
                                        <div><span style="font-weight: bold">* Kết luận sau điều trị</span>/ <span class="en" style="margin-right: 4px">Conclusions at termination of treatment:</span><asp:Label ID="prt_conclusions" runat="server" /></div>
                                        <div style="display: grid; grid-template-columns: auto 100px 1fr; grid-gap: 6px">
                                            <div><span style="font-weight: bold">2. Xuất viện</span>/ <span class="en" style="margin-right: 4px">Discharge:</span></div>
                                            <div>
                                                <asp:Label ID="prt_discharge_false" runat="server" Text="❏" />
                                                <span>Không</span>/ <span class="en" style="margin-right: 4px">No</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_discharge_true" runat="server" Text="❏" />
                                                <span>Có</span>/ <span class="en" style="margin-right: 4px">Yes</span>
                                            </div>
                                        </div>
                                        <div  runat="server" id="div_discharge_field">
                                            <div><span style="font-weight: bold">* Toa thuốc</span>/ <span class="en" style="margin-right: 4px">Prescription:</span><asp:Label ID="prt_prescription" Text="❏" runat="server" /></div>
                                            <div><span style="font-weight: bold">* Ghi rõ các hướng dẫn chăm sóc tiếp theo</span>/ <span class="en" style="margin-right: 4px">Specify follow-up care instructions:</span><asp:Label ID="prt_specify_care_instructions" Text="❏" runat="server" /></div>
                                            <div><span style="font-weight: bold">* Giờ rời khỏi khoa cấp cứu</span>/ <span class="en" style="margin-right: 4px">Discharge Time:</span><asp:Label ID="prt_discharge_time" Text="❏" runat="server" /></div>
                                        </div>
                                        <%--3. Referred to OPD--%>
                                        <div><span style="font-weight: bold">3. Chuyển sang khám ngoại trú/ <span class="en">Referred to OPD:</span></span></div>
                                        <div style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px; margin-left: 16px">
                                            <div>
                                                <asp:Label ID="prt_referred_to_opd_false" runat="server" Text="❏" />
                                                <span>Không</span>/ <span class="en" style="margin-right: 4px">No</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_referred_to_opd_true" runat="server" Text="❏" />
                                                <span>Có, ghi rõ</span>/ <span class="en" style="margin-right: 4px">Yes, specify:</span>
                                                <asp:Label runat="server" ID="prt_referred_to_opd_text"></asp:Label>
                                            </div>
                                        </div>
                                        <%--4. Hospitalisation required--%>
                                        <div style="display: grid; grid-template-columns: auto 100px 1fr; grid-gap: 6px">
                                            <div><span style="font-weight: bold"><span>4. Yêu cầu nhập viện</span>/ <span class="en" style="margin-right: 4px">Hospitalisation required:</span></span><asp:Label runat="server" ID="Label5"></asp:Label></div>
                                            <div>
                                                <asp:Label ID="prt_hospitalisation_required_false" runat="server" Text="❏" />
                                                <span>Không</span>/ <span class="en" style="margin-right: 4px">No</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_hospitalisation_required_true" runat="server" Text="❏" />
                                                <span>Có</span>/ <span class="en" style="margin-right: 4px">Yes</span>
                                            </div>
                                        </div>
                                        <div  runat="server" id="div_hos_req_field">
                                            <div><span>* Lý do</span>/ <span class="en" style="margin-right: 4px">Reason:</span><asp:Label ID="prt_reason" Text="❏" runat="server" /></div>
                                            <div><span>* Tại khoa</span>/ <span class="en" style="margin-right: 4px">Ward:</span><asp:Label ID="prt_ward" Text="❏" runat="server" /></div>
                                            <div><span>* Giờ rời khỏi khoa Cấp cứu</span>/ <span class="en" style="margin-right: 4px">Time of leaving Emergency:</span><asp:Label ID="prt_time_of_leaving_emergency" Text="❏" runat="server" /></div>
                                        </div>
                                        <%--5. In case of emergency surgery--%>
                                        <div style="display: grid; grid-template-columns: auto 100px 1fr; grid-gap: 6px">
                                            <div ><span style="font-weight: bold"><span>5. Nếu phẫu thuật cấp cứu</span>/ <span class="en" style="margin-right: 4px">In case of emergency surgery:</span></span><asp:Label runat="server" ID="Label6"></asp:Label></div>
                                            <div>
                                                <asp:Label ID="prt_emergency_surgery_false" runat="server" Text="❏" />
                                                <span>Không</span>/ <span class="en" style="margin-right: 4px">No</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_emergency_surgery_true" runat="server" Text="❏" />
                                                <span>Có</span>/ <span class="en" style="margin-right: 4px">Yes</span>
                                            </div>
                                        </div>
                                        <div><span>Khi không có thời gian để ghi nhận đầy đủ bệnh sử và kết quả khám lâm sàng của bệnh nhân cần phẫu thuật cấp cứu, vui lòng ghi rõ:</span></div>
                                        <div class="en">When there is no time to record the complete history and physical examination of a patient requiring emergency surgery, indicate:</div>
                                        <div  runat="server" id="div_emr_sur_field">
                                            <div><span>* Chẩn đoán trước phẫu thuật</span>/ <span class="en" style="margin-right: 4px">Pre-operative diagnosis:</span><asp:Label ID="prt_preoperative_diagnosis" Text="❏" runat="server" /></div>
                                            <div><span>* Tóm tắt bệnh án</span>/ <span class="en" style="margin-right: 4px">Summary of medical record:</span><asp:Label ID="prt_brief_summary" Text="❏" runat="server" /></div>
                                            <div><span>* Giờ rời khỏi khoa Cấp cứu</span>/ <span class="en" style="margin-right: 4px">Time of leaving Emergency:</span><asp:Label ID="prt_time_of_leaving_emer_e" Text="❏" runat="server" /></div>
                                        </div>
                                        <%--6. In case of transfer to another hospital--%>
                                        <div style="display: grid; grid-template-columns: auto 100px 1fr; grid-gap: 6px">
                                            <div><span style="font-weight: bold"><span>6. Nếu chuyển đến BV khác</span>/ <span class="en" style="margin-right: 4px">In case of transfer to another hospital:</span></span><asp:Label runat="server" ID="Label8"></asp:Label></div>
                                            <div>
                                                <asp:Label ID="prt_transfer_hospital_false" runat="server" Text="❏" />
                                                <span>Không</span>/ <span class="en" style="margin-right: 4px">No</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_transfer_hospital_true" runat="server" Text="❏" />
                                                <span>Có</span>/ <span class="en" style="margin-right: 4px">Yes</span>
                                            </div>
                                        </div>
                                        <div  runat="server" id="div_transfer_hos_field">
                                            <div><span>* Lý do chuyển viện</span>/ <span class="en" style="margin-right: 4px">Reason for transfer:</span><asp:Label ID="prt_reason_for_transfer" runat="server" /></div>
                                            <div><span>* Cơ sở y tế tiếp nhận</span>/ <span class="en" style="margin-right: 4px">Admission medical facility:</span><asp:Label ID="prt_transfer_hospital_name" runat="server" /></div>
                                            <div style="display: grid; grid-template-columns: repeat(2, 1fr)">
                                                <div style="display: grid; grid-template-columns: auto 1fr">
                                                    <div>
                                                        <div>* Tên người nhận:</div>
                                                        <div class="en" style="margin-left: 12px">Admission person</div>
                                                    </div>
                                                    <asp:Label ID="prt_transfer_hospital_employee" runat="server" />
                                                </div>
                                                <div style="display: grid; grid-template-columns: auto 1fr">
                                                    <div>
                                                        <div>Số ĐT liên lạc:</div>
                                                        <div class="en" style="margin-right: 4px">Contact number</div>
                                                    </div>
                                                    <asp:Label ID="prt_transfer_hospital_phone" runat="server" />
                                                </div>
                                            </div>
                                            <div><span>* Tình trạng trước khi chuyển viện</span>/ <span class="en" style="margin-right: 4px">Status before transfer:</span><asp:Label ID="prt_status_before_transfer" runat="server" /></div>
                                            <div><span>* Giờ rời khỏi khoa Cấp cứu</span>/ <span class="en" style="margin-right: 4px">Time of leaving Emergency:</span><asp:Label ID="prt_time_of_leaving_emer_a" runat="server" /></div>
                                        </div>
                                        <div><span style="font-weight: bold; text-decoration: underline">Tình trạng của bệnh nhân khi xuất viện/ <span class="en">Patient's Condition at Discharge:</span></span></div>
                                        <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 6px; margin-left: 6px">
                                            <div>
                                                <asp:Label ID="prt_patient_discharge_imp" runat="server" Text="❏" />
                                                <span>Có cải thiện</span>/ <span class="en">Improved</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_patient_discharge_unc" runat="server" Text="❏" />
                                                <span>Không thay đổi</span>/ <span class="en">Unchanged</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_patient_discharge_uns" runat="server" Text="❏" />
                                                <span>Không ổn định</span>/ <span class="en">Unstable</span>
                                            </div>
                                        </div>
                                        <div><asp:Label runat="server" ID="prt_patient_discharge"></asp:Label></div>
                                        <div><span style="text-decoration: underline"><span style="font-weight: bold">ICD-10 Code(S)</span>/ <i style="margin-right: 4px">Mã ICD-10:</i></span><asp:Label ID="prt_icd_10" Text="❏" runat="server" /></div>
                                        <div>&nbsp;</div>
                                        <div style="display: grid; grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                            <div></div>
                                            <div style="text-align: center; break-inside: avoid !important; page-break-inside: avoid !important">
                                                <asp:Label runat="server" ID="prt_printed_datetime"></asp:Label>
                                                <div><span style="font-weight: bold">Bác sĩ điều trị/ <span class="en">Primary doctor</span></span></div>
                                                <div><span>(Họ tên, chữ ký, MSNV/ <span class="en">Name, signature & ID)</span></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" runat="server" id="print_footer">
                                    <div style="margin-left: -18px"><img style="width: 210mm" src="../images/ExcellentCare.png" /></div>
                                    <div class="footer-info" style="padding: 0 18px">
                                        <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                        <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Tp. Thủ Đức, Tp.HCM</div>
                                        <div>Tel: 028 3910 9999</div>
                                        <div>www.aih.com.vn</div>
                                    </div>
                                </td>
                                <td class="report-footer-space" runat="server" id="print_footer_space"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="cssclsNoPrint">
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                <li><asp:LinkButton runat="server" ID="btnHome" OnClick="RedirectToPatientSummary" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                <li>Emergency Medical Assessment</li>
            </ul>
            <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                <asp:HiddenField runat="server" ID="DataObj" />
                <asp:UpdatePanel runat="server" ID="UpdatePanel8" style="position: sticky; top: 0; z-index: 1000;">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <div class="card" runat="server" id="amendReasonWraper">
                                <div class="card-body">
                                    <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span><br /><span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                                    <div class="form-group mb-2">
                                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />
                                        <asp:CustomValidator ID="CustomValidator40" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Please enter amend reason" CssClass="text-danger" OnServerValidate="txt_amend_reason_ServerValidate"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%-- Patient Info --%>
                <webUI:PatientInfo runat="server" ID="uc_patientInfo"></webUI:PatientInfo>

                <div class="row">
                    <div class="col-12">
                        <div class="card v20">
                            <div class="card-header">
                                <h4 class="text-primary">EMERGENCY MEDICAL ASSESSMENT
                                </h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body">
                                    <%--<div id="loader" style="display: none; height: 100vh;width: 100vw;top: 0;position: fixed;left: 0;right: 0;bottom: 0;background: #00000026;z-index: 1000;"></div>--%>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="LastestVersion">
                                                        <span class="mr-2"><i class="fa fa-exclamation-triangle" style="font-size:24px"></i></span>
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:LinkButton OnClick="GoToLastestVersion" ID="hlkLastestVersion" Text="[View latest version]" runat="server"></asp:LinkButton>
                                                    </div>
                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <span class="mr-2"><i style="font-size: 24px;" class="fa fa-exclamation-circle"></i></span>
                                                        <telerik:RadLabel runat="server" ID="rlblLogHistory" />
                                                        <asp:UpdatePanel runat="server" ID="uplViewHistory">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" ID="lbtnViewHistory" OnClick="ViewHistory" Text="[View History]"></asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Ngày, giờ bắt đầu đánh giá/ <span class="text-primary">Starting date, time of the assessmen: <span class="text-danger">*</span></span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_evaluation_time"></asp:Label>
                                                    <div  runat="server" id="evaluation_time_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_evaluation_time" Width="200px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                        <asp:CustomValidator ID="CustomValidator38" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="dtpk_evaluation_time_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">
                                                        Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div runat="server" id="lbl_chief_complaint_code">
                                                        <asp:Label runat="server" ID="lbl_chief_complaint"></asp:Label>
                                                        <asp:Label runat="server" ID="lbl_chief_complaint_desc"></asp:Label>
                                                    </div>
                                                    <div runat="server" id="chief_complaint_code_wrapper">
                                                        <div>
                                                            <div class="custom-control d-inline-block custom-radio">
                                                                <input type="radio" id="rad_chief_complaint_code_R" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_chief_complaint_code_R">
                                                                    Hồi sức/ <span class="text-primary">Resuscitation</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control d-inline-block custom-radio">
                                                                <input type="radio" id="rad_chief_complaint_code_E" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_chief_complaint_code_E">
                                                                    Cấp cứu/ <span class="text-primary">Emergency</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control d-inline-block custom-radio">
                                                                <input type="radio" id="rad_chief_complaint_code_U" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_chief_complaint_code_U">
                                                                    Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                                            </div>
                                                            <div class="custom-control d-inline-block custom-radio">
                                                                <input type="radio" id="rad_chief_complaint_code_L" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_chief_complaint_code_L">
                                                                    Trì  hoãn/ <span class="text-primary">Less Urgent</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control d-inline-block custom-radio">
                                                                <input type="radio" id="rad_chief_complaint_code_N" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_chief_complaint_code_N">
                                                                    Không cấp cứu/ <span class="text-primary">Non-Urgent</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                    <icon:XSquare runat="server" ID="XSquare38" />
                                                                </a>
                                                            </div>
                                                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="chief_complaint_code_ServerValidate"></asp:CustomValidator>
                                                        </div>

                                                        <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                            <webUI:TextField runat="server" ClientIDMode="Static" ID="txt_chief_complaint" />
                                                        </div>
                                                        <asp:CustomValidator ID="CustomValidator11" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="chief_complaint_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">
                                                        Bệnh Sử/ <span class="text-primary">History of present illness(HPI):</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_history_of_present"></asp:Label>
                                                    <div class="form-group" runat="server" id="history_of_present_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_history_of_present" />
                                                        <asp:CustomValidator ID="CustomValidator12" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="history_of_present_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">
                                                        Tiền sử bệnh/ <span class="text-primary">Past medical history (PMH):</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="dg-1 mb-1">
                                                <label class="control-label mb-1"><span class="font-bold">Nội</span>/ <span class="text-primary">Meds</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_past_med_his_meds"></asp:Label>
                                                    <div class="form-group" runat="server" id="past_med_his_meds_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_past_med_his_meds" />
                                                        <asp:CustomValidator ID="CustomValidator13" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="past_med_his_meds_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                            <div class="dg-1 mb-1">
                                                <label class="control-label mb-1"><span class="font-bold">Ngoại</span>/ <span class="text-primary">Surgical</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_past_med_his_surs"></asp:Label>
                                                    <div class="form-group" runat="server" id="past_med_his_surs_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_past_med_his_surs" />
                                                        <asp:CustomValidator ID="CustomValidator33" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="past_med_his_surs_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="add-v20">
                                                <label class="control-label"><span class="font-bold">Đã từng nhiễm COVID-19 trong vòng 6 tháng qua</span>/ <span class="text-primary">Have been infected with COVID-19 within the last 6 months:</span></label>
                                                <div class="dg-1">
                                                    <div></div>
                                                    <asp:Label runat="server" ID="lbl_infected_with_covid"></asp:Label>
                                                    <div runat="server" id="infected_with_covid_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" onchange="radioButtonChange(this)" runat="server" id="rad_infected_with_covid_true" name="rad_infected_with_covid" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_infected_with_covid_true">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="allergy_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_infected_with_covid_false" name="rad_infected_with_covid" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_infected_with_covid_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div><label class="control-label"><span class="font-bold">Tiền sử tiêm chủng</span>/ <span class="text-primary">Immunization history:</span></label></div>
                                            
                                                <div style="margin-left: 20px;" class="mb-2">
                                                    <label class="control-label">• Tiêm vắc xin phòng COVID-19/ <span class="text-primary">COVID-19 vaccination:</span></label>
                                                
                                                    <div>
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_1_dose_true" />
                                                            <span class="custom-control-label">Đã tiêm mũi 1/ <span class="text-primary">Received 1<sup>st</sup> dose</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_2_dose_true" />
                                                            <span class="custom-control-label">Đã tiêm mũi 2/ <span class="text-primary">Received 2<sup>st</sup> dose</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_additional_true" />
                                                            <span class="custom-control-label">Đã tiêm mũi bổ sung, nhắc lại/ <span class="text-primary">Received additional, booster dose</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_not_yet_vaccinations_true" />
                                                            <span class="custom-control-label">Chưa tiêm/ <span class="text-primary">Not yet</span></span>
                                                        </label>
                                                    </div>

                                                    <div class="dg-1">
                                                        <label class="control-label">• Tiêm vắc xin khác (ghi rõ)/ <span class="text-primary">Other vaccinations (specify):</span></label>
                                                        <asp:Label runat="server" ID="lbl_other_vaccinations"></asp:Label>
                                                        <div class="form-group" runat="server" id="other_vaccinations_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_other_vaccinations" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>


                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1"><span class="font-bold">Thói quen</span>/ <span class="text-primary">Habits:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_habits"></asp:Label>
                                                    <div runat="server" id="habits_wrapper">
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox"
                                                                runat="server" id="cb_habits_A"
                                                                class="custom-control-input" />
                                                            <span
                                                                class="custom-control-label">Alcohol/ <span class="text-primary">Rượu</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox"
                                                                runat="server" id="cb_habits_S"
                                                                class="custom-control-input" />
                                                            <span class="custom-control-label">Smoking/ <span class="text-primary">Thuốc</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" runat="server" id="cb_habits_D" class="custom-control-input" />
                                                            <span
                                                                class="custom-control-label">Chất gây nghiện/ <span class="text-primary">Drugs</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input disabled-for="habit_other_field" type="checkbox" runat="server" id="cb_habits_O" class="custom-control-input" />
                                                            <span
                                                                class="custom-control-label">Khác, ghi rõ/ <span class="text-primary">Other, specify</span></span>
                                                        </label>
                                                        <div class="form-group habit_other_field">
                                                            <webUI:TextField runat="server" ID="txt_habits_other" />
                                                        </div>
                                                        <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="habits_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                    <div></div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1"><span class="font-bold">Thuốc dùng tại nhà</span>/ <span class="text-primary">Home medications:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_home_medications"></asp:Label>

                                                    <div class="form-group" runat="server" id="home_medications_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_home_medications" />
                                                        <asp:CustomValidator ID="CustomValidator14" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="home_medications_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1"><span class="font-bold">Tiền sử dị ứng</span>/ <span class="text-primary">Allergies:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_allergies"></asp:Label>
                                                    <div class="form-group" runat="server" id="allergies_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_allergies" />
                                                        <asp:CustomValidator ID="CustomValidator15" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="allergies_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1"><span class="font-bold">Tiền sử bệnh người thân</span>/ <span class="text-primary">Relevant family history:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_relevant_family_history"></asp:Label>
                                                    <div class="form-group" runat="server" id="relevant_family_history_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_relevant_family_history" />
                                                        <asp:CustomValidator ID="CustomValidator16" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="relevant_family_history_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">Khám lâm sàng liên quan/ <span class="text-primary">Physical examination:</span></label></div>

                                            <div><label class="control-label"><span class="font-bold">• Kết quả tìm thấy</span>/ <span class="text-primary">Findings (General and Diagnostic support):</span></label></div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_finding"></asp:Label>
                                                    <div class="form-group" runat="server" id="finding_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_finding" />
                                                        <asp:CustomValidator ID="CustomValidator17" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="finding_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label"><span class="font-bold">• Yêu cầu khám chuyên khoa tâm lý</span>/ <span class="text-primary">Psychological assessment required:</span></label></div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_required_code"></asp:Label>
                                                    <div runat="server" id="required_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_required_code_False" runat="server" name="rad_required_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_required_code_False">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio mb-1  d-inline-block">
                                                            <input disabled-for="required_code_field" type="radio" id="rad_required_code_True" runat="server" name="rad_required_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_required_code_True">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_required_code" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare1" />
                                                            </a>
                                                        </div>
                                                        <div class="row par required_code_field">
                                                            <webUI:TextField runat="server" ID="txt_required_text" />
                                                        </div>
                                                        <asp:CustomValidator ID="CustomValidator3" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="required_code_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label mb-1"><span class="font-bold">Kết quả khảo sát</span>/ <span class="text-primary">Investigations Results (Labs, Imaging...):</span></label></div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_investigations_results"></asp:Label>
                                                    <div class="form-group" runat="server" id="investigations_results_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_investigations_results" />
                                                        <asp:CustomValidator ID="CustomValidator18" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="investigations_results_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label"><span class="font-bold">Chẩn đoán ban đầu</span>/ <span class="text-primary">Initial diagnosis:</span></label></div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                        <asp:CustomValidator ID="CustomValidator19" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="initial_diagnosis_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label mb-1"><span class="font-bold">Chẩn đoán xác định</span>/ <span class="text-primary">Diagnosis:</span></label></div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_comfirmed_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="comfirmed_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_comfirmed_diagnosis" />
                                                        <asp:CustomValidator ID="CustomValidator39" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="comfirmed_diagnosis_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label"><span class="font-bold">Chẩn đoán phân biệt</span>/ <span class="text-primary">Differential diagnosis:</span></label></div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_diferential_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="diferential_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diferential_diagnosis" />
                                                        <asp:CustomValidator ID="CustomValidator20" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="diferential_diagnosis_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label mb-1"><span class="font-bold">Bệnh kèm theo</span>/ <span class="text-primary">Associated conditions:</span></label></div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_associated_conditions"></asp:Label>
                                                    <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                            <asp:CustomValidator ID="CustomValidator21" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="associated_conditions_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <fieldset class="mb-2">
                                                        <div><label class="control-label mb-1"><span class="font-bold">Ý kiến của bác sĩ chuyên khoa</span>/ <span class="text-primary">Specialist opinion:</span></label></div>
                                            
                                                        <div class="dg-1 mb-2">
                                                            <div></div>
                                                            <div>
                                                                <asp:Label runat="server" ID="lbl_specialist_opinion"></asp:Label>
                                                                <div runat="server" id="specialist_opinion_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onclick="__doPostBack('specialist_opinion_change','False')" type="radio" id="rad_specialist_opinion_False" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_specialist_opinion_False">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onclick="__doPostBack('specialist_opinion_change','True')" disabled-for="specialist_opinion_field" type="radio" id="rad_specialist_opinion_True" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_specialist_opinion_True">Có/ <span class="text-primary">Yes</span></label>
                                                                        <input onclick="__doPostBack('specialist_opinion_change','clear')" hidden="hidden" type="checkbox" id="Radio5" runat="server" />
                                                                        <label for="Radio5"><icon:XSquare runat="server" ID="XSquare2" /></label>
                                                                    </div>
                                                                    <asp:CustomValidator ID="CustomValidator4" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="specialist_opinion_ServerValidate"></asp:CustomValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div runat="server" id="specialist_opinion_field">

                                                            <div class="dg-1 mb-2">
                                                                <div><label class="control-label mb-1">* Tên của bác sĩ chuyên khoa/ Khoa/ <span class="text-primary">Name of the specialist/ Department:</span></label></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_name_of_specialist"></asp:Label>
                                                                    <div class="form-group" runat="server" id="name_of_specialist_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_name_of_specialist" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <div><label class="control-label mb-1">* Giờ liên hệ/ <span class="text-primary">Time contacted:</span></label></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_time_contaced"></asp:Label>
                                                                    <div class="form-group" runat="server" id="time_contaced_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_contaced" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"  />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <div><label class="control-label mb-1">* Giờ khám/ <span class="text-primary">Time provided:</span></label></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_time_provided"></asp:Label>
                                                                    <div class="form-group" runat="server" id="time_provided_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_provided" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"  />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <label class="control-label mb-1">* Tóm tắt ý kiến của bác sĩ chuyên khoa/ <span class="text-primary">Specialist opinion summarised:</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_spec_opinion_summarised"></asp:Label>
                                                                    <div class="form-group" runat="server" id="spec_opinion_summarised_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_spec_opinion_summarised" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div><label class="control-label mb-1"><span class="font-bold">Kế hoạch chăm sóc</span>/ <span  class="text-primary">Care Plan:</span></label></div>

                                            <div><label class="control-label mb-1"><span class="font-bold">1. Điều trị tại khoa cấp cứu</span>/ <span  class="text-primary">Treatment in Emergency:</span></label></div>

                                            <div class="mb-2">
                                                <asp:UpdatePanel ID="updatePanel_Treatment" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_Treatment" runat="server" OnRowDeleting="grid_Treatment_RowDeleting" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive table-bordered" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div class="text-center p-2"><span class="text-primary">Time</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <telerik:RadDateTimePicker Width="200px" ID="time" runat="server" SelectedDate='<%# BindingRadDateTimePicker(Eval("time")) %>'  TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm" ></telerik:RadDateTimePicker>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div class="text-center p-2" style="width: 285px"><span class="text-primary">Medication and Fluid</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField runat="server" Value='<%#Eval("medication") %>' ID="medication" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 80px" class="text-center p-2"><span class="text-primary">Dose</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField runat="server" Value='<%#Eval("dose") %>' ID="dose" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 80px" class="text-center p-2"><span class="text-primary">Route</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField runat="server" Value='<%#Eval("route") %>' ID="route" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px" class="text-center p-2"><span class="text-primary">Comment</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField runat="server" Value='<%#Eval("comment") %>' ID="comment" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                            <icon:Trash runat="server" ID="Trash" />
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_Treatment" runat="server" AssociatedUpdatePanelID="updatePanel_Treatment">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_Treatment_add" runat="server" CssClass="btn btn-sm btn-secondary" OnClick="btn_grid_Treatment_add_Click" Text="+ Add Row" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_Treatment_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>

                                            <div><label class="control-label mb-1"><span class="font-bold">Diễn tiến</span>/ <span  class="text-primary">Progress Note:</span></label></div>
                                    
                                            <div class="mb-2">
                                                <asp:UpdatePanel ID="updatePanel_ProgressNote" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_progress_note" runat="server" OnRowDeleting="grid_progress_note_RowDeleting" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive table-bordered" AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div class="text-center p-2"><span class="text-primary">Time</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadDateTimePicker Width="200px" ID="time" runat="server" SelectedDate='<%# BindingRadDateTimePicker(Eval("time")) %>'  TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm" ></telerik:RadDateTimePicker>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px" class="text-center p-2"><span class="text-primary">Progress</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("progress") %>' ID="progress" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px" class="text-center p-2"><span class="text-primary">Order</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("appropriate_order") %>' ID="appropriate_order" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                        <icon:Trash runat="server" ID="Trash" />
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="updateProgress_ProgressNote" runat="server" AssociatedUpdatePanelID="updatePanel_ProgressNote">
                                                        <ProgressTemplate>
                                                            Please wait....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:Button ID="btn_grid_progress_note_add" runat="server" CssClass="btn btn-sm btn-secondary" Text="+ Add Row" OnClick="btn_grid_progress_note_add_Click" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_grid_progress_note_add" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            </div>
                                            <%--<div class="del-v20" style="display: none;">--%>
                                            <div>
                                                <div><label class="control-label mb-1"><span class="font-bold">Kết  luận sau điều trị</span>/ <span class="text-primary">Conclusions at termination of treatment:</span></label></div>

                                                <div class="dg-1 mb-2">
                                                    <div></div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_conclusions"></asp:Label>
                                                        <div class="form-group" runat="server" id="conclusions_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_conclusions" />
                                                            <asp:CustomValidator ID="CustomValidator22" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="conclusions_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-2">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <fieldset>
                                                            <div><label class="control-label mb-2"><span class="font-bold">2. Xuất viện</span>/ <span class="text-primary">Discharge:</span></label></div>
                                                            <div class="dg-1 mb-2">
                                                                <div></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_discharge"></asp:Label>
                                                                    <div runat="server" id="discharge_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input onclick="__doPostBack('discharge_change','False')" type="radio" id="rad_discharge_False" runat="server" name="rad_discharge" class="custom-control-input" /><label class="custom-control-label" for="rad_discharge_False">Không/ <span class="text-primary">No</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input onclick="__doPostBack('discharge_change','True')" disabled-for="discharge_field" type="radio" id="rad_discharge_True" runat="server" name="rad_discharge" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_discharge_True">Có/ <span class="text-primary">Yes</span></label>
                                                                                <input onclick="__doPostBack('discharge_change','clear')" hidden="hidden" type="checkbox" id="Radio4" runat="server" />
                                                                            <label for="Radio4"><icon:XSquare runat="server" ID="XSquare3" /></label>
                                                                        </div>
                                                                        <asp:CustomValidator ID="CustomValidator5" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="discharge_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div runat="server" id="discharge_field">
                                                                <div class="dg-1 mb-2">
                                                                    <div><label class="control-label mb-1"><span class="font-bold">* Toa thuốc</span>/ <span class="text-primary">Prescription:</span></label></div>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_prescription"></asp:Label>
                                                                        <div class="form-group" runat="server" id="prescription_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_prescription" />
                                                                            <asp:CustomValidator ID="CustomValidator23" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="prescription_ServerValidate"></asp:CustomValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="dg-1 mb-2">
                                                                    <div><label class="control-label mb-1"><span class="font-bold">* Ghi rõ các hướng dẫn chăm sóc tiếp theo</span>/ <span class="text-primary">Specify follow-up care instructions:</span></label></div>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_specify_care_instructions"></asp:Label>
                                                                        <div class="form-group" runat="server" id="specify_care_instructions_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_specify_care_instructions" />
                                                                            <asp:CustomValidator ID="CustomValidator24" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="specify_care_instructions_ServerValidate"></asp:CustomValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="dg-1 mb-2">
                                                                    <div><label class="control-label mb-1"><span class="font-bold">* Giờ rời khỏi khoa cấp cứu</span>/ <span class="text-primary">Discharge Time:</span></label></div>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_discharge_time"></asp:Label>
                                                                        <div runat="server" id="discharge_time_wrapper">
                                                                            <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_discharge_time" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_discharge_time" ErrorMessage="Field is required." ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>

                                            <div class="mb-2">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <fieldset>
                                                            <div><label class="control-label mb-1"><span class="font-bold">3. Chuyển sang khám ngoại trú</span>/ <span class="text-primary">Referred to OPD:</span></label></div>

                                                            <div class="dg-1 mb-2">
                                                                <div></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_referred_to_OPD"></asp:Label>
                                                                    <div runat="server" id="referred_to_OPD_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input type="radio" id="rad_referred_to_OPD_False" runat="server" name="rad_referred_to_OPD" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_referred_to_OPD_False">Không/ <span class="text-primary">No</span></label>
                                                                        </div>

                                                                        <div class="custom-control custom-radio mb-2 d-inline-block">
                                                                            <input disabled-for="referred_to_OPD_field" type="radio" id="rad_referred_to_OPD_True" runat="server" name="rad_referred_to_OPD" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_referred_to_OPD_True">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                                            <a href="javascript:void(0)"  data-clear="rad_referred_to_OPD" onclick="clear_radiobutton(this)">
                                                                                <icon:XSquare runat="server" ID="XSquare4" />
                                                                            </a>
                                                                        </div>

                                                                        <div class="form-group referred_to_OPD_field">
                                                                            <webUI:TextField runat="server" ID="txt_referred_to_OPD_text" />
                                                                        </div>

                                                                        <asp:CustomValidator ID="CustomValidator6" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="referred_to_OPD_ServerValidate"></asp:CustomValidator>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                    
                                            <div class="mb-2">
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <fieldset>
                                                <div><label class="control-label mb-2"><span class="font-bold">4. Yêu cầu nhập viện</span>/ <span class="text-primary">Hospitalisation required:</span></label></div>
                                                
                                                <div class="dg-1 mb-2">
                                                    <div></div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_hospitalisation_required"></asp:Label>
                                                        <div runat="server" id="hospitalisation_required_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" onclick="__doPostBack('hos_req_change','False')" id="rad_hospitalisation_required_False" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_hospitalisation_required_False">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio mb-2 d-inline-block">
                                                                <input onclick="__doPostBack('hos_req_change','True')" type="radio" id="rad_hospitalisation_required_True" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_hospitalisation_required_True">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                                <input onclick="__doPostBack('hos_req_change','clear')"  type="checkbox" id="Radio1" hidden="hidden" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                                <label for="Radio1"><icon:XSquare runat="server" ID="XSquare9" /></label>
                                                            </div>
                                                            <asp:CustomValidator ID="CustomValidator7" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="hos_req_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div runat="server" id="hos_req_field">
                                                    <div class="dg-1 mb-2">
                                                        <div><label class="control-label mb-1">* Lý do/ <span class="text-primary">Reason:</span></label></div>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_reason"></asp:Label>
                                                            <div class="form-group" runat="server" id="reason_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_reason" />
                                                                <asp:CustomValidator ID="CustomValidator25" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="reason_ServerValidate"></asp:CustomValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="dg-1 mb-2">
                                                        <div><label class="control-label mb-1">* Tại khoa/ <span class="text-primary">Ward:</span></label></div>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_ward"></asp:Label>
                                                            <div class="form-group" runat="server" id="ward_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_ward" />
                                                                <asp:CustomValidator ID="CustomValidator26" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="ward_ServerValidate"></asp:CustomValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="dg-1 mb-2">
                                                        <div><label class="control-label mb-1">* Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Discharge Time:</span></label></div>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_time_of_leaving_emergency"></asp:Label>
                                                            <div runat="server" id="time_of_leaving_emergency_wrapper">
                                                                <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_of_leaving_emergency" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_time_of_leaving_emergency" ErrorMessage="Field is required."
                                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                            </div>

                                            <div class="mb-2">
                                                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <fieldset>
                                                            <div><label class="control-label mb-1"><span class="font-bold">5. Nếu phẫu thuật cấp cứu</span>/ <span class="text-primary">In case of emergency surgery:</span></label></div>
                                                            
                                                            <p>
                                                                Khi không có thời gian để ghi nhận đầy đủ bệnh sử và kết quả khám lâm sàng của bệnh nhân cần phẫ̃u thuật cấp cứu, vui lòng ghi rõ:
                                                                <br />
                                                                <span class="text-primary">When there is no time to record the complete history and physical examination of a patient requiring emergency surgery, indicate </span>
                                                            </p>

                                                            <div class="dg-1 mb-2">
                                                                <div></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_emergency_surgery"></asp:Label>
                                                                    <div runat="server" id="emergency_surgery_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input onclick="__doPostBack('emergency_surgery_change','False')" type="radio" id="rad_emergency_surgery_False" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_emergency_surgery_False">
                                                                                Không/<span class="text-primary">No</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-2 d-inline-block">
                                                                            <input onclick="__doPostBack('emergency_surgery_change','True')" type="radio" id="rad_emergency_surgery_True" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_emergency_surgery_True">
                                                                                Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>

                                                                            <input onclick="__doPostBack('emergency_surgery_change','clear')" type="checkbox" hidden="hidden" id="Radio2" runat="server" />

                                                                            <label for="Radio2"><icon:XSquare runat="server" ID="XSquare6" /></label>
                                                        
                                                                        </div>
                                                                        <asp:CustomValidator ID="CustomValidator8" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="emergency_surgery_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div runat="server" id="emr_sur_field">
                                                                <div class="dg-1 mb-2">
                                                                    <div><label class="control-label mb-1">* Chẩn đoán trước phẫu thuật/ <span class="text-primary">Pre-operative diagnosis:</span></label></div>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_pre_operative_diagnosis"></asp:Label>
                                                                        <div class="form-group" runat="server" id="pre_operative_diagnosis_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_pre_operative_diagnosis" />
                                                                            <asp:CustomValidator ID="CustomValidator27" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="pre_operative_diagnosis_ServerValidate"></asp:CustomValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="dg-1 mb-2">
                                                                    <div><label class="control-label mb-1">* Tóm tắt bệnh án/ <span class="text-primary">Brief summary:</span></label></div>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_brief_summary"></asp:Label>
                                                                        <div class="form-group" runat="server" id="brief_summary_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_brief_summary" />
                                                                            <asp:CustomValidator ID="CustomValidator28" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="brief_summary_ServerValidate"></asp:CustomValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="dg-1 mb-2">
                                                                    <div><label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label></div>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_time_of_leaving_emer_e"></asp:Label>
                                                                        <div runat="server" id="time_of_leaving_emer_e_wrapper">
                                                                            <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_of_leaving_emer_e" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm" />
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_time_of_leaving_emer_e" ErrorMessage="Field is required."
                                                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </fieldset>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>

                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <fieldset class="mb-2">
                                                        <div><label class="control-label mb-1"><span class="font-bold">6. Nếu chuyển đến BV khác</span>/ <span class="text-primary">In case of transfer to another hospital:</span></label></div>
                                                        <div class="dg-1 mb-2">
                                                            <div></div>
                                                            <div>
                                                                <asp:Label runat="server" ID="lbl_transfer_hospital"></asp:Label>
                                                                <div runat="server" id="transfer_hospital_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onclick="__doPostBack('transfer_hospital_change','False')" type="radio" id="rad_transfer_hospital_False" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_transfer_hospital_False">
                                                                            Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio mb-2 d-inline-block">
                                                                        <input onclick="__doPostBack('transfer_hospital_change','True')"  type="radio" id="rad_transfer_hospital_True" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_transfer_hospital_True">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                                        <input onclick="__doPostBack('transfer_hospital_change','clear')" hidden="hidden" type="checkbox" id="Radio3" runat="server" />

                                                                            <label for="Radio3"><icon:XSquare runat="server" ID="XSquare5" /></label>
                                                                    </div>
                                                                    <asp:CustomValidator ID="CustomValidator9" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="transfer_hospital_ServerValidate"></asp:CustomValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div runat="server" id="transfer_hos_field">
                                                            <div class="dg-1 mb-2">
                                                                <div><label class="control-label mb-1">Lý do chuyển viện/ <span class="text-primary">Reason for transfer:</span></label></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_reason_for_transfer"></asp:Label>
                                                                    <div class="form-group" runat="server" id="reason_for_transfer_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_reason_for_transfer" />
                                                                        <asp:CustomValidator ID="CustomValidator29" ValidationGroup="" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="reason_for_transfer_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <div><span>Cơ sở y tế tiếp nhận/ <i class="text-primary">Admission medical facility:</i></span></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_transfer_hospital_name"></asp:Label>
                                                                    <div class="form-group" runat="server" id="transfer_hospital_name_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_transfer_hospital_name" />
                                                                        <asp:CustomValidator ID="CustomValidator34" ValidationGroup="" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="transfer_hospital_name_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <div><span>Tên người nhận/ <i class="text-primary">Admission person:</i></span></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_transfer_hospital_employee"></asp:Label>
                                                                    <div class="form-group" runat="server" id="transfer_hospital_employee_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_transfer_hospital_employee" />
                                                                        <asp:CustomValidator ID="CustomValidator35" ValidationGroup="" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="transfer_hospital_employee_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <div><span>Số ĐT liên lạc/ <i class="text-primary">Contact number:</i></span></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_transfer_hospital_phone"></asp:Label>
                                                                    <div class="form-group" runat="server" id="transfer_hospital_phone_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_transfer_hospital_phone" />
                                                                        <asp:CustomValidator ID="CustomValidator36" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="transfer_hospital_phone_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <div><label class="control-label mb-1">Tình trạng trước khi chuyển viện/ <span class="text-primary">Status before transfer:</span></label></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_status_before_transfer"></asp:Label>
                                                                    <div class="form-group" runat="server" id="status_before_transfer_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_status_before_transfer" />
                                                                        <asp:CustomValidator ID="CustomValidator30" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="status_before_transfer_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg-1 mb-2">
                                                                <div><label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label></div>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_time_of_leaving_emer_a"></asp:Label>
                                                                    <div runat="server" id="time_of_leaving_emer_a_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_of_leaving_emer_a" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm" />
                                                                        <asp:CustomValidator ID="CustomValidator37" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="dtpk_time_of_leaving_emer_a_ServerValidate"></asp:CustomValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div><label class="control-label mb-1"><span class="font-bold">Tình trạng của bệnh nhân khi xuất viện</span>/ <span class="text-primary">Patient's Condition at Discharge:</span></label></div>
                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_patient_discharge"></asp:Label>
                                                    <div runat="server" id="patient_discharge_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" runat="server" id="cb_patient_discharge_IMP" class="custom-control-input" />
                                                            <span class="custom-control-label">Có cải thiện/ <span class="text-primary">Improved</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" runat="server" id="cb_patient_discharge_UNC" class="custom-control-input" />
                                                            <span class="custom-control-label">Không thay đổi/ <span class="text-primary">Unchanged</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" runat="server" id="cb_patient_discharge_UNS" class="custom-control-input" />
                                                            <span class="custom-control-label">Không ổn định/ <span class="text-primary">Unstable</span></span>
                                                        </label>
                                                        <asp:CustomValidator ID="CustomValidator10" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="patient_discharge_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg-1 mb-2">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_txt_patient_discharge"></asp:Label>
                                                    <div class="form-group " runat="server" id="txt_patient_discharge_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_patient_discharge" />
                                                        <asp:CustomValidator ID="CustomValidator31" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="patient_discharge_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg-1 mb-2">
                                                <div><label class="control-label mb-1"><span class="font-bold">Mã ICD-10</span>/ <span class="text-primary">ICD-10 Code(S):</span></label></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_icd_10"></asp:Label>
                                                    <div class="form-group " runat="server" id="icd_10_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_icd_10" />
                                                        <asp:CustomValidator ID="CustomValidator32" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="icd_10_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <%-- Update 08/10/2022 --%>
                                                    <div class="form-actions" style="display: flex; gap: 6px">
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                                                            <ContentTemplate>
                                                                <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="CompleteDocument" ID="btnComplete" CssClass="btn btn-primary">Complete</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="SaveDocument" ID="btnSave" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                                                        <asp:UpdatePanel runat="server" ID="uplPrintDocument">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" OnClick="DeleteDocument" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <asp:LinkButton runat="server" OnClick="AmendDocument" ID="btnAmend" CssClass="btn btn-secondary">Amend</asp:LinkButton>
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" OnClick="PrintDocument" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <asp:LinkButton runat="server" OnClick="CancelAmendDocument" ID="btnCancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/checkValidFields.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    
    <script type="text/javascript">
        function print_document() {
            //var print_header = document.getElementById("print_header");
            //var height = print_header.style.height.substring(0, print_header.style.height.length - 2);
            //console.log(height);
            //var newHeight = parseFloat(height);

            //console.log(newHeight);

            //print_header.style.height = newHeight + "px";

            //console.log(print_header.style.height);

            let print_page = document.querySelector("#print_page");
            print_page.style.display = "block";
            setTimeout(() => { print_page.style.display = "none"; }, 100);
            window.print();
        }
        function show_window(rwndID) {
            var oWnd = $find(rwndID);
            oWnd.show();
        }
        <%--function select_print_language() {
            var oWnd = $find("<%=rwndPrint.ClientID %>");
            oWnd.show();
        }--%>
    </script>

    <script>

        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter();

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }
        function btnPrint_Click() {
            //let printContent = document.querySelector("#printContent");
            //printContent.setAttribute("style", "display: block");

            //let page_height = 1000;
            //let total = Math.ceil(printContent.offsetHeight / page_height);

            //total = 1;

            //height: 1055px; width: 755px;
            //printContent = document.getElementById("print_content");

            //let height_ex = printContent.offsetHeight;
            //height_ex += (155 * 5);

            //var totalPages = Math.ceil(height_ex / 1123);  //842px A4 pageheight for 72dpi, 1123px A4 pageheight for 96dpi, 
            //console.log(totalPages);

            //for (let i = 1; i <= totalPages; i++) {
            //    let pageNumberDiv = document.createElement("div");
            //    pageNumberDiv.setAttribute("class", "watermark page");
            //    pageNumberDiv.setAttribute("style", "border: 1px solid #000; top: calc((" + i + " * (297mm - 0.5px)) - 55px); height: 16px; position: absolute; left: 0;"); /*left: calc(100 % - (" + pageNumberDiv.offsetWidth + "px + 20px*/
            //    pageNumberDiv.setAttribute("data-page", "Page " + i + " of " + totalPages);
            //    document.getElementById("print_content").append(pageNumberDiv);

            //}

            //for (var i = 1; i <= totalPages; i++) {
            //    var pageNumberDiv = document.createElement("div");
            //    var pageNumber = document.createTextNode("Page " + i + " of " + totalPages);
            //    pageNumberDiv.style.position = "absolute";
            //    pageNumberDiv.style.top = "calc((" + i + " * (297mm - 0.5px)) - 40px)"; //297mm A4 pageheight; 0,5px unknown needed necessary correction value; additional wanted 40px margin from bottom(own element height included)
            //    pageNumberDiv.style.height = "16px";
            //    pageNumberDiv.appendChild(pageNumber);
            //    document.getElementById("print_content").append(pageNumberDiv);
            //    //document.body.insertBefore(pageNumberDiv, document.getElementById("printContent"));
            //    pageNumberDiv.style.left = "calc(100% - (" + pageNumberDiv.offsetWidth + "px + 20px))";
            //}

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
            window.print();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter();
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                    document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }
    </script>

</body>

</html>

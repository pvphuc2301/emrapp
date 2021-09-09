<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerTriaAndNurAssRec.aspx.cs" Inherits="EMR.EmergencyTriageAndNursingAssessmentRecord" ValidateRequest="false" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/icons/Pencil.ascx" TagPrefix="icon" TagName="Pencil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print.css" rel="stylesheet" />
    <style>
         @media print {
            * {
                font-family: "Times New Roman", Times, serif;
            }
         }
         .border{ border-color: #000 !important; }

         .header-info-title h4 {
            color: #007297;
            font-size: 14.6667px;
            font-weight: bold;
            margin-bottom: 0;
        }

        .header-info-title h5 {
            color: #e20e5a;
            font-size: 14.6667px;
            font-weight: bold;
            margin-bottom: 0;
        }
/*
        .border{ border-color: #000 !important; }

        #canvas {
            border: 2px solid #000; 
        }

        @page {
            margin-top: 13px;
            margin-bottom: 13px;
            margin-left: 28px;
            margin-right: 28px;
        }

        .RadGrid_Bootstrap .rgRow > td, .RadGrid_Bootstrap .rgAltRow > td, .RadGrid_Bootstrap .rgEditRow > td, .RadGrid_Bootstrap .rgFooter > td, .RadGrid_Bootstrap .rgFilterRow > td, .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap .rgResizeCol, .RadGrid_Bootstrap .rgGroupHeader td {
            padding: 4px !important;
        }

        .header-info-title {
            
        }

        .header-info-title h4 {
            color: #007297;
            font-size: 14.6667px;
            font-weight: bold;
            margin-bottom: 0;
        }

        .header-info-title h5 {
            color: #e20e5a;
            font-size: 14.6667px;
            font-weight: bold;
            margin-bottom: 0;
        }

        table { page-break-after:auto }
        tr    { page-break-inside:avoid; page-break-after:auto }
        td    { page-break-inside:avoid; page-break-after:auto }
        thead { display:table-header-group }
        tfoot { display:table-footer-group }

        .report-footer-space {
            height: 45px;
        }

        .page:after {
            content: attr(data-page);
            position: absolute;
            bottom: 1px;
            left: 0;
            right: 0;
            text-align: center;
        }*/

    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="printContent">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info1" style="display: flex; align-items: center; height: 75px;">
                                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div style="flex-grow: 1"></div>
                                        <div class="header-info-title">
                                            <div class="border text-center p-1 mb-1">
                                                <h4>PHÂN LOẠI CẤP CỨU & ĐÁNH GIÁ ĐIỀU DƯỠNG</h4>
                                                <h5>EMERGENCY TRIAGE AND NURSING ASSESSMENT RECORD</h5>
                                            </div>
                                            MÃ SỐ NGƯỜI BỆNH/ <span class="text-primary">PID:</span>&nbsp;<asp:Label runat="server" ID="prt_vpid" CssClass=" font-bold"/>
                                        </div>
                                        <div style="display: none;">
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                        </div>
                                    </div>
                                    <div style="height: 25px">
                                        <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                                        <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                                    </div>
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div style="position: relative" class="main" runat="server" id="print_content">
                                        <img style="height: 1px" src="../images/logo-opacity.png" />

                                        <div class="border p-1 mb-1">
                                            <asp:Label runat="server" ID="prtdate"></asp:Label>
                                        </div>

                                        <div class="border p-1 mb-1">
                                            <div class="d-grid" style="grid-template-columns: 1fr auto; grid-gap: 5px;">
                                                <div>
                                                    <b>Họ tên</b>/<span class="text-primary"><i>Patient Name</i></span>:&nbsp;<asp:Label runat="server" ID="prt_fullname"/>
                                                </div>
                                                <div>
                                                    <b>Ngày sinh</b>/<span class="text-primary"><i>DOB</i></span>:&nbsp;<asp:Label runat="server" ID="prt_dob"/>&nbsp;
                                                    <b>Quốc tịch</b>/<span class="text-primary"><i>Nationality</i></span>:&nbsp;<asp:Label runat="server" ID="prt_nationality"/>
                                                </div>
                                            </div>

                                            <div>
                                                <b>Chỗ ở hiện tại</b>/<span class="text-primary"><i>Home Address</i></span>:&nbsp;<asp:Label runat="server" ID="prt_address"/>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: 1fr auto; grid-gap: 5px;">
                                                <div>
                                                    <b>Người liên lạc</b>/<span class="text-primary"><i>Contact</i></span>:&nbsp;<asp:Label runat="server" ID="prt_contact"/>
                                                </div>
                                                <div>
                                                    <b>Quan hệ</b>/<span class="text-primary"><i>Relationship</i></span>:&nbsp;<asp:Label runat="server" ID="prt_relationship"/>&nbsp;
                                                    <b>Số điện thoại</b>/<span class="text-primary"><i>Telephone</i></span>:&nbsp;<asp:Label runat="server" ID="prt_telephone"/>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="border p-1 mb-1">
                                            <b>Than phiền chính</b>/ <span class="text-primary"><i>Chieft complaint</i></span>: <asp:Label runat="server" ID="prt_chieft_complaint"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 1fr 1fr 1fr auto 1fr">
                                            <div class="border p-1 border-right-0 text-center">
                                                <asp:Label runat="server" Font-Size="20" Style="line-height: 20px" ID="prt_chieft_complaint_code1" Text="❏"/><br />
                                                <b>1-Hồi sức</b><br />
                                                <span class="text-primary"><i>Resuscitation</i></span>
                                            </div>
                                            <div class="border p-1 border-right-0 text-center">
                                                <asp:Label runat="server" Font-Size="20" Style="line-height: 20px" ID="prt_chieft_complaint_code2" Text="❏"/><br />
                                                <b>2-Cấp cứu</b><br />
                                                <span class="text-primary"><i>Emergency</i></span>
                                            </div>
                                            <div class="border p-1 border-right-0 text-center">
                                                <asp:Label runat="server" Font-Size="20" Style="line-height: 20px" ID="prt_chieft_complaint_code3" Text="❏"/><br />
                                                <b>3-Khẩn trương</b><br />
                                                <span class="text-primary"><i>Urgent</i></span>
                                            </div>
                                            <div class="border p-1 border-right-0 pl-2 pr-2 text-center">
                                                <asp:Label runat="server" Font-Size="20" Style="line-height: 20px" ID="prt_chieft_complaint_code4" Text="❏"/><br />
                                                <b>4-Trì hoãn</b><br />
                                                <span class="text-primary"><i>Less urgent</i></span>
                                            </div>
                                            <div class="border p-1 text-center">
                                                <asp:Label runat="server" Font-Size="20" Style="line-height: 20px" ID="prt_chieft_complaint_code5" Text="❏"/><br />
                                                <b>5-Không cấp cứu</b><br />
                                                <span class="text-primary"><i>Non urgent</i></span>
                                            </div>
                                        </div>

                                        <div class="border p-1 mb-1" style="display: grid; grid-template-columns: 200px auto;">
                                            <div>
                                                <b>Đến khoa bằng</b>/ <span class="text-primary"><i>Mode of arrival</i></span>
                                            </div>
                                            <asp:Label runat="server" ID="prt_mode_of_arrival"></asp:Label>
                                        </div>

                                        <div class="border p-1 mb-1">
                                            <asp:Label runat="server" ID="prt_past_medical_history"></asp:Label>
                                        </div>

                                        <div class="border p-1 mb-1">
                                            <%--<asp:Label runat="server" ID="prt_vital_signs"></asp:Label>--%>
                                            <div>
                                                <b>Dấu sinh hiệu</b>/ <span class='text-primary'><i>Vital signs</i></span>:&nbsp;&nbsp;&nbsp;<b>Huyết áp</b>/ <span class='text-primary'><i>BP</i></span>: <asp:Label runat="server" ID="prt_vs_blood_pressure" /><b>&nbsp;mmHg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mạch</b>/ <span class='text-primary'><i>Pulse</i></span>: <asp:Label runat="server" ID="prt_vs_heart_rate" /> <b>lần/phút/bpm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nhiệt độ</b>/ <span class='text-primary'><i>Temp</i></span>: <asp:Label runat="server" ID="prt_vs_temperature" /> <b>°C <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Gồm trẻ em</b>/<span class='text-primary'><i>Including child aged</i></span> <b>&gt;= 3 tuổi</b>/<span class='text-primary'><i>years old</i></span>) <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nhịp thở</b>/<span class='text-primary'><i>Resp</i></span>: <asp:Label runat="server" ID="prt_vs_resp" /> <b>lần/phút</b>/min. <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Độ bão hòa oxy</b>/<span class='text-primary'><i>O2Sat</i></span>: <asp:Label runat="server" ID="prt_vs_spo2" /> <b>%</b>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 1fr auto auto auto auto">
                                                <div>
                                                    <b>Tri giác</b>/<span class="text-primary"><i>LOC-AVPU</i></span>
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_loc_avpu_a" Text="❏"/>&nbsp;<b>Tỉnh</b>/<span class="text-primary"><i>A-Alert</i></span>&nbsp;
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_loc_avpu_v" Text="❏"/>&nbsp;<b>Đáp ứng Lời nói</b>/<span class="text-primary"><i>V-Verbal</i></span>&nbsp;
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_loc_avpu_p" Text="❏"/>&nbsp;<b>Đáp ứng Đau</b>/<span class="text-primary"><i>P-Painful</i></span>&nbsp;
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_loc_avpu_u" Text="❏"/>&nbsp;<b>Không đáp ứng</b>/<span class="text-primary"><i>U-Unresponsive</i></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="border p-1 mb-1">
                                            <b>Đánh giá đau</b>/ <span class='text-primary'><i>Pain assess</i></span>. Khởi phát/ <span class='text-primary'><i>Onset</i></span>&nbsp;<asp:Label runat="server" ID="prt_pain_onset"/> Vị trí/ <span class='text-primary'><i>Location</i></span>&nbsp;<asp:Label runat="server" ID="prt_pain_location"/> Kéo dài/<span class='text-primary'><i>Duration</i></span>&nbsp;<asp:Label runat="server" ID="prt_pain_duration"/> Hướng lan/<span class='text-primary'><i>Radiation</i></span>&nbsp;<asp:Label runat="server" ID="prt_pain_radiation"/>
                                            <%--<asp:Label runat="server" ID="prt_pain_assess"></asp:Label>--%>
                                            <div style="display: flex; justify-content: flex-end;">
                                                <img src="../images/PaintAssess.png" width="300"/>
                                                <div style="align-self: flex-end">
                                                    <b>Điểm đau</b>/ <span class='text-primary'><i>Pain scale</i>:</span>&nbsp;<asp:Label runat="server" ID="prt_pain_scale"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mb-1" style="display: grid; grid-template-columns: 1fr 1fr">
                                            <div class="border border-right-0 p-1">
                                                <b>Cân nặng</b>/ <span class='text-primary'><i>Weight</i></span>:&nbsp;<asp:Label runat="server" ID="prt_vs_weight"/>&nbsp;<b>kg</b>
                                                <b>Chiều cao</b>/ <span class='text-primary'><i>Height</i></span>:&nbsp;<asp:Label runat="server" ID="prt_vs_height"/>&nbsp;<b>cm</b>
                                                <br />
                                                <b>Vòng đầu</b>/ <span class='text-primary'><i>Head circumsference</i></span>:&nbsp;<asp:Label runat="server" ID="prt_vs_head_circum"/>&nbsp;<b>cm</b>
                                            </div>
                                            <div class="border p-1">
                                                <asp:Label runat="server" ID="prt_allergy"/>
                                            </div>
                                        </div>

                                        <div class="border p-1 mb-1">
                                            <asp:Label runat="server" ID="prt_medications_used"/>
                                        </div>

                                        <div class="mb-1" style="display: grid; grid-template-columns: 300px 1fr 1fr; page-break-inside:avoid; page-break-after:auto">
                                            <div class="border border-right-0 p-1">
                                                <div style="overflow: hidden;">
                                                    <img src="#" style="margin-top: -27px; margin-bottom: -20px;" runat="server" width="300" id="imageTemp" alt="Alternate Text" />
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_skin_integrity_l" Text="❏"/>&nbsp;Rách da/ <span class="text-primary"><i>Laceration (L)</i></span><br />
                                                    <asp:Label runat="server" ID="prt_skin_integrity_a" Text="❏"/>&nbsp;Trầy xước/ <span class="text-primary"><i>Abrasion (A)</i></span><br />
                                                    <asp:Label runat="server" ID="prt_skin_integrity_s" Text="❏"/>&nbsp;Bong gân/ Căng cơ/ <span class="text-primary"><i>Sprain/ Strain (S)</i></span><br />
                                                    <asp:Label runat="server" ID="prt_skin_integrity_b" Text="❏"/>&nbsp;Bỏng/ <span class="text-primary"><i>Burn (B)</i></span><br />
                                                    <asp:Label runat="server" ID="prt_skin_integrity_d" Text="❏"/>&nbsp;Biến dạng/ <span class="text-primary"><i>Deformity (D)</i></span>
                                                    <asp:Label runat="server" ID="prt_skin_integrity_h" Text="❏"/>&nbsp;Loét/ <span class="text-primary"><i>Ulceration (U)</i></span>
                                                </div>
                                            </div>

                                            <div class="border border-right-0 p-1">
                                                <div class="font-bold text-center">TẦM SOÁT BỆNH LÂY NHIỄM</div>
                                                <div class="font-bold text-primary text-center"><i>Communicable disease screening</i></div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_com_dis_src_c" Text="❏"/>&nbsp;Ho/ <span class="text-primary"><i>Cough</i></span><br />
                                                    <asp:Label runat="server" ID="prt_com_dis_src_f" Text="❏"/>&nbsp;Sốt/ <span class="text-primary"><i>Fever</i>:</span><br />
                                                    <asp:Label runat="server" ID="prt_com_dis_src_r" Text="❏"/>&nbsp;Nổi mẩn/ <span class="text-primary"><i>Rash</i></span><br />
                                                    <asp:Label runat="server" ID="prt_com_dis_src_s" Text="❏"/>&nbsp;Đau họng/ <span class="text-primary"><i>Sore throat</i></span><br />
                                                    <asp:Label runat="server" ID="prt_com_dis_src_t" Text="❏"/>&nbsp;Đi khỏi Việt Nam trong vòng 15 ngày gần đây/ <span class="text-primary"><i>Travel outside Vietnam in past 15 days</i></span>
                                                </div>
                                            </div>

                                            <div class="border p-1">
                                                <div class="font-bold text-center">Kế hoạch xuất viện</div>
                                                <div class="font-bold text-center text-primary"><i>Discharge Planning</i></i></div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_discharge_plan_la" Text="❏"/>&nbsp;Sống một mình/ <span class="text-primary"><i>Live alone</i></span><br />
                                                    <asp:Label runat="server" ID="prt_discharge_plan_ra" Text="❏"/>&nbsp;Cần trợ  giúp sinh hoạt hàng ngày/ <span class="text-primary"><i>Require assistance with daily living</i></span><br />
                                                    <asp:Label runat="server" ID="prt_discharge_plan_hf" Text="❏"/>&nbsp;Nguy cơ ngã cao/ <span class="text-primary"><i>High falling risk</i></span><br />
                                                </div>
                                                <div class="ml-2">
                                                    <asp:Label runat="server" ID="prt_dis_after_discharge_code_h" Text="❏"/>&nbsp;Nhà riêng/ <span class="text-primary"><i>Private home</i></span><br />
                                                    <asp:Label runat="server" ID="prt_dis_after_discharge_code_o" Text="❏"/>&nbsp;Cơ sở y tế khác/ <span class="text-primary"><i>Other healthcare facility</i></span><br />
                                                </div>
                                                <asp:Label runat="server" ID="prt_caregiver_after_discharge"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="border p-1 mb-1" style="page-break-inside:avoid; page-break-after:auto">
                                            <div class="font-bold">TRỞ NGẠI TRONG CHĂM SÓC/ <span class="text-primary"><i>BARRIER TO CARE</i></span></div>
                                            <table>
                                                <tr>
                                                    <td>1. Trở ngại về ngôn ngữ/ <span class="text-primary"><i>Barriers</i></span>:</td>
                                                    <td><asp:Label runat="server" ID="prt_btc_language"/></td>
                                                    <td><asp:Label runat="server" ID="prt_btc_language_note"/></td>
                                                </tr>
                                                <tr>
                                                    <td>2. Trở ngại về nhận thức/ <span class="text-primary"><i>Cognitive Barriers</i></span>:</td>
                                                    <td><asp:Label runat="server" ID="prt_btc_cognitive"/></td>
                                                    <td><asp:Label runat="server" ID="prt_btc_cognitive_note"/></td>
                                                </tr>
                                                <tr>
                                                    <td>3. Trở ngại về Giác quan/ <span class="text-primary"><i>Sensory Barriers</i></span>:</td>
                                                    <td><asp:Label runat="server" ID="prt_btc_sensory"/></td>
                                                    <td><asp:Label runat="server" ID="prt_btc_sensory_note"/></td>
                                                </tr>
                                                <tr>
                                                    <td>4. Trở ngại về Tôn giáo/ <span class="text-primary"><i>Religious Barriers</i></span>:</td>
                                                    <td><asp:Label runat="server" ID="prt_btc_religious"/></td>
                                                    <td><asp:Label runat="server" ID="prt_btc_religious_note"/></td>
                                                </tr>
                                                <tr>
                                                    <td>5. Trở ngại về Văn hóa/ <span class="text-primary"><i>Cultural Barriers</i></span>:</td>
                                                    <td><asp:Label runat="server" ID="prt_btc_cultural"/></td>
                                                    <td><asp:Label runat="server" ID="prt_btc_cultural_note"/></td>
                                                </tr>
                                            </table>
                                        </div>
                                        
                                        <div class="border p-1 mb-1">
                                            <div class="font-bold">ĐÁNH GIÁ THỂ CHẤT CÁC CƠ QUAN/ <span class="text-primary"><i>ASSESSMENT BY SYSTEM</i></span></div>
                                            <div style="display: grid; grid-template-columns: 1fr 1fr">
                                                <div>
                                                    Số phòng/ <span class="text-primary"><i>Room number</i></span>:<asp:Label runat="server" ID="prt_room_number"></asp:Label>
                                                </div>
                                                <div>
                                                    Thời điểm đánh giá/ <span class="text-primary"><i>Time of assessment</i></span>:<asp:Label runat="server" ID="prt_time_of_assess"></asp:Label>
                                                </div>
                                            </div>

                                            <div style="display: grid; grid-template-columns: auto 1fr">
                                                <div>
                                                    <b>Tổng trạng chung</b>/ <span class="text-primary"><i>General appearance</i></span>:
                                                </div>
                                                <div>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_general_appearance_p" Text="❏"/>&nbsp;Hồng hào/ <span class="text-primary"><i>Pink</i></span>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_general_appearance_c" Text="❏"/>&nbsp;Tím/ <span class="text-primary"><i>Cyanosis</i></span>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_general_appearance_t" Text="❏"/>&nbsp;Tái/ <span class="text-primary"><i>Pallor</i></span>
                                                </div>
                                            </div>

                                            <div>
                                                <b>Thần kinh</b>/ <i class='text-primary'>Neuro</i>: GCS: Mắt/<i class='text-primary'>E</i>&nbsp;<asp:Label runat="server" ID="prt_eye"/>&nbsp; Lời nói/<i class='text-primary'>V</i>&nbsp;<asp:Label runat="server" ID="prt_voice"/>&nbsp; Vận động/<i class='text-primary'>M</i>&nbsp;<asp:Label runat="server" ID="prt_motion"/>&nbsp;
                                            </div>

                                            <div style="margin-left: 120px;">
                                                <asp:Label CssClass="mr-1" runat="server" ID="prt_alert"/>Tỉnh táo/ <i class="text-primary">Alert</i>
                                                <asp:Label CssClass="ml-2 mr-1" runat="server" ID="prt_coma"/>Hôn mê/ <i class="text-primary">Coma</i><br />
                                                <asp:Label CssClass="mr-1" runat="server" ID="prt_other" />
                                            </div>

                                            <div style="display: grid; grid-template-columns: 120px auto">
                                                <label><b>Hô hấp</b>/ <i class="text-primary">Respiratory</i></label>
                                                <div>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_reg" Text="❏"/>&nbsp;Thở đều/ <i class="text-primary">Regular</i>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_nre" Text="❏"/>&nbsp;Thở không đều/ <i class="text-primary">Regular</i>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_tac" Text="❏"/>&nbsp;Thở nhanh/<i class="text-primary">Tachypneic</i>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_sha" Text="❏"/>&nbsp;Thở nông/<i class="text-primary">Shallow</i><br />
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_lab" Text="❏"/>&nbsp;Thở gắng sức/<i class="text-primary">Labored</i>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_ret" Text="❏"/>&nbsp;Co kéo/<i class="text-primary">Retractions</i>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_cou" Text="❏"/>&nbsp;Ho/<i class="text-primary">Cough</i>
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_spu" Text="❏"/>&nbsp;Có đàm/<i class="text-primary">Sputum</i><br />
                                                    <asp:Label CssClass="ml-1" runat="server" ID="prt_respiratory_oth" Text="❏"/>&nbsp;Khác/<i class="text-primary">Others:</i>
                                                </div>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: 170px 1fr">
                                                <div><b>Tim mạch</b>/ <i class="text-primary">Cardiovascular</i>:</div>
                                                <div>
                                                    <div>
                                                        Nhịp tim/<i class="text-primary">Rhythm</i>
                                                <asp:Label runat="server" ID="prt_rhythm_regular"/>&nbsp;Đều/ <i class="text-primary">Regular</i>
                                                <asp:Label runat="server" ID="prt_rhythm_inregular"/>&nbsp;Không đều/ <i class="text-primary">Irregular</i>
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="prt_rhythm_others"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: 125px 1fr">
                                                <div>
                                                    <b>Tâm lý</b>/ <i class="text-primary">Psychosocial</i>:
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_psychosocial"/>&nbsp;Bình thường/ <i class="text-primary">Normal</i>
                                                    <br />
                                                    <asp:Label runat="server" ID="prt_psychosocial_others" />&nbsp;Khác/ <i class="text-primary">Others</i>: <asp:Label runat="server" ID="prt_psychosocial_str_others"/>
                                                </div>
                                            </div>

                                            <div>
                                                <b>Các cơ quan khác</b>/ <i class="text-primary">Other systems</i>:
                                            </div>

                                            <div style="margin-left: 110px">
                                                <asp:Label runat="server" ID="prt_other_systems_normal"/>&nbsp;Bình thường/ Normal
                                                <br />
                                                <asp:Label runat="server" ID="prt_other_systems_abnormal" />&nbsp;Bất thường/ <i class="text-primary">Abnormal</i>, Ghi rõ/ <i class="text-primary">Specify</i>: <asp:Label runat="server" ID="prt_others_systems_str"/>
                                            </div>

                                           <div class="d-grid" style="grid-template-columns: 60px 1fr">
                                               <label><b>Sản-phụ</b>:</label>
                                               <div>
                                                   <asp:Label runat="server" ID="prt_lmp" Text="❏"/>&nbsp;Kinh cuối/ <i class="text-primary">LMP&nbsp;</i><asp:Label runat="server" ID="prt_lmp_note"/>
                                                   <br />
                                                   Tiền sử thai nghén/ <i class="text-primary">Gravida/ PARA&nbsp;</i><asp:Label runat="server" ID="prt_para"/>&nbsp;Sẩy/<i class="text-primary">Abortions&nbsp;</i><asp:Label runat="server" ID="prt_abortions"/>
                                               </div>
                                           </div>
                                        </div>
                                        
                                        <div style="display: grid; grid-template-columns: 1fr 1fr; page-break-inside:avoid; page-break-after:auto">
                                            <div class="border border-right-0 p-1 mb-1">
                                                <div>
                                                    <b>Điều dưỡng thực hiện</b>/ <i class="text-primary">Registered Nurse:</i>
                                                    <%--<asp:Label runat="server" ID="Label9" Style="width: 80px"/>--%>
                                                </div>
                                                <div>
                                                    <b>Ký tên</b>/ <i class="text-primary">Signature</i>: <i style="margin-right: 100px"></i> <b>MSNV</b>/ <i class="text-primary">ID</i>
                                                </div>
                                            </div>
                                            <div class="border p-1 mb-1">
                                                <b>Giờ thông báo Bác sĩ</b>/ <i class="text-primary">Time notified to Doctor</i>:
                                                <asp:Label runat="server" ID="prt_noticed_time"></asp:Label>
                                            </div>
                                        </div>

                                        <table class="table-bordered mb-1">
                                            <tr>
                                                <td class="p-2 text-center" style="width: 180px"><b>Can thiệp</b><br /> <i class="text-primary">Procedure</i></td>
                                                <td class="p-2 text-center" style="width: 130px"><b>Thời gian</b><br /> <i class="text-primary">Time</i></td>
                                                <td class="p-2 text-center"  style="width: 311px"><b>Ghi chú</b><br /> <i class="text-primary">Notes</i></td>
                                                <td class="p-2 text-center" style="width: 100px"><b>Ký tên</b><br /><i class="text-primary">Signature</i></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2"><b>Đường huyết mao mạch</b><br /> <i class="text-primary">Capillary Blood glucose</i></td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_blood_glucose_date_time" />
                                                </td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_blood_glucose_note" />
                                                </td>
                                                <td class="p-2 text-right">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-2"><b>Điện tim</b>/<i class="text-primary">ECG</i>
                                                </td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_ecg_date_time" />
                                                </td>
                                                <td class="p-2">
                                                    Bác sĩ đọc kết quả/ <i class="text-primary">Reviewed by Dr.</i> <asp:Label runat="server" ID="prt_ecg_note" />
                                                </td>
                                                <td class="p-2 text-right">
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-2"><b>Thông tiểu</b>/<i class="text-primary">Urine catheter</i></td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_urine_cath_date_time" />
                                                </td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_urine_cath_note" />
                                                </td>
                                                <td class="p-2 text-right">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-2"><b>Nẹp / Bos bột / Thay băng</b><br />
                                                <i class="text-primary">Splint/Cast/Dressing</i></td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_splint_cast_dressing_date_time" />
                                                </td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_splint_cast_dressing_note" />
                                                </td>
                                                <td class="p-2 text-right">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-2"><b>Khác</b>/<i class="text-primary">Others</i></td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_procedure_other_date_time" />
                                                </td>
                                                <td class="p-2">
                                                    <asp:Label runat="server" ID="prt_procedure_other_note" />
                                                </td>
                                                <td class="p-2 text-right">
                                                </td>
                                            </tr>
                                        </table>
                                        
                                        <table style="width: 721px;" class="table-bordered mb-1" runat="server" id="prt_assessment_system">
                                            <tr>
                                                <td style="width: 40px" class="text-center"><i class="text-primary">Time</i></td>
                                                <td style="width: 40px" class="text-center"><i class="text-primary">RR <br /> l/p</i></td>
                                                <td style="width: 45px" class="text-center"><i class="text-primary">O2Sat %</i></td>
                                                <td style="width: 45px" class="text-center"><i class="text-primary">HR bpm</i></td>
                                                <td style="width: 45px" class="text-center"><i class="text-primary">BP mmHg</i></td>
                                                <td style="width: 45px" class="text-center"><i class="text-primary">Temp °C</i></td>
                                                <td style="width: 45px" class="text-center"><i class="text-primary">GCS</i></td>
                                                <td style="width: 45px" class="text-center"><i class="text-primary">Pain /10</i></td>
                                                <td style="width: 65px" class="text-center"><i class="text-primary">ATS scale</i></td>
                                                <td style="width: 206px" class="text-center"><i class="text-primary">Re-Assessment & Intervention</i></td>
                                                <td style="width: 100px" class="text-center"><i class="text-primary">RN's Initial</i></td>
                                            </tr>
                                        </table>

                                        <table style="width: 721px;" class="table-bordered mb-1" runat="server" id="prt_direct_medication">
                                            <tr>
                                                <td rowspan="2" style="width: 40px" class="text-center"><b>Giờ</b>/ <i class="text-primary">Time</i></td>
                                                <td class="text-center" colspan="4">
                                                    <b>Y lệnh thuốc & dịch truyền trực tiếp</b><br /><i class='text-primary'>Direct Medication & IV fluids Order</i>
                                                </td>
                                                <td rowspan="2" style="width: 70px" class="text-center"><b>BÁC SĨ</b><br />
                                                            <i class="text-primary">DOCTOR</i></td>
                                                <td rowspan="2" style="width: 70px" class="text-center"><b>GHI CHÚ</b><br />
                                                            <i class="text-primary">COMMENT</i></td>
                                                <td rowspan="2" style="width: 40px" class="text-center"><b>Giờ</b>/<br />
                                                            <i class="text-primary">Time</i></td>
                                                <td rowspan="2" style="width: 100px" class="text-center"><b>Chữ kí/ Tên <br /> & MSNV</b><br />
                                                            <i class="text-primary">Signature/ <br /> Name & ID</i></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 180px" class="text-center"><b>THUỐC</b>/<i class="text-primary">MEDICATION</span> <br />
                                                                <b>DỊCH TRUYỀN</b>/<i class="text-primary">IV FLUIDS</i></td>
                                                <td style="width: 70px" class="text-center"><b>LIỀU</b><br />
                                                            <i class="text-primary">DOSE</i></td>
                                                <td style="width: 75px" class="text-center"> <b>ĐƯỜNG DÙNG</b><br />
                                                            <i class="text-primary">ROUTE</i></td>
                                                <td style="width: 70px" class="text-center"><b>TỐC ĐỘ</b><br />
                                                            <i class="text-primary">RATE</i></td>
                                            </tr>
                                        </table>

                                        <div class="mb-1" style="height: 90px; display: grid; grid-template-columns: 1fr 1fr; page-break-inside:avoid; page-break-after:auto">
                                            <div class="border border-right-0 p-1">
                                                <div>
                                                    <div  class="d-inline-block">
                                                        <b>Xuất viện</b>/ <i class="text-primary">Discharged</i>
                                                        <asp:Label runat="server" ID="prt_discharge_date_time"></asp:Label>
                                                    </div>
                                                    <div  class="d-inline-block">
                                                        bởi BS/ <i class="text-primary">by Dr.</i>
                                                        <asp:Label runat="server" ID="prt_discharge_by"></asp:Label>
                                                    </div>
                                                </div>
                                                
                                                <div>
                                                    <asp:Label runat="server" ID="prt_discharge_option_h" Text="❏"/>&nbsp;Về nhà/ <i class="text-primary">Home</i><br />
                                                    <asp:Label runat="server" ID="prt_discharge_option_a" Text="❏"/>&nbsp;Tự ý/ <i class="text-primary">Against Medical Advice/AMA</i><br />
                                                    <asp:Label runat="server" ID="prt_discharge_option_d" Text="❏"/>&nbsp;Tử vong/ <i class="text-primary">Dead</i><br />
                                                </div>
                                            </div>

                                            <div class="border p-1">
                                                <div>
                                                    <div class="d-inline-block">
                                                        <b>Nhập viện</b>/ <i class="text-primary">Admited</i>
                                                        <asp:Label runat="server" ID="prt_admited_date_time"></asp:Label>
                                                    </div>
                                                    <div class="d-inline-block">
                                                        bởi BS/ <i class="text-primary">by Dr.</i>
                                                        <asp:Label runat="server" ID="prt_admited_by"></asp:Label>
                                                    </div>
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_receiving_unit"></asp:Label>            
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_transfer_to"></asp:Label>            
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_transfer_by"></asp:Label>            
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <table style="width: 721px;" class="table-bordered mb-1" runat="server" id="prt_nursing_note">
                                            <tr>
                                                <td class="text-center" colspan="5">
                                                    <b>PHIẾU GHI CHÚ ĐIỀU DƯỠNG</b> <br />
                                                    <i class="text-primary">NURSING NOTES</i>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 50px" class="text-center"><b>NGÀY</b><br /> <i class="text-primary">DATE </i><br /> <b>dd/mm/yyyy</b></td>
                                                <td style="width: 40px" class="text-center"><b>GIỜ <br /> PHÚT <br /></b> <i class="text-primary">TIME</i> <br /> <b>hh/mm</b></td>
                                                <td style="width: 340px" class="text-center"><b>THEO DÕI DIỄN TIẾN </b><br /> <i class="text-primary">PATIENT CONDITION</i></td>
                                                <td style="width: 150px" class="text-center"><b>CAN THIỆP ĐIỀU DƯỠNG </b><br /> <i class="text-primary">NURSING INTERVENTION</i></td>
                                                <td style="width: 100px" class="text-center">KÝ/GHI TÊN ĐD <br /> <i class="text-primary">RN'S NAME & <br /> SIGNATURE</i></td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell">
                                    <img style="width: 100%" src="../images/ExcellentCare.png" />
                                    <div class="footer-info">
                                        <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                        <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                                        <div>Tel: 028 3910 9999</div>
                                        <div>www.aih.com.vn</div>
                                    </div>
                                </td>
                                <td class="report-footer-space"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="520" MaxHeight="400">
                    <Windows>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Version History" runat="server">
                            <ContentTemplate>
                                <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                        <Columns>
                                            <telerik:GridTemplateColumn>
                                                <ItemTemplate>
                                                    <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'>
        </telerik:RadLabel>
                                                    <asp:HyperLink CssClass="btn-link" Text="View Log" runat="server" NavigateUrl='<%# GetLogUrl(Eval("document_log_id")) %>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <SelectedItemStyle CssClass="SelectedStyle" />
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                </telerik:RadGrid>

                            </ContentTemplate>
                        </telerik:RadWindow>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow2" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4 mb-4">Delete document?</h4>
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow3" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4">Denied!</h4>
                                    <label runat="server" id="lblUserBlock" />
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
                    </Windows>
                </telerik:RadWindowManager>

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0; border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Emergency Triage And Nursing Assessment Record</li>
                    </ul>
                    <div id="print_content1" style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                        <asp:HiddenField runat="server" ID="DataObj" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <div class="card" runat="server" id="amendReasonWraper">
                                <div class="card-body">
                                    <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                        <br />
                                        <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                                    <div class="form-group mb-2">

                                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <div class="row">
                            <div class="col-md-12 cssclsNoScreen">
                                <asp:Label runat="server" ID="lblPid"></asp:Label>
                            </div>
    <div class="col-lg-12" id="accordionExample">
        <div class="card">
            <div class="card-body collapse show" id="collapsePatientInfo" aria-labelledby="headingPatientInfo">
                <h5 class="box-title">Thông tin bệnh nhân/ Patient Detail</h5>
                <hr style="margin: 8px 0 12px 0;" />
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">First Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblFirstName" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <!--/span-->
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Last Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblLastName" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Gender:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblGender" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Date of Birth:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblDoB" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <!--/span-->
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Contact Person:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblContactPerson" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Relationship:</label>

                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblRelationship" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-lg-6 d-sm-flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Address:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblPatientAddress" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <!--/row-->
                <!-- Header: Patient Visit Info -->
                <h5 class="box-title">Thông tin lần khám/ Visit Detail <span class="text-danger">*</span></h5>
                <hr style="margin: 8px 0 12px 0;" />

                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Encounter:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblVisitCode" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Admit Date:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblVisitDate" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <!--/span-->
                </div>
            </div>
        </div>
    </div>
</div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Emergency Triage And Nursing Assessment Record</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="LinkViewLastestVersion" CssClass="btn-link" Text="View Latest Version" runat="server" />
                                                    </div>

                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1" />
                                                        <a class="btn-link" href="javascript:void(0)" onclick="showWindow('RadWindow1')">View History</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label mb-1">
                                                        <span class="text-primary">Triage Date Time <span class="text-danger">*</span></span>
                                                    </label>
                                                    <asp:Label runat="server" ID="lbl_triage_time"></asp:Label>
                                                    <div runat="server" id="triage_time_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_triage_time" Width="200px" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dtpk_triage_time" ErrorMessage="Triage Date Time is required"
                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Khu vực/ <span class="text-primary">Triage Area #:</span></label>
                                                    <asp:Label runat="server" ID="lbl_triage_area"></asp:Label>
                                                    <div runat="server" id="triage_area_wrapper">
                                                        <webUI:TextField TextMode="SingleLine" runat="server" ID="txt_triage_area" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Than phiền chính/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div runat="server" id="lbl_triage_code">
                                                        <asp:Label runat="server" ID="lbl_chief_complaint"  CssClass="d-block"></asp:Label>
                                                        <asp:Label runat="server" ID="lbl_triage_desc"></asp:Label>
                                                    </div>
                                                    <div runat="server" id="chief_complaint_wrapper">
                                                        <div class="mb-2">
                                                            <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                        </div>
                                                        <div >
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_triage_code_1" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_triage_code_1">1-Hồi sức/ <span class="text-primary">Resuscitation</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_triage_code_2" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_triage_code_2">2-Cấp cứu/ <span class="text-primary">Emergency</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_triage_code_3" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_triage_code_3">3-Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_triage_code_4" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_triage_code_4">4-Trì hoãn/ <span class="text-primary">Less Urgent</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_triage_code_5" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_triage_code_5">5-Không cấp cứu/ <span class="text-primary">Non-Urgent</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare1" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2" runat="server" id="arrival_mode_code_wrapper">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Đến khoa bằng/ <span class="text-primary">Mode of arrival:</span></label>
                                                    <asp:Label runat="server" ID="lbl_arrival_mode_desc"></asp:Label>
                                                    <div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_arrival_mode_code_WAL" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_arrival_mode_code_WAL">Tự đến/ <span class="text-primary">Walk-in</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_arrival_mode_code_WHE" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_arrival_mode_code_WHE">Xe lăn/ <span class="text-primary">Wheel chair</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_arrival_mode_code_AMB" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_arrival_mode_code_AMB">Xe cấp cứu/ <span class="text-primary">Ambulance</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" disabled-for="arrival_mode_note_field" id="rad_arrival_mode_code_OTH" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_arrival_mode_code_OTH">Khác/ <span class="text-primary">Other</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_arrival_mode_code_STR" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_arrival_mode_code_STR">Băng ca/ <span class="text-primary">Stretcher</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_arrival_mode_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare2" />
                                                            </a>
                                                        </div>
                                                        <div class="form-group arrival_mode_note_field" runat="server" id="arrival_mode_note_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_arrival_mode_note"  TextMode="SingleLine"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label mb-1">Tiền căn/ <span class="text-primary">Past Medical History:</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_past_medical_history"></asp:Label>
                                                    <div class="form-group" runat="server" id="past_medical_history_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_past_medical_history" TextMode="SingleLine" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                           <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label mb-1">Quá trình bệnh lý/ <span class="text-primary">Narrative:</span></label>
                                               <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_narrative"></asp:Label>
                                                    <div class="form-group" runat="server" id="narrative_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_narrative" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <label class="col-md-12 control-label h5 mb-2">DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS</span></label>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_temperature"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_temperature_wrapper">
                                                        <input tabindex="1" id="txt_vs_temperature" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_heart_rate_wrapper">
                                                        <input tabindex="5" id="txt_vs_heart_rate" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label  mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_weight"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_weight_wrapper">
                                                        <input tabindex="2" onchange="CalculateBmi()" id="txt_vs_weight" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_respiratory_rate_wrapper">
                                                        <input tabindex="6"  id="txt_vs_respiratory_rate" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_height"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_height_wrapper">
                                                        <input tabindex="3" id="txt_vs_height" onchange="CalculateBmi()"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_blood_pressure_wrapper">
                                                        <input tabindex="7"  id="txt_vs_blood_pressure" data-type="number1" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 ">
                                                    <div class="d-flex no-block">
                                                        <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <asp:Label runat="server" ID="lbl_vs_bmi"/>
                                                        <div class="form-group d-inline-block" runat="server" id="vs_bmi_wrapper">
                                                            <input  id="txt_vs_bmi" data-type="number1" style="width: 160px" runat="server" class="form-control text-right" disabled="disabled" />
                                                            <span class="append">(Kg/m <sup>2</sup>)</span>
                                                        </div>
                                                        <asp:Label runat="server" ID="bmiStr"></asp:Label>
                                                    </div>
                                                    <p class="mt-1">
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
        applicable for children and pregnant</span>)
                                                    </p>
                                                </div>
                                                <div class="col-sm-6 mb-2  d-flex no-block">
                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_spo2"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_spo2_wrapper">
                                                        <input tabindex="8" id="txt_vs_spo2"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 mb-2 d-flex no-block">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_head_circum"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_head_circum_wrapper">
                                                        <input tabindex="4" id="txt_vs_head_circum"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label mb-1">Tri giác/ <span class="text-primary">LOC - AVPU</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_loc_avpu"/>
                                                    <div runat="server" id="loc_avpu_wrapper">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_loc_avpu_a" />
                                                        <span class="custom-control-label">Tỉnh/ <span class="text-primary">A-Alert</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_loc_avpu_v" />
                                                        <span class="custom-control-label">Lời nói/ <span class="text-primary">V-Verbal</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_loc_avpu_p" />
                                                        <span class="custom-control-label">Đau/ <span class="text-primary">P-Pain</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_loc_avpu_u" />
                                                        <span class="custom-control-label">Không đáp ứng/ <span class="text-primary">U- Unresponsive</span></span>
                                                    </label>
                                                </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <label class="col-md-12 control-label mb-2 h5">Đánh giá đau/ <span class="text-primary">Pain assess:</span></label>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Điểm đau/ <span class="text-primary">Pain score:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pain_score"/>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="pain_score_wrapper">
                                                        <input runat="server" maxlength="2" class="form-control d-inline-block w-4" id="txt_pain_score" data-type="number" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Khởi phát/ <span class="text-primary">Onset:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pain_onset"/>
                                                    <div class="form-group d-inline-block" runat="server" id="pain_onset_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_pain_onset" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Vị trí/ <span class="text-primary">Location:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pain_location"/>
                                                    <div class="form-group d-inline-block" runat="server" id="pain_location_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_pain_location" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Kéo dài/ <span class="text-primary">Duration:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pain_duration"/>
                                                    <div class="form-group d-inline-block" runat="server" id="pain_duration_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_pain_duration" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Hướng lan/ <span class="text-primary">Radiation:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pain_radiation"/>
                                                    <div class="form-group d-inline-block" runat="server" id="pain_radiation_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_pain_radiation" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <img src="../images/PaintAssess.png" style="max-width: 298px; width: 100%;" alt="" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label for="pain-scale" class="col-md-12 control-label mb-1">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_allergy"/>
                                                    <div class="form-group" runat="server" id="allergy_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_allergy" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label mb-1">Thuốc đã dùng/ <span class="text-primary">Medications used:</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_current_medication"/>
                                                    <div class="form-group" runat="server" id="current_medication_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_current_medication" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <label class="col-md-12 d-block control-label h5">Đánh giá loét/ <span class="text-primary">Skin Integrity</span></label>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_skin_integrity"></asp:Label>
                                                <div>
                                                    <div class="form-group d-inline-block align-top" runat="server" id="skin_integrity_wrapper">
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_skin_integrity_l" />
                                                            <span class="custom-control-label">Rách da/ <span class="text-primary">Laceration (L)</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_skin_integrity_a" />
                                                            <span class="custom-control-label">Trầy xước/ <span class="text-primary">Abrasion (A)</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_skin_integrity_s" />
                                                            <span class="custom-control-label">Bong gân/Căng cơ/ <span class="text-primary">Sprain/Strain (S)</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_skin_integrity_b" />
                                                            <span class="custom-control-label">Bỏng/ <span class="text-primary">Burn (B)</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_skin_integrity_d" />
                                                            <span class="custom-control-label">Biến dạng/ <span class="text-primary">Deformity (D)</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_skin_integrity_h" />
                                                            <span class="custom-control-label">Loét/ <span class="text-primary">Ulceration (U)</span></span>
                                                        </label>
                                                    </div>

                                                    <div class="d-inline-block">
                                                        <%--<telerik:RadAjaxPanel runat="server">
                                                            <telerik:RadImageEditor OnImageLoading="RadImageEditor1_ImageLoading" OnImageChanged="RadImageEditor1_ImageChanged" EnableResize="false" RenderMode="Lightweight" ID="RadImageEditor1" runat="server" Width="513px" Height="565px">
                                                                <Tools>
                                                                    <telerik:ImageEditorToolGroup>
                                                                        <telerik:ImageEditorTool CommandName="Save"></telerik:ImageEditorTool>
                                                                        <telerik:ImageEditorToolStrip CommandName="Undo">
                                                                        </telerik:ImageEditorToolStrip>
                                                                        <telerik:ImageEditorToolStrip CommandName="Redo">
                                                                        </telerik:ImageEditorToolStrip>
                                                                        <telerik:ImageEditorTool CommandName="Pencil"></telerik:ImageEditorTool>
                                                                    </telerik:ImageEditorToolGroup>
                                                                </Tools>
                                                            </telerik:RadImageEditor>
                                                        </telerik:RadAjaxPanel>--%>
                                                        <img src="" id="image1" runat="server" class="cssclsNoScreen" />
                                                        <asp:HiddenField runat="server" ID="skin_anno_data_base64" />

                                                        <div style="width: 500px;">
                                                            <div id="controllers">
                                                                <span runat="server" class="controller btn btn-secondary" id="undo">undo</span>
                                                                <span runat="server" class="controller btn btn-secondary" id="redo">redo</span>
                                                                <div runat="server" id="pencilWrapper"  class=" btn btn-secondary">
                                                                    <svg id="pencil" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                    </svg>
                                                                </div>
                                                                <%--<span class="controller btn btn-secondary" id="note">note</span>--%>
                                                            </div>
                                                            <canvas id="canvas" runat="server"></canvas>
                                                            <%--<div>
                                                                <div style="display: flex; align-items: center;">
                                                                    2
                                                                    <webUI:TextField runat="server" ID="TextField1" />
                                                                    <div class="btn btn-outline-secondary ml-1">
                                                                        <icon:Trash runat="server" ID="Trash" />
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                                
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label mb-1">Tầm soát bệnh lây nhiễm/ <span class="text-primary">Communicable disease screening</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_com_dis_src"/>
                                                    <div runat="server" id="com_dis_src_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_f" />
                                                            <span class="custom-control-label">Sốt/ <span class="text-primary">Fever</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_c" />
                                                            <span class="custom-control-label">Ho/ <span class="text-primary">Cough</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_r" />
                                                            <span class="custom-control-label">Nổi mần/ <span class="text-primary">Rash</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_s" />
                                                            <span class="custom-control-label">Đau họng/ <span class="text-primary">Sore throat</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_t" />
                                                            <span class="custom-control-label">Đi khỏi Việt Nam trong vòng 15 ngày gần đây/ <span class="text-primary">Travel outside Vietnam in past 15 days</span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label mb-1">Kế hoạch xuất viện/ <span class="text-primary">Discharge Planning</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_discharge_plan"/>
                                                    <div runat="server" id="discharge_plan_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_discharge_plan_la" />
                                                            <span class="custom-control-label">Sống một mình/ <span class="text-primary">Lives alone</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_discharge_plan_ra" />
                                                            <span class="custom-control-label">Cần trợ giúp sinh hoạt hàng ngày/ <span class="text-primary">Requires assistance with activities of daily living</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_discharge_plan_hf" />
                                                            <span class="custom-control-label">Nguy cơ ngã cao/ <span class="text-primary">high fall risk</span> Nơi cư trú sau khi xuất viện <span class="text-primary">Place of residence after discharge</span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Nơi cư trú sau khi xuất viện/ <span class="text-primary">Disposition after discharge:</span></label>
                                                    <asp:Label runat="server" ID="lbl_dis_after_discharge_code"/>
                                                    <div runat="server" id="dis_after_discharge_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" runat="server" id="rad_dis_after_discharge_code_h" name="rad_dis_after_discharge_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_dis_after_discharge_code_h">Nhà riêng/ <span class="text-primary">Private home</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_dis_after_discharge_code_o" name="rad_dis_after_discharge_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_dis_after_discharge_code_o">Cơ sở y tế khác/ <span class="text-primary">Other healthcare facility:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_dis_after_discharge_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">Người chăm sóc sau khi xuất viện <span class="text-primary">People who will look after patient after discharge:</span></label>
                                                    <asp:Label runat="server" ID="lbl_caregiver_after_discharge"/>
                                                        <div runat="server" id="caregiver_after_discharge_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_caregiver_after_discharge" />
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <label class="col-md-12 control-label mb-2 h5">TRỞ NGẠI TRONG CHĂM SÓC/ <span class="text-primary">BARRIER TO CARE</span></label>
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">1. Trở ngại về ngôn ngữ/ <span class="text-primary">Language Barriers:</span></label>
                                                    <asp:Label runat="server" ID="lbl_btc_language"/>

                                                    <div runat="server" id="btc_language_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_btc_language_false" name="rad_btc_language" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_language_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input disabled-for="btc_language_note_field" type="radio" id="rad_btc_language_true" name="rad_btc_language" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_language_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_btc_language" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" />
                                                            </a>
                                                        </div>
                                                        <div class="form-group btc_language_note_field mb-2">
                                                            <webUI:TextField runat="server" ID="txt_btc_language_note" TextMode="SingleLine" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">2. Trở ngại về nhận thức/ <span class="text-primary">Cognitive Barriers:</span></label>
                                                    <asp:Label runat="server" ID="lbl_btc_cognitive"/>
                                                    <div runat="server" id="btc_cognitive_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_btc_cognitive_false" name="rad_btc_cognitive" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_cognitive_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio  d-inline-block mr-2">
                                                            <input disabled-for="btc_cognitive_field" type="radio" id="rad_btc_cognitive_true" name="rad_btc_cognitive" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_cognitive_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_btc_cognitive" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" />
                                                            </a>
                                                        </div>
                                                        <div class="form-group btc_cognitive_field mb-2">
                                                            <webUI:TextField runat="server" ID="txt_btc_cognitive_note" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">3. Trở ngại về Giác quan/ <span class="text-primary">Sensory Barriers:</span></label>

                                                    <asp:Label runat="server" ID="lbl_btc_sensory"/>
                                                    <div runat="server" id="btc_sensory_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_btc_sensory_false" name="rad_btc_sensory" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_sensory_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input disabled-for="btc_sensory_field" type="radio" id="rad_btc_sensory_true" name="rad_btc_sensory" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_sensory_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_btc_sensory" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" />
                                                            </a>
                                                        </div>
                                                        <div class="form-group btc_sensory_field mb-2">
                                                            <webUI:TextField runat="server" ID="txt_btc_sensory_note" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">4. Trở ngại về Tôn giáo/ <span class="text-primary">Religious Barriers:</span></label>
                                                    <asp:Label runat="server" ID="lbl_btc_religious"/>
                                                    <div runat="server" id="btc_religious_wrapper">

                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_btc_religious_false" name="rad_btc_religious" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_religious_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input disabled-for="btc_religious_field" type="radio" id="rad_btc_religious_true" name="rad_btc_religious" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_religious_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_btc_religious" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" />
                                                            </a>
                                                        </div>
                                                        <div class="form-group btc_religious_field mb-2">
                                                            <webUI:TextField runat="server" ID="txt_btc_religious_note" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">5. Trở ngại về Văn hóa/ <span class="text-primary">Cultural Barriers:</span></label>
                                                    <asp:Label runat="server" ID="lbl_btc_cultural"/>
                                                    <div runat="server" id="btc_cultural_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_btc_cultural_false" name="rad_btc_cultural" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_cultural_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input disabled-for="btc_cultural_field" type="radio" id="rad_btc_cultural_true" name="rad_btc_cultural" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_btc_cultural_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_btc_cultural" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" />
                                                            </a>
                                                        </div>
                                                        <div class="form-group btc_cultural_field mb-2">
                                                            <webUI:TextField runat="server" ID="txt_btc_cultural_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <label class="col-md-12 control-label mb-2 h5">ĐÁNH GIÁ THỂ CHẤT CÁC CƠ QUAN/ <span class="text-primary">ASSESSMENT BY SYSTEM:</span></label>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Tổng trạng chung/ <span class="text-primary">General appearance:</span></label>

                                                    <asp:Label runat="server" ID="lbl_general_appearance"/>
                                                    <div runat="server" id="general_appearance_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_general_appearance_p" />
                                                            <span class="custom-control-label">Hồng hào/ <span class="text-primary">Pink</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox  d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_general_appearance_c" />
                                                            <span class="custom-control-label">Tím/ <span class="text-primary">Cyanosis</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox  d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_general_appearance_t" />
                                                            <span class="custom-control-label">Tái/ <span class="text-primary">Pallor</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Thần kinh/ <span class="text-primary">Neuro:</span></label>
                                                    <div>
                                                        <label class="control-label mb-1 mr-2"><span class="text-primary">Glasgow coma scale/ GCS</span></label>
                                                        <div class="d-inline-block">
                                                            <label class="control-label mr-2">Mắt/ <span class="text-primary">E</span></label>
                                                            <asp:Label runat="server" ID="lbl_eye"/>
                                                            <div runat="server" id="eye_wrapper"  class="form-group w-4 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_eye" TextMode="SingleLine" />
                                                            </div>
                                                        </div>

                                                        <div class="d-inline-block">
                                                            <label class="control-label mr-2">Lời nói/ <span class="text-primary">V</span></label>
                                                            <asp:Label runat="server" ID="lbl_voice"/>
                                                            <div runat="server" id="voice_wrapper" class="form-group w-4 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_voice" TextMode="SingleLine" />
                                                            </div>
                                                        </div>

                                                        <div class="d-inline-block">
                                                            <label class="control-label mr-2">Vận động/ <span class="text-primary">M</span></label>
                                                            <asp:Label runat="server" ID="lbl_motion"/>
                                                            <div  runat="server" id="motion_wrapper" class="form-group w-4 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_motion" TextMode="SingleLine" />
                                                            </div>
                                                        </div>

                                                        <div class="mt-2">
                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_alert_true" />
                                                                <span class="custom-control-label">Tỉnh táo/ <span class="text-primary">Alert</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_coma_true" />
                                                                <span class="custom-control-label">Hôn mê/ <span class="text-primary">Coma</span></span>
                                                            </label>

                                                            <div class="d-inline-block">
                                                                <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                    <input disabled-for="str_others_field" type="checkbox" class="custom-control-input" id="cb_others_true" runat="server" />
                                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                                </label>
                                                                <asp:Label runat="server" ID="lbl_str_others"></asp:Label>
                                                                <div class="form-group str_others_field d-inline-block w-n" runat="server" id="str_others_wrapper">
                                                                    <webUI:TextField runat="server" ID="txt_str_others" TextMode="SingleLine"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Hô hấp/ <span class="text-primary">Respiratory:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_respiratory"></asp:Label>

                                                        <div class="mb-2" runat="server" id="respiratory_wrapper">
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_reg" />
                                                                <span class="custom-control-label">Thở đều/ <span class="text-primary">Regular</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox  d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_nre" />
                                                                <span class="custom-control-label">Thở không đều/ <span class="text-primary">Inregular</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox  d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_tac" />
                                                                <span class="custom-control-label">Thở nhanh/ <span class="text-primary">Tachypneic</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox  d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_sha" />
                                                                <span class="custom-control-label">Thở nông/ <span class="text-primary">Shallow</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox  d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_lab" />
                                                                <span class="custom-control-label">Thở gắng sức/ <span class="text-primary">Labored</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox  d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" id="cb_respiratory_ret" runat="server" />
                                                                <span class="custom-control-label">Co kéo/ <span class="text-primary">Retractions</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox  d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_cou" />
                                                                <span class="custom-control-label">Ho/ <span class="text-primary">Cough</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox  d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_spu" />
                                                                <span class="custom-control-label">Có đàm/ <span class="text-primary">Sputum</span></span>
                                                            </label>
                                                        </div>

                                                        <div class="d-inline-block" runat="server" id="respiratory_oth_field">
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input disabled-for="respiratory_oth_field" id="cb_respiratory_oth" type="checkbox" runat="server" class="custom-control-input" />
                                                                <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                            </label>

                                                            <div runat="server" id="txt_respiratory_oth_field" class="form-group respiratory_oth_field w-n d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_respiratory_oth" TextMode="SingleLine"/>
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_respiratory_oth"></asp:Label>
                                                        </div>
                                                    </div>
                                                    
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Tim mạch/ <span class="text-primary">Cardiovascular:</span></label>
                                                    <div>
                                                        <label class="control-label mr-2">Nhịp tim/ <span class="text-primary">Rhythm:</span></label>
                                                        <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_rhythm_regular_true" />
                                                            <span class="custom-control-label">Đều/ <span class="text-primary">Regular</span></span>
                                                        </label>
                                                        <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_rhythm_inregular_true" />
                                                            <span class="custom-control-label">Không đều/ <span class="text-primary">Inregular</span></span>
                                                        </label>
                                                        <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                            <input disabled-for="rhythm_field" type="checkbox" class="custom-control-input" runat="server" id="cb_rhythm_others_true" />
                                                            <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                        </label>
                                                        <asp:Label runat="server" ID="lbl_rhythm_str_others"></asp:Label>
                                                        <div class="form-group rhythm_field d-inline-block w-n" runat="server" id="rhythm_str_others_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_rhythm_str_others" TextMode="SingleLine"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Tâm lý/ <span class="text-primary">Psychosocial:</span></label>
                                                    <div>
                                                        <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_psychosocial_true" />
                                                            <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                        </label>
                                                        <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                            <input disabled-for="psychosocial_str_others_field" type="checkbox" class="custom-control-input" runat="server" id="cb_psychosocial_others_true" />
                                                            <span class="custom-control-label">Khác/ <span class="text-primary">Others</span></span>
                                                        </label>

                                                        <asp:Label runat="server" ID="lbl_psychosocial_str_others"></asp:Label>
                                                        <div class="form-group psychosocial_str_others_field d-inline-block w-n" runat="server" id="psychosocial_str_others_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_psychosocial_str_others" TextMode="SingleLine" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Các cơ quan khác/ <span class="text-primary">Other systems:</span></label>
                                                    <div>
                                                        <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_other_systems_normal_true" />
                                                            <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                        </label>
                                                        <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                            <input disabled-for="other_systems_field" type="checkbox" class="custom-control-input" runat="server" id="cb_other_systems_abnormal_true" />
                                                            <span class="custom-control-label">Bất thường/ <span class="text-primary">Abnormal</span></span>
                                                        </label>
                                                        <asp:Label runat="server" ID="lbl_others_systems_str"></asp:Label>

                                                        <div class="other_systems_field d-inline-block" runat="server" id="others_systems_str_wrapper">
                                                            <label>Ghi rõ/ Specify</label>
                                                            <div class="form-group d-inline-block w-n">
                                                                <webUI:TextField runat="server" ID="txt_others_systems_str" TextMode="SingleLine" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label">Sản-phụ</label>
                                                    <div class="mb-2">
                                                        <div class="mb-2">
                                                            <asp:Label runat="server" ID="lbl_lmp"></asp:Label>
                                                            <div runat="server" id="lmp_wrapper">
                                                                <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_lmp_true" />
                                                                    <span class="custom-control-label">Kinh cuối/ <span class="text-primary">LMP</span></span>
                                                                </label>

                                                                <div class="form-group w-n d-inline-block">
                                                                    <webUI:TextField runat="server" ID="txt_lmP_note" TextMode="SingleLine"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="d-inline-block mr-2">
                                                                <label class="control-label mr-2">Tiền sử thai nghén/ <span class="text-primary">Gravida/PARA:</span></label>
                                                                <asp:Label runat="server" ID="lbl_para"></asp:Label>
                                                                <div runat="server" id="para_wrapper" class="form-group d-inline-block w-n mb-2">
                                                                    <webUI:TextField runat="server" ID="txt_para" TextMode="SingleLine"/>
                                                                </div>
                                                            </div>

                                                            <div class="d-inline-block">
                                                                <label class="control-label d-inline-block mr-2">Sẩy/ <span class="text-primary">Abortions:</span></label>
                                                                <asp:Label runat="server" ID="lbl_abortions"></asp:Label>
                                                                <div runat="server" id="abortions_wrapper" class="form-group d-inline-block w-n mb-2">
                                                                    <webUI:TextField runat="server" ID="txt_abortions" TextMode="SingleLine" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <div class="col-md-12">
                                                    <table style="table-layout: fixed; width: 100%;">
                                                        <tbody>
                                                            <tr>
                                                                <td class="pt-2 pb-2" style="width: 300px;">
                                                                    <div style="width: 300px;">Thủ thuật can thiệp/ <span class="text-primary">Intervention Procedure</span></div>
                                                                </td>
                                                                <td style="width: 210px;">
                                                                    <div>Thời gian/ <span class="text-primary">Time</span></div>
                                                                </td>
                                                                <td>
                                                                    <div>Ghi chú/ <span class="text-primary">Notes</span></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div>ĐHMM/Capillary Blood glucose </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_blood_glucose_date_time"></asp:Label>
                                                                    <div class="form-group" runat="server" id="blood_glucose_date_time_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_blood_glucose_date_time" Width="200px" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_blood_glucose_note"></asp:Label>
                                                                    <div runat="server" id="blood_glucose_note_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_blood_glucose_note" TextMode="SingleLine" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Điện tim/ECG
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_ecg_date_time"></asp:Label>
                                                                    <div class="form-group" runat="server" id="ecg_date_time_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_ecg_date_time" Width="200px" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_ecg_note"></asp:Label>
                                                                    <div runat="server" id="ecg_note_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_ecg_note" TextMode="SingleLine" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Thông tiểu/Urine cath
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_urine_cath_date_time"></asp:Label>
                                                                    <div runat="server" id="urine_cath_date_time_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_urine_cath_date_time" Width="200px" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_urine_cath_note"></asp:Label>
                                                                    <div runat="server" id="urine_cath_note_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_urine_cath_note" TextMode="SingleLine" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Nẹp/Bó bột/Thay băng Splint/Cast/Dressing
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_splint_cast_dressing_date_time"></asp:Label>
                                                                    <div runat="server" id="splint_cast_dressing_date_time_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_splint_cast_dressing_date_time" Width="200px" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_splint_cast_dressing_note"></asp:Label>
                                                                    <div runat="server" id="splint_cast_dressing_note_wrapper">

                                                                    <webUI:TextField runat="server" ID="txt_splint_cast_dressing_note" TextMode="SingleLine" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Khác/Others
                                                                </td>
                                                                <td data-label="Thời gian/ Time">
                                                                    <asp:Label runat="server" ID="lbl_procedure_other_date_time"></asp:Label>
                                                                    <div runat="server" id="procedure_other_date_time_wrapper">
                                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_procedure_other_date_time" Width="200px" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_procedure_other_note"></asp:Label>
                                                                    <div runat="server" id="procedure_other_note_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_procedure_other_note" TextMode="SingleLine" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </fieldset>
                                            
                                            <fieldset class="row mb-2">

                                                <div class="col-md-12">
                                                    <asp:UpdatePanel ID="updatePanel_AssessmentSystem" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_AssessmentSystem" runat="server" ShowHeader="true" OnRowDeleting="grid_AssessmentSystem_RowDeleting" OnRowDataBound="gridAssessmentSystem_RowDataBound" CssClass="tb-responsive table-bordered" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 105px" class="text-primary pt-2 pb-2">Time</div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField CssClass="form-control" Value='<%#Eval("time") %>' Width="105px" ID="time" TextMode="SingleLine" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">RR (l/p)</div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("rrlp") %>' ID="rrlp" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">
                                                                            O2Sat (%)</span>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("o2sat") %>' ID="o2sat" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">
                                                                            HR (bpm)</span>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("hr") %>' ID="hr" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">
                                                                            BP (mmhg)</span>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("bp") %>' ID="bp" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">
                                                                            Temp (0C)</span>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("temp") %>' ID="temp" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">
                                                                            GCS</span>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("gcs") %>' ID="gcs" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">
                                                                            Pain/ 10</span>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("pain") %>' ID="pain" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 80px" class="text-primary">
                                                                            ATS scale</span>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("ats") %>' ID="ats" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 200px">
                                                                                Tái đánh giá & Can thiệp/ <span class="text-primary">
                                                                                    <br />
                                                                                    Re-Assessment & Intervention</span>
                                                                            </div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Title='<%#Eval("intervention") %>' ID="intervention" Value='<%#Eval("intervention") %>' runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 200px" class="text-primary">RN's Initial</div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("initial") %>' ID="initial" runat="server" TextMode="SingleLine"/>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                                <icon:trash runat="server" ID="Trash" />
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <div class="mt-2">
                                                                <asp:Button ID="btn_grid_AssessmentSystem_add" runat="server" CssClass="btn btn-sm btn-secondary" OnClick="btn_grid_AssessmentSystem_add_Click" Text="+ Add Row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_AssessmentSystem_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold">Y lệnh thuốc & dịch truyền trực tiếp/ <span class="text-primary">Direct Medication & IV fluids Order</span></label>
                                                    <asp:UpdatePanel ID="UpdatePanelDirectMedication" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:GridView ShowHeaderWhenEmpty="true" ShowHeader="true" ID="gridDirectMedication" runat="server" OnRowDeleting="gridDirectMedication_RowDeleting" OnRowDataBound="gridAssessmentSystem_RowDataBound" CssClass="tb-responsive table-bordered" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 105px" class="pt-2 pb-2">Thời gian/ <span class="text-primary">Time</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField CssClass="form-control" Value='<%#Eval("dir_med_time") %>' Width="105px" ID="dir_med_time" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 238px">Thuốc/ <span class="text-primary">Medication</span> - Dịch truyền/ <span class="text-primary">IV Fluids</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("dir_medication") %>' ID="dir_medication" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 100px">Liều dùng/ <span class="text-primary">Dose</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("dir_med_dose") %>' ID="dir_med_dose" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 114px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("dir_med_route") %>' ID="dir_med_route" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 100px">Tốc độ/ <span class="text-primary">Rate</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("dir_med_rate") %>' ID="dir_med_rate" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 150px">Bác sĩ/ <span class="text-primary">Doctor</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("dir_med_doctor") %>' ID="dir_med_doctor" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 150px">Ghi chú/ <span class="text-primary">Comment</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("dir_med_comment") %>' ID="dir_med_comment" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div>Thời gian/ <span class="text-primary">Time</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField TextMode="SingleLine" CssClass="form-control" Value='<%#Eval("dir_med_time2") %>' Width="105px" ID="dir_med_time2" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 150px">Điều dưỡng/ <span class="text-primary">RN's Initial</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("dir_med_initial") %>' ID="dir_med_initial" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')"><icon:trash runat="server" ID="Trash" /></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="UpdateProgressDirectMedication" runat="server" AssociatedUpdatePanelID="UpdatePanelDirectMedication">
                                                                <ProgressTemplate>
                                                                    Please wait....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            <div class="mt-2">
                                                                <asp:Button ID="btn_gridDirectMedication_add" runat="server" CssClass="btn btn-sm btn-secondary" OnClick="btn_gridDirectMedication_add_Click" Text="+ Add Row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_gridDirectMedication_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label">Xuất viện/ <span class="text-primary">Discharged</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_discharge_date_time"></asp:Label>
                                                    <div runat="server" id="discharge_date_time_wrapper" class="d-inline-block mr-2">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_discharge_date_time" Width="200px" />
                                                    </div>
                                                    <div class="d-inline-block mr-2">
                                                        <label class="control-label d-inline-block mr-2">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                        <asp:Label runat="server" ID="lbl_discharge_by"></asp:Label>
                                                        <div class="form-group w-n d-inline-block mr-2" runat="server" id="discharge_by_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_discharge_by" TextMode="SingleLine"/>
                                                        </div>
                                                    </div>
                                                    <asp:Label CssClass="d-block" runat="server" ID="lbl_discharge_option"></asp:Label>
                                                    <div class="d-inline-block mt-2" runat="server" id="discharge_option_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" runat="server" id="cb_discharge_option_h" class="custom-control-input" />
                                                            <span class="custom-control-label">Về nhà/ <span class="text-primary">Home</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input type="checkbox" runat="server" id="cb_discharge_option_a" class="custom-control-input" />
                                                            <span class="custom-control-label">Tự ý/ <span class="text-primary">Against Medical Advice/AMA</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" runat="server" id="cb_discharge_option_d" class="custom-control-input" />
                                                            <span class="custom-control-label">Tử vong/ <span class="text-primary">Dead</span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label">Nhập viện/ <span class="text-primary">Admited</span></label>
                                                
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_admited_date_time"></asp:Label>
                                                    <div class="d-inline-block mr-2" runat="server" id="admited_date_time_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_admited_date_time" Width="200px" />
                                                    </div>

                                                    <asp:Label runat="server" ID="lbl_admited_by"></asp:Label>
                                                    <div class="d-inline-block mr-2" runat="server" id="admited_by_wrapper">
                                                        <label class="control-label mr-2">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                        <div class="form-group w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_admited_by" TextMode="SingleLine" />
                                                        </div>
                                                    </div>

                                                    <asp:Label runat="server" ID="lbl_receiving_unit"></asp:Label>
                                                    <div class="d-inline-block mt-2" runat="server" id="receiving_unit_wrapper">
                                                        <label class="control-label mr-2">Khoa tiếp nhận/ <span class="text-primary">Receiving Unit</span></label>
                                                        <div class="form-group w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_receiving_unit" TextMode="SingleLine" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label">Chuyển viện/ <span class="text-primary">Transfer to</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_transfer_to"></asp:Label>
                                                    <div class="d-inline-block mr-2 w-n" runat="server" id="transfer_to_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_transfer_to" TextMode="SingleLine" />
                                                    </div>
                                                    <div class="col-md-6 d-inline-block">
                                                        <label class="control-label mr-2">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                        <asp:Label runat="server" ID="lbl_transfer_by"></asp:Label>
                                                        <div class="d-inline-block mr-2 w-n" runat="server" id="transfer_by_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_transfer_by" TextMode="SingleLine" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2 gt-2-a">
                                                <label class="col-md-12 control-label">Giờ thông báo Bác sĩ/ <span class="text-primary">Time notified to Doctor</span></label>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_noticed_time"></asp:Label>
                                                    <div class="d-inline-block mr-2" runat="server" id="noticed_time_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_noticed_time" Width="200px" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <label class="col-md-12 control-label mb-2">PHIẾU GHI CHÚ ĐIỀU DƯỠNG/ <span class="text-primary">NURSING NOTES</span></label>
                                                <div class="col-md-12">
                                                    <asp:UpdatePanel ID="updatePanel_NursingNotes" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:GridView ID="grid_NursingNotes" runat="server" OnRowDeleting="grid_NursingNotes_RowDeleting" OnRowDataBound="gridAssessmentSystem_RowDataBound" ShowHeaderWhenEmpty="true" ShowHeader="true" CssClass="tb-responsive table-bordered" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 200px" class="pt-2 pb-2">Ngày/ <span class="text-primary">Date</span> - Giờ/ <span class="text-primary">Time</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="form-group">
                                                                                <telerik:RadDateTimePicker ID="date_time" SelectedDate='<%# GetDateTime(Eval("date_time")) %>' Width="200px" runat="server" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 300px">Theo dõi diễn tiến/ <span class="text-primary">Patient's condition</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("patient_condition") %>' ID="patient_condition" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 300px">Ký/Ghi tên ĐD/ <span class="text-primary">Signature & RN's name</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("signature_name") %>' ID="signature_name" runat="server" TextMode="SingleLine" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                                <icon:trash runat="server" ID="Trash" />
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="updateProgress_NursingNotes" runat="server" AssociatedUpdatePanelID="updatePanel_NursingNotes">
                                                                <ProgressTemplate>
                                                                    Please wait....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            <div class="mt-2">
                                                                <asp:Button ID="btn_grid_NursingNotes_add" runat="server" CssClass="btn btn-sm btn-secondary" OnClick="btn_grid_NursingNotes_add_Click" Text="+ Add Row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_NursingNotes_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                        <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                        <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                        <asp:LinkButton runat="server" OnClick="btnPrint_Click" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>

                                                        <asp:LinkButton runat="server" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary waves-effect">Cancel</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>

                                            <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                                <ModalBody>
                                                    <div class="text-center">
                                                        <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                        <h4 class="mt-4 mb-4">Delete document?</h4>
                                                    </div>
                                                    <div class="text-right">
                                                        <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                        <asp:LinkButton OnClick="btnDelete_Click" OnClientClick="window.removeEventListener('beforeunload',comfirm_leave_page,true);" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                    </div>
                                                </ModalBody>
                                            </webUI:PopupModal>

                                            <webUI:PopupShowDelay runat="server" ID="PopupShowDelay" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:LinkButton runat="server" OnClick="clearSession_Click" ID="clearSession"></asp:LinkButton>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script>
        function loadImage() {
                const canvas = document.querySelector('#canvas');
                const histories = document.querySelector('#histories');
                const ctx = canvas.getContext("2d");
                canvas.height = 500;
                canvas.width = 500;
                ctx.strokeStyle = "red";
                let imageTemp = document.getElementById("image1");

                let img1 = new Image();

                img1.onload = function () {
                    ctx.drawImage(img1, 0, 0);
                }

            img1.src = document.getElementById("skin_anno_data_base64").value;

                let painting = false;
                let pen = false;

                var history = {
                    redo_list: [],
                    undo_list: [],
                    saveState: function (canvas, list, keep_redo) {
                        keep_redo = keep_redo || false;
                        if (!keep_redo) {
                            this.redo_list = [];
                        }

                        (list || this.undo_list).push(canvas.toDataURL());
                    },
                    undo: function (canvas, ctx) {
                        this.restoreState(canvas, ctx, this.undo_list, this.redo_list);
                    },
                    redo: function (canvas, ctx) {
                        this.restoreState(canvas, ctx, this.redo_list, this.undo_list);
                    },
                    restoreState: function (canvas, ctx, pop, push) {
                        if (pop.length) {
                            this.saveState(canvas, push, true);
                            var restore_state = pop.pop();
                            var img = document.createElement("img");
                            img.src = restore_state;

                            img.onload = function () {
                                ctx.clearRect(0, 0, canvas.width, 400);
                                ctx.drawImage(img, 0, 0, canvas.width, canvas.height, 0, 0, canvas.width, canvas.height);
                            }
                        }
                    }
                }

                var pencil = {
                    options: {
                        stroke_color: "red",
                        dim: 4
                    },
                    init: function (canvas, ctx) {
                        this.canvas = canvas;
                        this.ctx = ctx;
                        this.ctx.strokeColor = this.options.stroke_color;
                        this.drawing = false;
                        this.addCanvasEvents();
                    },
                    addCanvasEvents: function () {
                        this.canvas.addEventListener('mousedown', this.start.bind(this));
                        this.canvas.addEventListener('mousemove', this.stroke.bind(this));
                        this.canvas.addEventListener('mouseup', this.stop.bind(this));
                        this.canvas.addEventListener('mouseout', this.stop.bind(this));
                    },
                    start: function (e) {
                        if (currentAct != act.PEN) return;
                        this.ctx.beginPath();
                        history.saveState(this.canvas);
                        this.drawing = true;
                    },
                    stroke: function (e) {
                        if (currentAct != act.PEN) return;

                        if (this.drawing) {
                            let rect = canvas.getBoundingClientRect();

                            var x = e.clientX - rect.left;
                            var y = e.clientY - rect.top;

                            this.ctx.lineTo(x, y);
                            this.ctx.stroke(); // draw line
                            this.ctx.beginPath();
                            this.ctx.moveTo(x, y);
                        }
                    },
                    stop: function (e) {
                        if (currentAct != act.PEN) return;

                        if (this.drawing) {
                            this.drawing = false;
                            this.ctx.beginPath();
                        }
                        var image = document.getElementById("canvas").toDataURL("image/png");
                       
                        document.getElementById("skin_anno_data_base64").value = image;
                    }
                };

                let note = {
                    options: {},
                    init: function (canvas, ctx) {
                        this.canvas = canvas;
                        this.ctx = ctx;
                        this.addCanvasEvents();
                    },
                    addCanvasEvents: function () {
                        this.canvas.addEventListener('mousedown', this.start.bind(this));
                        //this.canvas.addEventListener('mousemove', this.stroke.bind(this));
                        this.canvas.addEventListener('mouseup', this.stop.bind(this));
                        this.canvas.addEventListener('mouseout', this.stop.bind(this));
                    },
                    start: function (e) {
                        if (currentAct != act.NOTE) return;
                        history.saveState(this.canvas);

                        let rect = canvas.getBoundingClientRect();

                        var x = e.clientX - rect.left;
                        var y = e.clientY - rect.top;

                        ctx.beginPath();
                        ctx.moveTo(x, y);
                        ctx.lineTo(x + 20, y);
                        ctx.lineTo(x + 20, y + 25);
                        ctx.lineTo(x + 10, y + 30);
                        ctx.lineTo(x, y + 25);
                        ctx.lineTo(x, y);
                        ctx.fillStyle = "blue";

                        ctx.font = "13px Verdana";
                        ctx.fillText("1", x + 6, y + 18);
                        ctx.stroke();
                    },
                    stop: function (e) {
                        if (currentAct != act.NOTE) return;
                        this.ctx.beginPath();

                        let his = JSON.stringify(history);
                        
                        let img = document.getElementById("image1");
                        
                        img.src = this.canvas;

                        //$.ajax({
                        //    type: 'POST',
                        //    url: "Paint.aspx/updateImage",
                        //    data: JSON.stringify(history),
                        //    contentType: 'application/json; charset=utf-8',
                        //    dataType: 'json',
                        //    success: function () {
                        //        console.log('done');
                        //        swal("Done!", "It was succesfully deleted!", "success");
                        //    },
                        //    error: function (xhr, ajaxOptions, thrownError) {
                        //        swal("Error deleting!", "Please try again", "error");
                        //    }
                        //});

                        //$.ajax({
                        //    type: 'POST',
                        //    url: "Paint.aspx/updateImage",
                        //    data: JSON.stringify(history),
                        //    contentType: 'application/json; charset=utf-8',
                        //    dataType: 'json',
                        //    success: function (msg) {
                        //        console.log(msg);
                        //    }
                        //});
                    }
                }

                const act = { PEN: 1, NOTE: 2 };
                Object.freeze(act);

                let currentAct;

                $('#note').click(function () {
                    currentAct = act.NOTE;
                    note.init(canvas, ctx);
                });

                $('#pencil').click(function () {
                    currentAct = act.PEN;
                    pencil.init(canvas, ctx);
                });

                $('#undo').click(function () {
                    history.undo(canvas, ctx);
                });

                $('#redo').click(function () {
                    history.redo(canvas, ctx);
                });

        };
    </script>

    <script type="text/javascript">
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        loadImage();
        checkboxRadiobutton_init();
        formGroup_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
        if (document.getElementById('txt_vs_bmi') != null) { setbmiStr(document.getElementById('txt_vs_bmi').value); }
        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            checkboxRadiobutton_init();
            formGroup_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);

            if (document.getElementById('txt_vs_bmi') != null) { setbmiStr(document.getElementById('txt_vs_bmi').value); }
            $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
            loadImage();
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        function btnPrint_Click() {
            let printContent = document.querySelector("#printContent");
            printContent.setAttribute("style", "display: block");
            
            let total = Math.ceil(printContent.offsetHeight / 1096);

            for (let i = 1; i <= total; i++) {
                let div = document.createElement("div");
                div.setAttribute("class", "watermark page");
                div.setAttribute("style", "top: " + ( 1093 * (i - 1)) + "px");
                div.setAttribute("data-page", "Page " + i + " of " + total);
                document.getElementById("print_content").append(div);
            }

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);

            window.print();
        }

    </script>

</body>
</html>

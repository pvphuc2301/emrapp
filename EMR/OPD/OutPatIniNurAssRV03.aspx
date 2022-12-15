<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAssRV03.aspx.cs" Inherits="EMR.OutPatIniNurAssRV03" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <style>
        .fs10 {
            font-size: 10pt !important;
        }
        .fs10 .en {
            font-size: 9pt !important;
        }
        .table-bordered td, .table-bordered th {
            padding: 4px;
        }
        .custom-control {
            margin-bottom: 0;
        }
        .pt1 {
            padding: 0 20px 10px 20px;
        }

        .dg {
            display: grid;
            width: 100%;
        }

        .gtc1 {
            grid-template-columns: 200px 1fr;
        }

        .gtc2 {
            grid-template-columns: 1fr 1fr;
        }

        .gtc3 {
            grid-template-columns: auto 1fr;
        }

        .dg.cg1, .dg.cg1, .dg.cg1 {
            column-gap: 12px;
        }

        @media only screen and (max-width: 600px) {
          .dg-1 {
            display: block !important;
          }
        }

        /*table, td, th {
          border: 1px solid black;
        }*/

        table {
          /*width: 100%;*/
          border-collapse: collapse;
        }

        .circle {
            border: 1px solid #000;
            border-radius: 50%;
            width: 21px;
            height: 21px;
            line-height: 1.5;
            display: inline-block;
        }
        .cursor-wait {
            pointer-events: none;
            background-color: #007bff;
            border-color: #007bff;
            opacity: .65;
        }
        /*@media print {
            body
            {
                font-family: 'Times New Roman' !important;
                font-size: 11pt !important;*/
                /*font-size: 14.5px; 
                font-family: Tahoma;*/
            /*}
            i {*/
                /*color: #007297 !important;*/
                /*color: #007297;
                font-size: 10pt;
            }
        }*/
        @page {
            margin-top: 10px;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <%--<div class="cssclsNoScreen" id="printContent" style="font-family: Tahoma !important; font-size: 14.5px">--%>
        <%-- Print page --%>
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
                                                <div><span style="font-size: 12pt; font-weight: bold">PHIẾU ĐÁNH GIÁ ĐIỀU DƯỠNG BAN ĐẦU DÀNH CHO BỆNH NGOẠI TRÚ</span></div>
                                                <div class="en"><i style="font-size: 11pt; font-weight: bold">OUTPATIENT INITIAL NURSING ASSESSMENT</i></div>
                                            </div>
                                            <div></div>
                                        </div>
                                        <div style="height: 12px; position: relative; margin-top: -4px">
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
                                        <div style="display: grid; grid-template-columns: 260px 1fr; gap: 6px;">
                                            <div>
                                                <div style="border: 1px dashed #000; padding: 6px; display: grid; grid-gap: 6px; line-height: 19pt">
                                                    <div>Họ tên: <asp:Label runat="server" ID="prt_fullname"/></div>
                                                    <div>Ngày sinh: <asp:Label runat="server" ID="prt_dob"/></div>
                                                    <div>Giới tính: <asp:Label runat="server" ID="prt_gender"/></div>
                                                    <div>PID: <asp:Label runat="server" ID="prt_pid"/></div>
                                                </div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto auto auto auto 1fr; padding-top: 24pt">
                                                <div>
                                                    <div><span style="font-weight: bold">Thời gian bắt đầu đánh giá:</span></div>
                                                    <div class="en"><span style="font-weight: bold">Time of assessment</span></div>
                                                </div>
                                                <div>
                                                    <div><span style="font-weight: bold">&nbsp;Ngày </span><asp:Label runat="server" ID="prt_date_of_assessment"></asp:Label>;</div>
                                                    <div class="en"><span style="font-weight: bold">Date</span></div>
                                                </div>
                                                <div>
                                                    <div><span style="font-weight: bold">&nbsp;Giờ: </span><asp:Label runat="server" ID="prt_time_of_assessment"></asp:Label></div>
                                                    <div class="en"><span style="font-weight: bold">Time</span></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div>&nbsp;</div>--%>
                                        <%-- margin-right: -80px;  --%>
                                        <div style="margin-top: 6px;"><span class="font-bold">I.&nbsp;&nbsp;DẤU HIỆU SINH TỒN VÀ CÁC CHỈ SỐ ĐO LƯỜNG/ <span class="en">VITAL SIGNS AND PHYSICAL MEASUREMENTS</span></span></div>
                                        <div style="display: grid; grid-template-columns: 150px 150px 190px 1fr">
                                            <div>
                                                <div>- Nhiệt độ: <asp:Label runat="server" ID="prt_vs_temperature" /> °C</div>
                                                <div style="margin-left: 8px;" class="en">Temperature</div>
                                            </div>
                                            <%--  --%>
                                            <div>
                                                <div>- Mạch: <asp:Label runat="server" ID="prt_vs_heart_rate" /> nhịp/phút</div>
                                                <div style="margin-left: 8px;" class="en">Pulse</div>
                                            </div>
                                            <%--  --%>
                                            <div>
                                                <div>- HA: <asp:Label runat="server" ID="prt_vs_blood_pressure" /> mmHg</div>
                                                <div style="margin-left: 8px;" class="en">Blood pressure</div>
                                            </div>
                                            <%--  --%>
                                            <div>
                                                <div>- Nhịp thở: <asp:Label runat="server" ID="prt_vs_respiratory_rate" /> lần/phút</div>
                                                <div style="margin-left: 8px;" class="en">Respiratory rate &nbsp;&nbsp;bpm</div>
                                            </div>
                                            <%--  --%>
                                            <div>
                                                <div>- Cân nặng: <asp:Label runat="server" ID="prt_vs_weight" /> kg</div>
                                                <div style="margin-left: 8px;" class="en">Weight</div>
                                            </div>
                                            <%--  --%>
                                            <div>
                                                <div>- Chiều cao: <asp:Label runat="server" ID="prt_vs_height" /> cm</div>
                                                <div style="margin-left: 8px;" class="en">Height</div>
                                            </div>
                                            <%--  --%>
                                            <div style="grid-column: 3/5; display: flex; flex-direction: row">
                                                <div>
                                                    <div>- Vòng đầu (trẻ em <2 tuổi): <asp:Label runat="server" ID="prt_pulse" /> cm</div> 
                                                    <div style="margin-left: 8px;" class="en">Head circumference (children <2 years old)</div>
                                                </div>
                                                <div>- SpO <sub>2</sub>: <asp:Label runat="server" ID="prt_vs_spO2" /> %</div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div><span class="font-bold">II. ĐÁNH GIÁ/ <span class="en">ASSESSMENT</span></span></div>
                                        <div><span class="font-bold">1. Lý do đến khám/ <span class="en">Chief complaint: </span></span><asp:Label runat="server" ID="prt_chief_complaint" /></div>
                                        <div style="display: grid; grid-template-columns: 150px 100px 1fr; grid-gap: 10px">
                                            <div><span class="font-bold">2. Dị ứng/ <span class="en">Allergy:</span></span></div>
                                            <div><asp:Label runat="server" ID="prt_allergy_false" /> Không/ <span class="en">No</span></div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                <asp:Label runat="server" ID="prt_allergy_true" />
                                                <div>
                                                 Có, ghi rõ/ <span class="en">Yes, specify: </span><asp:Label runat="server" ID="prt_allergy_note" />
                                                </div>
                                            </div>
                                        </div>
                                        <div><span class="font-bold">3. Trạng thái tinh thần/ <span class="en">Mental status:</span></span></div>
                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 280px 80px 1fr; grid-gap: 10px">
                                            <div>Đáp ứng phù hợp/ <span class="en">Appropriate response:</span></div>
                                            <div><asp:Label runat="server" ID="prt_mental_status_true" /> Có/ <span class="en">Yes</span></div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                <asp:Label runat="server" ID="prt_mental_status_false" /> 
                                                <div>Không, ghi rõ/ <span class="en">No, specify: </span><asp:Label runat="server" ID="prt_mental_status_note" /></div>
                                            </div>
                                        </div>
                                        <div><span class="font-bold">4. Tầm soát bệnh lây nhiễm (dành cho những bệnh tạo thành dịch)</span></div>
                                        <div class="en" style="margin-left: 16px"><span class="font-bold">Communicable disease screening (for diseases that cause epidemics)</span></div>
                                        <div>
                                            <table class="table-bordered" style="table-layout: fixed; width: 100%">
                                                <tr>
                                                    <td style="width: 125px;" class="text-center">
                                                        <div class="font-bold">Phân loại</div>
                                                        <div class="en"><span>Category</span></div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="font-bold">Tiêu chí</div>
                                                        <div class="en">Criteria</div>
                                                    </td>
                                                    <td style="width: 50px;" class="text-center">
                                                        <div class="font-bold">Có</div>
                                                        <div class="en">Yes</div>
                                                    </td>
                                                    <td style="width: 55px;" class="text-center">
                                                        <div class="font-bold">Không</div>
                                                        <div class="en">No</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">
                                                        <div>Triệu chứng </div>
                                                        <div class="en">Signs and symptoms</div>
                                                    </td>
                                                    <td class="p-1">
                                                        <div>Sốt > 38°C và ho, khó thở, tiêu chảy,...</div>
                                                        <div class="en">Fever > 38°C and cough, dyspnea, diarrhea</div>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_high_fever_true" />
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_high_fever_false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center" rowspan="2">Dịch tễ <br /><span class="en">Epidemiology</span></td>
                                                    <td class="p-1">
                                                        <div>Đi từ hay tiếp xúc với người đi từ vùng dịch trong vòng 2 tuần </div>
                                                        <div class="en">History of travel and in contact with injectious disease outbreak in the past 2 weeks</div>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_contact_infectious_disease_true" />
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_contact_infectious_disease_false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1">
                                                        <div>Tiếp xúc gần với người bị sốt, ho, khó thở </div>
                                                        <div class="en">Had close contact with someone who has fever, cough, dyspnea</div>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_close_contact_true" />
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_close_contact_false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">
                                                        <div>Đánh giá </div>
                                                        <div class="en">Assessment</div>
                                                    </td>
                                                    <td class="p-1">
                                                        <div>Có nguy cơ truyền nhiễm</div>
                                                        <div class="en">Injectious risk</div>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_injectious_risk_true" />
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_injectious_risk_false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        
                                        <div style="margin-left: 28px">
                                            <div>• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ triệu chứng, chuyển bệnh nhân sang phòng khám sàng lọc</div>
                                            <div class="en" style="margin-left: 6px"><i>If <span class="font-bold">"YES"</span> Signs and symptom risks, transfer patient to screening clinic.</i></div>
                                            <div>• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ dịch tể, chuyển bệnh nhân đến phòng cách ly áp lực âm cấp cứu</div>
                                            <div class="en" style="margin-left: 6px"><i>If <span class="font-bold">"YES"</span> epidemic risks, transfer patient to Isolation room in Emergency Department.</i></div>
                                            <div>• Nếu <span class="font-bold">"KHÔNG"</span> tiếp tục hoàn thành tiểu mục <span class="font-bold">5, 6, 7, 8</span></div>
                                            <div class="en" style="margin-left: 6px"><i>If <span class="font-bold">"NO"</span> complete part 5, 6, 7, 8 assessment.</i></div>
                                        </div>
                                        
                                        <div><span class="font-bold">5. Đánh giá đau/ <span class="en">Pain assessment:</span></span></div>
                                        <div style="margin-left: 16px">
                                            <div>Điều dưỡng đánh giá chọn một trong các thang điểm đau bên dưới phù hợp với từng người bệnh.</div>
                                            <div class="en">Nurses select one of the following pain scales in consistent with each sort of patient.</div>
                                        </div>

                                        <section runat="server" id="prt_naf_wrapper" style="display: grid; grid-template-columns: 300px 1fr; grid-gap: 10px; margin-left: 16px">
                                            <div style="grid-column: 1/3"><span class="font-bold">Bằng số và Hình mặt (≥ 4 tuổi)/ <span class="en">Numeric and Faces (≥ 4 years):</span></span></div>
                                            <div>
                                                <div style="display: inline-block"><asp:Label runat="server" ID="prt_paint_score_code_0" /> Không đau (0) <div style="margin-left: 16px"><span class="en">No hurt</span></div> </div>
                                                <div style="display: inline-block"><asp:Label runat="server" ID="prt_paint_score_code_1" /> Đau rất ít (1 - 2)<div style="margin-left: 16px"><span class="en">Little hurt</span></div></div>
                                                <div style="display: inline-block"><asp:Label runat="server" ID="prt_paint_score_code_2" /> Đau nhẹ (3 - 4)<div style="margin-left: 16px"><span class="en">Slight hurt</span></div></div>
                                                <div style="display: inline-block"><asp:Label runat="server" ID="prt_paint_score_code_3" /> Đau vừa (5 - 6)<div style="margin-left: 16px"><span class="en">Considerable hurt</span></div></div>
                                                <div style="display: inline-block"><asp:Label runat="server" ID="prt_paint_score_code_4" /> Đau nhiều (7 - 8)<div style="margin-left: 16px"><span class="en">Serious hurt</span></div></div>
                                                <div style="display: inline-block"><asp:Label runat="server" ID="prt_paint_score_code_5" /> Rất đau (9 - 10)<div style="margin-left: 16px"><span class="en">Worst hurt</span></div></div>
                                            </div>
                                            <div>
                                                <img src="../images/2021-12-27_14-08-55.png" />
                                            </div>
                                        </section>

                                        <section runat="server" id="prt_flacc_wrapper">
                                            <div style="margin-left: 16px; font-weight: bold; text-decoration: underline">
                                                <div>FLACC (2 tháng đến < 4 tuổi) và bệnh nhi dưới 16 tuổi không nói được</div>
                                                <div class="en">2 month to < 4 years old and non-verbal pediatric patient (patient < 16 years old)</div>
                                            </div>
                                            <div>
                                                <table class="table-bordered" style="table-layout: fixed; width: 100%; margin-bottom: -1px">
                                                    <tr class="text-center font-bold">
                                                        <td rowspan="2" style="width: 85px">
                                                            <div>Các mục</div>
                                                            <div class="en"><span>Category</span></div>
                                                        </td>
                                                        <td colspan="3">
                                                            <div>ĐIỂM HÀNH VI/ <span class="en">BEHAVIOUR SCORE</span></div>
                                                        </td>
                                                        <td rowspan="2" style="width: 50px">
                                                            <div>Điểm</div>
                                                            <div class="en">Score</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center font-bold p-1">0</td>
                                                        <td class="text-center font-bold p-1">1</td>
                                                        <td class="text-center font-bold p-1">2</td>
                                                    </tr>
                                                </table>
                                                <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%;">
                                                    <tr>
                                                        <td class="text-center p-1" style="width: 85px">
                                                            <div>Mặt</div>
                                                            <div class="en">Face</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Không biểu hiện cụ thể hoặc đang mỉm cười.
                                                            <span class="en">No particular expression or is smiling</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Thỉnh thoảng nhăn mặt hoặc cau mày, thường xuyên run cằm, nghiến răng 
                                                            <span class="en">Occasional grimace or frown, frequent to constant quivering of chin, clenched jaw</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Lãnh đạm, thời ơ
                                                            <span class="en">Withdrawn, disinterested</span>
                                                        </td>
                                                        <td class="p-1 text-center" style="width: 50px">
                                                            <asp:Label runat="server" ID="prt_flacc_face" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">
                                                            <div>Chân</div>
                                                            <div class="en">Legs</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Vị trí bình thường hoặc Yên tĩnh và thư giãn. 
                                                            <span class="en">Normal position or Is calm and relaxed</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Khó chịu, bồn chồn, căng thẳng 
                                                            <span class="en">Uneasy, restless, tense</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Đá chân hoặc bất động hoặc bồn chồn. 
                                                            <span class="en">Kicking or legs drawn up immobility or extremely restless</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_legs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">
                                                            <div>Cử động</div>
                                                            <div class="en">Activity</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Nằm im/ <span class="en">Lying quietly</span><br />
                                                            Tư thế bình thường/ <span class="en">Normal position</span><br />
                                                            Đi lại dễ dàng/ <span class="en">Moves easily</span>
                                                        </td>
                                                        <td class="p-1 align-top">Loay hoay, luôn thay đổi tư thế/ <span class="en">Squirming, Shifting back and forth</span></td>
                                                        <td class="p-1 align-top">Khóc thét hoặc hét lên khi bị chạm vào hoặc cử động/ <span class="en">High-pitched cry or scream when touched or moved</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_activity" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">
                                                            <div>Khóc</div>
                                                            <div class="en">Cry</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            <div>Không khóc/ <span>No cry</span></div>
                                                            <div>Thức hoặc ngủ <span class="en">Awake or sleep</span></div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            <div>Rên ri, thỉnh thoảng than phiền</div>
                                                            <div class="en">Moans and whimpers, occasional complaint</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            <div>Khóc liên tục, hét lên, nức nở, than phiền thường xuyên</div>
                                                            <div class="en">Crying steadily, screams, sobs, frequent complaint</div>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_cry" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">
                                                            Xoa dịu  An ủi <span class="en">Consolability</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Hài lòng, thử giãn <span class="en">Contents, relaxed</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            <div>An ủi bằng thỉnh thoảng chạm, ôm hoặc nói chuyện, dễ bị phân tâm.</div>
                                                            <div class="en">Reassured by occasional touching, hugging or talking to, easily distracted</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            <div>Không an ủi được</div>
                                                            <div class="en">Inconsolable</div>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_consolability" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="p-1 text-right font-bold" colspan="4">Tổng điểm/ <span class="en">Total score</span></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_total_score" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 75px repeat(4, auto); gap: 6px; margin-left: 16px;">
                                                <div class="font-bold">
                                                    <div>Kết luận: </div>
                                                    <div class="en">Conclude</div>
                                                </div>
                                                <div>
                                                    <div><asp:Label runat="server" ID="prt_flacc_conclude_0" /> Không đau (0)</div>
                                                    <div class="en" style="margin-left: 16px"><span>No risk of malnutrition</span></div>
                                                </div>
                                                <div>
                                                    <div><asp:Label runat="server" ID="prt_flacc_conclude_1" /> Đau nhẹ (1-3) </div>
                                                    <div class="en" style="margin-left: 16px"><span>Slight pain</span></div>
                                                </div>
                                                <div>
                                                    <div><asp:Label runat="server" ID="prt_flacc_conclude_2" /> Đau vừa (4-6) </div>
                                                    <div class="en" style="margin-left: 16px"><span>Considerable pain</span></div>
                                                </div>
                                                <div>
                                                    <div><asp:Label runat="server" ID="prt_flacc_conclude_3" /> Rất đau (7-10)</div>
                                                    <div class="en" style="margin-left: 16px"><span>Worst pain</span></div>
                                                </div>
                                            </div>
                                        </section>
                                
                                        <section runat="server" id="prt_npass_wrapper">
                                            <div style="margin-left: 16px; text-decoration: underline" class="font-bold">Thang điểm đánh giá đau và an thần cho trẻ sơ sinh và nhũ nhi (< 2 tháng tuổi)</div>
                                            <div style="margin-left: 16px; text-decoration: underline" class="font-bold en">Neonatal and infantile pain, sedation scale (N-PASS) (<2 months)</div>
                                            <div>
                                                <table class="table-bordered fs10" style="table-layout: fixed; width: 100%; margin-bottom: -1px">
                                                    <tr>
                                                        <td style="width: 90px" class="font-bold text-center" rowspan="2">
                                                            <div>Tiêu chí</div>
                                                            <div>đánh giá</div>
                                                            <div class="en"><i>Assessment</i></div>
                                                            <div class="en"><i>criteria</i></div>
                                                        </td>
                                                        <td colspan="2" class="font-bold text-center">
                                                            <div>An thần</div>
                                                            <div class="en">Sedation</div>
                                                        </td>
                                                        <td class="font-bold text-center">
                                                            <div>Bình thường</div>
                                                            <div class="en">Normal</div>
                                                        </td>
                                                        <td colspan="2" class="font-bold text-center">
                                                            <div>Đau</div>
                                                            <div class="en">Pain</div>
                                                        </td>
                                                        <td class="font-bold text-center" rowspan="2" style="width: 50px">
                                                            <div>Điểm</div>
                                                            <div class="en">Score</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center font-bold">-2</td>
                                                        <td class="text-center font-bold">-1</td>
                                                        <td class="text-center font-bold">0</td>
                                                        <td class="text-center font-bold">1</td>
                                                        <td class="text-center font-bold">2</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Khóc
                                                            <div class="en">Crying</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Không khóc với kích thích đau
                                                            <div class="en">No cry with painful stimuli</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Rên rỉ, khóc yếu với kích thích đau
                                                            <div class="en">Moans or cries minimally with painful stimuli</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Khóc tự nhiên, Không bứt rứt
                                                            <div class="en">Appropriate crying Not irritable</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Bứt rứt, quấy khóc ngắt quãng, có thể dỗ được
                                                            <div class="en">Irritable or crying at intervals Consolable</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Khóc cao giọng, liên tục, không thể dỗ được
                                                            <div class="en">High-pitched or silent-continuous cry Inconsolable</div>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_crying" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Biểu hiện
                                                            <div class="en">Behavior</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Không đáp ứng với bất kỳ kích thích
                                                            <div class="en">No arousal to any stimuli</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Nhúc nhích nhẹ khi bị kích thích
                                                            <div class="en">Arouses minimally to stimuli little spontaneous movement</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Cử động phù hợp tuổi thai
                                                            <div class="en">Appropriate for gestational age</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Vặn mình, thường thức giấc
                                                            <div class="en">Restless, squirming Awakens frequently</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Uốn éo, không ngủ yên
                                                            <div class="en">Arching, kicking Constantly awake or Arouses minimally/ no movement (not sedated)</div>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_behavior" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Vẻ mặt
                                                            <div class="en">Facial expression</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Không thay đổi với kích thích
                                                            <div class="en">No expression</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Thay đổi nhẹ với kích thích
                                                            <div class="en">Minimal expression with stimuli</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            <div>Thư giãn</div>
                                                            <div>Relaxed,</div>
                                                            <div class="en">Appropriate</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Nhăn mặt, không liên tục
                                                            <div class="en">Any pain expression intermittent</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Nhăn mặt liên tục
                                                            <div class="en">Any pain expression continual</div>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_facial_expression" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            <div>Trương lực chỉ</div>
                                                            <div class="en">Extremities tone</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Mềm oặt, không phản xạ nắm
                                                            <div class="en">No grasp reflexes </div>
                                                            <div class="en">Flaccid tone</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Giảm trương lực, phản xạ nắm yếu
                                                            <div class="en">Weak grasp reflex decrease muscle tone</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Trương lực bình thường, tay chân thư giãn
                                                            <div class="en">Relaxed hands and feet Normal tone</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Các ngón chân quặp lại, không liên tục, tay nắm lại hoặc xèo ra. Không gồng người
                                                            <div class="en">Intermittent clenched toes, fists or finger splay Body is not tense</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Các ngón chân quặp lại liên tục, tay nắm lại hoặc xèo ra. Gồng người
                                                            <div class="en">Continual clenched toes, fists, or finger splay. Body is tense</div>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_extremities_tone" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Dấu hiệu <br /> sinh tồn
                                                            <div class="en">Vital signs</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            <div>Không dao động khi bị kích thích </div>
                                                            <div>Thở yếu</div>
                                                            <div>Ngưng thở</div>
                                                            <div>No variability with stimuli </div>
                                                            <div>Hypoventilation or  apnea</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Thay đổi dưới 10% so với giới hạn  bình thường khi bị  kích thích
                                                            <div class="en">Decrease 10%  variability from  baseline with stimuli</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Nằm trong giới hạn bình thường theo tuổi thai 
                                                            <div class="en">Within baseline or  normal for  gestational age</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Tăng 10-20% so  với giới hạn bình  thường SpO2 76  -85% khi bị kích  thích, hồi phục  nhanh
                                                            <div class="en">Increase 10-20% from  baseline  SaO2 76-85% with  stimulation - quick toes, fists or finger  splay Body is not  tense</div>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Tăng trên 20% so  với giới hạn bình  thường  SpO2 dưới 75%  khi bị kích thích,  hồi phục chậm  
                                                            <div class="en">Increase 20% from  baseline  SaO2 ≤ 75% with stimulation - slow  Out of sync with vent</div>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_vital_signs" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="table-bordered mb-2 fs10" style="table-layout: fixed; width: 100%; page-break-inside: avoid;">
                                                    <tr>
                                                        <td style="width: 90px" class="text-center" rowspan="3">
                                                            <div>Tuổi thai <br /> hiệu chỉnh</div>
                                                            <div class="en">Gestation (Corrected age)</div>
                                                        </td>
                                                        <td class="text-center" colspan="5">< 28 tuần / <span class="en"><28 weeks</span>: <span class="font-bold">+3</span></td>
                                                        <td class="p-1 text-center" style="width: 50px">
                                                            <asp:Label runat="server" ID="prt_npass_gestation_3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center" colspan="5">28-31 tuần / <span class="en">28-31 weeks</span>: <span class="font-bold">+2</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_gestation_2" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center" colspan="5">32-35 tuần / <span class="en">32-35 weeks</span>: <span class="font-bold">+1</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_gestation_1" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-right font-bold" colspan="6">Tổng điểm/ <span class="en">Total score</span></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="prt_npass_total_score" ></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            
                                            <div style="display: grid; grid-template-columns: 100px 1fr 1fr 200px; gap: 10px; margin-left: 16px;" class="mt-2 mb-2">
                                                <div class="font-bold">
                                                    <div>Kết luận: </div>
                                                    <div class="en">Conclude</div>
                                                </div>
                                                <div>
                                                    <div><asp:Label runat="server" ID="prt_npass_conclude_0" /> Không đau (0) </div>
                                                    <div style="margin-left: 18px" class="en">No pain</div>
                                                </div>
                                                <div>
                                                    <div><asp:Label runat="server" ID="prt_npass_conclude_1" /> Đau nhẹ (1-3)</div>
                                                    <div style="margin-left: 18px" class="en">Slight pain</div>
                                                </div>
                                                <div>
                                                    <div><asp:Label runat="server" ID="prt_npass_conclude_2" /> Đau vừa – nhiều (> 3)</div>
                                                    <div style="margin-left: 18px" class="en">Considerable - Serious pain</div>
                                                </div>
                                            </div>
                                        </section>
                                            
                                        <section runat="server" id="prt_nonv_wrapper" class="pt1">
                                            <div>Đối với người bệnh không nói được điều dưỡng đánh giá riêng trên biểu mẫu (AIH-FRM-021 - Thang điểm theo dõi phản ứng đau của người bệnh không nói được)</div>
                                            <div class="en">Nurses use a separated form to evaluate non-verbal patients (AIH-FRM-021 - Behavioural pain scale for non-verbal adult patient)</div>
                                        </section>

                                        <div><span class="font-bold">6. Trở ngại chăm sóc/ <span class="en">Barrier to care</span></span></div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 160px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                <div>- Trở ngại về ngôn ngữ:</div>
                                                <div class="en" style="margin-left: 10px">Language Barriers</div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_language_false" /> Không</div>
                                                <div class="en" style="margin-left: 16px">No</div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_language_true" />  Có, giải thích:</div>
                                                <div class="en" style="margin-left: 16px">Yes, explain</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_btc_language_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 160px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                <div>- Trở ngại về nhận thức:</div>
                                                <div class="en" style="margin-left: 10px"><i>Cognitive Barriers</i></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_cognitive_false" /> Không</div>
                                                <div class="en" style="margin-left: 16px"><i>No</i></div></div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_cognitive_true" /> Có, giải thích:</div>
                                                <div class="en" style="margin-left: 16px"><i>Yes, explain</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_btc_cognitive_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 160px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                <div>- Trở ngại về Giác quan:</div>
                                                <div class="en" style="margin-left: 16px"><i>Sensory Barriers</i></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_sensory_false" /> Không</div>
                                                <div class="en" style="margin-left: 16px"><i>No</i></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_sensory_true" /> Có, giải thích:</div>
                                                <div class="en" style="margin-left: 16px"><i>Yes, explain</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_btc_sensory_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 160px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                <div>- Trở ngại về Tôn giáo:</div>
                                                <div class="en" style="margin-left: 10px"><i>Religious Barriers</i></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_religious_false" /> Không</div>
                                                <div class="en" style="margin-left: 16px"><i>No</i></div></div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_religious_true" /> Có, giải thích:</div>
                                                <div class="en" style="margin-left: 16px"><i>Yes, explain</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_btc_religious_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 160px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                <div>- Trở ngại về Văn hóa:</div>
                                                <div class="en" style="margin-left: 10px"><i>Cultural Barriers</i></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_cultural_false" /> Không</div>
                                                <div class="en" style="margin-left: 16px"><i>No</i></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_btc_cultural_true" /> Có, giải thích:</div>
                                                <div class="en" style="margin-left: 16px"><i>Yes, explain</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_btc_cultural_note" />
                                        </div>

                                        <div class="font-bold">7. Tầm soát nguy cơ té ngã/ <span class="en">Fall risk screening</span></div>

                                        <div style="margin-left: 16px;">
                                            <span class="font-bold">- Các yếu tố nguy cơ/ <span class="en">Fall risk factors: </span></span>
                                            <asp:Label runat="server" ID="prt_fall_risk_factor_nfr">Không có yếu tố nguy cơ/ No fall risk</asp:Label>
                                        </div>

                                        <div runat="server" id="prt_fall_risk_factor_nfr_wrapper">
                                            <div runat="server" id="prt_fall_risk_factor" style="margin-left: 25px; display: grid; grid-template-columns: 350px 1fr; grid-gap: 6px">
                                                <div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_agr" /> 
                                                        <div>Tuổi > 65/ <span class="en">Age > 65</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_pre" /> 
                                                        <div>Phụ nữ có thai/ <span class="en">Pregnant women</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_ina" /> 
                                                        <div>Không có khả năng đứng lên từ ghế/ <span class="en">Inability to rise from a chair</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_pod" /> 
                                                        <div>Mất trí nhớ/ <span class="en">Presence of dementia</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_imp" />
                                                        <div>Giảm/ Mất thị lực/ <span class="en">Patients with visual impairments</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_ear" /> 
                                                        <div>Bệnh nhân có vấn đề về tai có triệu chứng chóng mặt/ <span class="en">Patients have ear problems with complaints of dizziness and/or vertigo</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_psy" /> 
                                                        <div>Đang sử dụng bất kỳ thuốc thuộc nhóm an thần/ <span class="en">Any Administered Psycholeptics:</span> Diazepam, Tofisopam, Eszopiclone, Midazolam, Rotudin, Etifoxine chlorhydrate</div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_ade" /> 
                                                        <div>Đang sử dụng bất kỳ thuốc thuộc nhóm chống trầm cảm/ <span class="en">Any Administered Antidepressant:</span> Citalopram, SERTRAline, Amitriptyline, Mirtazapine</div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_aps" /> 
                                                        <div>Đang sử dụng bất kỳ thuốc thuộc nhóm điều trị loạn thần/ <span class="en">Any administered antipsychotic: Haloperidol, Olanzapine, Quetiapine, Risperidone, Olanzapine, Quetiapine</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_aco" />
                                                        <div>Đang sử dụng bất kỳ thuốc chống đông máu/ <span class="en">Any administered anticoagulant: Heparin Sodium, Anoxaparin, Rivaroxaban, Acenocoumarol...</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;display: none">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_nfr" />
                                                        <div>Không có yếu tố nguy cơ/ <span class="en">No fall risk</span></div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_ale" /> 
                                                        <div>Tuổi < 3/ <span class="en">Age < 3</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_amb" /> 
                                                        <div>Sử dụng phương tiện hỗ trợ đi lại (gậy/nạng/khung tập đi)/ <span class="en">mbulatory devices (canes, crutches, and walkers)</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_pat" /> 
                                                        <div>Dáng đi yếu hoặc mất thăng bằng/ <span class="en">Patients with gait or balance disturbances</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_aep" /> 
                                                        <div>Đang sử dụng bất kỳ loại thuốc thuộc nhóm chống động kinh, chống co giật/ <span class="en">Any administered Antiepileptics, Anticonvulsants: Cardamazepine, Divolproex Sodium, Gabapentin, Lamotrigine, Phenobarbital, Phenytoin, Topiramate, Valproic Acid, Levetiracetam, Pregabalin</span></div>
                                                    </div>
                                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px">
                                                        <asp:Label runat="server" ID="prt_fall_risk_factors_ahy" /> 
                                                        <div>Đang sử dụng bất kỳ thuốc thuộc nhóm điều trị tăng huyết áp/ <span class="en">Any administered Antihypertensive Medication: Captopril, Perindopril and amlodipine, Irbesartan and diuretics, Valsartan, Nifedipine, Lisinopril, Furosemide + Spironolacton, BISOprolol, METOprolol succinate...</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="margin-left: 16px" class="font-bold">- Câu hỏi sàng lọc/ <span class="en">The fall risk screening questions:</span></div>
                                        
                                            <div style="margin-left: 16px; display: grid; grid-template-columns: 1fr 220px; gap: 6px;">
                                                <div>
                                                    <div>a. Anh/chị/ông/bà có từng bị ngã trong 12 tháng gần đây không?</div>
                                                    <div class="en" style="margin-left: 16px">Have you fallen in the past year?</div>
                                                </div>
                                                <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 24px">
                                                    <div>
                                                        <div><asp:Label runat="server" ID="prt_fallen_true"/> Có</div>
                                                        <div class="en" style="margin-left: 18px">Yes</div>
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="prt_fallen_false"/> Không 
                                                        <div class="en" style="margin-left: 18px">No</div>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                            <div style="margin-left: 16px; display: grid; grid-template-columns: auto 1fr; gap: 6px;">
                                                <div>
                                                    <div>b. Anh/chị/ông/bà có cảm thấy bị mất thăng bằng lúc đứng dậy hoặc lúc đi không?</div>
                                                    <div class="en" style="margin-left: 16px"><i>Do you feel unsteady when standing or walking?</i></div>
                                                </div>
                                                <div style="display: grid; grid-template-columns: auto 1fr; gap: 6px">
                                                    <div>
                                                        <div><asp:Label runat="server" ID="prt_feel_unsteady_true" /> Có </div>
                                                        <div><span style="margin-left: 18px" class="en" ><i>Yes</i></span> </div>
                                                    </div>
                                                    <div>
                                                        <div><asp:Label runat="server" ID="prt_feel_unsteady_false" /> Không  </div>
                                                        <div><span style="margin-left: 18px" class="en" ><i>No</i></span> </div>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                            <div style="margin-left: 16px; display: grid; grid-template-columns: 1fr 220px; gap: 6px;">
                                                <div>
                                                    <div>c. Anh/chị/ông/bà có lo sợ bị ngã không?</div>
                                                    <div class="en" style="margin-left: 16px"><i>Do you worry about falling?</i></div>
                                                </div>
                                                <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 24px">
                                                    <div>
                                                        <div><asp:Label runat="server" ID="prt_worry_about_falling_true" /> Có </div>
                                                        <div class="en" style="margin-left: 18px">Yes</div>
                                                    </div>
                                                    <div>
                                                        <div><asp:Label runat="server" ID="prt_worry_about_falling_false" /> Không</div>
                                                        <div class="en" style="margin-left: 18px">No</div>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                            <div style="margin-left: 16px">- <span class="font-bold"> Can thiệp/ <span class="en">Intervention</span>:</span></div>
                                    
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_uni" /> 
                                                <div>Phòng ngừa té ngã thường quy/ <span class="en">Universe fall risk prevention</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_sti" /> 
                                                <div>Dán sticker nguy cơ ngã/ <span class="en">Stick fall-risk on patient's shirt</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_edu" /> 
                                                <div>Thông báo nguy cơ té ngã cho người bệnh/ người nhà/ <span class="en">Educate the fall risk to patient/ Relatives</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_ass" /> 
                                                <div>Trợ giúp người bệnh di chuyển, đi lại/ <span class="en">Assist patient with transfer/ ambulation</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_str" /> 
                                                <div>Cung cấp dụng cụ hỗ trợ di chuyển (Băng ca, xe đẩy...)/ <span class="en">Assist patient with transfer/ ambulation (Stretcher, wheelchair)</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_epa" /> 
                                                <div>Hướng dẫn ba mẹ/ người thân bệnh nhi luôn quan sát bé cẩn thận và luôn ở cùng bé/ <span class="en">Educate Parents to keep an eye on their children closely and never let him/her alone</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_ins" /> 
                                                <div>Hướng dẫn ba mẹ/ người thân bệnh nhi hạn chế cho bé chạy nhảy/ Instruct Parents/ <span class="en">accompanying family members limit the child to run</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_enc" /> 
                                                <div>Khuyến khích di chuyển bằng nôi/ xe nôi đối với trẻ sơ sinh và nhủ nhi/ <span class="en">Encourage parents/ Caregivers to use cribs for newborn/ neonatal in moving</span></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 4px;margin-left: 16px">
                                                <asp:Label runat="server" ID="prt_intervention_pfr" /> 
                                                <div>Đeo vòng tay nguy cơ ngã khi/ <span class="en">Place Fall Risk ID bracelet on patient in cases of:</span></div>
                                            </div>
                                            <div style="margin-left: 16px">• Người bệnh có chỉ định nhập viện nguy cơ té ngã cao/ <span class="en">High fall risk patients with admission order</span></div>
                                            <div style="margin-left: 16px; margin-right: -10px">• Người bệnh sau thủ thuật có gây tê hoặc gây mê/ <span class="en">Patients after procedure under local or general anesthesia</span></div>
                                            <div style="margin-left: 16px">• Người bệnh hóa trị liệu/ <span class="en">Patients with chemotherapy</span></div>
                                            <div style="margin-left: 16px">• Người bệnh được truyền dịch/ <span class="en">Patients with fluid infusion</span></div>
                                        </div>

                                        <div><span class="font-bold">8. Sàng lọc dinh dưỡng/ <span class="en">Nutrition screening:</span></span></div>

                                        <table class="table-bordered" style="width: 100%">
                                            <tr>
                                                <td class="p-1">
                                                    <span class="font-bold">BMI</span> = Chỉ số khối cơ thể / BMI
                                                </td>
                                                <td style="width: 80px" class="text-center">
                                                    <asp:Label runat="server" ID="prt_bmi"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-1">
                                                    <div><span class="font-bold">Cân nặng 3 tháng trước/ <span class="en">The weight of 3 last month</span></span></div>
                                                    <div>* Đối với trẻ sơ sinh < 3 tháng tuổi, điền thông tin cân nặng lúc sinh</div>
                                                    <div class="en"><i>For infants < 3 months old, please insert birth weight</i></div>
                                                </td>
                                                <td class="text-center">
                                                    <asp:Label runat="server" ID="prt_previous_weight"/>&nbsp;kg
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-1">
                                                    <div><span class="font-bold">% cân nặng thay đổi</span></div>
                                                    <div class="en"><span class="font-bold">% weight change</span></div>
                                                </td>
                                                <td class="text-center">
                                                    <asp:Label runat="server" ID="prt_weight_change"></asp:Label>&nbsp;%
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="text-center mt-1">Khoanh tròn chỉ 1 số trong mỗi câu/ <span class="en">Circle only 1 number in each criterion</span></div>

                                        <div><span class="font-bold mt-2">- Tình trạng dinh dưỡng/ <span class="en">Nutrition status:</span></span></div>
                                        
                                        <div>(Lưu ý; Không áp dụng cho phụ nữ mang thai/ <span class="en">Note: Not applicable for pregnant women)</span></div>

                                        <table class="table-bordered" style="width: 100%; page-break-inside: avoid;margin-bottom: -1px">
                                            <tr>
                                                <td rowspan="3" class="text-center font-bold">
                                                    <div>Trẻ ≤ 5 tuổi </div>
                                                    <div class="en">Children ≤ 5 years old</div>
                                                </td>
                                                <td class="p-1 text-center" style="width: 430px">
                                                    <div>Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -2 độ lệch tiêu chuẩn (SD)</span></div>
                                                    <div class="en">Weight for length/height ≤ <span class="font-bold">-2 standard deviation (SD)</span></div>
                                                </td>
                                                <td style="width: 80px" class="p-1 text-center">
                                                    <asp:Label runat="server" ID="prt_ns_l_2">2</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">
                                                    <div>Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold">-1 độ lệch tiêu chuẩn (SD) </span></div>
                                                    <div class="en">Weight for length/height ≤ <span class="font-bold">-1 standard deviation (SD)</span></div>
                                                </td>
                                                <td class="p-1 text-center">
                                                    <asp:Label runat="server" ID="prt_ns_l_1">1</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">
                                                    <div>Cân nặng theo chiều dài/chiều cao > <span class="font-bold">-1 độ lệch tiêu chuẩn (SD)</span></div>
                                                    <div class="en">Weight for length/height > <span class="font-bold">-1 standard deviation (SD)</span></div>
                                                </td>
                                                <td class="p-1 text-center">
                                                    <asp:Label runat="server" ID="prt_ns_l_0">0</asp:Label>
                                                </td>
                                            </tr>
                                        </table>

                                        <table class="table-bordered" style="width: 100%; page-break-inside: avoid;margin-bottom: -1px">
                                            <tr>
                                                <td rowspan="3" class="text-center">
                                                    <div class="font-bold">Trẻ > 5 tuổi </div>
                                                    <div class="en">Children > 5 years old</div>
                                                </td>
                                                <td class="p-1 text-center" style="width: 430px">
                                                    BMI theo tuổi ≤ <span class="font-bold"> -2SD</span>/<span class="en">BMI for age ≤ <span class="font-bold">-2SD</span></span>
                                                </td>
                                                <td class="p-1 text-center" style="width: 80px"><asp:Label runat="server" ID="prt_ns_g_2">2</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">
                                                    BMI theo tuổi ≤ <span class="font-bold"> -1SD</span>/<span class="en">BMI for age ≤ <span class="font-bold">-1SD</span></span>
                                                </td>
                                                <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_g_1">1</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">
                                                    BMI theo tuổi > <span class="font-bold"> -1SD</span>/<span class="en">BMI for age > <span class="font-bold">-1SD</span></span>
                                                </td>
                                                <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_g_0">0</asp:Label></td>
                                            </tr>
                                        </table>

                                        <table class="table-bordered" style="width: 100%; page-break-inside: avoid">
                                            <tr>
                                                <td class="p-1 text-center" rowspan="3">
                                                    <div class="font-bold">Người lớn</div>
                                                    <div class="en">Adult patients</div>
                                                </td>
                                                <td class="p-1 text-center" style="width: 430px">
                                                    BMI < <span class="font-bold"> 18,5</span>
                                                </td>
                                                <td class="p-1 text-center" style="width: 80px"><asp:Label runat="server" ID="prt_ns_a_2">2</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">
                                                    BMI từ /<span class="en">from </span><span class="font-bold"> 18,5 - 20</span>
                                                </td>
                                                <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_a_1">1</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">
                                                    BMI ><span class="text-bold"><span class="font-bold">20</span></span>
                                                </td>
                                                <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_a_0">0</asp:Label></td>
                                            </tr>
                                        </table>

                                        <div><span class="font-bold mt-2">- Sụt cân không chủ ý trong 3 tháng gần đây/ <span class="en">Unintentional weight loss in the last 3 months:</></span></div>
                                        <div><span style="font-size: 10pt">Lưu ý: Xem "% cân nặng thay đổi" ở trên, nếu số liệu = 0: Không sụt cân; nếu số liệu <0: sụt cân; nếu số liệu >0: tăng cân</span></div>
                                        <div class="en"><span style="font-size: 9.5pt">Note: Based on the box "% weight change" above: if data =0; no weight loss, if data <0: weight loss, if data >0: weight gain</span></div>

                                        <table class="table-bordered" style="width: 100%">
                                            <tr>
                                                <td class="p-1 text-center">Giảm > <span class="font-bold">10%</span>/ <span class="en">Weight loss > <span class="font-bold">10%</span></span></td>
                                                <td style="width: 80px" class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_loss_weight_2">2</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">Giảm từ <span class="font-bold">5 - 10%</span> / <span class="en">Weight loss from <span class="font-bold">5 - 10%</span></span></td>
                                                <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_loss_weight_1">1</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">
                                                    Giảm < <span class="font-bold">5%</span> / <span class="en">Weight loss < <span class="font-bold">5%</span></span>
                                                    <div>Hoặc <span class="font-bold">không sụt cân</span>/ <span class="en">Or <span class="font-bold">no weight loss</span></span></div>
                                                    <div>Hoặc <span class="font-bold">tăng cân</span>/ <span class="en">Or <span class="font-bold">weight gain</span></span></div>
                                                </td>
                                                <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_loss_weight_0">0</asp:Label></td>
                                            </tr>
                                        </table>

                                        <div><span class="font-bold mt-2">- Khả năng ăn uống/ <span class="en">Food intake:</span></span></div>

                                        <table class="table-bordered" style="width: 100%">
                                            <tr>
                                                <td class="p-1 text-center">Ăn uống kém hơn <span class="font-bold">5 ngày</span> gần đây/ <span class="en">Eating less than the last <span class="font-bold">5 days</span></i></td>
                                                <td style="width: 80px" class="p-1 text-center">
                                                    <asp:Label runat="server" ID="prt_ns_food_intake_2">2</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-center">Ăn uống bình thường/ <span class="en">Eating normally</span></td>
                                                <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_food_intake_0">0</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td class="p-1 text-right font-bold">Tổng điểm/ <span class="en">Total score</span></td>
                                                <td class="text-center">
                                                    <asp:Label runat="server" ID="prt_ns_total_score" />
                                                </td>
                                            </tr>
                                        </table>

                                        <div style="display: grid; grid-template-columns: 1fr auto auto; gap: 6px;" class="mt-2 mb-2">
                                            <div>
                                                <div><span class="font-bold">Kết luận:</span></div>
                                                <div class="en">Conclude</div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_nutritional_conclude_0" /> Không có nguy cơ thiếu dinh dưỡng (<2)</div>
                                                <div class="en" style="margin-left: 14px"><i>No risk of malnutrition</i></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_nutritional_conclude_2" /> Có nguy cơ thiếu dinh dưỡng (≥2)</div>
                                                <div class="en" style="margin-left: 14px"><i>Risk of malnutrition</i></div>
                                            </div>
                                        </div>

                                        <div><span style="font-weight: bold">III. ĐÁNH GIÁ CÁC YẾU TỐ KINH TẾ XÃ HỘI CỦA NGƯỜI BỆNH</span></div>
                                        <div class="en" style="margin-left: 24px; font-weight: bold">SOCIAL ECONOMICS FACTOR ASSESSMENT</div>
                                    
                                        <div style="margin-left: 18px; display: grid; grid-template-columns: 1fr auto auto; gap: 6px;">
                                            <div>Tình trạng sinh sống/ <span class="en">Housing:</span></div>
                                            <div><asp:Label runat="server" ID="prt_housing_code_aln" /> Sống một mình/ <span class="en">Lives alone</span></div>
                                            <div><asp:Label runat="server" ID="prt_housing_code_rel" /> Sống với người thân/ <span class="en">With relatives</span></div>
                                        </div>

                                        <div class="font-bold">IV. MỨC ĐỘ ƯU TIÊN/ <span class="en">PRIORITIZATION</span></div>
                                
                                        <div style="margin-left: 24px; margin-right: -15px; margin-bottom: 6px"><asp:Label runat="server" ID="prt_prioritization_code" /></div>
                                        
                                        <asp:PlaceHolder runat="server" ID="ph_prt_im_consul_req">
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_eme" /> Tình trạng nặng cần xử trí ngay/ <span class="en">Emergency cases</span></div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_chi" /> Trẻ em dưới 6 tuổi/ <span class="en">Children are under 6 years of age</span></div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_ser" /> Người khuyết tật nặng/ <span class="en">Servere disabilities</span></div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_pat" /> Người bệnh trên 80 tuổi/ <span class="en">Patient are over 80 years of age</span></div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_pre" /> Phụ nữ có thai trên 24 tuần/ <span class="en">Prenancy is over 24 weeks.</span></div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_boo" /> Người bệnh có hẹn/ <span class="en">Booked appointment patients.</span></div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_oth" /> Trường hợp khác/ <span class="en">Other:</span> <asp:Label runat="server" ID="prt_im_consul_req_oth_note" /></div>
                                        </asp:PlaceHolder>
                                
                                        <div class="font-bold">V. NHU CẦU GIÁO DỤC SỨC KHỎE/ <span class="en">PATIENT EDUCATION NEEDS</span></div>

                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_fal" /> Phòng ngừa té ngã/ <span class="en">Fall risk prevention</span></div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_wou" /> Chăm sóc vết thương/ <span class="en">Wound care</span></div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_die" /> Chế độ ăn uống/ <span class="en">Diet</span></div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_pai" /> Đau/ <span class="en">Pain</span></div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_oth" /> Khác/ <span class="en">Others: </span><asp:Label runat="server" ID="prt_patient_education_need_oth_note" /></div>

                                        <div>&nbsp;</div>
                                        <div style="display: grid; grid-template-columns: 1fr auto; grid-gap: 5px">
                                            <div></div>
                                            <div style="text-align: center; break-inside: avoid !important; page-break-inside: avoid !important">
                                                <div><asp:Label runat="server" ID="prt_signature_date"></asp:Label></div>
                                                <div><span style="font-weight: bold">Điều dưỡng đánh giá/ <span class="en">Assessment done by nurse</span></span></div>
                                                <div><span>(Họ tên, chữ ký và MSNV)/ <span class="en">(Full name, signature and ID)</span></span></div>
                                                <div><asp:Label runat="server" ID="prt_signature_name" /></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" style="border: 1px solid #000;" runat="server" id="print_footer">
                                    <img style="width: 100%" src="../images/ExcellentCare.png" />
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
        <%--<telerik:RadWindow IconUrl="/images/AIH_Logo.jpg" Width="500" Modal="true" VisibleStatusbar="false" Behaviors="Close,Move" Opacity="1" BackColor="#515e7b80" ID="rwndLogHistory" Title="Version History" runat="server">
            <ContentTemplate>
                <asp:UpdatePanel runat="server" ID="uplLogHistory" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ShowHeader="false" ID="rgdLogHistory" OnLoad="rgdLogHistory_Load" runat="server" AllowSorting="true" OnItemDataBound="rgdLogHistory_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# LogInfor(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'></telerik:RadLabel>
                                            <asp:LinkButton CommandName="Open" PostBackUrl='<%# LogUrl(Eval("document_log_id"))%>' ToolTip="View Log" runat="server" ID="rlbtnViewLog">
                                                [view]
                                            </asp:LinkButton>
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
                </asp:UpdatePanel>
            </ContentTemplate>
        </telerik:RadWindow>--%>

        <div class="cssclsNoPrint">
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0; border-bottom: 1px solid #ddd; border-radius: 0;">
                <li><asp:LinkButton runat="server" ID="btnHome" OnClick="RedirectToPatientSummary">Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                <li>Outpatient Initial Nursing Assessment</li>
            </ul>
            <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <div class="card" runat="server" id="amendReasonWraper">
                        <div class="card-body">
                            <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span><br /><span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                            <div class="form-group mb-2">
                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                </asp:Panel>
                <%-- Patient Info --%>
                <webUI:PatientInfo runat="server" ID="uc_patientInfo"></webUI:PatientInfo>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body mb-4">
                                    <%-- Update 08/10/2022 --%>
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
                                    <div><span class="font-bold">I. DẤU HIỆU SINH TỒN VÀ CÁC CHỈ SỐ ĐO LƯỜNG</span>/ <i class="text-primary">VITAL SIGNS AND PHYSICAL MEASUREMENTS</i></div>
                                    <div style="display: grid; grid-gap: 4px; grid-template-columns: 240px 1fr" class="mb-2">
                                        <div class="text-right">Nhiệt độ/ <i class="text-primary">Temperature:</i></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_vs_temperature"/>
                                            <div runat="server" id="vs_temperature_wrapper" style="display: inline-block">
                                                <input id="txt_vs_temperature" 
                                                       data-type="number" 
                                                       style="width: 160px" 
                                                       runat="server" 
                                                       class="form-control text-right" />
                                            </div>
                                            °C
                                        </div>

                                        <div class="text-right">Cân nặng/ <i class="text-primary">Weight:</i></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_vs_weight"/>
                                            <div runat="server" id="vs_weight_wrapper" style="display: inline-block">
                                                <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <input onchange="__doPostBack('vs_weight_change', false)" 
                                                                id="txt_vs_weight" 
                                                                data-type="number" 
                                                                style="width: 160px" 
                                                                runat="server" 
                                                                class="form-control text-right" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            kg
                                        </div>

                                        <div class="text-right">Chiều cao/ <i class="text-primary">Height:</i></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_vs_height"/>
                                            <div runat="server" id="vs_height_wrapper" style="display: inline-block">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <input id="txt_vs_height" 
                                                                onchange="__doPostBack('vs_height_change', false)"  
                                                                data-type="number" 
                                                                style="width: 160px" 
                                                                runat="server" 
                                                                class="form-control text-right" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            cm
                                        </div>

                                        <div style="display: none">
                                            <div class="text-right">Chỉ số khối cơ thể/ <i class="text-primary">BMI</i></div>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_vs_bmi"></asp:Label>
                                                <div runat="server" id="vs_bmi_wrapper">
                                                    <input onchange="vs_bmi_change()" 
                                                        id="txt_vs_bmi" 
                                                        data-type="number" 
                                                        style="width: 120px; height: 23.2px;" 
                                                        runat="server" 
                                                        disabled="disabled" 
                                                        class="form-control text-right" />
                                                    <span class="append">(Kg/m <sup>2</sup>)</span>
                                                </div>
                                                <asp:Label runat="server" ID="bmiStr"></asp:Label>
                                                <div>(Không áp dụng cho trẻ em và phụ nữ có thai/ <i class="text-primary">not applicable for children and pregnant</i>)</div>
                                            </div>
                                        </div>

                                        <div class="text-right">Vòng đầu (trẻ em < 2 tuổi)/ <i class="text-primary">Head circumference (children <2 years old)</i></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_pulse"/>
                                            <div runat="server" id="pulse_wrapper" style="display: inline-block">
                                                <input id="txt_pulse" 
                                                        data-type="number" 
                                                        style="width: 160px" 
                                                        runat="server" 
                                                        class="form-control text-right" />
                                            </div>
                                            cm
                                        </div>

                                        <div class="text-right">Mạch/ <i class="text-primary">Pulse:</i></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_vs_heart_rate"/>
                                            <div runat="server" id="vs_heart_rate_wrapper" style="display: inline-block">
                                                <input id="txt_vs_heart_rate" 
                                                        data-type="number" 
                                                        style="width: 160px" 
                                                        runat="server" 
                                                        class="form-control text-right" />
                                            </div>
                                            nhịp/phút
                                        </div>

                                        <div class="text-right">Nhịp thở/ <i class="text-primary">Respiratory rate:</i></div>                                                
                                        <div>
                                            <asp:Label runat="server" ID="lbl_vs_respiratory_rate" />
                                            <div runat="server" id="vs_respiratory_rate_wrapper" style="display: inline-block">
                                                <input  id="txt_vs_respiratory_rate" 
                                                        data-type="number" 
                                                        style="width: 160px" 
                                                        runat="server" 
                                                        class="form-control text-right" />
                                            </div>
                                            lần/phút/ <i class="text-primary">bpm</i>
                                        </div>

                                        <div class="text-right">Huyết áp/ <i class="text-primary">Blood pressure:</i></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_vs_blood_pressure" />
                                            <div runat="server" id="vs_blood_pressure_wrapper" style="display: inline-block">
                                                <input id="txt_vs_blood_pressure" 
                                                        style="width: 160px" 
                                                        runat="server" 
                                                        class="form-control text-right" />
                                            </div>
                                            mmHg
                                        </div>
                                            
                                        <div class="text-right">Độ bão hòa Oxy/ <i class="text-primary">SpO<sub>2</sub>:</i></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_vs_spo2"/>
                                            <div runat="server" id="vs_spo2_wrapper" style="display: inline-block">
                                                <input id="txt_vs_spo2"  
                                                        data-type="number" 
                                                        style="width: 160px" 
                                                        runat="server" 
                                                        class="form-control text-right" />
                                            </div>
                                            %
                                        </div>
                                    </div>

                                    <div><span class="font-bold">II. ĐÁNH GIÁ</span>/ <i class="text-primary">ASSESSMENT</i></div>
                                    <div><span class="font-bold">1. Lý do đến khám</span>/ <i class="text-primary">Chief complaint:</i></div>
                                            
                                    <div class="mb-2">
                                        <asp:Label runat="server" ID="lbl_chief_complaint" />
                                        <div runat="server" id="chief_complaint_wrapper">
                                            <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                        </div>
                                    </div>

                                    <div><span class="font-bold">2. Dị ứng</span>/ <i class="text-primary">Allergy:</i></div>
                                    <div>
                                        <div></div>
                                        <div>
                                            <div runat="server" id="allergy_wrapper">
                                                <asp:UpdatePanel ID="up_allergy" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div style="display: grid; grid-template-columns: 100px auto; grid-gap: 6px">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('allergy_change', false)"/>
                                                                <label class="custom-control-label" for="rad_allergy_false">Không/ <i class="text-primary">No</i></label>
                                                            </div>

                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('allergy_change', true)"/>
                                                                <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <i class="text-primary">Yes, specify:</i></label>
                                                            </div>
                                                        </div>
                                                        <div runat="server" id="field_allergy_true">
                                                            <webUI:TextField runat="server" ID="txt_allergy_note" TextMode="SingleLine" />
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="pt1">
                                                <asp:Label runat="server" ID="lbl_allergy" />
                                            </div> 
                                        </div>
                                    </div>

                                    <div><span class="font-bold">3. Trạng thái tinh thần</span>/ <i class="text-primary">Mental status:</i></div>

                                    <div class="mb-2">
                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div style="display: grid; grid-template-columns: 280px 1fr; grid-gap: 6px">
                                                    <div><span class="font-bold">Đáp ứng phù hợp</span>/ <i class="text-primary">Appropriate response:</i></div>
                                                    <asp:Label runat="server" ID="lbl_mental_status" />
                                                    <div runat="server" id="mental_status_wrapper" style="display: grid; grid-template-columns: 100px auto; grid-gap: 6px">
                                                        <div class="custom-control custom-radio">
                                                            <input runat="server" 
                                                                    type="radio" 
                                                                    id="rad_mental_status_true"
                                                                    name="rad_mental_status" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('mental_status_change', true)"/>
                                                            <label class="custom-control-label" for="rad_mental_status_true">Có/ <i class="text-primary">Yes</i></label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input runat="server"
                                                                    type="radio" 
                                                                    id="rad_mental_status_false" 
                                                                    name="rad_mental_status" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('mental_status_change', false)"/>
                                                            <label class="custom-control-label" for="rad_mental_status_false">No, ghi rõ/ <i class="text-primary">No, specify:</i></label>
                                                        </div>
                                                        <div runat="server" id="field_mental_status_false" style="grid-column: 1/4">
                                                            <webUI:TextField runat="server" ID="txt_mental_status_note" TextMode="SingleLine" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div><span class="font-bold">4. Tầm soát bệnh lây nhiễm (dành cho những bệnh tạo thành dịch)</span>/ <i class="text-primary">Communicable disease screening (for diseases that cause epidemics):</i><asp:Label runat="server" ID="Label2" /></div>

                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                        <table class="table-bordered w-100 mb-2">
                                            <tr>
                                                <td style="width: 150px;" class="text-center">Phân loại <br /><i class="text-primary">Category</i></td>
                                                <td class="text-center">Tiêu chí <br /><i class="text-primary">Criteria</i></td>
                                                <td style="width: 50px;" class="text-center">Có <br /><i class="text-primary">Yes</i></td>
                                                <td style="width: 50px;" class="text-center">Không <br /><i class="text-primary">No</i></td>
                                            </tr>
                                            <tr>
                                                <td class="text-center">Triệu chứng <br /><i class="text-primary">Signs and symptoms</i></td>
                                                <td>Sốt > 38 C và ho, khó thở, tiêu chảy,... <br /><i class="text-primary">Fever > 38 C and cough, dyspnea, diarrhea</i></td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_high_fever_true" 
                                                                name="rad_high_fever" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('high_fever_change', true)"/>
                                                        <label class="custom-control-label" for="rad_high_fever_true"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_high_fever_false" 
                                                                name="rad_high_fever" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('high_fever_change', false)"/>
                                                        <label class="custom-control-label" for="rad_high_fever_false"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center" rowspan="2">Dịch tễ <br /><i class="text-primary">Epidemiology</i></td>
                                                <td>Đi từ hay tiếp xúc với người đi từ vùng dịch trong vòng 2 tuần <br /><i class="text-primary">History of travel and in contact with injectious disease outbreak in the past 2 weeks</i></td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_contact_infectious_disease_true" 
                                                                name="rad_infected_with_covid" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('contact_infectious_disease_change', true)"/>
                                                        <label class="custom-control-label" for="rad_contact_infectious_disease_true"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_contact_infectious_disease_false" 
                                                                name="rad_infected_with_covid" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('contact_infectious_disease_change', false)"/>
                                                        <label class="custom-control-label" for="rad_contact_infectious_disease_false"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tiếp xúc gần với người bị sốt, ho, khó thở <br /><i class="text-primary">Had close contact with someone who has fever, cough, dyspnea</i></td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_close_contact_true" 
                                                                name="rad_close_contact" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('close_contact_change', true)"/>
                                                        <label class="custom-control-label" for="rad_close_contact_true"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_close_contact_false" 
                                                                name="rad_close_contact" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('close_contact_change', false)"/>
                                                        <label class="custom-control-label" for="rad_close_contact_false"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center">Đánh giá <br /> <i class="text-primary">Assessment</i></td>
                                                <td>Có nguy cơ truyền nhiễm <br /> <i class="text-primary">Injectious risk</i></td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio"
                                                                runat="server" 
                                                                id="rad_injectious_risk_true" 
                                                                name="rad_injectious_risk" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('injectious_risk_change', true)"/>
                                                        <label class="custom-control-label" for="rad_injectious_risk_true"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_injectious_risk_false" 
                                                                name="rad_injectious_risk" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('injectious_risk_change', false)"/>
                                                        <label class="custom-control-label" for="rad_injectious_risk_false"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div class="mb-2">
                                        <div>• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ triệu chứng, chuyển bệnh nhân sang phòng khám sàng lọc/ <i class="text-primary">If <span class="font-bold">"YES"</span> Signs and symptom risks, transfer patient to screening clinic.</i></div>
                                        <div>• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ dịch tể, chuyển bệnh nhân đến phòng cách ly áp lực âm cấp cứu/ <i class="text-primary">If <span class="font-bold">"YES"</span> epidemic risks, transfer patient to Isolation room in Emergency Department.</i></div>
                                        <div>• Nếu <span class="font-bold">"KHÔNG"</span> tiếp tục hoàn thành tiểu mục 5, 6, 7, 8/ <i class="text-primary">If <span class="font-bold">"NO"</span> complete part 5, 6, 7, 8 assessment.</i></div>
                                    </div>
                                            
                                    <div><span class="font-bold">5. Đánh giá đau</span>/ <i class="text-primary">Pain assessment:</i></div>
                                    <div>Điều dưỡng đánh giá chọn một trong các thang điểm đau bên dưới phù hợp với từng người bệnh.</div>
                                    <div><i class="text-primary">Nurses select one of the following pain scales in consistent with each sort of patient.</i></div>
                                            <div runat="server" id="pain_assessment_scale_wrapper" style="display: grid; grid-template-columns: 160px repeat(4, 100px); grid-gap: 6px">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" 
                                                                    runat="server" 
                                                                    id="rad_naf_true" 
                                                                    name="rad_pain_assessment" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('pain_assessment_change', 'field_naf')"  />
                                                            <label class="custom-control-label" for="rad_naf_true">Numeric and Faces</label>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" 
                                                                    runat="server" 
                                                                    id="rad_flacc_true" 
                                                                    name="rad_pain_assessment" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('pain_assessment_change', 'field_flacc')" />
                                                            <label class="custom-control-label" for="rad_flacc_true">FLACC</label>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" 
                                                                    runat="server" 
                                                                    id="rad_npass_true" 
                                                                    name="rad_pain_assessment" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('pain_assessment_change', 'field_npass')" />
                                                            <label class="custom-control-label" for="rad_npass_true">N-PASS</label>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:UpdatePanel ID="UpdatePanel14" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" 
                                                                    runat="server" 
                                                                    id="rad_nonv_true" 
                                                                    name="rad_pain_assessment" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('pain_assessment_change', 'field_nonv')" />
                                                            <label class="custom-control-label" for="rad_nonv_true">Non-verbal</label>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <section id="field_naf" runat="server">
                                                <div><span class="font-bold">Bằng số và Hình mặt (≥ 4 tuổi)/ <i class="text-primary">Numeric and Faces (≥ 4 years): </i></span><asp:Label runat="server" ID="lbl_paint_score_description" /></div>
                                                <div runat="server" id="paint_score_code_wrapper">
                                                    <div style="display: flex">
                                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-column-gap: 6px; align-content: flex-start;">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        id="rad_paint_score_code_0" 
                                                                        runat="server" 
                                                                        name="rad_paint_score_code"
                                                                        class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_paint_score_code_0">Không đau (0)/ <i class="text-primary">No hurt</i></label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        id="rad_paint_score_code_1" 
                                                                        runat="server" 
                                                                        name="rad_paint_score_code" 
                                                                        class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_paint_score_code_1">Đau rất ít (1 - 2)/ <i class="text-primary">Little hurt</i></label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        id="rad_paint_score_code_2" 
                                                                        runat="server" 
                                                                        name="rad_paint_score_code"
                                                                        class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_paint_score_code_2">Đau nhẹ (3 - 4)/ <i class="text-primary">Slight hurt</i></label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        id="rad_paint_score_code_3" 
                                                                        runat="server" 
                                                                        name="rad_paint_score_code" 
                                                                        class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_paint_score_code_3">Đau vừa (5 - 6)/ <i class="text-primary">Considerable hurt</i></label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio"
                                                                        id="rad_paint_score_code_4" 
                                                                        runat="server" 
                                                                        name="rad_paint_score_code" 
                                                                        class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_paint_score_code_4">Đau nhiều (7 - 8)/ <i class="text-primary">Serious hurt</i></label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio"
                                                                        id="rad_paint_score_code_5"
                                                                        runat="server"
                                                                        name="rad_paint_score_code"
                                                                        class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_paint_score_code_5">Rất đau (9 - 10)/ <i class="text-primary">Worst hurt</i></label>
                                                            </div>
                                                        </div>
                                                        <img src="../images/2021-12-27_14-08-55.png" />
                                                    </div>
                                                </div>
                                            </section>
                                            <%--  --%>
                                            <section runat="server" id="field_flacc">
                                                <div><span class="font-bold">FLACC (2 tháng đến < 4 tuổi) và bệnh nhi dưới 16 tuổi không nói được</span>/ <i class="text-primary">2 month to < 4 years old and non-verbal pediatric patient (patient < 16 years old)</i></div>
                                                <table class="table-bordered">
                                                    <tr>
                                                        <td class="text-center" rowspan="2"><span class="font-bold">Các Hạng Mục</span> <br /><i class="text-primary">Category</i></td>
                                                        <td class="text-center" colspan="3"><span class="font-bold">ĐIỂM HÀNH VI</span>/ <i class="text-primary">BEHAVIOUR SCORE</i></td>
                                                        <td class="text-center" rowspan="2" style="width: 80px"><span class="font-bold">Điểm</span><br /><i class="text-primary">Score</i></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 25%" class="text-center font-bold">0</td>
                                                        <td style="width: 25%" class="text-center font-bold">1</td>
                                                        <td style="width: 25%" class="text-center font-bold">2</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">Mặt <br /><i class="text-primary">Face</i></td>
                                                        <td>Không biểu hiện cụ thể hoặc đang mỉm cười. <br /><i class="text-primary">No particular expression or is smiling</i></td>
                                                        <td>Thỉnh thoảng nhăn mặt hoặc cau mày, thường xuyên run cằm, nghiến răng <br /><i class="text-primary">Occasional grimace or frown, frequent to constant quivering of chin, clenched jaw</i></td>
                                                        <td>Lãnh đạm, thời ơ <br /><i class="text-primary">Withdrawn, disinterested</i></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_flacc_face" />
                                                            <div runat="server" id="flacc_face_wrapper">
                                                                <asp:UpdatePanel ID="up_flacc_face" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_flacc_face"
                                                                                data-type="number"
                                                                                style="width: 120px"
                                                                                runat="server"
                                                                                onchange="__doPostBack('flacc_change', '')"
                                                                                class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">Chân <br /><i class="text-primary">Legs</i></td>
                                                        <td>Vị trí bình thường hoặc Yên tĩnh và thư giãn. <br /><i class="text-primary">Normal position or Is calm and relaxed</i></td>
                                                        <td>Khó chịu, bồn chồn, căng thẳng <br /><i class="text-primary">Uneasy, restless, tense</i></td>
                                                        <td>Đá chân hoặc bất động hoặc bồn chồn. <br /><i class="text-primary">Kicking or legs drawn up immobility or extremely restless</i></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_flacc_legs" />
                                                            <div runat="server" id="flacc_legs_wrapper">
                                                                <asp:UpdatePanel ID="up_flacc_legs" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_flacc_legs"
                                                                                data-type="number"
                                                                                style="width: 120px"
                                                                                runat="server"
                                                                                onchange="__doPostBack('flacc_change', '')"
                                                                                class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">Cử động <br /><i class="text-primary">Activity</i></td>
                                                        <td>
                                                            Nằm im/ <i class="text-primary">Lying quietly</i><br />
                                                            Tư thế bình thường/ <i class="text-primary">Normal position</i><br />
                                                            Đi lại dễ dàng/ <i class="text-primary">Moves easily</i>
                                                        </td>
                                                        <td>Loay hoay, luôn thay đổi tư thế/ <i class="text-primary">Squirming, Shifting back and forth</i></td>
                                                        <td>Khóc thét hoặc hét lên khi bị chạm vào hoặc cử động/ <i class="text-primary">High-pitched cry or scream when touched or moved</i></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_flacc_activity" />
                                                            <div runat="server" id="flacc_activity_wrapper">
                                                                <asp:UpdatePanel ID="up_flacc_activity" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_flacc_activity"
                                                                                data-type="number"
                                                                                style="width: 120px"
                                                                                runat="server"
                                                                                onchange="__doPostBack('flacc_change', '')"
                                                                                class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">Khóc <br />
                                                        <i class="text-primary">Cry</i></td>
                                                        <td>
                                                            Không khóc/ <i class="text-primary">No cry</i><br />
                                                            Thức hoặc ngủ <br /><i class="text-primary">Awake or sleep</i>
                                                        </td>
                                                        <td>
                                                            Rên ri, thỉnh thoảng than phiền <br />
                                                            <i class="text-primary">Moans and whimpers, occasional complaint</i>
                                                        </td>
                                                        <td>
                                                            Khóc liên tục, hét lên, nức nở, than phiền thường xuyên <br />
                                                            <i class="text-primary">Crying steadily, screams, sobs, frequent complaint</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_flacc_cry" />
                                                            <div runat="server" id="flacc_cry_wrapper">
                                                                <asp:UpdatePanel ID="up_flacc_cry" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_flacc_cry"
                                                                                data-type="number"
                                                                                style="width: 120px"
                                                                                runat="server"
                                                                                onchange="__doPostBack('flacc_change', '')"
                                                                                class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Xoa dịu <br />
                                                            <span class="text-primary">An ủi</span> <br />
                                                            <i class="text-primary">Consolability</i>
                                                        </td>
                                                        <td>
                                                            Hài lòng, thử giãn <br />
                                                            <i class="text-primary">Contents, relaxed</i>
                                                        </td>
                                                        <td>
                                                            An ủi bằng thỉnh thoảng chạm, ôm hoặc nói chuyện, dễ bị phân tâm. <br />
                                                            <i class="text-primary">Reassured by occasional touching, hugging or talking to, easily distracted</i>
                                                        </td>
                                                        <td>
                                                            Không an ủi được <br />
                                                            <i class="text-primary">Inconsolable</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_flacc_consolability" />
                                                            <div runat="server" id="flacc_consolability_wrapper">
                                                                <asp:UpdatePanel ID="up_flacc_consolability" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_flacc_consolability"
                                                                                data-type="number"
                                                                                style="width: 120px"
                                                                                runat="server"
                                                                                onchange="__doPostBack('flacc_change', '')"
                                                                                class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-right" colspan="4"><span class="font-bold">Tổng điểm</span>/ <i class="text-primary">Total score</i></td>
                                                        <td class="text-center">
                                                            <asp:UpdatePanel ID="up_flacc_total_score" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:Label runat="server" ID="d_flacc_total_score" />
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 6px">
                                                    <div><span class="font-bold">Kết luận</span>/ <i class="text-primary">Conclude</i>:</div>
                                                    <asp:UpdatePanel ID="up_flacc_conclude" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Label runat="server" ID="d_flacc_conclude" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </section>
                                            <%--  --%>
                                            <section runat="server" id="field_npass">
                                                <div><span class="font-bold">Thang điểm đánh giá đau và an thần cho trẻ sơ sinh và nhũ nhi (< 2 tháng tuổi)</span>/ <i class="text-primary">Neonatal and infantile pain, sedation scale (N-PASS) (<2 months)</i></div>
                                                <table class="mb-2 table-bordered">
                                                    <tr>
                                                        <td class="text-center" rowspan="2">
                                                            <div><span class="font-bold">Tiêu chí <br />đánh giá</span></div>
                                                            <div><i class="text-primary">Assessment <br />criteria</i></div>
                                                        </td>
                                                        <td colspan="2" class="text-center">
                                                            <div><span class="font-bold">An thần</span></div>
                                                            <div><i class="text-primary">Sedation</i></div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div><span class="font-bold">Bình thường</span></div>
                                                            <div><i class="text-primary">Normal</i></div>
                                                        </td>
                                                        <td colspan="2" class="text-center">
                                                            <div><span class="font-bold">Đau</span></div>
                                                            <div><i class="text-primary">Pain</i></div>
                                                        </td>
                                                        <td class="text-center" rowspan="2">
                                                            <div><span class="font-bold">Điểm</span></div>
                                                            <div><i class="text-primary">Score</i></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 15%" class="text-center font-bold">-2</td>
                                                        <td style="width: 15%" class="text-center font-bold">-1</td>
                                                        <td style="width: 15%" class="text-center font-bold">0</td>
                                                        <td style="width: 15%" class="text-center font-bold">1</td>
                                                        <td style="width: 15%" class="text-center font-bold">2</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Khóc <br />
                                                            <i class="text-primary">Crying</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Không khóc với <br /> kích thích đau <br />
                                                            <i class="text-primary">No cry with painful stimuli</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Rên rỉ, khóc yếu <br /> với kích thích đau <br />
                                                            <i class="text-primary">Moans or cries <br /> minimally with <br /> painful stimuli</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Khóc tự nhiên, <br />
                                                            Không bứt rứt <br />
                                                            <i class="text-primary">Appropriate crying <br /> Not irritable</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Bứt rứt, quấy khóc <br /> ngắt quãng, có thể <br /> dỗ được <br />
                                                            <span class="text-primary">Irritable or crying at <br /> intervals Consolable</span>
                                                        </td>
                                                        <td class="align-top">
                                                            Khóc cao giọng, <br /> liên tục, không thể <br /> dỗ được <br />
                                                            <i class="text-primary">High-pitched or <br /> silent-continuous cry <br /> Inconsolable</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_crying" />
                                                            <div runat="server" id="npass_crying_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_crying" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_crying"
                                                                                data-type="number1"
                                                                                style="width: 120px"
                                                                                runat="server"
                                                                                onchange="__doPostBack('npass_change', '')"
                                                                                class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Biểu hiện <br />
                                                            <i class="text-primary">Behavior</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Không đáp ứng với <br /> bất kỳ kích thích<br />
                                                            <i class="text-primary">No arousal to any <br /> stimuli</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Nhúc nhích nhẹ <br /> khi bị kích thích<br />
                                                            <i class="text-primary">Arouses minimally to <br /> stimuli little <br /> spontaneous <br /> movement</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Cử động phù hợp <br /> tuổi thai<br />
                                                            <i class="text-primary">Appropriate for <br /> gestational age</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Vặn mình, thường thức giấc <br />
                                                            <i class="text-primary">Restless, squirming <br /> Awakens frequently</i>
                                                        </td>
                                                        <td class="align-top">
                                                            Uốn éo, không ngủ <br /> yên <br />
                                                            <i class="text-primary">Arching, kicking <br /> Constantly awake or <br /> Arouses minimally/ <br /> no movement (not <br /> sedated)</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_behavior" />
                                                            <div runat="server" id="npass_behavior_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_behavior" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_behavior"
                                                                                    data-type="number1"
                                                                                    style="width: 120px"
                                                                                    runat="server"
                                                                                    onchange="__doPostBack('npass_change', '')"
                                                                                    class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Vẻ mặt <br />
                                                            <i class="text-primary">Facial <br /> expression</i>
                                                        </td>
                                                        <td>
                                                            Không thay đổi với<br /> kích thích <br />
                                                            <i class="text-primary">No expression</i>
                                                        </td>
                                                        <td>
                                                            Thay đổi nhẹ với<br /> kích thích <br />
                                                            <i class="text-primary">Minimal expression <br /> with stimuli</i>
                                                        </td>
                                                        <td>
                                                            Thư giãn<br /> Relaxed,<br />
                                                            <i class="text-primary">Appropriate</i>
                                                        </td>
                                                        <td>
                                                            Nhăn mặt, không <br /> liên tục
                                                            <i class="text-primary">Any pain expression <br /> intermittent</i>
                                                        </td>
                                                        <td>
                                                            Nhăn mặt liên tục <br /> Any pain expression <br /> 
                                                            <i class="text-primary">continual</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_facial_expression" />
                                                            <div runat="server" id="npass_facial_expression_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_facial_expression" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_facial_expression"
                                                                                    data-type="number1"
                                                                                    style="width: 120px"
                                                                                    runat="server"
                                                                                    onchange="__doPostBack('npass_change', '')"
                                                                                    class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Trương lực <br /> chỉ
                                                            <i class="text-primary">Extremities<br /> tone</i>
                                                        </td>
                                                        <td>
                                                            Mềm oặt, không<br /> phản xạ nắm<br />
                                                            <i class="text-primary">No grasp reflexes <br /> Flaccid tone</i>
                                                        </td>
                                                        <td>
                                                            Giảm trương lực,<br /> phản xạ nắm yếu <br />
                                                            <i class="text-primary">Weak grasp reflex <br /> decrease muscle <br /> tone</i>
                                                        </td>
                                                        <td>
                                                            Trương lực bình<br /> thường, tay chân<br /> thư giãn <br />
                                                            <i class="text-primary">Relaxed hands and feet Normal tone</i>
                                                        </td>
                                                        <td>
                                                            Các ngón chân <br /> quặp lại, không liên tục, tay nắm lại hoặc xèo ra. Không gồng người
                                                            <i class="text-primary">Intermittent clenched <br /> toes, fists or finger <br /> splay Body is not <br /> tense</i>
                                                        </td>
                                                        <td>
                                                            Các ngón chân quặp lại liên tục, tay nắm lại hoặc xèo ra. Gồng người <br />
                                                            <i class="text-primary">Continual clenched <br /> toes, fists, or finger <br /> splay. Body is tense</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_extremities_tone" />
                                                            <div runat="server" id="npass_extremities_tone_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_extremities_tone" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_extremities_tone"
                                                                                    data-type="number1"
                                                                                    style="width: 120px"
                                                                                    runat="server"
                                                                                    onchange="__doPostBack('npass_change', '')"
                                                                                    class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            Dấu hiệu <br /> sinh tồn
                                                            <i class="text-primary">Vital signs</i>
                                                        </td>
                                                        <td>
                                                            Không dao động khi<br /> bị kích thích<br /> Thở yếu <br /> Ngưng thở
                                                            <i class="text-primary">No variability with <br /> stimuli <br /> Hypoventilation or <br /> apnea</i>
                                                        </td>
                                                        <td>
                                                            Thay đổi dưới 10%<br /> so với giới hạn <br /> bình thường khi bị <br /> kích thích
                                                            <i class="text-primary">Decrease 10% <br /> variability from <br /> baseline with stimuli</i>
                                                        </td>
                                                        <td>
                                                            Nằm trong giới<br /> hạn bình thường<br /> theo tuổi thai <br />
                                                            <i class="text-primary">Within baseline or <br /> normal for <br /> gestational age</i>
                                                        </td>
                                                        <td>
                                                            Tăng 10-20% so <br /> với giới hạn bình <br /> thường SpO2 76 <br /> -85% khi bị kích <br /> thích, hồi phục <br /> nhanh
                                                            <i class="text-primary">Increase 10-20% from <br /> baseline <br /> SaO2 76-85% with <br /> stimulation - quick<br /> toes, fists or finger <br /> splay Body is not <br /> tense</i>
                                                        </td>
                                                        <td>
                                                            Tăng trên 20% so <br /> với giới hạn bình <br /> thường <br /> SpO2 dưới 75% <br /> khi bị kích thích, <br /> hồi phục chậm <br /> <br />
                                                            <i class="text-primary">Increase 20% from <br /> baseline <br /> SaO2 ≤ 75% with stimulation - slow <br /> Out of sync with vent</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_vital_signs" />
                                                            <div runat="server" id="txt_npass_vital_signs_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_vital_signs" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_vital_signs"
                                                                                    data-type="number1"
                                                                                    style="width: 120px"
                                                                                    runat="server"
                                                                                    onchange="__doPostBack('npass_change', '')"
                                                                                    class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center" rowspan="3">
                                                            Tuổi thai <br />
                                                            hiệu chỉnh <br />
                                                            <i class="text-primary">Gestation <br />(Corrected <br /> age)</i>
                                                        </td>
                                                        <td class="text-center" colspan="5">< 28 tuần / <i class="text-primary"><28 weeks</i>: <span class="font-bold">+3</span></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_gestation_3" />
                                                            <div runat="server" id="npass_gestation_3_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_gestation_3" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_gestation_3"
                                                                                    data-type="number"
                                                                                    style="width: 120px"
                                                                                    runat="server"
                                                                                    onchange="__doPostBack('npass_change', '')"
                                                                                    class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center" colspan="5">28-31 tuần / <i class="text-primary">28-31 weeks</i>: <span class="font-bold">+2</span></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_gestation_2" />
                                                            <div runat="server" id="npass_gestation_2_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_gestation_2" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_gestation_2"
                                                                                    data-type="number"
                                                                                    style="width: 120px"
                                                                                    runat="server"
                                                                                    onchange="__doPostBack('npass_change', '')"
                                                                                    class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center" colspan="5">32-35 tuần / <i class="text-primary">32-35 weeks</i>: <span class="font-bold">+1</span></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="lbl_npass_gestation_1" />
                                                            <div runat="server" id="npass_gestation_1_wrapper">
                                                                <asp:UpdatePanel ID="up_npass_gestation_1" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <input id="txt_npass_gestation_1"
                                                                                    data-type="number"
                                                                                    style="width: 120px"
                                                                                    runat="server"
                                                                                    onchange="__doPostBack('npass_change', '')"
                                                                                    class="form-control text-right" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-right" colspan="6"><span class="font-bold">Tổng điểm</span>/ <i class="text-primary">Total score</i></td>
                                                        <td class="text-center">
                                                            <asp:UpdatePanel ID="up_npass_total_score" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:Label runat="server" ID="d_npass_total_score" ></asp:Label>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 6px">
                                                    <div><span class="font-bold">Kết luận</span>/ <i class="text-primary">Conclude</i>:</div>
                                                    <asp:UpdatePanel ID="up_npass_conclude" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Label runat="server" ID="d_npass_conclude" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </section>
                                            <%--  --%>
                                            <section runat="server" id="field_nonv">
                                                <div>Đối với người bệnh không nói được điều dưỡng đánh giá riêng trên biểu mẫu (AIH-FRM-021 - Thang điểm theo dõi phản ứng đau của người bệnh không nói được)</div>
                                                <div><i class="text-primary">Nurses use a separated form to evaluate non-verbal patients (AIH-FRM-021 - Behavioural pain scale for non-verbal adult patient)</i></div>
                                            </section>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div><span class="font-bold">6. Trở ngại chăm sóc</span>/ <i class="text-primary">Barrier to care:</i></div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div style="display: grid; grid-template-columns: 280px 1fr; grid-gap: 6px">
                                                <div><span>- Trở ngại về ngôn ngữ</span>/ <i class="text-primary">Language Barriers:</i></div>
                                                <asp:Label runat="server" ID="lbl_btc_language"/>
                                                <div runat="server" id="btc_language_wrapper" style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                id="rad_btc_language_false" 
                                                                runat="server"
                                                                name="rad_btc_language" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('btc_language_change', false)"  />
                                                        <label class="custom-control-label" for="rad_btc_language_false">Không/ <i class="text-primary">No</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio"
                                                                id="rad_btc_language_true"
                                                                name="rad_btc_language"
                                                                runat="server"
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('btc_language_change',true)"  />
                                                        <label class="custom-control-label" for="rad_btc_language_true">Có, Giải thích/ <i class="text-primary">Yes, Explain:</i></label>
                                                    </div>
                                                    <div id="field_btc_language_true" runat="server" style="grid-column: 1/3" class="mb-2">
                                                        <webUI:TextField runat="server" ID="txt_btc_language_note" TextMode="SingleLine" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 280px 1fr; grid-gap: 6px">
                                                <div><span>- Trở ngại về nhận thức</span>/ <i class="text-primary">Cognitive Barriers:</i></div>
                                                <asp:Label runat="server" ID="lbl_btc_cognitive"/>
                                                <div runat="server" id="btc_cognitive_wrapper" style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio"
                                                                id="rad_btc_cognitive_false" 
                                                                name="rad_btc_cognitive" 
                                                                runat="server"
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('btc_cognitive_change', false)" />
                                                        <label class="custom-control-label" for="rad_btc_cognitive_false">Không/ <i class="text-primary">No</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_btc_cognitive_true" 
                                                                name="rad_btc_cognitive"
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('btc_cognitive_change', true)" />
                                                        <label class="custom-control-label" for="rad_btc_cognitive_true">Có, Giải thích/ <i class="text-primary">Yes, Explain:</i></label>
                                                    </div>
                                                    <div runat="server" id="field_btc_cognitive_true" style="grid-column: 1/3" class="mb-2">
                                                        <webUI:TextField runat="server" ID="txt_btc_cognitive_note" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 280px 1fr; grid-gap: 6px">
                                                <div><span>- Trở ngại về Giác quan</span>/ <i class="text-primary">Sensory Barriers:</i></div>                                                        
                                                <asp:Label runat="server" ID="lbl_btc_sensory"/>
                                                <div runat="server" id="btc_sensory_wrapper" style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                id="rad_btc_sensory_false" 
                                                                name="rad_btc_sensory" 
                                                                runat="server"
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('btc_sensory_change', false)" />
                                                        <label class="custom-control-label" for="rad_btc_sensory_false">Không/ <i class="text-primary">No</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_btc_sensory_true" 
                                                                name="rad_btc_sensory" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('btc_sensory_change', true)" />
                                                        <label class="custom-control-label" for="rad_btc_sensory_true">Có, Giải thích/ <i class="text-primary">Yes, Explain:</i></label>
                                                    </div>
                                                    <div runat="server" id="field_btc_sensory_true" style="grid-column: 1/3" class="mb-2">
                                                        <webUI:TextField runat="server" ID="txt_btc_sensory_note" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 280px 1fr; grid-gap: 6px">
                                                <div><span>- Trở ngại về Tôn giáo</span>/ <i class="text-primary">Religious Barriers:</i></div>     
                                                <asp:Label runat="server" ID="lbl_btc_religious"/>
                                                <div runat="server" id="btc_religious_wrapper" style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px">
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_btc_religious_false" 
                                                                name="rad_btc_religious" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('btc_religious_change', false)" />
                                                        <label class="custom-control-label" for="rad_btc_religious_false">Không/ <i class="text-primary">No</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_btc_religious_true" 
                                                                name="rad_btc_religious" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('btc_religious_change', true)" />
                                                        <label class="custom-control-label" for="rad_btc_religious_true">Có, Giải thích/ <i class="text-primary">Yes, Explain:</i></label>
                                                    </div>
                                                    <div runat="server" id="field_btc_religious_true" style="grid-column: 1/3" class="mb-2">
                                                        <webUI:TextField runat="server" ID="txt_btc_religious_note" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 280px 1fr; grid-gap: 6px" class="mb-2">
                                                <div><span>- Trở ngại về Văn hóa</span>/ <i class="text-primary">Cultural Barriers:</i></div>    
                                                <asp:Label runat="server" ID="lbl_btc_cultural"/>
                                                <div runat="server" id="btc_cultural_wrapper" style="display: grid; grid-template-columns: 100px 1fr; grid-gap: 6px">
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_btc_cultural_false" 
                                                                name="rad_btc_cultural" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('btc_cultural_change', false)" />
                                                        <label class="custom-control-label" for="rad_btc_cultural_false">Không/ <i class="text-primary">No</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_btc_cultural_true" 
                                                                name="rad_btc_cultural" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('btc_cultural_change', true)" />
                                                        <label class="custom-control-label" for="rad_btc_cultural_true">Có, Giải thích/ <i class="text-primary">Yes, Explain:</i></label>
                                                    </div>
                                                    <div runat="server" id="field_btc_cultural_true" style="grid-column: 1/3" class="mb-2">
                                                        <webUI:TextField runat="server" ID="txt_btc_cultural_note" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div><span class="font-bold">7. Tầm soát nguy cơ té ngã</span>/ <i class="text-primary">Fall risk screening:</i></div>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="dg gtc3" style="grid-gap: 6px">
                                                <div><span class="font-bold">- Các yếu tố nguy cơ</span>/ <i class="text-primary">Fall risk factors:</i></div>
                                                <asp:Label runat="server" ID="lbl_no_fall_risk"/>
                                                <div runat="server" id="no_fall_risk_wrapper" style="display: grid; grid-template-columns: repeat(2, 120px); grid-gap: 6px">
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_no_fall_risks_true" 
                                                                name="rad_no_fall_risks" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('no_fall_risks_change', true)" />
                                                        <label class="custom-control-label" for="rad_no_fall_risks_true">Không/ <i class="text-primary">No</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input runat="server" 
                                                                type="radio" 
                                                                id="rad_no_fall_risks_false" 
                                                                name="rad_no_fall_risks" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('no_fall_risks_change', false)" />
                                                        <label class="custom-control-label" for="rad_no_fall_risks_false">Có/ <i class="text-primary">Yes</i></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div runat="server" id="field_no_fall_risks_false">
                                                <div runat="server" id="fall_risk_factors_field" style="display: grid; grid-template-columns: 1fr 1fr; grid-gap: 6px">
                                                    <div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_agr" />
                                                                <span class="custom-control-label">Tuổi > 65/ <i class="text-primary">Age > 65</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_pre" />
                                                                <span class="custom-control-label">Phụ nữ có thai/ <i class="text-primary">Pregnant women</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_ina" />
                                                                <span class="custom-control-label">Không có khả năng đứng lên từ ghế/ <i class="text-primary">Inability to rise from a chair.</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_pod" />
                                                                <span class="custom-control-label">Mất trí nhớ/ <i class="text-primary">Presence of dementia</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_imp" />
                                                                <span class="custom-control-label">Giảm/ Mất thị lực/ <i class="text-primary">Patients with visual impairments</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_ear" />
                                                                <span class="custom-control-label">Bệnh nhân có vấn đề về tai có triệu chứng chóng mặt/ <i class="text-primary">Patients have ear problems with complaints of dizziness and/or vertigo.</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_psy" />
                                                                <span class="custom-control-label">Đang sử dụng bất kỳ thuốc thuộc nhóm an thần/ <i class="text-primary">Any Administered Psycholeptics:</i> Diazepam, Tofisopam, Eszopiclone, Midazolam, Rotudin, Etifoxine chlorhydrate</span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_ade" />
                                                                <span class="custom-control-label">Đang sử dụng bất kỳ thuốc thuộc nhóm chống trầm cảm/ <i class="text-primary">Any Administered Antidepressant:</i> Citalopram, SERTRAline, Amitriptyline, Mirtazapine</span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_aps" />
                                                                <span class="custom-control-label">Đang sử dụng bất kỳ thuốc thuộc nhóm điều trị loạn thần/ <i class="text-primary">Any administered antipsychotic:</i> Haloperidol, Olanzapine, Quetiapine, Risperidone, Olanzapine, Quetiapine</span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_aco" />
                                                                <span class="custom-control-label">Đang sử dụng bất kỳ thuốc chống đông máu/ <i class="text-primary">Any administered anticoagulant:</i> Heparin Sodium, Anoxaparin, Rivaroxaban, Acenocoumarol...</span>
                                                            </label>
                                                        </div>
                                                        <div style="display: none">
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_nfr" />
                                                                <span class="custom-control-label">Không có yếu tố nguy cơ/ <i class="text-primary">No fall risks</i></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_ale" />
                                                                <span class="custom-control-label">Tuổi < 3/ <i class="text-primary">Age < 3</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_amb" />
                                                                <span class="custom-control-label">Sử dụng phương tiện hỗ trợ đi lại (gậy/nạng/khung tập đi)/ <i class="text-primary">Ambulatory devices (canes, crutches, and walkers)</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_pat" />
                                                                <span class="custom-control-label">Dáng đi yếu hoặc mất thăng bằng/ <i class="text-primary">Patients with gait or balance disturbances</i></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_aep" />
                                                                <span class="custom-control-label">Đang sử dụng bất kỳ loại thuốc thuộc nhóm chống động kinh, chống co giật/ <i class="text-primary">Any administered Antiepileptics, Anticonvulsants:</i> Cardamazepine, Divolproex Sodium, Gabapentin, Lamotrigine, Phenobarbital, Phenytoin, Topiramate, Valproic Acid, Levetiracetam, Pregabalin</span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" 
                                                                        class="custom-control-input" 
                                                                        runat="server" 
                                                                        id="cb_fall_risk_factors_ahy" />
                                                                <span class="custom-control-label">Đang sử dụng bất kỳ thuốc thuộc nhóm điều trị tăng huyết áp/ <i class="text-primary">Any administered Antihypertensive Medication:</i> Captopril, Perindopril and amlodipine, Irbesartan and diuretics, Valsartan, Nifedipine, Lisinopril, Furosemide + Spironolacton, BISOprolol, METOprolol succinate...</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--Câu hỏi sàng lọc/ The fall risk screen question--%>
                                                <div>
                                                    <div><span class="font-bold">- Câu hỏi sàng lọc</span>/ <i class="text-primary">The fall risk screen question</i>:</div>
                                                    <div>a. Anh/chị/ông/bà có từng bị ngã trong 12 tháng gần đây không?/ <i class="text-primary">Have you fallen in the past year?</i></div>
                                                    <div style="margin-left: 120px">
                                                        <asp:Label runat="server" ID="lbl_fallen"/>
                                                        <div runat="server" id="fallen_field">
                                                            <div style="display: grid; grid-template-columns: repeat(2, 120px); grid-gap: 6px">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" id="rad_fallen_true" runat="server" name="rad_fallen" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_fallen_true">Có/ <i class="text-primary">Yes</i></label>
                                                                </div>
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" id="rad_fallen_false" runat="server" name="rad_fallen" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_fallen_false">Không/ <i class="text-primary">No</i></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>b. Anh/chị/ông/bà có cảm thấy bị mất thăng bằng lúc đứng dậy hoặc lúc đi không?/ <i class="text-primary">Do you feel unsteady when standing or walking?</i></div>
                                                    <div style="margin-left: 120px">
                                                        <asp:Label runat="server" ID="lbl_feel_unsteady"/>
                                                        <div runat="server" id="feel_unsteady_field">
                                                            <div style="display: grid; grid-template-columns: repeat(2, 120px); grid-gap: 6px">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" 
                                                                            id="rad_feel_unsteady_true" 
                                                                            runat="server" 
                                                                            name="rad_feel_unsteady" 
                                                                            class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_feel_unsteady_true">Có/ <i class="text-primary">Yes</i></label>
                                                                </div>
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio"
                                                                            id="rad_feel_unsteady_false" 
                                                                            runat="server" 
                                                                            name="rad_feel_unsteady"
                                                                            class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_feel_unsteady_false">Không/ <i class="text-primary">No</i></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>c. Anh/chị/ông/bà có lo sợ bị ngã không?/ <i class="text-primary">Do you worry about falling?</i></div>
                                                    <div style="margin-left: 120px">
                                                        <asp:Label runat="server" ID="lbl_worry_about_falling"/>
                                                        <div runat="server" id="worry_about_falling_field">
                                                            <div style="display: grid; grid-template-columns: repeat(2, 120px); grid-gap: 6px">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" 
                                                                            id="rad_worry_about_falling_true" 
                                                                            runat="server" 
                                                                            name="rad_worry_about_falling" 
                                                                            class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_worry_about_falling_true">Có/ <i class="text-primary">Yes</i></label>
                                                                </div>
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" 
                                                                            id="rad_worry_about_falling_false" 
                                                                            runat="server" 
                                                                            name="rad_worry_about_falling" 
                                                                            class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_worry_about_falling_false">Không/ <i class="text-primary">No</i></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--Can thiệp/ Intervention--%>
                                                <div>
                                                    <div><span class="font-bold">- Can thiệp</span>/ <i class="text-primary">Intervention</i>:</div>
                                                    <div style="margin-left: 120px">
                                                        <asp:Label runat="server" ID="lbl_intervention"/>
                                                        <div runat="server" id="intervention_field">
                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_uni" />
                                                                    <span class="custom-control-label">Phòng ngừa té ngã thường quy/ <i class="text-primary">Universe fall risk prevention</i></span>
                                                                </label>
                                                            </div>
                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_sti" />
                                                                    <span class="custom-control-label">Dán sticker nguy cơ ngã/ <i class="text-primary">Stick fall-risk on patient's shirt</i></span>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_edu" />
                                                                    <span class="custom-control-label">Thông báo nguy cơ té ngã cho người bệnh/ người nhà/ <i class="text-primary">Educate the fall risk to patient/ Relatives</i></span>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_ass" />
                                                                    <span class="custom-control-label">Trợ giúp người bệnh di chuyển, đi lại/ <i class="text-primary">Assist patient with transfer/ ambulation.</i></span>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_str" />
                                                                    <span class="custom-control-label">Cung cấp dụng cụ hỗ trợ di chuyển (Băng ca, xe đẩy...)/ <i class="text-primary">Assist patient with transfer/ ambulation (Stretcher, wheelchair)</i></span>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_epa" />
                                                                    <span class="custom-control-label">Hướng dẫn ba mẹ/ người thân bệnh nhi luôn quan sát bé cẩn thận và luôn ở cùng bé/ <i class="text-primary">Educate Parents to keep an eye on their children closely and never let him/her alone.</i></span>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_ins" />
                                                                    <span class="custom-control-label">Hướng dẫn ba mẹ/ người thân bệnh nhi hạn chế cho bé chạy nhảy/ <i class="text-primary">Instruct Parents/ accompanying family members limit the child to run.</i></span>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_enc" />
                                                                    <span class="custom-control-label">Khuyến khích di chuyển bằng nôi/ xe nôi đối với trẻ sơ sinh và nhủ nhi/ <i class="text-primary">Encourage parents/ Caregivers to use cribs for newborn/ neonatal in moving.</i></span>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_pfr" />
                                                                    <span class="custom-control-label">Đeo vòng tay nguy cơ ngã khi/ <i class="text-primary">Place Fall Risk ID bracelet on patient in cases of:</i></span>
                                                                </label>
                                                            </div>

                                                            <ul>
                                                                <li>Người bệnh có chỉ định nhập viện nguy cơ té ngã cao/ <i class="text-primary">High fall risk patients with admission order</i></li>
                                                                <li>Người bệnh sau thủ thuật có gây tê hoặc gây mê/ <i class="text-primary">Patients after procedure under local or general anesthesia</i></li>
                                                                <li>Người bệnh hóa trị liệu/ <i class="text-primary">Patients with chemotherapy</i></li>
                                                                <li>Người bệnh được truyền dịch/ <i class="text-primary">Patients with fluid infusion.</i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div><span class="font-bold">8. Sàng lọc dinh dưỡng</span>/ <i class="text-primary">Nutrition screening:</i></div>
                                    <asp:UpdatePanel ID="up_nutrition_screening" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table class="table-bordered w-100 mb-2">
                                                <tr>
                                                    <td>
                                                        <div>BMI = Chỉ số khối cơ thể / BMI</div>
                                                    </td>
                                                    <td class="text-center" style="width: 120px">
                                                        <asp:Label runat="server" ID="d_bmi"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div><span class="font-bold">Cân nặng 3 tháng trước</span>/ <i class="text-primary">The weight of 3 last month</i></div>
                                                        <div>* Đối với trẻ sơ sinh < 3 tháng tuổi, điền thông tin cân nặng lúc sinh</div>
                                                        <div><i class="text-primary">For infants < 3 months old, please insert birth weight</i></div>
                                                    </td>
                                                    <td>
                                                        <div style="width: 125px" class="text-center">
                                                            <asp:Label runat="server" ID="lbl_previous_weight"/>
                                                            <div class="form-group d-inline-block" runat="server" id="previous_weight_wrapper">
                                                                <input onchange="__doPostBack('previous_weight_changed', false)" 
                                                                        id="txt_previous_weight"
                                                                        data-type="number"
                                                                        style="width: 100px"
                                                                        runat="server"
                                                                        class="form-control text-right" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1">
                                                        <div><span class="font-bold">% cân nặng thay đổi</span></div>
                                                        <div><i class="text-primary">% weight change</i></div>
                                                    </td>
                                                    <td>
                                                        <div class="text-center">
                                                            <asp:Label runat="server" ID="d_weight_change"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <%--Tình trạng dinh dưỡng/ Nutrition status--%>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="mb-2">
                                                <div>- <span class="font-bold">Tình trạng dinh dưỡng</span>/ <i class="text-primary">Nutrition status:</i></div>
                                                <div>(Lưu ý; Không áp dụng cho phụ nữ mang thai/ <i class="text-primary">Note: Not applicable for pregnant women</i> )</div>

                                                <div runat="server" id="nutrition_status_age_wrapper" style="display: grid; grid-template-columns: repeat(3, 250px); grid-gap: 6px">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_ns_l" 
                                                                name="rad_nutrition_status_age" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('nutrition_status_age_change','l')" />
                                                        <label class="custom-control-label" for="rad_ns_l">Trẻ ≤ 5 tuổi/ <i class="text-primary">Children ≤ 5 years old</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_ns_g" 
                                                                name="rad_nutrition_status_age"
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('nutrition_status_age_change','g')" />
                                                        <label class="custom-control-label" for="rad_ns_g">Trẻ > 5 tuổi/ <i class="text-primary">Children > 5 years old</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_ns_a" 
                                                                name="rad_nutrition_status_age"
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('nutrition_status_age_change','a')" />
                                                        <label class="custom-control-label" for="rad_ns_a">Người lớn/ <i class="text-primary">Adult patients</i></label>
                                                    </div>
                                                </div>
                                                        
                                                <table class="table-bordered w-100 mb-2" runat="server" id="field_nutrition_status_l">
                                                    <tr>
                                                        <td class="text-center">
                                                            <div>
                                                                <div>Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -2 độ lệch tiêu chuẩn (SD)</span></div>
                                                                <div><i class="text-primary">Weight for length/height ≤ -2 standard devivation (SD)</i></div>
                                                            </div>
                                                        </td>
                                                        <td style="width: 120px" class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server"
                                                                        id="rad_ns_l_2" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','2')" />
                                                                <label class="custom-control-label" for="rad_ns_l_2">2</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            <div>Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -1 độ lệch tiêu chuẩn (SD)</span></div>
                                                            <div><i class="text-primary">Weight for length/height ≤ -1 standard deviation (SD)</i></div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_l_1" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','1')" />
                                                                <label class="custom-control-label" for="rad_ns_l_1">1</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            <div>Cân nặng theo chiều dài/chiều cao > <span class="font-bold"> -1 độ lệch tiêu chuẩn (SD)</span></div>
                                                            <div><i class="text-primary">Weight for length/height > -1 standard deviation (SD)</i></div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_l_0" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','0')" />
                                                                <label class="custom-control-label" for="rad_ns_l_0">0</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <table class="table-bordered w-100 mb-2" runat="server" id="field_nutrition_status_g">
                                                    <tr>
                                                        <td class="text-center">
                                                            <div>BMI theo tuổi ≤ <span class="font-bold"> -2 SD</span>/<i class="text-primary">BMI for age ≤ -2SD</i></div>
                                                        </td>
                                                        <td style="width: 120px" class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" id="rad_ns_g_2" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','2')" />
                                                                <label class="custom-control-label" for="rad_ns_g_2">2</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            BMI theo tuổi ≤ <span class="font-bold"> -1 SD</span>/<i class="text-primary">BMI for age ≤ -1SD</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio"
                                                                        runat="server" 
                                                                        id="rad_ns_g_1" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','1')" />
                                                                <label class="custom-control-label" for="rad_ns_g_1">1</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            BMI theo tuổi > <span class="font-bold">-1 SD</span>/<i class="text-primary">BMI for age > -1SD</i>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio"
                                                                        runat="server" 
                                                                        id="rad_ns_g_0" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','0')" />
                                                                <label class="custom-control-label" for="rad_ns_g_0">0</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                            
                                                <table class="table-bordered w-100 mb-2" runat="server" id="field_nutrition_status_a">
                                                    <tr>
                                                        <td class="text-center">
                                                            <div>
                                                                BMI < <span class="font-bold"> 18,5</span>
                                                            </div> 
                                                        </td>
                                                        <td style="width: 120px" class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_a_2" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','2')" />
                                                                <label class="custom-control-label" for="rad_ns_a_2">2</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            BMI từ /<span class="text-primary">from </span><span class="font-bold"> 18,5 – 20</span>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio"
                                                                        runat="server" 
                                                                        id="rad_ns_a_1"
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','1')" />
                                                                <label class="custom-control-label" for="rad_ns_a_1">1</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            BMI ><span class="text-primary">20</span>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_a_0" 
                                                                        name="rad_nutrition_status"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('nutrition_status_change','0')" />
                                                                <label class="custom-control-label" for="rad_ns_a_0">0</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <asp:HiddenField runat="server" ID="ns_age_score" />
                                                    
                                                <div><span class="font-bold">- Sụt cân không chủ ý trong 3 tháng gần đây </span>/ <i class="text-primary">Unintentional weight loss in the last 3 months:</i></div>
                                                <div>Lưu ý: Xem "% cân nặng thay đổi" ở trên, nếu số liệu = 0: Không sụt cân; nếu số liệu <0: sụt cân; nếu số liệu >0: tăng cân</div>
                                                <div><i class="text-primary">Note: Based on the box "% weight change" above: if data = 0; no weight loss, if data <0: weight loss, if data >0: weight gain</i></div>

                                                <table class="table-bordered w-100 mb-2">
                                                    <tr>
                                                        <td class="text-center">Giảm > 10%/ <i class="text-primary">Weight loss > 10%</i></td>
                                                        <td style="width: 120px" class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_loss_weight_2" 
                                                                        name="rad_ns_loss_weight"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('ns_loss_weight_change','2')" />
                                                                <label class="custom-control-label" for="rad_ns_loss_weight_2">2</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">Giảm từ <span class="font-bold">5 - 10%</span> / <i class="text-primary">Weight loss from 5 - 10%</i></td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_loss_weight_1" 
                                                                        name="rad_ns_loss_weight"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('ns_loss_weight_change','1')" />
                                                                <label class="custom-control-label" for="rad_ns_loss_weight_1">1</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            <div>Giảm < <span class="font-bold">5%</span> / <i class="text-primary">Weight loss < 5%</i></div>
                                                            <div>Hoặc <span class="font-bold">không sụt cân</span>/ <i class="text-primary">Or no weight loss</div>
                                                            <div>Hoặc <span class="font-bold">tăng cân</span>/ <i class="text-primary">Or weight gain</div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_loss_weight_0" 
                                                                        name="rad_ns_loss_weight"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('ns_loss_weight_change','0')" />
                                                                <label class="custom-control-label" for="rad_ns_loss_weight_0">0</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <asp:HiddenField runat="server" ID="ns_loss_weight_score" />

                                                <div><span class="font-bold">- Khả năng ăn uống</span>/ <i class="text-primary">Food intake:</i></div>
                                                    
                                                <table class="table-bordered w-100 mb-2">
                                                    <tr>
                                                        <td class="text-center">Ăn uống kém hơn <span class="font-bold">5 ngày</span> gần đây/ <i class="text-primary">Eating less than the last 5 days</i></td>
                                                        <td style="width: 120px" class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_food_intake_2" 
                                                                        name="rad_ns_food_intake"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('ns_food_intake_change','2')" />
                                                                <label class="custom-control-label" for="rad_ns_food_intake_2">2</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">Ăn uống bình thường/ <i class="text-primary">Eating normally</i></td>
                                                        <td class="text-center">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" 
                                                                        runat="server" 
                                                                        id="rad_ns_food_intake_0" 
                                                                        name="rad_ns_food_intake"
                                                                        class="custom-control-input"
                                                                        onclick="__doPostBack('ns_food_intake_change','0')" />
                                                                <label class="custom-control-label" for="rad_ns_food_intake_0">0</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-right"><span class="font-bold">Tổng điểm</span>/ <i class="text-primary">Total score</i></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="d_ns_total_score" />
                                                        </td>
                                                    </tr>
                                                </table>

                                                <asp:HiddenField runat="server" ID="ns_food_intake_score" />
                                                    
                                                <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 6px">
                                                    <div><span class="font-bold">Kết luận </span>/ <i class="text-primary">Conclude</i>:</div>
                                                    <div><asp:Label runat="server" ID="d_nutritional_conclude" /></div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div><span class="font-bold">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH</span>/ <i class="text-primary">SOCIAL FACTORS ASSESSMENT</i>:</div>  
                                            
                                    <div style="display: grid; grid-template-columns: auto 1fr; grid-gap: 6px" class="mb-2">
                                        <div><span class="font-bold">Tình trạng sinh sống</span>/ <i class="text-primary">Housing</i>:</div>
                                        <div runat="server" id="housing_code_wrapper" style="display: grid; grid-template-columns: repeat(2, 260px); grid-gap: 6px">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" 
                                                        runat="server" 
                                                        id="rad_housing_code_aln" 
                                                        name="rad_housing_code" 
                                                        class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_housing_code_aln">Sống một mình/ <i class="text-primary">Lives alone</i></label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" 
                                                        runat="server" 
                                                        id="rad_housing_code_rel" 
                                                        name="rad_housing_code" 
                                                        class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_housing_code_rel">Sống với người thân/ <i class="text-primary">With relatives</i></label>
                                            </div>
                                        </div>
                                        <asp:Label runat="server" ID="lbl_housing_description" />
                                    </div>

                                    <div><span class="font-bold">IV. MỨC ĐỘ ƯU TIÊN</span>/ <i class="text-primary">PRIORITIZATION</i></div>
                                            
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="mb-2" style="margin-left: 120px">
                                                <div runat="server" id="lbl_prioritization_code">
                                                    <asp:Label runat="server" ID="lbl_prioritization_description" />
                                                    <div style="margin-left: 26px"><asp:Label runat="server" ID="lbl_immediate_consulting_requirement" /></div>
                                                </div>
                                                <div runat="server" id="prioritization_code_wrapper">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_prioritization_code_wa" 
                                                                name="rad_prioritization_code" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('prioritization_change', false)"/>
                                                        <label class="custom-control-label" for="rad_prioritization_code_wa">Có thể chờ khám trong khoảng thời gian xác định/ <i class="text-primary">Be able to wait for consultation at a specific time</i></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" 
                                                                runat="server" 
                                                                id="rad_prioritization_code_im" 
                                                                name="rad_prioritization_code"
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('prioritization_change', true)"/>
                                                        <label class="custom-control-label" for="rad_prioritization_code_im">Cần được khám ngay/ <i class="text-primary">Immediate consulting requirement</i></label>
                                                    </div>
                                                </div>
                                                <div runat="server" id="immediate_consulting_requirement" style="margin-left: 26px">
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_eme" />
                                                        <span class="custom-control-label">Tình trạng nặng cần xử lí ngay/ <i class="text-primary">Emergency cases</i></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_chi" />
                                                        <span class="custom-control-label">Trẻ em dưới 6 tuổi/ <i class="text-primary">Children are under 6 years of age</i></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_ser" />
                                                        <span class="custom-control-label">Người khuyết tật nặng/ <i class="text-primary">Servere disabilities</i></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_pat" />
                                                        <span class="custom-control-label">Người bệnh trên 80 tuổi/ <i class="text-primary">Patient are over 80 years of age</i></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_pre" />
                                                        <span class="custom-control-label">Phụ nữ có thai trên 24 tuần/ <i class="text-primary">Prenancy is over 24 weeks</i></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_boo" />
                                                        <span class="custom-control-label">Người bệnh có hẹn/ <i class="text-primary">Booked appointment patients</i></span>
                                                    </label>
                                                    <div class="css-2 dg cg1 gtc3">
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_oth"
                                                                onclick="__doPostBack('im_consul_req_oth_change', true)"/>
                                                            <span class="custom-control-label">Trường hợp khác/ <i class="text-primary">Other</i></span>
                                                        </label>
                                                        <div runat="server" id="field_im_consul_req_oth" class="form-group mb-2">
                                                            <webUI:TextField runat="server" ID="txt_im_consul_req_oth" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div><span class="font-bold">V. NHU CẦU GIÁO DỤC SỨC KHỎE</span>/ <i class="text-primary">PATIENT EDUCATION NEEDS</i></div>
                                    <div style="margin-left: 120px">
                                        <asp:Label runat="server" ID="lbl_patient_education_needs"/>
                                        <div runat="server" id="patient_education_needs_wrapper" class="mb-2">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" 
                                                        class="custom-control-input" 
                                                        runat="server" 
                                                        id="cb_patient_education_needs_fal" />
                                                <span class="custom-control-label">Phòng ngừa té ngã/ <i class="text-primary">Fall risk prevention</i></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" 
                                                        class="custom-control-input" 
                                                        runat="server" 
                                                        id="cb_patient_education_needs_wou" />
                                                <span class="custom-control-label">Chăm sóc vết thương/ <i class="text-primary">Wound care</i></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" 
                                                        class="custom-control-input" 
                                                        runat="server" 
                                                        id="cb_patient_education_needs_die" />
                                                <span class="custom-control-label">Chế độ ăn uống/ <i class="text-primary">Diet</i></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" 
                                                        class="custom-control-input" 
                                                        runat="server" 
                                                        id="cb_patient_education_needs_pai" />
                                                <span class="custom-control-label">Đau/ <i class="text-primary">Pain</i></span>
                                            </label>
                                            <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="css-2 dg cg1 gtc3">
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" 
                                                                    class="custom-control-input" 
                                                                    runat="server" 
                                                                    id="cb_patient_education_needs_oth"
                                                                    onclick="__doPostBack('patient_education_need_oth_change', true)"/>
                                                            <span class="custom-control-label">Khác/ <i class="text-primary">Others</i></span>
                                                        </label>
                                                        <div runat="server" id="field_patient_edu_need_oth" class="form-group mb-2">
                                                            <webUI:TextField runat="server" ID="txt_patient_edu_need_oth" />
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-actions" style="display: flex; gap: 6px">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel8">
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
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel15">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" OnClick="PrintDocument" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:LinkButton runat="server" OnClick="CancelAmendDocument" ID="btnCancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
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
        
        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^-?\d*\.?\/?\d*$/);
        if (document.getElementById('txt_vs_bmi') != null) setbmiStr(document.getElementById('txt_vs_bmi').value);

        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^-?\d*\.?\/?\d*$/);
            if (document.getElementById('txt_vs_bmi') != null) setbmiStr(document.getElementById('txt_vs_bmi').value);
            $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }
        //function btnPrint_Click() {
        //    let printContent = document.querySelector("#printContent");
        //    printContent.setAttribute("style", "display: block");

        //    let total = Math.ceil(printContent.offsetHeight / 1096);

        //    //for (let i = 1; i <= total; i++) {
        //    //    let div = document.createElement("div");
        //    //    div.setAttribute("class", "watermark page");
        //    //    div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
        //    //    div.setAttribute("data-page", "Page " + i + " of " + total);
        //    //    document.getElementById("print_content").append(div);
        //    //}

        //    setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
        //    window.print();
        //}
    </script>
</body>
</html>


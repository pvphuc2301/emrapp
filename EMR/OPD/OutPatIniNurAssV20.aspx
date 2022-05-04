<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAssV20.aspx.cs" Inherits="EMR.OPD.OutPatIniNurAssV20" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtGender.ascx" TagPrefix="webUI" TagName="PrtGender" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="webUI" TagName="PrtDate" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print.css" rel="stylesheet" />
    <style>
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
          width: 100%;
          border-collapse: collapse;
        }

         span.frac {
          display: inline-block;
          text-align: center;
          vertical-align: middle;
        }

        span.frac > tuso, span.frac > mauso {
          display: block;
          font: inherit;
          padding: 0 0.2em;
        }

        span.frac > tuso { border-bottom: 0.08em solid; }

        span.frac > span { display: none; }

        .v20:after {
           content: 'Version: 2.0';
            font-size: 10px;
            color: #343a40;
            position: absolute;
            right: 10px;
            bottom: 4px;
        }

        .circle {
            border: 1px solid #000;
            border-radius: 50%;
            width: 21px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="printContent" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <%--<img style="width: 100px !important" src="../images/Image-1.jpg" />--%>
                                        <div class="header-info-title">
                                            <h4>PHIẾU ĐÁNH GIÁ ĐIỀU<br />DƯỠNG BỆNH NGOẠI TRÚ</h4>
                                            <h5>OUTPATIENT INITIAL NURSING ASSESSMENT</h5>
                                        </div>
                                        <div style="width: 150px; text-align: left; font-size: 11px">
                                            <asp:Label runat="server" ID="prt_fullname" CssClass="d-block"></asp:Label>
                                            <asp:Label CssClass="d-block" runat="server" ID="prt_DOB"></asp:Label>
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" ID="Line" />
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div style="position: relative;" class="main" runat="server" id="print_content">
                                        <div class="font-bold">I. DẤU HIỆU SINH TỒN/ VITAL SIGNS</div>
                                        
                                        <div style="margin-left: 16px;">
                                            <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                                <tr>
                                                    <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                                    <td class="p-2 text-right" style="width: 100px;"><asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                                    <td class="p-2">Mạch/ Pulse (/min)</td>
                                                    <td class="p-2 text-right" style="width: 100px;"><asp:Label runat="server" ID="prt_pulse" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-2">Cân nặng/ Weight (Kg)</td>
                                                    <td class="p-2 text-right"><asp:Label runat="server" ID="prt_vs_weight" /></td>
                                                    <td class="p-2">Nhịp thở/ Respiratory Rate (/min)</td>
                                                    <td class="p-2 text-right"><asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-2">Chiều cao/Height (cm)</td>
                                                    <td class="p-2 text-right"><asp:Label runat="server" ID="prt_vs_height" /></td>
                                                    <td class="p-2">Huyết áp/Blood pressure (mmHg)</td>
                                                    <td class="p-2 text-right"><asp:Label runat="server" ID="prt_vs_blood_pressure" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-2">Chỉ số khối cơ thể/ BMI (Kg/m2)</td>
                                                    <td class="p-2 text-right"><asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                                    <td class="p-2">Độ bão hòa Oxy/ SpO2 (%)</td>
                                                    <td class="p-2 text-right"><asp:Label runat="server" ID="prt_vs_spO2" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                        
                                        <div class="font-bold">II. ĐÁNH GIÁ/ ASSESSMENT</div>
                                        
                                        <div><span class="font-bold">1. Lý do đến khám/ Chief complaint:</span><asp:Label runat="server" ID="prt_chief_complaint" /></div>

                                        <div style="display: grid; grid-template-columns: auto auto 1fr; grid-gap: 10px">
                                            <div class="font-bold">2. Dị ứng/ Allergy:</div>
                                            <div><asp:Label runat="server" ID="prt_allergy_false" />Không/ No</div>
                                            <div><asp:Label runat="server" ID="prt_allergy_true" />Có, ghi rõ/ Yes, specify:<asp:Label runat="server" ID="prt_allergy_note" /></div>
                                        </div>
                                            
                                        <div class="font-bold">3. Trạng thái tinh thần/ Mental status:</div>
                                        
                                        <div style="margin-left: 16px; display: grid; grid-template-columns: auto auto 1fr; grid-gap: 10px">
                                            <div>Đáp ứng phù hợp/ Appropriate response:</div>
                                            <div><asp:Label runat="server" ID="prt_mental_status_false" />Không/ No</div>
                                            <div><asp:Label runat="server" ID="prt_mental_status_true" />Có, ghi rõ/ Yes, specify:<asp:Label runat="server" ID="prt_mental_status_note" /></div>
                                        </div>

                                        <div class="font-bold">4. Tầm soát bệnh lây nhiễm/ Communicable disease screening</div>

                                        <div style="margin-left: 16px;">
                                            <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                                <tr>
                                                    <td style="width: 150px;" class="text-center p-1">Phân loại <br /><span class="text-primary">Category</span></td>
                                                    <td class="text-center p-1">Tiêu chí <br /><span class="text-primary">Criteria</span></td>
                                                    <td style="width: 50px;" class="text-center p-1">Có <br /><span class="text-primary">Yes</span></td>
                                                    <td style="width: 50px;" class="text-center p-1">Không <br /><span class="text-primary">No</span></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center p-1">Triệu chứng <br /><span class="text-primary">Signs and symptoms</span></td>
                                                    <td class="p-1">Sốt > 38 C và ho, khó thở, tiêu chảy,... <br /><span class="text-primary">Fever > 38 C and cough, dyspnea, diarrhea</span></td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_high_fever_true" />
                                                    </td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_high_fever_false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center p-1" rowspan="2">Dịch tễ <br /><span class="text-primary">Epidemiology</span></td>
                                                    <td class="p-1">Đi từ hay tiếp xúc với người đi từ vùng dịch trong vòng 2 tuần <br /><span class="text-primary">History of travel and in contact with injectious disease outbreak in the past 2 weeks</span></td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_contact_infectious_disease_true" />
                                                    </td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_contact_infectious_disease_false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1">Tiếp xúc gần với người bị sốt, ho, khó thở <br /><span class="text-primary">Had close contact with someone who has fever, cough, dyspnea</span></td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_close_contact_true" />
                                                    </td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_close_contact_false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center p-1">Đánh giá <br /> <span class="text-primary">Assessment</span></td>
                                                    <td class="p-1">Có nguy cơ truyền nhiễm <br /> <span class="text-primary">Injectious risk</span></td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_injectious_risk_true" />
                                                    </td>
                                                    <td class="text-center p-1">
                                                        <asp:Label runat="server" ID="prt_injectious_risk_false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        
                                        <div class="mt-2" style="margin-left: 26px;">• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ triệu chứng, chuyển bệnh nhân sang phòng khám sàng lọc/ <span class="text-primary">If <span class="font-bold">"YES"</span> Signs and symptom risks, transfer patient to screening clinic.</span></div>
                                        <div style="margin-left: 26px;">• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ dịch tể, chuyển bệnh nhân đến phòng cách ly áp lực âm cấp cứu/ <span class="text-primary">If <span class="font-bold">"YES"</span> epidemic risks, transfer patient to Isolation room in Emergency Department.</span></div>
                                        <div style="margin-left: 26px;">• Nếu <span class="font-bold">"KHÔNG"</span> tiếp tục hoàn thành tiểu mục 5, 6, 7, 8/ <span class="text-primary">If <span class="font-bold">"NO"</span> complete part 5, 6, 7, 8 assessment.</span></div>

                                        <div class="font-bold">5. Đánh giá đau/ Pain assessment:</div>

                                        <div style="margin-left: 16px">
                                            Điều dưỡng đánh giá chọn một trong các thang điểm đau bên dưới phù hợp với từng người bệnh. <br />
                                            Nurses select one of the following pain scales in consistent with each sort of patient.
                                        </div>

                                        <section runat="server" id="prt_naf_wrapper" style="display: grid; grid-template-columns: 300px 1fr; grid-gap: 10px; margin-left: 16px">
                                            <div>
                                                <div class="font-bold">Bằng số và Hình mặt (≥ 4 tuổi)/ Numeric and Faces (≥ 4 years):</div>
                                                <div style="display: grid; grid-template-columns: 1fr 1fr">
                                                    <div><asp:Label runat="server" ID="prt_pain_score_code_0" /> Không đau (0) <div style="margin-left: 16px">No hurt</div> </div>
                                                    <div><asp:Label runat="server" ID="prt_pain_score_code_1" /> Đau rất ít (1 - 2)<div style="margin-left: 16px"> Little hurt</div></div>
                                                    <div><asp:Label runat="server" ID="prt_pain_score_code_2" /> Đau nhẹ (3 - 4)<div style="margin-left: 16px"> Slight hurt</div></div>
                                                    <div><asp:Label runat="server" ID="prt_pain_score_code_3" /> Đau vừa (5 - 6)<div style="margin-left: 16px"> Considerable hurt</div></div>
                                                    <div><asp:Label runat="server" ID="prt_pain_score_code_4" /> Đau nhiều (7 - 8)<div style="margin-left: 16px"> Serious hurt</div></div>
                                                    <div><asp:Label runat="server" ID="prt_pain_score_code_5" /> Rất đau (9 - 10)<div style="margin-left: 16px"> Worst hurt</div></div>
                                                </div>
                                            </div>
                                            <img src="../images/2021-12-27_14-08-55.png" />
                                        </section>

                                        <section runat="server" id="prt_flacc_wrapper">
                                            <div style="margin-left: 16px"><label class="control-label font-bold">FLACC (2 tháng - < 4 tuổi) và bệnh nhi dưới 16 tuổi không nói được/ <span class="text-primary">2 month to < 4 years old and non-verbal pediatric patient (patient < 16 years old)</span></label></div>
                                            <div style="margin-left: 16px;">
                                                <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                                    <tr>
                                                        <td class="text-center font-bold p-1" rowspan="2" style="width: 100px">Các Hạng Mục <br /><span class="text-primary">Category</span></td>
                                                        <td class="text-center font-bold p-1" colspan="3">ĐIỂM HÀNH VI/ <span class="text-primary">BEHAVIOUR SCORE</span></td>
                                                        <td class="text-center font-bold p-1" rowspan="2" style="width: 50px">Điểm <br /><span class="text-primary">Score</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center font-bold p-1">0</td>
                                                        <td class="text-center font-bold p-1">1</td>
                                                        <td class="text-center font-bold p-1">2</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">Mặt <br /><span class="text-primary">Face</span></td>
                                                        <td class="p-1">Không biểu hiện cụ thể hoặc đang mỉm cười. <br /><span class="text-primary">No particular expression or is smiling</span></td>
                                                        <td class="p-1">Thỉnh thoảng nhăn mặt hoặc cau mày, thường xuyên run cằm, nghiến răng <br /><span class="text-primary">Occasional grimace or frown, frequent to constant quivering of chin, clenched jaw</span></td>
                                                        <td class="p-1">Lãnh đạm, thời ơ <br /><span class="text-primary">Withdrawn, disinterested</span></td>
                                                        <td  class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_face" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">Chân <br /><span class="text-primary">Legs</span></td>
                                                        <td class="p-1">Vị trí bình thường hoặc Yên tĩnh và thư giãn. <br /><span class="text-primary">Normal position or Is calm and relaxed</span></td>
                                                        <td class="p-1">Khó chịu, bồn chồn, căng thẳng <br /><span class="text-primary">Uneasy, restless, tense</span></td>
                                                        <td class="p-1">Đá chân hoặc bất động hoặc bồn chồn. <br /><span class="text-primary">Kicking or legs drawn up immobility or extremely restless</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_legs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">Cử động <br /><span class="text-primary">Activity</span></td>
                                                        <td class="p-1">
                                                            Nằm im/ <span class="text-primary">Lying quietly</span><br />
                                                            Tư thế bình thường/ <span class="text-primary">Normal position</span><br />
                                                            Đi lại dễ dàng/ <span class="text-primary">Moves easily</span>
                                                        </td>
                                                        <td class="p-1">Loay hoay, luôn thay đổi tư thế/ <span class="text-primary">Squirming, Shifting back and forth</span></td>
                                                        <td class="p-1">Khóc thét hoặc hét lên khi bị chạm vào hoặc cử động/ <span class="text-primary">High-pitched cry or scream when touched or moved</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_activity" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">Khóc <br />
                                                        <span class="text-primary">Cry</span></td>
                                                        <td class="p-1">
                                                            Không khóc/ <span class="text-primary">No cry</span><br />
                                                            Thức hoặc ngủ <br /><span class="text-primary">Awake or sleep</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Rên ri, thỉnh thoảng than phiền <br />
                                                            <span class="text-primary">Moans and whimpers, occasional complaint</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Khóc liên tục, hét lên, nức nở, than phiền thường xuyên <br />
                                                            <span class="text-primary">Crying steadily, screams, sobs, frequent complaint</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_cry" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">
                                                            Xoa dịu <br />
                                                            <span class="text-primary">An ủi</span> <br />
                                                            <span class="text-primary">Consolability</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Hài lòng, thử giãn <br />
                                                            <span class="text-primary">Contents, relaxed</span>
                                                        </td>
                                                        <td class="p-1">
                                                            An ủi bằng thỉnh thoảng chạm, ôm hoặc nói chuyện, dễ bị phân tâm. <br />
                                                            <span class="text-primary">Reassured by occasional touching, hugging or talking to, easily distracted</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Không an ủi được <br />
                                                            <span class="text-primary">Inconsolable</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_consolability" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="p-1 text-right font-bold" colspan="4">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="prt_flacc_total_score" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <div style="display: grid; grid-template-columns: 100px 1fr 1fr 1fr 1fr; grid-gap: 10px; margin-left: 16px;" class="mt-2 mb-2">
                                                <div class="font-bold">Kết luận: <div>Conclude</div></div>
                                                <div><asp:Label runat="server" ID="prt_flacc_conclude_0" />Không đau (0) <div>No risk of malnutrition</div></div>
                                                <div><asp:Label runat="server" ID="prt_flacc_conclude_1" />Đau nhẹ (1-3) <div>Slight pain</div></div>
                                                <div><asp:Label runat="server" ID="prt_flacc_conclude_2" />Đau vừa (4-6) <div>Considerable pain</div></div>
                                                <div><asp:Label runat="server" ID="prt_flacc_conclude_3" />Rất đau (7-10) <div>Worst pain</div></div>
                                            </div>
                                        </section>

                                        <section runat="server" id="prt_npass_wrapper">
                                            <div class="mb-1" style="margin-left: 16px;"><label class="control-label font-bold">Thang điểm đánh giá đau và an thần cho trẻ sơ sinh và nhũ nhi (< 2 tháng tuổi)/ <span class="text-primary">Neonatal and infantile pain, sedation scale (N-PASS) (<2 months)</span></label></div>

                                            <div style="margin-left: 16px;">
                                                <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                                    <tr>
                                                        <td  class="font-bold p-1 text-center" rowspan="2">
                                                            Tiêu chí <br />
                                                            đánh giá <br />
                                                            <span class="text-primary">Assessment <br />
                                                            criteria</span>
                                                        </td>
                                                        <td colspan="2" class="font-bold p-1 text-center">
                                                            An thần <br />
                                                            <span class="text-primary">Sedation</span>
                                                        </td>
                                                        <td class="font-bold p-1 text-center">
                                                            Bình thường <br />
                                                            <span class="text-primary">Normal</span>
                                                        </td>
                                                        <td colspan="2" class="font-bold p-1 text-center">
                                                            Đau <br />
                                                            <span class="text-primary">Pain</span>
                                                        </td>
                                                        <td style="width: 50px" class="font-bold p-1 text-center" rowspan="2">
                                                            Điểm <br />
                                                            <span class="text-primary">Score</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1 font-bold">-2</td>
                                                        <td class="text-center p-1 font-bold">-1</td>
                                                        <td class="text-center p-1 font-bold">0</td>
                                                        <td class="text-center p-1 font-bold">1</td>
                                                        <td class="text-center p-1 font-bold">2</td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center p-1">
                                                            Khóc <br />
                                                            <span class="text-primary">Crying</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Không khóc với <br /> kích thích đau <br />
                                                            <span class="text-primary">No cry with painful stimuli</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Rên rỉ, khóc yếu <br /> với kích thích đau <br />
                                                            <span class="text-primary">Moans or cries <br /> minimally with <br /> painful stimuli</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Khóc tự nhiên, <br />
                                                            Không bứt rứt <br />
                                                            <span class="text-primary">Appropriate crying <br /> Not irritable</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Bứt rứt, quấy khóc <br /> ngắt quãng, có thể <br /> dỗ được <br />
                                                            <span class="text-primary">Irritable or crying at <br /> intervals Consolable</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Khóc cao giọng, <br /> liên tục, không thể <br /> dỗ được <br />
                                                            <span class="text-primary">High-pitched or <br /> silent-continuous cry <br /> Inconsolable</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_crying" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center p-1">
                                                            Biểu hiện <br />
                                                            <span class="text-primary">Behavior</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Không đáp ứng với <br /> bất kỳ kích thích<br />
                                                            <span class="text-primary">No arousal to any <br /> stimuli</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Nhúc nhích nhẹ <br /> khi bị kích thích<br />
                                                            <span class="text-primary">Arouses minimally to <br /> stimuli little <br /> spontaneous <br /> movement</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Cử động phù hợp <br /> tuổi thai<br />
                                                            <span class="text-primary">Appropriate for <br /> gestational age</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Vặn mình, thường thức giấc <br />
                                                            <span class="text-primary">Restless, squirming <br /> Awakens frequently</span>
                                                        </td>
                                                        <td class="p-1 align-top">
                                                            Uốn éo, không ngủ <br /> yên <br />
                                                            <span class="text-primary">Arching, kicking <br /> Constantly awake or <br /> Arouses minimally/ <br /> no movement (not <br /> sedated)</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_behavior" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center p-1">
                                                            Vẻ mặt <br />
                                                            <span class="text-primary">Facial <br /> expression</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Không thay đổi với<br /> kích thích <br />
                                                            <span class="text-primary">No expression</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Thay đổi nhẹ với<br /> kích thích <br />
                                                            <span class="text-primary">Minimal expression <br /> with stimuli</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Thư giãn<br /> Relaxed,<br />
                                                            <span class="text-primary">Appropriate</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Nhăn mặt, không <br /> liên tục
                                                            <span class="text-primary">Any pain expression <br /> intermittent</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Nhăn mặt liên tục <br /> Any pain expression <br /> 
                                                            <span class="text-primary">continual</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_facial_expression" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center p-1">
                                                            Trương lực <br /> chỉ
                                                            <span class="text-primary">Extremities<br /> tone</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Mềm oặt, không<br /> phản xạ nắm<br />
                                                            <span class="text-primary">No grasp reflexes <br /> Flaccid tone</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Giảm trương lực,<br /> phản xạ nắm yếu <br />
                                                            <span class="text-primary">Weak grasp reflex <br /> decrease muscle <br /> tone</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Trương lực bình<br /> thường, tay chân<br /> thư giãn <br />
                                                            <span class="text-primary">Relaxed hands and feet Normal tone</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Các ngón chân <br /> quặp lại, không liên tục, tay nắm lại hoặc xèo ra. Không gồng người
                                                            <span class="text-primary">Intermittent clenched <br /> toes, fists or finger <br /> splay Body is not <br /> tense</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Các ngón chân quặp lại liên tục, tay nắm lại hoặc xèo ra. Gồng người <br />
                                                            <span class="text-primary">Continual clenched <br /> toes, fists, or finger <br /> splay. Body is tense</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_extremities_tone" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center p-1">
                                                            Dấu hiệu <br /> sinh tồn
                                                            <span class="text-primary">Vital signs</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Không dao động khi<br /> bị kích thích<br /> Thở yếu <br /> Ngưng thở
                                                            <span class="text-primary">No variability with <br /> stimuli <br /> Hypoventilation or <br /> apnea</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Thay đổi dưới 10%<br /> so với giới hạn <br /> bình thường khi bị <br /> kích thích
                                                            <span class="text-primary">Decrease 10% <br /> variability from <br /> baseline with stimuli</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Nằm trong giới<br /> hạn bình thường<br /> theo tuổi thai <br />
                                                            <span class="text-primary">Within baseline or <br /> normal for <br /> gestational age</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Tăng 10-20% so <br /> với giới hạn bình <br /> thường SpO2 76 <br /> -85% khi bị kích <br /> thích, hồi phục <br /> nhanh
                                                            <span class="text-primary">Increase 10-20% from <br /> baseline <br /> SaO2 76-85% with <br /> stimulation - quick<br /> toes, fists or finger <br /> splay Body is not <br /> tense</span>
                                                        </td>
                                                        <td class="p-1">
                                                            Tăng trên 20% so <br /> với giới hạn bình <br /> thường <br /> SpO2 dưới 75% <br /> khi bị kích thích, <br /> hồi phục chậm <br /> <br />
                                                            <span class="text-primary">Increase 20% from <br /> baseline <br /> SaO2 ≤ 75% with stimulation - slow <br /> Out of sync with vent</span>
                                                        </td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_vital_signs" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center p-1" rowspan="3">
                                                            Tuổi thai <br />
                                                            hiệu chỉnh <br />
                                                            <span class="text-primary">Gestation <br />
                                                            (Corrected <br /> age)</span>
                                                        </td>
                                                        <td class="text-center" colspan="5">< 28 tuần / <span class="text-primary"><28 weeks</span>: <span class="font-bold">+3</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_gestation_3" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center" colspan="5">28-31 tuần / <span class="text-primary">28-31 weeks</span>: <span class="font-bold">+2</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_gestation_2" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-center" colspan="5">32-35 tuần / <span class="text-primary">32-35 weeks</span>: <span class="font-bold">+1</span></td>
                                                        <td class="p-1 text-center">
                                                            <asp:Label runat="server" ID="prt_npass_gestation_1" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-right font-bold p-1" colspan="6">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                        <td class="text-center">
                                                            <asp:Label runat="server" ID="prt_npass_total_score" ></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            
                                            <div style="display: grid; grid-template-columns: 100px 1fr 1fr 1fr; grid-gap: 10px; margin-left: 16px;" class="mt-2 mb-2">
                                                <div class="font-bold">Kết luận: <div>Conclude</div></div>
                                                <div><asp:Label runat="server" ID="prt_npass_conclude_0" />Không đau (0) <div>No pain</div></div>
                                                <div><asp:Label runat="server" ID="prt_npass_conclude_1" />Đau nhẹ (1-3) <div>Slight pain</div></div>
                                                <div><asp:Label runat="server" ID="prt_npass_conclude_2" />Đau vừa (>3) <div>Considerable - Serious pain</div></div>
                                            </div>
                                        </section>
                                            
                                        <section runat="server" id="prt_nonv_wrapper" class="pt1">
                                            <div>
                                                Đối với người bệnh không nói được điều dưỡng đánh giá riêng trên biểu mẫu (AIH-FRM-021 - Thang điểm theo dõi phản ứng đau của người bệnh không nói được)
                                                <br />
                                                <span class="text-primary"> Nurses use a separated form to evaluate non-verbal patients (AIH-FRM-021 - Behavioural pain scale for non-verbal adult patient)</span>
                                            </div>
                                        </section>

                                        <div class="font-bold">6. Trở ngại chăm sóc/ Barrier to care</div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 150px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                - Trở ngại về ngôn ngữ
                                                <div style="margin-left: 16px">Language Barriers:</div>
                                            </div>
                                            <div><asp:Label runat="server" ID="prt_btc_language_false" /> Không<div style="margin-left: 16px">No</div></div>
                                            <div><asp:Label runat="server" ID="prt_btc_language_true" />Có, giải thích<div style="margin-left: 16px">Yes, explain</div></div>
                                            <asp:Label runat="server" ID="prt_btc_language_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 150px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                - Trở ngại về nhận thức
                                                <div style="margin-left: 16px">Cognitive Barriers:</div>
                                            </div>
                                            <div><asp:Label runat="server" ID="prt_btc_cognitive_false" /> Không<div style="margin-left: 16px">No</div></div>
                                            <div><asp:Label runat="server" ID="prt_btc_cognitive_true" />Có, giải thích<div style="margin-left: 16px">Yes, explain</div></div>
                                            <asp:Label runat="server" ID="prt_btc_cognitive_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 150px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                - Trở ngại về Giác quan
                                                <div style="margin-left: 16px">Sensory Barriers:</div>
                                            </div>
                                            <div><asp:Label runat="server" ID="prt_btc_sensory_false" /> Không<div style="margin-left: 16px">No</div></div>
                                            <div><asp:Label runat="server" ID="prt_btc_sensory_true" />Có, giải thích<div style="margin-left: 16px">Yes, explain </div></div>
                                            <asp:Label runat="server" ID="prt_btc_sensory_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 150px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                - Trở ngại về Tôn giáo
                                                <div style="margin-left: 16px">Religious Barriers:</div>
                                            </div>
                                            <div><asp:Label runat="server" ID="prt_btc_religious_false" /> Không<div style="margin-left: 16px">No</div></div>
                                            <div><asp:Label runat="server" ID="prt_btc_religious_true" />Có, giải thích<div style="margin-left: 16px">Yes, explain </div></div>
                                            <asp:Label runat="server" ID="prt_btc_religious_note" />
                                        </div>

                                        <div style="margin-left: 16px; display: grid; grid-template-columns: 150px auto auto 1fr; grid-gap: 10px">
                                            <div>
                                                - Trở ngại về Văn hóa
                                                <div style="margin-left: 16px">Cultural Barriers:</div>
                                            </div>
                                            <div><asp:Label runat="server" ID="prt_btc_cultural_false" /> Không<div style="margin-left: 16px">No</div></div>
                                            <div><asp:Label runat="server" ID="prt_btc_cultural_true" />Có, giải thích<div style="margin-left: 16px">Yes, explain </div></div>
                                            <asp:Label runat="server" ID="prt_btc_cultural_note" />
                                        </div>

                                        <div class="font-bold">7. Tầm soát nguy cơ té ngã/ Fall risk morse scale</div>

                                        <div style="margin-left: 16px;"><span class="font-bold">- Các yếu tố nguy cơ/ Fall risk factors: </span><asp:Label runat="server" ID="prt_fall_risk_factor_nfr">Không có yếu tố nguy cơ/ No fall risk</asp:Label></div>
                                        
                                        <div runat="server" id="prt_fall_risk_factor" style="margin-left: 32px; display: grid; grid-template-columns: 400px 1fr; grid-gap: 10px">
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_agr" />Tuổi > 65/ Age > 65</div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_pre" />Phụ nữ có thai/ Pregnant women</div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_ina" />Không có khả năng đứng lên từ ghế/ Inability to rise from a chair</div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_pod" />Mất trí nhớ/ Presence of dementia</div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_imp" />Giảm/ Mất thị lực/ Patients with visual impairments</div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_ear" />Bệnh nhân có vấn đề về tai có triệu chứng chóng mặt/ Patients have ear problems with complaints of dizziness and/or vertigo</div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_ale" />Tuổi < 3/ Age < 3</div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_amb" />Sử dụng phương tiện hỗ trợ đi lại (gậy/nạng/khung tập đi)/ Ambulatory devices (canes, crutches, and walkers)</div>
                                                <div><asp:Label runat="server" ID="prt_fall_risk_factor_pat" />Dáng đi yếu hoặc mất thăng bằng/ Patients with gait or balance disturbances</div>
                                            </div>
                                        </div>

                                        <div runat="server" id="prt_fall_risk_factor_nfr_wrapper">
                                            <div style="margin-left: 16px" class="font-bold">- Câu hỏi sàng lọc/ The fall risk screen questions:</div>
                                        
                                            <div style="margin-left: 32px">
                                                a. Anh/chị/ông/bà có từng bị ngã trong 12 tháng gần đây không? <div style="margin-left: 16px">Have you fallen in the past year?</div>
                                                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 10px">
                                                    <div></div>
                                                    <div><asp:Label runat="server" ID="prt_fallen_true" /> Có/ Yes</div>
                                                    <div><asp:Label runat="server" ID="prt_fallen_false" /> Không/ No</div>
                                                </div>
                                            </div>
                                        
                                            <div style="margin-left: 32px">
                                                b. Anh/chị/ông/bà có cảm thấy bị mất thăng bằng lúc đứng dậy hoặc lúc đi không?<div style="margin-left: 16px">Do you feel unsteady when standing or walking?</div>
                                                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 10px">
                                                    <div></div>
                                                    <div><asp:Label runat="server" ID="prt_feel_unsteady_true" /> Có/ Yes</div>
                                                    <div><asp:Label runat="server" ID="prt_feel_unsteady_false" /> Không/ No</div>
                                                </div>
                                            </div>
                                        

                                            <div style="margin-left: 32px">
                                                c. Anh/chị/ông/bà có lo sợ bị ngã không?<div style="margin-left: 16px">Do you worry about falling?</div>
                                                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 10px">
                                                    <div></div>
                                                    <div><asp:Label runat="server" ID="prt_worry_about_falling_true" /> Có/ Yes</div>
                                                    <div><asp:Label runat="server" ID="prt_worry_about_falling_false" /> Không/ No</div>
                                                </div>
                                            </div>
                                        
                                            <div style="margin-left: 16px" class="font-bold">- Can thiệp/ Intervention:</div>

                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_sti" />Dán sticker nguy cơ ngã/ Stick fall-risk on patient's shirt</div>
                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_edu" />Thông báo nguy cơ té ngã cho người bệnh/ người nhà/ Educate the fall risk to patient/ Relatives</div>
                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_ass" />Trợ giúp người bệnh di chuyển, đi lại/ Assist patient with transfer/ ambulation</div>
                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_str" />Cung cấp dụng cụ hỗ trợ di chuyển (Băng ca, xe đẩy...)/ Assist patient with transfer/ ambulation (Stretcher, wheelchair)</div>
                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_epa" />Hướng dẫn ba mẹ/ người thân bệnh nhi luôn quan sát bé cẩn thận và luôn ở cùng bé/ Educate Parents to keep an eye on their children closely and never let him/her alone</div>
                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_ins" />Hướng dẫn ba mẹ/ người thân bệnh nhi hạn chế cho bé chạy nhảy/ Instruct Parents/ accompanying family members limit the child to run</div>
                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_enc" />Khuyến khích di chuyển bằng nôi/ xe nôi đối với trẻ sơ sinh và nhủ nhi/ Encourage parents/ Caregivers to use cribs for newborn/ neonatal in moving</div>
                                            <div style="margin-left: 32px"><asp:Label runat="server" ID="prt_intervention_pfr" />Đeo vòng tay nguy cơ ngã khi/ Place Fall Risk ID bracelet on patient in cases of:</div>
                                        
                                            <div style="margin-left: 48px">• Người bệnh có chỉ định nhập viện nguy cơ té ngã cao/ High fall risk patients with admission order</div>
                                            <div style="margin-left: 48px">• Người bệnh sau thủ thuật có gây tê hoặc gây mê/ Patients after procedure under local or general anesthesia</div>
                                            <div style="margin-left: 48px">• Người bệnh hóa trị liệu/ Patients with chemotherapy</div>
                                            <div style="margin-left: 48px">• Người bệnh được truyền dịch/ Patients with fluid infusion</div>
                                        </div>

                                        <div class="font-bold">8. Đánh giá tình trạng dinh dưỡng/ Nutritional status screening:</div>
                                        
                                        <div style="margin-left: 16px;">
                                            <table class="table-bordered" style="width: 100%">
                                                <tr>
                                                    <td class="p-1">
                                                        BMI = <span class="frac"><tuso>Cân nặng (kg)</tuso><mauso>Chiều cao (m) * Chiều cao (m)</mauso></span>
                                                        BMI = <span class="frac"><tuso>Body weight (kg)</tuso><mauso>Body height (m) * Body height (m)</mauso></span>
                                                    </td>
                                                    <td style="width: 100px" class="text-center">
                                                        <asp:Label runat="server" ID="prt_bmi"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1"><label class="control-label font-bold">Cân nặng 3 tháng trước</label>/ The weight of 3 last month</td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_previous_weight"/>&nbsp;Kg
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1">
                                                        <label class="control-label font-bold">% cân nặng thay đổi = </label> ((cân nặng hiện tại - cân nặng trước)*100) / Cân nặng hiện tại <br />
                                                        <label class="control-label font-bold">% weight change = </label> ((current weight - previous weight)*100) / current weight
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_weight_change"></asp:Label>&nbsp;%
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="text-center mt-2">Khoanh tròn chỉ 1 số trong mỗi câu/ Circle only 1 number in each criterion</div>

                                        <div class="font-bold mt-2" style="margin-left: 16px;">- Tình trạng dinh dưỡng/ Nutrition status:</div>

                                        <div style="margin-left: 16px;">
                                            <table class="table-bordered" style="width: 100%" runat="server" id="Table1">
                                                <tr>
                                                    <td rowspan="3" class="text-center">Trẻ 5 tuổi <br /> Children 5 years old</td>
                                                    <td class="p-1 text-center" style="width: 450px">
                                                        Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -2 độ lệch tiêu chuẩn (SD)</span> <br />
                                                        <span class="text-primary">Weight for length/height ≤ -2 standard devivation (SD)</span>
                                                    </td>
                                                    <td style="width: 100px" class="p-1 text-center">
                                                        <asp:Label runat="server" ID="prt_ns_l_2">2</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">
                                                        Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -1 độ lệch tiêu chuẩn (SD) <br />
                                                        <span class="text-primary">Weight for length/height ≤ -1 standard deviation (SD)
                                                    </td>
                                                    <td class="p-1 text-center">
                                                        <asp:Label runat="server" ID="prt_ns_l_1">1</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">
                                                        Cân nặng theo chiều dài/chiều cao > <span class="font-bold"> 1 độ lệch tiêu chuẩn (SD) <br />
                                                        <span class="text-primary">Weight for length/height > 1 standard deviation (SD)
                                                    </td>
                                                    <td class="p-1 text-center">
                                                        <asp:Label runat="server" ID="prt_ns_l_0">0</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="3" class="text-center">Trẻ > 5 tuổi <br /> Children > 5 years old</td>
                                                    <td class="p-1 text-center">
                                                        BMI theo tuổi ≤ <span class="font-bold"> -2SD</span>/<span class="text-primary">BMI for age ≤ -2SD</span>
                                                    </td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_g_2">2</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">
                                                        BMI theo tuổi ≤ <span class="font-bold"> -1SD</span>/<span class="text-primary">BMI for age ≤ -1SD</span>
                                                    </td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_g_1">1</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">
                                                        BMI theo tuổi > <span class="font-bold"> 1SD</span>/<span class="text-primary">BMI for age > 1SD</span>
                                                    </td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_g_0">0</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center" rowspan="3">Người lớn <br /> Adult patients</td>
                                                    <td class="p-1 text-center">
                                                        BMI < <span class="font-bold"> 18.5</span>
                                                    </td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_a_2">2</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">
                                                        BMI từ /<span class="text-primary">from </span><span class="font-bold"> 18.5 - 20</span>
                                                    </td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_a_1">1</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">
                                                        BMI ><span class="text-primary">20</span>
                                                    </td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_a_0">0</asp:Label></td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="font-bold mt-2" style="margin-left: 16px;">- Sụt cân không chủ ý trong 3 tháng gần đây/ Unintentional weight loss in the last 3 months:</div>

                                        <div style="margin-left: 16px;">
                                            <table class="table-bordered" style="width: 100%">
                                                <tr>
                                                    <td class="p-1 text-center">Giảm > 10%/ <span class="text-primary">Weight loss > 10%</span></td>
                                                    <td style="width: 100px" class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_loss_weight_2">2</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">Giảm từ <span class="font-bold">5 - 10%</span> / <span class="text-primary">Weight loss from 5 - 10%</span></td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_loss_weight_1">1</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">Giảm < <span class="text-primary">5%</span> / <span class="text-primary">Weight loss < 5%</span></td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_loss_weight_0">0</asp:Label></td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="font-bold mt-2" style="margin-left: 16px;">- Khả năng ăn uống/ Food intake:</div>

                                        <div style="margin-left: 16px;">
                                            <table class="table-bordered" style="width: 100%">
                                                <tr>
                                                    <td class="p-1 text-center">Ăn uống kém hơn <span class="font-bold">5 ngày</span> gần đây/ <span class="text-primary">Eating less than the last 5 days</span></td>
                                                    <td style="width: 100px" class="p-1 text-center">
                                                        <asp:Label runat="server" ID="prt_ns_food_intake_2">2</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-center">Ăn uống bình thường/ <span class="text-primary">Eating normally</span></td>
                                                    <td class="p-1 text-center"><asp:Label runat="server" ID="prt_ns_food_intake_0">0</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-right font-bold">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                    <td class="text-center">
                                                        <asp:Label runat="server" ID="prt_ns_total_score" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div style="display: grid; grid-template-columns: auto 200px 196px 1fr; grid-gap: 10px; margin-left: 16px;" class="mt-2 mb-2">
                                            <div class="font-bold">Kết luận <div>Conclude:</div></div>
                                            <div><asp:Label runat="server" ID="prt_nutritional_conclude_0" />Không có nguy cơ thiếu dinh dưỡng/ No risk of malnutrition (0)</div>
                                            <div><asp:Label runat="server" ID="prt_nutritional_conclude_1" />Nguy cơ thiếu dinh dưỡng thấp/ Low risk of malnutrition (1)</div>
                                            <div><asp:Label runat="server" ID="prt_nutritional_conclude_2" />Nguy cơ thiếu dinh dưỡng cao/ High risk of malnutrition (≥ 2)</div>
                                        </div>

                                        <div class="font-bold">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ SOCIAL FACTORS ASSESSMENT:</div>
                                        
                                        <div style="display: grid; grid-template-columns: auto 1fr 1fr; grid-gap: 10px; margin-left: 16px;">
                                            <div class="font-bold">Tình trạng sinh sống/ Housing:</div>
                                            <div><asp:Label runat="server" ID="prt_housing_code_aln" /> Sống một mình/ Lives alone</div>
                                            <div><asp:Label runat="server" ID="prt_housing_code_rel" /> Sống với người thân/ With relatives</div>
                                        </div>

                                        <div class="font-bold">IV. MỨC ĐỘ ƯU TIÊN/ PRIORITIZATION</div>
                                        
                                        <div style="margin-left: 24px"><asp:Label runat="server" ID="prt_prioritization_code" /></div>
                                        
                                        <asp:PlaceHolder runat="server" ID="ph_prt_im_consul_req">
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_eme" />Tình trạng nặng cần xử trí ngay/ Emergency cases</div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_chi" />Trẻ em dưới 6 tuổi/ Children are under 6 years of age</div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_ser" />Người khuyết tật nặng/ Servere disabilities</div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_pat" />Người bệnh trên 80 tuổi/ Patient are over 80 years of age</div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_pre" />Phụ nữ có thai trên 24 tuần/ Prenancy is over 24 weeks.</div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_boo" />Người bệnh có hẹn/ Booked appointment patients.</div>
                                            <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_im_consul_req_oth" />Trường hợp khác/ Other: <asp:Label runat="server" ID="prt_im_consul_req_oth_note" /></div>
                                        </asp:PlaceHolder>
                                        
                                        <div class="font-bold">V. NHU CẦU GIÁO DỤC SỨC KHỎE/ PATIENT EDUCATION NEEDS</div>

                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_fal" />Phòng ngừa té ngã/ Fall risk prevention</div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_wou" />Chăm sóc vết thương/ Wound care</div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_die" />Chế độ ăn uống/ Diet</div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_pai" />Đau/ pain</div>
                                        <div style="margin-left: 34px"><asp:Label runat="server" ID="prt_patient_education_need_oth" />Khác/ Others:<asp:Label runat="server" ID="prt_patient_education_need_oth_note" /></div>
                                        
                                        <div class="d-grid" style="grid-template-columns: 1fr auto">
                                            <div></div>
                                            <div class="text-center">
                                                <asp:Label CssClass="d-block" runat="server" ID="prt_signature_date" />
                                                <asp:Label CssClass="d-block" runat="server" ID="Label3" Text="Điều dưỡng đánh giá/ Assessment done by Nurse" />
                                                <asp:Label CssClass="d-block" runat="server" ID="Label1" Text="(Họ tên, chữ ký và MSNV/ (Full Name, signature and ID))" />
                                                <%--<asp:Label CssClass="d-block" Style="line-height: 10px; margin-bottom: 70px;" runat="server" ID="Label2" Text="Assessment done by Nurse" />--%>
                                                <asp:Label  runat="server" ID="prt_signature_name" />
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" style="font-size: 10px">
                                    <%--<img style="width: 100%" src="../images/Footer.jpg" />--%>
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
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
                      <li>Outpatient Initial Nursing Assessment</li>
                    </ul>
                    <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
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
                            <div class="col-lg-12">
                                <div class="card v20">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body mb-4">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="LinkViewLastestVersion" CssClass="btn-link" Text="View Latest Version" runat="server" />
                                                    </div>

                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1" />
                                                        <a class="btn-link" href="javascript:void(0)" onclick="openRadWindow()">View History</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS</span></label></div>
                                            
                                            <div style="display: grid; grid-gap: 4px; grid-template-columns: 240px 1fr">
                                                <label class="control-label text-right">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_temperature"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_temperature_wrapper">
                                                        <input id="txt_vs_temperature" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>

                                                <label class="control-label text-right">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_weight"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_weight_wrapper">
                                                        <input onchange="CalculateBmi1()" id="txt_vs_weight" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>

                                                <label class="control-label text-right">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_height"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_height_wrapper">
                                                        <input id="txt_vs_height" onchange="CalculateBmi1()"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                                <label for="bmi" class="control-label text-right">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_bmi"></asp:Label>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_bmi_wrapper">
                                                        <input onchange="vs_bmi_change()" id="txt_vs_bmi" data-type="number" style="width: 120px; height: 23.2px;" runat="server" disabled="disabled" class="form-control text-right" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                    </div>
                                                    <asp:Label runat="server" ID="bmiStr"></asp:Label>
                                                    <div class="mb-1">(Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
        applicable for children and pregnant</span>)</div>
                                                </div>

                                                <label for="head-circumference" class="control-label text-right">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_pulse"/>
                                                    <div class="form-group d-inline-block" runat="server" id="pulse_wrapper">
                                                        <input id="txt_pulse" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                                <label class="control-label text-right">Mạch/ <span class="text-primary">Pulse:</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_heart_rate_wrapper">
                                                        <input id="txt_vs_heart_rate" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>

                                                <label class="control-label text-right">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>                                                
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_respiratory_rate_wrapper">
                                                        <input  id="txt_vs_respiratory_rate" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>

                                                <label class="control-label text-right">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_blood_pressure_wrapper">
                                                        <input id="txt_vs_blood_pressure" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                            
                                                <label for="spO2" class="control-label text-right">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_vs_spo2"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_spo2_wrapper">
                                                        <input id="txt_vs_spo2"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                            </div>

                                            

                                            <div><label class="control-label font-bold">II. ĐÁNH GIÁ/ <span class="text-primary">ASSESSMENT</span></label></div>

                                            <div><label class="control-label font-bold">1. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label></div>
                                            
                                            <div class="pt1">
                                                <asp:Label runat="server" ID="lbl_chief_complaint" />
                                                <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">2. Dị ứng/ <span class="text-primary">Allergy:</span></label></div>

                                            <div>
                                                <div></div>
                                                <div>
                                                    <div runat="server" id="allergy_wrapper">
                                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class="pt1">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" 
                                                                            class="custom-control-input" 
                                                                            onclick="__doPostBack('allergy_change', false)"/>
                                                                        <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" 
                                                                            class="custom-control-input" 
                                                                            onclick="__doPostBack('allergy_change', true)"/>
                                                                        <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                        <%--<a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                                        </a>--%>
                                                                    </div>
                                                                </div>

                                                                <div runat="server" id="field_allergy_true" 
                                                                    class="pt1 form-group">
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

                                            <div><label class="control-label font-bold">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label></div>

                                            <div>
                                                <label class="pt1 control-label">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response: </span><asp:Label runat="server" ID="lbl_mental_status" /></label>
                                                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div runat="server" id="mental_status_wrapper" class="pt1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input runat="server" type="radio" id="rad_mental_status_true" name="rad_mental_status" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('mental_status_change', true)"/>
                                                                <label class="custom-control-label" for="rad_mental_status_true">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input runat="server" type="radio" id="rad_mental_status_false" name="rad_mental_status" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('mental_status_change', false)"/>
                                                                <label class="custom-control-label" for="rad_mental_status_false">No, ghi rõ/ <span class="text-primary">No, specify:</span></label>
                                                                <%--<a href="javascript:void(0)" data-clear="rad_mental_status" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare6" />
                                                                </a>--%>
                                                                <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="Group1" ErrorMessage="Trạng thái tinh thần/ Appropriate response is required" CssClass="text-danger" OnServerValidate="CustomValidatorMentalStatus_ServerValidate"></asp:CustomValidator>--%>
                                                            </div>

                                                            <div runat="server" id="field_mental_status_false" class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_mental_status_note" TextMode="SingleLine" />
                                                                <%--<asp:CustomValidator ID="CustomValidator1" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorMentalStatusNote_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />--%>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>

                                            <div><label class="control-label font-bold">4. Tầm soát bệnh lây nhiễm/ <span class="text-primary">Communicable disease screening:</span></label></div>

                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                            <div class="pt1">
                                                <table class="table-bordered" style="width: 100%">
                                                    <tr>
                                                        <td style="width: 150px;" class="text-center p-1">Phân loại <br /><span class="text-primary">Category</span></td>
                                                        <td class="text-center p-1">Tiêu chí <br /><span class="text-primary">Criteria</span></td>
                                                        <td style="width: 50px;" class="text-center p-1">Có <br /><span class="text-primary">Yes</span></td>
                                                        <td style="width: 50px;" class="text-center p-1">Không <br /><span class="text-primary">No</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">Triệu chứng <br /><span class="text-primary">Signs and symptoms</span></td>
                                                        <td class="p-1">Sốt > 38 C và ho, khó thở, tiêu chảy,... <br /><span class="text-primary">Fever > 38 C and cough, dyspnea, diarrhea</span></td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_high_fever_true" name="rad_high_fever" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('high_fever_change', true)"/>
                                                                <label class="custom-control-label" for="rad_high_fever_true"></label>
                                                            </div>
                                                        </td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_high_fever_false" name="rad_high_fever" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('high_fever_change', false)"/>
                                                                <label class="custom-control-label" for="rad_high_fever_false"></label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1" rowspan="2">Dịch tễ <br /><span class="text-primary">Epidemiology</span></td>
                                                        <td class="p-1">Đi từ hay tiếp xúc với người đi từ vùng dịch trong vòng 2 tuần <br /><span class="text-primary">History of travel and in contact with injectious disease outbreak in the past 2 weeks</span></td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_contact_infectious_disease_true" name="rad_infected_with_covid" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('contact_infectious_disease_change', true)"/>
                                                                <label class="custom-control-label" for="rad_contact_infectious_disease_true"></label>
                                                            </div>
                                                        </td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_contact_infectious_disease_false" name="rad_infected_with_covid" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('contact_infectious_disease_change', false)"/>
                                                                <label class="custom-control-label" for="rad_contact_infectious_disease_false"></label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="p-1">Tiếp xúc gần với người bị sốt, ho, khó thở <br /><span class="text-primary">Had close contact with someone who has fever, cough, dyspnea</span></td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_close_contact_true" name="rad_close_contact" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('close_contact_change', true)"/>
                                                                <label class="custom-control-label" for="rad_close_contact_true"></label>
                                                            </div>
                                                        </td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_close_contact_false" name="rad_close_contact" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('close_contact_change', false)"/>
                                                                <label class="custom-control-label" for="rad_close_contact_false"></label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center p-1">Đánh giá <br /> <span class="text-primary">Assessment</span></td>
                                                        <td class="p-1">Có nguy cơ truyền nhiễm <br /> <span class="text-primary">Injectious risk</span></td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_injectious_risk_true" name="rad_injectious_risk" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('injectious_risk_change', true)"/>
                                                                <label class="custom-control-label" for="rad_injectious_risk_true"></label>
                                                            </div>
                                                        </td>
                                                        <td class="p-1">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_injectious_risk_false" name="rad_injectious_risk" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('injectious_risk_change', false)"/>
                                                                <label class="custom-control-label" for="rad_injectious_risk_false"></label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                                    </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div class="pt1">
                                                <div>• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ triệu chứng, chuyển bệnh nhân sang phòng khám sàng lọc/ <span class="text-primary">If <span class="font-bold">"YES"</span> Signs and symptom risks, transfer patient to screening clinic.</span></div>
                                                <div>• Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ dịch tể, chuyển bệnh nhân đến phòng cách ly áp lực âm cấp cứu/ <span class="text-primary">If <span class="font-bold">"YES"</span> epidemic risks, transfer patient to Isolation room in Emergency Department.</span></div>
                                                <div>• Nếu <span class="font-bold">"KHÔNG"</span> tiếp tục hoàn thành tiểu mục 5, 6, 7, 8/ <span class="text-primary">If <span class="font-bold">"NO"</span> complete part 5, 6, 7, 8 assessment.</span></div>
                                            </div>
                                            
                                            <div><label class="control-label font-bold">5. Đánh giá đau/ <span class="text-primary">Pain assessment:</span></label></div>

                                            <div class="pt1">
                                                Điều dưỡng đánh giá chọn một trong các thang điểm đau bên dưới phù hợp với từng người bệnh. <br />
                                                <span class="text-primary">Nurses select one of the following pain scales in consistent with each sort of patient.</span>
                                            </div>

                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div runat="server" id="pain_assessment_scale_wrapper"
                                                        class="pt1">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_naf_true" name="rad_pain_assessment" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('pain_assessment_change', 'field_naf')"  />
                                                            <label class="custom-control-label" for="rad_naf_true">Numeric and Faces</label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_flacc_true" name="rad_pain_assessment" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('pain_assessment_change', 'field_flacc')" />
                                                            <label class="custom-control-label" for="rad_flacc_true">FLACC</label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_npass_true" name="rad_pain_assessment" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('pain_assessment_change', 'field_npass')" />
                                                            <label class="custom-control-label" for="rad_npass_true">N-PASS</label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_nonv_true" name="rad_pain_assessment" 
                                                                class="custom-control-input" 
                                                                onclick="__doPostBack('pain_assessment_change', 'field_nonv')" />
                                                            <label class="custom-control-label" for="rad_nonv_true">Non-verbal</label>
                                                        </div>
                                                    </div>

                                                    <section id="field_naf" runat="server"
                                                        class="pt1">
                                                        <div runat="server" id="paint_score_code_wrapper"
                                                            style="width: 435px; display: inline-block; vertical-align: top">
                                                            <label class="control-label font-bold">Bằng số và Hình mặt (≥ 4 tuổi)/ <span class="text-primary">Numeric and Faces (≥ 4 years):</span></label>
                                                            <div style="display: grid; grid-template-columns: 205px 1fr">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" id="rad_paint_score_code_0" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_paint_score_code_0">Không đau (0)/ <span class="text-primary">No hurt</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" id="rad_paint_score_code_1" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_paint_score_code_1">Đau rất ít (1 - 2)/ <span class="text-primary">Little hurt</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" id="rad_paint_score_code_2" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_paint_score_code_2">Đau nhẹ (3 - 4)/ <span class="text-primary">Slight hurt</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" id="rad_paint_score_code_3" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_paint_score_code_3">Đau vừa (5 - 6)/ <span class="text-primary">Considerable hurt</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" id="rad_paint_score_code_4" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_paint_score_code_4">Đau nhiều (7 - 8)/ <span class="text-primary">Serious hurt</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" id="rad_paint_score_code_5" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_paint_score_code_5">Rất đau (9 - 10)/ <span class="text-primary">Worst hurt</span></label>
                                                                    <%--<a class="btn-clear-option" href="javascript:void(0)" data-clear="rad_paint_score_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                                    </a>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div><asp:Label runat="server" ID="lbl_paint_score_description" /></div>
                                                        
                                                        <img src="../images/2021-12-27_14-08-55.png" />
                                                    </section>

                                                    <section runat="server" id="field_flacc">
                                                        <div class="pt1"><label class="control-label font-bold">FLACC (2 tháng - < 4 tuổi) và bệnh nhi dưới 16 tuổi không nói được/ <span class="text-primary">2 month to < 4 years old and non-verbal pediatric patient (patient < 16 years old)</span></label></div>
                                                        <div class="pt1">
                                                            <table class="table-bordered">
                                                                <tr>
                                                                    <td class="text-center font-bold p-1" rowspan="2">Các Hạng Mục <br /><span class="text-primary">Category</span></td>
                                                                    <td class="text-center font-bold p-1" colspan="3">ĐIỂM HÀNH VI/ <span class="text-primary">BEHAVIOUR SCORE</span></td>
                                                                    <td class="text-center font-bold p-1" rowspan="2" style="width: 80px">Điểm <br /><span class="text-primary">Score</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center font-bold p-1">0</td>
                                                                    <td class="text-center font-bold p-1">1</td>
                                                                    <td class="text-center font-bold p-1">2</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center p-1">Mặt <br /><span class="text-primary">Face</span></td>
                                                                    <td class="p-1">Không biểu hiện cụ thể hoặc đang mỉm cười. <br /><span class="text-primary">No particular expression or is smiling</span></td>
                                                                    <td class="p-1">Thỉnh thoảng nhăn mặt hoặc cau mày, thường xuyên run cằm, nghiến răng <br /><span class="text-primary">Occasional grimace or frown, frequent to constant quivering of chin, clenched jaw</span></td>
                                                                    <td class="p-1">Lãnh đạm, thời ơ <br /><span class="text-primary">Withdrawn, disinterested</span></td>
                                                                    <td class="p-1 text-center">
                                                                        <asp:Label runat="server" ID="lbl_flacc_face" />
                                                                        <asp:TextBox ID="txt_flacc_face" runat="server" Width="100%" CssClass="text-right"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center p-1">Chân <br /><span class="text-primary">Legs</span></td>
                                                                    <td class="p-1">Vị trí bình thường hoặc Yên tĩnh và thư giãn. <br /><span class="text-primary">Normal position or Is calm and relaxed</span></td>
                                                                    <td class="p-1">Khó chịu, bồn chồn, căng thẳng <br /><span class="text-primary">Uneasy, restless, tense</span></td>
                                                                    <td class="p-1">Đá chân hoặc bất động hoặc bồn chồn. <br /><span class="text-primary">Kicking or legs drawn up immobility or extremely restless</span></td>
                                                                    <td class="p-1 text-center">
                                                                        <asp:Label runat="server" ID="lbl_flacc_legs" />
                                                                        <asp:TextBox ID="txt_flacc_legs" runat="server" Width="100%" CssClass="text-right"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center p-1">Cử động <br /><span class="text-primary">Activity</span></td>
                                                                    <td class="p-1">
                                                                        Nằm im/ <span class="text-primary">Lying quietly</span><br />
                                                                        Tư thế bình thường/ <span class="text-primary">Normal position</span><br />
                                                                        Đi lại dễ dàng/ <span class="text-primary">Moves easily</span>
                                                                    </td>
                                                                    <td class="p-1">Loay hoay, luôn thay đổi tư thế/ <span class="text-primary">Squirming, Shifting back and forth</span></td>
                                                                    <td class="p-1">Khóc thét hoặc hét lên khi bị chạm vào hoặc cử động/ <span class="text-primary">High-pitched cry or scream when touched or moved</span></td>
                                                                    <td class="p-1 text-center">
                                                                        <asp:Label runat="server" ID="lbl_flacc_activity" />
                                                                        <asp:TextBox ID="txt_flacc_activity" runat="server" Width="100%" CssClass="text-right" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center p-1">Khóc <br />
                                                                    <span class="text-primary">Cry</span></td>
                                                                    <td class="p-1">
                                                                        Không khóc/ <span class="text-primary">No cry</span><br />
                                                                        Thức hoặc ngủ <br /><span class="text-primary">Awake or sleep</span>
                                                                    </td>
                                                                    <td class="p-1">
                                                                        Rên ri, thỉnh thoảng than phiền <br />
                                                                        <span class="text-primary">Moans and whimpers, occasional complaint</span>
                                                                    </td>
                                                                    <td class="p-1">
                                                                        Khóc liên tục, hét lên, nức nở, than phiền thường xuyên <br />
                                                                        <span class="text-primary">Crying steadily, screams, sobs, frequent complaint</span>
                                                                    </td>
                                                                    <td class="p-1 text-center">
                                                                        <asp:Label runat="server" ID="lbl_flacc_cry" />
                                                                        <asp:TextBox ID="txt_flacc_cry" runat="server" Width="100%" CssClass="text-right"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center p-1">
                                                                        Xoa dịu <br />
                                                                        <span class="text-primary">An ủi</span> <br />
                                                                        <span class="text-primary">Consolability</span>
                                                                    </td>
                                                                    <td class="p-1">
                                                                        Hài lòng, thử giãn <br />
                                                                        <span class="text-primary">Contents, relaxed</span>
                                                                    </td>
                                                                    <td class="p-1">
                                                                        An ủi bằng thỉnh thoảng chạm, ôm hoặc nói chuyện, dễ bị phân tâm. <br />
                                                                        <span class="text-primary">Reassured by occasional touching, hugging or talking to, easily distracted</span>
                                                                    </td>
                                                                    <td class="p-1">
                                                                        Không an ủi được <br />
                                                                        <span class="text-primary">Inconsolable</span>
                                                                    </td>
                                                                    <td class="p-1 text-center">
                                                                        <asp:Label runat="server" ID="lbl_flacc_consolability" />
                                                                        <asp:TextBox ID="txt_flacc_consolability" runat="server" Width="100%" CssClass="text-right" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="p-1 text-right font-bold" colspan="4">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                                    <td class="text-center">
                                                                        <asp:Label runat="server" ID="flacc_total_score" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        
                                                        <div class="pt1 dg gtc1">
                                                            <label class="control-label font-bold">Kết luận/ <span class="text-primary">Conclude</span>:</label>
                                                            <asp:Label runat="server" ID="lbl_flacc_conclude1"></asp:Label>
                                                        </div>
                                                    </section>

                                                    <section runat="server" id="field_npass" class="pt1">
                                                        <div class="mb-1"><label class="control-label font-bold">Thang điểm đánh giá đau và an thần cho trẻ sơ sinh và nhũ nhi (< 2 tháng tuổi)/ <span class="text-primary">Neonatal and infantile pain, sedation scale (N-PASS) (<2 months)</span></label></div>

                                                        <table class="mb-2 table-bordered">
                                                            <tr>
                                                                <td class="font-bold p-1 text-center" rowspan="2">
                                                                    Tiêu chí <br />
                                                                    đánh giá <br />
                                                                    <span class="text-primary">Assessment <br />
                                                                    criteria</span>
                                                                </td>
                                                                <td colspan="2" class="font-bold p-1 text-center">
                                                                    An thần <br />
                                                                    <span class="text-primary">Sedation</span>
                                                                </td>
                                                                <td class="font-bold p-1 text-center">
                                                                    Bình thường <br />
                                                                    <span class="text-primary">Normal</span>
                                                                </td>
                                                                <td colspan="2" class="font-bold p-1 text-center">
                                                                    Đau <br />
                                                                    <span class="text-primary">Pain</span>
                                                                </td>
                                                                <td class="font-bold p-1 text-center" rowspan="2">
                                                                    Điểm <br />
                                                                    <span class="text-primary">Score</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center p-1 font-bold">-2</td>
                                                                <td class="text-center p-1 font-bold">-1</td>
                                                                <td class="text-center p-1 font-bold">0</td>
                                                                <td class="text-center p-1 font-bold">1</td>
                                                                <td class="text-center p-1 font-bold">2</td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center p-1">
                                                                    Khóc <br />
                                                                    <span class="text-primary">Crying</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Không khóc với <br /> kích thích đau <br />
                                                                    <span class="text-primary">No cry with painful stimuli</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Rên rỉ, khóc yếu <br /> với kích thích đau <br />
                                                                    <span class="text-primary">Moans or cries <br /> minimally with <br /> painful stimuli</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Khóc tự nhiên, <br />
                                                                    Không bứt rứt <br />
                                                                    <span class="text-primary">Appropriate crying <br /> Not irritable</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Bứt rứt, quấy khóc <br /> ngắt quãng, có thể <br /> dỗ được <br />
                                                                    <span class="text-primary">Irritable or crying at <br /> intervals Consolable</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Khóc cao giọng, <br /> liên tục, không thể <br /> dỗ được <br />
                                                                    <span class="text-primary">High-pitched or <br /> silent-continuous cry <br /> Inconsolable</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_crying" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_crying" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center p-1">
                                                                    Biểu hiện <br />
                                                                    <span class="text-primary">Behavior</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Không đáp ứng với <br /> bất kỳ kích thích<br />
                                                                    <span class="text-primary">No arousal to any <br /> stimuli</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Nhúc nhích nhẹ <br /> khi bị kích thích<br />
                                                                    <span class="text-primary">Arouses minimally to <br /> stimuli little <br /> spontaneous <br /> movement</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Cử động phù hợp <br /> tuổi thai<br />
                                                                    <span class="text-primary">Appropriate for <br /> gestational age</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Vặn mình, thường thức giấc <br />
                                                                    <span class="text-primary">Restless, squirming <br /> Awakens frequently</span>
                                                                </td>
                                                                <td class="p-1 align-top">
                                                                    Uốn éo, không ngủ <br /> yên <br />
                                                                    <span class="text-primary">Arching, kicking <br /> Constantly awake or <br /> Arouses minimally/ <br /> no movement (not <br /> sedated)</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_behavior" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_behavior" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center p-1">
                                                                    Vẻ mặt <br />
                                                                    <span class="text-primary">Facial <br /> expression</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Không thay đổi với<br /> kích thích <br />
                                                                    <span class="text-primary">No expression</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Thay đổi nhẹ với<br /> kích thích <br />
                                                                    <span class="text-primary">Minimal expression <br /> with stimuli</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Thư giãn<br /> Relaxed,<br />
                                                                    <span class="text-primary">Appropriate</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Nhăn mặt, không <br /> liên tục
                                                                    <span class="text-primary">Any pain expression <br /> intermittent</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Nhăn mặt liên tục <br /> Any pain expression <br /> 
                                                                    <span class="text-primary">continual</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_facial_expression" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_facial_expression" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center p-1">
                                                                    Trương lực <br /> chỉ
                                                                    <span class="text-primary">Extremities<br /> tone</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Mềm oặt, không<br /> phản xạ nắm<br />
                                                                    <span class="text-primary">No grasp reflexes <br /> Flaccid tone</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Giảm trương lực,<br /> phản xạ nắm yếu <br />
                                                                    <span class="text-primary">Weak grasp reflex <br /> decrease muscle <br /> tone</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Trương lực bình<br /> thường, tay chân<br /> thư giãn <br />
                                                                    <span class="text-primary">Relaxed hands and feet Normal tone</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Các ngón chân <br /> quặp lại, không liên tục, tay nắm lại hoặc xèo ra. Không gồng người
                                                                    <span class="text-primary">Intermittent clenched <br /> toes, fists or finger <br /> splay Body is not <br /> tense</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Các ngón chân quặp lại liên tục, tay nắm lại hoặc xèo ra. Gồng người <br />
                                                                    <span class="text-primary">Continual clenched <br /> toes, fists, or finger <br /> splay. Body is tense</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_extremities_tone" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_extremities_tone" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center p-1">
                                                                    Dấu hiệu <br /> sinh tồn
                                                                    <span class="text-primary">Vital signs</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Không dao động khi<br /> bị kích thích<br /> Thở yếu <br /> Ngưng thở
                                                                    <span class="text-primary">No variability with <br /> stimuli <br /> Hypoventilation or <br /> apnea</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Thay đổi dưới 10%<br /> so với giới hạn <br /> bình thường khi bị <br /> kích thích
                                                                    <span class="text-primary">Decrease 10% <br /> variability from <br /> baseline with stimuli</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Nằm trong giới<br /> hạn bình thường<br /> theo tuổi thai <br />
                                                                    <span class="text-primary">Within baseline or <br /> normal for <br /> gestational age</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Tăng 10-20% so <br /> với giới hạn bình <br /> thường SpO2 76 <br /> -85% khi bị kích <br /> thích, hồi phục <br /> nhanh
                                                                    <span class="text-primary">Increase 10-20% from <br /> baseline <br /> SaO2 76-85% with <br /> stimulation - quick<br /> toes, fists or finger <br /> splay Body is not <br /> tense</span>
                                                                </td>
                                                                <td class="p-1">
                                                                    Tăng trên 20% so <br /> với giới hạn bình <br /> thường <br /> SpO2 dưới 75% <br /> khi bị kích thích, <br /> hồi phục chậm <br /> <br />
                                                                    <span class="text-primary">Increase 20% from <br /> baseline <br /> SaO2 ≤ 75% with stimulation - slow <br /> Out of sync with vent</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_vital_signs" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_vital_signs" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center p-1" rowspan="3">
                                                                    Tuổi thai <br />
                                                                    hiệu chỉnh <br />
                                                                    <span class="text-primary">Gestation <br />
                                                                    (Corrected <br /> age)</span>
                                                                </td>
                                                                <td class="text-center" colspan="5">< 28 tuần / <span class="text-primary"><28 weeks</span>: <span class="font-bold">+3</span></td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_gestation_3" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_gestation_3" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center" colspan="5">28-31 tuần / <span class="text-primary">28-31 weeks</span>: <span class="font-bold">+2</span></td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_gestation_2" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_gestation_2" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-center" colspan="5">32-35 tuần / <span class="text-primary">32-35 weeks</span>: <span class="font-bold">+1</span></td>
                                                                <td class="p-1 text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_gestation_1" />
                                                                    <asp:TextBox Width="80" ID="txt_npass_gestation_1" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-right font-bold p-1" colspan="6">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                                <td class="text-center">
                                                                    <asp:Label runat="server" ID="lbl_npass_total_score" ></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <div class="dg gtc1">
                                                            <label class="control-label font-bold">Kết luận/ <span class="text-primary">Conclude</span>:</label>
                                                            <asp:Label runat="server" ID="lbl_npass_conclude1" ></asp:Label>
                                                        </div>
                                                    </section>
                                            
                                                    <section runat="server" id="field_nonv"
                                                        class="pt1">
                                                        <div>
                                                            Đối với người bệnh không nói được điều dưỡng đánh giá riêng trên biểu mẫu (AIH-FRM-021 - Thang điểm theo dõi phản ứng đau của người bệnh không nói được)
                                                            <br />
                                                            <span class="text-primary"> Nurses use a separated form to evaluate non-verbal patients (AIH-FRM-021 - Behavioural pain scale for non-verbal adult patient)</span>
                                                        </div>
                                                    </section>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div><label class="control-label font-bold">6. Trở ngại chăm sóc/ <span class="text-primary">Barrier to care:</span></label></div>
                                            
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="pt1 dg gtc1">
                                                        <label class="control-label mb-1">- Trở ngại về ngôn ngữ/ <span class="text-primary">Language Barriers:</span></label>
                                                        <asp:Label runat="server" ID="lbl_btc_language"/>
                                                        <div runat="server" id="btc_language_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_btc_language_false" name="rad_btc_language" runat="server"
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('btc_language_change', false)"  />
                                                                <label class="custom-control-label" for="rad_btc_language_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_btc_language_true" name="rad_btc_language" runat="server"
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('btc_language_change',true)"  />
                                                                <label class="custom-control-label" for="rad_btc_language_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            </div>
                                                            <div id="field_btc_language_true" runat="server" 
                                                                class="form-group mt-2">
                                                                <webUI:TextField runat="server" ID="txt_btc_language_note" TextMode="SingleLine" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc1 pt1">
                                                        <label class="control-label mb-1 mr-2">- Trở ngại về nhận thức/ <span class="text-primary">Cognitive Barriers:</span></label>
                                                        <asp:Label runat="server" ID="lbl_btc_cognitive"/>
                                                        <div runat="server" id="btc_cognitive_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_btc_cognitive_false" name="rad_btc_cognitive" runat="server"
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('btc_cognitive_change', false)" />
                                                                <label class="custom-control-label" for="rad_btc_cognitive_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio  d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_btc_cognitive_true" name="rad_btc_cognitive"
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('btc_cognitive_change', true)" />
                                                                <label class="custom-control-label" for="rad_btc_cognitive_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            </div>

                                                            <div runat="server" id="field_btc_cognitive_true" 
                                                                class="form-group mb-2">
                                                                <webUI:TextField runat="server" ID="txt_btc_cognitive_note" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc1 pt1">
                                                        <label class="control-label mb-1 mr-2">- Trở ngại về Giác quan/ <span class="text-primary">Sensory Barriers:</span></label>
                                                        <asp:Label runat="server" ID="lbl_btc_sensory"/>
                                                        <div runat="server" id="btc_sensory_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_btc_sensory_false" name="rad_btc_sensory" runat="server"
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('btc_sensory_change', false)" />
                                                                <label class="custom-control-label" for="rad_btc_sensory_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_btc_sensory_true" name="rad_btc_sensory" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('btc_sensory_change', true)" />
                                                                <label class="custom-control-label" for="rad_btc_sensory_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            </div>
                                                            <div runat="server" id="field_btc_sensory_true"
                                                                class="form-group mb-2">
                                                                <webUI:TextField runat="server" ID="txt_btc_sensory_note" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc1 pt1">
                                                        <label class="control-label mb-1 mr-2">- Trở ngại về Tôn giáo/ <span class="text-primary">Religious Barriers:</span></label>
                                                        <asp:Label runat="server" ID="lbl_btc_religious"/>
                                                
                                                        <div runat="server" id="btc_religious_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_btc_religious_false" name="rad_btc_religious" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('btc_religious_change', false)" />
                                                                <label class="custom-control-label" for="rad_btc_religious_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_btc_religious_true" name="rad_btc_religious" 
                                                                    class="custom-control-input"
                                                                    onclick="__doPostBack('btc_religious_change', true)" />
                                                                <label class="custom-control-label" for="rad_btc_religious_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            </div>
                                                            <div runat="server" id="field_btc_religious_true"
                                                                class="form-group mb-2">
                                                                <webUI:TextField runat="server" ID="txt_btc_religious_note" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc1 pt1">
                                                        <label class="control-label mb-1 mr-2">- Trở ngại về Văn hóa/ <span class="text-primary">Cultural Barriers:</span></label>
                                                        <asp:Label runat="server" ID="lbl_btc_cultural"/>
                                                
                                                        <div runat="server" id="btc_cultural_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_btc_cultural_false" name="rad_btc_cultural" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('btc_cultural_change', false)" />
                                                                <label class="custom-control-label" for="rad_btc_cultural_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_btc_cultural_true" name="rad_btc_cultural" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('btc_cultural_change', true)" />
                                                                <label class="custom-control-label" for="rad_btc_cultural_true">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                            </div>
                                                            <div runat="server" id="field_btc_cultural_true"
                                                                class="form-group mb-2">
                                                                <webUI:TextField runat="server" ID="txt_btc_cultural_note" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div><label class="control-label font-bold">7. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk morse scale:</span></label></div>
                           
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="dg gtc3">
                                                        <div class="pt1"><label class="control-label font-bold">- Các yếu tố nguy cơ/ <span class="text-primary">Fall risk factors:</span></label></div>
                                                        <asp:Label runat="server" ID="lbl_no_fall_risk"/>
                                                        <div runat="server" id="no_fall_risk_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_no_fall_risks_true" name="rad_no_fall_risks" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('no_fall_risks_change', true)" />
                                                                <label class="custom-control-label" for="rad_no_fall_risks_true">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input runat="server" type="radio" id="rad_no_fall_risks_false" name="rad_no_fall_risks" 
                                                                    class="custom-control-input" 
                                                                    onclick="__doPostBack('no_fall_risks_change', false)" />
                                                                <label class="custom-control-label" for="rad_no_fall_risks_false">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div runat="server" id="field_no_fall_risks_false">
                                                        <div runat="server" id="fall_risk_factors_field"
                                                            class="pt1 dg gtc2">
                                                            <div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_agr" />
                                                                        <span class="custom-control-label">Tuổi > 65/ <span class="text-primary">Age > 65</span></span>
                                                                    </label>
                                                                </div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_pre" />
                                                                        <span class="custom-control-label">Phụ nữ có thai/ <span class="text-primary">Pregnant women</span></span>
                                                                    </label>
                                                                </div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_ina" />
                                                                        <span class="custom-control-label">Không có khả năng đứng lên từ ghế/ <span class="text-primary">Inability to rise from a chair.</span></span>
                                                                    </label>
                                                                </div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_pod" />
                                                                        <span class="custom-control-label">Mất trí nhớ/ <span class="text-primary">Presence of dementia</span></span>
                                                                    </label>
                                                                </div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_ear" />
                                                                        <span class="custom-control-label">Bệnh nhân có vấn đề về tai có triệu chứng chóng mặt/ <span class="text-primary">Patients have ear problems with complaints of dizziness and/or vertigo.</span></span>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_ale" />
                                                                        <span class="custom-control-label">Tuổi < 3/ <span class="text-primary">Age < 3</span></span>
                                                                    </label>
                                                                </div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_amb" />
                                                                        <span class="custom-control-label">Sử dụng phương tiện hỗ trợ đi lại (gậy/nạng/khung tập đi)/ <span class="text-primary">Ambulatory devices (canes, crutches, and walkers)</span></span>
                                                                    </label>
                                                                </div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_pat" />
                                                                        <span class="custom-control-label">Dáng đi yếu hoặc mất thăng bằng/ <span class="text-primary">Patients with gait or balance disturbances</span></span>
                                                                    </label>
                                                                </div>
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_imp" />
                                                                        <span class="custom-control-label">Giảm/ Mất thị lực/ <span class="text-primary">Patients with visual impairments</span></span>
                                                                    </label>
                                                                </div>
                                                                <div style="display: none;">
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_fall_risk_factors_nfr" />
                                                                        <span class="custom-control-label">Không có yếu tố nguy cơ/ <span class="text-primary">No fall risk</span></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="pt1">
                                                            <label class="control-label font-bold">- Câu hỏi sàng lọc/ <span class="text-primary">The fall risk screen question</span>:</label>
                                                            <div class="pt1">a. Anh/chị/ông/bà có từng bị ngã trong 12 tháng gần đây không?/ <span class="text-primary">Have you fallen in the past year?</span></div>
                                                            <div class="pt1 dg gtc1">
                                                                <div></div>
                                                                <asp:Label runat="server" ID="lbl_fallen"/>
                                                            </div>
                                                            <div runat="server" id="fallen_field" 
                                                                class="pt1 dg gtc1">
                                                                <div></div>
                                                                <div>
                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input type="radio" id="rad_fallen_true" runat="server" name="rad_fallen" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fallen_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input type="radio" id="rad_fallen_false" runat="server" name="rad_fallen" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fallen_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="pt1">b. Anh/chị/ông/bà có cảm thấy bị mất thăng bằng lúc đứng dậy hoặc lúc đi không?/ <span class="text-primary">Do you feel unsteady when standing or walking?</span></div>
                                                            <div class="pt1 dg gtc1">
                                                                <div></div>
                                                                <asp:Label runat="server" ID="lbl_feel_unsteady"/>
                                                            </div>
                                                            <div runat="server" id="feel_unsteady_field"
                                                                class="pt1 dg gtc1">
                                                                <div></div>
                                                                <div>
                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input type="radio" id="rad_feel_unsteady_true" runat="server" name="rad_feel_unsteady" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_feel_unsteady_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input type="radio" id="rad_feel_unsteady_false" runat="server" name="rad_feel_unsteady" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_feel_unsteady_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="pt1">c. Anh/chị/ông/bà có lo sợ bị ngã không?/ <span class="text-primary">Do you worry about falling?</span></div>
                                                            <div class="pt1 dg gtc1">
                                                                <div></div>
                                                                <asp:Label runat="server" ID="lbl_worry_about_falling"/>
                                                            </div>
                                                            <div runat="server" id="worry_about_falling_field"
                                                                class="pt1 dg gtc1">
                                                                <div></div>
                                                                <div>
                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input type="radio" id="rad_worry_about_falling_true" runat="server" name="rad_worry_about_falling" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_worry_about_falling_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input type="radio" id="rad_worry_about_falling_false" runat="server" name="rad_worry_about_falling" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_worry_about_falling_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                
                                                        <div class="pt1">
                                                            <div class="dg gtc1">
                                                                <label class="font-bold">- Can thiệp/ <span class="text-primary">Intervention</span>:</label>
                                                                <asp:Label runat="server" ID="lbl_intervention"/>
                                                            </div>
                                                            <div runat="server" id="intervention_field">
                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_sti" />
                                                                        <span class="custom-control-label">Dán sticker nguy cơ ngã/ <span class="text-primary">Stick fall-risk on patient's shirt</span></span>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_edu" />
                                                                        <span class="custom-control-label">Thông báo nguy cơ té ngã cho người bệnh/ người nhà/ <span class="text-primary">Educate the fall risk to patient/ Relatives</span></span>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_ass" />
                                                                        <span class="custom-control-label">Trợ giúp người bệnh di chuyển, đi lại/ <span class="text-primary">Assist patient with transfer/ ambulation.</span></span>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_str" />
                                                                        <span class="custom-control-label">Cung cấp dụng cụ hỗ trợ di chuyển (Băng ca, xe đẩy...)/ <span class="text-primary">Assist patient with transfer/ ambulation (Stretcher, wheelchair)</span></span>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_epa" />
                                                                        <span class="custom-control-label">Hướng dẫn ba mẹ/ người thân bệnh nhi luôn quan sát bé cẩn thận và luôn ở cùng bé/ <span class="text-primary">Educate Parents to keep an eye on their children closely and never let him/her alone.</span></span>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_ins" />
                                                                        <span class="custom-control-label">Hướng dẫn ba mẹ/ người thân bệnh nhi hạn chế cho bé chạy nhảy/ <span class="text-primary">Instruct Parents/ accompanying family members limit the child to run.</span></span>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_enc" />
                                                                        <span class="custom-control-label">Khuyến khích di chuyển bằng nôi/ xe nôi đối với trẻ sơ sinh và nhủ nhi/ <span class="text-primary">Encourage parents/ Caregivers to use cribs for newborn/ neonatal in moving.</span></span>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_intervention_pfr" />
                                                                        <span class="custom-control-label">Đeo vòng tay nguy cơ ngã khi/ <span class="text-primary">Place Fall Risk ID bracelet on patient in cases of:</span></span>
                                                                    </label>
                                                                </div>

                                                                <ul>
                                                                    <li>Người bệnh có chỉ định nhập viện nguy cơ té ngã cao/ <span class="text-primary">High fall risk patients with admission order</span></li>
                                                                    <li>Người bệnh sau thủ thuật có gây tê hoặc gây mê/ <span class="text-primary">Patients after procedure under local or general anesthesia</span></li>
                                                                    <li>Người bệnh hóa trị liệu/ <span class="text-primary">Patients with chemotherapy</span></li>
                                                                    <li>Người bệnh được truyền dịch/ <span class="text-primary">Patients with fluid infusion.</span></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div><label class="control-label font-bold">8. Đánh giá tình trạng dinh dưỡng/ <span class="text-primary">Nutritional status screening:</span></label></div>
                                            
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="pt1">
                                                        <table style="width: 100%" class="table-bordered">
                                                            <tr>
                                                                <td class="p-1">
                                                                    BMI = <span class="frac"><tuso>Cân nặng (kg)</tuso><mauso>Chiều cao (m) * Chiều cao (m)</mauso></span>
                                                                    BMI = <span class="frac"><tuso>Body weight (kg)</tuso><mauso>Body height (m) * Body height (m)</mauso></span>
                                                                </td>
                                                                <td style="width: 240px" class="text-center">
                                                                    <asp:Label runat="server" ID="lbl_bmi"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1"><label class="control-label font-bold">Cân nặng 3 tháng trước</label>/ The weight of 3 last month</td>
                                                                <td class="text-center">
                                                                    <asp:Label runat="server" ID="lbl_previous_weight"/>
                                                                    <div class="form-group d-inline-block" runat="server" id="previous_weight_wrapper">
                                                                        <input onchange="__doPostBack('weight_of_last_month_change','')" id="txt_previous_weight" data-type="number" style="width: 100%" runat="server" class="form-control text-right" />
                                                                        <span class="append">Kg</span>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1">
                                                                    <label class="control-label font-bold">% cân nặng thay đổi = </label> ((cân nặng hiện tại - cân nặng trước)*100) / Cân nặng hiện tại <br />
                                                                    <label class="control-label font-bold">% weight change = </label> ((current weight - previous weight)*100) / current weight
                                                                </td>
                                                                <td class="text-center">
                                                                    <asp:Label runat="server" ID="lbl_weight_change"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="pt1"><label class="control-label font-bold">- Tình trạng dinh dưỡng/ <span class="text-primary">Nutrition status:</span></label></div>
                                                    
                                                    <div runat="server" id="nutrition_status_age_wrapper" class="pt1">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_ns_l" name="rad_nutrition_status_age" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('nutrition_status_age_change','l')" />
                                                            <label class="custom-control-label" for="rad_ns_l">Trẻ ≤ 5 tuổi/ <span class="text-primary">Children ≤ 5 years old</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_ns_g" name="rad_nutrition_status_age"
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('nutrition_status_age_change','g')" />
                                                            <label class="custom-control-label" for="rad_ns_g">Trẻ > 5 tuổi/ <span class="text-primary">Children > 5 years old</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_ns_a" name="rad_nutrition_status_age"
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('nutrition_status_age_change','a')" />
                                                            <label class="custom-control-label" for="rad_ns_a">Người lớn/ <span class="text-primary">Adult patients</span></label>
                                                        </div>
                                                    </div>

                                                    <div class="pt1">
                                                        <table class="table-bordered" style="width: 100%" runat="server" id="field_nutrition_status_l">
                                                            <tr>
                                                                <td class="p-1 text-center">
                                                                    Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -2 độ lệch tiêu chuẩn (SD)</span> <br />
                                                                    <span class="text-primary">Weight for length/height ≤ -2 standard devivation (SD)</span>
                                                                </td>
                                                                <td style="width: 240px" class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_l_2" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','2')" />
                                                                        <label class="custom-control-label" for="rad_ns_l_2">2</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">
                                                                    Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -1 độ lệch tiêu chuẩn (SD) <br />
                                                                    <span class="text-primary">Weight for length/height ≤ -1 standard deviation (SD)
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_l_1" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','1')" />
                                                                        <label class="custom-control-label" for="rad_ns_l_1">1</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">
                                                                    Cân nặng theo chiều dài/chiều cao > <span class="font-bold"> 1 độ lệch tiêu chuẩn (SD) <br />
                                                                    <span class="text-primary">Weight for length/height > 1 standard deviation (SD)
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_l_0" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','0')" />
                                                                        <label class="custom-control-label" for="rad_ns_l_0">0</label>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                        </table>

                                                        <table class="table-bordered" style="width: 100%" runat="server" id="field_nutrition_status_g">
                                                            <tr>
                                                                <%--<td class="p-1 text-center" rowspan="3">Trẻ > 5 tuổi <br /> <span class="text-primary">Children > 5 years old</span></td>--%>
                                                                <td class="p-1 text-center">
                                                                    BMI theo tuổi ≤ <span class="font-bold"> -2SD</span>/<span class="text-primary">BMI for age ≤ -2SD</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_g_2" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','2')" />
                                                                        <label class="custom-control-label" for="rad_ns_g_2">2</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">
                                                                    BMI theo tuổi ≤ <span class="font-bold"> -1SD</span>/<span class="text-primary">BMI for age ≤ -1SD</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_g_1" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','1')" />
                                                                        <label class="custom-control-label" for="rad_ns_g_1">1</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">
                                                                    BMI theo tuổi > <span class="font-bold"> 1SD</span>/<span class="text-primary">BMI for age > 1SD</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_g_0" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','0')" />
                                                                        <label class="custom-control-label" for="rad_ns_g_0">0</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                            
                                                        <table class="table-bordered" style="width: 100%" runat="server" id="field_nutrition_status_a">
                                                            <tr>
                                                                <%--<td class="p-1 text-center" rowspan="3">Người lớn <br /> <span class="text-primary">Adult patients</span></td>--%>
                                                                <td class="p-1 text-center">
                                                                    BMI < <span class="font-bold"> 18.5</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_a_2" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','2')" />
                                                                        <label class="custom-control-label" for="rad_ns_a_2">2</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">
                                                                    BMI từ /<span class="text-primary">from </span><span class="font-bold"> 18.5 - 20</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_a_1" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','1')" />
                                                                        <label class="custom-control-label" for="rad_ns_a_1">1</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">
                                                                    BMI ><span class="text-primary">20</span>
                                                                </td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_a_0" name="rad_nutrition_status"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('nutrition_status_change','0')" />
                                                                        <label class="custom-control-label" for="rad_ns_a_0">0</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                    <asp:HiddenField runat="server" ID="ns_age_score" />
                                                    
                                                    <div class="pt1"><label class="control-label font-bold">- Sụt cân không chủ ý trong 3 tháng gần đây/ <span class="text-primary">Unintentional weight loss in the last 3 months:</span></label></div>
                                                
                                                    <div class="pt1">
                                                        <table class="table-bordered" style="width: 100%">
                                                            <tr>
                                                                <td class="p-1 text-center">Giảm > 10%/ <span class="text-primary">Weight loss > 10%</span></td>
                                                                <td style="width: 240px" class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_loss_weight_2" name="rad_ns_loss_weight"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('ns_loss_weight_change','2')" />
                                                                        <label class="custom-control-label" for="rad_ns_loss_weight_2">2</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">Giảm từ <span class="font-bold">5 - 10%</span> / <span class="text-primary">Weight loss from 5 - 10%</span></td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_loss_weight_1" name="rad_ns_loss_weight"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('ns_loss_weight_change','1')" />
                                                                        <label class="custom-control-label" for="rad_ns_loss_weight_1">1</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">Giảm < <span class="text-primary">5%</span> / <span class="text-primary">Weight loss < 5%</span></td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_loss_weight_0" name="rad_ns_loss_weight"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('ns_loss_weight_change','0')" />
                                                                        <label class="custom-control-label" for="rad_ns_loss_weight_0">0</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                    <asp:HiddenField runat="server" ID="ns_loss_weight_score" />

                                                    <div class="pt1"><label class="control-label font-bold">- Khả năng ăn uống/ <span class="text-primary">Food intake:</span></label></div>
                                                
                                                    <div class="pt1">
                                                        <table class="table-bordered" style="width: 100%">
                                                            <tr>
                                                                <td class="p-1 text-center">Ăn uống kém hơn <span class="font-bold">5 ngày</span> gần đây/ <span class="text-primary">Eating less than the last 5 days</span></td>
                                                                <td style="width: 240px" class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_food_intake_2" name="rad_ns_food_intake"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('ns_food_intake_change','2')" />
                                                                        <label class="custom-control-label" for="rad_ns_food_intake_2">2</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-center">Ăn uống bình thường/ <span class="text-primary">Eating normally</span></td>
                                                                <td class="p-1 text-center">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_ns_food_intake_0" name="rad_ns_food_intake"
                                                                            class="custom-control-input"
                                                                            onclick="__doPostBack('ns_food_intake_change','0')" />
                                                                        <label class="custom-control-label" for="rad_ns_food_intake_0">0</label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="p-1 text-right font-bold">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                                <td class="text-center">
                                                                    <asp:Label runat="server" ID="lbl_ns_total_score" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                    <asp:HiddenField runat="server" ID="ns_food_intake_score" />
                                        
                                                    <div class="dg gtc1 pt1">
                                                        <div><label class="control-label font-bold">Kết luận </label>/ <span class="text-primary">Conclude</span>:</div>
                                                        <div><asp:Label runat="server" ID="lbl_nutritional_conclude1" /></div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div><label class="control-label font-bold">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ <span class="text-primary">SOCIAL FACTORS ASSESSMENT</span>:</label></div>
                                            
                                            <div class="pt1 dg gtc1">
                                                <label class="control-label font-bold">Tình trạng sinh sống/ <span class="text-primary">Housing</span>: </label>
                                                <div>
                                                    <div runat="server" id="housing_code_wrapper">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" runat="server" id="rad_housing_code_aln" name="rad_housing_code" 
                                                                class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_housing_code_aln">Sống một mình/ <span class="text-primary">Lives alone</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" runat="server" id="rad_housing_code_rel" name="rad_housing_code" 
                                                                class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_housing_code_rel">Sống với người thân/ <span class="text-primary">With relatives</span></label>
                                                            <%--<a href="javascript:void(0)" data-clear="rad_housing_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare3" />
                                                            </a>--%>
                                                        </div>
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_housing_description" />
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">IV. MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION</span></label></div>

                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div runat="server" id="lbl_prioritization_code"
                                                        class="pt1">
                                                        <asp:Label runat="server" ID="lbl_prioritization_description" />
                                                        <div class="pt1"><asp:Label runat="server" ID="lbl_immediate_consulting_requirement" /></div>
                                                    </div>

                                                    <div runat="server" id="prioritization_code_wrapper"
                                                        class="pt1">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" runat="server" id="rad_prioritization_code_wa" name="rad_prioritization_code" 
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('prioritization_change', false)"/>
                                                            <label class="custom-control-label" for="rad_prioritization_code_wa">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                                            <%--<a href="javascript:void(0)" data-clear="rad_prioritization_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare4" />
                                                            </a>--%>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" runat="server" id="rad_prioritization_code_im" name="rad_prioritization_code"
                                                                class="custom-control-input"
                                                                onclick="__doPostBack('prioritization_change', true)"/>
                                                            <label class="custom-control-label" for="rad_prioritization_code_im">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                                        </div>
                                                    </div>
                                                    
                                                    <div runat="server" id="immediate_consulting_requirement"
                                                        class="pt1">
                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_eme" />
                                                                <span class="custom-control-label">Tình trạng nặng cần xử lí ngay/ <span class="text-primary">Emergency cases</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_chi" />
                                                                <span class="custom-control-label">Trẻ em dưới 6 tuổi/ <span class="text-primary">Children are under 6 years of age</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_ser" />
                                                                <span class="custom-control-label">Người khuyết tật nặng/ <span class="text-primary">Servere disabilities</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_pat" />
                                                                <span class="custom-control-label">Người bệnh trên 80 tuổi/ <span class="text-primary">Patient are over 80 years of age</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_pre" />
                                                                <span class="custom-control-label">Phụ nữ có thai trên 24 tuần/ <span class="text-primary">Prenancy is over 24 weeks</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_boo" />
                                                                <span class="custom-control-label">Người bệnh có hẹn/ <span class="text-primary">Booked appointment patients</span></span>
                                                            </label>
                                                        </div>

                                                        <div class="css-2 dg cg1 gtc3">
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_im_consul_req_oth"
                                                                    onclick="__doPostBack('im_consul_req_oth_change', true)"/>
                                                                <span class="custom-control-label">Trường hợp khác/ <span class="text-primary">Other</span></span>
                                                            </label>
                                                            <div runat="server" id="field_im_consul_req_oth"
                                                                class="form-group mb-2">
                                                                <webUI:TextField runat="server" ID="txt_im_consul_req_oth" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div><label class="control-label font-bold">V. NHU CẦU GIÁO DỤC SỨC KHỎE/ <span class="text-primary">PATIENT EDUCATION NEEDS</span></label></div>

                                            <asp:Label CssClass="pt1" runat="server" ID="lbl_patient_education_needs"/>

                                            <div runat="server" id="patient_education_needs_wrapper" class="pt1">
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_patient_education_need_fal" />
                                                        <span class="custom-control-label">Phòng ngừa té ngã/ <span class="text-primary">Fall risk prevention</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_patient_education_need_wou" />
                                                        <span class="custom-control-label">Chăm sóc vết thương/ <span class="text-primary">Wound care</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_patient_education_need_die" />
                                                        <span class="custom-control-label">Chế độ ăn uống/ <span class="text-primary">Diet</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_patient_education_need_pai" />
                                                        <span class="custom-control-label">Đau/ <span class="text-primary">Pain</span></span>
                                                    </label>
                                                </div>
                                                <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="css-2 dg cg1 gtc3">
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_patient_education_need_oth"
                                                                    onclick="__doPostBack('patient_education_need_oth_change', true)"/>
                                                                <span class="custom-control-label">Khác/ <span class="text-primary">Others</span></span>
                                                            </label>
                                                            <div runat="server" id="field_patient_edu_need_oth" 
                                                                class="form-group mb-2">
                                                                <webUI:TextField runat="server" ID="txt_patient_edu_need_oth" />
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete"  CssClass="btn btn-primary waves-effect" >Complete</asp:LinkButton>

                                                    <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect" >Save</asp:LinkButton>

                                                    <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>


                                                    <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClientClick="btnPrint_Click(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary waves-effect">Cancel</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>

                                        <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                            <ModalBody>
                                                <div class="text-center">
                                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                    <h4 class="mt-4 mb-4">Delete document?
                                                    </h4>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/checkValidFields.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    <script>

        

        function openRadWindow() {
            var radwindow = $find('<%=RadWindow1.ClientID %>');
            radwindow.show();
        }

        //document.getElementsByClassName("main")[0].style.border = "1px solid #000";
        document.getElementById("print_content").style.border = "0.1px solid #fff";

        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
        if (document.getElementById('txt_vs_bmi') != null) setbmiStr(document.getElementById('txt_vs_bmi').value);

        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        var txt_flacc_face;
        var txt_flacc_legs;
        var txt_flacc_activity;
        var txt_flacc_cry;
        var txt_flacc_consolability;
        var flacc_total_score;
        var lbl_flacc_conclude1;

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
            if (document.getElementById('txt_vs_bmi') != null) setbmiStr(document.getElementById('txt_vs_bmi').value);
            $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);

            txt_flacc_face = document.getElementById("<%=txt_flacc_face.ClientID%>");
            txt_flacc_legs = document.getElementById("<%=txt_flacc_legs.ClientID%>");
            txt_flacc_activity = document.getElementById("<%=txt_flacc_activity.ClientID%>");
            txt_flacc_cry = document.getElementById("<%=txt_flacc_cry.ClientID%>");
            txt_flacc_consolability = document.getElementById("<%=txt_flacc_consolability.ClientID%>");
            flacc_total_score = document.getElementById("<%=flacc_total_score.ClientID%>");
            lbl_flacc_conclude1 = document.getElementById("<%=lbl_flacc_conclude1.ClientID%>");

            if (txt_flacc_face) txt_flacc_face.addEventListener("blur", CalculateFLACC);
            if (txt_flacc_legs) txt_flacc_legs.addEventListener("blur", CalculateFLACC);
            if (txt_flacc_activity) txt_flacc_activity.addEventListener("blur", CalculateFLACC);
            if (txt_flacc_cry) txt_flacc_cry.addEventListener("blur", CalculateFLACC);
            if (txt_flacc_consolability) txt_flacc_consolability.addEventListener("blur", CalculateFLACC);

            //npass
            txt_npass_crying = document.getElementById("<%=txt_npass_crying.ClientID%>");
            txt_npass_behavior = document.getElementById("<%=txt_npass_behavior.ClientID%>");
            txt_npass_facial_expression = document.getElementById("<%=txt_npass_facial_expression.ClientID%>");
            txt_npass_extremities_tone = document.getElementById("<%=txt_npass_extremities_tone.ClientID%>");
            txt_npass_vital_signs = document.getElementById("<%=txt_npass_vital_signs.ClientID%>");
            txt_npass_gestation_3 = document.getElementById("<%=txt_npass_gestation_3.ClientID%>");
            txt_npass_gestation_2 = document.getElementById("<%=txt_npass_gestation_2.ClientID%>");
            txt_npass_gestation_1 = document.getElementById("<%=txt_npass_gestation_1.ClientID%>");
            lbl_npass_total_score = document.getElementById("<%=lbl_npass_total_score.ClientID%>");
            lbl_npass_conclude1 = document.getElementById("<%=lbl_npass_conclude1.ClientID%>");

            if (txt_npass_crying) txt_npass_crying.addEventListener("blur", CalculateNPASS);
            if (txt_npass_behavior) txt_npass_behavior.addEventListener("blur", CalculateNPASS);
            if (txt_npass_facial_expression) txt_npass_facial_expression.addEventListener("blur", CalculateNPASS);
            if (txt_npass_extremities_tone) txt_npass_extremities_tone.addEventListener("blur", CalculateNPASS);
            if (txt_npass_vital_signs) txt_npass_vital_signs.addEventListener("blur", CalculateNPASS);
            if (txt_npass_gestation_3) txt_npass_gestation_3.addEventListener("blur", CalculateNPASS);
            if (txt_npass_gestation_2) txt_npass_gestation_2.addEventListener("blur", CalculateNPASS);
            if (txt_npass_gestation_1) txt_npass_gestation_1.addEventListener("blur", CalculateNPASS);
        }

        function CalculateFLACC() {
            var total =
                (isNaN(parseInt(txt_flacc_face.value)) ? 0 : parseInt(txt_flacc_face.value))
                + (isNaN(parseInt(txt_flacc_legs.value)) ? 0 : parseInt(txt_flacc_legs.value))
                + (isNaN(parseInt(txt_flacc_activity.value)) ? 0 : parseInt(txt_flacc_activity.value))
                + (isNaN(parseInt(txt_flacc_cry.value)) ? 0 : parseInt(txt_flacc_cry.value))
                + (isNaN(parseInt(txt_flacc_consolability.value)) ? 0 : parseInt(txt_flacc_consolability.value))

            console.log(total);

            flacc_total_score.innerText = total;

            let flacc_conclude_str;

            switch (total) {
                case 0:
                    flacc_conclude_str = "Không đau/ No pain (0)";
                    break;
                case 1:
                case 2:
                case 3:
                    flacc_conclude_str = "Đau nhẹ/ Slight pain (1 - 3)";
                    break;
                case 4:
                case 5:
                case 6:
                    flacc_conclude_str = "Đau vừa/ Considerable pain (4 - 6)";
                    break;
                case 7:
                case 8:
                case 9:
                case 10:
                    flacc_conclude_str = "Rất đau/ Worst pain (7 - 10)";
                    break;
            }

            lbl_flacc_conclude1.innerText = flacc_conclude_str;
        }

        //npass
        var txt_npass_crying;
        var txt_npass_behavior;
        var txt_npass_facial_expression;
        var txt_npass_extremities_tone;
        var txt_npass_vital_signs;
        var txt_npass_gestation_3;
        var txt_npass_gestation_2;
        var txt_npass_gestation_1;
        var lbl_npass_total_score;
        var lbl_npass_conclude1;

        function CalculateNPASS() {
            var total =
                (isNaN(parseInt(txt_npass_crying.value)) ? 0 : parseInt(txt_npass_crying.value))
                + (isNaN(parseInt(txt_npass_behavior.value)) ? 0 : parseInt(txt_npass_behavior.value))
                + (isNaN(parseInt(txt_npass_facial_expression.value)) ? 0 : parseInt(txt_npass_facial_expression.value))
                + (isNaN(parseInt(txt_npass_extremities_tone.value)) ? 0 : parseInt(txt_npass_extremities_tone.value))
                + (isNaN(parseInt(txt_npass_vital_signs.value)) ? 0 : parseInt(txt_npass_vital_signs.value))
                + (isNaN(parseInt(txt_npass_gestation_3.value)) ? 0 : parseInt(txt_npass_gestation_3.value))
                + (isNaN(parseInt(txt_npass_gestation_2.value)) ? 0 : parseInt(txt_npass_gestation_2.value))
                + (isNaN(parseInt(txt_npass_gestation_1.value)) ? 0 : parseInt(txt_npass_gestation_1.value))

            lbl_npass_total_score.innerText = total;

            let conclude;

            switch (total) {
                case 0:
                    conclude = "Không đau/ No pain";
                    break;
                case 1:
                case 2:
                case 3:
                    conclude = "Đau nhẹ/ Slight pain (1 - 3)";
                    break;
                default:
                    conclude = "Đau vừa - nhiều/ Considerable - Serious pain";
                    break;
            }

            lbl_npass_conclude1.innerText = conclude;
        }

        function btnPrint_Click() {
            let printContent = document.querySelector("#printContent");
            printContent.setAttribute("style", "display: block");

            let total = Math.ceil(printContent.offsetHeight / 1096);

            //for (let i = 1; i <= total; i++) {
            //    let div = document.createElement("div");
            //    div.setAttribute("class", "watermark page");
            //    div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
            //    div.setAttribute("data-page", "Page " + i + " of " + total);
            //    document.getElementById("print_content").append(div);

            //}

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
            window.print();
        }

        <%--loadprintform();

        function loadprintform() {
            
            let chief_complaint = document.getElementById("<%= lbl_chief_complaint.ClientID %>").innerText;
            let allergy = document.getElementById("<%= lbl_allergy.ClientID %>").innerText;
            let mental_status = document.getElementById("<%= lbl_mental_status.ClientID %>").innerText;
            
            document.getElementById("prt_chief_complaint").innerText = "1. Lý do đến khám/ Chief complaint: " + chief_complaint;
            document.getElementById("prt_allergy").innerText = "2. Dị ứng/ Allergy: " + allergy;
            document.getElementById("prt_mental_status").innerHTML = "3. Trạng thái tinh thần/ Mental status: <br>Đáp ứng phù hợp/ Appropriate response: " + allergy;
            
        }--%>

        function CalculateBmi1() {
            let vs_height = document.getElementById('txt_vs_height');
            let vs_weight = document.getElementById('txt_vs_weight');
            let vs_bmi = document.getElementById('txt_vs_bmi');
            let lbl_vs_bmi = document.getElementById('lbl_bmi');
            
            if (vs_height.value == "" || vs_weight.value == "") {
                vs_bmi.value = "";
                setbmiStr("");
            }
            else {
                vs_bmi.value = (vs_weight.value / ((vs_height.value / 100) * (vs_height.value / 100))).toFixed(1);
                setbmiStr(vs_bmi.value);
            };

            lbl_vs_bmi.innerText = vs_bmi.value;
        }
    </script>
</body>
</html>


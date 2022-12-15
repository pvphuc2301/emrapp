<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedRecForNeoVaccin.aspx.cs" Inherits="EMR.OPD.MedRecForNeoVaccin" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/icons/ArrowRepeat.ascx" TagPrefix="icon" TagName="ArrowRepeat" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <%--<link href="../styles/print.css" rel="stylesheet" />--%>
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <style>
        .dg {
            display: grid;
            width: 100%;
        }
        .cursor-wait {
            pointer-events: none;
            background-color: #007bff;
            border-color: #007bff;
            opacity: .65;
        }
        .gtc-1 {
            grid-template-columns: 200px 1fr;
        }

        .gtc-2 {
            grid-template-columns: auto 1fr;
        }

        @media only screen and (max-width: 600px) {
          .dg {
            display: block !important;
          }
        }
        @page {
            margin-top: 10px;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <%--<asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
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
                                                <div><span style="font-size: 12pt; font-weight: bold">BỆNH ÁN TIÊM CHỦNG SƠ SINH</span></div>
                                                <div class="en"><i style="font-size: 11pt; font-weight: bold">MEDICAL RECORD FOR NEONATAL VACCINATION</i></div>
                                            </div>
                                            <div style="width: 150px; text-align: center; font-size: 11px">
                                                <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                                <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                            </div>
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
                                    <%--<div style="position: relative;" class="main" runat="server" id="">--%>
                                    <div class="main" runat="server" id="print_content">
                                        <%--<img style="height: 1px" src="../images/logo-opacity.png" />--%>
                                        <div><span style="font-weight: bold">Họ tên người bệnh</span>/ <span class="en">Full name: </span><asp:Label runat="server" ID="prt_fullname"></asp:Label></div>
                                            
                                        <div style="display: grid;grid-template-columns: 2fr 1fr">
                                            <div><span style="font-weight: bold">Ngày tháng năm sinh</span>/ <span class="en">DOB: </span><asp:Label runat="server" ID="prt_dob"></asp:Label></div>
                                            <div><span style="font-weight: bold">Giới tính</span>/ <span class="en">Gender: </span><asp:Label runat="server" ID="prt_gender"></asp:Label></div>
                                        </div>

                                        <div><span style="font-weight: bold">Mã số người bệnh</span>/ <span class="en">PID: </span><asp:Label runat="server" ID="prt_pid"></asp:Label></div>
                                        
                                        <div><span style="font-weight: bold">Ngày khám bệnh</span>/ <span class="en">Day of visit: </span><asp:Label runat="server" ID="prt_day_of_visit"></asp:Label></div>
                                        
                                        <div style="margin-left: 5px; display: grid; grid-template-columns: 18px 1fr">
                                            <div><span style="font-weight: bold">I. </span></div>
                                            <div>
                                                <span style="font-weight: bold"> Lý do đến khám</span>/ <span class="en">Chief complaint: </span>
                                                <asp:Label runat="server" ID="prt_chief_complaint"></asp:Label>
                                            </div>
                                        </div>

                                        <div><span style="font-weight: bold">II. Bệnh sử</span>/ <span class="en">Medical History: </span></div>
                                        
                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>1.&nbsp;</div>
                                            <div>
                                                <span>Bệnh sử hiện tại</span>/ <span class="en">Current Medical History: </span>
                                                <asp:Label runat="server" ID="prt_cur_med_history"></asp:Label>
                                            </div>
                                        </div>

                                        <div style="margin-left: 5px; display: grid;grid-template-columns: auto 1fr">
                                            <div>❖&nbsp;</div>
                                            <div>
                                                <span>Thuốc đang sử dụng</span>/ <span class="en">Current medications: </span>
                                                <asp:Label runat="server" ID="prt_cur_medications"></asp:Label>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="margin-left: 5px"><span>2. Tiền sử bệnh</span>/ <span class="en">Antecedent Medical History: </span></div>
                                        <%--  --%>
                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span> Bản thân</span>/ <span class="en">Personal: </span>
                                                <asp:Label runat="server" ID="prt_personal"></asp:Label>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="margin-left: 5px; display: grid;grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span> Gia đình</span>/ <span class="en">Family: </span>
                                                <asp:Label runat="server" ID="prt_family"></asp:Label>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div style="display: grid; grid-template-columns: 110px 100px 1fr">
                                                <div><span>Dị ứng</span>/ <span class="en">Allergy: </span></div>
                                                <div><asp:Label runat="server" ID="prt_allergy_false"></asp:Label> Không/ <span class="en">No</span></div>
                                                <div><asp:Label runat="server" ID="prt_allergy_true"></asp:Label> Có, ghi rõ/ <span class="en">Yes, specify: </span><asp:Label runat="server" ID="prt_allergy_text"></asp:Label></div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <%--<div style="margin-left: 5px; display: grid;grid-template-columns: auto 1fr" runat="server" id="allergy_note">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span style="font-weight: bold"> Nếu có, nêu rõ</span>/ <i>If yes, specify: </i>
                                                <asp:Label runat="server" ID="prt_allergy_note"></asp:Label>
                                            </div>
                                        </div>--%>
                                        <%--  --%>
                                        <div><span style="font-weight: bold"> III. Khám bệnh</span>/ <span class="en">Physical Examination: </span></div>
                                        <div style="text-align: center"><span style="font-weight: bold">DẤU HIỆU SINH TỒN</span>/ <span class="en">VITAL SIGNS</span></div>

                                        <table class="table-bordered table-fixed mb-1 mt-1" style="width: 100%">
                                            <tr>
                                                <td class="p-2">Nhiệt độ/ <span class="en">Temperature: </span><asp:Label runat="server" ID="prt_vs_temperature" /> °C</td>
                                                <td class="p-2">Mạch/ <span class="en">Pulse: </span> <asp:Label runat="server" ID="prt_hear_rate" /> /phút (m)</td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Cân nặng/ <span class="en">Weight: </span> <asp:Label runat="server" ID="prt_vs_weight" /> (Kg)</td>
                                                <td class="p-2">Nhịp thở/ <span class="en">Respiratory Rate: </span> <asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chiều cao/ <span class="en">Height: </span><asp:Label runat="server" ID="prt_vs_height" /> cm</td>
                                                <td class="p-2">Huyết áp/ <span class="en">Blood pressure: </span><asp:Label runat="server" ID="prt_vs_blood_pressure" /> mmHg</td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chỉ số khối cơ thể/ <span class="en">BMI </span>(Kg/m<sup>2</sup>): <asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                                <td class="p-2">Độ bão hòa Oxy/ <span class="en">SpO2: </span><asp:Label runat="server" ID="prt_vs_spO2" /> %</td>
                                            </tr>
                                        </table>

                                        <div style="text-align: center"><span style="font-weight: bold">KHÁM SÀNG LỌC TRƯỚC TIÊM CHỦNG</span>/ <span class="en">SCREENING BEFORE VACCINATION</span></div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>1.&nbsp;</div>
                                            <div>Tình trạng sức khỏe chưa ổn định/ <span class="en">Unstable health condition: </span><asp:Label runat="server" ID="prt_scr_before_vacc_1"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>2.&nbsp;</div>
                                            <div>Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class="en">Fever / Hypothermia (Fever:temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C): </span><asp:Label runat="server" ID="prt_scr_before_vacc_2"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>3.&nbsp;</div>
                                            <div>Khóc bé hoặc không khóc/ <span class="en">Cry or unable to cry: </span><asp:Label runat="server" ID="prt_scr_before_vacc_3"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>4.&nbsp;</div>
                                            <div>Da, môi không hồng/ Fever/ <span class="en">Skin and lips are not pink: </span><asp:Label runat="server" ID="prt_scr_before_vacc_4"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>5.&nbsp;</div>
                                            <div>Bú kém hoặc bỏ bú/ <span class="en">Poor breastfeeding or breastfeeding refusal: </span><asp:Label runat="server" ID="prt_scr_before_vacc_5"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>6.&nbsp;</div>
                                            <div>Tuổi thai < 28 tuần/ <span class="en">Gestational age < 28 weeks: </span><asp:Label runat="server" ID="prt_scr_before_vacc_6"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>7.&nbsp;</div>
                                            <div>Trẻ < 34 tuần tuổi/ <span class="en">Children < 34 weeks old: </span><asp:Label runat="server" ID="prt_scr_before_vacc_7"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>8.&nbsp;</div>
                                            <div>Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-)/ <span class="en">Child's weight < 2000g, his/her morther HbsAg (-): </span><asp:Label runat="server" ID="prt_scr_before_vacc_8"></asp:Label></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <div>9.&nbsp;</div>
                                            <div>Các chống chỉ định khác, nếu có ghi rõ/ <span class="en">Other contraindications, if yes specified: </span><asp:Label runat="server" ID="prt_scr_before_vacc_9"></asp:Label></div>
                                        </div>

                                        <div><span style="font-weight: bold">IV. Chỉ định và kết quả xét nghiệm</span>/ <span class="en">Laboratory indications and results: </span></div>

                                        <div style="margin-left: 5px"><span style="font-weight: bold">• Loại vắc xin tiêm chủng lần này</span>/ <span class="en">Appointed vaccine: </span></div>
                                        
                                        <table class="table-bordered mt-1 mb-1" runat="server" id="prt_appointed_vaccine">
                                            <tr>
                                                <td style="width: 190px" class="text-center">
                                                    <div><span style="font-weight: bold">Tên vaccin</span></div>
                                                    <div class="en"><span>Drug names</span></div>
                                                </td>
                                                <td style="width: 110px" class="text-center">
                                                    <div><span style="font-weight: bold">Hàm lượng</span></div>
                                                    <div class="en"><span>Strength</span></div>
                                                </td>
                                                <td style="width: 110px" class="text-center">
                                                    <div><span style="font-weight: bold">Đường dùng</span></div>
                                                    <div class="en"><span>Route</span></div>
                                                </td>
                                                <td style="width: 245px" class="text-center">
                                                    <div><span style="font-weight: bold">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do</span></div>
                                                    <div class="en"><span>Additional instruction/ PRN order with reason</span></div>
                                                </td>
                                            </tr>
                                        </table>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span>Khảo sát bổ sung khác</span>/ <span class="en">Additional investigations: </span>
                                                <asp:Label runat="server" ID="prt_additional_investigations"></asp:Label>
                                            </div>
                                        </div>

                                        <div><span style="font-weight: bold">V. Kết luận/ </span>/ <span class="en">Conclusion: </span></div>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span>Chẩn đoán ban đầu</span>/ <span class="en">Initial diagnosis (ICD 10): </span>
                                                <asp:Label runat="server" ID="prt_initial_diagnosis"></asp:Label>
                                            </div>
                                        </div>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span>Chẩn đoán phân biệt</span>/ <span class="en">Differential diagnosis (ICD 10): </span>
                                                <asp:Label runat="server" ID="prt_differential_diagnosis"></asp:Label>
                                            </div>
                                        </div>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span>Bệnh kèm theo</span>/ <span class="en">Associated conditions: </span>
                                                <asp:Label runat="server" ID="prt_associated_conditions"></asp:Label>
                                            </div>
                                        </div>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <span>Kế hoạch điều trị</span>/ <span class="en">Treatment: </span>
                                                <div style="display: grid; grid-template-columns: repeat(3, 1fr)">
                                                    <div><asp:Label runat="server" ID="prt_treatment_code_opd"></asp:Label> Ngoại trú/ <span class="en">Ambulatory care</span></div>
                                                    <div><asp:Label runat="server" ID="prt_treatment_code_ipd"></asp:Label> Nhập viện/ <span class="en">Admission</span></div>
                                                    <div><asp:Label runat="server" ID="prt_treatment_code_trf"></asp:Label> Chuyển viện/ <span class="en">Transfer</span></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <div>Yêu cầu ý kiến chuyên khoa/ <span class="en">Specialized opinion requested: </span></div>
                                                <div style="display: grid; grid-template-columns: 1fr 100px">
                                                    <div><asp:Label runat="server" ID="prt_spec_opinion_req_true"></asp:Label> Có, ghi rõ/ <span class="en">Yes, specify: </span><asp:Label runat="server" ID="prt_spec_opinion_req_text"></asp:Label></div>
                                                    <div><asp:Label runat="server" ID="prt_spec_opinion_req_false"></asp:Label> Không/ <span class="en">No</span></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <div>Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="en">Specific education required: </span></div>
                                                <div><asp:Label runat="server" ID="prt_specific_edu_req"></asp:Label></div>
                                            </div>
                                        </div>

                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>Hẹn lần khám tới/ <span class="en">Next Appointment: </span><asp:Label runat="server" ID="prt_next_appointment"></asp:Label></div>
                                        </div>

                                        <div><span style="font-weight: bold">VI. Xác nhận của cha/ mẹ / người giám hộ hợp pháp/ <span class="en">Confirmation of parent / legal guardian</span></span></div>
                                        
                                        <div style="margin-left: 5px; display: grid; grid-template-columns: auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>
                                                <div>Tôi đã được nghe bác sĩ tư vấn và đồng ý tiêm chủng cho con tôi/ người mà tôi làm giám hộ hợp pháp. Tôi đã kiểm tra đúng thuốc tiêm và thuốc còn thời hạn dùng.</div>
                                                <div><span class="en">I have been consulted and agree on ivaccination. I checked right medication and medication has still not expired.</span></div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: auto auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>Họ tên cha/mẹ/người giám hộ /<span class="en">Full name of parent / guardian:</span></div>
                                            <div style="margin-top: 8px"><hr style="border-bottom: 0.1px solid black"></div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: auto auto 1fr">
                                            <div>•&nbsp;</div>
                                            <div>Chữ ký cha/mẹ/người giám hộ /<span class="en">Signature of parent / guardian:</span></div>
                                            <div style="margin-top: 8px"><hr style="border-bottom: 0.1px solid black;"></div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center avoid-page-break">
                                                <div class="font-bold">Bác sĩ điều trị/ <span class="en">Attending doctor</span></div>
                                                <div  class="font-bold">(Họ tên, chữ ký & MSNV)</div>
                                                <div class="font-bold en">(Full name, Signature & ID)</div>
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
                <li>Medical Record For Neonatal Vaccination</li>
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
                                <div>
                                    <h4 class="text-primary">MEDICAL RECORD FOR NEONATAL VACCINATION</h4>
                                </div>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                            </div>
                            <div class="card-body">
                                <div class="form-body collapse show" id="collapseOne">
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
                                            <label class="control-label mb-2 h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                        </div>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_chief_complaint" />
                                            <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">
                                            <label class="control-label h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_cur_med_history" />
                                            <div class="form-group" runat="server" id="cur_med_history_wrapper">
                                                <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1 d-inline-block ">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                            <div class="form-group" runat="server" id="cur_medications_wrapper">
                                                <webUI:TextField runat="server" ID="txt_cur_medications" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_cur_medications" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2 gt-2-a">
                                            <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal:</span></label>
                                            <div class="form-group" runat="server" id="personal_wrapper">
                                                <webUI:TextField runat="server" ID="txt_personal" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_personal" />
                                        </div>

                                        <div class="col-12 mb-2 gt-2-a">
                                            <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                            <div class="form-group" runat="server" id="family_wrapper">
                                                <webUI:TextField runat="server" ID="txt_family" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_family" />
                                        </div>

                                        <div class="col-md-12 mb-2 gt-2-a">
                                            <label class="control-label mb-1 d-block">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            <asp:Label runat="server" ID="lbl_allergy" />
                                            <div runat="server" id="allergy_wrapper">
                                                <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                    <input type="radio" id="rad_allergy_false" onchange="radioButtonChange(this)" data-target="allergy_note_field" runat="server" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy_false">Không/<span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                    <input disabled-for="allergy_note_field" onchange="radioButtonChange(this)" type="radio" id="rad_allergy_true" runat="server" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                        <icon:XSquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>

                                                <div class="form-group allergy_note_field mt-2">
                                                    <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <div class="row">
                                        <div class="col-12">
                                            <label class="control-label h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                        </div>
                                    </div>

                                    <div class="mb-1"><label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label></div>

                                    <asp:UpdatePanel ID="updatepnl_vital_sign" runat="server">
                                        <ContentTemplate>
                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <div class="mb-1">
                                                        <asp:LinkButton runat="server" ID="btnUpdateVitalSign" OnClick="btnUpdateVitalSign_Click" CssClass="btn btn-sm btn-secondary waves-effect">Update</asp:LinkButton>
                                                        <asp:LinkButton Visible="false" runat="server" ID="btnVSFreeText" OnClick="btnVSFreeText_Click" CssClass="btn btn-sm btn-secondary waves-effect">New Vital Sign</asp:LinkButton>
                                                        <asp:CheckBox Style="display: none" runat="server" ID="cbVSFreeText" />
                                                    </div>

                                                    <%--<label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <span class="custom-control-label">Free Text</span>
                                                    </label>--%>

                                                    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatepnl_vital_sign">
                                                        <ProgressTemplate>
                                                            <div class="loader1 ml-2">
                                                                <div style="width: 28px; height: 28px;" class="loader-wheel"></div>
                                                            </div>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_temperature" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_temperature_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                                <span class="append">°C</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_weight" style="line-height: 31px"></asp:Label>
                                                                
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_weight_wrapper">
                                                                <input data-type="number" onchange="CalculateBmi()" runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                                <span class="append">Kg</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                        <asp:Label runat="server" ID="lbl_vs_height" style="line-height: 31px"></asp:Label>
                                                        <div class="form-group" style="width: 120px" runat="server" id="vs_height_wrapper">
                                                            <input data-type="number" onchange="CalculateBmi()" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                            <span class="append">cm</span>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label for="bmi" class="control-label mb-1 mr-2" style="line-height: 31px">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_BMI" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_BMI_wrapper">
                                                                <input runat="server" id="txt_vs_bmi" class="form-control text-right" disabled="disabled" />
                                                                <span class="append">(Kg/m <sup>2</sup>)</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div><asp:Label runat="server" ID="bmiStr"></asp:Label></div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi) <br />
                                                            <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_pulse" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_pulse_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                                <span class="append">cm</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhịp tim/ <span class="text-primary">Heart rate:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_heart_rate" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_heart_rate_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                                <span class="append">/phút (m)</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_respiratory_rate" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_respiratory_rate_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                                <span class="append">/phút (m)</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_blood_pressure" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_blood_pressure_wrapper">
                                                                <input data-type="number1" id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                                <span class="append">mmHg</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label for="spO2" class="control-label mb-1 mr-2" style="line-height: 31px">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_spO2" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_spO2_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                                <span class="append">%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Khám sàng lọc trước tiêm chủng/ <span class="text-primary">Screening before vaccination:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Tình trạng sức khỏe chưa ổn định/ <span class="text-primary">Unstable health condition:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_1_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_1" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_1" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class="text-primary">Fever / Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_2_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_2" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_2" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Khóc bé hoặc không khóc/ <span class="text-primary">Cry or unable to cry:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_3_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_3" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_3" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">4. Da, môi không hồng/ <span class="text-primary">Skin and lips are not pink:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_4_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_4" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_4" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">5. Bú kém hoặc bỏ bú/ <span class="text-primary">Poor breastfeeding or breastfeeding refusal:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_5_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_5" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_5" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">6. Tuổi thai < 28 tuần/ <span class="text-primary">Gestational age <28 weeks:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_6_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_6" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_6" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">7. Trẻ < 34 tuần tuổi/ <span class="text-primary">Children <34 weeks old:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_7_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_7" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_7" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">8. Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-)/ <span class="text-primary">Child's weight < 2000g, his/her morther HbsAg (-):</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_8_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_8" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_8" />
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">9. Các chống chỉ định khác, nếu có ghi rõ/ <span class="text-primary">Other contraindications, if yes specified:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div class="form-group" runat="server" id="scr_before_vacc_9_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_9" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_scr_before_vacc_9" />
                                                </div>
                                            </fieldset>
                                        </div>
                                    </fieldset>

                                    <div class="row">
                                        <div class="col-12">
                                            <label class="control-label h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Loại vắc xin tiêm chủng lần này/ <span class="text-primary">Appointed Vaccine:</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="updatePanel_appointed_vaccine" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_appointed_vaccine" runat="server" OnRowDeleting="grid_appointed_vaccine_RowDeleting" CssClass="table-bordered" AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 180px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("drug_name") %>' ID="drug_name" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 130px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("strength") %>' ID="strength" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 120px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("router") %>' ID="router" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("reason") %>' ID="reason" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                    <icon:Trash runat="server"/>
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EmptyDataTemplate>There are no items to display.</EmptyDataTemplate>
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="updateProgress_appointed_vaccine" runat="server" AssociatedUpdatePanelID="updatePanel_appointed_vaccine">
                                                        <ProgressTemplate>
                                                            Loading....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:LinkButton OnClick="btn_grid_appointed_vaccine_add_Click" runat="server" CssClass="btn btn-sm btn-secondary waves-effect" ID="btn_grid_appointed_vaccine_add">+ Add Row</asp:LinkButton>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_grid_appointed_vaccine_add" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                        </legend>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_additional_investigations" />
                                            <div class="form-group" runat="server" id="additional_investigations_wrapper">
                                                <webUI:TextField runat="server" ID="txt_additional_investigations" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <label class="control-label mb-1 h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                        </legend>

                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_initial_diagnosis" />
                                            <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                        </legend>

                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_differential_diagnosis" />
                                            <div class="form-group" runat="server" id="differential_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                        </legend>

                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_associated_conditions" />
                                            <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                        </legend>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_treatment_desc" />
                                            <div runat="server" id="treatment_code_wrapper">
                                            <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                <input type="radio" id="rad_treatment_code_opd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_treatment_code_opd">
                                                    Ngoại trú/ <span class="text-primary">Ambulatory care</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                <input type="radio" id="rad_treatment_code_ipd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_treatment_code_ipd">
                                                    Nhập viện/ <span class="text-primary">Admission</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                <input type="radio" id="rad_treatment_code_trf" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_treatment_code_trf">
                                                    Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                <a href="javascript:void(0)" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                    <icon:XSquare runat="server" ID="XSquare1" />
                                                </a>
                                            </div>
                                        </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                        </legend>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_spec_opinion_req" />
                                            <div runat="server" id="spec_opinion_req_wrapper">
                                                <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                    <input type="radio" id="rad_spec_opinion_req_false" onchange="radioButtonChange(this)" data-target="spec_opinion_req_text_field" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req_false">Không/<span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                    <input disabled-for="spec_opinion_req_text_field" onchange="radioButtonChange(this)" type="radio" id="rad_spec_opinion_req_true" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" data-clear="rad_spec_opinion_req" onclick="clear_radiobutton(this)">
                                                        <icon:XSquare runat="server" ID="XSquare3" />
                                                    </a>
                                                </div>

                                                <div class="form-group par spec_opinion_req_text_field mt-2">
                                                    <webUI:TextField runat="server" ID="txt_spec_opinion_req_text" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                        </legend>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_pecific_edu_req" />
                                            <div runat="server" id="pecific_edu_req_wrapper">
                                                <webUI:TextField runat="server" ID="txt_pecific_edu_req" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                        </legend>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_next_appointment" />
                                            <div runat="server" id="next_appointment_wrapper">
                                                <webUI:TextField runat="server" ID="txt_next_appointment" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-actions" style="display: flex; gap: 6px">
                                                <asp:UpdatePanel runat="server" ID="uplPrintDocument">
                                                    <ContentTemplate>
                                                        <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="CompleteDocument" ID="btnComplete" CssClass="btn btn-primary">Complete</asp:LinkButton>
                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="SaveDocument" ID="btnSave" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                                                        <asp:LinkButton runat="server" OnClick="DeleteDocument" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:LinkButton runat="server" OnClick="AmendDocument" ID="btnAmend" CssClass="btn btn-secondary">Amend</asp:LinkButton>
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
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
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </form>
    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
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
    <script type="text/javascript">
        checkboxRadiobutton_init();
        formGroup_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
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
                div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
                //div.setAttribute("data-page", "Page " + i + " of " + total);
                document.getElementById("print_content").append(div);

            }

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
            window.print();
        }

    </script>
</body>
</html>


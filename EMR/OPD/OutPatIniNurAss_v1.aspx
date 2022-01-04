<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAss_v1.aspx.cs" Inherits="EMR.OPD.OutPatIniNurAss_v1" %>
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
    <style>
        table, td, th {
            border: 1px solid black;
        }

        @media only screen and (max-width: 600px) {
          .barrier-to-care-css, .css-2 {
                display: block !important;
            }
        }

        .css-2 {
            display: grid;
            grid-column-gap: 12px;
            grid-template-columns: auto 1fr;
        }

        .barrier-to-care-css {
            display: grid; 
            grid-template-columns: 255px 1fr;
            margin-bottom: 10px;
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
span.frac > tuso {border-bottom: 0.08em solid;}
span.frac > span {display: none;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoPrint">
                    <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body mb-4">
                                            <div><label class="control-label font-bold">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS</span></label></div>
                                            
                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_temperature"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_temperature_wrapper">
                                                        <input id="txt_vs_temperature" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Mạch/ <span class="text-primary">Pulse:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_pulse"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_pulse">
                                                        <input id="txt_vs_pulse" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label  mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_weight"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_weight_wrapper">
                                                        <input onchange="CalculateBmi()" id="txt_vs_weight" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_respiratory_rate_wrapper">
                                                        <input  id="txt_vs_respiratory_rate" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_height"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_height_wrapper">
                                                        <input id="txt_vs_height" onchange="CalculateBmi()"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_blood_pressure_wrapper">
                                                        <input id="txt_vs_blood_pressure" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 ">
                                                    <div class="d-flex no-block">
                                                        <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <asp:Label runat="server" ID="lbl_vs_bmi"></asp:Label>
                                                        <div class="form-group d-inline-block" runat="server" id="vs_bmi_wrapper">
                                                            <input  id="txt_vs_bmi" data-type="number" style="width: 120px; height: 23.2px;" runat="server" disabled="disabled" class="form-control text-right" />
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
                                                        <input id="txt_vs_spo2"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12 mb-2 d-flex no-block">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <asp:Label runat="server" ID="lbl_pulse"/>
                                                    <div class="form-group d-inline-block" runat="server" id="pulse_wrapper">
                                                        <input id="txt_pulse"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">II. ĐÁNH GIÁ/ <span class="text-primary">ASSESSMENT</span></label></div>

                                            <div><label class="control-label font-bold">1. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label></div>
                                            
                                            <div class="mb-2">
                                                <asp:Label  runat="server" ID="lbl_chief_complaint"  />
                                                <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">2. Dị ứng/ <span class="text-primary">Allergy:</span></label></div>

                                            <div>
                                                <div runat="server" id="allergy_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block ml-2 mb-1">
                                                        <input type="radio" onchange="radioButtonChange(this)" data-target="allergy_field" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block ml-2 mb-1">
                                                        <input disabled-for="allergy_field" type="radio" runat="server" onchange="radioButtonChange(this)" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                        </a>
                                                        <%--<asp:CustomValidator ID="CustomValidator3" CssClass="text-danger" ValidationGroup="Group1"
                                                            OnServerValidate="CustomValidatorAllergy_ServerValidate"
                                                            Display="Dynamic"
                                                            ErrorMessage="Dị ứng/ Allergy is required"
                                                            runat="server" />--%>
                                                    </div>

                                                    <div class="form-group allergy_field">
                                                        <webUI:TextField runat="server" ID="txt_allergy_note" TextMode="SingleLine" />
                                                        <asp:CustomValidator ID="CustomValidator3" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorAllergy_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />
                                                    </div>
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_allergy" /><br />
                                                    <asp:Label runat="server" ID="lbl_allergy_note" />
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label></div>

                                            <div><label class="control-label">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label></div>

                                            <div class="mb-2">
                                                <asp:Label runat="server" ID="lbl_mental_status" />

                                                <div  runat="server" id="mental_status_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" runat="server" id="rad_mental_status_true" onchange="radioButtonChange(this)" data-target="mental_status_note_field" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_true">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio  d-inline-block ml-2">
                                                        <input onchange="radioButtonChange(this)" disabled-for="mental_status_note_field" type="radio" runat="server" id="rad_mental_status_false" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_false">No, ghi rõ/ <span class="text-primary">No, specify:</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_mental_status" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare6" />
                                                        </a>
                                                        <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="Group1" ErrorMessage="Trạng thái tinh thần/ Appropriate response is required" CssClass="text-danger" OnServerValidate="CustomValidatorMentalStatus_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>

                                                    <div class="form-group mental_status_note_field">
                                                        <webUI:TextField runat="server" ID="txt_mental_status_note" TextMode="SingleLine" />
                                                        <asp:CustomValidator ID="CustomValidator1" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorMentalStatusNote_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">4. Tầm soát bệnh lây nhiễm/ <span class="text-primary">Communicable disease screening:</span></label></div>

                                            <table style="width: 100%" class="mb-2">
                                                <tr>
                                                    <td style="width: 150px;" class="text-center p-1">Phân loại <br /><span class="text-primary">Category</span></td>
                                                    <td class="text-center p-1">Tiêu chí <br /><span class="text-primary">Criteria</span></td>
                                                    <td style="width: 50px;" class="text-center p-1">Có <br /><span class="text-primary">Yes</span></td>
                                                    <td style="width: 50px;" class="text-center p-1">Không <br /><span class="text-primary">No</span></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center p-1">Triệu chứng <br /><span class="text-primary">Signs and symptoms</span></td>
                                                    <td class="p-1">Sốt > 38 C và ho, khó thở, tiêu chảy,... <br /><span class="text-primary">Fever > 38 C and cough, dyspnea, diarrhea</span></td>
                                                    <td class="p-1"></td>
                                                    <td class="p-1"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center p-1" rowspan="2">Dịch tễ <br /><span class="text-primary">Epidemiology</span></td>
                                                    <td class="p-1">Đi từ hay tiếp xúc với người đi từ vùng dịch trong vòng 2 tuần <br /><span class="text-primary">History of travel and in contact with injectious disease outbreak in the past 2 weeks</span></td>
                                                    <td class="p-1"></td>
                                                    <td class="p-1"></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1">Tiếp xúc gần với người bị sốt, ho, khó thở <br /><span class="text-primary">Had close contact with someone who has fever, cough, dyspnea</span></td>
                                                    <td class="p-1"></td>
                                                    <td class="p-1"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center p-1">Đánh giá <br /> <span class="text-primary">Assessment</span></td>
                                                    <td class="p-1">Có nguy cơ truyền nhiễm <br /> <span class="text-primary">Injectious risk</span></td>
                                                    <td class="p-1"></td>
                                                    <td class="p-1"></td>
                                                </tr>
                                            </table>

                                            <ul>
                                                <li>Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ triệu chứng, chuyển bệnh nhân sang phòng khám sàng lọc/ <span class="text-primary">If <span class="font-bold">"YES"</span> Signs and symptom risks, transfer patient to screening clinic.</span></li>
                                                <li>Nếu <span class="font-bold">"CÓ"</span> yếu tố nguy cơ dịch tể, chuyển bệnh nhân đến phòng cách ly áp lực âm cấp cứu/ <span class="text-primary">If <span class="font-bold">"YES"</span> epidemic risks, transfer patient to Isolation room in Emergency Department.</span></li>
                                                <li>Nếu <span class="font-bold">"KHÔNG"</span> tiếp tục hoàn thành tiểu mục 5, 6, 7, 8/ <span class="text-primary">If <span class="font-bold">"NO"</span> complete part 5, 6, 7, 8 assessment.</span></li>
                                            </ul>

                                            <div><label class="control-label font-bold">5. Đánh giá đau/ <span class="text-primary">Pain assessment:</span></label></div>

                                            <p>
                                                Điều dưỡng đánh giá chọn một trong các thang điểm đau bên dưới phù hợp với từng người bệnh. <br />
                                                <span class="text-primary">Nurses select one of the following pain scales in consistent with each sort of patient.</span>
                                            </p>

                                            <div style="width: 435px; display: inline-block" runat="server" id="paint_score_code_wrapper">
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
                                                        <a class="btn-clear-option" href="javascript:void(0)" data-clear="rad_paint_score_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare2" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>

                                            <img src="../images/2021-12-27_14-08-55.png" />

                                            <div class="mb-2"><label class="control-label font-bold">FLACC (2 tháng - < 4 tuổi) và bệnh nhi dưới 16 tuổi không nói được/ <span class="text-primary">2 month to < 4 years old and non-verbal pediatric patient (patient < 16 years old)</span></label></div>

                                            <table class="mb-2">
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
                                                    <td class="p-1"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center p-1">Chân <br /><span class="text-primary">Legs</span></td>
                                                    <td class="p-1">Vị trí bình thường hoặc Yên tĩnh và thư giãn. <br /><span class="text-primary">Normal position or Is calm and relaxed</span></td>
                                                    <td class="p-1">Khó chịu, bồn chồn, căng thẳng <br /><span class="text-primary">Uneasy, restless, tense</span></td>
                                                    <td class="p-1">Đá chân hoặc bất động hoặc bồn chồn. <br /><span class="text-primary">Kicking or legs drawn up immobility or extremely restless</span></td>
                                                    <td class="p-1"></td>
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
                                                    <td class="p-1"></td>
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
                                                    <td></td>
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
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td class="p-1 text-right font-bold" colspan="4">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                    <td></td>
                                                </tr>
                                            </table>

                                            <div class="barrier-to-care-css">
                                                <label class="control-label font-bold">Kết luận/ <span class="text-primary">Conclude</span>:</label>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox37" />
                                                        <span class="custom-control-label">Không đau/ <span class="text-primary">No pain (0)</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox38" />
                                                        <span class="custom-control-label">Đau nhẹ/ <span class="text-primary">Slight pain (1 - 3)</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox39" />
                                                        <span class="custom-control-label">Đau vừa/ <span class="text-primary">Considerable pain (4 - 6)</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox40" />
                                                        <span class="custom-control-label">Rất đau/ <span class="text-primary">Worst pain (7 - 10)</span></span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="mb-2"><label class="control-label font-bold">Thang điểm đánh giá đau và an thần cho trẻ sơ sinh và nhũ nhi (< 2 tháng tuổi)/ <span class="text-primary">Neonatal and infantile pain, sedation scale (N-PASS) (<2 months)</span></label></div>

                                            <table class="mb-2">
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
                                                </tr>

                                                <tr>
                                                    <td class="text-center p-1" rowspan="3">
                                                        Tuổi thai <br />
                                                        hiệu chỉnh <br />
                                                        <span class="text-primary">Gestation <br />
                                                        (Corrected <br /> age)</span>
                                                    </td>
                                                    <td class="text-center" colspan="5">< 28 tuần / <span class="text-primary"><28 weeks</span>: <span class="font-bold">+3</span></td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td class="text-center" colspan="5">28-31 tuần / <span class="text-primary">28-31 weeks</span>: <span class="font-bold">+2</span></td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td class="text-center" colspan="5">32-35 tuần / <span class="text-primary">32-35 weeks</span>: <span class="font-bold">+1</span></td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td class="text-right font-bold p-1" colspan="6">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                    <td></td>
                                                </tr>
                                            </table>

                                            <div class="barrier-to-care-css">
                                                <label class="control-label font-bold">Kết luận/ <span class="text-primary">Conclude</span>:</label>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_conclude_no_pain" />
                                                        <span class="custom-control-label">Không đau/ <span class="text-primary">No pain</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_conclude_slight_pain" />
                                                        <span class="custom-control-label">Đau nhẹ/ <span class="text-primary">Slight pain (1 - 3)</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_conclude_serious_pain" />
                                                        <span class="custom-control-label">Đau vừa - nhiều/ <span class="text-primary">Considerable - Serious pain</span></span>
                                                    </label>
                                                </div>
                                            </div>

                                            <p>
                                                Đối với người bệnh không nói được điều dưỡng đánh giá riêng trên biểu mẫu (AIH-FRM-021 - Thang điểm theo dõi phản ứng đau của người bệnh không nói được)
                                                <br />
                                                Nurses use a separated form to evaluate non-verbal patients (AIH-FRM-021 - Behavioural pain scale for non-verbal adult patient)
                                            </p>

                                            <div class="mb-1"><label class="control-label font-bold">6. Trở ngại chăm sóc/ <span class="text-primary">Barrier to care:</span></label></div>
                                            
                                            <div class="barrier-to-care-css">
                                                <label class="control-label mb-1">- Trở ngại về ngôn ngữ/ <span class="text-primary">Language Barriers:</span></label>
                                                
                                                <div runat="server" id="btc_language_wrapper">
                                                    <asp:Label runat="server" ID="lbl_btc_language"/>
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
                                                    <div class="form-group btc_language_note_field mt-2">
                                                        <webUI:TextField runat="server" ID="txt_btc_language_note" TextMode="SingleLine" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="barrier-to-care-css">
                                                <label class="control-label mb-1 mr-2">- Trở ngại về nhận thức/ <span class="text-primary">Cognitive Barriers:</span></label>
                                                
                                                <div runat="server" id="btc_cognitive_wrapper">
                                                    <asp:Label runat="server" ID="lbl_btc_cognitive"/>
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

                                            <div class="barrier-to-care-css">
                                                <label class="control-label mb-1 mr-2">- Trở ngại về Giác quan/ <span class="text-primary">Sensory Barriers:</span></label>

                                                <div runat="server" id="btc_sensory_wrapper">
                                                    <asp:Label runat="server" ID="lbl_btc_sensory"/>
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

                                            <div  class="barrier-to-care-css">
                                                <label class="control-label mb-1 mr-2">- Trở ngại về Tôn giáo/ <span class="text-primary">Religious Barriers:</span></label>
                                                
                                                <div runat="server" id="btc_religious_wrapper">
                                                    <asp:Label runat="server" ID="lbl_btc_religious"/>
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

                                            <div class="barrier-to-care-css">
                                                <label class="control-label mb-1 mr-2">- Trở ngại về Văn hóa/ <span class="text-primary">Cultural Barriers:</span></label>
                                                
                                                <div runat="server" id="btc_cultural_wrapper">
                                                    <asp:Label runat="server" ID="lbl_btc_cultural"/>
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

                                            <div><label class="control-label font-bold">7. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk morse scale:</span></label></div>
                           
                                            <div><label class="font-bold">- Các yếu tố nguy cơ/ <span class="text-primary">Fall risk factors:</span></label></div>

                                            <div>
                                                <div style="display: grid; grid-template-columns: 1fr 1fr">
                                                    <div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox1" />
                                                            <span class="custom-control-label">Tuổi > 65/ <span class="text-primary">Age > 65</span></span>
                                                        </label>
                                                            </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox3" />
                                                            <span class="custom-control-label">Phụ nữ có thai/ <span class="text-primary">Pregnant women</span></span>
                                                        </label>
                                                            </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox5" />
                                                            <span class="custom-control-label">Không có khả năng đứng lên từ ghế/ <span class="text-primary">Inability to rise from a chair.</span></span>
                                                        </label>
                                                            </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox7" />
                                                            <span class="custom-control-label">Mất trí nhớ<span class="text-primary">Presence of dementia</span></span>
                                                        </label>
                                                            </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox9" />
                                                            <span class="custom-control-label">Bệnh nhân có vấn đề về tai cố triệu chứng chóng mặt/ <span class="text-primary">Patients have ear problems with complaints of dizziness and/or vertigo.</span></span>
                                                        </label>
                                                            </div>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox2" />
                                                                <span class="custom-control-label">Tuổi < 3/ <span class="text-primary">Age < 3</span></span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox4" />
                                                            <span class="custom-control-label">Sử dụng phương tiện hỗ trợ đi lại (gậy/nạng/khung tập đi)/ <span class="text-primary">Ambulatory devices (canes, crutches, and walkers)</span></span>
                                                        </label>
                                                    </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox6" />
                                                            <span class="custom-control-label">Dáng đi yếu hoặc mất thăng bằng<span class="text-primary">Patients with gait or balance disturbances</span></span>
                                                        </label>
                                                    </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox8" />
                                                            <span class="custom-control-label">Giảm/ Mất thị lực/ <span class="text-primary">Patients with visual impairments</span></span>
                                                        </label>
                                                    </div>
                                                        <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox10" />
                                                            <span class="custom-control-label">Không có yếu tố nguy cơ/ <span class="text-primary">No fall risks</span></span>
                                                        </label>
                                                            </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <label class="font-bold"> - Câu hỏi sàng lọc/ <span class="text-primary">The fall risk screen question</span>:</label>
                                                </div>
                                                <div class="mb-1">
                                                    a. Anh/chị/ông/bà có từng bị ngã trong 12 tháng gần đây không?/ <span class="text-primary">Have you fallen in the past year?</span>
                                                </div>
                                                <div class="mb-1">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" id="rad_triage_code_1" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_triage_code_1">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" id="Radio1" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_triage_code_1">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                                <div class="mb-1">
                                                    b. Anh/chị/ông/bà có cảm thấy bị mất thăng bằng lúc đứng dậy hoặc lúc đi không?/ <span class="text-primary">Do you feel unsteady when standing or walking?</span>
                                                </div>
                                                <div class="mb-1">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" id="Radio2" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_triage_code_1">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" id="Radio3" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_triage_code_1">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                                <div class="mb-1">
                                                    c. Anh/chị/ông/bà có lo sợ bị ngã không?/ <span class="text-primary">Do you worry about falling?</span>
                                                </div>
                                                <div class="mb-1">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" id="Radio4" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_triage_code_1">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" id="Radio5" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_triage_code_1">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                                <div class="mb-1">
                                                     <label class="font-bold">- Can thiệp/ <span class="text-primary">Intervention</span>:</label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox11" />
                                                        <span class="custom-control-label">Dán sticker nguy cơ ngã/ <span class="text-primary">Stick fall-risk on patient's shirt</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox12" />
                                                        <span class="custom-control-label">Thông báo nguy cơ té ngã cho người bệnh/ người nhà/ <span class="text-primary">Educate the fall risk to patient/ Relatives</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox13" />
                                                        <span class="custom-control-label">Trợ giúp người bệnh di chuyển, đi lại/ <span class="text-primary">Assist patient with transfer/ ambulation.</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox14" />
                                                        <span class="custom-control-label">Cung cấp dụng cụ hỗ trợ di chuyển (Băng ca, xe đẩy...)/ <span class="text-primary">Assist patient with transfer/ ambulation (Stretcher, wheelchair)</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox15" />
                                                        <span class="custom-control-label">Hướng dẫn ba mẹ/ người thân bệnh nhi luôn quan sát bé cẩn thận và luôn ở cùng bé/ <span class="text-primary">Educate Parents to keep an eye on their children closely and never let him/her alone.</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox16" />
                                                        <span class="custom-control-label">Hướng dẫn ba mẹ/ người thân bệnh nhi hạn chế cho bé chạy nhảy/ <span class="text-primary">Instruct Parents/ accompanying family members limit the child to run.</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox17" />
                                                        <span class="custom-control-label">Khuyến khích di chuyển bằng nôi/ xe nôi đối với trẻ sơ sinh và nhủ nhi/ <span class="text-primary">Encourage parents/ Caregivers to use cribs for newborn/ neonatal in moving.</span></span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox18" />
                                                        <span class="custom-control-label">Deo vòng tay nguy cơ ngã khi/ <span class="text-primary">Place Fall Risk ID bracelet on patient in cases of:</span></span>
                                                    </label>
                                                </div>
                                                <ul>
                                                    <li>Người bệnh có chỉ định nhập viện nguy cơ té ngã cao/ <span class="text-primary">High fall risk patients with admission order</span></li>
                                                    <li>Người bệnh sau thủ thuật có gây tê hoặc gây mê/ <span class="text-primary">Patients after procedure under local or general anesthesia</span></li>
                                                    <li>Người bệnh hóa trị liệu/ <span class="text-primary">Patients with chemotherapy</span></li>
                                                    <li>Người bệnh được truyền dịch/ <span class="text-primary">Patients with fluid infusion.</span></li>
                                                </ul>

                                            </div>
                                            
                                            <div>
                                                <div>
                                                    <label class="control-label font-bold">8. Đánh giá tình trạng dinh dưỡng/ <span class="text-primary">Nutritional status screening:</span></label>
                                                </div>

                                                <div class="mb-1">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td class="p-1">
                                                                BMI = <span class="frac"><tuso>Cân nặng (kg)</tuso><mauso>Chiều cao (m) * Chiều cao (m)</mauso></span>
                                                                BMI = <span class="frac"><tuso>Body weight (kg)</tuso><mauso>Body height (m) * Body height (m)</mauso></span>
                                                            </td>
                                                            <td style="width: 200px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1"><label class="control-label font-bold">Cân nặng 3 tháng trước</label>/ The weight of 3 last month</td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1">
                                                                <label class="control-label font-bold">% cân nặng thay đổi = </label> ((cân nặng hiện tại - cân nặng trước)*100) / Cân nặng hiện tại <br />
                                                                <label class="control-label font-bold">% weight change = </label> ((current weight - previous weight)*100) / current weight
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </div>

                                                <div><label class="control-label font-bold">- Tình trạng dinh dưỡng/ <span class="text-primary">Nutrition status:</span></label></div>
                                                
                                                <div>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td class="p-1 text-center" rowspan="3">Trẻ ≤ 5 tuổi <br /> <span class="text-primary">Children ≤ 5 years old</span></td>
                                                            <td class="p-1 text-center">
                                                                Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -2 độ lệch tiêu chuẩn (SD)</span> <br />
                                                                <span class="text-primary">Weight for length/height ≤ -2 standard devivation (SD)</span>
                                                            </td>
                                                            <td style="width: 200px" class="p-1 text-center">2</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">
                                                                Cân nặng theo chiều dài/chiều cao ≤ <span class="font-bold"> -1 độ lệch tiêu chuẩn (SD) <br />
                                                                <span class="text-primary">Weight for length/height ≤ -1 standard deviation (SD)
                                                            </td>
                                                            <td class="p-1 text-center">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">
                                                                Cân nặng theo chiều dài/chiều cao > <span class="font-bold"> 1 độ lệch tiêu chuẩn (SD) <br />
                                                                <span class="text-primary">Weight for length/height > 1 standard deviation (SD)
                                                            </td>
                                                            <td class="p-1 text-center">0</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center" rowspan="3">Trẻ > 5 tuổi <br /> <span class="text-primary">Children > 5 years old</span></td>
                                                            <td class="p-1 text-center">
                                                                BMI theo tuổi ≤ <span class="font-bold"> -2SD</span>/<span class="text-primary">BMI for age ≤ -2SD</span>
                                                            </td>
                                                            <td class="p-1 text-center">2</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">
                                                                BMI theo tuổi ≤ <span class="font-bold"> -1SD</span>/<span class="text-primary">BMI for age ≤ -1SD</span>
                                                            </td>
                                                            <td class="p-1 text-center">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">
                                                                BMI theo tuổi > <span class="font-bold"> 1SD</span>/<span class="text-primary">BMI for age > 1SD</span>
                                                            </td>
                                                            <td class="p-1 text-center">0</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center" rowspan="3">Người lớn <br /> <span class="text-primary">Adult patients</span></td>
                                                            <td class="p-1 text-center">
                                                                BMI < <span class="font-bold"> 18.5</span>
                                                            </td>
                                                            <td class="p-1 text-center">2</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">
                                                                BMI từ /<span class="text-primary">from </span><span class="font-bold"> 18.5 - 20</span>
                                                            </td>
                                                            <td class="p-1 text-center">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">
                                                                BMI ><span class="text-primary">20</span>
                                                            </td>
                                                            <td class="p-1 text-center">0</td>
                                                        </tr>
                                                    </table>
                                                </div>

                                                <div><label class="control-label font-bold">- Sụt cân không chủ ý trong 3 tháng gần đây/ <span class="text-primary">Unintentional weight loss in the last 3 months:</span></label></div>
                                                
                                                <div>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td class="p-1 text-center">Giảm > 10%/ <span class="text-primary">Weight loss > 10%</span></td>
                                                            <td style="width: 200px" class="p-1 text-center">2</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">Giảm từ <span class="font-bold">5 - 10%</span> / <span class="text-primary">Weight loss from 5 - 10%</span></td>
                                                            <td class="p-1 text-center">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">Giảm < <span class="text-primary">5%</span> / <span class="text-primary">Weight loss < 5%</span></td>
                                                            <td class="p-1 text-center">0</td>
                                                        </tr>
                                                    </table>
                                                </div>

                                                <div><label class="control-label font-bold">- Khả năng ăn uống/ <span class="text-primary">Food intake:</span></label></div>
                                                
                                                <div class="mb-1">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td class="p-1 text-center">Ăn uống kém hơn <span class="font-bold">5 ngày</span> gần đây/ <span class="text-primary">Eating less than the last 5 days</span></td>
                                                            <td style="width: 200px" class="p-1 text-center">2</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-center">Ăn uống bình thường/ <span class="text-primary">Eating normally</span></td>
                                                            <td class="p-1 text-center">0</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1 text-right font-bold">Tổng điểm/ <span class="text-primary">Total score</span></td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="barrier-to-care-css">
                                                <div class="mb-1"><label class="control-label font-bold">Kết luận </label>/ <span class="text-primary">Conclude</span>:</div>
                                                
                                                <div>
                                                    <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox19" />
                                                            <span class="custom-control-label">Không có nguy cơ thiếu dinh dưỡng/ <span class="text-primary">No risk of malnutrition</span></span>
                                                        </label>
                                                    </div>

                                                    <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox20" />
                                                            <span class="custom-control-label">Nguy cơ thiếu dinh dưỡng thấp/ <span class="text-primary">Low risk of malnutrition (1)</span></span>
                                                        </label>
                                                    </div>

                                                    <div>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox21" />
                                                            <span class="custom-control-label">Nguy cơ thiếu dinh dưỡng cao/ <span class="text-primary">High risk of malnutrition (>= 2)</span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div>
                                                <label class="control-label font-bold">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH/ <span class="text-primary">SOCIAL FACTORS ASSESSMENT</span>:</label>
                                            </div>

                                            <div class="barrier-to-care-css">
                                                <label class="control-label font-bold">Tình trạng sinh sống/ <span class="text-primary">Housing</span>: </label>
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox22" />
                                                        <span class="custom-control-label">Sống một mình/ <span class="text-primary">Lives alone</span></span>
                                                    </label>
                                                
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox23" />
                                                        <span class="custom-control-label">Sống với người thân/ <span class="text-primary">With relatives</span></span>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="mb-1">
                                                <label class="control-label font-bold">IV. MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION</span></label>
                                            </div>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox24" />
                                                    <span class="custom-control-label font-bold">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></span>
                                                </label>
                                            </div>

                                            <div class="mb-1"><label class="control-label font-bold">- Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span>:</label></di>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox25" />
                                                    <span class="custom-control-label">Tình trạng nặng cần xử lí ngay/ <span class="text-primary">Emergency cases</span></span>
                                                </label>
                                            </div>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox26" />
                                                    <span class="custom-control-label">Trẻ em dưới 6 tuổi/ <span class="text-primary">Children are under 6 years of age</span></span>
                                                </label>
                                            </div>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox27" />
                                                    <span class="custom-control-label">Người khuyết tật nặng/ <span class="text-primary">Servere disabilities</span></span>
                                                </label>
                                            </div>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox28" />
                                                    <span class="custom-control-label">Người bệnh trên 80 tuổi/ <span class="text-primary">Patient are over 80 years of age</span></span>
                                                </label>
                                            </div>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox29" />
                                                    <span class="custom-control-label">Phụ nữ có thai trên 24 tuần/ <span class="text-primary">Prenancy is over 24 weeks</span></span>
                                                </label>
                                            </div>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox30" />
                                                    <span class="custom-control-label">Người bệnh có hẹn/ <span class="text-primary">Booked appointment patients</span></span>
                                                </label>
                                            </div>

                                            <div class="css-2">
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox31" />
                                                    <span class="custom-control-label">Trường hợp khác/ <span class="text-primary">Other</span></span>
                                                </label>
                                                <div class="form-group btc_cultural_field mb-2">
                                                    <webUI:TextField runat="server" ID="TextField3" />
                                                </div>
                                            </div>

                                            <div><label class="control-label font-bold">V. NHU CẦU GIÁO DỤC SỨC KHỎE/ <span class="text-primary">PATIENT EDUCATION NEEDS</span></label></div>

                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox32" />
                                                    <span class="custom-control-label">Phòng ngừa té ngã/ <span class="text-primary">Fall risk prevention</span></span>
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox33" />
                                                    <span class="custom-control-label">Chăm sóc vết thương/ <span class="text-primary">Wound care</span></span>
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox34" />
                                                    <span class="custom-control-label">Chế độ ăn uống/ <span class="text-primary">Diet</span></span>
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox35" />
                                                    <span class="custom-control-label">Đau/ <span class="text-primary">Pain</span></span>
                                                </label>
                                            </div>
                                            <div class="css-2">
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox36" />
                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Others</span></span>
                                                </label>
                                                <div class="form-group btc_cultural_field mb-2">
                                                    <webUI:TextField runat="server" ID="TextField1" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

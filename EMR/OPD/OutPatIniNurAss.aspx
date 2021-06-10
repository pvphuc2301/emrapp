<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAss.aspx.cs" Inherits="EMR.OutPathIniNurAss" ValidateRequest="false" %>


<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
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






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    <%--class="cssclsNoScreen"--%>
    <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img width="180px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1; text-align: center">
                                <div style="color: #007297; font-size: 20.6963px;">PHIẾU ĐÁNH GIÁ ĐIỀU <br /> DƯỠNG BỆNH NGOẠI TRÚ</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">OUTPATIENT INITIAL NURSING ASSESSMENT</div>
                            </div>
                            <webUI:PatientLabel1 runat="server" ID="prt_patient_label" />
                        </div>
                        <webUI:Line runat="server" ID="Line" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main">
                            <webUI:PrtRowS1 Order="I." FontBold="true" Title="DẤU HIỆU SINH TỒN:" SubTitle="VITAL SIGNS"  runat="server" />
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

                            <webUI:PrtRowS1 FontBold="true" Order="II." Title="ĐÁNH GIÁ:" SubTitle="ASSESSMENT"  runat="server" />

                            <webUI:PrtRowS1 FontBold="true" Order="1." FixedWidth="152" Title="Lý do đến khám:" SubTitle="Chief complaint" ID="prt_chief_complaint"  runat="server" />

                            <webUI:PrtRowS1 FontBold="true" Order="2." FixedWidth="152" Title="Dị ứng:" SubTitle="Allergy" ID="prt_allergy" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" Order="3." Title="Trạng thái tinh thần" SubTitle="Mental status"   runat="server" />

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FixedLeft="30"  FixedWidth="152"  Title="Đáp ứng phù hợp" SubTitle="Appropriate response"   runat="server" />
                                <webUI:PrtRowS2 ID="prt_mental_status" Gap="20"  runat="server" />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" Order="4." FixedWidth="152" Title="Thang điểm đau:" SubTitle="Pain Score" ID="prt_paint_score_code" runat="server" Value="0" />

                            <div class="text-center mb-2">
                                <img src="../images/pain_score.png" />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" Order="5." FixedWidth="235" Title="Tầm soát nguy cơ té ngã:" SubTitle="Fall Risk Morse Scale" Value="Không có nguy cơ/ No risk"  runat="server" ID="prt_fall_risk" />

                            <webUI:PrtRowS1 FontBold="true" Order="6." FixedWidth="235" Title="Đánh giá tình trạng dinh dưỡng:" SubTitle="Nutritional Status Screening" Value="Không ghi nhận/ N/A" ID="prt_nutrition_status_code" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" Order="III." Title="ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH(DUY NHẤT CHO LẦN KHÁM ĐẦU TIÊN):" SubTitle="SOCIAL FACTORS ASSESSMENT(ONLY FOR THE FIRST VISIT)"  runat="server" />

                            
                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FontBold="true" FixedLeft="30"  FixedWidth="152"  Title="Tình trạng sinh sống:" SubTitle="Housing" runat="server" />
                                <webUI:PrtRowS2  runat="server" Gap="10" ID="prt_housing_code" />
                            </div>
                            

                            <webUI:PrtRowS1 FontBold="true" Order="IV." FixedWidth="152" ID="prt_prioritization_code" Title="MỨC ĐỘ ƯU TIÊN:" SubTitle="PRIORITIZATION" Value="Có thể chờ khám trong khoảng thời gian xác định"  runat="server" />

                            <div class="d-grid mt-4" style="grid-template-columns: 1fr 1fr">
                                <div></div>
                                <div class="text-center" >
                                    <webUI:Signature1 runat="server" ID="prt_signature1" />
                                </div>
                            </div>

                        </div>
                    </td>
                </tr>
            </tbody>

            <tfoot class="report-footer">
                <tr>
                    <td class="report-footer-cell" style="font-size: 10px">
                        <img style="width: 100%" src="../images/bottomline.png" />
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

    <div class="cssclsNoPrint">
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->

        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>

                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body mb-4">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS</span></label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label  mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <div class="form-group w-4 d-inline-block ml-2">
                                                        <input id="txtTemperature" maxlength="2" data-type="number" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label  mb-1">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block ml-2">
                                                        <input id="txtHeartRate" runat="server" maxlength="3" data-type="number" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label  mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <div class="form-group w-4 d-inline-block ml-2">
                                                        <input id="txtWeight" runat="server" maxlength="3" data-type="number" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label  mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block ml-2">
                                                        <input id="txtRespiratoryRate" maxlength="3" data-type="number" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label  mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <div class="form-group w-4 d-inline-block ml-2">
                                                        <input id="txtHeight" maxlength="3" data-type="number" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label  mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <div class="form-group w-5 d-inline-block ml-2">
                                                        <input id="txtBloodPressure" maxlength="3" data-type="number" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2">
                                                    <label for="bmi" class="control-label mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <div class="form-group w-5 d-inline-block ml-2">
                                                            <input id="txtBmi" runat="server" data-type="number" class="form-control text-right" disabled="disabled" />
                                                            <span class="append">(Kg/m <sup>2</sup>)</span>
                                                            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                                <script type="text/javascript">

                                                                    document.getElementById('txtHeight').addEventListener("change", function (e) {
                                                                        document.getElementById('txtBmi').value = CalculateBmi();
                                                                    });

                                                                    document.getElementById('txtWeight').addEventListener("change", function (e) {
                                                                        document.getElementById('txtBmi').value = CalculateBmi();
                                                                    });

                                                                    function CalculateBmi() {
                                                                        if (document.getElementById('txtHeight').value == "" || document.getElementById('txtWeight').value == "") return "";
                                                                        else { return (document.getElementById('txtWeight').value / ((document.getElementById('txtHeight').value / 100) * 2)).toFixed(2) };
                                                                    }

                                                                </script>
                                                            </telerik:RadScriptBlock>
                                                        </div>
                                                    
                                                    <p class="mt-1">
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
            applicable for children and pregnant</span>)
                                                    </p>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label for="spO2" class="control-label mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <div class="form-group w-4 d-inline-block ml-2">
                                                        <input id="txtSpo2" runat="server" data-type="number" maxlength="3" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12 mb-2">
                                                    <label for="head-circumference" class="control-label mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <div class="form-group w-4 d-inline-block ml-2">
                                                        <input id="txtPluse" runat="server" data-type="number" maxlength="3" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- III. ASSESSMENT --%>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label  h5">II. ĐÁNH GIÁ/ <span class="text-primary">ASSESSMENT</span></label>
                                                </div>
                                            </div>

                                            <%-- 1. Chief complaint --%>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" id="txtChiefComplaint" />
                                                    </div>
                                                </div>
                                            </fieldset>


                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block ml-2 mb-1">
                                                        <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block ml-2 mb-1">
                                                        <input disabled-for="allergy_field" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    </div>

                                                    <div class="form-group allergy_field">
                                                        <webUI:TextField runat="server" id="txt_allergy_note" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 w-7">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label>

                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" runat="server" id="rad_mental_status_true" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_true">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio  d-inline-block ml-2">
                                                        <input disabled-for="mental_status_note_field" type="radio" runat="server" id="rad_mental_status_false" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_false">Không, ghi rõ/ <span class="text-primary">No, specify:</span></label>
                                                    </div>

                                                    <div class="form-group mental_status_note_field">
                                                        <webUI:TextField runat="server" id="txt_mental_status_note" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <%-- 4. Pain score --%>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">4. Thang điểm đau/ <span class="text-primary">Pain score:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_0" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_0">Không đau/ <span class="text-primary">No hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_1" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_1">Đau rất ít/ <span class="text-primary">Little hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_2" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_2">Đau nhẹ/ <span class="text-primary">Slight hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_3" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_3">Đau vừa/ <span class="text-primary">Considerable hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_4" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_4">Đau nhiều/ <span class="text-primary">Serious hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_5" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_5">Rất đau/ <span class="text-primary">Worst hurt</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_paint_score_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare2" />
                                                </a>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <img src="../images/pain_score.png" style="max-width: 720px; width: 100%;" alt="" />
                                                </div>
                                            </fieldset>

                                            <%-- 5. Fall risk MORSE SCALE --%>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">5. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk MORSE SCALE:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_fall_risk_false" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_false">Không có nguy cơ/ <span class="text-primary">No risk</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="fall_risk_assistance_field" type="radio" runat="server" id="rad_fall_risk_true" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_true">Nếu có, cung cấp phương tiện hỗ trợ/ <span class="text-primary">If yes, provide assistance</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_fall_risk" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare22" />
                                                        </a>
                                                    </div>
                                                    <div class="form-group fall_risk_assistance_field">
                                                        <webUI:TextField runat="server" id="txt_fall_risk_assistance" />
                                                    </div>
                                                </div>
                                            </fieldset>


                                            <%-- 6. Nutritional status screening --%>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">6. Đánh giá tình trang dinh dưỡng/ <span class="text-primary">Nutritional status screening:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_nutrition_status_code_n" name="rad_nutrition_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_nutrition_status_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_nutrition_status_code_u" name="rad_nutrition_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_nutrition_status_code_u">Suy dinh dưỡng/ <span class="text-primary">Undernutrition</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_nutrition_status_code_o" name="rad_nutrition_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_nutrition_status_code_o">Thừa cân hoặc béo phì/ <span class="text-primary">Overweight or obesity</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_nutrition_status_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label  h5">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH (DUY NHẤT CHO LẦN KHÁM ĐẦU TIÊN)/ <span class="text-primary">SOCIAL FACTORS ASSESSMENT (ONLY FOR THE FIRST VISIT):</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label mb-1">Tình trạng sinh sống/ <span class="text-primary">Housing</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" runat="server" id="rad_housing_code_aln" name="rad_housing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_housing_code_aln">Sống một mình/ <span class="text-primary">Lives alone</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" runat="server" id="rad_housing_code_rel" name="rad_housing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_housing_code_rel">Sống với người thân/ <span class="text-primary">With relatives</span></label>
                                                                <a href="javascript:void(0)"  data-clear="rad_housing_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare3" />
                                                        </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">IV. MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_im" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_im">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_wa" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_wa">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_housing_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare4" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <fieldset class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>

                                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <asp:Button ID="btnPrint" OnClientClick="window.print();return false" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                </div>
                                            </div>
                                        </fieldset>
                                        
                                        <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                        <ModalBody>
                                            <div class="text-center">
                                                <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                <h4 class="mt-4 mb-4">Delete document?
                                                </h4>
                                            </div>
                                            <div class="text-right">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                            </div>
                                        </ModalBody>
                                    </webUI:PopupModal>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSave" />
                        <asp:PostBackTrigger ControlID="btnAmend" />
                        <asp:PostBackTrigger ControlID="btnCancel" />
                        <asp:PostBackTrigger ControlID="btnComplete" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </form>
    </div>
    
   
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
    <script src="../scripts/checkValidFields.js"></script>

</body>
</html>

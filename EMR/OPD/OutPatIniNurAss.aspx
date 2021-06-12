﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAss.aspx.cs" Inherits="EMR.OutPathIniNurAss" EnableEventValidation="false" ValidateRequest="false" %>

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
<%@ Register Src="~/UserControls/TextField1.ascx" TagPrefix="webUI" TagName="TextField1" %>

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
                        <asp:HiddenField runat="server" ID="HiddenField1" />
                        <asp:HiddenField runat="server" ID="FormState" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>
                        <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row" style="margin-bottom: 50px" id="atop">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>

                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body mb-4">
                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label h5">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS</span></label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_temperature" CssClass="form-view" />
                                                    <div class="w-5 form-edit">
                                                        <WebUI:TextField1 TextMode="number" runat="server" ID="txt_vs_temperature" >
                                                            <Append>°C</Append>
                                                        </WebUI:TextField1>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate" CssClass="form-view" />
                                                    <div class="w-5 form-edit">
                                                        <WebUI:TextField1 TextMode="number" runat="server" ID="txt_vs_heart_rate" >
                                                            <Append>/phút (m)</Append>
                                                        </WebUI:TextField1>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label  mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_weight" CssClass="form-view" />
                                                    <div class="w-5 form-edit">
                                                        <div class="input-group" style="place-self: flex-start;">
                                                            <input type="text" data-type="number" runat="server" id="txt_vs_weight" onchange="CalculateBmi()"  placeholder="" aria-label="Recipient's username" aria-describedby="" class="form-control text-right" />
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">Kg</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate" CssClass="form-view" />
                                                    <div class="w-6 form-edit">
                                                        <WebUI:TextField1 TextMode="number" runat="server" ID="txt_vs_respiratory_rate" >
                                                            <Append>/phút (m)</Append>
                                                        </WebUI:TextField1>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_height" CssClass="form-view" />
                                                    <div class="w-5 form-edit">
                                                        <div class="input-group" style="place-self: flex-start;">
                                                            <input type="text" data-type="number" runat="server" id="txt_vs_height" onchange="CalculateBmi()"  placeholder="" aria-label="Recipient's username" aria-describedby="" class="form-control text-right" />
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">cm</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure" CssClass="form-view" />
                                                    <div class="w-6 form-edit">
                                                        <div class="input-group" style="place-self: flex-start;">
                                                            <input type="text" data-type="number" runat="server" id="txt_vs_blood_pressure"  placeholder="" aria-label="Recipient's username" aria-describedby="" class="form-control text-right" />
                                                            <div class="input-group-append">
                                                            <span class="input-group-text">mmHg</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 ">
                                                    <div class="d-flex no-block">
                                                        <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <span style="width: 100px" class="text-right">
                                                            <asp:Label runat="server" ID="lbl_vs_bmi" CssClass="mr-1"/> (Kg/m <sup>2</sup>)
                                                        </span>
                                                    </div>
                                                    <p class="mt-1">
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
            applicable for children and pregnant</span>)
                                                    </p>
                                                </div>
                                                <div class="col-sm-6 mb-2  d-flex no-block">
                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_spo2" CssClass="form-view" />
                                                    <div class="w-5 form-edit">
                                                        <WebUI:TextField1 runat="server" TextMode="number" ID="txt_vs_spo2" >
                                                            <Append>%</Append>
                                                        </WebUI:TextField1>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12 mb-2 d-flex no-block">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_pluse" CssClass="form-view" />
                                                    <div class="w-5 form-edit">
                                                        <WebUI:TextField1 runat="server" ID="txt_vs_pluse" >
                                                            <Append>cm</Append>
                                                        </WebUI:TextField1>
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
                                                <div class="col-md-12 form-edit">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" id="txtChiefComplaint" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 form-view">
                                                    <asp:Label CssClass="d-block" runat="server" ID="lbl_chief_complaint" />
                                                </div>
                                            </fieldset>


                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                </legend>

                                                <div class="col-md-12 form-edit">
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
                                                        <span id="rad_allergy_error" data-for="rad_allergy" data-message-error="Dị ứng/ Allergy is required" class="text-danger required"></span>
                                                    </div>

                                                    <div class="form-group allergy_field">
                                                        <webUI:TextField runat="server" id="txt_allergy_note" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 form-view">
                                                    <asp:Label runat="server" ID="lbl_allergy" />
                                                    <asp:Label CssClass="d-block" runat="server" ID="lbl_allergy_note" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label>
                                                </legend>
                                                <div class="col-md-12 form-edit">
                                                    <label class="control-label mb-1 w-7">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label>

                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" runat="server" id="rad_mental_status_true" onchange="radioButtonChange(this)" data-target="mental_status_note_field" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_true">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio  d-inline-block ml-2">
                                                        <input onchange="radioButtonChange(this)" disabled-for="mental_status_note_field" type="radio" runat="server" id="rad_mental_status_false" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_false">Không, ghi rõ/ <span class="text-primary">No, specify:</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_mental_status" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare6" />
                                                </a>
                                                        <span id="rad_mental_status_error" class="text-danger required" data-for="rad_mental_status"  data-message-error="Trạng thái tinh thần/ Appropriate response is required"></span>
                                                    </div>

                                                    <div class="form-group mental_status_note_field">
                                                        <webUI:TextField runat="server" id="txt_mental_status_note" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 form-view">
                                                    <label class="control-label mb-1 w-7">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label>
                                                    <asp:Label runat="server" ID="lbl_mental_status" />
                                                    <asp:Label CssClass="d-block" runat="server" ID="lbl_mental_status_note" />
                                                </div>
                                            </fieldset>

                                            <%-- 4. Pain score --%>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">4. Thang điểm đau/ <span class="text-primary">Pain score:</span></label>
                                                </legend>
                                                <div class="col-md-12 form-edit">
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
                                                        <a class="btn-clear-option" href="javascript:void(0)" data-clear="rad_paint_score_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare2" />
                                                </a>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 form-view">
                                                    <asp:Label runat="server" ID="lbl_paint_score_desc" />
                                                </div>
                                                <div class="col-md-12">
                                                    <img src="../images/pain_score.png" style="max-width: 720px; width: 100%;" alt="" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">5. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk MORSE SCALE:</span></label>
                                                </legend>
                                                <div class="col-md-12 form-edit">
                                                    <div class="custom-control custom-radio">
                                                        <input onchange="radioButtonChange(this)" data-target="fall_risk_assistance_field" type="radio" runat="server" id="rad_fall_risk_false" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_false">Không có nguy cơ/ <span class="text-primary">No risk</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="fall_risk_assistance_field" onchange="radioButtonChange(this)"  type="radio" runat="server" id="rad_fall_risk_true" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_true">Nếu có, cung cấp phương tiện hỗ trợ/ <span class="text-primary">If yes, provide assistance</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_fall_risk" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare22" />
                                                        </a>
                                                        <span id="rad_fall_risk_error" data-for="rad_fall_risk" data-message-error="Tầm soát nguy cơ té ngã/ Fall risk MORSE SCALE is required" class="text-danger required"></span>
                                                    </div>
                                                    <div class="form-group fall_risk_assistance_field">
                                                        <webUI:TextField runat="server" id="txt_fall_risk_assistance" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 form-view">
                                                    <asp:Label runat="server" ID="lbl_fall_risk" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">6. Đánh giá tình trang dinh dưỡng/ <span class="text-primary">Nutritional status screening:</span></label>
                                                </legend>
                                                <div class="col-md-12 form-edit">
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

                                                <div class="col-md-12 form-view">
                                                    <asp:Label runat="server" ID="lbl_nutrition_status_desc" />
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
                                                        <div class="col-md-12 form-edit">
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

                                                        <div class="col-md-12 form-view">
                                                            <asp:Label runat="server" ID="lbl_housing_desc" />
                                                        </div>
                                                    </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">IV. MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION:</span></label>
                                                </div>

                                                <div class="col-md-12 form-edit">
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_im" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_im">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_wa" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_wa">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_prioritization_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare4" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 form-view">
                                                    <asp:Label runat="server" ID="lbl_prioritization_desc" />
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">Ngày, giờ đánh giá/ <span class="text-primary">Time, Date of assessment:</span></label>
                                                </div>

                                                <div class="col-md-12 form-edit">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_assess_date_time" Width="200px" />

<%--                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="Radio1" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_im">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="Radio2" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_wa">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_prioritization_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare7" />
                                                        </a>
                                                    </div>--%>
                                                </div>
                                                <div class="col-md-12 form-view">
                                                    <asp:Label runat="server" ID="lbl_assessment_date_time" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <button type="button" onclick="validateForm1()" runat="server" id="btnComplete" class="btn btn-primary waves-effect form-edit">
                                                        Complete
                                                    </button>

                                                    <button type="button" onserverclick="btnSave_Click" runat="server" id="btnSave" class="btn btn-primary waves-effect form-edit">
                                                        Save
                                                    </button>
                                                    <%--<button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" >Delete</button>--%>

                                                    <button type="button" data-toggle="modal" data-target="#myModal" id="btnDeleteModal" runat="server" class="btn btn-danger waves-effect form-edit">
                                                        Delete
                                                    </button>

                                                    <button onserverclick="btnAmend_Click" runat="server" id="btnAmend" class="btn btn-secondary waves-effect form-view">
                                                        Amend
                                                    </button>

                                                    <button onclick="window.print();return false" id="btnPrint" runat="server" class="btn btn-secondary waves-effect form-view">
                                                        Print
                                                    </button>

                                                    <button runat="server" onserverclick="btnCancel_Click" id="btnCancel" class="btn btn-secondary waves-effect form-update">
                                                        Cancel
                                                    </button>
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
                        <%--<asp:PostBackTrigger ControlID="btnAmend" />--%>
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
    <script src="../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
    <script src="../scripts/checkValidFields.js"></script>
    <script src="../scripts/waves.js"></script>

    <script>

        document.getElementById('form2').setAttribute('data-form-state', document.getElementById("FormState").value);

        function amend() {
            document.getElementById('form2').setAttribute('data-form-state', 'edit');
            document.getElementById('atop').scrollIntoView();
        }

        function beforeAsyncPostBack() {
            var curtime = new Date();
            console.log(curtime);
        }

        function afterAsyncPostBack() {
            document.getElementById('form2').setAttribute('data-form-state', document.getElementById("FormState").value);
            let temp1 = document.querySelectorAll('input[data-type="number"]');

            temp1.forEach(e => {
                setInputFilter(e, function (value) {
                    return /^\d*\.?\d*$/.test(value);
                });
            });
        }

        Sys.Application.add_init(appl_init);

        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_beginRequest(BeginHandler);
            pgRegMgr.add_endRequest(EndHandler);
        }

        function BeginHandler() {
            beforeAsyncPostBack();
        }

        function EndHandler() {
            afterAsyncPostBack();
        }
    </script>

    <script>
        function radioButtonChange(eventArgs) {
            try {
                let radiosEle = $(`input[name=${eventArgs.name}]`);
                console.log(eventArgs);

                let disabledFor = eventArgs.getAttribute('disabled-for');
                console.log(disabledFor);

                if (disabledFor != 'undefined' && disabledFor != false) {

                    if (!eventArgs.checked) {
                        let EleByClassName = document.getElementsByClassName(disabledFor);

                        for (let l = 0; l < EleByClassName.length; l++) {
                            EleByClassName[l].classList.add("el-hide");
                        }
                    }
                }

                //if (disabledFor != 'undefined' && disabledFor != false) {

                //    for (let k = 0; k < radiosEle.length; k++) {

                //        let EleByClassName = document.getElementsByClassName(radiosEle[k].getAttribute('disabled-for'));

                //        for (let l = 0; l < EleByClassName.length; l++) {

                //            if (EleByClassName[l].classList.contains(disabledFor)) {
                //                EleByClassName[l].classList.remove("el-hide");
                //                EleByClassName[l].classList.add("el-show");
                //            } else {
                //                EleByClassName[l].classList.remove("el-show");
                //                EleByClassName[l].classList.add("el-hide");
                //            }
                //        }
                //    }
                //}
            } catch (ex) {
                console.error(ex);
            }
        }

        function checkradiobutton(radio_button_name) {
            let radio_button = document.querySelector(`input[type='radio'][name='${radio_button_name}']:checked`);
            if (!radio_button) {
                let errorElement = document.querySelector(`#${radio_button_name}_error`);
                errorElement.innerHTML = errorElement.getAttribute('data-message-error')
                return false;
            }
            return true;
        }

        function validateForm1() {
            validateForm(() => {
                console.log("Passed");
                __doPostBack('<%=btnComplete.UniqueID%>', '');
            });
        };

        function validateForm(pass) {

            let checks = document.querySelectorAll(`.required`);
            console.log(checks);
            let errors = [];
            checks.forEach(e => {
                e.getAttribute("data-for");
                if (!checkradiobutton(e.getAttribute("data-for"))) {
                    errors.push(e);
                }
            });

            amend_reason = document.getElementById("txt_amendReason");

            if (amend_reason) {
                if (amend_reason.value.length <= 3) {
                    document.getElementById("messagePlaceHolder").scrollIntoView();
                    document.getElementById("DisplayControl").focus();
                    errors.push(amend_reason);
                }
            }

            if (errors.length <= 0) pass();

        }

        function radioButtonChange(eventArgs) {
            try {
                let EleByClassName;
                let disabledFor = eventArgs.getAttribute('disabled-for');

                if (disabledFor !== undefined && disabledFor !== null) {
                    
                    EleByClassName = document.getElementsByClassName(disabledFor);

                    for (let l = 0; l < EleByClassName.length; l++) {
                        EleByClassName[l].classList.remove("el-hide");
                    }
                } else {
                   
                    EleByClassName = document.getElementsByClassName(eventArgs.getAttribute("data-target"));

                    for (let l = 0; l < EleByClassName.length; l++) {
                        EleByClassName[l].classList.add("el-hide");
                    }
                }

            } catch (ex) {
                console.error(ex);
            }
        }
    </script>
</body>
</html>

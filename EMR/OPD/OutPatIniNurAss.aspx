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
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="Button" TagName="PopupShowDelay" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>PHIẾU ĐÁNH GIÁ ĐIỀU<br />DƯỠNG BỆNH NGOẠI TRÚ</h4>
                                            <h5>OUTPATIENT INITIAL NURSING ASSESSMENT</h5>
                                        </div>
                                        <div style="width: 175px;">
                                            <asp:Label runat="server" ID="prt_fullname" CssClass="d-block"></asp:Label>
                                            <asp:Label CssClass="d-block" runat="server" ID="prt_DOB"></asp:Label>
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
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
                                    <div class="main">
                                        <webUI:PrtRowS1 Order="I." FontBold="true" Title="DẤU HIỆU SINH TỒN:" SubTitle="VITAL SIGNS" runat="server" />
                                        <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                            <tr>
                                                <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                                <td class="p-2">Mạch/ Pulse (/min)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_pulse" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Cân nặng/ Weight (Kg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_weight" /></td>
                                                <td class="p-2">Nhịp thở/ Respiratory Rate (/min)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chiều cao/Height (cm)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_height" /></td>
                                                <td class="p-2">Huyết áp/Blood pressure (mmHg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_blood_pressure" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chỉ số khối cơ thể/ BMI (Kg/m2)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                                <td class="p-2">Độ bão hòa Oxy/ SpO2 (%)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_spO2" /></td>
                                            </tr>
                                        </table>

                                        <webUI:PrtRowS1 FontBold="true" Order="II." Title="ĐÁNH GIÁ:" SubTitle="ASSESSMENT" runat="server" />
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="1." FixedWidth="152" Title="Lý do đến khám:" SubTitle="Chief complaint"  runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complaint" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <webUI:PrtRowS1 FontBold="true" Order="2." FixedWidth="152" Title="Dị ứng:" SubTitle="Allergy" runat="server"  />
                                            <asp:Label runat="server" ID="prt_allergy"/>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="3." Title="Trạng thái tinh thần" SubTitle="Mental status" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="30" FixedWidth="152" Title="Đáp ứng phù hợp" SubTitle="Appropriate response" runat="server" />
                                            <asp:Label runat="server" ID="prt_mental_status" />
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="4." FixedWidth="152" Title="Thang điểm đau:" SubTitle="Pain Score" ID="prt_paint_score_code" runat="server" Value="0" />

                                        <div class="text-center mb-2">
                                            <img src="../images/pain_score.png" />
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="5." FixedWidth="235" Title="Tầm soát nguy cơ té ngã:" SubTitle="Fall Risk Morse Scale" Value="Không có nguy cơ/ No risk" runat="server" ID="prt_fall_risk" />

                                        <webUI:PrtRowS1 FontBold="true" Order="6." FixedWidth="235" Title="Đánh giá tình trạng dinh dưỡng:" SubTitle="Nutritional Status Screening" Value="Không ghi nhận/ N/A" ID="prt_nutrition_status_code" runat="server" />

                                        <webUI:PrtRowS1 FontBold="true" Order="III." Title="ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH(DUY NHẤT CHO LẦN KHÁM ĐẦU TIÊN):" SubTitle="SOCIAL FACTORS ASSESSMENT(ONLY FOR THE FIRST VISIT)" runat="server" />


                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="30" FixedWidth="152" Title="Tình trạng sinh sống:" SubTitle="Housing" runat="server" />
                                            
                                            <asp:Label CssClass="d-grid" runat="server" ID="prt_housing" />
                                        </div>


                                        <webUI:PrtRowS1 FontBold="true" Order="IV." FixedWidth="152" ID="prt_prioritization_code" Title="MỨC ĐỘ ƯU TIÊN:" SubTitle="PRIORITIZATION" Value="Có thể chờ khám trong khoảng thời gian xác định" runat="server" />

                                        <div class="d-grid mt-4" style="grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center">
                                                <div>Ngày/ Date: 13-04-2021 13:28</div>
                                                <div><span class="font-bold">ĐIỀU DƯỠNG ĐÁNH GIÁ</span></div>
                                                <div>Assessment done by Nurse</div>
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
                    <div style="overflow: scroll; height: calc(100vh - 52px); overflow-x: hidden;">
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

                        <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
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
                                                    <asp:Label runat="server" ID="lbl_vs_temperature"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_temperature_wrapper">
                                                        <input id="txt_vs_temperature" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_heart_rate_wrapper">
                                                        <input id="txt_vs_heart_rate" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
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
                                                        <input  id="txt_vs_height" onchange="CalculateBmi()"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_blood_pressure_wrapper">
                                                        <input  id="txt_vs_blood_pressure" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
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
                                                        <input  id="txt_vs_spo2"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
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
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label  h5">II. ĐÁNH GIÁ/ <span class="text-primary">ASSESSMENT</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <asp:Label  runat="server" ID="lbl_chief_complaint"  />
                                                    <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                </legend>

                                                <div class="col-md-12" runat="server" id="allergy_wrapper">
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
                                                        <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_allergy" /><br />
                                                    <asp:Label runat="server" ID="lbl_allergy_note" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label>
                                                </legend>
                                                <div class="col-md-12 d-grid" style="grid-template-columns:  auto 1fr; grid-gap: 5px;">
                                                    <label class="control-label mb-1">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label>

                                                    <asp:Label runat="server" ID="lbl_mental_status" />

                                                    <div  runat="server" id="mental_status_wrapper">
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
                                                        <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="Group1" ErrorMessage="Trạng thái tinh thần/ Appropriate response is required" CssClass="text-danger" OnServerValidate="CustomValidatorMentalStatus_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>

                                                    <div class="form-group mental_status_note_field">
                                                        <webUI:TextField runat="server" ID="txt_mental_status_note" />
                                                    </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <%-- 4. Pain score --%>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">4. Thang điểm đau/ <span class="text-primary">Pain score:</span></label>
                                                </legend>
                                                <div class="col-md-12" runat="server" id="paint_score_code_wrapper">
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
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_paint_score_description" />
                                                </div>
                                                <div class="col-md-12">
                                                    <img src="../images/pain_score.png" style="max-width: 720px; width: 100%;" alt="" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">5. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk MORSE SCALE:</span></label>
                                                </legend>
                                                <div class="col-md-12" runat="server" id="fall_risk_wrapper">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_fall_risk_false" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_false">Không có nguy cơ/ <span class="text-primary">No risk</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="fall_risk_assistance_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_fall_risk_true" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_true">Nếu có, cung cấp phương tiện hỗ trợ/ <span class="text-primary">If yes, provide assistance</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_fall_risk" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare22" />
                                                        </a>
                                                        <%--<asp:CustomValidator ID="CustomValidator4" ValidationGroup="Group1" runat="server" ErrorMessage="Tầm soát nguy cơ té ngã/ Fall risk MORSE SCALE is required" CssClass="text-danger" OnServerValidate="CustomValidatorFallRisk_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                    <div class="form-group fall_risk_assistance_field">
                                                        <webUI:TextField runat="server" ID="txt_fall_risk_assistance" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_fall_risk" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">6. Đánh giá tình trang dinh dưỡng/ <span class="text-primary">Nutritional status screening:</span></label>
                                                </legend>
                                                <div class="col-md-12" runat="server" id="nutrition_status_code_wrapper">
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
                                                        <a href="javascript:void(0)" data-clear="rad_nutrition_status_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_nutrition_status_description" />
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
                                                <div class="col-md-12" runat="server" id="housing_code_wrapper">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_housing_code_aln" name="rad_housing_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_housing_code_aln">Sống một mình/ <span class="text-primary">Lives alone</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_housing_code_rel" name="rad_housing_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_housing_code_rel">Sống với người thân/ <span class="text-primary">With relatives</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_housing_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare3" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_housing_description" />
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">IV. MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION:</span></label>
                                                </div>

                                                <div class="col-md-12" runat="server" id="prioritization_code_wrapper">
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_im" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_im">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_wa" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_wa">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_prioritization_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare4" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_prioritization_description" />
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                    <label class="control-label mb-1 h5">Ngày, giờ đánh giá/ <span class="text-primary">Time, Date of assessment:</span></label>
                                                    <div class="col-md-12" runat="server" id="assessment_date_time_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_assessment_date_time" Width="200px" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_assessment_date_time" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete"  CssClass="btn btn-primary waves-effect" >Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect" >Save</asp:LinkButton>

                                                        <%--<asp:LinkButton ValidationGroup="Group1" OnClick="btnDelete_Click" ID="btnDelete" runat="server" CssClass="btn btn-primary waves-effect" >Delete</asp:LinkButton>--%>

                                                        <div data-toggle="modal" runat="server" data-target="#myModal" id="btnDeleteModal" class="btn btn-danger waves-effect">Delete</div>

                                                        <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                        <asp:LinkButton runat="server" OnClick="btnPrint_Click" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
                                                        <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>

                                        <Button:PopupShowDelay runat="server" ID="PopupShowDelay" />

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
        /**
 * This javascript file checks for the brower/browser tab action.
 * It is based on the file menstioned by Daniel Melo.
 * Reference: http://stackoverflow.com/questions/1921941/close-kill-the-session-when-the-browser-or-tab-is-closed
 */
        var validNavigation = false;

        function wireUpEvents() {
            /**
             * For a list of events that triggers onbeforeunload on IE
             * check http://msdn.microsoft.com/en-us/library/ms536907(VS.85).aspx
             *
             * onbeforeunload for IE and chrome
             * check http://stackoverflow.com/questions/1802930/setting-onbeforeunload-on-body-element-in-chrome-and-ie-using-jquery
             */
            var dont_confirm_leave = 0; //set dont_confirm_leave to 1 when you want the user to be able to leave without confirmation
            var leave_message = 'You sure you want to leave?';
            function goodbye(e) {
                if (!validNavigation) {
                    if (dont_confirm_leave !== 1) {
                        if (!e) e = window.event;
                        //e.cancelBubble is supported by IE - this will kill the bubbling process.
                        e.cancelBubble = true;
                        e.returnValue = leave_message;
                        //e.stopPropagation works in Firefox.
                        if (e.stopPropagation) {
                            e.stopPropagation();
                            e.preventDefault();
                        }
                        //return works for Chrome and Safari
                        return leave_message;
                    }
                }
            }

            window.onbeforeunload = goodbye;

            // Attach the event keypress to exclude the F5 refresh
            $(document).bind('keypress', function (e) {
                if (e.keyCode == 116) {
                    validNavigation = true;
                }
            });

            // Attach the event click for all links in the page
            $("a").bind("click", function () {
                validNavigation = true;
            });

            // Attach the event submit for all forms in the page
            $("form").bind("submit", function () {
                validNavigation = true;
            });

            // Attach the event click for all inputs in the page
            $("input[type=submit]").bind("click", function () {
                validNavigation = true;
            });

        }

        // Wire up the events as soon as the DOM tree is ready
        $(document).ready(function () {
            wireUpEvents();
        });
    </script>

    <script>
        

        //function comfirmDelete() {

        ////    swal({
        ////        title: "Are you sure?",
        ////        text: "You will not be able to recover this imaginary file!",
        ////        type: "warning",
        ////        showCancelButton: true,
        ////        confirmButtonColor: "#DD6B55",
        ////        confirmButtonText: "Yes, delete it!",
        ////        closeOnConfirm: false
        ////    }, function (isConfirm) {
        ////            if (isConfirm) { swal("Done!", "It was succesfully deleted!", "success"); }
        ////            else { return false; }
        ////        //$.ajax({
        ////        //    url: "OutPatIniNurAss.aspx/btnDelete_Click",
        ////        //    type: "POST",
        ////        //    data: '{"value":""}',
        ////        //    contentType: 'application/json; charset=utf-8',
        ////        //    dataType: "json",
        ////        //    success: function () {
        ////        //        swal("Done!", "It was succesfully deleted!", "success");
        ////        //        __doPostBack()';
        ////        //    },
        ////        //    error: function (xhr, ajaxOptions, thrownError) {
        ////        //        swal("Error deleting!", "Please try again", "error");
        ////        //    }
        ////        //});
        ////    });
        //}

        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter();

        function beforeAsyncPostBack() {
            var curtime = new Date();
            console.log(curtime);
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter();
        }

    </script>

</body>
</html>

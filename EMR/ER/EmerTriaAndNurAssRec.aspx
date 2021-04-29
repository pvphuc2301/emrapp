<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerTriaAndNurAssRec.aspx.cs" Inherits="EMR.EmergencyTriageAndNursingAssessmentRecord" ValidateRequest="false" %>


<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/icons/PlusCircle.ascx" TagPrefix="Icon" TagName="PlusCircle" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="Icon" TagName="Trash" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
        .alert {
            display: flex;
            align-items: center;
        }

        #MessagePlaceHolder {
            left: 0;
            right: 0;
        }
    </style>
</head>
<body>

    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">AIH Hospital</p>
        </div>
    </div>

    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <div id="AmendReasonPlaceHolder" runat="server"></div>

                    <uc1:PatientInfo runat="server" ID="PatientInfo" />

                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">Emergency Triage And Nursing Assessment Record</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body">
                                    <div class="form-body collapse show" id="collapseOne">

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"><span class="text-primary">Triage Date Time <span class="text-danger">*</span></span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="TextField6" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Khu vực/ <span class="text-primary">Triage Area #:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="TextField7" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Than phiền chính/ <span class="text-primary">Chief complaint:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_chief_complaint" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code1" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code1">1-Hồi sức/ <span class="text-primary">Resuscitation</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2  col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code2" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code2">Cấp cứu/ <span class="text-primary">Emergency</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code3" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code3">Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code4" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code4">Trì hoãn/ <span class="text-primary">Less Urgent</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code5" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code5">Không cấp cứu/ <span class="text-primary">Non-Urgent</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- End Chief complaint -->

                                        <!-- Mode of arrival -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Đến khoa bằng/ <span class="text-primary">Mode of arrival:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-4 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_arrival_mode_code1" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_arrival_mode_code1">Tự đến/ <span class="text-primary">Walk-in</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_arrival_mode_code2" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_arrival_mode_code2">Xe lăn/ <span class="text-primary">Wheel chair</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_arrival_mode_code3" runat="server" name="rad_arrival_mode_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_arrival_mode_code3">Xe cấp cứu/ <span class="text-primary">Ambulance</span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Mode of arrival -->

                                        <!-- Chief complaint -->
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiền căn/ <span class="text-primary">Past Medical History:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_past_medical_history" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">Vital signs</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_temperature" runat="server" class="form-control text-right" />
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txt_vs_heart_rate" runat="server" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_weight" runat="server" class="form-control text-right" />
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txt_vs_respiratory_rate" runat="server" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_height" maxlength="3" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                    <span class="append">mmHg</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2">
                                                <div class="d-flex no-block">
                                                    <label for="bmi" class="control-label w-6 mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                    <div class="form-group w-5">
                                                        <input id="txt_vs_bmi" runat="server" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                            <script type="text/javascript">

                                                                document.getElementById('txt_vs_height').addEventListener("change", function (e) {
                                                                    document.getElementById('txt_vs_bmi').value = CalculateBmi();
                                                                });

                                                                document.getElementById('txt_vs_weight').addEventListener("change", function (e) {
                                                                    document.getElementById('txt_vs_bmi').value = CalculateBmi();
                                                                });

                                                                function CalculateBmi() {
                                                                    if (document.getElementById('txt_vs_height').value == "" || document.getElementById('txt_vs_weight').value == "") return "";
                                                                    else { return (document.getElementById('txt_vs_weight').value / ((document.getElementById('txt_vs_height').value / 100) * 2)).toFixed(2) };
                                                                }

                                                            </script>
                                                        </telerik:RadScriptBlock>
                                                    </div>
                                                </div>
                                                <p class="mt-1">
                                                    (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
            applicable for children and pregnant</span>)
                                                </p>
                                            </div>

                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="spO2" class="control-label w-6 mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_spo2" runat="server" class="form-control text-right" />
                                                    <span class="append">%</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_head_circum" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- End Vital signs -->

                                        <!-- Pain assess -->

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Đánh giá đau/ <span class="text-primary">Pain assess:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Khởi phát/ <span class="text-primary">Onset:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_pain_onset" />
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Vị trí/ <span class="text-primary">Location:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_pain_location" />
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Kéo dài/ <span class="text-primary">Duration:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_pain_duration" />
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Hướng lan/ <span class="text-primary">Radiation:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_pain_radiation" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <img src="../images/pain_score.png" style="max-width: 720px; width: 100%;" alt="" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-4">
                                                <label class="control-label mb-1 font-bold">Điểm đau/ <span class="text-primary">Pain score:</span></label>
                                            </div>
                                            <div class="col-md-8">
                                                <input runat="server" class="form-control d-inline-block w-4" id="txt_pain_score" />
                                            </div>
                                        </div>

                                        <!-- End Pain assess -->

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <label for="pain-scale" class="control-label mb-1">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_allergy" />
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Medications used -->
                                        <div class="row">
                                            <div class="col-12">
                                                <label class="control-label mb-1">Thuốc đã dùng/ <span class="text-primary">Medications used:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_current_medication" />
                                                </div>
                                            </div>
                                        </div>

                                        <!-- End Medications used -->

                                        <!-- Skin integrity -->

                                        <div class="row">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1 font-bold">Đánh giá loét/ <span class="text-primary">Skin Integrity</span></label>
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Rách da/ <span class="text-primary">Laceration (L)</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Trầy xước/ <span class="text-primary">Abrasion (A)</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Bong gân/Căng cơ/ <span class="text-primary">Sprain/Strain (S)</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Bỏng/ <span class="text-primary">Burn (B)</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Biến dạng/ <span class="text-primary">Deformity (D)</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Loét/ <span class="text-primary">Ulceration (U)</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Tầm soát bệnh lây nhiễm/ <span class="text-primary">Communicable disease screening</span></label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_f" />
                                                    <span class="custom-control-label">Sốt/ <span class="text-primary">Fever</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_c" />
                                                    <span class="custom-control-label">Ho/ <span class="text-primary">Cough</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_r" />
                                                    <span class="custom-control-label">Nổi mần/ <span class="text-primary">Rash</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_s" />
                                                    <span class="custom-control-label">Đau họng/ <span class="text-primary">Sore throat</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_com_dis_src_t" />
                                                    <span class="custom-control-label">Đi khỏi Việt Nam trong vòng 15 ngày gần đây/ <span class="text-primary">Travel outside Vietnam in past 15 days</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Kế hoạch xuất viện/ <span class="text-primary">Discharge Planning</span></label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_cde_la" />
                                                    <span class="custom-control-label">Sống một mình/ <span class="text-primary">Lives alone</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_cde_ra" />
                                                    <span class="custom-control-label">Cần trợ giúp sinh hoạt hàng ngày/ <span class="text-primary">Requires assistance with activities of daily living</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_cde_hf" />
                                                    <span class="custom-control-label">Nguy cơ ngã cao/ <span class="text-primary">high fall risk</span> Nơi cư trú sau khi xuất viện <span class="text-primary">Place of residence after discharge</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Nơi cư trú sau khi xuất viện/ <span class="text-primary">Disposition after discharge:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_cde_after_discharge1" name="rad_cde_after_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cde_after_discharge1">Nhà riêng/ <span class="text-primary">Private home</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="txtMentalStatus" type="radio" runat="server" id="rad_cde_after_discharge2" name="rad_cde_after_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cde_after_discharge2">Cơ sở y tế khác/ <span class="text-primary">Other healthcare facility:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_cde_after_discharge" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare" />
                                                    </a>
                                                </div>
                                            </div>

                                            <%--<div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 mt-2">Nơi cư trú sau khi xuất viện/ <span class="text-primary">Disposition after discharge:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_disposition_after_discharge_code" />
                                                </div>
                                            </div>--%>

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 mt-2">Người chăm sóc sau khi xuất viện <span class="text-primary">People who will look after patient after discharge:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_caregiver_after_discharge" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">TRỞ NGẠI TRONG CHĂM SÓC/ <span class="text-primary">BARRIER TO CARE</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">1. Trở ngại về ngôn ngữ/ <span class="text-primary">Language Barriers:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_btc_language1" name="rad_btc_language" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_language1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="btc_language_note_field" type="radio" id="rad_btc_language2" name="rad_btc_language" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_language">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                </div>
                                                <div class="form-group btc_language_note_field">
                                                    <Input:TextField runat="server" ID="txt_btc_language_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">2. Trở ngại về nhận thức/ <span class="text-primary">Cognitive Barriers:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_btc_cognitive1" name="rad_btc_cognitive" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_cognitive1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="btc_cognitive_field" type="radio" id="rad_btc_cognitive2" name="rad_btc_cognitive" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_cognitive2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                </div>
                                                <div class="form-group btc_cognitive_field">
                                                    <Input:TextField runat="server" ID="txt_btc_cognitive_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">3. Trở ngại về Giác quan/ <span class="text-primary">Sensory Barriers:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_btc_sensory1" name="rad_btc_sensory" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_sensory1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="btc_sensory_field" type="radio" id="rad_btc_sensory2" name="rad_btc_sensory" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_sensory2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                </div>
                                                <div class="form-group btc_sensory_field">
                                                    <Input:TextField runat="server" ID="txt_btc_sensory_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">4. Trở ngại về Tôn giáo/ <span class="text-primary">Religious Barriers:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_btc_religious1" name="rad_btc_religious" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_religious1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="btc_religious_field" type="radio" id="rad_btc_religious2" name="rad_btc_religious" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_religious2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                </div>
                                                <div class="form-group btc_religious_field">
                                                    <Input:TextField runat="server" ID="txt_btc_religious_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">5. Trở ngại về Văn hóa/ <span class="text-primary">Cultural Barriers:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_btc_cultural1" name="rad_btc_cultural" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_cultural1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="btc_cultural_field" type="radio" id="rad_btc_cultural2" name="rad_btc_cultural" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_btc_cultural2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                </div>
                                                <div class="form-group btc_cultural_field">
                                                    <Input:TextField runat="server" ID="txt_btc_cultural_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">ĐÁNH GIÁ THỂ CHẤT CÁC CƠ QUAN/ <span class="text-primary">ASSESSMENT BY SYSTEM:</span></label>
                                            </div>
                                        </div>

                                        <%--<div class="row">
                                            <div class="col-md-6 mb-2 d-sm-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Số phòng/ <span class="text-primary">Room number:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <input id="txt" runat="server" class="form-control text-right" />
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox27" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control cultural_b" ></telerik:RadTextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-block d-xl-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Thời điểm đánh giá/ <span class="text-primary">Time of assessment:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker7" runat="server" ></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker10" runat="server" ></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                        </div>--%>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tổng trạng chung/ <span class="text-primary">General appearance:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_cde_p" />
                                                    <span class="custom-control-label">Hồng hào/ <span class="text-primary">Pink</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_cde_c" />
                                                    <span class="custom-control-label">Tím/ <span class="text-primary">Cyanosis</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_cde_t" />
                                                    <span class="custom-control-label">Tái/ <span class="text-primary">Pallor</span></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thần kinh/ <span class="text-primary">Neuro:</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"><span class="text-primary">Glasgow coma scale/ GCS</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label mb-2">Mắt/ <span class="text-primary">E</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_eye" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label mb-2">Lời nói/ <span class="text-primary">V</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_voice" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label mb-2">Vận động/ <span class="text-primary">M</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_motion" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" />
                                                    <span class="custom-control-label">Tỉnh táo/ <span class="text-primary">Alert</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="rad_loc_avpu_a" />
                                                    <span class="custom-control-label">Hôn mê/ <span class="text-primary">Coma</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="custom-control custom-checkbox">
                                                    <input disabled-for="neuro_field" type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                </label>
                                                <div class="form-group neuro_field">
                                                    <Input:TextField runat="server" ID="txt_others" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Hô hấp/ <span class="text-primary">Respiratory:</span></label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_reg" />
                                                    <span class="custom-control-label">Thở đều/ <span class="text-primary">Regular</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_nre" />
                                                    <span class="custom-control-label">Thở không đều/ <span class="text-primary">Inregular</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_tac" />
                                                    <span class="custom-control-label">Thở nhanh/ <span class="text-primary">Tachypneic</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_sha" />
                                                    <span class="custom-control-label">Thở nông/ <span class="text-primary">Shallow</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_lab" />
                                                    <span class="custom-control-label">Thở gắng sức/ <span class="text-primary">Labored</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Co kéo/ <span class="text-primary">Retractions</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_cou" />
                                                    <span class="custom-control-label">Ho/ <span class="text-primary">Cough</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_spu" />
                                                    <span class="custom-control-label">Có đàm/ <span class="text-primary">Sputum</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="custom-control custom-checkbox">
                                                    <input disabled-for="respiratory_field" type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                </label>

                                                <div class="form-group respiratory_field">
                                                    <Input:TextField runat="server" ID="txt_rhythm_str_others" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Tim mạch/ <span class="text-primary">Cardiovascular:</span></label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Nhịp tim/ <span class="text-primary">Rhythm:</span></label>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_rhythm1" name="rad_rhythm" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_rhythm1">Đều/ <span class="text-primary">Regular</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_rhythm2" name="rad_rhythm" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_rhythm2">Ngưng tim/ <span class="text-primary">Cardiac arrest</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_rhythm3" name="rad_rhythm" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_rhythm3">Đau ngực/ <span class="text-primary">Chest pain</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="rhythm_field" type="radio" id="rad_rhythm4" name="rad_rhythm" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_rhythm4">Khác/ <span class="text-primary">Others:</span></label>
                                                </div>
                                                <div class="form-group rhythm_field">
                                                    <Input:TextField runat="server" ID="txt_rhythm_others" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Tâm lý/ <span class="text-primary">Psychosocial:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_psycho1" name="rad_psycho" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_psycho1">Bình thường/ <span class="text-primary">Normal</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="psycho_field" type="radio" id="rad_psycho2" name="rad_psycho" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_psycho2">Khác/ <span class="text-primary">Others:</span></label>
                                                </div>
                                                <div class="form-group psycho_field">
                                                    <Input:TextField runat="server" ID="txt_psychosocial_str_others" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Các cơ quan khác/ <span class="text-primary">Other systems:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_other_systems1" name="rad_other_systems" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_other_systems1">Bình thường/ <span class="text-primary">Normal</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="other_systems_field" type="radio" id="rad_other_systems2" name="rad_other_systems" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_other_systems2">Khác/ <span class="text-primary">Others:</span></label>
                                                </div>
                                                <div class="form-group other_systems_field">
                                                    <Input:TextField runat="server" ID="txt_others_systems_str" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Sản-phụ</label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control mb-1 custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Kinh cuối/ <span class="text-primary">LMP</span></span>
                                                </label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="TextField8" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label mb-1">Tiền sử thai nghén/ <span class="text-primary">Gravida/PARA:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="TextField9" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label mb-1">Sẩy/ <span class="text-primary">Abortions:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="TextField10" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <asp:Table ID="Table1" CssClass="tb-responsive" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell Width="236px" Scope="Column">Thủ thuật can thiệp/ <span class="text-primary">Intervention Procedure</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column">Thời gian/ <span class="text-primary">Time</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column">Ghi chú/ <span class="text-primary">Notes</span></asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                </asp:Table>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <asp:Table ID="tb_assessment_system" CssClass="tb-responsive" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell Scope="Column">Thời gian/ <span class="text-primary">Time</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column">Thời gian/ <span class="text-primary">RR (l/p)</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">O2Sat (%)</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">HR (bpm)</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">BP (mmhg)</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">Temp (0C)</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">GCS</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">Pain /10</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">ATS scale</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column">Tái đánh giá & Can thiệp<span class="text-primary">Re-Assessment & Intervention</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column"><span class="text-primary">RN's Initial</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Width="38px" Scope="Column"></asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                </asp:Table>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">Y lệnh thuốc & dịch truyền trực tiếp/ <span class="text-primary">Direct Medication & IV fluids Order</span></label>
                                                <table class="tb-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 92px;" scope="col">Thời gian/ <span class="text-primary">Time</span></th>
                                                            <th scope="col">Thuốc/Medication - Dịch truyền/ <span class="text-primary">IV Fluids </span></th>
                                                            <th style="width: 100px;" scope="col">Liều dùng/ <span class="text-primary">Dose</span></th>
                                                            <th scope="col" style="width: 117px;">Đường dùng/ <span class="text-primary">Route</span> </th>
                                                            <th scope="col" style="width: 95px;">Tốc độ/ <span class="text-primary">Rate</span> </th>
                                                            <th scope="col" style="width: 150px;">Bác sĩ/ <span class="text-primary">Doctor</span> </th>
                                                            <th scope="col" style="width: 200px;">Ghi chú/ <span class="text-primary">Comment</span> </th>
                                                            <th scope="col" style="width: 92px;">Thời gian/ <span class="text-primary">Time</span> </th>
                                                            <th scope="col" style="width: 150px;">Điều dưỡng/ <span class="text-primary">RN's Initial</span> </th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td data-label="Thời gian/ Time">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td data-label="Thuốc/Medication - Dịch truyền/ IV Fluids">
                                                                <Input:TextField runat="server" />
                                                            </td>
                                                            <td data-label="Liều dùng/ Dose">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td data-label="Đường dùng/ Route ">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td data-label="Tốc độ/ Rate ">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td data-label="Bác sĩ/ Doctor">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td data-label="Ghi chú/ Comment ">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td data-label="Thời gian/ Time">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td data-label="Điều dưỡng/ RN's Initial">
                                                                <input class="form-control" />
                                                            </td>
                                                            <td style="text-align: center;">
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm btn-outline-danger">
                                                                  <Icon:Trash runat="server"/>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="10">
                                                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-sm btn-outline-primary">
                                                                    <Icon:PlusCircle runat="server" />
                                                                    Add row
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="row mb-2" style="border: 1px solid #ddd; border-radius: 4px; padding-top: 12px; padding-bottom: 12px;">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Xuất viện/ <span class="text-primary">Discharged</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="dpk_discharge_date_time" runat="server"></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="tpk_discharge_date_time" runat="server"></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                            <div class="col-md-6  mb-2">
                                                <label class="control-label mb-1">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_discharge_by" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <label class="custom-control custom-checkbox m-b-0">
                                                    <input type="checkbox" class="custom-control-input" id="" />
                                                    <span class="custom-control-label">Về nhà/ <span class="text-primary">Home</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox m-b-0">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Tự ý/ <span class="text-primary">Against Medical Advice/AMA</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox m-b-0">
                                                    <input type="checkbox" class="custom-control-input" />
                                                    <span class="custom-control-label">Tử vong/ <span class="text-primary">Dead</span></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2" style="border: 1px solid #ddd; border-radius: 4px; padding-top: 12px; padding-bottom: 12px;">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Nhập viện/ <span class="text-primary">Admited</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="dpk_admited_date_time" runat="server"></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="tpk_admited_date_time" runat="server"></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                            <div class="col-md-6  mb-2">
                                                <label class="control-label mb-1">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_admited_by" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Khoa tiếp nhận/ <span class="text-primary">Receiving Unit</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_receiving_unit" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" style="border: 1px solid #ddd; border-radius: 4px; padding-top: 12px; padding-bottom: 12px;">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Chuyển viện/ <span class="text-primary">Transfer to</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_transfer_to" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_transfer_by" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Giờ thông báo Bác sĩ/ <span class="text-primary">Time notified to Doctor</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="dpk_noticed_time" runat="server"></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="tpk_noticed_time" runat="server"></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">PHIẾU GHI CHÚ ĐIỀU DƯỠNG/ <span class="text-primary">NURSING NOTES</span></label>
                                                <asp:Table ID="tb_nursing_note" CssClass="tb-responsive" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell Width="236px" Scope="Column">Ngày/ <span class="text-primary">Date</span> - Giờ/<span class="text-primary">Time</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column">Theo Dõi Diễn Tiến / <span class="text-primary">Patient's Condition</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Scope="Column">Ký/Ghi Tên ĐD / <span class="text-primary">Signature & RN's Name</span></asp:TableHeaderCell>
                                                        <asp:TableHeaderCell Width="38px" Scope="Column"></asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-actions mb-3">
                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                    <asp:Button ID="btnDelete" data-target="#exampleModalCenter" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-danger" runat="server" Text="Delete" />

                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                    <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClick="btnPrint_Click" Text="Print" />

                                    <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                </div>

                                <asp:UpdatePanel ID="updatePanelDeleteReason" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Delete document</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p runat="server">Please provide reason for deletion</p>
                                                        <div class="form-group mb-2">
                                                            <Input:TextField runat="server" ID="TextField1" />
                                                        </div>
                                                        <div id="Div1" class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button onserverclick="btnDelete_Click" class="btn btn-danger" runat="server">Delete</button>
                                                        <button id="btnClose" data-dismiss="modal" class="btn btn-secondary">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

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

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>

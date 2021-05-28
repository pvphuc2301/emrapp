<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerTriaAndNurAssRec.aspx.cs" Inherits="EMR.EmergencyTriageAndNursingAssessmentRecord" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/icons/PlusCircle.ascx" TagPrefix="Icon" TagName="PlusCircle" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="trash" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/Checkbox/Checkbox.ascx" TagPrefix="webUI" TagName="Checkbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

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
                <%--<asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                <asp:Panel runat="server" ID="Panel1">
                    <aih:AmendReason runat="server" ID="txt_amendReason" />
                </asp:Panel>

                <uc1:PatientInfo runat="server" ID="PatientInfo" />

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="text-primary">Emergency Triage And Nursing Assessment Record</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body">

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1 mr-2">
                                                <span class="text-primary">Triage Date Time <span class="text-danger">*</span></span>
                                            </label>
                                            <div class="form-group d-inline-block">
                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_triage_time" Width="200px" />
                                                <span class="text-danger" id="dtpk_triage_time_error"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2">Khu vực/ <span class="text-primary">Triage Area #:</span></label>
                                            <div class="form-group d-inline-block w-n">
                                                <webUI:TextField runat="server" ID="txt_triage_area" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Than phiền chính/ <span class="text-primary">Chief complaint:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_triage_code_1" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_triage_code_1">1-Hồi sức/ <span class="text-primary">Resuscitation</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_triage_code_2" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_triage_code_2">Cấp cứu/ <span class="text-primary">Emergency</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_triage_code_3" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_triage_code_3">Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_triage_code_4" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_triage_code_4">Trì hoãn/ <span class="text-primary">Less Urgent</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_triage_code_5" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_triage_code_5">Không cấp cứu/ <span class="text-primary">Non-Urgent</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare1" />
                                                </a>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">Đến khoa bằng/ <span class="text-primary">Mode of arrival:</span></label>
                                        </legend>
                                        <div class="col-md-12">
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
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_arrival_mode_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare2" />
                                                </a>
                                            </div>

                                        </div>
                                    </fieldset>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Tiền căn/ <span class="text-primary">Past Medical History:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_past_medical_history" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Quá trình bệnh lý/ <span class="text-primary">Narrative:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_narrative" />
                                            </div>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">Vital signs</span></label>
                                        </legend>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input id="txt_vs_temperature" maxlength="3" runat="server" class="form-control text-right" data-type="number" />
                                                <span class="append">°C</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                            <div class="form-group w-5 d-inline-block">
                                                <input id="txt_vs_heart_rate" maxlength="3" runat="server" class="form-control text-right" data-type="number" />
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input id="txt_vs_weight" maxlength="3" runat="server" class="form-control text-right" data-type="number" />
                                                <span class="append">Kg</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                            <div class="form-group w-5 d-inline-block">
                                                <input id="txt_vs_respiratory_rate" runat="server" class="form-control text-right" maxlength="3" data-type="number" />
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input id="txt_vs_height" maxlength="3" runat="server" class="form-control text-right" data-type="number" />
                                                <span class="append">cm</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                            <div class="form-group w-5 d-inline-block">
                                                <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" maxlength="3" data-type="number" />
                                                <span class="append">mmHg</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label for="bmi" class="control-label w-6 mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input id="txt_vs_bmi" runat="server" class="form-control text-right" disabled="disabled" />
                                                <span class="append">(Kg/m <sup>2</sup>)</span>
                                                <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                    <script type="text/javascript">
                                                        document.getElementById("txt_vs_height").addEventListener("change", function (e) {
                                                            document.getElementById("txt_vs_bmi").value = CalculateBmi();
                                                        });

                                                        document.getElementById("txt_vs_weight").addEventListener("change", function (e) {
                                                            document.getElementById("txt_vs_bmi").value = CalculateBmi();
                                                        });

                                                        function CalculateBmi() {
                                                            if (document.getElementById("txt_vs_height").value == "" || document.getElementById("txt_vs_weight").value == "") return "";
                                                            else {
                                                                return (document.getElementById("txt_vs_weight").value / ((document.getElementById("txt_vs_height").value / 100) * 2)).toFixed(2);
                                                            }
                                                        }
                                                    </script>
                                                </telerik:RadScriptBlock>
                                            </div>
                                            <p class="mt-1">(Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)</p>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input id="txt_vs_spo2" runat="server" class="form-control text-right" data-type="number" maxlength="3" />
                                                <span class="append">%</span>
                                            </div>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input maxlength="3" id="txt_vs_head_circum" runat="server" class="form-control text-right" data-type="number" />
                                                <span class="append">cm</span>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-1">Tri giác/ <span class="text-primary">LOC - AVPU</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2">
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
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-1">Đánh giá đau/ <span class="text-primary">Pain assess:</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1 mr-2">Điểm đau/ <span class="text-primary">Pain score:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input runat="server" maxlength="2" class="form-control d-inline-block w-4" id="txt_pain_score" data-type="number" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Khởi phát/ <span class="text-primary">Onset:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_pain_onset" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Vị trí/ <span class="text-primary">Location:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_pain_location" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Kéo dài/ <span class="text-primary">Duration:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_pain_duration" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Hướng lan/ <span class="text-primary">Radiation:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_pain_radiation" />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <img src="../images/pain_score.png" style="max-width: 720px; width: 100%;" alt="" />
                                        </div>
                                    </fieldset>

                                    <div class="row">
                                        <div class="col-md-12 mb-2">
                                            <label for="pain-scale" class="control-label mb-1">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_allergy" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <label class="control-label mb-1">Thuốc đã dùng/ <span class="text-primary">Medications used:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_current_medication" />
                                            </div>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Đánh giá loét/ <span class="text-primary">Skin Integrity</span></label>
                                        </legend>

                                        <div class="d-inline-block mr-2">
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
                                            <telerik:RadAjaxPanel runat="server">
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
                                            </telerik:RadAjaxPanel>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-1">Tầm soát bệnh lây nhiễm/ <span class="text-primary">Communicable disease screening</span></label>
                                        </legend>

                                        <div class="col-md-12">
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

                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-1">Kế hoạch xuất viện/ <span class="text-primary">Discharge Planning</span></label>
                                        </legend>
                                        <div class="col-md-12">
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
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-1">Nơi cư trú sau khi xuất viện/ <span class="text-primary">Disposition after discharge:</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2">
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" runat="server" id="rad_dis_after_discharge_code_h" name="rad_dis_after_discharge_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_dis_after_discharge_code_h">Nhà riêng/ <span class="text-primary">Private home</span></label>
                                            </div>

                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" runat="server" id="rad_dis_after_discharge_code_o" name="rad_dis_after_discharge_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_dis_after_discharge_code_o">Cơ sở y tế khác/ <span class="text-primary">Other healthcare facility:</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_dis_after_discharge_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare" />
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2">Người chăm sóc sau khi xuất viện <span class="text-primary">People who will look after patient after discharge:</span></label>
                                            <div class="form-group d-inline-block">
                                                <webUI:TextField runat="server" ID="txt_caregiver_after_discharge" />
                                            </div>
                                        </div>

                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">TRỞ NGẠI TRONG CHĂM SÓC/ <span class="text-primary">BARRIER TO CARE</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2">1. Trở ngại về ngôn ngữ/ <span class="text-primary">Language Barriers:</span></label>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_btc_language1" name="rad_btc_language" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_language1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input disabled-for="btc_language_note_field" type="radio" id="rad_btc_language2" name="rad_btc_language" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_language2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_btc_language" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" />
                                                </a>
                                            </div>
                                            <div class="form-group btc_language_note_field d-inline-block">
                                                <webUI:TextField runat="server" ID="txt_btc_language_note" />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2">2. Trở ngại về nhận thức/ <span class="text-primary">Cognitive Barriers:</span></label>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_btc_cognitive1" name="rad_btc_cognitive" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_cognitive1">Không/ <span class="text-primary">No</span></label>
                                            </div>

                                            <div class="custom-control custom-radio  d-inline-block mr-2">
                                                <input disabled-for="btc_cognitive_field" type="radio" id="rad_btc_cognitive2" name="rad_btc_cognitive" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_cognitive2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                <a href="javascript:void(0)" style="display: none;" data-clear="rad_btc_cognitive" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" />
                                                </a>
                                            </div>
                                            <div class="form-group btc_cognitive_field d-inline-block">
                                                <webUI:TextField runat="server" ID="txt_btc_cognitive_note" />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2">3. Trở ngại về Giác quan/ <span class="text-primary">Sensory Barriers:</span></label>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_btc_sensory1" name="rad_btc_sensory" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_sensory1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input disabled-for="btc_sensory_field" type="radio" id="rad_btc_sensory2" name="rad_btc_sensory" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_sensory2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                <a href="javascript:void(0)" style="display: none;" data-clear="rad_btc_sensory" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" />
                                                </a>
                                            </div>
                                            <div class="form-group btc_sensory_field d-inline-block">
                                                <webUI:TextField runat="server" ID="txt_btc_sensory_note" />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2">4. Trở ngại về Tôn giáo/ <span class="text-primary">Religious Barriers:</span></label>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_btc_religious1" name="rad_btc_religious" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_religious1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input disabled-for="btc_religious_field" type="radio" id="rad_btc_religious2" name="rad_btc_religious" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_religious2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                <a href="javascript:void(0)" style="display: none;" data-clear="rad_btc_religious" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" />
                                                </a>
                                            </div>
                                            <div class="form-group btc_religious_field d-inline-block">
                                                <webUI:TextField runat="server" ID="txt_btc_religious_note" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2">5. Trở ngại về Văn hóa/ <span class="text-primary">Cultural Barriers:</span></label>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_btc_cultural1" name="rad_btc_cultural" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_cultural1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input disabled-for="btc_cultural_field" type="radio" id="rad_btc_cultural2" name="rad_btc_cultural" class="custom-control-input" runat="server" />
                                                <label class="custom-control-label" for="rad_btc_cultural2">Có, Giải thích/ <span class="text-primary">Yes, Explain:</span></label>
                                                <a href="javascript:void(0)" style="display: none;" data-clear="rad_btc_cultural" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" />
                                                </a>
                                            </div>
                                            <div class="form-group btc_cultural_field d-inline-block">
                                                <webUI:TextField runat="server" ID="txt_btc_cultural_note" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">ĐÁNH GIÁ THỂ CHẤT CÁC CƠ QUAN/ <span class="text-primary">ASSESSMENT BY SYSTEM:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Tổng trạng chung/ <span class="text-primary">General appearance:</span></label>
                                                </legend>
                                                <div class="col-md-12">
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
                                            </fieldset>
                                        </div>

                                        <div class="col-md-12">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-1">Thần kinh/ <span class="text-primary">Neuro:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label mb-1 mr-2"><span class="text-primary">Glasgow coma scale/ GCS</span></label>
                                                    <div class="d-inline-block">
                                                        <label class="control-label mr-2">Mắt/ <span class="text-primary">E</span></label>
                                                        <div class="form-group w-4 d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_eye" />
                                                        </div>
                                                    </div>
                                                    <div class="d-inline-block">
                                                        <label class="control-label mr-2">Lời nói/ <span class="text-primary">V</span></label>
                                                        <div class="form-group w-4 d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_voice" />
                                                        </div>
                                                    </div>
                                                    <div class="d-inline-block">
                                                        <label class="control-label mr-2">Vận động/ <span class="text-primary">M</span></label>
                                                        <div class="form-group w-4 d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_motion" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_alert" />
                                                        <span class="custom-control-label">Tỉnh táo/ <span class="text-primary">Alert</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_coma" />
                                                        <span class="custom-control-label">Hôn mê/ <span class="text-primary">Coma</span></span>
                                                    </label>
                                                    <div class="d-inline-block">
                                                        <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                            <input disabled-for="str_others_field" type="checkbox" class="custom-control-input" id="cb_others" runat="server" />
                                                            <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                        </label>
                                                        <div class="form-group str_others_field d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_str_others" />
                                                        </div>
                                                    </div>
                                                </div>


                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Hô hấp/ <span class="text-primary">Respiratory:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_reg" />
                                                        <span class="custom-control-label">Thở đều/ <span class="text-primary">Regular</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox  d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_nre" />
                                                        <span class="custom-control-label">Thở không đều/ <span class="text-primary">Inregular</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox  d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_tac" />
                                                        <span class="custom-control-label">Thở nhanh/ <span class="text-primary">Tachypneic</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox  d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_sha" />
                                                        <span class="custom-control-label">Thở nông/ <span class="text-primary">Shallow</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox  d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_lab" />
                                                        <span class="custom-control-label">Thở gắng sức/ <span class="text-primary">Labored</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox  d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" id="cb_respiratory_ret" runat="server" />
                                                        <span class="custom-control-label">Co kéo/ <span class="text-primary">Retractions</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox  d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_cou" />
                                                        <span class="custom-control-label">Ho/ <span class="text-primary">Cough</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox  d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_spu" />
                                                        <span class="custom-control-label">Có đàm/ <span class="text-primary">Sputum</span></span>
                                                    </label>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input disabled-for="respiratory_oth_field" id="cb_respiratory_oth" type="checkbox" runat="server" class="custom-control-input" />
                                                        <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                    </label>

                                                    <div class="form-group respiratory_oth_field d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_respiratory_oth" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Tim mạch/ <span class="text-primary">Cardiovascular:</span></label>
                                                </legend>

                                                <div class="col-md-12">
                                                    <label class="control-label mr-2 ">Nhịp tim/ <span class="text-primary">Rhythm:</span></label>
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_rhythm_regular" />
                                                        <span class="custom-control-label">Đều/ <span class="text-primary">Regular</span></span>
                                                    </label>
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_rhythm_inregular" />
                                                        <span class="custom-control-label">Không đều/ <span class="text-primary">Inregular</span></span>
                                                    </label>
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input disabled-for="rhythm_field" type="checkbox" class="custom-control-input" runat="server" id="cb_rhythm_others" />
                                                        <span class="custom-control-label">Khác/ <span class="text-primary">Others:</span></span>
                                                    </label>

                                                    <div class="form-group rhythm_field d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_rhythm_str_others" />
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Tâm lý/ <span class="text-primary">Psychosocial:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_psychosocial" />
                                                        <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                    </label>
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input disabled-for="psychosocial_str_others_field" type="checkbox" class="custom-control-input" runat="server" id="cb_psychosocial_others" />
                                                        <span class="custom-control-label">Khác/ <span class="text-primary">Others</span></span>
                                                    </label>

                                                    <div class="form-group psychosocial_str_others_field d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_psychosocial_str_others" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-1">Các cơ quan khác/ <span class="text-primary">Other systems:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_other_systems_normal" />
                                                        <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                    </label>
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input disabled-for="other_systems_field" type="checkbox" class="custom-control-input" runat="server" id="cb_other_systems_abnormal" />
                                                        <span class="custom-control-label">Khác/ <span class="text-primary">Others</span></span>
                                                    </label>

                                                    <div class="form-group other_systems_field d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_others_systems_str" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label d-block">Sản-phụ</label>
                                                </legend>
                                                <div class="col-md-12 mb-2">
                                                    <label class="custom-control mb-1 custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_lmp" />
                                                        <span class="custom-control-label">Kinh cuối/ <span class="text-primary">LMP</span></span>
                                                    </label>

                                                    <div class="form-group w-n d-inline-block ">
                                                        <webUI:TextField runat="server" ID="txt_lmP_note" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="d-inline-block mr-2">
                                                        <label class="control-label mr-2">Tiền sử thai nghén/ <span class="text-primary">Gravida/PARA:</span></label>
                                                        <div class="form-group d-inline-block w-n">
                                                            <webUI:TextField runat="server" ID="txt_para" />
                                                        </div>
                                                    </div>

                                                    <div class="d-inline-block">
                                                        <label class="control-label d-inline-block mr-2">Sẩy/ <span class="text-primary">Abortions:</span></label>
                                                        <div class="form-group d-inline-block w-n">
                                                            <webUI:TextField runat="server" ID="txt_abortions" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </fieldset>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <table class="table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">
                                                            <div class="p-2" style="width: 300px;">Thủ thuật can thiệp/ <span class="text-primary">Intervention Procedure</span></div>
                                                        </th>
                                                        <th scope="col">
                                                            <div class="p-2">Thời gian/ <span class="text-primary">Time</span></div>
                                                        </th>
                                                        <th scope="col">
                                                            <div class="p-2" style="width: 300px;">Ghi chú/ <span class="text-primary">Notes</span></div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div>ĐHMM/Capillary Blood glucose </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_blood_glucose_date_time" Width="200px" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <webUI:TextField runat="server" ID="txt_blood_glucose_note" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Điện tim/ECG
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_ecg_date_time" Width="200px" />
                                                            </div>
                                                        </td>
                                                        <td data-label="Ghi chú/ Notes">
                                                            <webUI:TextField runat="server" ID="txt_ecg_note" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Thông tiểu/Urine cath
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_urine_cath_date_time" Width="200px" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <webUI:TextField runat="server" ID="txt_urine_cath_note" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nẹp/Bó bột/Thay băng Splint/Cast/Dressing
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_splint_cast_dressing_date_time" Width="200px" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <webUI:TextField runat="server" ID="txt_splint_cast_dressing_note" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Khác/Others
                                                        </td>
                                                        <td data-label="Thời gian/ Time">
                                                            <div class="form-group">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_procedure_other_date_time" Width="200px" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <webUI:TextField runat="server" ID="txt_procedure_other_note" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="updatePanel_AssessmentSystem" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView
                                                        ShowHeaderWhenEmpty="true"
                                                        ID="grid_AssessmentSystem"
                                                        runat="server"
                                                        OnRowDeleting="grid_AssessmentSystem_RowDeleting"
                                                        OnRowUpdating="gridAssessmentSystem_RowUpdating"
                                                        OnRowDataBound="gridAssessmentSystem_RowDataBound"
                                                        CssClass="table-responsive"
                                                        AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 105px" class="text-primary pt-2 pb-2">Time</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadTimePicker Width="105px" ID="time" SelectedTime='<%# TimeSpan.Parse(Eval("time").ToString()) %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">RR (l/p)</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("rrlp") %>' DataKey="rrlp" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    O2Sat (%)</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("o2sat") %>' DataKey="o2sat" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    HR (bpm)</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("hr") %>' DataKey="hr" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    BP (mmhg)</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("bp") %>' DataKey="bp" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    Temp (0C)</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("temp") %>' DataKey="temp" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    GCS</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("gcs") %>' DataKey="gcs" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    Pain/ 10</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("pain") %>' DataKey="pain" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    ATS scale</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("ats") %>' DataKey="ats" runat="server" />
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
                                                                    <webUI:TextField Title='<%#Eval("intervention") %>' DataKey="intervention" Value='<%#Eval("intervention") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 200px" class="text-primary">RN's Initial</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("initial") %>' DataKey="initial" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="updateProgress_AssessmentSystem" runat="server" AssociatedUpdatePanelID="updatePanel_AssessmentSystem">
                                                        <ProgressTemplate>
                                                            Please wait....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:Button ID="btn_grid_AssessmentSystem_add" runat="server" CssClass="btn btn-sm btn-outline-primary" OnClick="btn_grid_AssessmentSystem_add_Click" Text="Add row" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_grid_AssessmentSystem_add" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Y lệnh thuốc & dịch truyền trực tiếp/ <span class="text-primary">Direct Medication & IV fluids Order</span></label>
                                            <asp:UpdatePanel ID="UpdatePanelDirectMedication" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView
                                                        ShowHeaderWhenEmpty="true"
                                                        ID="gridDirectMedication"
                                                        runat="server"
                                                        OnRowDeleting="gridDirectMedication_RowDeleting"
                                                        OnRowUpdating="gridAssessmentSystem_RowUpdating"
                                                        OnRowDataBound="gridAssessmentSystem_RowDataBound"
                                                        CssClass="table-responsive"
                                                        AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 105px" class="pt-2 pb-2">Thời gian/ <span class="text-primary">Time</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadTimePicker ID="dir_med_time" SelectedTime='<%# TimeSpan.Parse(Eval("dir_med_time").ToString()) %>' Width="105px" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 238px">Thuốc/ <span class="text-primary">Medication</span> - Dịch truyền/ <span class="text-primary">IV Fluids</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("dir_medication") %>' DataKey="dir_medication" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 100px">Liều dùng/ <span class="text-primary">Dose</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("dir_med_dose") %>' DataKey="dir_med_dose" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 114px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("dir_med_route") %>' DataKey="dir_med_route" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 100px">Tốc độ/ <span class="text-primary">Rate</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("dir_med_rate") %>' DataKey="dir_med_rate" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 150px">Bác sĩ/ <span class="text-primary">Doctor</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("dir_med_doctor") %>' DataKey="dir_med_doctor" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 150px">Ghi chú/ <span class="text-primary">Comment</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("dir_med_comment") %>' DataKey="dir_med_comment" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div>Thời gian/ <span class="text-primary">Time</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadTimePicker ID="dir_med_time2" SelectedTime='<%# TimeSpan.Parse(Eval("dir_med_time2").ToString()) %>' Width="105px" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 150px">Điều dưỡng/ <span class="text-primary">RN's Initial</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("dir_med_initial") %>' DataKey="dir_med_initial" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="UpdateProgressDirectMedication" runat="server" AssociatedUpdatePanelID="UpdatePanelDirectMedication">
                                                        <ProgressTemplate>
                                                            Please wait....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:Button ID="btn_gridDirectMedication_add" runat="server" CssClass="btn btn-sm btn-outline-primary" OnClick="btn_gridDirectMedication_add_Click" Text="Add Row" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_gridDirectMedication_add" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Xuất viện/ <span class="text-primary">Discharged</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="d-inline-block mr-2">
                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_discharge_date_time" Width="200px" />

                                            </div>
                                            <div class="d-inline-block mr-2">
                                                <label class="control-label d-inline-block mr-2">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                <div class="form-group w-n d-inline-block mr-2">
                                                    <webUI:TextField runat="server" ID="txt_discharge_by" />
                                                </div>
                                            </div>
                                            <div class="d-inline-block">
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

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Nhập viện/ <span class="text-primary">Admited</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="d-inline-block mr-2">
                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_admited_date_time" Width="200px" />
                                            </div>

                                            <div class="d-inline-block mr-2">
                                                <label class="control-label mr-2">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                <div class="form-group w-n d-inline-block">
                                                    <webUI:TextField runat="server" ID="txt_admited_by" />
                                                </div>
                                            </div>
                                            <div class="d-inline-block">
                                                <label class="control-label mr-2">Khoa tiếp nhận/ <span class="text-primary">Receiving Unit</span></label>
                                                <div class="form-group w-n d-inline-block">
                                                    <webUI:TextField runat="server" ID="txt_receiving_unit" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Chuyển viện/ <span class="text-primary">Transfer to</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group d-inline-block w-n mr-2">
                                                <webUI:TextField runat="server" ID="txt_transfer_to" />
                                            </div>
                                            <div class="col-md-6 d-inline-block">
                                                <label class="control-label mr-2">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                <div class="form-group w-n d-inline-block">
                                                    <webUI:TextField runat="server" ID="txt_transfer_by" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Giờ thông báo Bác sĩ/ <span class="text-primary">Time notified to Doctor</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <telerik:RadDateTimePicker runat="server" ID="dtpk_noticed_time" Width="200px" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">PHIẾU GHI CHÚ ĐIỀU DƯỠNG/ <span class="text-primary">NURSING NOTES</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="updatePanel_NursingNotes" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView
                                                        ShowHeaderWhenEmpty="true"
                                                        ID="grid_NursingNotes"
                                                        runat="server"
                                                        OnRowDeleting="grid_NursingNotes_RowDeleting"
                                                        OnRowUpdating="gridAssessmentSystem_RowUpdating"
                                                        OnRowDataBound="gridAssessmentSystem_RowDataBound"
                                                        CssClass="tb-responsive"
                                                        AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 105px" class="pt-2 pb-2">Ngày/ <span class="text-primary">Date</span> - Giờ/ <span class="text-primary">Time</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <div class="form-group">
                                                                        <telerik:RadDateTimePicker ID="date_time" SelectedDate='<%#Eval("date_time") %>' Width="200px" runat="server" />
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px">Theo dõi diễn tiến/ <span class="text-primary">Patient's condition</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("patient_condition") %>' DataKey="patient_condition" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px">Ký/Ghi tên ĐD/ <span class="text-primary">Signature & RN's name</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("signature_name") %>' DataKey="signature_name" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />

                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="updateProgress_NursingNotes" runat="server" AssociatedUpdatePanelID="updatePanel_NursingNotes">
                                                        <ProgressTemplate>
                                                            Please wait....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:Button ID="btn_grid_NursingNotes_add" runat="server" CssClass="btn btn-sm btn-outline-primary" OnClick="btn_grid_NursingNotes_add_Click" Text="Add row" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_grid_NursingNotes_add" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row">
                                        <div class="col-md-12">
                                            <div class="form-actions">
                                                <asp:Button ID="btnComplete" class="btn btn-primary" runat="server" Text="Complete" />
                                                <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                <asp:Button ID="btnAmend" class="btn btn-secondary" runat="server" Text="Amend" />
                                                <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                <div runat="server" id="messagePlaceHolder"></div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                        <ModalBody>
                                            <div class="text-center">
                                                <icon:ExclamationTriangle cssClass="text-danger" Width="80" Height="80" runat="server" />
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
                </div>
                <%--</ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    
                </Triggers>
            </asp:UpdatePanel>--%>
            </div>
        </form>
    </div>

    <script src="../../scripts/popper.min.js"></script>
    <script src="../../scripts/jquery-3.2.1.min.js">script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>


    <%--<script>
        let errors = document.getElementById("RequiredFieldValidator");
        
        errors = JSON.parse(errors.value);
        
        errors.forEach(e => {
            document.getElementById(`${e}_error`).classList.add("required-field");
        })

        let temp = document.querySelectorAll(".required");


        temp.forEach(e => {
            console.log(e);

            e.required = true;
        });
    </script>--%>

    <script>
        function setInputFilter(textbox, inputFilter) {
            ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function (event) {
                textbox.addEventListener(event, function () {
                    if (inputFilter(this.value)) {
                        this.oldValue = this.value;
                        this.oldSelectionStart = this.selectionStart;
                        this.oldSelectionEnd = this.selectionEnd;
                    } else if (this.hasOwnProperty("oldValue")) {
                        this.value = this.oldValue;
                        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                    } else {
                        this.value = "";
                    }
                });
            });
        }

        //function setInputFilter(textbox, inputFilter) {
        //    ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function (event) {
        //        textbox.addEventListener(event, function () {
        //            if (inputFilter(this.innerText)) {
        //                this.oldValue = this.innerHTML;
        //                this.oldSelectionStart = this.selectionStart;
        //                this.oldSelectionEnd = this.selectionEnd;
        //            } else if (this.hasOwnProperty("oldValue")) {
        //                this.innerHTML = this.oldValue;

        //                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        //            } else {
        //                this.innerHTML = "";
        //            }
        //        });
        //    });
        //}


        let temp = document.querySelectorAll('div[type="number"]');
        let temp1 = document.querySelectorAll('input[data-type="number"]');

        //document.querySelectorAll('div[type="number"]')[0].addEventListener("input", function () {
        //    if (inputFilter(this.value)) {
        //        this.oldValue = this.value;
        //        this.oldSelectionStart = this.selectionStart;
        //        this.oldSelectionEnd = this.selectionEnd;
        //    } else if (this.hasOwnProperty("oldValue")) {
        //        this.value = this.oldValue;
        //        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        //    } else {
        //        this.value = "";
        //    }
        //});

        //$(document).ready(function () {
        //    console.log("ready!");
        //    $('#testtooltip').tooltip().eq(0).tooltip('show').tooltip('disable').one('mouseout', function () {
        //        $(this).tooltip('enable');
        //    });
        //});

        //setInputFilter(document.querySelectorAll('div[type="number"]')[0], function (value) {
        //    return /^-?\d*$/.test(value);
        //});



        temp1.forEach(e => {

            setInputFilter(e, function (value) {
                return /^\d*\.?\d*$/.test(value);
            });

        })

    </script>
</body>
</html>

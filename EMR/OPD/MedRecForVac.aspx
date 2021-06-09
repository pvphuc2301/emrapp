<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedRecForVac.aspx.cs" Inherits="EMR.OPD.MedRecForVac" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
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

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
        .prt-line-solid {
            border-bottom: 1px solid #000;
        }

        .cssclsNoScreen table.table-fixed {
            table-layout: fixed;
            width: 100%
        }

        .cssclsNoScreen table tr td {
            padding: 4px 8px;
        }
    </style>
</head>
<body>
    <%--class="cssclsNoScreen"--%>
    <div class="cssclsNoScreen">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info">
                            <img src="../images/AIH_PI_FULL.png" />
                            <div class="header-info-title">
                                <h4>BỆNH ÁN TIÊM CHỦNG</h4>
                                <h5>MEDICAL RECORD FOR VACCINATION</h5>
                                <div style="font-size: 12px" class="text-primary">
                                    ( Áp dụng cho các đối tượng ≥1 tháng tuổi/ For person ≥ 1 month old)
                                </div>
                            </div>
                            <webUI:PatientLabel1 runat="server" ID="prt_patient_label" />
                        </div>
                        <webUI:Line runat="server" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main" runat="server" id="print_content">
                            <!-- Code printed here -->

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" FixedLeft="30" Title="Họ tên người bệnh" SubTitle="Full name:" runat="server" ID="prt_fullname" />

                            <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                <webUI:PrtRowS1 FontBold="true" FixedLeft="30" CssClass="text-inline" Title="Ngày tháng năm sinh/ " SubTitle="DOB:" runat="server" ID="prt_dob" />
                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Giới tính/ " SubTitle="Gender:" runat="server" ID="prt_gender" />
                            </div>

                            <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                <webUI:PrtRowS1 FontBold="true" FixedLeft="30" CssClass="text-inline" Title="Ngày khám bệnh/ " SubTitle="Day of visit:" runat="server" ID="prt_day_of_visit" />
                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Mã số người bệnh/ " SubTitle="PID:" runat="server" ID="prt_pid" />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="I." Title="Lý do đến khám/ " SubTitle="Chief complaint:" runat="server" ID="prt_chief_complaint" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="II." Title="Bệnh sử/ " SubTitle="Medical history" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="1." Title="Bệnh sử hiện tại/ " SubTitle="Current medical history:" runat="server" ID="prt_cur_med_history" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="❖" Title="Thuốc đang sử dụng/ " SubTitle="Current medications" runat="server" ID="prt_cur_medications" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="2." Title="Tiền sử bệnh/ " SubTitle="Antecedent medical history:" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="❖" Title="Bản thân/ " SubTitle="Personal:" runat="server" ID="prt_personal" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="❖" Title="Gia đình/ " SubTitle="Family:" runat="server" ID="prt_family" />

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="❖" Title="Dị ứng/ " SubTitle="Allergy:" runat="server" />
                                <webUI:PrtRowS2 runat="server" ID="prt_allergy" Gap="20" />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" Order="•" CssClass="text-inline" Title="Nếu có, nêu rõ/ " SubTitle="If yes, specify:" runat="server" ID="prt_allergy_note" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="III." Title="Khám bệnh:" SubTitle="Physical examination" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="•" Title="Dấu hiệu sinh tồn/ " SubTitle="Vital signs" runat="server" />

                            <table class="table-bordered table-fixed">
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

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="•" Title="Khám sàng lọc trước tiêm chủng/ " SubTitle="Screening before vaccination:" runat="server" />

                            <webUI:PrtRowS1 CssClass="text-inline" Order="1." Title="Sốc, phản ứng nặng sau lần tiêm chủng trước/ " SubTitle="Shock, severe reaction after previous vaccination:" runat="server" ID="prt_scr_before_vacc_1" />

                            <webUI:PrtRowS1 Order="2." Title="Đang mắc bệnh cấp tính hoặc bệnh mạn tính tiến triển/ <span class='text-primary'>Are suffering from an acute or progressive chronic disease</span>:" runat="server" ID="prt_scr_before_vacc_2" />

                            <webUI:PrtRowS1 Order="3." Title="Đang hoặc mới kết thúc đợt điều trị corticoid liều cao (prednison > 2mg/kg/ngày), hóa trị, xạ trị, dùng gammaglobulin/ <span class='text-primary'>At or just after a high-dose corticosteroid treatment (prednison > 2mg / kg / day), chemotherapy, radiationand gammaglobulin:</span>" runat="server" ID="prt_scr_before_vacc_3" />

                            <webUI:PrtRowS1 Order="4." Title="Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 38°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class='text-primary'>Fever / Hypothermia (Fever:temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span>" runat="server" ID="prt_scr_before_vacc_4" />

                            <webUI:PrtRowS1 CssClass="text-inline" Order="5." Title="Nghe tim bất thường/ " SubTitle="Hearing abnormalities:" runat="server" ID="prt_scr_before_vacc_5" />

                            <webUI:PrtRowS1 CssClass="text-inline" Order="6." Title="Nhịp thở, nghe phổi bất thường/ " SubTitle="Abnormal breathing, pulmonary listening: " runat="server" ID="prt_scr_before_vacc_6" />

                            <webUI:PrtRowS1 CssClass="text-inline" Order="7." Title="Tri giác bất thường (li bì hoặc kích thích)/ " SubTitle="Abnormal perception (li or stimulation):" runat="server" ID="prt_scr_before_vacc_7" />

                            <webUI:PrtRowS1 CssClass="text-inline" Order="8." Title="Các chống chỉ định khác, nếu có ghi rõ/ " SubTitle="Other contraindications, if yes specified" runat="server" ID="prt_scr_before_vacc_8" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="IV." Title="Chỉ định và kết quả xét nghiệm/ " SubTitle="Laboratory indications and results" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="•" Title="Loại vắc xin tiêm chủng lần này/ " SubTitle="Appointed vaccine" runat="server" />

                            <table runat="server" id="prt_appointed_vaccine" class="table-bordered" style="table-layout: fixed; width: 100%; page-break-inside: avoid !important;">
                                <tr>
                                    <td data-field="drug_name" class="text-center" style="width: 230px"><span class="font-bold">Tên vaccin</span>
                                        <div class="text-primary">Drug names</div>
                                    </td>
                                    <td data-field="strength" class="text-center" style="width: 120px" data-align="center"><span class="font-bold">Hàm lượng</span><div class="text-primary">Strength</div>
                                    </td>
                                    <td data-field="router" class="text-center" style="width: 120px" data-align="center"><span class="font-bold">Đường dùng</span><div class="text-primary">Route</div>
                                    </td>
                                    <td data-field="reason" class="text-center"><span class="font-bold">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do</span><div class="text-primary">Additional instruction/ PRN order with reason</div>
                                    </td>
                                </tr>
                            </table>


                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="•" Title="Khảo sát bổ sung khác/ " SubTitle="Additional investigations:" runat="server" ID="prt_additional_investigations" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="V" Title="Kết luận/ " SubTitle="Conclusion" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="●" Title="Chẩn đoán ban đầu/ " SubTitle="Initial diagnosis:" runat="server" ID="prt_initial_diagnosis" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="●" Title="Chẩn đoán phân biệt/ " SubTitle="Differential diagnosis:" runat="server" ID="prt_differential_diagnosis" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="●" Title="Bệnh kèm theo/ " SubTitle="Associated conditions:" runat="server" ID="prt_associated_conditions" />

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FontBold="true" Order="●" Title="Điều trị/ " SubTitle="Treatment" runat="server" />
                                <webUI:PrtRowS2 ID="prt_treatment" runat="server" Gap="10" />
                            </div>

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FontBold="true" Order="❖" Title="Yêu cầu ý kiến chuyên khoa/ " SubTitle="Specialized opinion requested:" runat="server" />
                                <webUI:PrtRowS2 ID="prt_spec_opinion_req" runat="server" Gap="10" />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="●" Title="Nếu có, nêu rõ/ " SubTitle="If yes, specify:" runat="server" ID="prt_spec_opinion_req_text" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="●" Title="Hướng dẫn cụ thể dành cho bệnh nhân/ " SubTitle="Specific education required" runat="server" />

                            <webUI:PrtRowS1 FixedLeft="30" CssClass="text-inline" ID="prt_specific_edu_req" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="●" Title="Hẹn lần khám tới/ " SubTitle="Next appointment:" ID="prt_next_appointment" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="VI." Title="Xác nhận của người tiêm chủng/ người giám hộ hợp pháp/ " SubTitle="Confirmation of patient/ legal guardian" runat="server" />

                            <webUI:PrtRowS1 Order="●" Title="Tôi đã được nghe bác sĩ tư vấn và đồng ý tiêm chủng cho tôi/ người mà tôi làm giám hộ hợp pháp.Tôi đã kiểm tra đúng thuốc tiêm và thuốc còn thời hạn dùng." SubTitle="I have been consulted and agree on vaccination. I checked right medication and medication has still not expired." runat="server" />

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 Order="●" CssClass="text-inline" Title="Họ tên người tiêm chủng/ người giám hộ/ " SubTitle="Full name of patient/ guardian:" runat="server" />
                                <div class="prt-line-solid"></div>
                            </div>

                            <div class="d-grid mb-2" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 Order="●" CssClass="text-inline" Title="Chữ ký người tiêm chủng/ người giám hộ/ " SubTitle="Signature of patient/ guardian:" runat="server" />
                                <div class="prt-line-solid"></div>
                            </div>

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <div></div>
                                <webUI:Signature1 runat="server" ID="prt_signature1" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>

            <tfoot class="report-footer">
                <tr>
                    <td class="report-footer-cell">
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
        <form method="post" action="#" id="form1" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <%--<asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>

            <div class="scroll-sidebar h-100 w-100">
                <asp:HiddenField runat="server" ID="RequiredFieldValidator" />

                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <webUI:AmendReason runat="server" ID="txt_amendReason" />
                </asp:Panel>

                <uc1:PatientInfo runat="server" ID="PatientInfo" />

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <div>
                                    <h4 class="text-primary">MEDICAL RECORD FOR VACCINATION</h4>
                                    <div>( Áp dụng cho các đối tượng ≥1 tháng tuổi/ For person ≥ 1 month old)</div>
                                </div>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                            </div>
                            <div class="card-body">
                                <div class="form-body collapse show" id="collapseOne">
                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <label class="control-label mb-2 h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                            <div class="form-group">
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

                                        <div class="col-12 mb-2">
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label class="control-label mb-1 d-inline-block ">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_cur_medications" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_personal" />
                                            </div>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_family" />
                                            </div>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <label class="control-label mb-1 d-block">Dị ứng/ <span class="text-primary">Allergy:</span></label>

                                            <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                <input type="radio" id="rad_allergy_false" runat="server" name="rad_allergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_allergy_false">Không/<span class="text-primary">No</span></label>
                                            </div>

                                            <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                <input disabled-for="required_code_field" type="radio" id="rad_allergy_true" runat="server" name="rad_allergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                    <icon:XSquare runat="server" ID="XSquare2" />
                                                </a>
                                            </div>

                                            <div class="form-group txt_allergy_note mt-2">
                                                <webUI:TextField runat="server" ID="txt_allergy_note" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <div class="row">
                                        <div class="col-12">
                                            <label class="control-label h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                        </legend>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input readonly="true" runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                <span class="append">°C</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                            <div class="form-group w-5 d-inline-block">
                                                <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                <span class="append">Kg</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                            <div class="form-group w-5 d-inline-block">
                                                <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                <span class="append">cm</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                            <div class="form-group w-5 d-inline-block">
                                                <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                <span class="append">mmHg</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input runat="server" id="txt_vs_BMI" class="form-control text-right" disabled="disabled" />
                                                <span class="append">(Kg/m <sup>2</sup>)</span>
                                            </div>
                                            <p class="mt-1">
                                                (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)
                                            </p>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                <span class="append">%</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 mb-2">
                                            <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                            <div class="form-group w-4 d-inline-block">
                                                <input runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                <span class="append">cm</span>
                                            </div>
                                        </div>

                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Khám sàng lọc trước tiêm chủng/ <span class="text-primary">Screening before vaccination:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Sốc, phản ứng nặng sau lần tiêm chủng trước/ <span class="text-primary">Shock, severe reaction after previous vaccination:</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_1" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Đang mắc bệnh cấp tính hoặc bệnh mạn tính tiến triển/ <span class="text-primary">Are suffering from an acute or progressive chronic disease:</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_2" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Đang hoặc mới kết thúc đợt điều trị corticoid liều cao (prednison >2mg/kg/ngày), hóa trị, xạ trị, dùng gammaglobulin/ <span class="text-primary">At or just after a high-dose corticosteroid treatment (prednison> 2mg / kg / day), chemotherapy, radiation and gammaglobulin:</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_3" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">4. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 38°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ Fever/ <span class="text-primary">Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_4" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">5. Nghe tim bất thường/ <span class="text-primary">Hearing abnormalities:</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_5" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">6. Nhịp thở, nghe phổi bất thường/ <span class="text-primary">Abnormal breathing, pulmonary listening:</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_6" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">7. Tri giác bất thường (li bì hoặc kích thích)/ <span class="text-primary">Abnormal perception (li or stimulation):</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_7" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="col-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">8. Các chống chỉ định khác, nếu có ghi rõ/ <span class="text-primary">Other contraindications, if yes specified:</span></label>
                                                </legend>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_scr_before_vacc_8" />
                                                    </div>
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

                                        <div class="col-12">
                                            <asp:UpdatePanel ID="updatePanel_appointed_vaccine" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView ShowHeaderWhenEmpty="true"
                                                        ID="grid_appointed_vaccine" runat="server"
                                                        OnRowDeleting="grid_appointed_vaccine_RowDeleting"
                                                        CssClass="tb-responsive table-bordered"
                                                        AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("drug_name") %>' DataKey="drug_name" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("strength") %>' DataKey="strength" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("router") %>' DataKey="router" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField Value='<%#Eval("reason") %>' DataKey="reason" runat="server" />
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
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="updateProgress_appointed_vaccine" runat="server" AssociatedUpdatePanelID="updatePanel_appointed_vaccine">
                                                        <ProgressTemplate>
                                                            Please wait....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:Button ID="btn_grid_appointed_vaccine_add" runat="server" CssClass="btn btn-sm btn-outline-primary" OnClick="btn_grid_appointed_vaccine_add_Click" Text="Add row" />
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
                                        <div class="col-12">
                                            <div class="form-group">
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

                                        <div class="col-12 mb-2">
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
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
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                    <icon:XSquare runat="server" ID="XSquare1" />
                                                </a>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                <input type="radio" id="rad_spec_opinion_req_false" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_spec_opinion_req_false">Không/<span class="text-primary">No</span></label>
                                            </div>

                                            <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                <input disabled-for="spec_opinion_req_text_field" type="radio" id="rad_spec_opinion_req_true" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_spec_opinion_req_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_spec_opinion_req" onclick="clear_radiobutton(this)">
                                                    <icon:XSquare runat="server" ID="XSquare3" />
                                                </a>
                                            </div>

                                            <div class="form-group par spec_opinion_req_text_field mt-2">
                                                <webUI:TextField runat="server" ID="txt_spec_opinion_req_text" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <webUI:TextField runat="server" ID="txt_pecific_edu_req" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                        </legend>

                                        <div class="col-12 mb-2">
                                            <webUI:TextField runat="server" ID="txt_next_appointment" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <div class="form-actions">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                            <asp:Button OnClientClick="window.print()" ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                        </div>
                                    </fieldset>
                                </div>

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
            <%--                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    <asp:PostBackTrigger ControlID="btnComplete" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </form>
    </div>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>

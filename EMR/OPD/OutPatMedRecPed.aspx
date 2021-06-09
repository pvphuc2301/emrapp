﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatMedRecPed.aspx.cs" Inherits="EMR.PediatricOutpatientMedicalRecord" ValidateRequest="false" %>

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
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    <div class="cssclsNoScreen">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info">
                            <img src="../images/AIH_PI_FULL.png" />
                            <div class="header-info-title">
                                <h4>BỆNH ÁN NGOẠI TRÚ NHI</h4>
                                <h5>PEDIATRIC OUTPATIENT MEDICAL RECORD</h5>
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
                        <div class="main" runat="server" id="print_content">
                            <!-- Code printed here -->

                            <webUI:PrtRowS1 FixedLeft="30" Title="Ngày khám bệnh" SubTitle="Day of visit" runat="server" ID="prt_day_of_visit" />

                            <webUI:PrtRowS1 Order="I." FixedWidth="168" Title="Lý do đến khám:" SubTitle="Chief complaint" runat="server" ID="prt_chief_complaint" />

                            <webUI:PrtRowS1 Order="II." FixedWidth="168" Title="Bệnh sử:" SubTitle="Medical history" runat="server" />

                            <webUI:PrtRowS1 Order="1." FixedWidth="168" Title="Bệnh sử hiện tại:" SubTitle="Current Medical History" runat="server" ID="prt_medical_history" />

                            <webUI:PrtRowS1 Order="❖" FixedWidth="168" Title="Thuốc đang sử dụng:" SubTitle="Current medications" runat="server" ID="prt_current_medication" />

                            <webUI:PrtRowS1 Order="II." Title="Tiền sử bệnh:" SubTitle="Atencedent medical history" runat="server" />

                            <webUI:PrtRowS1 Order="❖" Title="Bản Thân:" SubTitle="Personal" runat="server" ID="prt_personal" />

                            <webUI:PrtRowS1 Order="❖" Title="Gia đình:" SubTitle="Family" runat="server" ID="prt_family" />

                            <webUI:PrtRowS2 Order="❖" Title="Dị ứng:" SubTitle="Allergy" runat="server" ID="prt_allergy" Gap="20" />

                            <webUI:PrtRowS1 Order="●" Title="Nếu có, nêu rõ:" SubTitle="If yes, specify" runat="server" ID="prt_allergy_note" />

                            <%--<webUI:PrtRowS1  Order="❖" FixedWidth="168" Title="Thuốc đang sử dụng:" SubTitle="Current medications"  runat="server" ID="prt_current_medication"  />--%>

                            <webUI:PrtRowS1 Order="IV." Title="Khám bệnh:" SubTitle="Physical examinations" runat="server" />

                            <webUI:PrtRowS1 CssClass="text-inline" Order="1." Title="Dấu hiệu sinh tồn/ " SubTitle="Vital signs:" runat="server" />

                            <table class="table-bordered" style="table-layout: fixed; width: 100%">
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

                            <webUI:PrtRowS1 CssClass="text-inline" Order="2." Title="Khám bệnh/ " SubTitle="Physical Examination:" runat="server" />

                            <webUI:PrtRowS1 CssClass="text-inline" FixedLeft="20" runat="server" ID="prt_physical_examination" />

                            <webUI:PrtRowS2 Order="❖" ID="prt_psy_consult_required" Title="Yêu cầu khám chuyên khoa tâm lý" SubTitle="Psychological consultation required:" runat="server" FixedWidth="280" Gap="40" />

                            <webUI:PrtRowS1 Order="V." Title="Chỉ định và kết quả xét nghiệm:" SubTitle="Laboratory indications and results" runat="server" />

                            <webUI:PrtRowS1 runat="server" ID="prt_laboratory_indications_results" FixedLeft="30" />



                            <webUI:PrtRowS1 Order="❖" Title="Khảo sát bổ sung khác:" SubTitle="Additional investigations" runat="server" ID="prt_additional_investigation" />

                            <webUI:PrtRowS1 Order="VI." Title="Kết luận:" SubTitle="Conclusion" runat="server" />

                            <webUI:PrtRowS1 Order="•" FixedWidth="185" Title="Chẩn đoán ban đầu:" SubTitle="Initial diagnosis" runat="server" ID="prt_initial_diagnosis" />

                            <webUI:PrtRowS1 Order="•" FixedWidth="185" Title="Chẩn đoán xác định:" SubTitle="Diagnosis" runat="server" ID="prt_diagnosis" />

                            <webUI:PrtRowS1 Order="•" FixedWidth="185" Title="Chẩn đoán phân biệt:" SubTitle="Differential diagnosis" runat="server" ID="prt_differential_diagnosis" />

                            <webUI:PrtRowS1 Order="•" FixedWidth="185" Title="Bệnh kèm theo:" SubTitle="Associated conditions" runat="server" ID="prt_associated_conditions" />

                            <webUI:PrtRowS2 Order="•" Title="Điều trị:" FixedWidth="80" SubTitle="Treatment" runat="server" ID="prt_treatment" Gap="35" />

                            <webUI:PrtRowS1 FixedLeft="30" Title="Điều trị:" FixedWidth="80" SubTitle="Treatment" runat="server" ID="prt_medicine" />


                            <webUI:PrtRowS2 Order="❖" FixedWidth="280" ID="prt_spec_opinion_requested" Title="Yêu cầu ý kiến chuyên khoa:" SubTitle="Specialized opinion requested" runat="server" Gap="40" />

                            <webUI:PrtRowS1 Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specif" runat="server" ID="prt_spec_opinion_requested_note" />

                            <webUI:PrtRowS1 Order="•" FixedWidth="187" Title="Hướng dẫn cụ thể dành cho bệnh nhân:" SubTitle="Specific education required" runat="server" ID="prt_specific_education_required" />

                            <webUI:PrtRowS1 Order="•" FixedWidth="187" Title="Hẹn lần khám tới:" SubTitle="Next Appointment" runat="server" ID="prt_next_appointment" />

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
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
            <asp:Panel runat="server" ID="messagePlaceHolder">
                <webUI:AmendReason runat="server" ID="txt_amendReason" />
            </asp:Panel>

            <webUI:PatientInfo runat="server" ID="PatientInfo1" />

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="text-primary">PEDIATRIC OUTPATIENT MEDICAL RECORD</h4>
                            <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                        </div>
                        <div class="card-body collapse show" id="collapseOne">
                            <div class="form-body">
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2 h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_chief_complaint" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2 h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                    </div>
                                </div>

                                <fieldset class="row mb-2">
                                    <legend>
                                        <label class="control-label">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                    </legend>
                                    <div class="col-md-12  mb-2">
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_medical_history" />
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="control-label">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>

                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_current_medication" />
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="row mb-2">
                                    <legend>
                                        <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                    </legend>
                                    <div class="col-md-12 mb-2">
                                        <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_personal" />
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-2">
                                        <label class="control-label">Gia đình/ <span class="text-primary">Family:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_family" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="control-label mb-2 d-block">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                        <div class="custom-control custom-radio ml-2 d-inline-block">
                                            <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                        <div class="custom-control custom-radio ml-2 d-inline-block">
                                            <input disabled-for="allergy_note_field" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                            <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                    <icon:XSquare runat="server" ID="XSquare1" />
                                                </a>
                                        </div>
                                        <div class="form-group allergy_note_field mt-1">
                                            <webUI:TextField runat="server" id="txt_allergy_note" />
                                        </div>
                                    </div>
                                </fieldset>


                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1 h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                        </div>
                                    </div>
                                </div>

                                <fieldset class="row mb-2">
                                    <legend>
                                        <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                    </legend>
                                    <div class="col-md-12">
                                        <div class="alert alert-warning d-flex no-block">
                                            <div class="flex-grow-1">
                                                <icon:ExclamationTriangle runat="server" ID="ExclamationTriangle" Size="28" />
                                                <span class="ml-2">Updates are available.
                                                </span>
                                            </div>
                                            <asp:Button runat="server" ID="btnUpdateVitalSign" CssClass="btn btn-sm btn-secondary" OnClick="btnUpdateVitalSign_Click" Text="Update" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mr-2 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                        <div class="form-group w-4 d-inline-block">
                                            <input runat="server" id="txt_vs_temperature" class="form-control text-right" disabled="disabled"/>
                                            <span class="append">°C</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mr-2 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                        <div class="form-group w-5 d-inline-block">
                                            <input runat="server" id="txt_vs_heart_rate" class="form-control text-right"  disabled="disabled"/>
                                            <span class="append">/phút (m)</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mr-2 mb-1">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                        <div class="form-group w-4 d-inline-block">
                                            <input runat="server" id="txt_vs_weight" class="form-control text-right" disabled="disabled" />
                                            <span class="append">Kg</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mr-2 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                        <div class="form-group w-5 d-inline-block">
                                            <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" disabled="disabled" />
                                            <span class="append">/phút (m)</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mr-2 mb-1">Chiều cao/ <span class="text-primary">Height:</span></label>
                                        <div class="form-group w-4 d-inline-block">
                                            <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" disabled="disabled" />
                                            <span class="append">cm</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mr-2 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                        <div class="form-group w-5 d-inline-block">
                                            <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" disabled="disabled" />
                                            <span class="append">mmHg</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2">
                                        <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                        <div class="form-group w-5 d-inline-block">
                                            <input runat="server" id="txt_vs_bmi" class="form-control text-right" disabled="disabled" />
                                            <span class="append">(Kg/m <sup>2</sup>)</span>
                                        </div>
                                        <div class="mt-1">
                                            (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
applicable for children and pregnant</span>)
                                        </div>
                                    </div>

                                    <div class="col-sm-6 mb-2">
                                        <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                        <div class="form-group w-4 d-inline-block">
                                            <input runat="server" id="txt_vs_spO2" class="form-control text-right" disabled="disabled" />
                                            <span class="append">%</span>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-2">
                                        <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                        <div class="form-group w-4 d-inline-block">
                                            <input runat="server" id="txt_vs_pulse" class="form-control text-right" disabled="disabled" />
                                            <span class="append">cm</span>
                                        </div>
                                    </div>
                                </fieldset>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <webUI:TextField runat="server" ID="txt_physical_examination" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1 h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                            <webUI:TextField runat="server" id="txt_laboratory_indications_results" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2 h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_initial_diagnosis" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_differential_diagnosis" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_associated_conditions" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input disabled-for="current_medication_field" type="radio" runat="server" id="rad_treatment_code_opd" name="rad_treatment_code" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_treatment_code_opd">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" runat="server" id="rad_treatment_code_ipd" name="rad_treatment_code" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_treatment_code_ipd">Nhập viện/ <span class="text-primary">Admission</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-1">
                                        <div class="custom-control custom-radio">
                                            <input disabled-for="transfer_field" type="radio" runat="server" id="rad_treatment_code_trf" name="rad_treatment_code" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_treatment_code_trf">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row transfer_field">
                                    <div class="col-md-12 mb-2">
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_transfer" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row current_medication_field">
                                    <div class="col-md-12 mb-2">
                                        <label class="control-label mb-1"><span class="text-primary">5. Current medications:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_medicine" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_spec_opinion_requested_false" runat="server" name="rad_spec_opinion_requested" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_spec_opinion_requested_false">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8 mb-2">
                                        <div class="custom-control custom-radio mb-1">
                                            <input type="radio" id="rad_spec_opinion_requested_true" runat="server" disabled-for="spec_opinion_requested_note_field" name="rad_spec_opinion_requested" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_spec_opinion_requested_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                        </div>
                                        <div class="form-group spec_opinion_requested_note_field">
                                            <webUI:TextField runat="server" id="txt_spec_opinion_requested_note" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                        <div class="form-group">
                                            <webUI:TextField runat="server" id="txt_specific_education_required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                    </div>
                                    <div class="col-md-8 mb-1">
                                        <div style="width: 200px" class="d-inline-block  align-top">
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input disabled-for="date_next_appointment_field" type="radio" id="rad_next_appointment_true" runat="server" name="rad_next_appointment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_next_appointment_true"><span class="text-primary">Calendar</span></label>
                                            </div>
                                            <div class="form-group date_next_appointment_field mt-1 d-inline-block">
                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_date_next_appointment" Width="200px" />
                                            </div>
                                        </div>
                                        <div class="d-inline-block align-top">
                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input disabled-for="text_next_appointment_field" type="radio" id="rad_next_appointment_false" runat="server" name="rad_next_appointment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_next_appointment_false"><span class="text-primary">Text</span></label>
                                            </div>
                                            <div class="form-group text_next_appointment_field w-n">
                                                <webUI:TextField runat="server" id="txt_next_appointment" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <fieldset class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-actions">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" OnClientClick="checkValidData()" class="btn btn-primary" runat="server" Text="Complete" />
                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                            <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                            <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
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
        </form>
    </div>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>

    <script>
        function checkValidData() {

            alert("check data");

        }
    </script>
</body>
</html>


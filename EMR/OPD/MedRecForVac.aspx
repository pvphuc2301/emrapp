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


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <webUI:PrintWindow runat="server" ID="PrintWindow">
        <PrintHeader>
            <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
            <div style="flex-grow: 1; text-align: center;">
                <div style="color: #007297; font-size: 26.6667px;">GIẤY CHỨNG NHẬN ĐIỀU TRỊ</div>
                <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL CERTIFICATE</div>
            </div>
            <div style="width: 200px; text-align: center">
                <div>MAI MAI MÃI1</div>
                <div>05-10-1960 | Nữ</div>
                <webUI:Barcode runat="server" ID="Barcode" Text="900000488" Width="200" Height="40" />
                <div>900000488</div>
            </div>
        </PrintHeader>
        <PrintContent>
        </PrintContent>
    </webUI:PrintWindow>

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
                                                    <input type="radio" id="rad_allergy1" runat="server" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy1">Không/<span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                    <input disabled-for="required_code_field" type="radio" id="rad_allergy2" runat="server" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
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
                                                    <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
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
                                                            CssClass="tb-responsive"
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
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
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
                                                    <input type="radio" id="rad_treatment_code_OPD" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_OPD">
                                                        Ngoại trú/ <span class="text-primary">Ambulatory care</span>
                                                    </label>
                                                </div>
                                                <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                    <input type="radio" id="rad_treatment_code_IPD" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_IPD">
                                                        Nhập viện/ <span class="text-primary">Admission</span>
                                                    </label>
                                                </div>
                                                <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                    <input type="radio" id="rad_treatment_code_TRF" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_TRF">
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
                                                    <input type="radio" id="rad_spec_opinion_req1" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req1">Không/<span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                    <input disabled-for="spec_opinion_req_text_field" type="radio" id="rad_spec_opinion_req2" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
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

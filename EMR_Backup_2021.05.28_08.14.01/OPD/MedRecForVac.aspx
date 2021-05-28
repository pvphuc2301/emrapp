<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedRecForVac.aspx.cs" Inherits="EMR.OPD.MedRecForVac" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <aih:AmendReason runat="server" ID="txt_amendReason" />
                    <uc1:PatientInfo runat="server" ID="PatientInfo1" />
                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-lg-12">
                            <div class="card mt-2">
                                <div class="card-header">
                                    <h4 class="text-primary">MEDICAL RECORD FOR VACCINATION
                                        <div>( Áp dụng cho các đối tượng ≥1 tháng tuổi/ For person ≥ 1 month old) </div>
                                    </h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">I. Lí do nhập viện/ <span class="text-primary">Chief complaint:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_chief_complaint" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_cur_med_history" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_cur_medication" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_personal" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_family" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_allergy1" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="allergy_field" type="radio" runat="server" id="rad_allergy2" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>
                                                <div class="form-group allergy_field">
                                                    <aih:TextField runat="server" ID="txt_allergy_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <div class="form-group w-4">
                                                    <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
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
                                                        <input runat="server" id="txt_vs_BMI" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
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
                                                    <input runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                    <span class="append">%</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">1. Sốc, phản ứng nặng sau lần tiêm chủng trước/ <span class="text-primary">Shock, severe reaction after previous vaccination:</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_1" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">2. Đang mắc bệnh cấp tính hoặc bệnh mạn tính tiến triển/ <span class="text-primary">Are suffering from an acute or progressive chronic disease:</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_2" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">3. Đang hoặc mới kết thúc đợt điều trị corticoid liều cao (prednison >2mg/kg/ngày), hóa trị, xạ trị, dùng gammaglobulin/ <span class="text-primary">At or just after a high-dose corticosteroid treatment (prednison> 2mg / kg / day), chemotherapy, radiation and gammaglobulin:</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_3" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">4. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 38°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ Fever/ <span class="text-primary">Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_4" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">5. Nghe tim bất thường/ <span class="text-primary">Hearing abnormalities:</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_5" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">6. Nhịp thở, nghe phổi bất thường/ <span class="text-primary">Abnormal breathing, pulmonary listening:</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_6" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">7. Tri giác bất thường (li bì hoặc kích thích)/ <span class="text-primary">Abnormal perception (li or stimulation):</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_7" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">8. Các chống chỉ định khác, nếu có ghi rõ<span class="text-primary">Other contraindications, if yes specified:</span></label>
                                                <aih:TextField runat="server" ID="txt_scr_before_vacc_8" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Loại vắc xin tiêm chủng lần này/ <span class="text-primary">Appointed Vaccine:</span></label>

                                                <asp:UpdatePanel ID="updatePanel_appointedVaccine" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView
                                                            ShowHeaderWhenEmpty="true"
                                                            ID="grid_appointedVaccine"
                                                            runat="server"
                                                            CssClass="tb-responsive"
                                                            AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField Value='<%#Eval("drug_name") %>' DataKey="drug_name" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField Value='<%#Eval("strength") %>' DataKey="strength" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField Value='<%#Eval("router") %>' DataKey="router" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField Value='<%#Eval("reason") %>' DataKey="reason" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />

                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_appointedVaccine" runat="server" AssociatedUpdatePanelID="updatePanel_appointedVaccine">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_appointedVaccine_add" runat="server" CssClass="btn btn-sm btn-outline-primary" OnClick="btn_grid_appointedVaccine_add_Click" Text="Add row" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_appointedVaccine_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                <aih:TextField runat="server" ID="txt_additional_investigations" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                <aih:TextField runat="server" ID="txt_initial_diagnosis" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                                <aih:TextField runat="server" ID="txt_differential_diagnosis" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <aih:TextField runat="server" ID="txt_associated_conditions" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                            </div>

                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_treatment_code_opd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_opd">
                                                        Ngoại trú/ <span class="text-primary">Ambulatory care</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_treatment_code_ipd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_ipd">
                                                        Nhập viện/ <span class="text-primary">Admission</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_treatment_code_trf" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_trf">
                                                        Chuyển viện/ <span class="text-primary">Transfer</span>
                                                    </label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare3" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                            </div>

                                            <div class="col-md-2 col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_spec_opinion_req1" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req1">
                                                        Không/ <span class="text-primary">No</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" disabled-for="spec_opinion_req_text_field" id="rad_spec_opinion_req2" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req2">
                                                        Có, ghi rõ/ <span class="text-primary">Yes, specify</span>
                                                    </label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_spec_opinion_req" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                    </a>
                                                </div>
                                                <div class="form-group spec_opinion_req_text_field">
                                                    <aih:TextField runat="server" id="txt_spec_opinion_req_text" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_pecific_edu_req" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                <aih:TextField runat="server" ID="txt_next_appointment" />
                                            </div>
                                        </div>

                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" class="btn btn-primary" runat="server" Text="Complete" />
                                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" />
                                            <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                            <asp:Button ID="btnAmend" class="btn btn-secondary" runat="server" Text="Amend" />
                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                            <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                            <div runat="server" id="messagePlaceHolder"></div>
                                        </div>

                                        <div id="myModal" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Delete document</h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p runat="server">Please provide reason for deletion</p>
                                                        <div class="form-group mb-2">
                                                            <aih:TextField runat="server" ID="TextField17" />
                                                        </div>
                                                        <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <asp:Button runat="server" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    <%--<asp:PostBackTrigger ControlID="btnSave" />                     <asp:PostBackTrigger ControlID="btnComplete" />--%>
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
